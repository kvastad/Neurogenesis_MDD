function [y ynum yden]=cDecreasingTurnover(par,t,bc,k,d,f)
% CDECREASINGTURNOVER (C) 14C level time-decreasing turnover
%   [y ynum yden]=cDecreasingTurnover(par,t,bc,k,d,f) gives the 14C level of a cell pop
%   n(t,a) with turnover rate given by the function F, when in a patient of
%   age T, using bombcurve data BC and adult differential DNA content K and
%   date of collection D. PAR=[G0 G1]. The optional F is one of the three
%   values:
%
%   1: Linear gamma(t)=g0-g1*t (linear decrease)
%   2: Inverse gamma(t)=g0*g1/(g1+t)
%   3: Step function gamma(t)=g0*(t<g1) %Emblas comment: g1 is age I
%   cansimulate this scenario by setting G1 to 0 in scenario 4 below. 
%   4: Step function gamma(t)=g0*(t<theta)+g1*(t>=theta)
%   5: Exponential decreasing function: gamma(t)=g0*exp(-g1*t)
%   6: Step function with sample dependent threshold gamma(t)=g0*(t<theta)+g1*(t>=theta)
%        where theta is given %% Threshold theta is sample dependent. 
%
%   INPUT:
%       PAR:    [G0 G1] for F=1, 2, 3 or 6 and [G0 G1 THETA] for F=4
%       T:      Age of the subject at collection
%       BC:     Bomb curve
%       K:      differential ploidy (set to 0 if not relevant)
%               Can be an array if complex ploidisation scenarios are 
%               considered. See cAdjustedForPloidy
%       D:      Date of sample collection. In case of death, this is the
%               date of death
%       F:      Function to use for the turnover rate (see above for the list)
%
%   OUTPUT:
%       Y:      Predicted 14C level (in the same units as BC). It is in the
%               form Y=YNUM/DEN, with YNUM the total 14C content and YDEN the cell
%               number
%       YNUM:   Predicted total 14C level
%       YDEN:   Predicted cell number
%
%
%   Examples
%   The bombcurve is stored in bc (in Delta14C).
%   A patient aged t=82 years, with differential DNA content k=78, died in
%   2007.8. The turnover function is fun=2: gamma(t)=g0*g1/(g1+t), with
%   g0=0.02 and g1=5.4. The expected 14C content in DNA is
%
%       cDecreasingTurnover([0.02 2.4],82,bc,78,2007.8,2)
%
%       ans =
%
%           15.2293
%
%   See also CCONSTANTTURNOVER, CCONSTANTBIRTHCONSTANTDEATH,
%   CAGEDEATHLINEAR, CAGEDEATHINVERSE, CCONSTANTBIRTHAGEDEATH,
%   CTIMEBIRTHCONSTANTDEATH, CTIMEBIRTHAGEDEATH.
%
%   Copyright 2008-2016


tol=1e-4;

nt=length(t);
y=zeros(nt,1);
ynum=zeros(nt,1);
yden=ones(nt,1);

% if iscell(f)
%     f = f{1};
% end

switch f
    case 1 % Linear
        g0=abs(par(1)); %
        g1=abs(par(2));
        for i=1:nt
            if length(k)==1,
                kk=k;
            else
                kk=k(i,:);
            end
            if length(d)==1,
                doc=d;
            else
                doc=d(i);
            end
            ynum(i)=cAdjustedForPloidy(t(i),doc,bc,kk).*exp(-(g0-g1*(t(i)/2))*t(i))...
                +quad(@(a) cAdjustedForPloidy(a,doc,bc,kk).*(g0-g1*(t(i)-a)).*exp(-(g0-g1*(t(i)-a/2)).*a),0,t(i),tol);
            y(i)=ynum(i);
        end
    case 2 % Inverse
        g0=abs(par(1));
        g1=1/abs(par(2)); % g1 is time and parameter is 1/time its a rate to be consistent with definition of other functions
        for i=1:nt
            if length(k)==1,
                kk=k;
            else
                kk=k(i,:);
            end
            if length(d)==1,
                doc=d;
            else
                doc=d(i);
            end
            ynum(i)=cAdjustedForPloidy(t(i),doc,bc,kk).*(1/(1+g1*t(i))).^(g0/g1)+...
                quad(@(a) cAdjustedForPloidy(a,doc,bc,kk).*g0./(1+g1*(t(i)-a)).*...
                ((1+g1*(t(i)-a))/(1+g1*t(i))).^(g0/g1),0,t(i),tol);
            yden(i)=(1/(1+g1*t(i))).^(g0/g1)+...
                quad(@(a) g0./(1+g1*(t(i)-a)).*...
                ((1+g1*(t(i)-a))/(1+g1*t(i))).^(g0/g1),0,t(i),tol);
            y(i)=ynum(i)/yden(i);
        end
    case 3 % Step
        g0=par(1);
        theta=par(2);
        for i=1:nt
            if length(k)==1,
                kk=k;
            else
                kk=k(i,:);
            end
            if length(d)==1,
                doc=d;
            else
                doc=d(i);
            end
            m=min(t(i),theta);
            ynum(i)=cAdjustedForPloidy(t(i),doc,bc,kk).*exp(-g0*m)...
                +quad(@(a) cAdjustedForPloidy(a,doc,bc,kk).*g0.*exp(-g0*(a-(t(i)-m))),t(i)-m,t(i),tol);
            %     yden(i)=exp(-g0*min(t(i),theta))...
            %         +quad(@(a) g0.*exp(-g0*(a-(t(i)-m))),t(i)-m,t(i),tol);
            y(i)=ynum(i);
        end
    case 4 % step 2
        g0=abs(par(1));
        g1=abs(par(2));
        theta=abs(par(3));
        for i=1:length(t)
            if length(k)==1,
                kk=k;
            else
                kk=k(i,:);
            end
            if length(d)==1,
                doc=d;
            else
                doc=d(i);
            end
            tt=t(i);
            ynum(i)=cAdjustedForPloidy(t(i),doc,bc,kk).*...
                exp(-(g0*min(tt,theta)+g1*(tt-theta)*(tt>theta)))+...
                quad(@(a) cAdjustedForPloidy(a,doc,bc,kk).*(g0*((tt-a)<=theta)+g1*((tt-a)>theta)).*...
                exp(-(g0*a*(tt<=theta)+...
                (g0*(theta-(tt-a))+g1*(tt-theta)).*(((tt-a)<=theta).*(tt>theta))+...
                g1*a.*((tt-a)>theta))),0,tt,tol);
            %     yden(i)=exp(-(g0*min(tt,theta)+g1*(tt-theta)*(tt>theta)))+...
            %         quad(@(a) (g0*((tt-a)<=theta)+g1*((tt-a)>theta)).*...
            %         exp(-(g0*a*(tt<=theta)+...
            %         (g0*(theta-(tt-a))+g1*(tt-theta)).*(((tt-a)<=theta).*(tt>theta))+...
            %         g1*a.*((tt-a)>theta))),0,tt,tol);
            y(i)=ynum(i);
        end
    case 5 % exponential
        g0=abs(par(1));
        g1=abs(par(2));
        for i=1:nt
            if length(k)==1,
                kk=k;
            else
                kk=k(i,:);
            end
            if length(d)==1,
                doc=d;
            else
                doc=d(i);
            end
            ynum(i)=cAdjustedForPloidy(t(i),doc,bc,kk).*exp( -g0/g1*(1-exp(-g1*t(i))) )...
                +quad(@(a) cAdjustedForPloidy(a,doc,bc,kk).*( g0*exp(-g1*(t(i)-a)) ).*exp( -g0/g1*exp(-g1*t(i))*(exp(g1*a)-1) ),0,t(i),tol);
            y(i)=ynum(i);
        end
    case 6 % step 3, subject dependent fixed theta
        g0=abs(par(1));
        g1=abs(par(2));
        for i=1:length(t)
            if length(k)==1,
                kk=k;
            else
                kk=k(i,:);
            end
            theta=kk(1); % subject dependent fixed theta
            if length(d)==1,
                doc=d;
            else
                doc=d(i);
            end
            tt=t(i);
            ynum(i)=cAdjustedForPloidy(t(i),doc,bc,kk).*...
                exp(-(g0*min(tt,theta)+g1*(tt-theta)*(tt>theta)))+...
                quad(@(a) cAdjustedForPloidy(a,doc,bc,kk).*(g0*((tt-a)<=theta)+g1*((tt-a)>theta)).*...
                exp(-(g0*a*(tt<=theta)+...
                (g0*(theta-(tt-a))+g1*(tt-theta)).*(((tt-a)<=theta).*(tt>theta))+...
                g1*a.*((tt-a)>theta))),0,tt,tol);
            %     yden(i)=exp(-(g0*min(tt,theta)+g1*(tt-theta)*(tt>theta)))+...
            %         quad(@(a) (g0*((tt-a)<=theta)+g1*((tt-a)>theta)).*...
            %         exp(-(g0*a*(tt<=theta)+...
            %         (g0*(theta-(tt-a))+g1*(tt-theta)).*(((tt-a)<=theta).*(tt>theta))+...
            %         g1*a.*((tt-a)>theta))),0,tt,tol);
            y(i)=ynum(i);
        end
end


