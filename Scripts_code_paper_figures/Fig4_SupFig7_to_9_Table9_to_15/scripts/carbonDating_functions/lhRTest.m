function [pv,D] = lhRTest(r,a,n,q,p)
% lhRTest likelihood-ratio test  
% INPUT
%   R:          SSE for the restricted model
%   A:          SSE for the alternative model
%   N:          number of samples
%   Q:          number of parameters in the restricted model
%   P:          number of parameters in the alternative model
%
% OUTPUT
%   PV:         p-value 
%   D:          Likelihood ratio test statistics ~ CHI2 with p-q
%               degrees of freedom

mle_restr = -n/2*log(r/n);
mle_altern = -n/2*log(a/n);
Lambda = mle_altern - mle_restr;

D = 2*Lambda;

pv = 1 - chi2cdf(D,p-q);