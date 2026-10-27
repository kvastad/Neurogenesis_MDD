function [X, L, R, alpha, sim] = bayesEstim(model,data,X0,epsilon0,options)
% BAYESESTIM is a bayesian estimator
%   [X L R alpha] = bayesEstim(model,data,X0,epsilon0,options) returns the series for
%   parameter values X for the model MODEL and data DATA.
%
%   INPUT:
%           MODEL:      model function, with syntax YPRED = MODEL(X) 
%           DATA:       nx2 or nx3 array of n data points [Y C Sigma2], with Y the observed data and C
%                       the confidence for each data point (use C=ones(size(Y)) for
%                       homogeneous confidence. Sigma2 is the variance of Y.
%           X0:         Initial guess for the parameters
%           EPSILON0:   Initial value of the variability of the new parameter trials.
%           OPTIONS:    Structure generated with SETBAYESOPTIONS
%
%   Note: The DATA = [ Y C S ] contains one mandatory and two optional columns. 
%           C can be any vector of positive values representing the confidence in
%           the data. By default, C is set to ones(size(Y)). Column S is the variance (sigma2) of the
%           error between the model and the measured data. This can be set
%           to S=(experimental error on Y).^2, but it is likely to be
%           larger than that is the model does not fit the average value of
%           Y well. Setting S to larger values (greater variance) will
%           result in more variability in the parameter estimates. Setting
%           S to low values will result in a narrow estimate for the
%           paramters, but will not reflect the true distribution of
%           parameter values. If the option fitSigma is set to FALSE, it is
%           necessary to give values for S. If the option fitSigma is set to true, it is
%           not useful to give S. In case fitSigma is not set properly, a
%           warning message will be issued.
%
%   OUTPUT:
%           X:      array of accepted parameter values
%           L:      likelihood of accepted parameters values (larger =
%                   better)
%           R:      array of rejected parameter values (R = NaN when values
%                   are accepted)
%           alpha:  vector of acceptance probabilities (alpha = NaN when
%                   parameter values are out-of-bound
%           SIM:    struct with simulation parameters
%                   TODO make bayesEstim accept SIM as a unique parameter
%           
%
%   Examples
%           1
%           Find the minimum of the rosenbrock function 
%               if ~exist('rosenbrock.m')
%                   rosenbrock = @(x,y) (1-x).^2 + 100*(y-x.^2).^2;
%               end
%               options = setBayesOptions();
%               options.Display = 'iter';
%               options.MaxIter = 5000;
%               options.fitSigma = 0;
%               [X L R] = bayesEstim(@(x) rosenbrock(x(1),x(2)),[0 1 0.01],[0 0],[0.1 0.1],options);
%               plotEstim(X,L,R)
%
%           2
%           Sample from a Gaussian distribution
%           Generate 1000 numbers from a Gaussian distribution with mean 1
%           and variance 4
%               Y = 1 + 2*randn(1000,1);
%               options = setBayesOptions();
%               options.Display = 'none';
%               options.MaxIter = 100000;
%               options.fitSigma = true;
%           Fit the model Y = THETA and estimate the distribution P(THETA|Y)
%               [X L R] = bayesEstim(@(theta) theta,[Y ones(size(Y))],0,0.1,options);
%               hist(X)
%               mean(X)
%               mean(Y)
%               var(X)
%               var(Y)
%           
%
%   See also SETBAYESOPTIONS

%     Copyright 2017 Samuel Bernard
% 
%     This file is part of Turnover.
% 
%     Turnover is free software: you can redistribute it and/or modify
%     it under the terms of the GNU Affero General Public License as published by
%     the Free Software Foundation, either version 3 of the License, or
%     (at your option) any later version.
% 
%     Turnover is distributed in the hope that it will be useful,
%     but WITHOUT ANY WARRANTY; without even the implied warranty of
%     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%     GNU  Affero General Public License for more details.
% 
%     You should have received a copy of the GNU Affero General Public License
%     along with Turnover.  If not, see <http://www.gnu.org/licenses/>.

%% BEGIN MAIN FUNCTION


if nargin < 5 && nargin > 1 % set default options
    options=setBayesOptions();
elseif nargin == 1          % take sim as the unique input
    error('bayesEstim:todo','bayeEstim cannot accept a single SIM argument yet; 4 or 5 arguments are needed.');
end

% WRITE FILE ------------------------------------
if exist(options.filename,'file')
    fprintf(2,['\nThe file to be written to, ' options.filename ', already exists.\n' ...
        'Press Control-C to terminate or Enter to continue.\n']);
    input('')
end
% WRITE FILE ------------------------------------

%%
% -----------------------------------------------
% PROCESSING OPTIONS
% -----------------------------------------------
parNb = length(X0);
MaxIter = options.MaxIter;
prior = options.Prior;
targetRate = options.targetRate;
epsMin = options.RelEpsMin*epsilon0;
deps=options.deps;
acceptRateTol = options.acceptRateTol;
upperBound = options.upperBound;
lowerBound = options.lowerBound;
switch upper(options.Display)
    case 'PLOT'
        printIter = true;
        plotIter = true;
        plotInd = options.plotInd;
        printPercent = false;
    case 'ITER'
        printIter = true;
        plotIter = false;
        plotInd = options.plotInd;
        printPercent = false;
    case 'MINIMAL'
        printIter = false;
        plotIter = false;
        plotInd = options.plotInd;
        printPercent = true;
        printEach = floor(MaxIter/1000);
    otherwise
        printIter = false;
        plotIter = false;
        plotInd = options.plotInd;
        printPercent = false;
end

% -------------------------------------
% arguments for f(X) the likelihood function
nColData = size(data,2);
y = data(:,1); % data points
if nColData == 1 % only data, no confidence, no sigma2
    c = ones(size(y));
    if options.fitSigma == false
        % this is not good, if fitSigma==true, sigma2 should be supplied by
        % the user
        warning('bayesEstim:options',['The option fitSigma is set to FALSE,' ...
        'but DATA does not contain user-supplied sigma2 in the third column.' ...
        'Either set fitSigma to TRUE, or supply sigma2 in the third column of DATA.']) 
        sigma2 = ones(size(data,1),1);
    end
elseif nColData == 2 % data and confidence, no sigma2
    c = abs(data(:,2))/nansum(abs(data(:,2))); % data confidence
    if options.fitSigma == false
        % this is not good, if fitSigma==true, sigma2 should be supplied by
        % the user
        warning('bayesEstim:options',['The option fitSigma is set to FALSE,' ...
        'but DATA does not contain user-supplied sigma2 in the third column.' ...
        'Either set fitSigma to TRUE, or supply sigma2 in the third column of DATA.']) 
        sigma2 = ones(size(data,1),1);
    end     
elseif nColData == 3
    c = abs(data(:,2))/nansum(abs(data(:,2))); % data confidence
    if options.fitSigma == false  % sigma is fixed
        sigma2 = data(:,3);   % user-supplied sigma - error on measurement
    else
        warning('bayesEstim:options',['The option fitSigma is set to TRUE,' ...
        'but DATA  contains user-supplied sigma2 in the third column. ' ...
        'The user-supplied sigma2 will be ignored. ' ... 
        'Set fitSigma to FALSE to use user-supplied sigma2.'])        
    end
end
% -----------------------------------------------

% initialize the random number generator
rng('shuffle');

% define q(X|X(t-1))
switch upper(prior)
    case 'UNIFORM' % uniform distribution between X(t-1)-epsilon and X(t-1)+epsilon
        randDraw = -1+2*rand(MaxIter,parNb);
    case 'GAUSSIAN'
        randDraw = randn(MaxIter,parNb);
    otherwise
        randDraw = -1+2*rand(MaxIter,parNb);
end
% -----------------------------------------------

% -----------------------------------------------
% END PROCESSING OPTIONS
% -----------------------------------------------

%%
% -----------------------------------------------
% INITIALIZING SIMULATION VARIABLES
% -----------------------------------------------
X = zeros(MaxIter,parNb);
R = nan(MaxIter,parNb);
alpha = zeros(MaxIter,1);
acceptRate = 0;
L = zeros(MaxIter,1);
acceptThreshold = rand(MaxIter,1);
epsilon = epsilon0;

% 0 start with initial parameters X(1,:)
X(1,:)=X0;
Xp = X(1,:);
z = c.*(model(Xp)-y).^2;
assert(~all(isnan(z)));
notnans = ~(z~=z);
if options.fitSigma % sigma2 related to the sum of the errors squared
    sigma2n = sum(z(notnans));
else                % sigma2 given by the user. This is computed only once.
    sigma2n = sigma2(notnans);
end
assert(sigma2n>0);
fp = - sum(z(notnans)./sigma2n);      % 2*log(L)

% L: Likelihood 
% (1/sqrt(2*pi))^n * exp(-1/2*RSS/sigma2)
n = length(y);
L(1) = (1/sqrt(2*pi*sigma2n))^n*exp(0.5*fp);
bestf = fp;             % maximum likelihood so far
% -----------------------------------------------
% END INITIALIZING SIMULATION VARIABLES
% -----------------------------------------------

%%
% ----------------------------------------------- 
% to interrupt the simulation, the user can create an empty file named
% 'stop' in the current folder
if options.interrupt
    fprintf('Move your mouse to the lower left corner to ');
    fprintf('interrupt the simulation.\n');
end
% -----------------------------------------------

%%
% DISPLAY ---------------------------------------
if printIter % DISPLAY
    padding = '.......  ';
    for j=1:(parNb-1)
        padding = [padding '........  '];
    end
    fprintf('\n');
    fprintf('   i alpha Out |eps|     aRate sig2      X%sR%sL\n',padding,padding);
%     fprintf('------------------------------------------------------------------\n');
    fprintf('   1 -     -   -         -     ');
    fprintf('%8.2e ',mean(sigma2n));
    for j=1:parNb
        fprintf('%9.2e ',X(1,j));
    end
    fprintf('\n');
end
if plotIter
    figure(1);
    clf;
    h=gcf;
    axes;
    plot(1,Xp(1,plotInd),'.');
    hold on
end
if printPercent
    fprintf('\n');
    fprintf('   Percent complete\n');
    fprintf('------------------------\n');
    fprintf('                   ');
end
% DISPLAY ---------------------------------------

%%
% WRITE FILE ------------------------------------
if options.writeFile
    [fileID, errmsg] = fopen(options.filename,'w');
    if fileID == -1
      error(errmsg);
    end
      
    for j=1:length(X0)
        fprintf(fileID,'%6.4f ',X(1,j));
    end
    fprintf(fileID,'%6.4f ',L(1));
    for j=1:length(X0)
        fprintf(fileID,'%6.4f ',R(1,j));
    end
    fprintf(fileID,'\n');
end
% WRITE FILE ------------------------------------

%%
% -----------------------------------------------
% BEGIN MAIN LOOP
% -----------------------------------------------
for i=2:MaxIter
    Xtry = Xp + epsilon.*randDraw(i,:); % 1 draw Xtry ~ q(.|X(t-1,:))
    
    % Test whether Xtry lies outside Xbnd
    isInBound = all(Xtry<=upperBound) & all(Xtry>=lowerBound);
    
    %% compute the new likelihood only if Xtry is in bound
    if isInBound 
        % 2 compute alpha(Xtry|X(t-1)) =
        % min{1,f(Xtry)*q(X(t-1)|Xtry)/f(X(t-1)*q(Xtry|X(t-1))}
        try 
            z = c.*(model(Xtry)-y).^2;
	catch
	    z = 1e3*size(y);
	end
        notnans = ~(z~=z);
        if ~options.fitSigma % make sure sigma2 and z are of the same size
            sigma2n = sigma2(notnans);
        end
        ftry = - sum(z(notnans)./sigma2n);      
        alpha(i) = min(1,exp(0.5*(ftry-fp)));
       
        % track the maximum likelihood and update sigma2 if needed
        if ftry>bestf
            bestf = ftry;
            if options.fitSigma % update sigma2 if the fit is better
                sigma2n = sum(z(notnans));
            end
        end
        % Accept Xtry with probability alpha X(t)=Xtry, reject Xtry and keep X(t-1)
        % with probability 1-alpha X(t)=X(t-1)
        acceptNew = alpha(i)>acceptThreshold(i);
    else
        acceptNew = false;
        alpha(i)  = NaN;
    end  

    %% accept or reject Xtry
    acceptRate = ((i-2)*acceptRate + acceptNew)/(i-1);
    
    if acceptNew % accept the new values
        X(i,:) = Xtry;
        L(i)   = (1/sqrt(2*pi*sigma2n))^n*exp(0.5*ftry);
        Xp = Xtry;
        fp = ftry;
    else         % reject the new values
        X(i,:) = Xp;
        L(i)   = (1/sqrt(2*pi*sigma2n))^n*exp(0.5*fp);
        R(i,:) = Xtry;
    end

    % adapt epsilon for the acceptance rate with target targetRate
    if abs(acceptRate-targetRate)>acceptRateTol
%         fprintf('adapting epsilon = %f\n',epsilon);
        epsilon = max(epsMin,epsilon + deps*epsilon*(acceptRate-targetRate));
    end    

    %%
    % DISPLAY ---------------------------------------
    if printIter
        fprintf('%4d ',i);
        fprintf('%5.3f ',alpha(i));
    end
    if printPercent && (mod(i,printEach)==0)
        fprintf('\b\b\b\b\b\b\b\b\b\b\b\b\b');
        fprintf('%5.1f percent',100*i/MaxIter);
    end
    if printIter
        if ~isInBound
            rejectMessage='OoB';
        elseif ~acceptNew
            rejectMessage='Rej';
        elseif acceptNew
            rejectMessage='Acc';
        end
            
        fprintf('%s %9.2e %.2f  ',rejectMessage,norm(epsilon),acceptRate);
        fprintf('%8.2e ',mean(sigma2n));
        for j=1:parNb
            fprintf('%9.2e ',X(i,j));
        end
        for j=1:parNb
            fprintf('%9.2e ',R(i,j));
        end
        fprintf('%9.2e ',L(i));
        fprintf('\n');
    end
    if plotIter
        figure(h);
        line([i-1 i],[X(i-1,plotInd) X(i,plotInd)])
        if ~acceptNew
            plot(i,Xtry(plotInd),'ko')
        end
        %drawnow;
    end
    % DISPLAY ----------------------------------------------------
    
    %%
    % WRITE FILE -------------------------------------------------
    if options.writeFile
        %fprintf(fileID,'%4d ',i); iteration number is not useful
        for j=1:length(X0)
            fprintf(fileID,'%12.6e ',X(i,j));
        end
        fprintf(fileID,'%12.6e ',L(i));
        for j=1:length(X0)
            fprintf(fileID,'%12.6e ',R(i,j));
        end
        fprintf(fileID,'\n');
    end
    % write file -------------------------------------------------
    
    %% INTERRUPT OR TERMINATE THE LOOP
    if options.interrupt
        loopInterrupt; % check if the loop should interrupt
        termin = false;
        if termin % check if the loop should be terminated
            fprintf('\nInterrupting the loop.\nX, L, R will be returned with %d iterations only.\n',i);
            X = X(1:i,:);
            L = L(1:i);
            R = R(1:i,:);
            break;
        end
    end
end
% ------------------------------------------------------------
% END OF MAIN LOOP
% ------------------------------------------------------------

%% 
% DISPLAY ----------------------------------------------------
if printIter || printPercent
    fprintf('\n----\nThe simulation finished with %d iterations.\n',i);
    fprintf('Global acceptance rate of %.0f%%.\n\nThe best parameter set is\n\n',100*acceptRate);
    fprintf('    ');
    [bestL,bestInd] = max(L);
    bestX = X(bestInd,:); 
    if length(options.parNames)==parNb
        for j=1:parNb
                fprintf('%s=%9.2e, ',options.parNames{j},bestX(j));
        end
    else
        for j=1:parNb
                fprintf('X(%d) = %9.2e ',j,bestX(j));
        end
    end
    fprintf('  L = %9.2e\n\n',bestL);
end
% DISPLAY ----------------------------------------------------

if options.writeFile
    fclose(fileID);
end

% -------------------------------------------------------
% END OF MAIN FUNCTION
% -------------------------------------------------------

% -------------------------------------------------------
% Collect simulation parameters and last state for reuse
% -------------------------------------------------------
if nargout == 5
    sim.model       = model;
    sim.data        = data;
    sim.lastX       = X(i,:);
    sim.options     = options;
    sim.epsilon     = epsilon;
    sim.nbIter      = i;
    sim.acceptRate  = acceptRate;
    sim.bestf       = bestf;
    sim.rngStat     = rng;
end
% -------------------------------------------------------
% Collect simulation parameters and last state for reuse
% -------------------------------------------------------


%% NESTED FUNCTIONS

    function loopInterrupt()
    % LOOPINTERRUPT checks whether to loop should be interrupted or resumed
        termin = false;
%         filecode = exist('stop','file');
%         if filecode == 2
%             fprintf('\nYou have interrupted the simulation because there is\n');
%             fprintf('a file named ''stop'' in the current directory.\n');
%             fprintf('You can browse local variables, modifiy them and save them.\n')
%             fprintf('You can truncate the simulation by setting terminate to TRUE.\n');
%             fprintf('To resume the simulation, type ''return''\n');
%             keyboard
%             fprintf('\nResuming the simulation...\n');
%             movefile('stop','resume');
%         end
        mouseLocation = get(0,'PointerLocation');
        if all(mouseLocation==1)
            fprintf('\nYou have interrupted the simulation because \n');
            fprintf('you have moved your mouse to the lower left corner.\n');
            fprintf('You can browse local variables, modify them and save them.\n')
            fprintf('You can truncate the simulation by typing ''terminate''.\n');
            fprintf('To resume the simulation, type ''return''\n');
            keyboard
        end
        
        function terminate(s)
        % TERMINATE toggle or set the state of the variable TERMIN
            if nargin == 1
                termin = s;
            else
                termin = true;
            end
            fprintf('\n    terminate set to %d.\n\n',termin);
        end
    end

    
        

end
