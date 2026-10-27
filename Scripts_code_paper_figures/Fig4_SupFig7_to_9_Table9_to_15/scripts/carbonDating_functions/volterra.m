function x=volterra(fun,t,par,n)
% VOLTERRA solves the Volterra equation 2nd kind
%   x=volterra(fun,t,par,n) solves the Volterra equation with death rate
%   fun @FUN. @FUN is a function FUN(a,par), with PAR given in argument of
%   VOLTERRA, from time 0 to max(T), and returns the solution X
%   interpolated at time point T. Optional N is the number of points to
%   compute (the larger the better but more numerically costly, default
%   N=51).
%
%   INPUT:
%       FUN:    FUN(a,par) is the function in the Volterra equation 
%       T:      vector of positive times where the solution X should be returned
%       PAR:    parameters to be passed to FUN
%       N:      optional number of points for solving the equation
%
%   OUTPUT:
%       X:      solution interpolated at time points T (same size as T)
%
%   Examples 
%   Calculate the birth rate needed to maintain a population
%   constant up to tfinal=25 when the death rate is given by the function
%   volterraFunInverse with par=[0.02 1.2]
%
%       x = volterra(@volterraFunInverse,0:25,[0.02 1.2]);
%       plot(t,x)
%
%   See also VOLTERRAFUNINVERSE, VOLTERRAFUNLINEAR, CAGEDEATHINVERSE,
%   CAGEDEATHLINEAR
%
%   Copyright 2008-2012

if nargin<4
    n=51; % set to larger values for more precision
end
maxt = max(t);
dt=maxt/(n-1);
if maxt==0,
    x=0;
elseif isnan(maxt)
    x=nan(size(t));
else % volterra algorithm   
    % solve the system x(t) = f(t) + int_0^t x(t-a)f(a)da
    ti=linspace(0,maxt,n)';
    f=feval(fun,ti,par);

    % establish the system A*x = f with a trapezoidal rule for the integral
    % term
    A = voltmat_mex(f,dt);
    x = A\f;
    
    lt=length(t);
    [~,nt]=size(t);
    if nt>1 && lt > 1;
        %x=interp1q(ti,x,t')';
        x=nakeinterp1(ti,x,t')';
    elseif nt == 1 && lt > 1
        %x=interp1q(ti,x,t);
        x=nakeinterp1(ti,x,t);
    end
end
