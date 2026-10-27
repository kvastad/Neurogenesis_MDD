function [y ynum yden]=cConstantTurnover(par,t,bc,k,d)
% CCONSTANTTURNOVER (A) 14C level constant turnover
%   [y ynum yden]=cConstantTurnover(par,t,bc,k) gives the 14C level of a cell pop n(t,a)
%   with turnover rate G, when in a patient of age T, using bombcurve data
%   BC, adult differential DNA content K and date of collection D. PAR=[G].
%
%   INPUT:
%       PAR:    [G]
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
%   2007.8. If the cardiomyocyte turnover rate is g=0.008, the expected 14C
%   content in DNA is
%
%       cConstantTurnover(0.008,82,bc,78,2007.8)
%
%       ans =
%
%           76.3159
%
%   See also CCONSTANTBIRTHCONSTANTDEATH, CDECREASINGTURNOVER,
%   CAGEDEATHLINEAR, CAGEDEATHINVERSE, CCONSTANTBIRTHAGEDEATH,
%   CTIMEBIRTHCONSTANTDEATH, CTIMEBIRTHAGEDEATH, CADJUSTEDFORPLOIDY.
%
%   Copyright 2008-2016

par=abs(par);

nt=length(t);
y=zeros(nt,1);
ynum=zeros(nt,1);
yden=ones(nt,1);

parfor i=1:nt
    ti = t(i);
    if ~isnan(ti)
        di = d(i);
        ki = k(i,:);
        %   to speed up, no check of the validity of the arguments is made
        %     ynum(i)=cAdjustedForPloidy(t(i),d(i),bc,k(i)).*exp(-par*t(i))+...
        %         integral(@(a) cAdjustedForPloidy(a,d(i),bc,k(i)).*par.*exp(-par*a),0,t(i)); % here
        %INTEGRAL seems to be two to three times slower than QUAD. Keeping
        %QUAD.
        
        ynum(i)=cAdjustedForPloidy(ti,di,bc,ki).*exp(-par*ti)+...
            quad(@(a) cAdjustedForPloidy(a,di,bc,ki).*par.*exp(-par*a),0,ti,1e-4);
        
        % Use of in-house Simpsons quadrature. To check the accuracy, use quad
        %     ynum(i)=cAdjustedForPloidy(t(i),d(i),bc,k(i)).*exp(-par*t(i))+...
        %         simpsons(@(a) cAdjustedForPloidy(a,d(i),bc,k(i)).*par.*exp(-par*a),0,t(i));
        
        y(i)=ynum(i);
    else
        y(i)=NaN;
    end
end