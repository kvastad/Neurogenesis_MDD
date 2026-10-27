function [y, ynum, yden]=cAtmosZone(cfun,par,t,bc,k,d,zone,varargin)
% CATMOSZONE wrapper function for individualised atmospheric c14 curves
%
%   See also: C2POP_ONSET
%
%   Example:
%
% parameters
% renewal_rate= 0.274459241381780;
% cells_lost50=renewal_rate*0.5;
% new_renewal_rate50=(renewal_rate-cells_lost50)/(1-cells_lost50);
% 
% renewaltoroot50=new_renewal_rate50/renewal_rate;
% diseaseduration=365;
% 
% root50 = nthroot(renewaltoroot50,diseaseduration);
% 
% deathfactor50=((root50-1)*-1)*365;
% renewal_rate= 0.274459241381780;
% deathrate_before=0.0954313046206245;
% deathrate_after=deathfactor50;
% birthrate_before=0.0954313046206245;
% birthrate_after=0;
% 
% onset=age-1;
% death=0.50;
% 
% 
% % load the bombcurves in a cell array bc2
% load bcSchauinsland_2016_convertF14C.mat
% bc2{1} = bc;
% load bc_NHzone2_F.mat
% bc2{2} = bc;
% 
% % load test data
% load abuse_publication_july2021_global_ETOH_NeuN+_wo4topinfluencers_F14C.mat
% 
% zone = ones(size(age));
% 
% % compute test c14 values, with bc Schauinsland
% zone = ones(size(age));
% test_y_1 = cAtmosZone(@c2pop_onset,[renewal_rate*ones(size(age)), ...
%     onset, death*ones(size(age)), ...
%     deathrate_before*ones(size(age)), ...
%     deathrate_after*ones(size(age)), ...
%     birthrate_before*ones(size(age)), ...
%     birthrate_after*ones(size(age)), ...
%     onset],age,bc2,zeros(size(age)),dd,zone,@cDecreasingTurnoveremblas,1,4);
%      
% % compute test c14 values, with bc NH Zone 2
% zone = 2*ones(size(age));
% test_y_2 = cAtmosZone(@c2pop_onset,[renewal_rate*ones(size(age)), ...
%     onset, death*ones(size(age)), ...
%     deathrate_before*ones(size(age)), ...
%     deathrate_after*ones(size(age)), ...
%     birthrate_before*ones(size(age)), ...
%     birthrate_after*ones(size(age)), ...
%     onset],age,bc2,zeros(size(age)),dd,zone,@cDecreasingTurnoveremblas,1,4);
%      
% % compute test c14 values, with bc NH Zone 1 and 2 randomly
% zone = ones(size(age)) + (rand(size(age)) < 0.5);
% test_y_mixed = cAtmosZone(@c2pop_onset,[renewal_rate*ones(size(age)), ...
%     onset, death*ones(size(age)), ...
%     deathrate_before*ones(size(age)), ...
%     deathrate_after*ones(size(age)), ...
%     birthrate_before*ones(size(age)), ...
%     birthrate_after*ones(size(age)), ...
%     onset],age,bc2,zeros(size(age)),dd,zone,@cDecreasingTurnoveremblas,1,4);



nt=length(t);
y=zeros(nt,1);
ynum=zeros(nt,1);
yden=ones(nt,1);

[rows_par, cols_par] = size(par);
if rows_par == nt
  % nothing to do
elseif rows_par == 1
  par = repmat(par,nt,1);
else
  error('wrong number of rows in parameters: number of rows = %d, but should be either 1 or %d',rows_par,nt);
end

for i=1:nt
    bci = bc{zone(i)};
    [cy, cfun_ynum, cfun_yden]=cfun(par(i,:),t(i),bci,k(i,:),d(i),varargin{:}); 
    ynum(i) = cfun_ynum;
    yden(i) = cfun_yden;
    y(i) = cfun_ynum/cfun_yden;
end
