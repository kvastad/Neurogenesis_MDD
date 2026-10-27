function delayedCurve = bcDelay(delay,bc)
% BCDELAY shifts the bomb curve to account for delayed integration
%   delayedCurve = bcDelay(delay,bc) returns a delayed bomb curve,
%   DELAYEDCRUVE, which is the same size as BC. BC must be a nx2 array with
%   the first column the time and the second column the values. If DELAY
%   is a scalar, the curve is delayed by a fixed amount DELAY. If DELAY is
%   a vector of length 2, the curve is delayed by a Gamma distribution with
%   parameters DELAY=[k,q], where Gamma =
%   k^q/gamma(q).*tau.^(q-1).*exp(-k*tau).
%   
%   The delayed curve is of the form X(t) = int_0^tmax x(t-tau) f(tau) dtau
%
%   Example
%
%   See also
%
%   Copyright 2012


if length(delay)==1,
    delayType = 'Dirac';
elseif length(delay)==2,
    delayType = 'Gamma';
else
    error('delay must be a vector of length 1 or 2');
end

t = bc(:,1);
delayedCurve = zeros(size(bc));
delayedCurve(:,1) = t;
a = 0;

switch delayType,
    case 'Dirac' % Dirac mass delay
        delayedCurve(:,2) = bInt_mex(t-delay,bc);
    case 'Gamma' % Gamma delay
        k = delay(1);
        q = delay(2);
        for i = 1:length(t),
            b = t(i)-(1);
            delayedCurve(i,2) = integral(@(tau) bInt_mex(t(i)-tau,bc).*gammapdf(tau,k,q),a,b);
        end
end

function y = gammapdf(tau,k,q)
% GAMMAPDF is the Gamma probability density function

y = k^q/gamma(q).*tau.^(q-1).*exp(-k*tau);


        
