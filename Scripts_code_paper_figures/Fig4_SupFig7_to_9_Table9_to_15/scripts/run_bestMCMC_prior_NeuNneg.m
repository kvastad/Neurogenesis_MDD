
%%
LMCMC1_weightsfrombc0_burnin=LMCMC1_weightsfrombc0(1001:end);
XMCMC1_weightsfrombc0_burnin=XMCMC1_weightsfrombc0(1001:end,:);
RMCMC1_weightsfrombc0_burnin=RMCMC1_weightsfrombc0(1001:end,:);

bestLMCMC1_weightsfrombc0=max(LMCMC1_weightsfrombc0_burnin) 
bestXMCMC1_weightsfrombc0=XMCMC1_weightsfrombc0_burnin(LMCMC1_weightsfrombc0_burnin>=max(LMCMC1_weightsfrombc0_burnin),:)

XMCMC1_weightsfrombc0_turnover=XMCMC1_weightsfrombc0(:,1)
LMCMC1_weightsfrombc0_prior=LMCMC1_weightsfrombc0.*(1./(0.2+XMCMC1_weightsfrombc0_turnover))

LMCMC1_weightsfrombc0_prior_burnin=LMCMC1_weightsfrombc0_prior(1001:end);
XMCMC1_weightsfrombc0_prior_burnin=XMCMC1_weightsfrombc0(1001:end,:);
RMCMC1_weightsfrombc0_prior_burnin=RMCMC1_weightsfrombc0(1001:end,:);

bestLMCMC1_prior_weightsfrombc0=max(LMCMC1_weightsfrombc0_prior_burnin) 
bestXMCMC1_prior_weightsfrombc0=XMCMC1_weightsfrombc0_prior_burnin(LMCMC1_weightsfrombc0_prior_burnin>=max(LMCMC1_weightsfrombc0_prior_burnin),:)


%%
LMCMC2_weightsfrombc0_burnin=LMCMC2_weightsfrombc0(1001:end);
XMCMC2_weightsfrombc0_burnin=XMCMC2_weightsfrombc0(1001:end,:);
RMCMC2_weightsfrombc0_burnin=RMCMC2_weightsfrombc0(1001:end,:);

bestLMCMC2_weightsfrombc0=max(LMCMC2_weightsfrombc0_burnin) 
bestXMCMC2_weightsfrombc0=XMCMC2_weightsfrombc0_burnin(LMCMC2_weightsfrombc0_burnin>=max(LMCMC2_weightsfrombc0_burnin),:)

XMCMC2_weightsfrombc0_turnover=XMCMC2_weightsfrombc0(:,1)
LMCMC2_weightsfrombc0_prior=LMCMC2_weightsfrombc0.*(1./(0.2+XMCMC2_weightsfrombc0_turnover))

LMCMC2_weightsfrombc0_prior_burnin=LMCMC2_weightsfrombc0_prior(1001:end);
XMCMC2_weightsfrombc0_prior_burnin=XMCMC2_weightsfrombc0(1001:end,:);
RMCMC2_weightsfrombc0_prior_burnin=RMCMC2_weightsfrombc0(1001:end,:);

bestLMCMC2_prior_weightsfrombc0=max(LMCMC2_weightsfrombc0_prior_burnin) 
bestXMCMC2_prior_weightsfrombc0=XMCMC2_weightsfrombc0_prior_burnin(LMCMC2_weightsfrombc0_prior_burnin>=max(LMCMC2_weightsfrombc0_prior_burnin),:)


%%
LMCMC3_weightsfrombc0_burnin=LMCMC3_weightsfrombc0(1001:end);
XMCMC3_weightsfrombc0_burnin=XMCMC3_weightsfrombc0(1001:end,:);
RMCMC3_weightsfrombc0_burnin=RMCMC3_weightsfrombc0(1001:end,:);

bestLMCMC3_weightsfrombc0=max(LMCMC3_weightsfrombc0_burnin) 
bestXMCMC3_weightsfrombc0=XMCMC3_weightsfrombc0_burnin(LMCMC3_weightsfrombc0_burnin>=max(LMCMC3_weightsfrombc0_burnin),:)

XMCMC3_weightsfrombc0_turnover=XMCMC3_weightsfrombc0(:,1)
LMCMC3_weightsfrombc0_prior=LMCMC3_weightsfrombc0.*(1./(0.2+XMCMC3_weightsfrombc0_turnover))

LMCMC3_weightsfrombc0_prior_burnin=LMCMC3_weightsfrombc0_prior(1001:end);
XMCMC3_weightsfrombc0_prior_burnin=XMCMC3_weightsfrombc0(1001:end,:);
RMCMC3_weightsfrombc0_prior_burnin=RMCMC3_weightsfrombc0(1001:end,:);

bestLMCMC3_prior_weightsfrombc0=max(LMCMC3_weightsfrombc0_prior_burnin) 
bestXMCMC3_prior_weightsfrombc0=XMCMC3_weightsfrombc0_prior_burnin(LMCMC3_weightsfrombc0_prior_burnin>=max(LMCMC3_weightsfrombc0_prior_burnin),:)


%%
LMCMC4_weightsfrombc0_burnin=LMCMC4_weightsfrombc0(1001:end);
XMCMC4_weightsfrombc0_burnin=XMCMC4_weightsfrombc0(1001:end,:);
RMCMC4_weightsfrombc0_burnin=RMCMC4_weightsfrombc0(1001:end,:);

bestLMCMC4_weightsfrombc0=max(LMCMC4_weightsfrombc0_burnin) 
bestXMCMC4_weightsfrombc0=XMCMC4_weightsfrombc0_burnin(LMCMC4_weightsfrombc0_burnin>=max(LMCMC4_weightsfrombc0_burnin),:)

XMCMC4_weightsfrombc0_turnover=XMCMC4_weightsfrombc0(:,1)
LMCMC4_weightsfrombc0_prior=LMCMC4_weightsfrombc0.*(1./(0.2+XMCMC4_weightsfrombc0_turnover))

LMCMC4_weightsfrombc0_prior_burnin=LMCMC4_weightsfrombc0_prior(1001:end);
XMCMC4_weightsfrombc0_prior_burnin=XMCMC4_weightsfrombc0(1001:end,:);
RMCMC4_weightsfrombc0_prior_burnin=RMCMC4_weightsfrombc0(1001:end,:);

bestLMCMC4_prior_weightsfrombc0=max(LMCMC4_weightsfrombc0_prior_burnin) 
bestXMCMC4_prior_weightsfrombc0=XMCMC4_weightsfrombc0_prior_burnin(LMCMC4_weightsfrombc0_prior_burnin>=max(LMCMC4_weightsfrombc0_prior_burnin),:)


%%
LMCMC7_weightsfrombc0_burnin=LMCMC7_weightsfrombc0(1001:end);
XMCMC7_weightsfrombc0_burnin=XMCMC7_weightsfrombc0(1001:end,:);
RMCMC7_weightsfrombc0_burnin=RMCMC7_weightsfrombc0(1001:end,:);

bestLMCMC7_weightsfrombc0=max(LMCMC7_weightsfrombc0_burnin) 
bestXMCMC7_weightsfrombc0=XMCMC7_weightsfrombc0_burnin(LMCMC7_weightsfrombc0_burnin>=max(LMCMC7_weightsfrombc0_burnin),:)

XMCMC7_weightsfrombc0_turnover=XMCMC7_weightsfrombc0(:,1)
LMCMC7_weightsfrombc0_prior=LMCMC7_weightsfrombc0.*(1./(0.2+XMCMC7_weightsfrombc0_turnover))

LMCMC7_weightsfrombc0_prior_burnin=LMCMC7_weightsfrombc0_prior(1001:end);
XMCMC7_weightsfrombc0_prior_burnin=XMCMC7_weightsfrombc0(1001:end,:);
RMCMC7_weightsfrombc0_prior_burnin=RMCMC7_weightsfrombc0(1001:end,:);

bestLMCMC7_prior_weightsfrombc0=max(LMCMC7_weightsfrombc0_prior_burnin) 
bestXMCMC7_prior_weightsfrombc0=XMCMC7_weightsfrombc0_prior_burnin(LMCMC7_weightsfrombc0_prior_burnin>=max(LMCMC7_weightsfrombc0_prior_burnin),:)


%%
LMCMC11_weightsfrombc0_burnin=LMCMC11_weightsfrombc0(1001:end);
XMCMC11_weightsfrombc0_burnin=XMCMC11_weightsfrombc0(1001:end,:);
RMCMC11_weightsfrombc0_burnin=RMCMC11_weightsfrombc0(1001:end,:);

bestLMCMC11_weightsfrombc0=max(LMCMC11_weightsfrombc0_burnin) 
bestXMCMC11_weightsfrombc0=XMCMC11_weightsfrombc0_burnin(LMCMC11_weightsfrombc0_burnin>=max(LMCMC11_weightsfrombc0_burnin),:)

XMCMC11_weightsfrombc0_turnover=XMCMC11_weightsfrombc0(:,2)
LMCMC11_weightsfrombc0_prior=LMCMC11_weightsfrombc0.*(1./(0.2+XMCMC11_weightsfrombc0_turnover))

LMCMC11_weightsfrombc0_prior_burnin=LMCMC11_weightsfrombc0_prior(1001:end);
XMCMC11_weightsfrombc0_prior_burnin=XMCMC11_weightsfrombc0(1001:end,:);
RMCMC11_weightsfrombc0_prior_burnin=RMCMC11_weightsfrombc0(1001:end,:);

bestLMCMC11_prior_weightsfrombc0=max(LMCMC11_weightsfrombc0_prior_burnin) 
bestXMCMC11_prior_weightsfrombc0=XMCMC11_weightsfrombc0_prior_burnin(LMCMC11_weightsfrombc0_prior_burnin>=max(LMCMC11_weightsfrombc0_prior_burnin),:)


%%
LMCMC21_weightsfrombc0_burnin=LMCMC21_weightsfrombc0(1001:end);
XMCMC21_weightsfrombc0_burnin=XMCMC21_weightsfrombc0(1001:end,:);
RMCMC21_weightsfrombc0_burnin=RMCMC21_weightsfrombc0(1001:end,:);

bestLMCMC21_weightsfrombc0=max(LMCMC21_weightsfrombc0_burnin) 
bestXMCMC21_weightsfrombc0=XMCMC21_weightsfrombc0_burnin(LMCMC21_weightsfrombc0_burnin>=max(LMCMC21_weightsfrombc0_burnin),:)

XMCMC21_weightsfrombc0_turnover=XMCMC21_weightsfrombc0(:,2)
LMCMC21_weightsfrombc0_prior=LMCMC21_weightsfrombc0.*(1./(0.2+XMCMC21_weightsfrombc0_turnover))


LMCMC21_weightsfrombc0_prior_burnin=LMCMC21_weightsfrombc0_prior(1001:end);
XMCMC21_weightsfrombc0_prior_burnin=XMCMC21_weightsfrombc0(1001:end,:);
RMCMC21_weightsfrombc0_prior_burnin=RMCMC21_weightsfrombc0(1001:end,:);

bestLMCMC21_prior_weightsfrombc0=max(LMCMC21_weightsfrombc0_prior_burnin) 
bestXMCMC21_prior_weightsfrombc0=XMCMC21_weightsfrombc0_prior_burnin(LMCMC21_weightsfrombc0_prior_burnin>=max(LMCMC21_weightsfrombc0_prior_burnin),:)


%%
LMCMC31_weightsfrombc0_burnin=LMCMC31_weightsfrombc0(1001:end);
XMCMC31_weightsfrombc0_burnin=XMCMC31_weightsfrombc0(1001:end,:);
RMCMC31_weightsfrombc0_burnin=RMCMC31_weightsfrombc0(1001:end,:);

bestLMCMC31_weightsfrombc0=max(LMCMC31_weightsfrombc0_burnin) 
bestXMCMC31_weightsfrombc0=XMCMC31_weightsfrombc0_burnin(LMCMC31_weightsfrombc0_burnin>=max(LMCMC31_weightsfrombc0_burnin),:)

XMCMC31_weightsfrombc0_turnover=XMCMC31_weightsfrombc0(:,2)
LMCMC31_weightsfrombc0_prior=LMCMC31_weightsfrombc0.*(1./(0.2+XMCMC31_weightsfrombc0_turnover))

LMCMC31_weightsfrombc0_prior_burnin=LMCMC31_weightsfrombc0_prior(1001:end);
XMCMC31_weightsfrombc0_prior_burnin=XMCMC31_weightsfrombc0(1001:end,:);
RMCMC31_weightsfrombc0_prior_burnin=RMCMC31_weightsfrombc0(1001:end,:);

bestLMCMC31_prior_weightsfrombc0=max(LMCMC31_weightsfrombc0_prior_burnin) 
bestXMCMC31_prior_weightsfrombc0=XMCMC31_weightsfrombc0_prior_burnin(LMCMC31_weightsfrombc0_prior_burnin>=max(LMCMC31_weightsfrombc0_prior_burnin),:)

%%
LMCMC41_weightsfrombc0_burnin=LMCMC41_weightsfrombc0(1001:end);
XMCMC41_weightsfrombc0_burnin=XMCMC41_weightsfrombc0(1001:end,:);
RMCMC41_weightsfrombc0_burnin=RMCMC41_weightsfrombc0(1001:end,:);

bestLMCMC41_weightsfrombc0=max(LMCMC41_weightsfrombc0_burnin) 
bestXMCMC41_weightsfrombc0=XMCMC41_weightsfrombc0_burnin(LMCMC41_weightsfrombc0_burnin>=max(LMCMC41_weightsfrombc0_burnin),:)

XMCMC41_weightsfrombc0_turnover=XMCMC41_weightsfrombc0(:,2)
LMCMC41_weightsfrombc0_prior=LMCMC41_weightsfrombc0.*(1./(0.2+XMCMC41_weightsfrombc0_turnover))

LMCMC41_weightsfrombc0_prior_burnin=LMCMC41_weightsfrombc0_prior(1001:end);
XMCMC41_weightsfrombc0_prior_burnin=XMCMC41_weightsfrombc0(1001:end,:);
RMCMC41_weightsfrombc0_prior_burnin=RMCMC41_weightsfrombc0(1001:end,:);

bestLMCMC41_prior_weightsfrombc0=max(LMCMC41_weightsfrombc0_prior_burnin) 
bestXMCMC41_prior_weightsfrombc0=XMCMC41_weightsfrombc0_prior_burnin(LMCMC41_weightsfrombc0_prior_burnin>=max(LMCMC41_weightsfrombc0_prior_burnin),:)

%%
LMCMC71_weightsfrombc0_burnin=LMCMC71_weightsfrombc0(1001:end);
XMCMC71_weightsfrombc0_burnin=XMCMC71_weightsfrombc0(1001:end,:);
RMCMC71_weightsfrombc0_burnin=RMCMC71_weightsfrombc0(1001:end,:);

bestLMCMC71_weightsfrombc0=max(LMCMC71_weightsfrombc0_burnin) 
bestXMCMC71_weightsfrombc0=XMCMC71_weightsfrombc0_burnin(LMCMC71_weightsfrombc0_burnin>=max(LMCMC71_weightsfrombc0_burnin),:)

XMCMC71_weightsfrombc0_turnover=XMCMC71_weightsfrombc0(:,2)
LMCMC71_weightsfrombc0_prior=LMCMC71_weightsfrombc0.*(1./(0.2+XMCMC71_weightsfrombc0_turnover))

LMCMC71_weightsfrombc0_prior_burnin=LMCMC71_weightsfrombc0_prior(1001:end);
XMCMC71_weightsfrombc0_prior_burnin=XMCMC71_weightsfrombc0(1001:end,:);
RMCMC71_weightsfrombc0_prior_burnin=RMCMC71_weightsfrombc0(1001:end,:);

bestLMCMC71_prior_weightsfrombc0=max(LMCMC71_weightsfrombc0_prior_burnin) 
bestXMCMC71_prior_weightsfrombc0=XMCMC71_weightsfrombc0_prior_burnin(LMCMC71_weightsfrombc0_prior_burnin>=max(LMCMC71_weightsfrombc0_prior_burnin),:)



%%
%%

% R1_weightfrombc0.1: 2pop with constant turnover 
F=@(x,age) cAtmosZone(@c2pop,[1,bestXMCMC1_weightsfrombc0(1,:)],age,bc2,zeros(size(age)),dd,zone,@cConstantTurnover,0); 
[X1_weightfrombc0,R1_weightfrombc0,J,COVB,MSE] = nlinfit(age,c14,F,[],options,'weights', weight_cont_mass_14change_frombc0); 

AICR1_weightfrombc0=AICc(nansum(R1_weightfrombc0.^2),3,n)

%%
% R2_weightfrombc0.1: 2pop with linear decrease
F=@(x,age) cAtmosZone(@c2pop,[1,bestXMCMC2_weightsfrombc0(1,:)],age,bc2,zeros(size(age)),dd,zone,@cDecreasingTurnover,0,1); 
[X2_weightfrombc0,R2_weightfrombc0,J,COVB,MSE] = nlinfit(age,c14,F,[],options,'weights', weight_cont_mass_14change_frombc0); 

AICR2_weightfrombc0=AICc(nansum(R2_weightfrombc0.^2),4,n)

%%

% R3_weightfrombc0.1: 2pop Inverse function (2) gamma(t)=g0*g1/(g1+t)
F=@(x,age) cAtmosZone(@c2pop,[1,bestXMCMC3_weightsfrombc0(1,:)],age,bc2,zeros(size(age)),dd,zone,@cDecreasingTurnover,0,2); 
[X3_weightfrombc0,R3_weightfrombc0,J,COVB,MSE] = nlinfit(age,c14,F,[],options,'weights', weight_cont_mass_14change_frombc0); 

AICR3_weightfrombc0=AICc(nansum(R3_weightfrombc0.^2),4,n)
%%


% R4_weightfrombc0.1: 2pop Step function (3) gamma(t)=g0*(t<g1) Stop after t. 
F=@(x,age) cAtmosZone(@c2pop,[1,bestXMCMC4_weightsfrombc0(1,:)],age,bc2,zeros(size(age)),dd,zone,@cDecreasingTurnover,0,3); 
[X4_weightfrombc0,R4_weightfrombc0,J,COVB,MSE] = nlinfit(age,c14,F,[],options,'weights', weight_cont_mass_14change_frombc0); 

AICR4_weightfrombc0=AICc(nansum(R4_weightfrombc0.^2),4,n)
%%

F=@(x,age) cAtmosZone(@c2pop,[1,bestXMCMC7_weightsfrombc0(1,:)],age,bc2,zeros(size(age)),dd,zone,@cAgeDeathInverse,0); 
[X7_weightfrombc0,R7_weightfrombc0,J,COVB,MSE] = nlinfit(age,c14,F,[],options,'weights', weight_cont_mass_14change_frombc0); 

AICR7_weightfrombc0=AICc(nansum(R7_weightfrombc0.^2),4,n)
%%
% R11_weightfrombc0.1: 2pop with constant turnover 
F=@(x,age) cAtmosZone(@c2pop,bestXMCMC11_weightsfrombc0(1,:),age,bc2,zeros(size(age)),dd,zone,@cConstantTurnover,0); 
[X11_weightfrombc0,R11_weightfrombc0,J,COVB,MSE] = nlinfit(age,c14,F,[],options,'weights', weight_cont_mass_14change_frombc0); 

AICR11_weightfrombc0=AICc(nansum(R11_weightfrombc0.^2),3,n)

%%
% R2_weightfrombc0.1: 2pop with linear decrease
F=@(x,age) cAtmosZone(@c2pop,bestXMCMC21_weightsfrombc0(1,:),age,bc2,zeros(size(age)),dd,zone,@cDecreasingTurnover,0,1); 
[X21_weightfrombc0,R21_weightfrombc0,J,COVB,MSE] = nlinfit(age,c14,F,[],options,'weights', weight_cont_mass_14change_frombc0); 

AICR21_weightfrombc0=AICc(nansum(R21_weightfrombc0.^2),4,n)

%%

% R3_weightfrombc0.1: 2pop Inverse function (2) gamma(t)=g0*g1/(g1+t)
F=@(x,age) cAtmosZone(@c2pop,bestXMCMC31_weightsfrombc0(1,:),age,bc2,zeros(size(age)),dd,zone,@cDecreasingTurnover,0,2); 
[X31_weightfrombc0,R31_weightfrombc0,J,COVB,MSE] = nlinfit(age,c14,F,[],options,'weights', weight_cont_mass_14change_frombc0); 

AICR31_weightfrombc0=AICc(nansum(R31_weightfrombc0.^2),4,n)
%%


% R4_weightfrombc0.1: 2pop Step function (3) gamma(t)=g0*(t<g1) Stop after t. 
F=@(x,age) cAtmosZone(@c2pop,bestXMCMC41_weightsfrombc0(1,:),age,bc2,zeros(size(age)),dd,zone,@cDecreasingTurnover,0,3); 
[X41_weightfrombc0,R41_weightfrombc0,J,COVB,MSE] = nlinfit(age,c14,F,[],options,'weights', weight_cont_mass_14change_frombc0); 

AICR41_weightfrombc0=AICc(nansum(R41_weightfrombc0.^2),4,n)
%%

F=@(x,age) cAtmosZone(@c2pop,bestXMCMC71_weightsfrombc0(1,:),age,bc2,zeros(size(age)),dd,zone,@cAgeDeathInverse,0); 
[X71_weightfrombc0,R71_weightfrombc0,J,COVB,MSE] = nlinfit(age,c14,F,[],options,'weights', weight_cont_mass_14change_frombc0); 

AICR71_weightfrombc0=AICc(nansum(R71_weightfrombc0.^2),4,n)
%%


%%

% R1_prior_weightfrombc0.1: 2pop with constant turnover 
F=@(x,age) cAtmosZone(@c2pop,[1,bestXMCMC1_prior_weightsfrombc0(1,:)],age,bc2,zeros(size(age)),dd,zone,@cConstantTurnover,0); 
[X1_prior_weightfrombc0,R1_prior_weightfrombc0,J,COVB,MSE] = nlinfit(age,c14,F,[],options,'weights', weight_cont_mass_14change_frombc0); 

AICR1_prior_weightfrombc0=AICc(nansum(R1_prior_weightfrombc0.^2),3,n)

%%
% R2_prior_weightfrombc0.1: 2pop with linear decrease
F=@(x,age) cAtmosZone(@c2pop,[1,bestXMCMC2_prior_weightsfrombc0(1,:)],age,bc2,zeros(size(age)),dd,zone,@cDecreasingTurnover,0,1); 
[X2_prior_weightfrombc0,R2_prior_weightfrombc0,J,COVB,MSE] = nlinfit(age,c14,F,[],options,'weights', weight_cont_mass_14change_frombc0); 

AICR2_prior_weightfrombc0=AICc(nansum(R2_prior_weightfrombc0.^2),4,n)

%%

% R3_prior_weightfrombc0.1: 2pop Inverse function (2) gamma(t)=g0*g1/(g1+t)
F=@(x,age) cAtmosZone(@c2pop,[1,bestXMCMC3_prior_weightsfrombc0(1,:)],age,bc2,zeros(size(age)),dd,zone,@cDecreasingTurnover,0,2); 
[X3_prior_weightfrombc0,R3_prior_weightfrombc0,J,COVB,MSE] = nlinfit(age,c14,F,[],options,'weights', weight_cont_mass_14change_frombc0); 

AICR3_prior_weightfrombc0=AICc(nansum(R3_prior_weightfrombc0.^2),4,n)
%%


% R4_prior_weightfrombc0.1: 2pop Step function (3) gamma(t)=g0*(t<g1) Stop after t. 
F=@(x,age) cAtmosZone(@c2pop,[1,bestXMCMC4_prior_weightsfrombc0(1,:)],age,bc2,zeros(size(age)),dd,zone,@cDecreasingTurnover,0,3); 
[X4_prior_weightfrombc0,R4_prior_weightfrombc0,J,COVB,MSE] = nlinfit(age,c14,F,[],options,'weights', weight_cont_mass_14change_frombc0); 

AICR4_prior_weightfrombc0=AICc(nansum(R4_prior_weightfrombc0.^2),4,n)
%%

F=@(x,age) cAtmosZone(@c2pop,[1,bestXMCMC7_prior_weightsfrombc0(1,:)],age,bc2,zeros(size(age)),dd,zone,@cAgeDeathInverse,0); 
[X7_prior_weightfrombc0,R7_prior_weightfrombc0,J,COVB,MSE] = nlinfit(age,c14,F,[],options,'weights', weight_cont_mass_14change_frombc0); 

AICR7_prior_weightfrombc0=AICc(nansum(R7_prior_weightfrombc0.^2),4,n)
%%
% R11_prior_weightfrombc0.1: 2pop with constant turnover 
F=@(x,age) cAtmosZone(@c2pop,bestXMCMC11_prior_weightsfrombc0(1,:),age,bc2,zeros(size(age)),dd,zone,@cConstantTurnover,0); 
[X11_prior_weightfrombc0,R11_prior_weightfrombc0,J,COVB,MSE] = nlinfit(age,c14,F,[],options,'weights', weight_cont_mass_14change_frombc0); 

AICR11_prior_weightfrombc0=AICc(nansum(R11_prior_weightfrombc0.^2),3,n)

%%
% R2_prior_weightfrombc0.1: 2pop with linear decrease
F=@(x,age) cAtmosZone(@c2pop,bestXMCMC21_prior_weightsfrombc0(1,:),age,bc2,zeros(size(age)),dd,zone,@cDecreasingTurnover,0,1); 
[X21_prior_weightfrombc0,R21_prior_weightfrombc0,J,COVB,MSE] = nlinfit(age,c14,F,[],options,'weights', weight_cont_mass_14change_frombc0); 

AICR21_prior_weightfrombc0=AICc(nansum(R21_prior_weightfrombc0.^2),4,n)

%%

% R3_prior_weightfrombc0.1: 2pop Inverse function (2) gamma(t)=g0*g1/(g1+t)
F=@(x,age) cAtmosZone(@c2pop,bestXMCMC31_prior_weightsfrombc0(1,:),age,bc2,zeros(size(age)),dd,zone,@cDecreasingTurnover,0,2); 
[X31_prior_weightfrombc0,R31_prior_weightfrombc0,J,COVB,MSE] = nlinfit(age,c14,F,[],options,'weights', weight_cont_mass_14change_frombc0); 

AICR31_prior_weightfrombc0=AICc(nansum(R31_prior_weightfrombc0.^2),4,n)
%%


% R4_prior_weightfrombc0.1: 2pop Step function (3) gamma(t)=g0*(t<g1) Stop after t. 
F=@(x,age) cAtmosZone(@c2pop,bestXMCMC41_prior_weightsfrombc0(1,:),age,bc2,zeros(size(age)),dd,zone,@cDecreasingTurnover,0,3); 
[X41_prior_weightfrombc0,R41_prior_weightfrombc0,J,COVB,MSE] = nlinfit(age,c14,F,[],options,'weights', weight_cont_mass_14change_frombc0); 

AICR41_prior_weightfrombc0=AICc(nansum(R41_prior_weightfrombc0.^2),4,n)
%%

F=@(x,age) cAtmosZone(@c2pop,bestXMCMC71_prior_weightsfrombc0(1,:),age,bc2,zeros(size(age)),dd,zone,@cAgeDeathInverse,0); 
[X71_prior_weightfrombc0,R71_prior_weightfrombc0,J,COVB,MSE] = nlinfit(age,c14,F,[],options,'weights', weight_cont_mass_14change_frombc0); 

AICR71_prior_weightfrombc0=AICc(nansum(R71_prior_weightfrombc0.^2),4,n)

%%

exportexcelAICR=[AICR1_weightfrombc0; AICR2_weightfrombc0; AICR3_weightfrombc0;AICR4_weightfrombc0;AICR11_weightfrombc0; AICR21_weightfrombc0; AICR31_weightfrombc0;AICR41_weightfrombc0]
exportexcelAICR_prior=[AICR1_prior_weightfrombc0; AICR2_prior_weightfrombc0; AICR3_prior_weightfrombc0;AICR4_prior_weightfrombc0;AICR11_prior_weightfrombc0; AICR21_prior_weightfrombc0; AICR31_prior_weightfrombc0;AICR41_prior_weightfrombc0]
export_excelbestXMCMC= {bestXMCMC1_weightsfrombc0(1,:); bestXMCMC2_weightsfrombc0(1,:); bestXMCMC3_weightsfrombc0(1,:);bestXMCMC4_weightsfrombc0(1,:);bestXMCMC11_weightsfrombc0(1,:); bestXMCMC21_weightsfrombc0(1,:); bestXMCMC31_weightsfrombc0(1,:);bestXMCMC41_weightsfrombc0(1,:)}
export_excelbestXMCMC_prior= {bestXMCMC1_prior_weightsfrombc0(1,:); bestXMCMC2_prior_weightsfrombc0(1,:); bestXMCMC3_prior_weightsfrombc0(1,:);bestXMCMC4_prior_weightsfrombc0(1,:);bestXMCMC11_prior_weightsfrombc0(1,:); bestXMCMC21_prior_weightsfrombc0(1,:); bestXMCMC31_prior_weightsfrombc0(1,:);bestXMCMC41_prior_weightsfrombc0(1,:);bestXMCMC71_prior_weightsfrombc0(1,:)}

