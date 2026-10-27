
%%
LMCMC1_weightsfrombc1_burnin=LMCMC1_weightsfrombc1(1001:end);
XMCMC1_weightsfrombc1_burnin=XMCMC1_weightsfrombc1(1001:end,:);
RMCMC1_weightsfrombc1_burnin=RMCMC1_weightsfrombc1(1001:end,:);

bestLMCMC1_weightsfrombc1=max(LMCMC1_weightsfrombc1_burnin) 
bestXMCMC1_weightsfrombc1=XMCMC1_weightsfrombc1_burnin(LMCMC1_weightsfrombc1_burnin>=max(LMCMC1_weightsfrombc1_burnin),:)

XMCMC1_weightsfrombc1_turnover=XMCMC1_weightsfrombc1(:,1)
LMCMC1_weightsfrombc1_prior=LMCMC1_weightsfrombc1.*(1./(0.2+XMCMC1_weightsfrombc1_turnover))

LMCMC1_weightsfrombc1_prior_burnin=LMCMC1_weightsfrombc1_prior(1001:end);
XMCMC1_weightsfrombc1_prior_burnin=XMCMC1_weightsfrombc1(1001:end,:);
RMCMC1_weightsfrombc1_prior_burnin=RMCMC1_weightsfrombc1(1001:end,:);

bestLMCMC1_prior_weightsfrombc1=max(LMCMC1_weightsfrombc1_prior_burnin) 
bestXMCMC1_prior_weightsfrombc1=XMCMC1_weightsfrombc1_prior_burnin(LMCMC1_weightsfrombc1_prior_burnin>=max(LMCMC1_weightsfrombc1_prior_burnin),:)


%%
LMCMC2_weightsfrombc1_burnin=LMCMC2_weightsfrombc1(1001:end);
XMCMC2_weightsfrombc1_burnin=XMCMC2_weightsfrombc1(1001:end,:);
RMCMC2_weightsfrombc1_burnin=RMCMC2_weightsfrombc1(1001:end,:);

bestLMCMC2_weightsfrombc1=max(LMCMC2_weightsfrombc1_burnin) 
bestXMCMC2_weightsfrombc1=XMCMC2_weightsfrombc1_burnin(LMCMC2_weightsfrombc1_burnin>=max(LMCMC2_weightsfrombc1_burnin),:)

XMCMC2_weightsfrombc1_turnover=XMCMC2_weightsfrombc1(:,1)
LMCMC2_weightsfrombc1_prior=LMCMC2_weightsfrombc1.*(1./(0.2+XMCMC2_weightsfrombc1_turnover))

LMCMC2_weightsfrombc1_prior_burnin=LMCMC2_weightsfrombc1_prior(1001:end);
XMCMC2_weightsfrombc1_prior_burnin=XMCMC2_weightsfrombc1(1001:end,:);
RMCMC2_weightsfrombc1_prior_burnin=RMCMC2_weightsfrombc1(1001:end,:);

bestLMCMC2_prior_weightsfrombc1=max(LMCMC2_weightsfrombc1_prior_burnin) 
bestXMCMC2_prior_weightsfrombc1=XMCMC2_weightsfrombc1_prior_burnin(LMCMC2_weightsfrombc1_prior_burnin>=max(LMCMC2_weightsfrombc1_prior_burnin),:)


%%
LMCMC3_weightsfrombc1_burnin=LMCMC3_weightsfrombc1(1001:end);
XMCMC3_weightsfrombc1_burnin=XMCMC3_weightsfrombc1(1001:end,:);
RMCMC3_weightsfrombc1_burnin=RMCMC3_weightsfrombc1(1001:end,:);

bestLMCMC3_weightsfrombc1=max(LMCMC3_weightsfrombc1_burnin) 
bestXMCMC3_weightsfrombc1=XMCMC3_weightsfrombc1_burnin(LMCMC3_weightsfrombc1_burnin>=max(LMCMC3_weightsfrombc1_burnin),:)

XMCMC3_weightsfrombc1_turnover=XMCMC3_weightsfrombc1(:,1)
LMCMC3_weightsfrombc1_prior=LMCMC3_weightsfrombc1.*(1./(0.2+XMCMC3_weightsfrombc1_turnover))

LMCMC3_weightsfrombc1_prior_burnin=LMCMC3_weightsfrombc1_prior(1001:end);
XMCMC3_weightsfrombc1_prior_burnin=XMCMC3_weightsfrombc1(1001:end,:);
RMCMC3_weightsfrombc1_prior_burnin=RMCMC3_weightsfrombc1(1001:end,:);

bestLMCMC3_prior_weightsfrombc1=max(LMCMC3_weightsfrombc1_prior_burnin) 
bestXMCMC3_prior_weightsfrombc1=XMCMC3_weightsfrombc1_prior_burnin(LMCMC3_weightsfrombc1_prior_burnin>=max(LMCMC3_weightsfrombc1_prior_burnin),:)


%%
LMCMC4_weightsfrombc1_burnin=LMCMC4_weightsfrombc1(1001:end);
XMCMC4_weightsfrombc1_burnin=XMCMC4_weightsfrombc1(1001:end,:);
RMCMC4_weightsfrombc1_burnin=RMCMC4_weightsfrombc1(1001:end,:);

bestLMCMC4_weightsfrombc1=max(LMCMC4_weightsfrombc1_burnin) 
bestXMCMC4_weightsfrombc1=XMCMC4_weightsfrombc1_burnin(LMCMC4_weightsfrombc1_burnin>=max(LMCMC4_weightsfrombc1_burnin),:)

XMCMC4_weightsfrombc1_turnover=XMCMC4_weightsfrombc1(:,1)
LMCMC4_weightsfrombc1_prior=LMCMC4_weightsfrombc1.*(1./(0.2+XMCMC4_weightsfrombc1_turnover))

LMCMC4_weightsfrombc1_prior_burnin=LMCMC4_weightsfrombc1_prior(1001:end);
XMCMC4_weightsfrombc1_prior_burnin=XMCMC4_weightsfrombc1(1001:end,:);
RMCMC4_weightsfrombc1_prior_burnin=RMCMC4_weightsfrombc1(1001:end,:);

bestLMCMC4_prior_weightsfrombc1=max(LMCMC4_weightsfrombc1_prior_burnin) 
bestXMCMC4_prior_weightsfrombc1=XMCMC4_weightsfrombc1_prior_burnin(LMCMC4_weightsfrombc1_prior_burnin>=max(LMCMC4_weightsfrombc1_prior_burnin),:)


%%
LMCMC11_weightsfrombc1_burnin=LMCMC11_weightsfrombc1(1001:end);
XMCMC11_weightsfrombc1_burnin=XMCMC11_weightsfrombc1(1001:end,:);
RMCMC11_weightsfrombc1_burnin=RMCMC11_weightsfrombc1(1001:end,:);

bestLMCMC11_weightsfrombc1=max(LMCMC11_weightsfrombc1_burnin) 
bestXMCMC11_weightsfrombc1=XMCMC11_weightsfrombc1_burnin(LMCMC11_weightsfrombc1_burnin>=max(LMCMC11_weightsfrombc1_burnin),:)

XMCMC11_weightsfrombc1_turnover=XMCMC11_weightsfrombc1(:,2)
LMCMC11_weightsfrombc1_prior=LMCMC11_weightsfrombc1.*(1./(0.2+XMCMC11_weightsfrombc1_turnover))

LMCMC11_weightsfrombc1_prior_burnin=LMCMC11_weightsfrombc1_prior(1001:end);
XMCMC11_weightsfrombc1_prior_burnin=XMCMC11_weightsfrombc1(1001:end,:);
RMCMC11_weightsfrombc1_prior_burnin=RMCMC11_weightsfrombc1(1001:end,:);

bestLMCMC11_prior_weightsfrombc1=max(LMCMC11_weightsfrombc1_prior_burnin) 
bestXMCMC11_prior_weightsfrombc1=XMCMC11_weightsfrombc1_prior_burnin(LMCMC11_weightsfrombc1_prior_burnin>=max(LMCMC11_weightsfrombc1_prior_burnin),:)


%%
LMCMC21_weightsfrombc1_burnin=LMCMC21_weightsfrombc1(1001:end);
XMCMC21_weightsfrombc1_burnin=XMCMC21_weightsfrombc1(1001:end,:);
RMCMC21_weightsfrombc1_burnin=RMCMC21_weightsfrombc1(1001:end,:);

bestLMCMC21_weightsfrombc1=max(LMCMC21_weightsfrombc1_burnin) 
bestXMCMC21_weightsfrombc1=XMCMC21_weightsfrombc1_burnin(LMCMC21_weightsfrombc1_burnin>=max(LMCMC21_weightsfrombc1_burnin),:)

XMCMC21_weightsfrombc1_turnover=XMCMC21_weightsfrombc1(:,2)
LMCMC21_weightsfrombc1_prior=LMCMC21_weightsfrombc1.*(1./(0.2+XMCMC21_weightsfrombc1_turnover))


LMCMC21_weightsfrombc1_prior_burnin=LMCMC21_weightsfrombc1_prior(1001:end);
XMCMC21_weightsfrombc1_prior_burnin=XMCMC21_weightsfrombc1(1001:end,:);
RMCMC21_weightsfrombc1_prior_burnin=RMCMC21_weightsfrombc1(1001:end,:);

bestLMCMC21_prior_weightsfrombc1=max(LMCMC21_weightsfrombc1_prior_burnin) 
bestXMCMC21_prior_weightsfrombc1=XMCMC21_weightsfrombc1_prior_burnin(LMCMC21_weightsfrombc1_prior_burnin>=max(LMCMC21_weightsfrombc1_prior_burnin),:)


%%
LMCMC31_weightsfrombc1_burnin=LMCMC31_weightsfrombc1(1001:end);
XMCMC31_weightsfrombc1_burnin=XMCMC31_weightsfrombc1(1001:end,:);
RMCMC31_weightsfrombc1_burnin=RMCMC31_weightsfrombc1(1001:end,:);

bestLMCMC31_weightsfrombc1=max(LMCMC31_weightsfrombc1_burnin) 
bestXMCMC31_weightsfrombc1=XMCMC31_weightsfrombc1_burnin(LMCMC31_weightsfrombc1_burnin>=max(LMCMC31_weightsfrombc1_burnin),:)

XMCMC31_weightsfrombc1_turnover=XMCMC31_weightsfrombc1(:,2)
LMCMC31_weightsfrombc1_prior=LMCMC31_weightsfrombc1.*(1./(0.2+XMCMC31_weightsfrombc1_turnover))

LMCMC31_weightsfrombc1_prior_burnin=LMCMC31_weightsfrombc1_prior(1001:end);
XMCMC31_weightsfrombc1_prior_burnin=XMCMC31_weightsfrombc1(1001:end,:);
RMCMC31_weightsfrombc1_prior_burnin=RMCMC31_weightsfrombc1(1001:end,:);

bestLMCMC31_prior_weightsfrombc1=max(LMCMC31_weightsfrombc1_prior_burnin) 
bestXMCMC31_prior_weightsfrombc1=XMCMC31_weightsfrombc1_prior_burnin(LMCMC31_weightsfrombc1_prior_burnin>=max(LMCMC31_weightsfrombc1_prior_burnin),:)

%%
LMCMC41_weightsfrombc1_burnin=LMCMC41_weightsfrombc1(1001:end);
XMCMC41_weightsfrombc1_burnin=XMCMC41_weightsfrombc1(1001:end,:);
RMCMC41_weightsfrombc1_burnin=RMCMC41_weightsfrombc1(1001:end,:);

bestLMCMC41_weightsfrombc1=max(LMCMC41_weightsfrombc1_burnin) 
bestXMCMC41_weightsfrombc1=XMCMC41_weightsfrombc1_burnin(LMCMC41_weightsfrombc1_burnin>=max(LMCMC41_weightsfrombc1_burnin),:)

XMCMC41_weightsfrombc1_turnover=XMCMC41_weightsfrombc1(:,2)
LMCMC41_weightsfrombc1_prior=LMCMC41_weightsfrombc1.*(1./(0.2+XMCMC41_weightsfrombc1_turnover))

LMCMC41_weightsfrombc1_prior_burnin=LMCMC41_weightsfrombc1_prior(1001:end);
XMCMC41_weightsfrombc1_prior_burnin=XMCMC41_weightsfrombc1(1001:end,:);
RMCMC41_weightsfrombc1_prior_burnin=RMCMC41_weightsfrombc1(1001:end,:);

bestLMCMC41_prior_weightsfrombc1=max(LMCMC41_weightsfrombc1_prior_burnin) 
bestXMCMC41_prior_weightsfrombc1=XMCMC41_weightsfrombc1_prior_burnin(LMCMC41_weightsfrombc1_prior_burnin>=max(LMCMC41_weightsfrombc1_prior_burnin),:)



%%
LMCMC_9_0_burnin=LMCMC_9_0(1001:end);
XMCMC_9_0_burnin=XMCMC_9_0(1001:end,:);
RMCMC_9_0_burnin=RMCMC_9_0(1001:end,:);

bestLMCMC_9_0=max(LMCMC_9_0_burnin) 
bestXMCMC_9_0=XMCMC_9_0_burnin(LMCMC_9_0_burnin>=max(LMCMC_9_0_burnin),:)

XMCMC_9_0_turnover=XMCMC_9_0(:,1)
LMCMC_9_0_prior=LMCMC_9_0.*(1./(0.2+XMCMC_9_0_turnover))

LMCMC_9_0_prior_burnin=LMCMC_9_0_prior(1001:end);
XMCMC_9_0_prior_burnin=XMCMC_9_0(1001:end,:);
RMCMC_9_0_prior_burnin=RMCMC_9_0(1001:end,:);

bestLMCMC_9_0_prior_weightsfrombc1=max(LMCMC_9_0_prior_burnin) 
bestXMCMC_9_0_prior_weightsfrombc1=XMCMC_9_0_prior_burnin(LMCMC_9_0_prior_burnin>=max(LMCMC_9_0_prior_burnin),:)


%%
LMCMC_9_1_burnin=LMCMC_9_1(1001:end);
XMCMC_9_1_burnin=XMCMC_9_1(1001:end,:);
RMCMC_9_1_burnin=RMCMC_9_1(1001:end,:);

bestLMCMC_9_1=max(LMCMC_9_1_burnin) 
bestXMCMC_9_1=XMCMC_9_1_burnin(LMCMC_9_1_burnin>=max(LMCMC_9_1_burnin),:)

XMCMC_9_1_turnover=XMCMC_9_1(:,1)
LMCMC_9_1_prior=LMCMC_9_1.*(1./(0.2+XMCMC_9_1_turnover))

LMCMC_9_1_prior_burnin=LMCMC_9_1_prior(1001:end);
XMCMC_9_1_prior_burnin=XMCMC_9_1(1001:end,:);
RMCMC_9_1_prior_burnin=RMCMC_9_1(1001:end,:);

bestLMCMC_9_1_prior_weightsfrombc1=max(LMCMC_9_1_prior_burnin) 
bestXMCMC_9_1_prior_weightsfrombc1=XMCMC_9_1_prior_burnin(LMCMC_9_1_prior_burnin>=max(LMCMC_9_1_prior_burnin),:)


%%
LMCMC_9_2_burnin=LMCMC_9_2(1001:end);
XMCMC_9_2_burnin=XMCMC_9_2(1001:end,:);
RMCMC_9_2_burnin=RMCMC_9_2(1001:end,:);

bestLMCMC_9_2=max(LMCMC_9_2_burnin) 
bestXMCMC_9_2=XMCMC_9_2_burnin(LMCMC_9_2_burnin>=max(LMCMC_9_2_burnin),:)

XMCMC_9_2_turnover=XMCMC_9_2(:,1)
LMCMC_9_2_prior=LMCMC_9_2.*(1./(0.2+XMCMC_9_2_turnover))

LMCMC_9_2_prior_burnin=LMCMC_9_2_prior(1001:end);
XMCMC_9_2_prior_burnin=XMCMC_9_2(1001:end,:);
RMCMC_9_2_prior_burnin=RMCMC_9_2(1001:end,:);

bestLMCMC_9_2_prior_weightsfrombc1=max(LMCMC_9_2_prior_burnin) 
bestXMCMC_9_2_prior_weightsfrombc1=XMCMC_9_2_prior_burnin(LMCMC_9_2_prior_burnin>=max(LMCMC_9_2_prior_burnin),:)


%%

% R1_weightfrombc1.1: 2pop with constant turnover 
F=@(x,age) cAtmosZone(@c2pop,[1,bestXMCMC1_weightsfrombc1(1,:)],age,bc2,zeros(size(age)),dd,zone,@cConstantTurnover,0); 
[X1_weightfrombc1,R1_weightfrombc1,J,COVB,MSE] = nlinfit(age,c14,F,[],options,'weights', weight_cont_mass_14change_frombc1); 

AICR1_weightfrombc1=AICc(nansum(R1_weightfrombc1.^2),3,n)

%%
% R2_weightfrombc1.1: 2pop with linear decrease
F=@(x,age) cAtmosZone(@c2pop,[1,bestXMCMC2_weightsfrombc1(1,:)],age,bc2,zeros(size(age)),dd,zone,@cDecreasingTurnover,0,1); 
[X2_weightfrombc1,R2_weightfrombc1,J,COVB,MSE] = nlinfit(age,c14,F,[],options,'weights', weight_cont_mass_14change_frombc1); 

AICR2_weightfrombc1=AICc(nansum(R2_weightfrombc1.^2),4,n)

%%

% R3_weightfrombc1.1: 2pop Inverse function (2) gamma(t)=g0*g1/(g1+t)
F=@(x,age) cAtmosZone(@c2pop,[1,bestXMCMC3_weightsfrombc1(1,:)],age,bc2,zeros(size(age)),dd,zone,@cDecreasingTurnover,0,2); 
[X3_weightfrombc1,R3_weightfrombc1,J,COVB,MSE] = nlinfit(age,c14,F,[],options,'weights', weight_cont_mass_14change_frombc1); 

AICR3_weightfrombc1=AICc(nansum(R3_weightfrombc1.^2),4,n)
%%


% R4_weightfrombc1.1: 2pop Step function (3) gamma(t)=g0*(t<g1) Stop after t. 
F=@(x,age) cAtmosZone(@c2pop,[1,bestXMCMC4_weightsfrombc1(1,:)],age,bc2,zeros(size(age)),dd,zone,@cDecreasingTurnover,0,3); 
[X4_weightfrombc1,R4_weightfrombc1,J,COVB,MSE] = nlinfit(age,c14,F,[],options,'weights', weight_cont_mass_14change_frombc1); 

AICR4_weightfrombc1=AICc(nansum(R4_weightfrombc1.^2),4,n)
%%
% R11_weightfrombc1.1: 2pop with constant turnover 
F=@(x,age) cAtmosZone(@c2pop,bestXMCMC11_weightsfrombc1(1,:),age,bc2,zeros(size(age)),dd,zone,@cConstantTurnover,0); 
[X11_weightfrombc1,R11_weightfrombc1,J,COVB,MSE] = nlinfit(age,c14,F,[],options,'weights', weight_cont_mass_14change_frombc1); 

AICR11_weightfrombc1=AICc(nansum(R11_weightfrombc1.^2),3,n)

%%
% R2_weightfrombc1.1: 2pop with linear decrease
F=@(x,age) cAtmosZone(@c2pop,bestXMCMC21_weightsfrombc1(1,:),age,bc2,zeros(size(age)),dd,zone,@cDecreasingTurnover,0,1); 
[X21_weightfrombc1,R21_weightfrombc1,J,COVB,MSE] = nlinfit(age,c14,F,[],options,'weights', weight_cont_mass_14change_frombc1); 

AICR21_weightfrombc1=AICc(nansum(R21_weightfrombc1.^2),4,n)

%%

% R3_weightfrombc1.1: 2pop Inverse function (2) gamma(t)=g0*g1/(g1+t)
F=@(x,age) cAtmosZone(@c2pop,bestXMCMC31_weightsfrombc1(1,:),age,bc2,zeros(size(age)),dd,zone,@cDecreasingTurnover,0,2); 
[X31_weightfrombc1,R31_weightfrombc1,J,COVB,MSE] = nlinfit(age,c14,F,[],options,'weights', weight_cont_mass_14change_frombc1); 

AICR31_weightfrombc1=AICc(nansum(R31_weightfrombc1.^2),4,n)
%%


% R4_weightfrombc1.1: 2pop Step function (3) gamma(t)=g0*(t<g1) Stop after t. 
F=@(x,age) cAtmosZone(@c2pop,bestXMCMC41_weightsfrombc1(1,:),age,bc2,zeros(size(age)),dd,zone,@cDecreasingTurnover,0,3); 
[X41_weightfrombc1,R41_weightfrombc1,J,COVB,MSE] = nlinfit(age,c14,F,[],options,'weights', weight_cont_mass_14change_frombc1); 

AICR41_weightfrombc1=AICc(nansum(R41_weightfrombc1.^2),4,n)


%%

s.ca = [10, 20;
        30, 20;
        70, 15];
s.dg = [10, 18;
        30, 18;
        70, 15];

       
cbdopts = cbdset(); % initialize the options

cbdopts.nbpar.fraction_renewing = 1;
cbdopts.nbpar.death = 1;
cbdopts.nbpar.birth = 0;
cbdopts.nbpar.senescence = 1;
cbdopts.nbpar.sendeath = 2;
cbdopts.nbpar.nrdeath  = 2;
cbdopts.death = @(t,a,pg) pg;
cbdopts.senescence = @(t,a,ps) ps;
cbdopts.sendeath   = @(t,a,pd) pd(1)*(t<=30)+pd(2)*(t>30);
cbdopts.nrdeath    = @(t,pd) pd(1)*(t<=30)+pd(2)*(t>30);
cbdopts.birth = 'volterra_on_renewing';
cbdopts.bc = bc2;
cbdopts.bc_zone = zone;
cbdopts.age = age;
cbdopts.doc = dd; 
cbdopts.k_ploidy = zeros(size(age));



%%

F = @(x, age) cgenbds([s2p2('IR',s), bestXMCMC_9_0(1,1), bestXMCMC_9_0(1,2), s2p2('SDR',s,1,[bestXMCMC_9_0(1,2), bestXMCMC_9_0(1,2)]), s2p2('NRDR',s)],cbdopts);
[X_9_0,R_9_0,J,COVB,MSE] = nlinfit(age,c14,F,[],options,'weights', weight_cont_mass_14change_frombc1); 

AICR_9_0=AICc(nansum(R_9_0.^2),3,n)



%%

s.ca = [10, 20;
        30, 20;
        70, 15];
s.dg = [10, 18;
        30, 18;
        70, 15];

       
cbdopts = cbdset(); % initialize the options

cbdopts.nbpar.fraction_renewing = 1;
cbdopts.nbpar.death = 1;
cbdopts.nbpar.birth = 0;
cbdopts.nbpar.senescence = 1;
cbdopts.nbpar.sendeath = 2;
cbdopts.nbpar.nrdeath  = 2;
cbdopts.death = @(t,a,pg) pg;
cbdopts.senescence = @(t,a,ps) ps*(t>a);
cbdopts.sendeath   = @(t,a,pd) pd(1)*(t<=30)+pd(2)*(t>30);
cbdopts.nrdeath    = @(t,pd) pd(1)*(t<=30)+pd(2)*(t>30);
cbdopts.birth = 'volterra_on_renewing';
cbdopts.bc = bc2;
cbdopts.bc_zone = zone;
cbdopts.age = age;
cbdopts.doc = dd; 
cbdopts.k_ploidy = zeros(size(age));


%%

F = @(x, age) cgenbds([s2p2('IR',s), bestXMCMC_9_1(1,1), bestXMCMC_9_1(1,2), s2p2('SDR',s,1,[bestXMCMC_9_1(1,2), bestXMCMC_9_1(1,2)]), s2p2('NRDR',s)],cbdopts);
[X_9_1,R_9_1,J,COVB,MSE] = nlinfit(age,c14,F,[],options,'weights', weight_cont_mass_14change_frombc1); 

AICR_9_1=AICc(nansum(R_9_1.^2),3,n)



%%

s.ca = [10, 20;
        30, 20;
        70, 15];
s.dg = [10, 18;
        30, 18;
        70, 15];

       
cbdopts = cbdset(); % initialize the options

cbdopts.nbpar.fraction_renewing = 1;
cbdopts.nbpar.death = 1;
cbdopts.nbpar.birth = 0;
cbdopts.nbpar.senescence = 1;
cbdopts.nbpar.sendeath = 2;
cbdopts.nbpar.nrdeath  = 2;
cbdopts.death = @(t,a,pg) pg;
cbdopts.senescence = @(t,a,ps) ps*(t<=a);
cbdopts.sendeath   = @(t,a,pd) pd(1)*(t<=30)+pd(2)*(t>30);
cbdopts.nrdeath    = @(t,pd) pd(1)*(t<=30)+pd(2)*(t>30);
cbdopts.birth = 'volterra_on_renewing';
cbdopts.bc = bc2;
cbdopts.bc_zone = zone;
cbdopts.age = age;
cbdopts.doc = dd; 
cbdopts.k_ploidy = zeros(size(age));

%%

F = @(x, age) cgenbds([s2p2('IR',s), bestXMCMC_9_2(1,1), bestXMCMC_9_2(1,2), s2p2('SDR',s,1,[bestXMCMC_9_2(1,2), bestXMCMC_9_2(1,2)]), s2p2('NRDR',s)],cbdopts);
[X_9_2,R_9_2,J,COVB,MSE] = nlinfit(age,c14,F,[],options,'weights', weight_cont_mass_14change_frombc1); 

AICR_9_2=AICc(nansum(R_9_2.^2),3,n)



%%

% R1_prior_weightfrombc1.1: 2pop with constant turnover 
F=@(x,age) cAtmosZone(@c2pop,[1,bestXMCMC1_prior_weightsfrombc1(1,:)],age,bc2,zeros(size(age)),dd,zone,@cConstantTurnover,0); 
[X1_prior_weightfrombc1,R1_prior_weightfrombc1,J,COVB,MSE] = nlinfit(age,c14,F,[],options,'weights', weight_cont_mass_14change_frombc1); 

AICR1_prior_weightfrombc1=AICc(nansum(R1_prior_weightfrombc1.^2),3,n)

%%
% R2_prior_weightfrombc1.1: 2pop with linear decrease
F=@(x,age) cAtmosZone(@c2pop,[1,bestXMCMC2_prior_weightsfrombc1(1,:)],age,bc2,zeros(size(age)),dd,zone,@cDecreasingTurnover,0,1); 
[X2_prior_weightfrombc1,R2_prior_weightfrombc1,J,COVB,MSE] = nlinfit(age,c14,F,[],options,'weights', weight_cont_mass_14change_frombc1); 

AICR2_prior_weightfrombc1=AICc(nansum(R2_prior_weightfrombc1.^2),4,n)

%%

% R3_prior_weightfrombc1.1: 2pop Inverse function (2) gamma(t)=g0*g1/(g1+t)
F=@(x,age) cAtmosZone(@c2pop,[1,bestXMCMC3_prior_weightsfrombc1(1,:)],age,bc2,zeros(size(age)),dd,zone,@cDecreasingTurnover,0,2); 
[X3_prior_weightfrombc1,R3_prior_weightfrombc1,J,COVB,MSE] = nlinfit(age,c14,F,[],options,'weights', weight_cont_mass_14change_frombc1); 

AICR3_prior_weightfrombc1=AICc(nansum(R3_prior_weightfrombc1.^2),4,n)
%%


% R4_prior_weightfrombc1.1: 2pop Step function (3) gamma(t)=g0*(t<g1) Stop after t. 
F=@(x,age) cAtmosZone(@c2pop,[1,bestXMCMC4_prior_weightsfrombc1(1,:)],age,bc2,zeros(size(age)),dd,zone,@cDecreasingTurnover,0,3); 
[X4_prior_weightfrombc1,R4_prior_weightfrombc1,J,COVB,MSE] = nlinfit(age,c14,F,[],options,'weights', weight_cont_mass_14change_frombc1); 

AICR4_prior_weightfrombc1=AICc(nansum(R4_prior_weightfrombc1.^2),4,n)

%%
% R11_prior_weightfrombc1.1: 2pop with constant turnover 
F=@(x,age) cAtmosZone(@c2pop,bestXMCMC11_prior_weightsfrombc1(1,:),age,bc2,zeros(size(age)),dd,zone,@cConstantTurnover,0); 
[X11_prior_weightfrombc1,R11_prior_weightfrombc1,J,COVB,MSE] = nlinfit(age,c14,F,[],options,'weights', weight_cont_mass_14change_frombc1); 

AICR11_prior_weightfrombc1=AICc(nansum(R11_prior_weightfrombc1.^2),3,n)

%%
% R2_prior_weightfrombc1.1: 2pop with linear decrease
F=@(x,age) cAtmosZone(@c2pop,bestXMCMC21_prior_weightsfrombc1(1,:),age,bc2,zeros(size(age)),dd,zone,@cDecreasingTurnover,0,1); 
[X21_prior_weightfrombc1,R21_prior_weightfrombc1,J,COVB,MSE] = nlinfit(age,c14,F,[],options,'weights', weight_cont_mass_14change_frombc1); 

AICR21_prior_weightfrombc1=AICc(nansum(R21_prior_weightfrombc1.^2),4,n)

%%

% R3_prior_weightfrombc1.1: 2pop Inverse function (2) gamma(t)=g0*g1/(g1+t)
F=@(x,age) cAtmosZone(@c2pop,bestXMCMC31_prior_weightsfrombc1(1,:),age,bc2,zeros(size(age)),dd,zone,@cDecreasingTurnover,0,2); 
[X31_prior_weightfrombc1,R31_prior_weightfrombc1,J,COVB,MSE] = nlinfit(age,c14,F,[],options,'weights', weight_cont_mass_14change_frombc1); 

AICR31_prior_weightfrombc1=AICc(nansum(R31_prior_weightfrombc1.^2),4,n)
%%


% R4_prior_weightfrombc1.1: 2pop Step function (3) gamma(t)=g0*(t<g1) Stop after t. 
F=@(x,age) cAtmosZone(@c2pop,bestXMCMC41_prior_weightsfrombc1(1,:),age,bc2,zeros(size(age)),dd,zone,@cDecreasingTurnover,0,3); 
[X41_prior_weightfrombc1,R41_prior_weightfrombc1,J,COVB,MSE] = nlinfit(age,c14,F,[],options,'weights', weight_cont_mass_14change_frombc1); 

AICR41_prior_weightfrombc1=AICc(nansum(R41_prior_weightfrombc1.^2),4,n)


%%

s.ca = [10, 20;
        30, 20;
        70, 15];
s.dg = [10, 18;
        30, 18;
        70, 15];

       
cbdopts = cbdset(); % initialize the options

cbdopts.nbpar.fraction_renewing = 1;
cbdopts.nbpar.death = 1;
cbdopts.nbpar.birth = 0;
cbdopts.nbpar.senescence = 1;
cbdopts.nbpar.sendeath = 2;
cbdopts.nbpar.nrdeath  = 2;
cbdopts.death = @(t,a,pg) pg;
cbdopts.senescence = @(t,a,ps) ps;
cbdopts.sendeath   = @(t,a,pd) pd(1)*(t<=30)+pd(2)*(t>30);
cbdopts.nrdeath    = @(t,pd) pd(1)*(t<=30)+pd(2)*(t>30);
cbdopts.birth = 'volterra_on_renewing';
cbdopts.bc = bc2;
cbdopts.bc_zone = zone;
cbdopts.age = age;
cbdopts.doc = dd; 
cbdopts.k_ploidy = zeros(size(age));



%%

F = @(x, age) cgenbds([s2p2('IR',s), bestXMCMC_9_0_prior_weightsfrombc1(1,1), bestXMCMC_9_0_prior_weightsfrombc1(1,2), s2p2('SDR',s,1,[bestXMCMC_9_0_prior_weightsfrombc1(1,2), bestXMCMC_9_0_prior_weightsfrombc1(1,2)]), s2p2('NRDR',s)],cbdopts);
[X_9_0_prior_weightfrombc1,R_9_0_prior_weightfrombc1,J,COVB,MSE] = nlinfit(age,c14,F,[],options,'weights', weight_cont_mass_14change_frombc1); 

AICR_9_0_prior_weightfrombc1=AICc(nansum(R_9_0_prior_weightfrombc1.^2),3,n)



%%

s.ca = [10, 20;
        30, 20;
        70, 15];
s.dg = [10, 18;
        30, 18;
        70, 15];

       
cbdopts = cbdset(); % initialize the options

cbdopts.nbpar.fraction_renewing = 1;
cbdopts.nbpar.death = 1;
cbdopts.nbpar.birth = 0;
cbdopts.nbpar.senescence = 1;
cbdopts.nbpar.sendeath = 2;
cbdopts.nbpar.nrdeath  = 2;
cbdopts.death = @(t,a,pg) pg;
cbdopts.senescence = @(t,a,ps) ps*(t>a);
cbdopts.sendeath   = @(t,a,pd) pd(1)*(t<=30)+pd(2)*(t>30);
cbdopts.nrdeath    = @(t,pd) pd(1)*(t<=30)+pd(2)*(t>30);
cbdopts.birth = 'volterra_on_renewing';
cbdopts.bc = bc2;
cbdopts.bc_zone = zone;
cbdopts.age = age;
cbdopts.doc = dd; 
cbdopts.k_ploidy = zeros(size(age));


%%

F = @(x, age) cgenbds([s2p2('IR',s), bestXMCMC_9_1_prior_weightsfrombc1(1,1), bestXMCMC_9_1_prior_weightsfrombc1(1,2), s2p2('SDR',s,1,[bestXMCMC_9_1_prior_weightsfrombc1(1,2), bestXMCMC_9_1_prior_weightsfrombc1(1,2)]), s2p2('NRDR',s)],cbdopts);
[X_9_1_prior_weightfrombc1,R_9_1_prior_weightfrombc1,J,COVB,MSE] = nlinfit(age,c14,F,[],options,'weights', weight_cont_mass_14change_frombc1); 

AICR_9_1_prior_weightfrombc1=AICc(nansum(R_9_1_prior_weightfrombc1.^2),3,n)



%%

s.ca = [10, 20;
        30, 20;
        70, 15];
s.dg = [10, 18;
        30, 18;
        70, 15];

       
cbdopts = cbdset(); % initialize the options

cbdopts.nbpar.fraction_renewing = 1;
cbdopts.nbpar.death = 1;
cbdopts.nbpar.birth = 0;
cbdopts.nbpar.senescence = 1;
cbdopts.nbpar.sendeath = 2;
cbdopts.nbpar.nrdeath  = 2;
cbdopts.death = @(t,a,pg) pg;
cbdopts.senescence = @(t,a,ps) ps*(t<=a);
cbdopts.sendeath   = @(t,a,pd) pd(1)*(t<=30)+pd(2)*(t>30);
cbdopts.nrdeath    = @(t,pd) pd(1)*(t<=30)+pd(2)*(t>30);
cbdopts.birth = 'volterra_on_renewing';
cbdopts.bc = bc2;
cbdopts.bc_zone = zone;
cbdopts.age = age;
cbdopts.doc = dd; 
cbdopts.k_ploidy = zeros(size(age));

%%

F = @(x, age) cgenbds([s2p2('IR',s), bestXMCMC_9_2_prior_weightsfrombc1(1,1), bestXMCMC_9_2_prior_weightsfrombc1(1,2), s2p2('SDR',s,1,[bestXMCMC_9_2_prior_weightsfrombc1(1,2), bestXMCMC_9_2_prior_weightsfrombc1(1,2)]), s2p2('NRDR',s)],cbdopts);
[X_9_2_prior_weightfrombc1,R_9_2_prior_weightfrombc1,J,COVB,MSE] = nlinfit(age,c14,F,[],options,'weights', weight_cont_mass_14change_frombc1); 

AICR_9_2_prior_weightfrombc1=AICc(nansum(R_9_2_prior_weightfrombc1.^2),3,n)

%%

exportexcelAICR=[AICR1_weightfrombc1; AICR2_weightfrombc1; AICR3_weightfrombc1;AICR4_weightfrombc1;AICR11_weightfrombc1; AICR21_weightfrombc1; AICR31_weightfrombc1;AICR41_weightfrombc1;AICR_9_0;AICR_9_1;AICR_9_2]
exportexcelAICR_prior=[AICR1_prior_weightfrombc1; AICR2_prior_weightfrombc1; AICR3_prior_weightfrombc1;AICR4_prior_weightfrombc1;AICR11_prior_weightfrombc1; AICR21_prior_weightfrombc1; AICR31_prior_weightfrombc1;AICR41_prior_weightfrombc1;AICR_9_0_prior_weightfrombc1;AICR_9_1_prior_weightfrombc1;AICR_9_2_prior_weightfrombc1]
export_excelbestXMCMC= {bestXMCMC1_weightsfrombc1(1,:); bestXMCMC2_weightsfrombc1(1,:); bestXMCMC3_weightsfrombc1(1,:);bestXMCMC4_weightsfrombc1(1,:);bestXMCMC11_weightsfrombc1(1,:); bestXMCMC21_weightsfrombc1(1,:); bestXMCMC31_weightsfrombc1(1,:);bestXMCMC41_weightsfrombc1(1,:);bestXMCMC_9_0(1,:);bestXMCMC_9_1(1,:);bestXMCMC_9_2(1,:)}
export_excelbestXMCMC_prior= {bestXMCMC1_prior_weightsfrombc1(1,:); bestXMCMC2_prior_weightsfrombc1(1,:); bestXMCMC3_prior_weightsfrombc1(1,:);bestXMCMC4_prior_weightsfrombc1(1,:);bestXMCMC11_prior_weightsfrombc1(1,:); bestXMCMC21_prior_weightsfrombc1(1,:); bestXMCMC31_prior_weightsfrombc1(1,:);bestXMCMC41_prior_weightsfrombc1(1,:);bestXMCMC_9_0_prior_weightsfrombc1(1,:);bestXMCMC_9_1_prior_weightsfrombc1(1,:);bestXMCMC_9_2_prior_weightsfrombc1(1,:)}

