%%
clear

load('results/datasets/NeuNneg_ALL_foodlag_0')
%%
load('results/weights/weights_NeuNneg_ALL.mat')

%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNneg_ALL_foodlag_0_scenario_1';
bayesOptions.lowerBound = [0];
bayesOptions.upperBound = [0.5];
bayesOptions.parNames = {'turnover rate'};
%%
F = @(x) cAtmosZone(@c2pop,[1, x],age,bc2,kind,dd,zone,@cConstantTurnover,0);
bayesOptimData = [c14 weight_cont_mass_14change_frombc0.^2];
[XMCMC1_weightsfrombc0, LMCMC1_weightsfrombc0, RMCMC1_weightsfrombc0] = bayesEstim(F,bayesOptimData,0.1,0.01,bayesOptions);

%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNneg_ALL_foodlag_0_scenario_2';
bayesOptions.lowerBound = [0 0];
bayesOptions.upperBound = [0.5 0.05];
bayesOptions.parNames = {'turnover rate' 'decrease rate'};
%%
F = @(x) cAtmosZone(@c2pop,[1, x(1), x(2)],age,bc2,kind,dd,zone,@cDecreasingTurnover,0,1);
bayesOptimData = [c14 weight_cont_mass_14change_frombc0.^2];
[XMCMC2_weightsfrombc0, LMCMC2_weightsfrombc0, RMCMC2_weightsfrombc0] = bayesEstim(F,bayesOptimData,[0.1 0.01],[0.01 0.0001],bayesOptions);


%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNneg_ALL_foodlag_0_scenario_3';
bayesOptions.lowerBound = [0 0];
bayesOptions.upperBound = [0.5 0.05];
bayesOptions.parNames = {'turnover rate' 'decrease rate'};
%%
F = @(x) cAtmosZone(@c2pop,[1, x(1), x(2)],age,bc2,kind,dd,zone,@cDecreasingTurnover,0,2);
bayesOptimData = [c14 weight_cont_mass_14change_frombc0.^2];
[XMCMC3_weightsfrombc0, LMCMC3_weightsfrombc0, RMCMC3_weightsfrombc0] = bayesEstim(F,bayesOptimData,[0.1 0.01],[0.01 0.0001],bayesOptions);


%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNneg_ALL_foodlag_0_scenario_4';
bayesOptions.lowerBound = [0 0];
bayesOptions.upperBound = [0.5 70];
bayesOptions.parNames = {'turnover rate' 'years'};
%%
F = @(x) cAtmosZone(@c2pop,[1, x],age,bc2,kind,dd,zone,@cDecreasingTurnover,0,3);
bayesOptimData = [c14 weight_cont_mass_14change_frombc0.^2];
[XMCMC4_weightsfrombc0, LMCMC4_weightsfrombc0, RMCMC4_weightsfrombc0] = bayesEstim(F,bayesOptimData,[0.1 60],[0.01 20],bayesOptions);


%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNneg_ALL_foodlag_0_scenario_7';
bayesOptions.lowerBound = [0 0];
bayesOptions.upperBound = [0.5 70];
bayesOptions.parNames = {'turnover rate' 'halftime'};
%%
F = @(x) cAtmosZone(@c2pop,[1, x(1), x(2)],age,bc2,kind,dd,zone,@cAgeDeathInverse,0);
bayesOptimData = [c14 weight_cont_mass_14change_frombc0.^2];
[XMCMC7_weightsfrombc0, LMCMC7_weightsfrombc0, RMCMC7_weightsfrombc0] = bayesEstim(F,bayesOptimData,[0.1 60],[0.01 5],bayesOptions);

save('results/datasets/NeuNneg_ALL_foodlag_0')

%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNneg_ALL_foodlag_0_scenario_11';
bayesOptions.lowerBound = [0 0];
bayesOptions.upperBound = [1 0.2];
bayesOptions.parNames = {'renewal fraction', 'turnover rate'};
%%
F = @(x) cAtmosZone(@c2pop,x,age,bc2,kind,dd,zone,@cConstantTurnover,0);
bayesOptimData = [c14 weight_cont_mass_14change_frombc0.^2];
[XMCMC11_weightsfrombc0, LMCMC11_weightsfrombc0, RMCMC11_weightsfrombc0] = bayesEstim(F,bayesOptimData,[0.9 0.1],[0.5 0.01],bayesOptions);


%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNneg_ALL_foodlag_0_scenario_21';
bayesOptions.lowerBound = [0 0 0];
bayesOptions.upperBound = [1 0.5 0.05];
bayesOptions.parNames = {'renewal fraction' 'turnover rate' 'decrease rate'};
%%
F = @(x) cAtmosZone(@c2pop,[x(1), x(2), x(3)],age,bc2,kind,dd,zone,@cDecreasingTurnover,0,1);
bayesOptimData = [c14 weight_cont_mass_14change_frombc0.^2];
[XMCMC21_weightsfrombc0, LMCMC21_weightsfrombc0, RMCMC21_weightsfrombc0] = bayesEstim(F,bayesOptimData,[0.9 0.1 0.01],[0.3 0.01 0.0001],bayesOptions);


%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNneg_ALL_foodlag_0_scenario_31';
bayesOptions.lowerBound = [0 0 0];
bayesOptions.upperBound = [1 0.5 0.05];
bayesOptions.parNames = {'renewal fraction' 'turnover rate' 'decrease rate'};
%%
F = @(x) cAtmosZone(@c2pop,[x(1), x(2), x(3)],age,bc2,kind,dd,zone,@cDecreasingTurnover,0,2);
bayesOptimData = [c14 weight_cont_mass_14change_frombc0.^2];
[XMCMC31_weightsfrombc0, LMCMC31_weightsfrombc0, RMCMC31_weightsfrombc0] = bayesEstim(F,bayesOptimData,[0.9 0.1 0.01],[0.3 0.01 0.0001],bayesOptions);


%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNneg_ALL_foodlag_0_scenario_41';
bayesOptions.lowerBound = [0 0 0];
bayesOptions.upperBound = [1 0.5 70];
bayesOptions.parNames = {'renewal fraction' 'turnover rate' 'years'};
%%
F = @(x) cAtmosZone(@c2pop,[x(1), x(2), x(3)],age,bc2,kind,dd,zone,@cDecreasingTurnover,0,3);
bayesOptimData = [c14 weight_cont_mass_14change_frombc0.^2];
[XMCMC41_weightsfrombc0, LMCMC41_weightsfrombc0, RMCMC41_weightsfrombc0] = bayesEstim(F,bayesOptimData,[0.9 0.1 60],[0.3 0.01 20],bayesOptions);


%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNneg_ALL_foodlag_0_scenario_71';
bayesOptions.lowerBound = [0 0 0];
bayesOptions.upperBound = [1 1 70];
bayesOptions.parNames = {'renewal fraction' 'turnover rate' 'halftime'};
%%
F = @(x) cAtmosZone(@c2pop,[x(1), x(2), x(3)],age,bc2,kind,dd,zone,@cAgeDeathInverse,0);
bayesOptimData = [c14 weight_cont_mass_14change_frombc0.^2];
[XMCMC71_weightsfrombc0, LMCMC71_weightsfrombc0, RMCMC71_weightsfrombc0] = bayesEstim(F,bayesOptimData,[0.6 0.9 60],[0.1 0.01 5],bayesOptions);

%%
save('results/datasets/NeuNneg_ALL_foodlag_0')


%%
run('run_bestMCMC_prior_NeuNneg.m')


%%
save('results/datasets/NeuNneg_ALL_foodlag_0')


%%
clear

load('results/datasets/NeuNneg_ALL_foodlag_05')

%%
load('results/weights/weights_NeuNneg_ALL.mat')


%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNneg_ALL_foodlag_05_scenario_1';
bayesOptions.lowerBound = [0];
bayesOptions.upperBound = [0.5];
bayesOptions.parNames = {'turnover rate'};
%%
F = @(x) cAtmosZone(@c2pop,[1, x],age,bc2,kind,dd,zone,@cConstantTurnover,0);
bayesOptimData = [c14 weight_cont_mass_14change_frombc0.^2];
[XMCMC1_weightsfrombc0, LMCMC1_weightsfrombc0, RMCMC1_weightsfrombc0] = bayesEstim(F,bayesOptimData,0.1,0.01,bayesOptions);

%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNneg_ALL_foodlag_05_scenario_2';
bayesOptions.lowerBound = [0 0];
bayesOptions.upperBound = [0.5 0.05];
bayesOptions.parNames = {'turnover rate' 'decrease rate'};
%%
F = @(x) cAtmosZone(@c2pop,[1, x(1), x(2)],age,bc2,kind,dd,zone,@cDecreasingTurnover,0,1);
bayesOptimData = [c14 weight_cont_mass_14change_frombc0.^2];
[XMCMC2_weightsfrombc0, LMCMC2_weightsfrombc0, RMCMC2_weightsfrombc0] = bayesEstim(F,bayesOptimData,[0.1 0.01],[0.01 0.0001],bayesOptions);


%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNneg_ALL_foodlag_05_scenario_3';
bayesOptions.lowerBound = [0 0];
bayesOptions.upperBound = [0.5 0.05];
bayesOptions.parNames = {'turnover rate' 'decrease rate'};
%%
F = @(x) cAtmosZone(@c2pop,[1, x(1), x(2)],age,bc2,kind,dd,zone,@cDecreasingTurnover,0,2);
bayesOptimData = [c14 weight_cont_mass_14change_frombc0.^2];
[XMCMC3_weightsfrombc0, LMCMC3_weightsfrombc0, RMCMC3_weightsfrombc0] = bayesEstim(F,bayesOptimData,[0.1 0.01],[0.01 0.0001],bayesOptions);


%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNneg_ALL_foodlag_05_scenario_4';
bayesOptions.lowerBound = [0 0];
bayesOptions.upperBound = [0.5 70];
bayesOptions.parNames = {'turnover rate' 'years'};
%%
F = @(x) cAtmosZone(@c2pop,[1, x],age,bc2,kind,dd,zone,@cDecreasingTurnover,0,3);
bayesOptimData = [c14 weight_cont_mass_14change_frombc0.^2];
[XMCMC4_weightsfrombc0, LMCMC4_weightsfrombc0, RMCMC4_weightsfrombc0] = bayesEstim(F,bayesOptimData,[0.1 60],[0.01 20],bayesOptions);


%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNneg_ALL_foodlag_05_scenario_7';
bayesOptions.lowerBound = [0 0];
bayesOptions.upperBound = [0.5 70];
bayesOptions.parNames = {'turnover rate' 'halftime'};
%%
F = @(x) cAtmosZone(@c2pop,[1, x(1), x(2)],age,bc2,kind,dd,zone,@cAgeDeathInverse,0);
bayesOptimData = [c14 weight_cont_mass_14change_frombc0.^2];
[XMCMC7_weightsfrombc0, LMCMC7_weightsfrombc0, RMCMC7_weightsfrombc0] = bayesEstim(F,bayesOptimData,[0.1 60],[0.01 5],bayesOptions);

save('results/datasets/NeuNneg_ALL_foodlag_05')


%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNneg_ALL_foodlag_05_scenario_11';
bayesOptions.lowerBound = [0 0];
bayesOptions.upperBound = [1 0.2];
bayesOptions.parNames = {'renewal fraction', 'turnover rate'};
%%
F = @(x) cAtmosZone(@c2pop,x,age,bc2,kind,dd,zone,@cConstantTurnover,0);
bayesOptimData = [c14 weight_cont_mass_14change_frombc0.^2];
[XMCMC11_weightsfrombc0, LMCMC11_weightsfrombc0, RMCMC11_weightsfrombc0] = bayesEstim(F,bayesOptimData,[0.9 0.1],[0.5 0.01],bayesOptions);


%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNneg_ALL_foodlag_05_scenario_21';
bayesOptions.lowerBound = [0 0 0];
bayesOptions.upperBound = [1 0.5 0.05];
bayesOptions.parNames = {'renewal fraction' 'turnover rate' 'decrease rate'};
%%
F = @(x) cAtmosZone(@c2pop,[x(1), x(2), x(3)],age,bc2,kind,dd,zone,@cDecreasingTurnover,0,1);
bayesOptimData = [c14 weight_cont_mass_14change_frombc0.^2];
[XMCMC21_weightsfrombc0, LMCMC21_weightsfrombc0, RMCMC21_weightsfrombc0] = bayesEstim(F,bayesOptimData,[0.9 0.1 0.01],[0.3 0.01 0.0001],bayesOptions);


%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNneg_ALL_foodlag_05_scenario_31';
bayesOptions.lowerBound = [0 0 0];
bayesOptions.upperBound = [1 0.5 0.05];
bayesOptions.parNames = {'renewal fraction' 'turnover rate' 'decrease rate'};
%%
F = @(x) cAtmosZone(@c2pop,[x(1), x(2), x(3)],age,bc2,kind,dd,zone,@cDecreasingTurnover,0,2);
bayesOptimData = [c14 weight_cont_mass_14change_frombc0.^2];
[XMCMC31_weightsfrombc0, LMCMC31_weightsfrombc0, RMCMC31_weightsfrombc0] = bayesEstim(F,bayesOptimData,[0.9 0.1 0.01],[0.3 0.01 0.0001],bayesOptions);


%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNneg_ALL_foodlag_05_scenario_41';
bayesOptions.lowerBound = [0 0 0];
bayesOptions.upperBound = [1 0.5 70];
bayesOptions.parNames = {'renewal fraction' 'turnover rate' 'years'};
%%
F = @(x) cAtmosZone(@c2pop,[x(1), x(2), x(3)],age,bc2,kind,dd,zone,@cDecreasingTurnover,0,3);
bayesOptimData = [c14 weight_cont_mass_14change_frombc0.^2];
[XMCMC41_weightsfrombc0, LMCMC41_weightsfrombc0, RMCMC41_weightsfrombc0] = bayesEstim(F,bayesOptimData,[0.9 0.1 60],[0.3 0.01 20],bayesOptions);


%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNneg_ALL_foodlag_05_scenario_71';
bayesOptions.lowerBound = [0 0 0];
bayesOptions.upperBound = [1 1 70];
bayesOptions.parNames = {'renewal fraction' 'turnover rate' 'halftime'};
%%
F = @(x) cAtmosZone(@c2pop,[x(1), x(2), x(3)],age,bc2,kind,dd,zone,@cAgeDeathInverse,0);
bayesOptimData = [c14 weight_cont_mass_14change_frombc0.^2];
[XMCMC71_weightsfrombc0, LMCMC71_weightsfrombc0, RMCMC71_weightsfrombc0] = bayesEstim(F,bayesOptimData,[0.6 0.9 60],[0.1 0.01 5],bayesOptions);
%%

save('results/datasets/NeuNneg_ALL_foodlag_05')


%%

run('run_bestMCMC_prior_NeuNneg.m')

%%
save('results/datasets/NeuNneg_ALL_foodlag_05')

%%
clear

load('results/datasets/NeuNneg_ALL_foodlag_1')

%%
load('results/weights/weights_NeuNneg_ALL.mat')

%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNneg_ALL_foodlag_1_scenario_1';
bayesOptions.lowerBound = [0];
bayesOptions.upperBound = [0.5];
bayesOptions.parNames = {'turnover rate'};
%%
F = @(x) cAtmosZone(@c2pop,[1, x],age,bc2,kind,dd,zone,@cConstantTurnover,0);
bayesOptimData = [c14 weight_cont_mass_14change_frombc0.^2];
[XMCMC1_weightsfrombc0, LMCMC1_weightsfrombc0, RMCMC1_weightsfrombc0] = bayesEstim(F,bayesOptimData,0.1,0.01,bayesOptions);

%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNneg_ALL_foodlag_1_scenario_2';
bayesOptions.lowerBound = [0 0];
bayesOptions.upperBound = [0.5 0.05];
bayesOptions.parNames = {'turnover rate' 'decrease rate'};
%%
F = @(x) cAtmosZone(@c2pop,[1, x(1), x(2)],age,bc2,kind,dd,zone,@cDecreasingTurnover,0,1);
bayesOptimData = [c14 weight_cont_mass_14change_frombc0.^2];
[XMCMC2_weightsfrombc0, LMCMC2_weightsfrombc0, RMCMC2_weightsfrombc0] = bayesEstim(F,bayesOptimData,[0.1 0.01],[0.01 0.0001],bayesOptions);


%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNneg_ALL_foodlag_1_scenario_3';
bayesOptions.lowerBound = [0 0];
bayesOptions.upperBound = [0.5 0.05];
bayesOptions.parNames = {'turnover rate' 'decrease rate'};
%%
F = @(x) cAtmosZone(@c2pop,[1, x(1), x(2)],age,bc2,kind,dd,zone,@cDecreasingTurnover,0,2);
bayesOptimData = [c14 weight_cont_mass_14change_frombc0.^2];
[XMCMC3_weightsfrombc0, LMCMC3_weightsfrombc0, RMCMC3_weightsfrombc0] = bayesEstim(F,bayesOptimData,[0.1 0.01],[0.01 0.0001],bayesOptions);


%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNneg_ALL_foodlag_1_scenario_4';
bayesOptions.lowerBound = [0 0];
bayesOptions.upperBound = [0.5 70];
bayesOptions.parNames = {'turnover rate' 'years'};
%%
F = @(x) cAtmosZone(@c2pop,[1, x],age,bc2,kind,dd,zone,@cDecreasingTurnover,0,3);
bayesOptimData = [c14 weight_cont_mass_14change_frombc0.^2];
[XMCMC4_weightsfrombc0, LMCMC4_weightsfrombc0, RMCMC4_weightsfrombc0] = bayesEstim(F,bayesOptimData,[0.1 60],[0.01 20],bayesOptions);


%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNneg_ALL_foodlag_1_scenario_7';
bayesOptions.lowerBound = [0 0];
bayesOptions.upperBound = [0.5 70];
bayesOptions.parNames = {'turnover rate' 'halftime'};
%%
F = @(x) cAtmosZone(@c2pop,[1, x(1), x(2)],age,bc2,kind,dd,zone,@cAgeDeathInverse,0);
bayesOptimData = [c14 weight_cont_mass_14change_frombc0.^2];
[XMCMC7_weightsfrombc0, LMCMC7_weightsfrombc0, RMCMC7_weightsfrombc0] = bayesEstim(F,bayesOptimData,[0.1 60],[0.01 5],bayesOptions);

save('results/datasets/NeuNneg_ALL_foodlag_1')


%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNneg_ALL_foodlag_1_scenario_11';
bayesOptions.lowerBound = [0 0];
bayesOptions.upperBound = [1 0.2];
bayesOptions.parNames = {'renewal fraction', 'turnover rate'};
%%
F = @(x) cAtmosZone(@c2pop,x,age,bc2,kind,dd,zone,@cConstantTurnover,0);
bayesOptimData = [c14 weight_cont_mass_14change_frombc0.^2];
[XMCMC11_weightsfrombc0, LMCMC11_weightsfrombc0, RMCMC11_weightsfrombc0] = bayesEstim(F,bayesOptimData,[0.9 0.1],[0.5 0.01],bayesOptions);


%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNneg_ALL_foodlag_1_scenario_21';
bayesOptions.lowerBound = [0 0 0];
bayesOptions.upperBound = [1 0.5 0.05];
bayesOptions.parNames = {'renewal fraction' 'turnover rate' 'decrease rate'};
%%
F = @(x) cAtmosZone(@c2pop,[x(1), x(2), x(3)],age,bc2,kind,dd,zone,@cDecreasingTurnover,0,1);
bayesOptimData = [c14 weight_cont_mass_14change_frombc0.^2];
[XMCMC21_weightsfrombc0, LMCMC21_weightsfrombc0, RMCMC21_weightsfrombc0] = bayesEstim(F,bayesOptimData,[0.9 0.1 0.01],[0.3 0.01 0.0001],bayesOptions);


%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNneg_ALL_foodlag_1_scenario_31';
bayesOptions.lowerBound = [0 0 0];
bayesOptions.upperBound = [1 0.5 0.05];
bayesOptions.parNames = {'renewal fraction' 'turnover rate' 'decrease rate'};
%%
F = @(x) cAtmosZone(@c2pop,[x(1), x(2), x(3)],age,bc2,kind,dd,zone,@cDecreasingTurnover,0,2);
bayesOptimData = [c14 weight_cont_mass_14change_frombc0.^2];
[XMCMC31_weightsfrombc0, LMCMC31_weightsfrombc0, RMCMC31_weightsfrombc0] = bayesEstim(F,bayesOptimData,[0.9 0.1 0.01],[0.3 0.01 0.0001],bayesOptions);


%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNneg_ALL_foodlag_1_scenario_41';
bayesOptions.lowerBound = [0 0 0];
bayesOptions.upperBound = [1 0.5 70];
bayesOptions.parNames = {'renewal fraction' 'turnover rate' 'years'};
%%
F = @(x) cAtmosZone(@c2pop,[x(1), x(2), x(3)],age,bc2,kind,dd,zone,@cDecreasingTurnover,0,3);
bayesOptimData = [c14 weight_cont_mass_14change_frombc0.^2];
[XMCMC41_weightsfrombc0, LMCMC41_weightsfrombc0, RMCMC41_weightsfrombc0] = bayesEstim(F,bayesOptimData,[0.9 0.1 60],[0.3 0.01 20],bayesOptions);


%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNneg_ALL_foodlag_1_scenario_71';
bayesOptions.lowerBound = [0 0 0];
bayesOptions.upperBound = [1 1 70];
bayesOptions.parNames = {'renewal fraction' 'turnover rate' 'halftime'};
%%
F = @(x) cAtmosZone(@c2pop,[x(1), x(2), x(3)],age,bc2,kind,dd,zone,@cAgeDeathInverse,0);
bayesOptimData = [c14 weight_cont_mass_14change_frombc0.^2];
[XMCMC71_weightsfrombc0, LMCMC71_weightsfrombc0, RMCMC71_weightsfrombc0] = bayesEstim(F,bayesOptimData,[0.6 0.9 60],[0.1 0.01 5],bayesOptions);

%%
save('results/datasets/NeuNneg_ALL_foodlag_1')

%%
run('run_bestMCMC_prior_NeuNneg.m')
%%
save('results/datasets/NeuNneg_ALL_foodlag_1')

%%
clear

load('results/datasets/NeuNneg_ALL_foodlag_15')

%%
load('results/weights/weights_NeuNneg_ALL.mat')

%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNneg_ALL_foodlag_15_scenario_1';
bayesOptions.lowerBound = [0];
bayesOptions.upperBound = [0.5];
bayesOptions.parNames = {'turnover rate'};
%%
F = @(x) cAtmosZone(@c2pop,[1, x],age,bc2,kind,dd,zone,@cConstantTurnover,0);
bayesOptimData = [c14 weight_cont_mass_14change_frombc0.^2];
[XMCMC1_weightsfrombc0, LMCMC1_weightsfrombc0, RMCMC1_weightsfrombc0] = bayesEstim(F,bayesOptimData,0.1,0.01,bayesOptions);

%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNneg_ALL_foodlag_15_scenario_2';
bayesOptions.lowerBound = [0 0];
bayesOptions.upperBound = [0.5 0.05];
bayesOptions.parNames = {'turnover rate' 'decrease rate'};
%%
F = @(x) cAtmosZone(@c2pop,[1, x(1), x(2)],age,bc2,kind,dd,zone,@cDecreasingTurnover,0,1);
bayesOptimData = [c14 weight_cont_mass_14change_frombc0.^2];
[XMCMC2_weightsfrombc0, LMCMC2_weightsfrombc0, RMCMC2_weightsfrombc0] = bayesEstim(F,bayesOptimData,[0.1 0.01],[0.01 0.0001],bayesOptions);


%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNneg_ALL_foodlag_15_scenario_3';
bayesOptions.lowerBound = [0 0];
bayesOptions.upperBound = [0.5 0.05];
bayesOptions.parNames = {'turnover rate' 'decrease rate'};
%%
F = @(x) cAtmosZone(@c2pop,[1, x(1), x(2)],age,bc2,kind,dd,zone,@cDecreasingTurnover,0,2);
bayesOptimData = [c14 weight_cont_mass_14change_frombc0.^2];
[XMCMC3_weightsfrombc0, LMCMC3_weightsfrombc0, RMCMC3_weightsfrombc0] = bayesEstim(F,bayesOptimData,[0.1 0.01],[0.01 0.0001],bayesOptions);


%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNneg_ALL_foodlag_15_scenario_4';
bayesOptions.lowerBound = [0 0];
bayesOptions.upperBound = [0.5 70];
bayesOptions.parNames = {'turnover rate' 'years'};
%%
F = @(x) cAtmosZone(@c2pop,[1, x],age,bc2,kind,dd,zone,@cDecreasingTurnover,0,3);
bayesOptimData = [c14 weight_cont_mass_14change_frombc0.^2];
[XMCMC4_weightsfrombc0, LMCMC4_weightsfrombc0, RMCMC4_weightsfrombc0] = bayesEstim(F,bayesOptimData,[0.1 60],[0.01 20],bayesOptions);


%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNneg_ALL_foodlag_15_scenario_7';
bayesOptions.lowerBound = [0 0];
bayesOptions.upperBound = [0.5 70];
bayesOptions.parNames = {'turnover rate' 'halftime'};
%%
F = @(x) cAtmosZone(@c2pop,[1, x(1), x(2)],age,bc2,kind,dd,zone,@cAgeDeathInverse,0);
bayesOptimData = [c14 weight_cont_mass_14change_frombc0.^2];
[XMCMC7_weightsfrombc0, LMCMC7_weightsfrombc0, RMCMC7_weightsfrombc0] = bayesEstim(F,bayesOptimData,[0.1 60],[0.01 5],bayesOptions);
%%
save('results/datasets/NeuNneg_ALL_foodlag_15')


%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNneg_ALL_foodlag_15_scenario_11';
bayesOptions.lowerBound = [0 0];
bayesOptions.upperBound = [1 0.2];
bayesOptions.parNames = {'renewal fraction', 'turnover rate'};
%%
F = @(x) cAtmosZone(@c2pop,x,age,bc2,kind,dd,zone,@cConstantTurnover,0);
bayesOptimData = [c14 weight_cont_mass_14change_frombc0.^2];
[XMCMC11_weightsfrombc0, LMCMC11_weightsfrombc0, RMCMC11_weightsfrombc0] = bayesEstim(F,bayesOptimData,[0.9 0.1],[0.5 0.01],bayesOptions);


%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNneg_ALL_foodlag_15_scenario_21';
bayesOptions.lowerBound = [0 0 0];
bayesOptions.upperBound = [1 0.5 0.05];
bayesOptions.parNames = {'renewal fraction' 'turnover rate' 'decrease rate'};
%%
F = @(x) cAtmosZone(@c2pop,[x(1), x(2), x(3)],age,bc2,kind,dd,zone,@cDecreasingTurnover,0,1);
bayesOptimData = [c14 weight_cont_mass_14change_frombc0.^2];
[XMCMC21_weightsfrombc0, LMCMC21_weightsfrombc0, RMCMC21_weightsfrombc0] = bayesEstim(F,bayesOptimData,[0.9 0.1 0.01],[0.3 0.01 0.0001],bayesOptions);


%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNneg_ALL_foodlag_15_scenario_31';
bayesOptions.lowerBound = [0 0 0];
bayesOptions.upperBound = [1 0.5 0.05];
bayesOptions.parNames = {'renewal fraction' 'turnover rate' 'decrease rate'};
%%
F = @(x) cAtmosZone(@c2pop,[x(1), x(2), x(3)],age,bc2,kind,dd,zone,@cDecreasingTurnover,0,2);
bayesOptimData = [c14 weight_cont_mass_14change_frombc0.^2];
[XMCMC31_weightsfrombc0, LMCMC31_weightsfrombc0, RMCMC31_weightsfrombc0] = bayesEstim(F,bayesOptimData,[0.9 0.1 0.01],[0.3 0.01 0.0001],bayesOptions);


%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNneg_ALL_foodlag_15_scenario_41';
bayesOptions.lowerBound = [0 0 0];
bayesOptions.upperBound = [1 0.5 70];
bayesOptions.parNames = {'renewal fraction' 'turnover rate' 'years'};
%%
F = @(x) cAtmosZone(@c2pop,[x(1), x(2), x(3)],age,bc2,kind,dd,zone,@cDecreasingTurnover,0,3);
bayesOptimData = [c14 weight_cont_mass_14change_frombc0.^2];
[XMCMC41_weightsfrombc0, LMCMC41_weightsfrombc0, RMCMC41_weightsfrombc0] = bayesEstim(F,bayesOptimData,[0.9 0.1 60],[0.3 0.01 20],bayesOptions);


%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNneg_ALL_foodlag_15_scenario_71';
bayesOptions.lowerBound = [0 0 0];
bayesOptions.upperBound = [1 1 70];
bayesOptions.parNames = {'renewal fraction' 'turnover rate' 'halftime'};
%%
F = @(x) cAtmosZone(@c2pop,[x(1), x(2), x(3)],age,bc2,kind,dd,zone,@cAgeDeathInverse,0);
bayesOptimData = [c14 weight_cont_mass_14change_frombc0.^2];
[XMCMC71_weightsfrombc0, LMCMC71_weightsfrombc0, RMCMC71_weightsfrombc0] = bayesEstim(F,bayesOptimData,[0.6 0.9 60],[0.1 0.01 5],bayesOptions);


save('results/datasets/NeuNneg_ALL_foodlag_15')

%%
run('run_bestMCMC_prior_NeuNneg.m')

%%
save('results/datasets/NeuNneg_ALL_foodlag_15')

%%
clear

load('results/datasets/NeuNneg_ALL_foodlag_2')

%%
load('results/weights/weights_NeuNneg_ALL.mat')


%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNneg_ALL_foodlag_2_scenario_1';
bayesOptions.lowerBound = [0];
bayesOptions.upperBound = [0.5];
bayesOptions.parNames = {'turnover rate'};
%%
F = @(x) cAtmosZone(@c2pop,[1, x],age,bc2,kind,dd,zone,@cConstantTurnover,0);
bayesOptimData = [c14 weight_cont_mass_14change_frombc0.^2];
[XMCMC1_weightsfrombc0, LMCMC1_weightsfrombc0, RMCMC1_weightsfrombc0] = bayesEstim(F,bayesOptimData,0.1,0.01,bayesOptions);

%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNneg_ALL_foodlag_2_scenario_2';
bayesOptions.lowerBound = [0 0];
bayesOptions.upperBound = [0.5 0.05];
bayesOptions.parNames = {'turnover rate' 'decrease rate'};
%%
F = @(x) cAtmosZone(@c2pop,[1, x(1), x(2)],age,bc2,kind,dd,zone,@cDecreasingTurnover,0,1);
bayesOptimData = [c14 weight_cont_mass_14change_frombc0.^2];
[XMCMC2_weightsfrombc0, LMCMC2_weightsfrombc0, RMCMC2_weightsfrombc0] = bayesEstim(F,bayesOptimData,[0.1 0.01],[0.01 0.0001],bayesOptions);


%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNneg_ALL_foodlag_2_scenario_3';
bayesOptions.lowerBound = [0 0];
bayesOptions.upperBound = [0.5 0.05];
bayesOptions.parNames = {'turnover rate' 'decrease rate'};
%%
F = @(x) cAtmosZone(@c2pop,[1, x(1), x(2)],age,bc2,kind,dd,zone,@cDecreasingTurnover,0,2);
bayesOptimData = [c14 weight_cont_mass_14change_frombc0.^2];
[XMCMC3_weightsfrombc0, LMCMC3_weightsfrombc0, RMCMC3_weightsfrombc0] = bayesEstim(F,bayesOptimData,[0.1 0.01],[0.01 0.0001],bayesOptions);


%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNneg_ALL_foodlag_2_scenario_4';
bayesOptions.lowerBound = [0 0];
bayesOptions.upperBound = [0.5 70];
bayesOptions.parNames = {'turnover rate' 'years'};
%%
F = @(x) cAtmosZone(@c2pop,[1, x],age,bc2,kind,dd,zone,@cDecreasingTurnover,0,3);
bayesOptimData = [c14 weight_cont_mass_14change_frombc0.^2];
[XMCMC4_weightsfrombc0, LMCMC4_weightsfrombc0, RMCMC4_weightsfrombc0] = bayesEstim(F,bayesOptimData,[0.1 60],[0.01 20],bayesOptions);


%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNneg_ALL_foodlag_2_scenario_7';
bayesOptions.lowerBound = [0 0];
bayesOptions.upperBound = [0.5 70];
bayesOptions.parNames = {'turnover rate' 'halftime'};
%%
F = @(x) cAtmosZone(@c2pop,[1, x(1), x(2)],age,bc2,kind,dd,zone,@cAgeDeathInverse,0);
bayesOptimData = [c14 weight_cont_mass_14change_frombc0.^2];
[XMCMC7_weightsfrombc0, LMCMC7_weightsfrombc0, RMCMC7_weightsfrombc0] = bayesEstim(F,bayesOptimData,[0.1 60],[0.01 5],bayesOptions);
%%
save('results/datasets/NeuNneg_ALL_foodlag_2')


%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNneg_ALL_foodlag_2_scenario_11';
bayesOptions.lowerBound = [0 0];
bayesOptions.upperBound = [1 0.2];
bayesOptions.parNames = {'renewal fraction', 'turnover rate'};
%%
F = @(x) cAtmosZone(@c2pop,x,age,bc2,kind,dd,zone,@cConstantTurnover,0);
bayesOptimData = [c14 weight_cont_mass_14change_frombc0.^2];
[XMCMC11_weightsfrombc0, LMCMC11_weightsfrombc0, RMCMC11_weightsfrombc0] = bayesEstim(F,bayesOptimData,[0.9 0.1],[0.5 0.01],bayesOptions);


%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNneg_ALL_foodlag_2_scenario_21';
bayesOptions.lowerBound = [0 0 0];
bayesOptions.upperBound = [1 0.5 0.05];
bayesOptions.parNames = {'renewal fraction' 'turnover rate' 'decrease rate'};
%%
F = @(x) cAtmosZone(@c2pop,[x(1), x(2), x(3)],age,bc2,kind,dd,zone,@cDecreasingTurnover,0,1);
bayesOptimData = [c14 weight_cont_mass_14change_frombc0.^2];
[XMCMC21_weightsfrombc0, LMCMC21_weightsfrombc0, RMCMC21_weightsfrombc0] = bayesEstim(F,bayesOptimData,[0.9 0.1 0.01],[0.3 0.01 0.0001],bayesOptions);


%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNneg_ALL_foodlag_2_scenario_31';
bayesOptions.lowerBound = [0 0 0];
bayesOptions.upperBound = [1 0.5 0.05];
bayesOptions.parNames = {'renewal fraction' 'turnover rate' 'decrease rate'};
%%
F = @(x) cAtmosZone(@c2pop,[x(1), x(2), x(3)],age,bc2,kind,dd,zone,@cDecreasingTurnover,0,2);
bayesOptimData = [c14 weight_cont_mass_14change_frombc0.^2];
[XMCMC31_weightsfrombc0, LMCMC31_weightsfrombc0, RMCMC31_weightsfrombc0] = bayesEstim(F,bayesOptimData,[0.9 0.1 0.01],[0.3 0.01 0.0001],bayesOptions);


%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNneg_ALL_foodlag_2_scenario_41';
bayesOptions.lowerBound = [0 0 0];
bayesOptions.upperBound = [1 0.5 70];
bayesOptions.parNames = {'renewal fraction' 'turnover rate' 'years'};
%%
F = @(x) cAtmosZone(@c2pop,[x(1), x(2), x(3)],age,bc2,kind,dd,zone,@cDecreasingTurnover,0,3);
bayesOptimData = [c14 weight_cont_mass_14change_frombc0.^2];
[XMCMC41_weightsfrombc0, LMCMC41_weightsfrombc0, RMCMC41_weightsfrombc0] = bayesEstim(F,bayesOptimData,[0.9 0.1 60],[0.3 0.01 20],bayesOptions);


%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNneg_ALL_foodlag_2_scenario_71';
bayesOptions.lowerBound = [0 0 0];
bayesOptions.upperBound = [1 1 70];
bayesOptions.parNames = {'renewal fraction' 'turnover rate' 'halftime'};
%%
F = @(x) cAtmosZone(@c2pop,[x(1), x(2), x(3)],age,bc2,kind,dd,zone,@cAgeDeathInverse,0);
bayesOptimData = [c14 weight_cont_mass_14change_frombc0.^2];
[XMCMC71_weightsfrombc0, LMCMC71_weightsfrombc0, RMCMC71_weightsfrombc0] = bayesEstim(F,bayesOptimData,[0.6 0.9 60],[0.1 0.01 5],bayesOptions);


save('results/datasets/NeuNneg_ALL_foodlag_2')

%%
run('run_bestMCMC_prior_NeuNneg.m')

%%
save('results/datasets/NeuNneg_ALL_foodlag_2')

%%

