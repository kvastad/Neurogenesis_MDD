function y=cAdjustedForPloidy(a,t,bc,k)
% CADJUSTEDFORPLOIDY 14C level corrected for increase in ploidy
%   y=cAdjustedForPloidy(a,t,bc,k) is the 14c level of a cohort of
%   cardiomycocytes of age A, at time T, taking into account
%   polyploidisation K. The atmospheric 14C levels are BC.
%
%   Examples
%   A cell aged a=24 years at calendar year t=1996, which is polyploidizing
%   up to a differential DNA content k=53, will have a 14C level of
%
%       cAdjustedForPloidy(24,1996,bc,53)
%
%       ans =
%
%           423.4382
%
%   See also BINT, CADJUSTEDFORINCREASINGPLOIDY.
%
%   Copyright 2008-2016

global ADJUST_FOR_PLOIDY
global PLOIDY_SCENARIO
global PLOIDY_D0
global PLOIDY_KMEAN
global PLOIDY_THETA
global PLOIDY_N

% ploidization parameters from Science, 2009
n=5.4;      % fit with Olaf's data
theta=7.0;  % fit with Olaf's data
d0=110.5;   % fit with Olaf's data

if exist('PLOIDY_D0','var')
    d0 = PLOIDY_D0;
end
if exist('PLOIDY_THETA','var')
    theta = PLOIDY_THETA;
end
if exist('PLOIDY_D0','var')
    n = PLOIDY_N;
end
if exist('PLOIDY_KMEAN','var')
    k_mean = PLOIDY_KMEAN;
end
if exist('PLOIDY_SCENARIO','var')
    scen = PLOIDY_SCENARIO;
end


y=zeros(size(a));

% QUAD
% tol=1e-1
%-----

% Simpsons quadrature
N = 699;
w0 = ones(1,N);
w0(2:2:N-1) = 4;
w0(3:2:N-2) = 2;  % weights
% -------------------



if ADJUST_FOR_PLOIDY
    if ~strcmp(scen,'healthy') % then k must be an array of ploidy parameters
        % k = [a_start, k_diff]
        if length(k) ~= 2
            error('carbonDating:cAdjustedForPloidy:adjust_for_ploidy', ... 
            'ploidy parameter K must be and array of length 2 when using scenarios different from ''healthy''.');
        end
        a_start = k(1);
        k_diff  = k(2);
    end
    switch scen
        case 'healthy'
            for i=1:length(a)
                if a(i)==0
                    y(i)=bInt_mex(t,bc);
                else
                    nd=d0+k./(1+(a(i)/theta).^(-n)); % dnacontent(a(i),k);
                    
                    % Use simpsons quadrature instead of integral to be faster
                    % Use quad to be more precise
                    
                    % QUAD
                    %             y(i)=(quad(@(s) integrand(s,a(i),t,bc,k),0,a(i),tol)+d0*bInt_mex(t-a(i),bc))/nd;
                    % ----
                    
                    % Simpsons quadrature
                    h = (a(i)-0)/(N-1);
                    w = w0*h/3;
                    s = (0:h:a(i)).';
                    y(i)=(w * (bInt_mex(t-a(i)+s,bc).*k*n.*(s/theta).^(n-1)./theta./(1+(s/theta).^(n)).^2) + ...
                        d0*bInt_mex(t-a(i),bc))/nd;
                    % -------------------
                end
            end
        case 'early'
            for i=1:length(a)
                if a(i)==0
                    y(i)=bInt_mex(t,bc);
                else

                end
            end
        case 'prog'
            for i=1:length(a)
                if a(i)==0
                    y(i)=bInt_mex(t,bc);
                else
                    if a(i)>a_start
                        k_slope = max(k_diff/(a(i)-a_start),0); % make sure it is positive
                    else
                        k_slope = 0; % use only mean ploidization curve
                    end
                    
                    nd=d0+k_mean./( 1+(a(i)/theta).^(-n) ) + ... % normal mean ploidy
                        (a(i)-a_start).*(a(i)>a_start)*k_slope;  % extra adult ploidy
                    
                    
                    % Simpsons quadrature
                    h = (a(i)-0)/(N-1);
                    w = w0*h/3;
                    s = (0:h:a(i)).';
                    y(i)=(  w * ( bInt_mex(t-a(i)+s,bc).* ...
                                  k_mean*n.*(s/theta).^(n-1)./theta./(1+(s/theta).^(n)).^2 + ...  
                                  k_slope*(a(i)>a_start) ...
                                ) + ...
                            d0*bInt_mex(t-a(i),bc) ...
                         )/nd;
                    % -------------------
                end
            end
        case 'late'
            for i=1:length(a)
                if a(i)==0
                    y(i)=bInt_mex(t,bc);
                else
                    
                end
            end
    end
else % no ploidy - just plain bInt
    y=bInt_mex(t-a,bc);
end



end




