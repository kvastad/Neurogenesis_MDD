function [S,G] = sensitivity_analysis(model,beta,x)
% SENSITIVITY_ANALYSIS runs sensitivity analysis on model MODEL with parameter PARS
% 
% INPUT
%   MODEL   function y = model(beta,x), Y is the output of the model 
%   PARS    model parameters
%   X       independent covariate, same size as Y
%
% OUTPUT
%   S       array size (length(Y), length(beta)) with 
%           each column the sensitivity to each parameter
%   G       global sensitivity sqrt(sum(S,2))
%           same size as X, and can be used as weights

y0 = model(beta,x);             % compute baseline model output

rel_dbeta = 1e-3;                  % baseline relative dbeta you want to change your parameter with 0.1%
dbeta = abs(beta)*rel_dbeta;       % dbeta 


y1 = zeros(size(y0));           % initialize the response output
S  = zeros(length(y0),length(beta));   % initialize the sensitivity coefficients

for i = 1:length(beta)
   beta1 = beta;
   beta1(i) = beta1(i) + dbeta(i);
   y1 = model(beta1,x);
   S(:,i) = (y1 - y0)/dbeta(i)./y0;      % relative change in response to change in pararameter beta(i) The first part ((y1 - y0) is the numerical deriviive. 
end

G = sqrt(sum(S.^2,2)); 
