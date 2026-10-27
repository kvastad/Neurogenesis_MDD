function [data, bc] = turnover(totCols,workbook,worksheet,fileout,opt,c14ErrorCoefficient)
% TURNOVER turnover rates of biological samples based on 14C levels
%   [data, bc] = turnover(totCols,workbook,worksheet,fileout,options,c14ErrorCoefficient)
%
%   Version in development
%
%   Mandatory FIELDS in the Excel sheet
%       AGE         age of the subject
%       Delta14C    carbon level
%       DOC         date of collection
%
%   (c) 2014

load bombcurveDelta14C_2012

% smooth the bombcurve
id2000 = find(bc(:,1) >= 2000,1);
bc2000 = bc(id2000:end,:);
wts = [1/24;repmat(1/12,11,1);1/24];
bc2000f = conv(bc2000(:,2),wts,'valid');
bc2000y = bc2000(7:end-6,1);

bc_nonsmoothed = bc;
bc = bc_nonsmoothed(1:id2000,:);
bc = [bc; bc2000y, bc2000f];

if isfield(opt,'head')
    head = opt.head;
else
    head = [2,3,4];
end

data   = import14CfromExcel(totCols,workbook,worksheet,head);

%% DATA

if ~exist('c14ErrorCoefficient','var')
    c14ErrorCoefficient = 0;
end

if c14ErrorCoefficient ~= 0
    warning('c14ErrorCoefficient = %d',c14ErrorCoefficient);
end

lengthdata = length(data);
selectedData = true(lengthdata,1);

if ~iscol(data,'DOC') && iscol(data,'DOCTXT')
    disp('Numerical date of collection (DOC) not found, but a text DOC was found:')
    disp(data.DOCTXT)
    
    re = input('Enter the date format (default ''DD/MM/YYYY''): ');
    if isempty(re)
        re = 'DD/MM/YYYY';
    end
    yearpos = regexp(re,'[yY]');
    monthpos = regexp(re,'[mM]');
    daypos = regexp(re,'[dD]');
    data.DOC = date2decimaldate(data.DOCTXT,yearpos,monthpos,daypos);
end

if iscol(data,'AGE')
    age=data.AGE(selectedData);
else
    age=data.DOC(selectedData)-data.DOB(selectedData);
    data.AGE = age;
end
c14=data.Delta14C(selectedData)+c14ErrorCoefficient*data.Delta14C_ERR(selectedData);
dd=data.DOC(selectedData);
n=sum(selectedData);
kind = zeros(size(age));
c = ones(size(age));

%% LAGS
% set the foodLag
foodLag = 1.0;
% set development start
a0 = 0.0;

%% CONTAMINATION
% warning('Using global variable cont_rate.');
% global cont_rate;
% c14cont = bInt(dd,bc);
% c14pure = (c14 - c14cont*cont_rate)/(1-cont_rate);
% c14 = c14pure;

%% A individual turnover rates
XAind=zeros(n,1);
RAind=zeros(n,1);
XAind_slow=nan(n,1);
RAind_slow=nan(n,1);

options = optimset('TolFun',1e-10,'TolX',1e-12);
if isfield(opt,'slow')
    computeSlowTurnover = opt.slow;
else
    computeSlowTurnover = false;
end
maxtry = 10;

for i=1:n
    if (~(isnan(age(i)) || isnan(c14(i)) || isnan(dd(i)) || c(i)==0 ))
        fprintf('\n--\ni=%3d, age=%f, 14C=%f\n',i,age(i),c14(i));
        clear FAind
        FAind=@(x) (cConstantTurnover(x,age(i)+a0,bcDelay(foodLag,bc),kind(i),dd(i))-c14(i)).^2;
        if c14(i) >= bInt(dd(i),bcDelay(foodLag,bc))
            Rtemp = 1;
            Xtemp = Inf;
            x1 = 0.01;
            x2 = 10;
            ntry = 0;
            while (Rtemp > 1e-3) && (ntry < maxtry)
                [Xtemp,Rtemp,Exitflag]=fminbnd(FAind,x1,x2,options);
                fprintf('    Residual = %f, XA = %f, exitflag=%d\n',Rtemp,Xtemp,Exitflag);
                x1 = 0.9*x1;
                %                 x2 = 2*x2;
                ntry = ntry + 1;
            end
            
            Xtemp=abs(Xtemp);
            XAind(i)=Xtemp;
            RAind(i)=Rtemp;
        else % turnover is infinite
            XAind(i) = Inf;
            RAind(i) = abs( c14(i) - bInt(dd(i),bcDelay(foodLag,bc)) );
        end
        fprintf('       turnover rate=%f per year, residual=%1.4e\n',XAind(i),RAind(i));
        
        if (dd(i) - age(i) < 1965.5) && (c14(i) >= bInt(dd(i)-age(i),bcDelay(foodLag,bc)))
            Rtemp_slow = 1;
            Xtemp_slow = NaN;
            x1 = 0;
            x2 = 0.01;
            if(computeSlowTurnover)
                ntry = 0;
                while (Rtemp_slow > 1e-8) && (ntry < maxtry)
                    [Xtemp_slow,Rtemp_slow,Exitflag]=fminbnd(FAind,x1,x2,options);
                    fprintf('    Slow Residual = %f, XA = %f, exitflag\n', ...
                        Rtemp_slow,Xtemp_slow,Exitflag);
                    %                 x1 = 0.9*x1;
                    x2 = 2*x2;
                    ntry = ntry+1;
                end
            end
            Xtemp_slow=abs(Xtemp_slow);
            XAind_slow(i)=Xtemp_slow;
            RAind_slow(i)=Rtemp_slow;
        end
    else
        XAind(i)=NaN;
        RAind(i)=NaN;
        fprintf('\n--\ni=%3d, Data missing\n',i);
    end
end

%% Save and export

data.XA = XAind;
data.XAGE = 1./XAind;
data.XAGEEXP = (1-exp(-XAind.*data.AGE))./XAind;
data.RA = RAind;
data.XA_SLOW = XAind_slow;
data.XAGE_SLOW = (1-exp(-XAind_slow.*data.AGE))./XAind_slow;
data.RA_SLOW = RAind_slow;

% if computeSlowTurnover, choose the slow turnover over the fast one

data.NOTE = repmat({'NA'},length(data),1);
data.TURNOVER = nan(length(data),1);
data.RESIDUAL_TURNOVER = nan(length(data),1);
for i = 1:length(data)
    if computeSlowTurnover == true
        if isfinite(data.XA_SLOW(i))
            data.TURNOVER(i) = data.XA_SLOW(i);
            data.RESIDUAL_TURNOVER(i) = data.RA_SLOW(i);
            data.NOTE{i} = 'bomb peak';
        elseif isnan(data.XA_SLOW(i)) && isinf(data.XA(i))
            data.TURNOVER(i) = nan;
            data.RESIDUAL_TURNOVER(i) = nan;
            data.NOTE{i} = 'no turnover could be found';
        elseif isnan(data.XA_SLOW(i)) && isfinite(data.XA(i))
            data.TURNOVER(i) = data.XA(i);
            data.RESIDUAL_TURNOVER(i) = data.RA(i);
            data.NOTE{i} = 'bomb tail';
        end
    elseif isinf(data.XA(i))
        data.NOTE{i} = 'contemporary sample';
    end 
end
data.AVG_AGE = (1-exp(-data.TURNOVER.*data.AGE))./data.TURNOVER;

if ~isempty(fileout)
    export(data,'File',[fileout '.tab'])
end

end

function y = iscol(d,s)
% ISCOL test whether field S is in D

y = any(strcmp(fieldnames(d),s));

end

