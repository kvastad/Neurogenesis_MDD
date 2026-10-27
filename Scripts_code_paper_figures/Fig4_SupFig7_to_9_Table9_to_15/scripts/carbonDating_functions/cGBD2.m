function [y,ynum,yden,tt,nb,nc]=cGBD2(par,t,bc,k_ploidy,d,gam,beta,cellLoss,np,ts,ltc)
% CGBD 14C level General Birth Death Process for use with c2pop
% [y,ynum,yden,tt,nb,nc]=cGBD2(par,t,bc,k_ploidy,d,bc,gam,beta,cellLoss,np,ts,ltc)
% 14C level of a cell pop
%   n(t,a) with death rate GAM(T,A,PAR) and birth rate BETA(T,PAR), when in a patient of age T,
%   using bombcurve data BC and adult differential DNA content K and date
%   of collection D.
%
%   INPUT:
%       PAR:    Vector of parameters for GAM and BETA
%               PAR must be of the form
%               [PGAM, PBETA], where PGAM is of length NPGAM, and
%               PBETA is of length NPBETA
%       T:      Age of the subject at collection
%       K:      differential ploidy (set to 0 if not relevant)
%               Can be an array if complex ploidisation scenarios are
%               considered. See cAdjustedForPloidy
%       D:      Date of sample collection. In case of death, this is the
%               date of death
%       BC:     Bomb curve
%       GAM:    death rate function g = GAM(t,a,par)
%       BETA:   birth rate function b = BETA(t,par)
%               OR
%               'volterra' for solving the Volterra problem for
%               fixed cell number
%       CELLLOSS: Can be 
%               i) a function c = cellLoss(a,p) that returns
%               the fraction of cells of age a dying. The number of
%               parameters length(p) must be supplied in NPCELLLOSS. 
%               ii) the string 'oldest' if only oldest cells die. 
%               One mandatory parameter, the fraction of cells dying. NPCELLLOSS = 1.
%               iii) a cell c = {'mixed', cellLoss}, where cellLoss is a 
%               handle to a function c = cellLoss(a,p). 
%               The number of parameters NPCELLLOSS = 1 + length(p). The
%               first parameter is the fraction loss of older cell, and the
%               remaining parameters apply to cellLoss. 
%               All fractions are relative to cell loss (0: no death, 1: all cells dying)
%               Set CELLLOSS to [] if not using.
%       NP      vector of length 3. NP = [NPGAM, NPBETA, NPCELLLOSS]
%               NPGAM:  number of parameters in GAM
%               NPBETA: number of parameters in BETA
%               NPCELLLOSS: number of parameters in CELLLOSS
%                 Set NPCELLLOSS = 0 if not using a cell loss function
%       TS:     (OPTIONAL) time at which the cellLoss is applied.
%               If not supplied TS take the default value +Inf.
%       LTC:    Discretization size (use > ~3*T). Default LTC = 101.
%
%   OUTPUT:
%       Y:      Predicted 14C level (in the same units as BC). It is in the
%               form Y=YNUM/DEN, with YNUM the total 14C content and YDEN the cell
%               number
%       YNUM:   Predicted total 14C level
%       YDEN:   Predicted cell number
%       TT:     Age discretization on interval [0, T]
%
%   Examples
%       1. CONSTANT TURNOVER/NO CELL LOSS EVENT
%          Find the 14C value associated with a tissue collected
%          in june 2014 (2014.5) from a subject aged 64.3 years, assuming
%          a constant turnover rate of 1.3% per year.
%
%          % first define the death and birth rates
%          g = @(t,a,p) p;
%          b = @(t,p) p;
%          % run cGBD
%          y = cGBD([0.013 0.013],64.3,0,2014.5,bc,g,b,[],[1,1])
%          % compare with the dedicated function cConstantTurnover
%          y = cConstantTurnover(0.013,64.3,bc,0,2014.5)
%
%       2. AGE-DEPENDENT CELL DEATH - VOLTERRA EQUATION/NO CELL LOSS EVENT
%          Find the 14C value associated with a tissue from the same donor
%          but with an decrease death rate and a constant cell number
%          g = @(t,a,p) p(1)*p(2)./(p(2)+a);
%          b = 'volterra';
%          y = cGBD([0.145 0.71],64.3,0,2014.5,bc,g,'volterra',[],[2,0])
%          % compare with the dedicated function cAgeDeathInverse
%          y = cAgeDeathInverse([0.145 0.71],64.3,bc,0,2014.5)
%
%       3. CONSTANT TURNOVER/AGE-DEPENDENT CELL LOSS EVENT
%          Find the 14C value associated with a tissue from the same donor
%          but with a stroke that kills cells accodring to function cellLoss
%          at age 49.
%          g = @(t,a,p) p;
%          b = @(t,p) p;
%          c = @(a,p) a./(10+a);
%          % run cGBD
%          y = cGBD([0.0013 0.0013],64.3,0,2014.5,bc,g,b,c,[1,1,0],49)
%          % compare if the stroke did not occur
%          y = cGBD([0.0013 0.0013],64.3,0,2014.5,bc,g,b,c,[1,1,0])
%
%       4. EVENT-DEPENDENT TURNOVER/AGE-DEPENDENT CELL LOSS EVENT
%          Find the 14C value associated with a tissue from the same donor
%          but with a stroke that kills cells accodring to function cellLoss
%          at age 49, and that there is not regeneration after stroke.
%          g = @(t,a,p) p;
%          b = @(t,p) p*(t<49);
%          c = @(a,p) a./(10+a);
%          % run cGBD
%          y = cGBD([0.0013 0.0013],64.3,0,2014.5,bc,g,b,c,[1,1,0],49)
%          % compare if the stroke did not occur
%          b = @(t,p) p;
%          y = cGBD([0.0013 0.0013],64.3,0,2014.5,bc,g,b,c,[1,1,0])
%
%       5. CONSTANT TURNOVER/PARAMETRIZED CELL LOSS EVENT FUNCTION 
%          Find the 14C value associated with a tissue from the same donor
%          but with a stroke that kills cells accoRDing to function cellLoss
%          at age 49.
%          g = @(t,a,pg) pg;
%          b = @(t,pb) pb;
%          c = @(a,pc) pc;
%          % run cGBD
%          y = cGBD([0.0013 0.0015 0.55],64.3,0,2014.5,bc,g,b,c,[1,1,1],49)
%          % compare if the stroke did not occur
%          y = cGBD([0.0013 0.0015 0.55],64.3,0,2014.5,bc,g,b,c,[1,1,1])
%
%       6. CONSTANT TURNOVER/LOSS OF OLDEST CELLS
%          Find the 14C value associated with a tissue from the same donor
%          but with a stroke at age 49 that kills the 55% oldest cells
%          g = @(t,a,pg) pg;
%          b = @(t,pb) pb;
%          c = 'oldest';
%          % run cGBD
%          y = cGBD([0.0013 0.0015 0.55],64.3,0,2014.5,bc,g,b,c,[1,1,1],49)
%          % compare if the stroke killed 55% of the cells independently of age
%          c = @(a,pc) pc;
%          y = cGBD([0.0013 0.0015 0.55],64.3,0,2014.5,bc,g,b,c,[1,1,1],49)
%
%       7. CONSTANT TURNOVER/MIXED CELL LOSS OF OLDEST AND ANY CELLS 
%          Find the 14C value associated with a tissue from the same donor
%          but with a stroke at age 49 that kills the 7% oldest cells
%          and kills 45% of all remaining cells
%          NOTE that cell loss is applied sequentially. The cell loss
%          function is applied on the surviving cell density
%          g = @(t,a,pg) pg;
%          b = @(t,pb) pb;
%          c = {'mixed', @(a,pc) pc};
%          % run cGBD
%          y = cGBD([0.0013 0.0015 0.07 0.45],64.3,0,2014.5,bc,g,b,c,[1,1,2],49)
%          % compare if the stroke killed 52% of the cells independently of age
%          y = cGBD([0.0013 0.0015 0.0 0.52],64.3,0,2014.5,bc,g,b,c,[1,1,2],49)
%
%   See also CCONSTANTTURNOVER, CCONSTANTBIRTHCONSTANTDEATH, CDECREASINGTURNOVER,
%   CAGEDEATHLINEAR, CCONSTANTBIRTHAGEDEATH,
%   CTIMEBIRTHCONSTANTDEATH, CTIMEBIRTHAGEDEATH, CADJUSTEDFORPLOIDY.
%
%
%   Thu Sep 14 17:58:34 CEST 2017
%
%   Copyright 2008-2017


if nargin < 11
    ltc = 101; % discretization size
end
tolg = 1e-8;

odeopt = odeset('RelTol',1e-6,'AbsTol',1e-6);

volterra = 0;
if ischar(beta)
    if strcmp('volterra',beta)
        volterra = 1;
        warning('turnover:BD:volterra','Birth rate: Volterra equation');
    end
end
cumfracloss = 0;
mixedloss = 0;
if ischar(cellLoss)
    if strcmp(cellLoss,'oldest')
        cumfracloss = 1;
    end
end
if iscell(cellLoss)
    if ischar(cellLoss{1})
        if strcmp(cellLoss{1},'mixed')
            mixedloss = 1;
        end
    end
    if isa(cellLoss{2},'function_handle')
        cellLossFun = cellLoss{2};
    end
end
if isa(cellLoss,'function_handle')
    cellLossFun = cellLoss;
end



disc = false;
if nargin > 9 
    if ts < t % there is a discontinuity
      disc = true;
    end
    if isempty(ts)
      ts = Inf;
    end
else
    ts = Inf; % make sure there is no discontinuity
end

nt=length(t);
y=zeros(nt,1);
ynum=zeros(nt,1);
yden=zeros(nt,1);

% consistency check
npgam = np(1);
npbeta = np(2);
if disc
    if length(np)<3
        error('carbonDating:cGBD:parameterNumber','Parameter numbers np does not have length 3.');
    end
    npcellLoss = np(3);
else
    npcellLoss = 0;
end
if length(par) ~= sum(np)
    error('carbonDating:cGBD:parameterNumber','Parameter numbers do not match: expected %d parameters, got %d.',...
        sum(np),length(par));
end
if npgam > 0
    pgam = abs(par(1:npgam));
else
    pgam = [];
end
if npbeta > 0
    pbeta = abs(par(npgam+1:npgam+npbeta));
else
    pbeta = [];
end
if npcellLoss > 0
    pcellLoss = abs(par(npgam+npbeta+1:sum(np)));
else
    pcellLoss = [];
end


for i=1:nt % loop over each sample
    
    discflag = false;
    tdeath = t(i);
    
    % set up time discretization
    dt = tdeath/(ltc-1);
    tt = 0:dt:tdeath; % time discretization for continuous renewal
    
    nc = zeros(ltc,ltc); % smooth part of n(t,a)
    
    
    % cell present at birth
    N0 = 1.0;
    y0 = N0;
    sol = ode45(@(a,y) - gam(tt(1)+a,a,pgam).*y, [tt(1), tt(ltc)], y0, odeopt);
    yout = deval(sol,tt);
    nb = yout;
    
    % MAIN LOOP
    for j=2:(ltc-1) % loop over time discretization
        % define the initial condition y(a=0) = beta(tt)
        if volterra == 1
            y0 = sum(nc(1:j-1,j-1)) - sum(nc(2:j,j)) + nb(j-1) - nb(j);
        else
            b = beta(tt(j),pbeta);
            g = gam(tt(j),dt/2,pgam);
            if g > tolg
                y0 = b*(1-exp(-g*dt))/g;
            else
                y0 = b*dt;
            end
        end
        
        % solve the initial value problem dy/da = -gamma(tt+a,a)*y
        sol = ode45(@(a,y) - gam(tt(j)+a,a,pgam).*y, [tt(1), tt(ltc-j+1)], y0, odeopt);
        tout = tt(1:(ltc-j+1));
        yout = deval(sol,tout);
        % update n
        nc = nc + diag(yout,j-1);
        
        % check if discontinuity in time is encountered
        if (tt(j) >= ts) && discflag == false && disc == true
            if cumfracloss == 1 % cell loss with oldest cells first
                removeOldest(pcellLoss);
            elseif mixedloss == 1 % cell loss mixture of oldest and age-dependent
                removeOldest(pcellLoss(1));
                s = cellLossFun(tt(1:j-1)',pcellLoss(2:npcellLoss));
                for k=j:ltc
                    nc(k-j+1:k-1,k) = (1-s).*nc(k-j+1:k-1,k);
                end
                nb(j:ltc) = ( 1-cellLossFun(tt(j),pcellLoss(2:npcellLoss)) )*nb(j:ltc);
            else % cell loss according to cell age
                s = cellLossFun(tt(1:j-1)',pcellLoss);
                for k=j:ltc
                    nc(k-j+1:k-1,k) = (1-s).*nc(k-j+1:k-1,k);
                end
                nb(j:ltc) = ( 1-cellLossFun(tt(j),pcellLoss) )*nb(j:ltc);
            end
            discflag = true;
        end
        
        
    end
    % END MAIN LOOP
    if volterra == 1
        y0 = sum(nc(1:ltc-1,ltc-1)) - sum(nc(1:ltc,ltc)) + nb(ltc-1) - nb(ltc);
    else
        b = beta(tt(ltc),pbeta);
        g = gam(tt(ltc),dt/2,pgam);
        if g > tolg
            y0 = b*(1-exp(-g*dt))/g;
        else
            y0 = b*dt;
        end
    end
    nc(1,ltc) = y0;
    
    yc = nc(:,ltc);
    yb = nb(ltc);
    
    % dt
    % nc
    % nb
    % sum(nc) + nb
    
    % yden is the total cell number
    yden(i) = yb + sum(yc);
    
    % compute ynum = int K*yc + K*yb
    ynum(i) = cAdjustedForPloidy(t(i),d(i),bc,k_ploidy(i,:)).*yb + sum(cAdjustedForPloidy(tt,d(i),bc,k_ploidy(i,:)).*yc');
    
    y(i) = ynum(i)/yden(i);
    
    if (yden(i) == 0)
        warning('carbonDating:cGBD:VanishingPopulation','Some of the cell numbers are zero');
    end
    
    if isnan(y(i))
        warning('carbonDating:cGBD:NotANumber','Some of the 14C values returned are NaNs');
    end
    
end

% ----------------------------------------------------
% NESTED FUNCTIONS
% ----------------------------------------------------
    
    function removeOldest(frac)
    % REMOVEOLDEST removes a fraction FRAC oldest cells
        
        if ( frac > 1 )
            warning('carbonDating:cGBD:parameterValue','The fraction of cell loss is larger than 1.0, using 1.0');
            frac = 1;
        end
        if ( frac < 0 )
            warning('carbonDating:cGBD:parameterValue','The fraction of cell loss is negative, using 0.0');
            frac = 0;
        end
        cumCellDensityAtT = cumsum([nc(1:j-1,j-1); nb(j)]);
        cellNumber = cumCellDensityAtT(j);
        idx = find(cumCellDensityAtT/cellNumber > (1-frac), 1, 'first');
        % kill all cells with age index > idx
        ss = zeros(j,1);
        if idx < j
            ss(idx+1:j) = 1;
            ss(idx) = (cumCellDensityAtT(idx)/cellNumber - ...
                (1-frac))/(nc(idx,j-1)/cellNumber);
        elseif idx == j
            ss(j) = frac/(nb(j)/cellNumber);
        end

        for kk=j:ltc
            nc(kk-j+1:kk-1,kk) = (1-ss(1:j-1)).*nc(kk-j+1:kk-1,kk);
        end
        nb(j:ltc) = (1 - ss(j))*nb(j:ltc);
    end

end


