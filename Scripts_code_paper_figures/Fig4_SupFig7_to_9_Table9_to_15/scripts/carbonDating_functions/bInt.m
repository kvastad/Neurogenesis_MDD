function y=bInt(date,bombcurve)
% BINT interpolation of atmospheric 14C levels
%   y=bInt(date,bombcurve) interpolates BOMBCURVE to return the 14C
%   level at date vector DATE. The BOMBCURVE is a two-column array with
%   dates in the first column and 14C levels in the second. bInt
%   extrapolates if DATE is outside the range
%   [min(BOMBCURVE(:,1),max(BOMBCURVE(:,1)].
%
%   Examples
%   If bc is a the bombcurve in Delta14C and 
%           date=[1956 1987];
%   then
%           bInt(date,bc) is
%                [9.1500  186.8500]
%
%   See also CADJUSTEDFORPLOIDY, CADJUSTEDFORINCREASINGPLOIDY, INTERP1
%
%   copyright 2006-2012

assert(isvector(date));

% dateRange = [min(date),max(date)];
% bcRange = [min(bombcurve(:,1)),max(bombcurve(:,1))];
% if (dateRange(2)>bcRange(2)) || (dateRange(1)<bcRange(1))
% %     warning('BOMBCURVE:Extrapolation','dates outside bombcurve range, extrapolating');
%     y=interp1(bombcurve(:,1),bombcurve(:,2),date,'linear','extrap');
% else
%     [~,n]=size(date);
%     if n>1,
%         date=date';
%         %y=interp1q(bombcurve(:,1),bombcurve(:,2),date)';
%         y=nakeinterp1(bombcurve(:,1),bombcurve(:,2),date)';
%     else
%         %y=interp1q(bombcurve(:,1),bombcurve(:,2),date);
%         y=nakeinterp1(bombcurve(:,1),bombcurve(:,2),date);
%     end
%     
% end

% using nakeinterp1 to extrapolate, NO WARNING whatsoever!
[~,n]=size(date);
if n>1,
    date=date';
    %y=interp1q(bombcurve(:,1),bombcurve(:,2),date)';
    y=nakeinterp1(bombcurve(:,1),bombcurve(:,2),date)';
else
    %y=interp1q(bombcurve(:,1),bombcurve(:,2),date);
    y=nakeinterp1(bombcurve(:,1),bombcurve(:,2),date);
end
