%% Figures for the NeuN+ group fits (scenario 9_2)
%  One figure per group, from the foodlag 1 datasets written by Step 9
%  (ALL) and Steps 10a-10e (the subgroups).

%% ALL
clear
load('results/datasets/NeuNpos_ALL_foodlag_1.mat')

bayesOptions = setBayesOptions();
bayesOptions.lowerBound = [0  0]
bayesOptions.upperBound = [0.5 0.5];
bayesOptions.parNames = {'turnover rate', 'senescence rate'};
%%
bayesOptions.MaxIter=10000;  %Number of iterations should be at least 100 power of parameters for 2 parameters in the paper used 100 000
bayesOptions.burnin = 1000 % Should be set to ex 1000. erase the first 1000 iterations in order to give the prior less effect. Removes "prior effect". Should be smaller than max iterations, take away around 10% of the total iterations.

%%
figure(1); clf;
plotEstim(XMCMC_9_2, LMCMC_9_2, RMCMC_9_2,bayesOptions)

%% controls
clear
load('results/datasets/NeuNpos_control_foodlag_1.mat')

bayesOptions = setBayesOptions();
bayesOptions.lowerBound = [0  0]
bayesOptions.upperBound = [0.5 0.5];
bayesOptions.parNames = {'turnover rate', 'senescence rate'};
%%
bayesOptions.MaxIter=10000;  %Number of iterations should be at least 100 power of parameters for 2 parameters in the paper used 100 000
bayesOptions.burnin = 1000 % Should be set to ex 1000. erase the first 1000 iterations in order to give the prior less effect. Removes "prior effect". Should be smaller than max iterations, take away around 10% of the total iterations.

%%
figure(2); clf;
plotEstim(XMCMC_9_2, LMCMC_9_2, RMCMC_9_2,bayesOptions)

%% depp (MDE u RDD)
clear
load('results/datasets/NeuNpos_depp_foodlag_1.mat')

bayesOptions = setBayesOptions();
bayesOptions.lowerBound = [0  0]
bayesOptions.upperBound = [0.5 0.5];
bayesOptions.parNames = {'turnover rate', 'senescence rate'};
%%
bayesOptions.MaxIter=10000;  %Number of iterations should be at least 100 power of parameters for 2 parameters in the paper used 100 000
bayesOptions.burnin = 1000 % Should be set to ex 1000. erase the first 1000 iterations in order to give the prior less effect. Removes "prior effect". Should be smaller than max iterations, take away around 10% of the total iterations.

%%
figure(3); clf;
plotEstim(XMCMC_9_2, LMCMC_9_2, RMCMC_9_2,bayesOptions)

%% MDE
clear
load('results/datasets/NeuNpos_MDE_foodlag_1.mat')

bayesOptions = setBayesOptions();
bayesOptions.lowerBound = [0  0]
bayesOptions.upperBound = [0.5 0.5];
bayesOptions.parNames = {'turnover rate', 'senescence rate'};
%%
bayesOptions.MaxIter=10000;  %Number of iterations should be at least 100 power of parameters for 2 parameters in the paper used 100 000
bayesOptions.burnin = 1000 % Should be set to ex 1000. erase the first 1000 iterations in order to give the prior less effect. Removes "prior effect". Should be smaller than max iterations, take away around 10% of the total iterations.

%%
figure(4); clf;
plotEstim(XMCMC_9_2, LMCMC_9_2, RMCMC_9_2,bayesOptions)

%% RDD
clear
load('results/datasets/NeuNpos_RDD_foodlag_1.mat')

bayesOptions = setBayesOptions();
bayesOptions.lowerBound = [0  0]
bayesOptions.upperBound = [0.5 0.5];
bayesOptions.parNames = {'turnover rate', 'senescence rate'};
%%
bayesOptions.MaxIter=10000;  %Number of iterations should be at least 100 power of parameters for 2 parameters in the paper used 100 000
bayesOptions.burnin = 1000 % Should be set to ex 1000. erase the first 1000 iterations in order to give the prior less effect. Removes "prior effect". Should be smaller than max iterations, take away around 10% of the total iterations.

%%
figure(5); clf;
plotEstim(XMCMC_9_2, LMCMC_9_2, RMCMC_9_2,bayesOptions)

%% extended controls
clear
load('results/datasets/NeuNpos_controlextended_foodlag_1.mat')

bayesOptions = setBayesOptions();
bayesOptions.lowerBound = [0  0]
bayesOptions.upperBound = [0.5 0.5];
bayesOptions.parNames = {'turnover rate', 'senescence rate'};
%%
bayesOptions.MaxIter=10000;  %Number of iterations should be at least 100 power of parameters for 2 parameters in the paper used 100 000
bayesOptions.burnin = 1000 % Should be set to ex 1000. erase the first 1000 iterations in order to give the prior less effect. Removes "prior effect". Should be smaller than max iterations, take away around 10% of the total iterations.

%%
figure(6); clf;
plotEstim(XMCMC_9_2, LMCMC_9_2, RMCMC_9_2,bayesOptions)
