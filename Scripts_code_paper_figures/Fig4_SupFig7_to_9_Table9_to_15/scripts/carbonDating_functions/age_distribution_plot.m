function [age_density_sqmat,ntot,avg_age] = age_distribution_plot(par, cbdopt)
%% AGE-DISTRIBUTION PLOT HEALTHY SCENARIO E2
%
% INPUT:
%     pars: parameters for the age-dependent turnover scenario 
%     cbdopt: options set from CBDSET
%
% OUTPUT:
%     age_density_sqmat:  Square matrix of size cbdopt.resolution x cbdopt.resolution
%                         The table of renewing cell density relative to age. 
%                         Each column is a time point (in years) 
%                         Each row is a cell age (in years)
%                        
%     ntot: structure with total cell density in each population subset
%           ntot.renewing: renewing (non-senescent) cells
%           ntot.senescent: senescent cells
%           ntot.rensen: renewing and senescent cells 
%           ntot.nonrenewing: non-renewing cells   
%           ntot.tt: time points 
%
%     avg_age: structure with average cell age in each population subset
%              and the whole population
%            
%
% EXAMPLE:
%     cbdopts = cbdset(); % initialize the options;
%     
%     cbdopts             % list all default values
%     
%     s.ca = [15.0, 23.65;
%             55.0, 14.08];
%     s.dg = [15.0, 18.87;
%             55.0, 15.29];
%
%     cbdopts.nbpar.death = 1;
%     cbdopts.nbpar.birth = 0;
%     cbdopts.nbpar.senescence = 1;
%     cbdopts.nbpar.sendeath = 1;
%     cbdopts.nbpar.nrdeath  = 1;
%     cbdopts.death = @(t,a,pg)pg;
%     cbdopts.senescence = @(t,a,ps)ps;
%     cbdopts.sendeath   = @(t,a,sd) sd;
%     cbdopts.birth = 'volterra_on_renewing';
%     cbdopts.nrdeath    = @(~,pnr) pnr;
%     cbdopts.age = 70;
%     cbdopts.doc = 2010; 
%     cbdopts.k_ploidy = zeros(size(cbdopts.age));
%     cbdopts.resolution = 25;
%     cbdopts.stereology = s;
%
%     age_distribution_plot([0.80, 0.1, 0.01, 0.05, 0.03], cbdopts);     
%
%     


if ( length(cbdopt.age) > 1 )
  error('Length of age must be 1, got length  %d instead',length(cbdopt.age));
end

if ( length(cbdopt.bc) == 0 ) % load bd and issue warning
    load('atmospheric_radiocarbon/Schauinsland_2016.mat','bc');
    warning('No atmospheric 14C curve supplied, using default Schauinsland_2016 data');
    cbdopt.bc = bc;
end
[y,ynum,yden,dens] = cgenbds(par,cbdopt);

age_max = cbdopt.age;
tt = dens.ages;
len_tt = length(tt);

% Create bins, starting from max(age) and moving back to zero. 
% Aim at 10 year bins, last bin is the remainder of decade.
nominal_bins = [0, rem(age_max,10)+0:10:age_max];    

% Find indices of times of left edges of each bins
% to_plot = index of times of left edges of each bins
to_plot = zeros(size(nominal_bins));                 
for i = 1:length(nominal_bins)
    if ~isempty(find(tt >= nominal_bins(i),1))
      to_plot(i) = find(tt >= nominal_bins(i),1);
    end
end
to_plot = to_plot(to_plot>0);             % remove empty times

%% color scale
nbr_cols = length(nominal_bins);        % nbr colors must match number of bins
col = 0.98 - 0.98*gray(nbr_cols).^1;    % renewing cells: grayscale from black to gray 98
col_nr(1,:) = [0.6, 0.2, 0.2];          % non-renewing cells: single color
wt = repmat(linspace(1,0,nbr_cols)',1,3);     
col_sen = repmat([0.3, 1.0, 0.3], nbr_cols,1); 
col_sen = wt.*col_sen;                  % senescent cells: monochrome color scale

% figure(1); clf;
%  dens.ages            = ages;
%  dens.renewing_mat    = post_natal_density_mat;
%  dens.senescent_mat   = senescent_density_mat;
%  dens.renewing_vec    = renewing_density_vec;
%  dens.senescent_vec   = senescent_density_vec;
%  dens.nonrenewing_vec = nonrenewing_density_vec;
n_renewing  = dens.renewing_mat + diag(dens.renewing_vec);  % cell density 
n_senescent = dens.senescent_mat + diag(dens.senescent_vec);  % cell density 
n_nr = diag(dens.nonrenewing_vec);  % cell density 
                    %      time --->
                    % ages   1.0000    0.0010    0.0010    0.0010    0.0010  
                    %  |          0    0.9934    0.0009    0.0009    0.0009
                    %  |          0         0    0.9868    0.0009    0.0009
                    %  V          0         0         0    0.9802    0.0009
                    %             0         0         0         0    0.9737
                    
% total density in each class
ntot.renewing  = sum(n_renewing);
ntot.senescent = sum(n_senescent);
ntot.nonrenewing = dens.nonrenewing_vec;
ntot.rensen    = ntot.renewing + ntot.senescent;
ntot.tt = tt;

% average cell age in each class
int_cell_age_renewing     = dens.ages*n_renewing;
int_cell_age_senescent    = dens.ages*n_senescent;
int_cell_age_nonrenewing  = tt.*ntot.nonrenewing;
avg_cell_age_renewing     = int_cell_age_renewing./(ntot.renewing);
avg_cell_age_senescent    = int_cell_age_senescent./(ntot.senescent);
avg_cell_age_nonrenewing  = tt;

int_cell_age = int_cell_age_renewing + int_cell_age_senescent + int_cell_age_nonrenewing;
avg_cell_age = int_cell_age./(ntot.renewing + ntot.senescent + ntot.nonrenewing);
avg_age.renewing = avg_cell_age_renewing;
avg_age.senescent = avg_cell_age_senescent;
avg_age.nonrenewing = avg_cell_age_nonrenewing;
avg_age.total = avg_cell_age;


% s.ca = [15.0, 23.65;
%         55.0, 14.08];
% s.dg = [15.0, 18.87;
%         55.0, 15.29];
if ( isstruct(cbdopt.stereology) )
    fprintf("%-30s","Nonrenewing (CA)");
    fprintf("\n");
    fprintf("%-30s","year:");
    fprintf("0.00   ");
    for i=1:length(cbdopt.stereology.ca)
        fprintf("%2.1f   ",cbdopt.stereology.ca(i,1));
    end
    fprintf("%2.1f\n",tt(end))
    fprintf("%-30s","CA (stereology):");
    fprintf("--     ");
    for i=1:length(cbdopt.stereology.ca)
        fprintf("%2.2f  ",cbdopt.stereology.ca(i,2));
    end
    fprintf("--\n");
    fprintf("%-30s","CA (ster/relative):");
    fprintf("--     ");
    for i=1:length(cbdopt.stereology.ca)
        fprintf("%2.2f   ",cbdopt.stereology.ca(i,2)/cbdopt.stereology.ca(1,2));
    end
    fprintf("--\n");
    fprintf("%-30s","Non-renewing:");
    fprintf("%2.2f   ",ntot.nonrenewing(1));
    fprintf("%2.2f   ",interp1(tt,ntot.nonrenewing,cbdopt.stereology.ca(:,1)));
    fprintf("%2.2f   \n",ntot.nonrenewing(end));
    fprintf("%-30s","Non-renewing (relative):");
    fprintf("%2.2f   ",ntot.nonrenewing(1)/ntot.nonrenewing(1));
    fprintf("%2.2f   ",interp1(tt,ntot.nonrenewing,cbdopt.stereology.ca(:,1))/ntot.nonrenewing(1));
    fprintf("%2.2f   \n\n",ntot.nonrenewing(end)/ntot.nonrenewing(1));
    
    fprintf("%-30s","Renewing/Senescent (DG)");
    fprintf("\n");
    fprintf("%-30s","year:");
    fprintf("0.00   ");
    for i=1:length(cbdopt.stereology.dg)
        fprintf("%2.1f   ",cbdopt.stereology.dg(i,1));
    end
    fprintf("%2.1f\n",tt(end))
    fprintf("%-30s","DG (stereology):");
    fprintf("--     ");
    for i=1:length(cbdopt.stereology.dg)
        fprintf("%2.2f  ",cbdopt.stereology.dg(i,2));
    end
    fprintf("--\n");
    fprintf("%-30s","DG (ster/relative):");
    fprintf("--     ");
    for i=1:length(cbdopt.stereology.dg)
        fprintf("%2.2f   ",cbdopt.stereology.dg(i,2)/cbdopt.stereology.dg(1,2));
    end
    fprintf("--\n");
    fprintf("%-30s","Renewing/Senescent:");
    fprintf("%2.2f   ",ntot.rensen(1));
    fprintf("%2.2f   ",interp1(tt,ntot.rensen,cbdopt.stereology.dg(:,1)));
    fprintf("%2.2f   \n",ntot.rensen(end));
    fprintf("%-30s","Renewing/Senescent (rel.):");
    fprintf("%2.2f   ",ntot.rensen(1)/ntot.rensen(1));
    fprintf("%2.2f   ",interp1(tt,ntot.rensen,cbdopt.stereology.dg(:,1))/ntot.rensen(1));
    fprintf("%2.2f   \n",ntot.rensen(end)/ntot.rensen(1));
else
    warning(['No stereology data provided. You can provide stereology data ''s'' by setting the option:' newline inputname(2) '.stereology = s']);
end

cum_n_renewing = flipud(cumsum(flipud(n_renewing))); % cumulative age-density
cum_n_senescent = flipud(cumsum(flipud(n_senescent))); % cumulative age-density
cum_n_nr = flipud(cumsum(flipud(n_nr))); % cumulative age-density
                                   %    time --->
                                   %      1.0000    0.9943    0.9887    0.9830    0.9775
                                   % dens      0    0.9934    0.9877    0.9821    0.9765
                                   %  >=       0         0    0.9868    0.9811    0.9756
                                   % age       0         0         0    0.9802    0.9746
                                   %           0         0         0         0    0.9737

hold on

age_density_sqmat = zeros(len_tt);        % age density plot - square matrix of size(len_tt)
i_col = 1;
baseline_nr = cum_n_nr(1,1:len_tt); 
baseline_senescent = cum_n_senescent(1,1:len_tt); 
for i=1:len_tt
    if any(i == to_plot) 
        area(tt, baseline_nr + baseline_senescent + [cum_n_renewing(1,1:len_tt-i), diag(cum_n_renewing,len_tt-i)'],'FaceC',col(i_col,:),'EdgeC','none') 
        i_col = i_col + 1;
    end
    if i<len_tt
        age_density_sqmat(i,:) = interp1(tt, [cum_n_renewing(1,1:len_tt-i), diag(cum_n_renewing,len_tt-i)'],tt);
    else
        age_density_sqmat(i,:) = interp1(tt, diag(cum_n_renewing,0)',tt);
    end
    
end
i_col = 1;
for i=1:len_tt
    if any(i == to_plot) 
        area(tt, baseline_nr + [cum_n_senescent(1,1:len_tt-i), diag(cum_n_senescent,len_tt-i)'],'FaceC',col_sen(i_col,:),'EdgeC','none') 
        i_col = i_col + 1;
    end
end
i_col = 1;
area(tt, baseline_nr,'FaceC',col_nr(i_col,:),'EdgeC','none') 


xlabel('age of individual (years)');
ylabel('tissue fraction in each age class');

