

%%
clear
load('results/datasets/NeuNpos_RDD_foodlag_0')


%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNpos_RDD_foodlag_0_scenario_1';
bayesOptions.lowerBound = [0];
bayesOptions.upperBound = [0.5];
bayesOptions.parNames = {'turnover rate'};
%%
F = @(x) cAtmosZone(@c2pop,[1, x],age,bc2,kind,dd,zone,@cConstantTurnover,0);
bayesOptimData = [c14 weight_cont_mass_14change_frombc1.^2];
[XMCMC1_weightsfrombc1, LMCMC1_weightsfrombc1, RMCMC1_weightsfrombc1] = bayesEstim(F,bayesOptimData,0.1,0.01,bayesOptions);

%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNpos_RDD_foodlag_0_scenario_2';
bayesOptions.lowerBound = [0 0];
bayesOptions.upperBound = [0.5 0.05];
bayesOptions.parNames = {'turnover rate' 'decrease rate'};
%%
F = @(x) cAtmosZone(@c2pop,[1, x(1), x(2)],age,bc2,kind,dd,zone,@cDecreasingTurnover,0,1);
bayesOptimData = [c14 weight_cont_mass_14change_frombc1.^2];
[XMCMC2_weightsfrombc1, LMCMC2_weightsfrombc1, RMCMC2_weightsfrombc1] = bayesEstim(F,bayesOptimData,[0.1 0.01],[0.01 0.0001],bayesOptions);


%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNpos_RDD_foodlag_0_scenario_3';
bayesOptions.lowerBound = [0 0];
bayesOptions.upperBound = [0.5 0.05];
bayesOptions.parNames = {'turnover rate' 'decrease rate'};
%%
F = @(x) cAtmosZone(@c2pop,[1, x(1), x(2)],age,bc2,kind,dd,zone,@cDecreasingTurnover,0,2);
bayesOptimData = [c14 weight_cont_mass_14change_frombc1.^2];
[XMCMC3_weightsfrombc1, LMCMC3_weightsfrombc1, RMCMC3_weightsfrombc1] = bayesEstim(F,bayesOptimData,[0.1 0.01],[0.01 0.0001],bayesOptions);


%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNpos_RDD_foodlag_0_scenario_4';
bayesOptions.lowerBound = [0 0];
bayesOptions.upperBound = [0.5 70];
bayesOptions.parNames = {'turnover rate' 'years'};
%%
F = @(x) cAtmosZone(@c2pop,[1, x],age,bc2,kind,dd,zone,@cDecreasingTurnover,0,3);
bayesOptimData = [c14 weight_cont_mass_14change_frombc1.^2];
[XMCMC4_weightsfrombc1, LMCMC4_weightsfrombc1, RMCMC4_weightsfrombc1] = bayesEstim(F,bayesOptimData,[0.1 60],[0.01 20],bayesOptions);


save('results/datasets/NeuNpos_RDD_foodlag_0')
%%
clear
load('results/datasets/NeuNpos_RDD_foodlag_0')

%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNpos_RDD_foodlag_0_scenario_11';
bayesOptions.lowerBound = [0 0];
bayesOptions.upperBound = [1 0.2];
bayesOptions.parNames = {'renewal fraction', 'turnover rate'};
%%
F = @(x) cAtmosZone(@c2pop,x,age,bc2,kind,dd,zone,@cConstantTurnover,0);
bayesOptimData = [c14 weight_cont_mass_14change_frombc1.^2];
[XMCMC11_weightsfrombc1, LMCMC11_weightsfrombc1, RMCMC11_weightsfrombc1] = bayesEstim(F,bayesOptimData,[0.9 0.1],[0.5 0.01],bayesOptions);


%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNpos_RDD_foodlag_0_scenario_21';
bayesOptions.lowerBound = [0 0 0];
bayesOptions.upperBound = [1 0.5 0.05];
bayesOptions.parNames = {'renewal fraction' 'turnover rate' 'decrease rate'};
%%
F = @(x) cAtmosZone(@c2pop,[x(1), x(2), x(3)],age,bc2,kind,dd,zone,@cDecreasingTurnover,0,1);
bayesOptimData = [c14 weight_cont_mass_14change_frombc1.^2];
[XMCMC21_weightsfrombc1, LMCMC21_weightsfrombc1, RMCMC21_weightsfrombc1] = bayesEstim(F,bayesOptimData,[0.9 0.1 0.01],[0.3 0.01 0.0001],bayesOptions);


%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNpos_RDD_foodlag_0_scenario_31';
bayesOptions.lowerBound = [0 0 0];
bayesOptions.upperBound = [1 0.5 0.05];
bayesOptions.parNames = {'renewal fraction' 'turnover rate' 'decrease rate'};
%%
F = @(x) cAtmosZone(@c2pop,[x(1), x(2), x(3)],age,bc2,kind,dd,zone,@cDecreasingTurnover,0,2);
bayesOptimData = [c14 weight_cont_mass_14change_frombc1.^2];
[XMCMC31_weightsfrombc1, LMCMC31_weightsfrombc1, RMCMC31_weightsfrombc1] = bayesEstim(F,bayesOptimData,[0.9 0.1 0.01],[0.3 0.01 0.0001],bayesOptions);


%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNpos_RDD_foodlag_0_scenario_41';
bayesOptions.lowerBound = [0 0 0];
bayesOptions.upperBound = [1 0.5 70];
bayesOptions.parNames = {'renewal fraction' 'turnover rate' 'years'};
%%
F = @(x) cAtmosZone(@c2pop,[x(1), x(2), x(3)],age,bc2,kind,dd,zone,@cDecreasingTurnover,0,3);
bayesOptimData = [c14 weight_cont_mass_14change_frombc1.^2];
[XMCMC41_weightsfrombc1, LMCMC41_weightsfrombc1, RMCMC41_weightsfrombc1] = bayesEstim(F,bayesOptimData,[0.9 0.1 60],[0.3 0.01 20],bayesOptions);

%%
save('results/datasets/NeuNpos_RDD_foodlag_0')

%%

%
clear
load('results/datasets/NeuNpos_RDD_foodlag_05')
%%
% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNpos_RDD_foodlag_05_scenario_1';
bayesOptions.lowerBound = [0];
bayesOptions.upperBound = [0.5];
bayesOptions.parNames = {'turnover rate'};
%
F = @(x) cAtmosZone(@c2pop,[1, x],age,bc2,kind,dd,zone,@cConstantTurnover,0);
bayesOptimData = [c14 weight_cont_mass_14change_frombc1.^2];
[XMCMC1_weightsfrombc1, LMCMC1_weightsfrombc1, RMCMC1_weightsfrombc1] = bayesEstim(F,bayesOptimData,0.1,0.01,bayesOptions);

% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNpos_RDD_foodlag_05_scenario_2';
bayesOptions.lowerBound = [0 0];
bayesOptions.upperBound = [0.5 0.05];
bayesOptions.parNames = {'turnover rate' 'decrease rate'};
%
F = @(x) cAtmosZone(@c2pop,[1, x(1), x(2)],age,bc2,kind,dd,zone,@cDecreasingTurnover,0,1);
bayesOptimData = [c14 weight_cont_mass_14change_frombc1.^2];
[XMCMC2_weightsfrombc1, LMCMC2_weightsfrombc1, RMCMC2_weightsfrombc1] = bayesEstim(F,bayesOptimData,[0.1 0.01],[0.01 0.0001],bayesOptions);


% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNpos_RDD_foodlag_05_scenario_3';
bayesOptions.lowerBound = [0 0];
bayesOptions.upperBound = [0.5 0.05];
bayesOptions.parNames = {'turnover rate' 'decrease rate'};
%
F = @(x) cAtmosZone(@c2pop,[1, x(1), x(2)],age,bc2,kind,dd,zone,@cDecreasingTurnover,0,2);
bayesOptimData = [c14 weight_cont_mass_14change_frombc1.^2];
[XMCMC3_weightsfrombc1, LMCMC3_weightsfrombc1, RMCMC3_weightsfrombc1] = bayesEstim(F,bayesOptimData,[0.1 0.01],[0.01 0.0001],bayesOptions);


% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNpos_RDD_foodlag_05_scenario_4';
bayesOptions.lowerBound = [0 0];
bayesOptions.upperBound = [0.5 70];
bayesOptions.parNames = {'turnover rate' 'years'};
%
F = @(x) cAtmosZone(@c2pop,[1, x],age,bc2,kind,dd,zone,@cDecreasingTurnover,0,3);
bayesOptimData = [c14 weight_cont_mass_14change_frombc1.^2];
[XMCMC4_weightsfrombc1, LMCMC4_weightsfrombc1, RMCMC4_weightsfrombc1] = bayesEstim(F,bayesOptimData,[0.1 60],[0.01 20],bayesOptions);


save('results/datasets/NeuNpos_RDD_foodlag_05')
%%
clear
load('results/datasets/NeuNpos_RDD_foodlag_05')

% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNpos_RDD_foodlag_05_scenario_11';
bayesOptions.lowerBound = [0 0];
bayesOptions.upperBound = [1 0.2];
bayesOptions.parNames = {'renewal fraction', 'turnover rate'};
%
F = @(x) cAtmosZone(@c2pop,x,age,bc2,kind,dd,zone,@cConstantTurnover,0);
bayesOptimData = [c14 weight_cont_mass_14change_frombc1.^2];
[XMCMC11_weightsfrombc1, LMCMC11_weightsfrombc1, RMCMC11_weightsfrombc1] = bayesEstim(F,bayesOptimData,[0.9 0.1],[0.5 0.01],bayesOptions);


% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNpos_RDD_foodlag_05_scenario_21';
bayesOptions.lowerBound = [0 0 0];
bayesOptions.upperBound = [1 0.5 0.05];
bayesOptions.parNames = {'renewal fraction' 'turnover rate' 'decrease rate'};
%
F = @(x) cAtmosZone(@c2pop,[x(1), x(2), x(3)],age,bc2,kind,dd,zone,@cDecreasingTurnover,0,1);
bayesOptimData = [c14 weight_cont_mass_14change_frombc1.^2];
[XMCMC21_weightsfrombc1, LMCMC21_weightsfrombc1, RMCMC21_weightsfrombc1] = bayesEstim(F,bayesOptimData,[0.9 0.1 0.01],[0.3 0.01 0.0001],bayesOptions);


% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNpos_RDD_foodlag_05_scenario_31';
bayesOptions.lowerBound = [0 0 0];
bayesOptions.upperBound = [1 0.5 0.05];
bayesOptions.parNames = {'renewal fraction' 'turnover rate' 'decrease rate'};
%
F = @(x) cAtmosZone(@c2pop,[x(1), x(2), x(3)],age,bc2,kind,dd,zone,@cDecreasingTurnover,0,2);
bayesOptimData = [c14 weight_cont_mass_14change_frombc1.^2];
[XMCMC31_weightsfrombc1, LMCMC31_weightsfrombc1, RMCMC31_weightsfrombc1] = bayesEstim(F,bayesOptimData,[0.9 0.1 0.01],[0.3 0.01 0.0001],bayesOptions);


% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNpos_RDD_foodlag_05_scenario_41';
bayesOptions.lowerBound = [0 0 0];
bayesOptions.upperBound = [1 0.5 70];
bayesOptions.parNames = {'renewal fraction' 'turnover rate' 'years'};
%
F = @(x) cAtmosZone(@c2pop,[x(1), x(2), x(3)],age,bc2,kind,dd,zone,@cDecreasingTurnover,0,3);
bayesOptimData = [c14 weight_cont_mass_14change_frombc1.^2];
[XMCMC41_weightsfrombc1, LMCMC41_weightsfrombc1, RMCMC41_weightsfrombc1] = bayesEstim(F,bayesOptimData,[0.9 0.1 60],[0.3 0.01 20],bayesOptions);

%
save('results/datasets/NeuNpos_RDD_foodlag_05')



%%

clear
load('results/datasets/NeuNpos_RDD_foodlag_1')

%%
% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNpos_RDD_foodlag_1_scenario_1';
bayesOptions.lowerBound = [0];
bayesOptions.upperBound = [0.5];
bayesOptions.parNames = {'turnover rate'};
%
F = @(x) cAtmosZone(@c2pop,[1, x],age,bc2,kind,dd,zone,@cConstantTurnover,0);
bayesOptimData = [c14 weight_cont_mass_14change_frombc1.^2];
[XMCMC1_weightsfrombc1, LMCMC1_weightsfrombc1, RMCMC1_weightsfrombc1] = bayesEstim(F,bayesOptimData,0.1,0.01,bayesOptions);

% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNpos_RDD_foodlag_1_scenario_2';
bayesOptions.lowerBound = [0 0];
bayesOptions.upperBound = [0.5 0.05];
bayesOptions.parNames = {'turnover rate' 'decrease rate'};
%
F = @(x) cAtmosZone(@c2pop,[1, x(1), x(2)],age,bc2,kind,dd,zone,@cDecreasingTurnover,0,1);
bayesOptimData = [c14 weight_cont_mass_14change_frombc1.^2];
[XMCMC2_weightsfrombc1, LMCMC2_weightsfrombc1, RMCMC2_weightsfrombc1] = bayesEstim(F,bayesOptimData,[0.1 0.01],[0.01 0.0001],bayesOptions);


% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNpos_RDD_foodlag_1_scenario_3';
bayesOptions.lowerBound = [0 0];
bayesOptions.upperBound = [0.5 0.05];
bayesOptions.parNames = {'turnover rate' 'decrease rate'};
%
F = @(x) cAtmosZone(@c2pop,[1, x(1), x(2)],age,bc2,kind,dd,zone,@cDecreasingTurnover,0,2);
bayesOptimData = [c14 weight_cont_mass_14change_frombc1.^2];
[XMCMC3_weightsfrombc1, LMCMC3_weightsfrombc1, RMCMC3_weightsfrombc1] = bayesEstim(F,bayesOptimData,[0.1 0.01],[0.01 0.0001],bayesOptions);


% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNpos_RDD_foodlag_1_scenario_4';
bayesOptions.lowerBound = [0 0];
bayesOptions.upperBound = [0.5 70];
bayesOptions.parNames = {'turnover rate' 'years'};
%
F = @(x) cAtmosZone(@c2pop,[1, x],age,bc2,kind,dd,zone,@cDecreasingTurnover,0,3);
bayesOptimData = [c14 weight_cont_mass_14change_frombc1.^2];
[XMCMC4_weightsfrombc1, LMCMC4_weightsfrombc1, RMCMC4_weightsfrombc1] = bayesEstim(F,bayesOptimData,[0.1 60],[0.01 20],bayesOptions);


save('results/datasets/NeuNpos_RDD_foodlag_1')
%%
clear
load('results/datasets/NeuNpos_RDD_foodlag_1')

% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNpos_RDD_foodlag_1_scenario_11';
bayesOptions.lowerBound = [0 0];
bayesOptions.upperBound = [1 0.2];
bayesOptions.parNames = {'renewal fraction', 'turnover rate'};
%
F = @(x) cAtmosZone(@c2pop,x,age,bc2,kind,dd,zone,@cConstantTurnover,0);
bayesOptimData = [c14 weight_cont_mass_14change_frombc1.^2];
[XMCMC11_weightsfrombc1, LMCMC11_weightsfrombc1, RMCMC11_weightsfrombc1] = bayesEstim(F,bayesOptimData,[0.9 0.1],[0.5 0.01],bayesOptions);


% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNpos_RDD_foodlag_1_scenario_21';
bayesOptions.lowerBound = [0 0 0];
bayesOptions.upperBound = [1 0.5 0.05];
bayesOptions.parNames = {'renewal fraction' 'turnover rate' 'decrease rate'};
%
F = @(x) cAtmosZone(@c2pop,[x(1), x(2), x(3)],age,bc2,kind,dd,zone,@cDecreasingTurnover,0,1);
bayesOptimData = [c14 weight_cont_mass_14change_frombc1.^2];
[XMCMC21_weightsfrombc1, LMCMC21_weightsfrombc1, RMCMC21_weightsfrombc1] = bayesEstim(F,bayesOptimData,[0.9 0.1 0.01],[0.3 0.01 0.0001],bayesOptions);


% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNpos_RDD_foodlag_1_scenario_31';
bayesOptions.lowerBound = [0 0 0];
bayesOptions.upperBound = [1 0.5 0.05];
bayesOptions.parNames = {'renewal fraction' 'turnover rate' 'decrease rate'};
%
F = @(x) cAtmosZone(@c2pop,[x(1), x(2), x(3)],age,bc2,kind,dd,zone,@cDecreasingTurnover,0,2);
bayesOptimData = [c14 weight_cont_mass_14change_frombc1.^2];
[XMCMC31_weightsfrombc1, LMCMC31_weightsfrombc1, RMCMC31_weightsfrombc1] = bayesEstim(F,bayesOptimData,[0.9 0.1 0.01],[0.3 0.01 0.0001],bayesOptions);


% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNpos_RDD_foodlag_1_scenario_41';
bayesOptions.lowerBound = [0 0 0];
bayesOptions.upperBound = [1 0.5 70];
bayesOptions.parNames = {'renewal fraction' 'turnover rate' 'years'};
%
F = @(x) cAtmosZone(@c2pop,[x(1), x(2), x(3)],age,bc2,kind,dd,zone,@cDecreasingTurnover,0,3);
bayesOptimData = [c14 weight_cont_mass_14change_frombc1.^2];
[XMCMC41_weightsfrombc1, LMCMC41_weightsfrombc1, RMCMC41_weightsfrombc1] = bayesEstim(F,bayesOptimData,[0.9 0.1 60],[0.3 0.01 20],bayesOptions);

%
save('results/datasets/NeuNpos_RDD_foodlag_1')


%%

clear
load('results/datasets/NeuNpos_RDD_foodlag_15')

% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNpos_RDD_foodlag_15_scenario_1';
bayesOptions.lowerBound = [0];
bayesOptions.upperBound = [0.5];
bayesOptions.parNames = {'turnover rate'};
%
F = @(x) cAtmosZone(@c2pop,[1, x],age,bc2,kind,dd,zone,@cConstantTurnover,0);
bayesOptimData = [c14 weight_cont_mass_14change_frombc1.^2];
[XMCMC1_weightsfrombc1, LMCMC1_weightsfrombc1, RMCMC1_weightsfrombc1] = bayesEstim(F,bayesOptimData,0.1,0.01,bayesOptions);

% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNpos_RDD_foodlag_15_scenario_2';
bayesOptions.lowerBound = [0 0];
bayesOptions.upperBound = [0.5 0.05];
bayesOptions.parNames = {'turnover rate' 'decrease rate'};
%
F = @(x) cAtmosZone(@c2pop,[1, x(1), x(2)],age,bc2,kind,dd,zone,@cDecreasingTurnover,0,1);
bayesOptimData = [c14 weight_cont_mass_14change_frombc1.^2];
[XMCMC2_weightsfrombc1, LMCMC2_weightsfrombc1, RMCMC2_weightsfrombc1] = bayesEstim(F,bayesOptimData,[0.1 0.01],[0.01 0.0001],bayesOptions);


% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNpos_RDD_foodlag_15_scenario_3';
bayesOptions.lowerBound = [0 0];
bayesOptions.upperBound = [0.5 0.05];
bayesOptions.parNames = {'turnover rate' 'decrease rate'};
%
F = @(x) cAtmosZone(@c2pop,[1, x(1), x(2)],age,bc2,kind,dd,zone,@cDecreasingTurnover,0,2);
bayesOptimData = [c14 weight_cont_mass_14change_frombc1.^2];
[XMCMC3_weightsfrombc1, LMCMC3_weightsfrombc1, RMCMC3_weightsfrombc1] = bayesEstim(F,bayesOptimData,[0.1 0.01],[0.01 0.0001],bayesOptions);


% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNpos_RDD_foodlag_15_scenario_4';
bayesOptions.lowerBound = [0 0];
bayesOptions.upperBound = [0.5 70];
bayesOptions.parNames = {'turnover rate' 'years'};
%
F = @(x) cAtmosZone(@c2pop,[1, x],age,bc2,kind,dd,zone,@cDecreasingTurnover,0,3);
bayesOptimData = [c14 weight_cont_mass_14change_frombc1.^2];
[XMCMC4_weightsfrombc1, LMCMC4_weightsfrombc1, RMCMC4_weightsfrombc1] = bayesEstim(F,bayesOptimData,[0.1 60],[0.01 20],bayesOptions);


save('results/datasets/NeuNpos_RDD_foodlag_15')
%%

clear
load('results/datasets/NeuNpos_RDD_foodlag_15')

% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNpos_RDD_foodlag_15_scenario_11';
bayesOptions.lowerBound = [0 0];
bayesOptions.upperBound = [1 0.2];
bayesOptions.parNames = {'renewal fraction', 'turnover rate'};
%
F = @(x) cAtmosZone(@c2pop,x,age,bc2,kind,dd,zone,@cConstantTurnover,0);
bayesOptimData = [c14 weight_cont_mass_14change_frombc1.^2];
[XMCMC11_weightsfrombc1, LMCMC11_weightsfrombc1, RMCMC11_weightsfrombc1] = bayesEstim(F,bayesOptimData,[0.9 0.1],[0.5 0.01],bayesOptions);


% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNpos_RDD_foodlag_15_scenario_21';
bayesOptions.lowerBound = [0 0 0];
bayesOptions.upperBound = [1 0.5 0.05];
bayesOptions.parNames = {'renewal fraction' 'turnover rate' 'decrease rate'};
%
F = @(x) cAtmosZone(@c2pop,[x(1), x(2), x(3)],age,bc2,kind,dd,zone,@cDecreasingTurnover,0,1);
bayesOptimData = [c14 weight_cont_mass_14change_frombc1.^2];
[XMCMC21_weightsfrombc1, LMCMC21_weightsfrombc1, RMCMC21_weightsfrombc1] = bayesEstim(F,bayesOptimData,[0.9 0.1 0.01],[0.3 0.01 0.0001],bayesOptions);


% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNpos_RDD_foodlag_15_scenario_31';
bayesOptions.lowerBound = [0 0 0];
bayesOptions.upperBound = [1 0.5 0.05];
bayesOptions.parNames = {'renewal fraction' 'turnover rate' 'decrease rate'};
%
F = @(x) cAtmosZone(@c2pop,[x(1), x(2), x(3)],age,bc2,kind,dd,zone,@cDecreasingTurnover,0,2);
bayesOptimData = [c14 weight_cont_mass_14change_frombc1.^2];
[XMCMC31_weightsfrombc1, LMCMC31_weightsfrombc1, RMCMC31_weightsfrombc1] = bayesEstim(F,bayesOptimData,[0.9 0.1 0.01],[0.3 0.01 0.0001],bayesOptions);


% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNpos_RDD_foodlag_15_scenario_41';
bayesOptions.lowerBound = [0 0 0];
bayesOptions.upperBound = [1 0.5 70];
bayesOptions.parNames = {'renewal fraction' 'turnover rate' 'years'};
%
F = @(x) cAtmosZone(@c2pop,[x(1), x(2), x(3)],age,bc2,kind,dd,zone,@cDecreasingTurnover,0,3);
bayesOptimData = [c14 weight_cont_mass_14change_frombc1.^2];
[XMCMC41_weightsfrombc1, LMCMC41_weightsfrombc1, RMCMC41_weightsfrombc1] = bayesEstim(F,bayesOptimData,[0.9 0.1 60],[0.3 0.01 20],bayesOptions);


%
save('results/datasets/NeuNpos_RDD_foodlag_15')


%%

clear
load('results/datasets/NeuNpos_RDD_foodlag_2')

% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNpos_RDD_foodlag_2_scenario_1';
bayesOptions.lowerBound = [0];
bayesOptions.upperBound = [0.5];
bayesOptions.parNames = {'turnover rate'};
%
F = @(x) cAtmosZone(@c2pop,[1, x],age,bc2,kind,dd,zone,@cConstantTurnover,0);
bayesOptimData = [c14 weight_cont_mass_14change_frombc1.^2];
[XMCMC1_weightsfrombc1, LMCMC1_weightsfrombc1, RMCMC1_weightsfrombc1] = bayesEstim(F,bayesOptimData,0.1,0.01,bayesOptions);

% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNpos_RDD_foodlag_2_scenario_2';
bayesOptions.lowerBound = [0 0];
bayesOptions.upperBound = [0.5 0.05];
bayesOptions.parNames = {'turnover rate' 'decrease rate'};
%
F = @(x) cAtmosZone(@c2pop,[1, x(1), x(2)],age,bc2,kind,dd,zone,@cDecreasingTurnover,0,1);
bayesOptimData = [c14 weight_cont_mass_14change_frombc1.^2];
[XMCMC2_weightsfrombc1, LMCMC2_weightsfrombc1, RMCMC2_weightsfrombc1] = bayesEstim(F,bayesOptimData,[0.1 0.01],[0.01 0.0001],bayesOptions);


% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNpos_RDD_foodlag_2_scenario_3';
bayesOptions.lowerBound = [0 0];
bayesOptions.upperBound = [0.5 0.05];
bayesOptions.parNames = {'turnover rate' 'decrease rate'};
%
F = @(x) cAtmosZone(@c2pop,[1, x(1), x(2)],age,bc2,kind,dd,zone,@cDecreasingTurnover,0,2);
bayesOptimData = [c14 weight_cont_mass_14change_frombc1.^2];
[XMCMC3_weightsfrombc1, LMCMC3_weightsfrombc1, RMCMC3_weightsfrombc1] = bayesEstim(F,bayesOptimData,[0.1 0.01],[0.01 0.0001],bayesOptions);


% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNpos_RDD_foodlag_2_scenario_4';
bayesOptions.lowerBound = [0 0];
bayesOptions.upperBound = [0.5 70];
bayesOptions.parNames = {'turnover rate' 'years'};
%
F = @(x) cAtmosZone(@c2pop,[1, x],age,bc2,kind,dd,zone,@cDecreasingTurnover,0,3);
bayesOptimData = [c14 weight_cont_mass_14change_frombc1.^2];
[XMCMC4_weightsfrombc1, LMCMC4_weightsfrombc1, RMCMC4_weightsfrombc1] = bayesEstim(F,bayesOptimData,[0.1 60],[0.01 20],bayesOptions);


save('results/datasets/NeuNpos_RDD_foodlag_2')
%%
clear
load('results/datasets/NeuNpos_RDD_foodlag_2')

% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNpos_RDD_foodlag_2_scenario_11';
bayesOptions.lowerBound = [0 0];
bayesOptions.upperBound = [1 0.2];
bayesOptions.parNames = {'renewal fraction', 'turnover rate'};
%
F = @(x) cAtmosZone(@c2pop,x,age,bc2,kind,dd,zone,@cConstantTurnover,0);
bayesOptimData = [c14 weight_cont_mass_14change_frombc1.^2];
[XMCMC11_weightsfrombc1, LMCMC11_weightsfrombc1, RMCMC11_weightsfrombc1] = bayesEstim(F,bayesOptimData,[0.9 0.1],[0.5 0.01],bayesOptions);


% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNpos_RDD_foodlag_2_scenario_21';
bayesOptions.lowerBound = [0 0 0];
bayesOptions.upperBound = [1 0.5 0.05];
bayesOptions.parNames = {'renewal fraction' 'turnover rate' 'decrease rate'};
%
F = @(x) cAtmosZone(@c2pop,[x(1), x(2), x(3)],age,bc2,kind,dd,zone,@cDecreasingTurnover,0,1);
bayesOptimData = [c14 weight_cont_mass_14change_frombc1.^2];
[XMCMC21_weightsfrombc1, LMCMC21_weightsfrombc1, RMCMC21_weightsfrombc1] = bayesEstim(F,bayesOptimData,[0.9 0.1 0.01],[0.3 0.01 0.0001],bayesOptions);


% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNpos_RDD_foodlag_2_scenario_31';
bayesOptions.lowerBound = [0 0 0];
bayesOptions.upperBound = [1 0.5 0.05];
bayesOptions.parNames = {'renewal fraction' 'turnover rate' 'decrease rate'};
%
F = @(x) cAtmosZone(@c2pop,[x(1), x(2), x(3)],age,bc2,kind,dd,zone,@cDecreasingTurnover,0,2);
bayesOptimData = [c14 weight_cont_mass_14change_frombc1.^2];
[XMCMC31_weightsfrombc1, LMCMC31_weightsfrombc1, RMCMC31_weightsfrombc1] = bayesEstim(F,bayesOptimData,[0.9 0.1 0.01],[0.3 0.01 0.0001],bayesOptions);


% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNpos_RDD_foodlag_2_scenario_41';
bayesOptions.lowerBound = [0 0 0];
bayesOptions.upperBound = [1 0.5 70];
bayesOptions.parNames = {'renewal fraction' 'turnover rate' 'years'};
%
F = @(x) cAtmosZone(@c2pop,[x(1), x(2), x(3)],age,bc2,kind,dd,zone,@cDecreasingTurnover,0,3);
bayesOptimData = [c14 weight_cont_mass_14change_frombc1.^2];
[XMCMC41_weightsfrombc1, LMCMC41_weightsfrombc1, RMCMC41_weightsfrombc1] = bayesEstim(F,bayesOptimData,[0.9 0.1 60],[0.3 0.01 20],bayesOptions);


%
save('results/datasets/NeuNpos_RDD_foodlag_2')



%%
clear
load('results/datasets/NeuNpos_RDD_foodlag_0')
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

%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNpos_RDD_foodlag_0_scenario_9_0';
bayesOptions.lowerBound = [0  0]
bayesOptions.upperBound = [0.5 0.5];
bayesOptions.parNames = {'turnover rate', 'senescence rate'};
%%
bayesOptions.MaxIter=10000;  %Number of iterations should be at least 100 power of parameters for 2 parameters in the paper used 100 000
bayesOptions.burnin = 1000 % Should be set to ex 1000. erase the first 1000 iterations in order to give the prior less effect. Removes "prior effect". Should be smdepper than max iterations, take away around 10% of the total iterations. 


%%

F = @(x) cgenbds([s2p2('IR',s), x(1), x(2), s2p2('SDR',s,1,[x(2), x(2)]), s2p2('NRDR',s)],cbdopts);
bayesOptimData = [c14 weight_cont_mass_14change_frombc1.^2];
[XMCMC_9_0, LMCMC_9_0, RMCMC_9_0] = bayesEstim(F,bayesOptimData,[0.1 0.1],[0.01 0.001],bayesOptions);
%%
save('results/datasets/NeuNpos_RDD_foodlag_0')



%%
clear
load('results/datasets/NeuNpos_RDD_foodlag_0')
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

%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNpos_RDD_foodlag_0_scenario_9_1';
bayesOptions.lowerBound = [0  0]
bayesOptions.upperBound = [0.5 0.5];
bayesOptions.parNames = {'turnover rate', 'senescence rate'};
%%
bayesOptions.MaxIter=10000;  %Number of iterations should be at least 100 power of parameters for 2 parameters in the paper used 100 000
bayesOptions.burnin = 1000 % Should be set to ex 1000. erase the first 1000 iterations in order to give the prior less effect. Removes "prior effect". Should be smdepper than max iterations, take away around 10% of the total iterations. 


%%

F = @(x) cgenbds([s2p2('IR',s), x(1), x(2), s2p2('SDR',s,1,[x(2), x(2)]), s2p2('NRDR',s)],cbdopts);
bayesOptimData = [c14 weight_cont_mass_14change_frombc1.^2];
[XMCMC_9_1, LMCMC_9_1, RMCMC_9_1] = bayesEstim(F,bayesOptimData,[0.1 0.1],[0.01 0.001],bayesOptions);
%%
save('results/datasets/NeuNpos_RDD_foodlag_0')

%%
clear

load('results/datasets/NeuNpos_RDD_foodlag_0')
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

%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNpos_RDD_foodlag_0_scenario_9_2';
bayesOptions.lowerBound = [0  0]
bayesOptions.upperBound = [0.5 0.5];
bayesOptions.parNames = {'turnover rate', 'senescence rate'};
%%
bayesOptions.MaxIter=10000;  %Number of iterations should be at least 100 power of parameters for 2 parameters in the paper used 100 000
bayesOptions.burnin = 1000 % Should be set to ex 1000. erase the first 1000 iterations in order to give the prior less effect. Removes "prior effect". Should be smdepper than max iterations, take away around 10% of the total iterations. 


%%

F = @(x) cgenbds([s2p2('IR',s), x(1), x(2), s2p2('SDR',s,1,[x(2), x(2)]), s2p2('NRDR',s)],cbdopts);
bayesOptimData = [c14 weight_cont_mass_14change_frombc1.^2];
[XMCMC_9_2, LMCMC_9_2, RMCMC_9_2] = bayesEstim(F,bayesOptimData,[0.1 0.1],[0.01 0.001],bayesOptions);
%%
save('results/datasets/NeuNpos_RDD_foodlag_0')




%%
clear

load('results/datasets/NeuNpos_RDD_foodlag_05')
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

%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNpos_RDD_foodlag_05_scenario_9_0';
bayesOptions.lowerBound = [0  0]
bayesOptions.upperBound = [0.5 0.5];
bayesOptions.parNames = {'turnover rate', 'senescence rate'};
%%
bayesOptions.MaxIter=10000;  %Number of iterations should be at least 100 power of parameters for 2 parameters in the paper used 100 000
bayesOptions.burnin = 1000 % Should be set to ex 1000. erase the first 1000 iterations in order to give the prior less effect. Removes "prior effect". Should be smdepper than max iterations, take away around 10% of the total iterations. 


%%

F = @(x) cgenbds([s2p2('IR',s), x(1), x(2), s2p2('SDR',s,1,[x(2), x(2)]), s2p2('NRDR',s)],cbdopts);
bayesOptimData = [c14 weight_cont_mass_14change_frombc1.^2];
[XMCMC_9_0, LMCMC_9_0, RMCMC_9_0] = bayesEstim(F,bayesOptimData,[0.1 0.1],[0.01 0.001],bayesOptions);
%%
save('results/datasets/NeuNpos_RDD_foodlag_05')



%%
clear

load('results/datasets/NeuNpos_RDD_foodlag_05')
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

%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNpos_RDD_foodlag_05_scenario_9_1';
bayesOptions.lowerBound = [0  0]
bayesOptions.upperBound = [0.5 0.5];
bayesOptions.parNames = {'turnover rate', 'senescence rate'};
%%
bayesOptions.MaxIter=10000;  %Number of iterations should be at least 100 power of parameters for 2 parameters in the paper used 100 000
bayesOptions.burnin = 1000 % Should be set to ex 1000. erase the first 1000 iterations in order to give the prior less effect. Removes "prior effect". Should be smdepper than max iterations, take away around 10% of the total iterations. 


%%

F = @(x) cgenbds([s2p2('IR',s), x(1), x(2), s2p2('SDR',s,1,[x(2), x(2)]), s2p2('NRDR',s)],cbdopts);
bayesOptimData = [c14 weight_cont_mass_14change_frombc1.^2];
[XMCMC_9_1, LMCMC_9_1, RMCMC_9_1] = bayesEstim(F,bayesOptimData,[0.1 0.1],[0.01 0.001],bayesOptions);
%%
save('results/datasets/NeuNpos_RDD_foodlag_05')

%%
clear

load('results/datasets/NeuNpos_RDD_foodlag_05')
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

%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNpos_RDD_foodlag_05_scenario_9_2';
bayesOptions.lowerBound = [0  0]
bayesOptions.upperBound = [0.5 0.5];
bayesOptions.parNames = {'turnover rate', 'senescence rate'};
%%
bayesOptions.MaxIter=10000;  %Number of iterations should be at least 100 power of parameters for 2 parameters in the paper used 100 000
bayesOptions.burnin = 1000 % Should be set to ex 1000. erase the first 1000 iterations in order to give the prior less effect. Removes "prior effect". Should be smdepper than max iterations, take away around 10% of the total iterations. 


%%

F = @(x) cgenbds([s2p2('IR',s), x(1), x(2), s2p2('SDR',s,1,[x(2), x(2)]), s2p2('NRDR',s)],cbdopts);
bayesOptimData = [c14 weight_cont_mass_14change_frombc1.^2];
[XMCMC_9_2, LMCMC_9_2, RMCMC_9_2] = bayesEstim(F,bayesOptimData,[0.1 0.1],[0.01 0.001],bayesOptions);
%%
save('results/datasets/NeuNpos_RDD_foodlag_05')




%%
clear

load('results/datasets/NeuNpos_RDD_foodlag_1')
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

%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNpos_RDD_foodlag_1_scenario_9_0';
bayesOptions.lowerBound = [0  0]
bayesOptions.upperBound = [0.5 0.5];
bayesOptions.parNames = {'turnover rate', 'senescence rate'};
%%
bayesOptions.MaxIter=10000;  %Number of iterations should be at least 100 power of parameters for 2 parameters in the paper used 100 000
bayesOptions.burnin = 1000 % Should be set to ex 1000. erase the first 1000 iterations in order to give the prior less effect. Removes "prior effect". Should be smdepper than max iterations, take away around 10% of the total iterations. 


%%

F = @(x) cgenbds([s2p2('IR',s), x(1), x(2), s2p2('SDR',s,1,[x(2), x(2)]), s2p2('NRDR',s)],cbdopts);
bayesOptimData = [c14 weight_cont_mass_14change_frombc1.^2];
[XMCMC_9_0, LMCMC_9_0, RMCMC_9_0] = bayesEstim(F,bayesOptimData,[0.1 0.1],[0.01 0.001],bayesOptions);
%%
save('results/datasets/NeuNpos_RDD_foodlag_1')



%%
clear

load('results/datasets/NeuNpos_RDD_foodlag_1')
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

%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNpos_RDD_foodlag_1_scenario_9_1';
bayesOptions.lowerBound = [0  0]
bayesOptions.upperBound = [0.5 0.5];
bayesOptions.parNames = {'turnover rate', 'senescence rate'};
%%
bayesOptions.MaxIter=10000;  %Number of iterations should be at least 100 power of parameters for 2 parameters in the paper used 100 000
bayesOptions.burnin = 1000 % Should be set to ex 1000. erase the first 1000 iterations in order to give the prior less effect. Removes "prior effect". Should be smdepper than max iterations, take away around 10% of the total iterations. 


%%

F = @(x) cgenbds([s2p2('IR',s), x(1), x(2), s2p2('SDR',s,1,[x(2), x(2)]), s2p2('NRDR',s)],cbdopts);
bayesOptimData = [c14 weight_cont_mass_14change_frombc1.^2];
[XMCMC_9_1, LMCMC_9_1, RMCMC_9_1] = bayesEstim(F,bayesOptimData,[0.1 0.1],[0.01 0.001],bayesOptions);
%%
save('results/datasets/NeuNpos_RDD_foodlag_1')

%%
clear

load('results/datasets/NeuNpos_RDD_foodlag_1')
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

%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNpos_RDD_foodlag_1_scenario_9_2';
bayesOptions.lowerBound = [0  0]
bayesOptions.upperBound = [0.5 0.5];
bayesOptions.parNames = {'turnover rate', 'senescence rate'};
%%
bayesOptions.MaxIter=10000;  %Number of iterations should be at least 100 power of parameters for 2 parameters in the paper used 100 000
bayesOptions.burnin = 1000 % Should be set to ex 1000. erase the first 1000 iterations in order to give the prior less effect. Removes "prior effect". Should be smdepper than max iterations, take away around 10% of the total iterations. 


%%

F = @(x) cgenbds([s2p2('IR',s), x(1), x(2), s2p2('SDR',s,1,[x(2), x(2)]), s2p2('NRDR',s)],cbdopts);
bayesOptimData = [c14 weight_cont_mass_14change_frombc1.^2];
[XMCMC_9_2, LMCMC_9_2, RMCMC_9_2] = bayesEstim(F,bayesOptimData,[0.1 0.1],[0.01 0.001],bayesOptions);
%%
save('results/datasets/NeuNpos_RDD_foodlag_1')



%%
clear

load('results/datasets/NeuNpos_RDD_foodlag_15')
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

%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNpos_RDD_foodlag_15_scenario_9_0';
bayesOptions.lowerBound = [0  0]
bayesOptions.upperBound = [0.5 0.5];
bayesOptions.parNames = {'turnover rate', 'senescence rate'};
%%
bayesOptions.MaxIter=10000;  %Number of iterations should be at least 100 power of parameters for 2 parameters in the paper used 100 000
bayesOptions.burnin = 1000 % Should be set to ex 1000. erase the first 1000 iterations in order to give the prior less effect. Removes "prior effect". Should be smdepper than max iterations, take away around 10% of the total iterations. 


%%

F = @(x) cgenbds([s2p2('IR',s), x(1), x(2), s2p2('SDR',s,1,[x(2), x(2)]), s2p2('NRDR',s)],cbdopts);
bayesOptimData = [c14 weight_cont_mass_14change_frombc1.^2];
[XMCMC_9_0, LMCMC_9_0, RMCMC_9_0] = bayesEstim(F,bayesOptimData,[0.1 0.1],[0.01 0.001],bayesOptions);
%%
save('results/datasets/NeuNpos_RDD_foodlag_15')


%%
clear

load('results/datasets/NeuNpos_RDD_foodlag_15')
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

%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNpos_RDD_foodlag_15_scenario_9_1';
bayesOptions.lowerBound = [0  0]
bayesOptions.upperBound = [0.5 0.5];
bayesOptions.parNames = {'turnover rate', 'senescence rate'};
%%
bayesOptions.MaxIter=10000;  %Number of iterations should be at least 100 power of parameters for 2 parameters in the paper used 100 000
bayesOptions.burnin = 1000 % Should be set to ex 1000. erase the first 1000 iterations in order to give the prior less effect. Removes "prior effect". Should be smdepper than max iterations, take away around 10% of the total iterations. 


%%

F = @(x) cgenbds([s2p2('IR',s), x(1), x(2), s2p2('SDR',s,1,[x(2), x(2)]), s2p2('NRDR',s)],cbdopts);
bayesOptimData = [c14 weight_cont_mass_14change_frombc1.^2];
[XMCMC_9_1, LMCMC_9_1, RMCMC_9_1] = bayesEstim(F,bayesOptimData,[0.1 0.1],[0.01 0.001],bayesOptions);
%%
save('results/datasets/NeuNpos_RDD_foodlag_15')

%%
clear

load('results/datasets/NeuNpos_RDD_foodlag_15')
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

%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNpos_RDD_foodlag_15_scenario_9_2';
bayesOptions.lowerBound = [0  0]
bayesOptions.upperBound = [0.5 0.5];
bayesOptions.parNames = {'turnover rate', 'senescence rate'};
%%
bayesOptions.MaxIter=10000;  %Number of iterations should be at least 100 power of parameters for 2 parameters in the paper used 100 000
bayesOptions.burnin = 1000 % Should be set to ex 1000. erase the first 1000 iterations in order to give the prior less effect. Removes "prior effect". Should be smdepper than max iterations, take away around 10% of the total iterations. 


%%

F = @(x) cgenbds([s2p2('IR',s), x(1), x(2), s2p2('SDR',s,1,[x(2), x(2)]), s2p2('NRDR',s)],cbdopts);
bayesOptimData = [c14 weight_cont_mass_14change_frombc1.^2];
[XMCMC_9_2, LMCMC_9_2, RMCMC_9_2] = bayesEstim(F,bayesOptimData,[0.1 0.1],[0.01 0.001],bayesOptions);
%%
save('results/datasets/NeuNpos_RDD_foodlag_15')




%%
clear

load('results/datasets/NeuNpos_RDD_foodlag_2')
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

%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNpos_RDD_foodlag_2_scenario_9_0';
bayesOptions.lowerBound = [0  0]
bayesOptions.upperBound = [0.5 0.5];
bayesOptions.parNames = {'turnover rate', 'senescence rate'};
%%
bayesOptions.MaxIter=10000;  %Number of iterations should be at least 100 power of parameters for 2 parameters in the paper used 100 000
bayesOptions.burnin = 1000 % Should be set to ex 1000. erase the first 1000 iterations in order to give the prior less effect. Removes "prior effect". Should be smdepper than max iterations, take away around 10% of the total iterations. 


%%

F = @(x) cgenbds([s2p2('IR',s), x(1), x(2), s2p2('SDR',s,1,[x(2), x(2)]), s2p2('NRDR',s)],cbdopts);
bayesOptimData = [c14 weight_cont_mass_14change_frombc1.^2];
[XMCMC_9_0, LMCMC_9_0, RMCMC_9_0] = bayesEstim(F,bayesOptimData,[0.1 0.1],[0.01 0.001],bayesOptions);
%%
save('results/datasets/NeuNpos_RDD_foodlag_2')



%%
clear

load('results/datasets/NeuNpos_RDD_foodlag_2')
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

%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNpos_RDD_foodlag_2_scenario_9_1';
bayesOptions.lowerBound = [0  0]
bayesOptions.upperBound = [0.5 0.5];
bayesOptions.parNames = {'turnover rate', 'senescence rate'};
%%
bayesOptions.MaxIter=10000;  %Number of iterations should be at least 100 power of parameters for 2 parameters in the paper used 100 000
bayesOptions.burnin = 1000 % Should be set to ex 1000. erase the first 1000 iterations in order to give the prior less effect. Removes "prior effect". Should be smdepper than max iterations, take away around 10% of the total iterations. 


%%

F = @(x) cgenbds([s2p2('IR',s), x(1), x(2), s2p2('SDR',s,1,[x(2), x(2)]), s2p2('NRDR',s)],cbdopts);
bayesOptimData = [c14 weight_cont_mass_14change_frombc1.^2];
[XMCMC_9_1, LMCMC_9_1, RMCMC_9_1] = bayesEstim(F,bayesOptimData,[0.1 0.1],[0.01 0.001],bayesOptions);
%%
save('results/datasets/NeuNpos_RDD_foodlag_2')

%%
clear

load('results/datasets/NeuNpos_RDD_foodlag_2')
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

%% Scenario 2POP E2 (1)- delta14C, t=age, bcDelay=0
bayesOptions = setBayesOptions();
bayesOptions.filename = 'results/mcmc/MCMC_NeuNpos_RDD_foodlag_2_scenario_9_2';
bayesOptions.lowerBound = [0  0]
bayesOptions.upperBound = [0.5 0.5];
bayesOptions.parNames = {'turnover rate', 'senescence rate'};
%%
bayesOptions.MaxIter=10000;  %Number of iterations should be at least 100 power of parameters for 2 parameters in the paper used 100 000
bayesOptions.burnin = 1000 % Should be set to ex 1000. erase the first 1000 iterations in order to give the prior less effect. Removes "prior effect". Should be smdepper than max iterations, take away around 10% of the total iterations. 


%%

F = @(x) cgenbds([s2p2('IR',s), x(1), x(2), s2p2('SDR',s,1,[x(2), x(2)]), s2p2('NRDR',s)],cbdopts);
bayesOptimData = [c14 weight_cont_mass_14change_frombc1.^2];
[XMCMC_9_2, LMCMC_9_2, RMCMC_9_2] = bayesEstim(F,bayesOptimData,[0.1 0.1],[0.01 0.001],bayesOptions);
%%
save('results/datasets/NeuNpos_RDD_foodlag_2')





