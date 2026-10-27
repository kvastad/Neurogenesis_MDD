function [y ynum yden]=cAgeDeathInverse(par,t,bc,k,d)
% CAGEDEATHINVERSE (E2) 14C level cumulative survival inverse decreasing
%   [y ynum yden]=cAgeDeathInverse(par,t,bc,k,d) gives the 14C level of a cell pop
%   n(t,a) with turnover rate G=G0*G1/(G1+A), when in a patient of age T,
%   using bombcurve data BC and adult differential DNA content K and date
%   of collection D. PAR=[G0 G1].
%
%   INPUT:
%       PAR:    [G0 G1]
%       T:      Age of the subject at collection
%       BC:     Bomb curve
%       K:      differential ploidy (set to 0 if not relevant)
%               Can be an array if complex ploidisation scenarios are 
%               considered. See cAdjustedForPloidy
%       D:      Date of sample collection. In case of death, this is the
%               date of death
%
%   OUTPUT:
%       Y:      Predicted 14C level (in the same units as BC). It is in the
%               form Y=YNUM/DEN, with YNUM the total 14C content and YDEN the cell
%               number
%       YNUM:   Predicted total 14C level
%       YDEN:   Predicted cell number
%
%   Examples
%   The bombcurve is stored in bc (in Delta14C).
%   A patient aged t=82 years, with differential DNA content k=78, died in
%   2007.8. If the cardiomyocyte turnover rate is g=0.13*1.5/(1.5+a), the expected 14C
%   content in DNA is
%
%       cAgeDeathInverse([0.13 1.5],82,bc,78,2007.8)
%
%       ans =
%
%           42.9207
%
%   See also CCONSTANTTURNOVER, CCONSTANTBIRTHCONSTANTDEATH, CDECREASINGTURNOVER,
%   CAGEDEATHLINEAR, CCONSTANTBIRTHAGEDEATH,
%   CTIMEBIRTHCONSTANTDEATH, CTIMEBIRTHAGEDEATH, CADJUSTEDFORPLOIDY.
%
%   Copyright 2008-2016

% tol=1e-4;
g0=abs(par(1));
g1=abs(par(2));

nt=length(t);
y=zeros(nt,1);
ynum=zeros(nt,1);
yden=zeros(nt,1);

for i=1:nt
    
%     % QUAD
%     ynum(i)=cAdjustedForPloidy(t(i),d(i),bc,k(i)).*(g1./(g1+t(i))).^(g0*g1)...
%         +quad(@(a) cAdjustedForPloidy(a,d(i),bc,k(i)).*beta(t(i)-a,[g0 g1]).*(g1./(g1+a)).^(g0*g1),0,t(i),tol);
%     yden(i)=(g1./(g1+t(i))).^(g0*g1)...
%         +quad(@(a) beta(t(i)-a,[g0 g1]).*(g1./(g1+a)).^(g0*g1),0,t(i),tol);
%     % ----
    
    % Simpsons quadrature. To check the accuracy, use quad
    ynum(i)=cAdjustedForPloidy(t(i),d(i),bc,k(i,:)).*(g1./(g1+t(i))).^(g0*g1)...
        +simpsons(@(a) cAdjustedForPloidy(a,d(i),bc,k(i,:)).*beta(t(i)-a,[g0 g1]).*(g1./(g1+a)).^(g0*g1),0,t(i));
    yden(i)=(g1./(g1+t(i))).^(g0*g1)...
        +simpsons(@(a) beta(t(i)-a,[g0 g1]).*(g1./(g1+a)).^(g0*g1),0,t(i));
    % ----------------------------------------------------
    
    y(i)=ynum(i)/yden(i);
    
end

end

function y=beta(t,g)
% BETA production rate for cumulative damage

y=volterra(@volterraFunInverse,t,g,401);

end
