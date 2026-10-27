function plotEstim(X,L,R,options)
% PLOTESTIM plots the results of BAYESESTIM
%
% See also BAYESESTIM, SETBAYESOPTIONS

%     Copyright 2017 Samuel Bernard
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

if nargin >= 3
    [m,n] = size(X);
end

if nargin == 1 || nargin == 4 % argument OPTIONS is passed in 
    optsOn = true;
    if isstruct(X) % plotting directly from the loaded datafile
        options = X;
        fprintf('Loading data file: %s ...\n',options.filename);
        data = load(options.filename);
        [m,n] = size(data);
        n = (n-1)/2;
        X = data(:,1:n);
        L = data(:,1+n);
        R = data(:,(2+n):(1+2*n));
    end
    
    nParnames = length(options.parNames);
    if nParnames < n % n number of parameters
        warning('plotEstim:parNames','Missing parameter names, using defaults.');
        for i = (nParnames+1):n
            options.parNames{i} = ['p' num2str(i)];
        end
    end
    
    if options.burnin>0 && m>options.burnin
        Xs = X((options.burnin+1):end,:);
        Ls = L((options.burnin+1):end,:);
        Rs = R((options.burnin+1):end,:);
        [m,n] = size(Xs);
    end
else
    optsOn = false;
end



if n>=2
    if optsOn
        maxDisplayNb = options.MaxPlot;
    else
        maxDisplayNb = 10000;
    end
    if m>maxDisplayNb % keep the last maxDisplayNb
        Xs = X((m-maxDisplayNb+1):m,:);
        Ls = L((m-maxDisplayNb+1):m,:);
        Rs = R((m-maxDisplayNb+1):m,:);
    end
else
    Xs = X;
    Ls = L;
    Rs = R;
end

normL = 3*Ls/mean(Ls);

%set marker size
mkrsize_r = 1;
mkrsize_a = normL.^2+1;

newplot;
checkhold = ishold;
if n==1,     % 1D
    subplot(131)
    plot(Xs,Ls,'.')
    if optsOn
        xlabel(options.parNames);
        ylabel('likelihood')
    end
    subplot(132)
    hist(X,40)
    if optsOn
        xlabel(options.parNames);
        ylabel('frequency')
    end
    subplot(133)
    plot(Rs,'.','Color',[0.5 0.5 0.5])
    hold on
    plot(Xs,'b.')
    if optsOn
        xlabel('iteration')
        ylabel(options.parNames)
    end
elseif n==2, % 2D
    H = ceil(256*Ls/max(Ls));
    scatter(Rs(:,1),Rs(:,2),mkrsize_r,[0.5 0.5 0.5],'o','filled')
    hold on
    scatter(Xs(:,1),Xs(:,2),mkrsize_a,H,'o','filled')
    if optsOn
        axis([options.lowerBound(1) options.upperBound(1) options.lowerBound(2) options.upperBound(2)]);
        xlabel(options.parNames{1})
        ylabel(options.parNames{2})
    end
else       % >= 3D
    for i=1:n
        for j=1:n
            subplot(n,n,n*(i-1) + j )
            if i==j
                hist(X(:,i),40)
                set(gca,'YTick',[])
                if optsOn
                    v = axis;
                    axis([options.lowerBound(i) options.upperBound(i) v(3) v(4)]);
                end
            else
                plot(Rs(:,j),Rs(:,i),'.','Color',[0.5 0.5 0.5])
                hold on
                scatter(Xs(:,j),Xs(:,i),4,Ls,'filled')
                if optsOn
                    axis([options.lowerBound(j) options.upperBound(j) options.lowerBound(i) options.upperBound(i)]);
                end
            end
            if j~=1 && j~=n %1 if i~=1 && i~=n
                set(gca,'YTick',[])
            elseif j==n
                set(gca,'YAxisLocation','right')
                if optsOn && i~=j
                    ylabel(options.parNames{i})
                end
            elseif j==1
                if optsOn && i~=j
                    ylabel(options.parNames{i})
                end
            end
            if i~=1 && i~=n
                set(gca,'XTick',[])
            elseif i==1
                set(gca,'XAxisLocation','top')
                if optsOn
                    xlabel(options.parNames{j});
                end
            elseif i==n
                if optsOn
                    xlabel(options.parNames{j});
                end
            end
            
            hold off
        end
    end
end


if ~checkhold
    hold off;
end
