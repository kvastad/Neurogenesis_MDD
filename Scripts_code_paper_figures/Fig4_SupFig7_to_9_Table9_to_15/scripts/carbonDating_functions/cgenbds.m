function [y,ynum,yden,dens] = cgenbds(par,cbdopt)
% CGENBDS 14C level 3-compartment Birth-Death age-structured model
%   [y,ynum,yden] = cgenbds(par,cbdopt)
%   14C level of a 3-compartment age-structured birth-death cell pop model
%   n(indiv_age,a) with death rate GAM(T,A,PAR) and birth rate BETA(T,PAR), when in a patient of age T,
%   using bombcurve data BC and adult differential DNA content K and date
%   of collection D.
%
%   Copyright 2008-2022


ltc                    = cbdopt.resolution; % 101; % discretization size
tolg                   = cbdopt.tolg; %  1e-8;
renewing_death_rate    = cbdopt.death;
renewing_birth_rate    = cbdopt.birth;
senescence_rate        = cbdopt.senescence;
senescent_death_rate   = cbdopt.sendeath;
nr_death_rate          = cbdopt.nrdeath;

indiv_age        = cbdopt.age;
dcollect         = cbdopt.doc;
k_ploidy         = cbdopt.k_ploidy;


odeopt = odeset('RelTol',1e-6,'AbsTol',1e-6);

volterra = 0;
volterra_on_renewing = 0;
if ischar(renewing_birth_rate)
    if strcmp('volterra',renewing_birth_rate)
        volterra = 1;
        % warning('turnover:BD:volterra','Birth rate: Volterra equation');
    end
    if strcmp('volterra_on_renewing',renewing_birth_rate)
        volterra_on_renewing = 1;
    end
end
oldest_first = 0;
mixed_cell_loss = 0;

nbr_samples=length(indiv_age);
y=zeros(nbr_samples,1);
ynum=zeros(nbr_samples,1);
yden=zeros(nbr_samples,1);

% check size of par 
[nbparrows, nbparcols] = size(par);
if nbparrows == nbr_samples
  % ok nothing to do
elseif nbparrows == 1
  par = repmat(par,nbr_samples,1);
else
  error('carbonDating:cGBD:parameterNumber','Number of rows in parameter array should be equal to 1 or the the number of samples (%d), but is %d', ...
            nbr_samples, nbparrows);
end

% check that the number 
nbr_model_par = cbdopt.nbpar.fraction_renewing + ...
                cbdopt.nbpar.death + ...
                cbdopt.nbpar.birth + ...
                cbdopt.nbpar.senescence + ...
                cbdopt.nbpar.sendeath + ...
                cbdopt.nbpar.nrdeath;
if nbparcols ~= nbr_model_par
  error('carbonDating:cGBD:parameterNumber','The model expects %d parameters, but received %d instead', ...
            nbr_model_par, nbparcols);
end

i = 0;
fraction_renewing_array = par(:,i+1:i+1);
i = i + 1;
pgam_array              = par(:,i+1:i+cbdopt.nbpar.death);
i = i + cbdopt.nbpar.death;
pbeta_array             = par(:,i+1:i+cbdopt.nbpar.birth);
i = i + cbdopt.nbpar.birth;
psenescence_array       = par(:,i+1:i+cbdopt.nbpar.senescence);
i = i + cbdopt.nbpar.senescence;
psendeath_array         = par(:,i+1:i+cbdopt.nbpar.sendeath);
i = i + cbdopt.nbpar.sendeath;
pnrdeath_array          = par(:,i+1:i+cbdopt.nbpar.nrdeath);
i = i + cbdopt.nbpar.nrdeath;

% SAMPLES LOOP
for idx=1:nbr_samples % loop over each sample

    % set sample parameters
    fraction_renewing   = abs(fraction_renewing_array(idx)); 
    pgam                = abs(pgam_array(idx,:)); 
    pbeta               = abs(pbeta_array(idx,:)); 
    psenescence         = abs(psenescence_array(idx,:)); 
    psendeath           = abs(psendeath_array(idx,:)); 
    pnrdeath            = abs(pnrdeath_array(idx,:)); 

    
    discontinuity_flag = false;
    age_of_death = indiv_age(idx);
    
    % set up time discretization
    dt = age_of_death/(ltc-1);
    
    % time discretization for continuous renewal: individual's age
    ages = 0:dt:age_of_death; 
    
    % smooth part of n(indiv_age,cell_age)
    %   rows:     cell age
    %   columns:  individual's age
    post_natal_density_mat = zeros(ltc,ltc); 
    senescent_density_mat  = zeros(ltc,ltc);
    dead_renewing_mat  = zeros(ltc,ltc);
    
    % renewing, senescent and non-renewing cells present at birth
    % y0 initial condition for characteristics equations 
    y0 = [  1;  % renewing cells
            0;  % senescent cells
            1;  % non-renewing cells
            0]; % dead renewing cells
    sol = ode45(@(a,y) death_senescence_nonrenewing(ages(1),a,y), [ages(1), ages(ltc)], y0, odeopt);
    yout = deval(sol,ages);
    renewing_density_vec     = yout(1,:);
    senescent_density_vec    = yout(2,:);
    nonrenewing_density_vec  = yout(3,:);
    dead_renewing_vec        = yout(4,:); % use only if volterra_on_renewing

    % INDVIDUAL'S AGE LOOP
    for j=2:(ltc-1) % loop over time discretization
        % define the initial condition y(a=0) = renewing_birth_rate(ages)
        if volterra == 1
            % just replace all cells that died in the last time step
            y0 = sum(post_natal_density_mat(1:j-1,j-1)) - sum(post_natal_density_mat(2:j,j)) ... %   delta for renewing post-natal cells
                   + renewing_density_vec(j-1) - renewing_density_vec(j) ...                     %   delta for renewing initial cells 
             + ( sum(senescent_density_mat(1:j-1,j-1)) - sum(senescent_density_mat(2:j,j)) ...   %   delta for senescence post-natal cells
                   + senescent_density_vec(j-1) - senescent_density_vec(j) );                    %   delta for senescence initial cells 
        elseif volterra_on_renewing == 1
            % replace only renewing cells that died in the last time step, but not senescent cells that died
            y0 = - sum(dead_renewing_mat(1:j-1,j-1)) + sum(dead_renewing_mat(2:j,j)) ... %   delta for dead renewing post-natal cells
                   - dead_renewing_vec(j-1) + dead_renewing_vec(j);                      %   delta for dead renewing initial cells 
        else
            % if the initial death rate is large,
            % very few cells will actually survive 
            % an interval dt. Then compute the 
            % total number of cells produced and surviving
            % Ntot = int_0^dt n(t,a) da
            % assume slow time-varying functions b(_t_) and
            % g(_t_,a)
            b = renewing_birth_rate(ages(j),pbeta);
            g = renewing_death_rate(ages(j),dt/2,pgam) + ...
                              senescence_rate(ages(j),dt/2,psenescence);
            if g > tolg
                y0 = b*(1-exp(-g*dt))/g;
            else
                y0 = b*dt;
            end
        end
        
        % solve the initial value problem dy/da = -gamma(ages+a,a)*y
        sol = ode45(@(a,y) death_senescence(ages(j),a,y), [ages(1), ages(ltc-j+1)], [y0; 0; 0], odeopt);
        tout = ages(1:(ltc-j+1));
        yout = deval(sol,tout);
        % update n
        post_natal_density_mat = post_natal_density_mat + diag(yout(1,:),j-1);
        senescent_density_mat  = senescent_density_mat  + diag(yout(2,:),j-1);
        dead_renewing_mat      = dead_renewing_mat  + diag(yout(3,:),j-1);
        
    end
    % END INDVIDUAL'S AGE LOOP

    if volterra == 1
        y0 = sum(post_natal_density_mat(1:ltc-1,ltc-1)) - sum(post_natal_density_mat(2:ltc,ltc)) ... %   delta for renewing post-natal cells
               + renewing_density_vec(ltc-1) - renewing_density_vec(ltc) ...                         %   delta for renewing initial cells 
             + ( sum(senescent_density_mat(1:ltc-1,ltc-1)) - sum(senescent_density_mat(2:ltc,ltc)) ...   %   delta for senescence post-natal cells
               + senescent_density_vec(ltc-1) - senescent_density_vec(ltc) );                        %   delta for senescence initial cells 
    elseif volterra_on_renewing == 1
        % replace only renewing cells that died in the last time step, but not senescent cells that died
        y0 = - sum(dead_renewing_mat(1:j-1,j-1)) + sum(dead_renewing_mat(2:j,j)) ... %   delta for dead renewing post-natal cells
             - dead_renewing_vec(j-1) + dead_renewing_vec(j);                      %   delta for dead renewing initial cells 
    else
        b = renewing_birth_rate(ages(ltc),pbeta);
        g = renewing_death_rate(ages(j),dt/2,pgam) + ...
          senescence_rate(ages(j),dt/2,psenescence);
        if g > tolg
            y0 = b*(1-exp(-g*dt))/g;
        else
            y0 = b*dt;
        end
    end
    post_natal_density_mat(1,ltc) = y0;
    senescent_density_mat(1,ltc)  =  0;

    % renormalize to renewing fractions
    post_natal_density_mat = fraction_renewing*post_natal_density_mat;
    senescent_density_mat  = fraction_renewing*senescent_density_mat;
    renewing_density_vec   = fraction_renewing*renewing_density_vec;
    senescent_density_vec  = fraction_renewing*senescent_density_vec;
    nonrenewing_density_vec= (1 - fraction_renewing)*nonrenewing_density_vec;

    if nbr_samples == 1
      dens.ages            = ages;
      dens.renewing_mat    = post_natal_density_mat;
      dens.senescent_mat   = senescent_density_mat;
      dens.renewing_vec    = renewing_density_vec;
      dens.senescent_vec   = senescent_density_vec;
      dens.nonrenewing_vec = nonrenewing_density_vec;
    else
      dens = nan;
    end

    yc  = post_natal_density_mat(:,ltc);
    ycs = senescent_density_mat(:,ltc);
    yb  = renewing_density_vec(ltc);
    ybs = senescent_density_vec(ltc);
    ybnr= nonrenewing_density_vec(ltc);
    
    % dt
    % post_natal_density_mat
    % renewing_density_vec
    % sum(post_natal_density_mat) + renewing_density_vec
    
    % yden is the total cell number 
    yden(idx) = yb + sum(yc) + ybs + sum(ycs) + ybnr;
    
    % compute ynum = int K*yc + K*yb
    if isfield(cbdopt,'clag')
      clag = cbdopt.clag;
    else
      clag = 0.0;
    end
    if iscell(cbdopt.bc)
      bc = cbdopt.bc{cbdopt.bc_zone(idx)};
    else
      bc = cbdopt.bc;
    end
    bc = bcDelay(clag, bc);

    natal_c14 = cAdjustedForPloidy(indiv_age(idx),dcollect(idx),bc,k_ploidy(idx,:));
    post_natal_c14 = cAdjustedForPloidy(ages,dcollect(idx),bc,k_ploidy(idx,:));

    ynum(idx) = natal_c14*yb + sum(post_natal_c14.*yc') + natal_c14*ybs + sum(post_natal_c14.*ycs') + natal_c14*ybnr;
    
    y(idx) = ynum(idx)/yden(idx); % carbon level of the renewing/senescent fraction

    if (yden(idx) == 0)
        warning('carbonDating:cGBD:VanishingPopulation','Some of the cell numbers are zero');
    end
    
    if isnan(y(idx))
        warning('carbonDating:cGBD:NotANumber','Some of the 14C values returned are NaNs');
    end
    
end

% ----------------------------------------------------
% NESTED FUNCTIONS
% ----------------------------------------------------
    
    function dydt = death_senescence_nonrenewing(t,a,y)
    % death_senescence is the rhs of the renewing/senescence/nonrenewing natal compartments
    
      dydt = [ - (renewing_death_rate(t+a,a,pgam) + senescence_rate(t+a,a,psenescence))*y(1);
               - senescent_death_rate(t+a,a,psendeath)*y(2) + senescence_rate(t+a,a,psenescence)*y(1);
               - nr_death_rate(t+a,pnrdeath)*y(3);
                 (renewing_death_rate(t+a,a,pgam))*y(1)];                               
    end

    function dydt = death_senescence(t,a,y)
    % death_senescence is the rhs of the renewing/senescence compartment
    
      dydt = [ - (renewing_death_rate(t+a,a,pgam) + senescence_rate(t+a,a,psenescence))*y(1);
               - senescent_death_rate(t+a,a,psendeath)*y(2) + senescence_rate(t+a,a,psenescence)*y(1);
                 (renewing_death_rate(t+a,a,pgam))*y(1)];
    end

end


