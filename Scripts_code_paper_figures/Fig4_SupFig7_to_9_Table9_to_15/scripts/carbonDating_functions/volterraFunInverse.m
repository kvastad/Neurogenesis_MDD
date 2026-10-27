function y=volterraFunInverse(t,par)
% VOLTERRAFUNINVERSE relates to the death rate gamma(a) inverse
%   y=volterraFunInverse(t,par) is related to the age-dependent death rate
%   gamma(a) = g0*g1/(g1+a).
%
%   Examples 
%   Calculate the birth rate needed to maintain a population
%   constant up to t=25 when the death rate is given by the function
%   volterraFunInverse with par=[0.02 1.2]
%
%       [x ti] = volterra(@volterraFunInverse,25,[0.02 1.2]);
%       plot(t,x)
%
%   See also VOLTERRA
%
%   Copyright 2008-2012

g0=par(1);
g1=par(2);
y=g0*g1./(g1+t).*(g1./(g1+t)).^(g0*g1);

