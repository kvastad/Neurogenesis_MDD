%%senescence rate from controls bc1 with prior 


%% Scenario 2POP A Individual turnover rates with fixed renewing fractions
%%
clear
load('results/datasets/NeuNpos_ALL_foodlag_1.mat')
%%
senescence=0.0340084887311051;



Xindturn_9_2_prior_weightsfrombc1=zeros(n,1);
rindturn_9_2_prior_weightsfrombc1=zeros(n,1);
%%



s.ca = [10, 20;
        30, 20;
        70, 15];
s.dg = [10, 18;
        30, 18;
        70, 15];
    
options = optimset('TolFun',1e-10,'TolX',1e-12);

parfor i=1:n
   if (~(isnan(age(i)) || isnan(c14(i)) || isnan(dd(i)) ))
%         fprintf('\nsubject i=%d: age=%f, 14Clevel=%f\n',i,age(i),c14(i));
    
cbdopts = cbdset(); % initialize the options

cbdopts.nbpar.fraction_renewing = 1;
cbdopts.nbpar.death = 1;
cbdopts.nbpar.birth = 0;
cbdopts.nbpar.senescence = 1;
cbdopts.nbpar.sendeath = 2;
cbdopts.nbpar.nrdeath  = 2;
cbdopts.death = @(t,a,pg) pg;
cbdopts.senescence = @(t,a,ps) ps*(t<=a);
cbdopts.sendeath   = @(t,a,pd) pd(1)*(t<=30)+pd(2)*(t>30);
cbdopts.nrdeath    = @(t,pd) pd(1)*(t<=30)+pd(2)*(t>30);
cbdopts.birth = 'volterra_on_renewing';
cbdopts.bc = bc2;
cbdopts.bc_zone = zone(i);
cbdopts.age = age(i);
cbdopts.doc = dd(i); 
cbdopts.k_ploidy = 0;

 
        FAind=@(x)  (cgenbds([s2p2('IR',s), x(1), senescence, s2p2('SDR',s,1,[senescence, senescence]), s2p2('NRDR',s)],cbdopts)-c14(i)).^2;
        [Xtemp,Rtemp,Exitflag]=fminsearch(FAind,0.1,options);  %FAind is run at both 0.1 and 0.01 
        if Exitflag==-1
            Xtemp = -1;
            Rtemp = -1;
        else
            Xtemp=abs(Xtemp);
           Xindturn_9_2_prior_weightsfrombc1(i)=Xtemp;
           rindturn_9_2_prior_weightsfrombc1(i) = Rtemp;
        end
        fprintf('\nsubject i=%d, turnover rate=%f per year\n',i,Xindturn_9_2_prior_weightsfrombc1(i));
    else
        Xindturn_9_2_prior_weightsfrombc1(i)=NaN;
%         fprintf('\nData missing\n');
    end
end

%%

save('results/datasets/NeuNpos_ALL_foodlag_1.mat')
%%


