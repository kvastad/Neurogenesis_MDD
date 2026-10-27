function [y, ynum, yden]=c2pop_onset(par,t,bc,k,d,cfun,death,varargin)
% C2POP_ONSET 14C level with 2 subpopulations
%   [y ynum yden]=c2pop_onset(pars,t,bc,kind,d,cfun,death,varargin) is a scenario
%   combining two subpopulations, with turnover parameters PARS, in a
%   subject aged T, with delta ploidy KIND, and sample collected at date D.
%   The turnover dynamics is given by function CFUN, and DEATH is a Bool
%   indicating whether there is death in the first subpopulation.
%
%   The population contains two subsets. The first subset is not renewing
%   (there is no birth), but if DEATH=1, there is death. The death rate is
%   t-dependent and concentrated at a single time THETA, at which 
%   a fraction DEATH_FRAC of non-renewing cells die.
%   Renewing cell renew according to a scenario defined by the function CFUN.
%
%   The total number of cells can change, so EPSILON is the fraction of the
%   renewing population (the 2nd subset) at T=0.
%
%   If DEATH=1, PARS = [EPSILON THETA DEATH_FRAC CFUN_PARS];
%
%   If DEATH=0, THETA = INFINITY and DEATH_FRAC = 0, and PARS = [EPSILON CFUN_PARS]
%
%   Examples: TODO
%
%   See also: TODO 

%     Copyright 2021 Samuel Bernard
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

% initializing
epsilon=par(1); % fraction of the population turning over
if death,
    theta=abs(par(2));      % age at which cell death occurs 
    death_fraction=abs(par(3)); % fraction of cells dying
    g=par(4:end);   % parameters for the turnover population
else
    theta=inf;
    death_fraction=0;
    g=par(2:end);
end
nt=length(t);
y=zeros(nt,1);
ynum=zeros(nt,1);
yden=ones(nt,1);

% computing turnover data
[~, cfun_ynum, cfun_yden]=cfun(g,t,bc,k,d,varargin{:}); % turning over population
parfor i=1:nt
    ynum(i)=cAdjustedForPloidy(t(i),d(i),bc,k(i,:))*(1-epsilon)*( 1 - death_fraction*(t(i) >= theta) )+... % non turning over population
            cfun_ynum(i)*epsilon; % turning over population
    yden(i)=(1-epsilon)*( 1 - death_fraction*(t(i) >= theta) )+... % cell number in the 1st subset
            epsilon*cfun_yden(i); % cell number in the 2nd subset
    y(i)=ynum(i)/yden(i);  
end

end