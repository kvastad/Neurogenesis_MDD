function [y, ynum, yden]=c2pop(par,t,bc,k,d,cfun,death,varargin)
% C2POP 14C level with 2 subpopulations
%   [y ynum yden]=c2pop(pars,t,bc,kind,d,cfun,death,varargin) is a scenario
%   combining two subpopulations, with turnover parameters PARS, in a
%   subject aged T, with delta ploidy KIND, and sample collected at date D.
%   The turnover dynamics is given by function CFUN, and DEATH is a Bool
%   indicating whether there is death in the first subpopulation.
%
%   The population contains two subsets. The first subset is not renewing
%   (there is no birth), but if DEATH=1, there is death. The death rate is
%   t-dependent and is linear: gamma(t) = g0+g1*t. The second subset is
%   renewing, according to a scenario defined by the function CFUN.
%
%   The total number of cells can change, so EPSILON is the fraction of the
%   renewing population (the 2nd subset) at T=0.
%
%   If DEATH=1, PARS = [epsilon g0 g1 cfun_pars];
%
%   If DEATH=0, g0 and g1 are assumed to be 0, and PARS = [epsilon cfun_pars]
%
%   Examples: TODO
%
%   See also: TODO 
% 
%   Copyright 2008-2016

% initializing
epsilon=par(1); % fraction of the population turning over
if death,
    g0=abs(par(2));      % basal death rate in the non turnover population
    g1=0;      % increase in death rate of the non turnover population
    g=par(3:end);   % parameters for the turnover population
else
    g0=0;
    g1=0;
    g=par(2:end);
end
nt=length(t);
y=zeros(nt,1);
ynum=zeros(nt,1);
yden=ones(nt,1);

% computing turnover data
[~, cfun_ynum, cfun_yden]=cfun(g,t,bc,k,d,varargin{:}); % turning over population
parfor i=1:nt
    ynum(i)=cAdjustedForPloidy(t(i),d(i),bc,k(i,:))*(1-epsilon)*exp(-(g0+g1*(t(i)/2))*t(i))+... % non turning over population
            cfun_ynum(i)*epsilon; % turning over population
    yden(i)=(1-epsilon)*exp(-(g0+g1*(t(i)/2))*t(i))+... % cell number in the 1st subset
            epsilon*cfun_yden(i); % cell number in the 2nd subset
    y(i)=ynum(i)/yden(i);
end

end

