function decimaldate = date2decimaldate(y,yearpos,monthpos,daypos,vec)
% DATE2DECIMALDATE converts a cell array of text dates to decimal dates
%   decdate = date2decimaldate(y,yearpos,monthpos,daypos,vec)
%   
%   INPUTS:
%       Y       : cell array containing dates in strings
%       YEARPOS : vector of positions of year digits in the string 
%       MONTHPOS: vector of positions of month digits in the string 
%       DAYPOS  : vector of positions of day digits in the string 
%       VEC     : optional. If present, the dates Y are assumed to be
%                   vector format. See DATESTR for details on vector formats.
%
%

%  Last modified: Thu Sep 12 14:30:22 CEST 2013
%  Copyright (c) 2013


thisyear2D = datestr(now,11);

ndates = length(y);
dateyear  = zeros(size(y));
datemonth = zeros(size(y));
dateday   = zeros(size(y));

if nargin == 5
    for i = 1:ndates
        if ~isempty(y{i})
            y{i} = datestr(y{i},26);
        else
            y{i} = '';
        end
    end
    yearpos = [3 4];
    monthpos = [6 7];
    daypos = [9 10];
end
datesize = max([max(yearpos),max(monthpos),max(daypos)]);


for i = 1:ndates
    if isnumeric(y{i})
        y{i} = num2str(y{i});
    end
    if length(y{i})>=datesize
        if ~isempty(yearpos)
            dateyear(i)=str2double(y{i}(yearpos));
            if length(yearpos) == 2
                if dateyear(i)<=thisyear2D % add 2000
                    dateyear(i)=dateyear(i)+2000;
                else % add 1900
                    dateyear(i)=dateyear(i)+1900;
                end
            end
        end
        if ~isempty(monthpos)
            datemonth(i)=str2double(y{i}(monthpos));
            if ~isempty(daypos)
                dateday(i)=str2double(y{i}(daypos));
            else
                dateday(i)=15;
            end
        else
            datemonth(i)= 7;
            dateday(i)= 1;
        end
        
    end
end

decimaldate = dateyear+(datemonth-1)/12+(dateday-1)/365;

decimaldate(decimaldate<0) = nan;  % set empty dates to NaN

