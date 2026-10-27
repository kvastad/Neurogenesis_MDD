function y = nansum(X,varargin)
% NANSUM sums X after removing NaNs
%
%   Examples
%       x = [NaN 1 2 3];
%       nansum(x) = 6
%
%   See also SUM, NANVAR
%
%   Copyright 2011-2012

y = sum(X,varargin{:}); 
if y~=y % quickest way to check for NaN
    X(isnan(X)) = 0;
    y = sum(X,varargin{:});
end
