%%
clear

load('results/datasets/NeuNneg_ALL_foodlag_05')


%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNneg_ALL_foodlag_05_scenario_11';
bayesOptions.lowerBound = [0 0];
bayesOptions.upperBound = [1 0.2];
bayesOptions.parNames = {'renewal fraction', 'turnover rate'};
%%

figure(1); clf;
plotEstim(XMCMC11_weightsfrombc0,LMCMC11_weightsfrombc0,RMCMC11_weightsfrombc0,bayesOptions)


%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNneg_ALL_foodlag_05_scenario_71';
bayesOptions.lowerBound = [0 0 0];
bayesOptions.upperBound = [1 1 70];
bayesOptions.parNames = {'renewal fraction' 'turnover rate' 'halftime'};
%%

figure(2); clf;
plotEstim(XMCMC71_weightsfrombc0,LMCMC71_weightsfrombc0,RMCMC71_weightsfrombc0,bayesOptions)

%%
lhRTTestR11_weightsfrombc0vsR71_weightsfrombc0=lhRTest(nansum(R11_weightfrombc0.^2),nansum(R71_weightfrombc0.^2),n,3,4)  

lhRTTestR7_weightsfrombc0vsR71_weightsfrombc0=lhRTest(nansum(R7_weightfrombc0.^2),nansum(R71_weightfrombc0.^2),n,3,4)  
