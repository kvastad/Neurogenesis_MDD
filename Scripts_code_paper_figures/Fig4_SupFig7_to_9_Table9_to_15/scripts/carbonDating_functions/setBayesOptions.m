function options = setBayesOptions()
% SETBAYESOPTIONS reinitialize parameters to their default values
%   options = setBayesOptions() returns defaults for Bayes inference
%   function bayesEstim.
%
%   Examples
%       Set defaults
%           options = setBayesOptions();
%       Set one or more options manually (defaults in {})
%           options.Prior           = {uniform} | gaussian
%           options.MaxIter         = {100}
%           options.Display         = off | {iter} | plot | minimal
%           options.targetRate      = {0.2}
%           options.RelEpsMin       = {0.01}
%           options.deps            = {0.01}
%           options.acceptRateTol   = {0.05}
%           options.plotInd         = {1}
%           options.fitSigma        = false | {true}
%           options.burnin          = {0}
%           options.interrupt       = false | {true}
%           options.MaxPlot         = {5e4}
%
%   PRIOR:          Probability distribution to use for generating new test
%                   parameters. The choice is between UNIFORM (width 2*epsilon,
%                   centered at the current parameter value) and GAUSSIAN (standard
%                   deviation epsilon, centered at the current parameter value).
%   MAXITER:        Number of iterations. POSITIVE INTEGER 
%   DISPLAY:        Print the progression. OFF = nothing is displayed, ITER =
%                   iteration are displayed, PLOT = iterations are displayed
%                   and the parameter with index PLOTIND is plotted.
%                   MINIMAL = displays iteration number at every percent of
%                   MaxIter.
%   TARGETRATE:     Target acceptance rate. DOUBLE in [0,1]
%   RELEPSMIN:      Minimal value of epsilon relative to initial epsilon
%                   value. POSITIVE DOUBLE
%   DEPS:           Rate at which epsilon is adapted to reach the target acceptance 
%                   rate TARGETRATE. POSITIVE DOUBLE
%   ACCEPTRATETOL:  If the the acceptance rate is within TARGETRATE +/-
%                   ACCEPTRATETOL, do not change epsilon. DOUBLE in [0,1]
%   PLOTIND:        Index of parameter to plot, if DISPLAY = 'PLOT'.
%                   INTEGER in [1, length(X0)]
%   FITSIGMA:       Whether to estimate the variance sigma^2. BOOLEAN (FALSE or TRUE)
%   UPPERBOUND:     Upper bound for parameter estimates. Default +Inf
%   LOWERBOUND:     Lower bound for parameter estimates. Default -Inf
%   PARNAMES:       Names of the parameters
%   BURNIN:         Used only for plotting with PLOTESTIM. INTEGER number
%                   of transient iteration to leave out of when plotting the results. This
%                   is useful when fitSigma is set to true to remove inital good fits that
%                   are actually not really good
%   INTERRUPT:      Allow interruption
%   MAXPLOT:        Maximum number of iterations to plot. Default: 5e4.
%   
%
%   See also BAYESESTIM, PLOTESTIM
%
%   Copyright 2012-2012

options.Prior='uniform'; %By default you assume uniform distribution, should be GAUSSIAN? 
options.MaxIter=100000;  %Number of iterations should be at least 100 power of parameters for 2 parameters in the paper used 100 000
options.Display='minimal'; %Display information of every iteration. Max iter of 100 
options.targetRate = 0.3; % An efficiency parameter- it will not change the posterior. In order for the model to work efficiently (make the jupms as efficient as possible, how it explore the space, how far or narrow the jumps are) the acceptence rate should be around 30%
options.RelEpsMin = 0.01; % Never step less than 0.01. 
options.deps=0.01; %the rate at which you change Eps (Eps is the step size). Don't change 
options.acceptRateTol = 0.01; % Can be changed to 0.05. Says don't bother changing the Epsilon (step size) if it is 0.01 close to target rate. 
options.plotInd = 1; % graphical parameter 
options.fitSigma = true; % sigma is related to the standard deviation. It is computed from the SSE from the best fit. It will decrease will the number of iteration, but it will never be zero. (the more iterations the less it will decrease because you will rarely get a better fit.) 
options.writeFile = true; %should be set to true, except for when you set up your model. So you have a copy if your computer crashes.
options.filename = 'bayesoutput.dat'; %filename of "writeFile=true" 
options.upperBound = Inf; % Upper bound for the prior. Should be set for all parameter. 
options.lowerBound = -Inf; % Lower bound for the prior. Should be set for all parameter. 
options.parNames = {'renewal rate', 'turnover rate'}; % More than 3 parameters is  little complicated
options.burnin = 10000; % Should be set to ex 1000. erase the first 1000 iterations in order to give the prior less effect. Removes "prior effect". Should be smaller than max iterations, take away around 10% of the total iterations. 
options.interrupt = false; % by default it is true. This is for debugging. 
options.MaxPlot= 5e4; % when you plot estim, it only plot 50 000. More parameters you need more iterations but not all the point you computed. Picked randomly
