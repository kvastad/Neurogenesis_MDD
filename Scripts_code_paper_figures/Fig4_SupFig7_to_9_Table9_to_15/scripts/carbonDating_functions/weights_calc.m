%Weights calculation august 22  

%By how much the parameterchanges if I introduce carbon contamination
%%
onsetcontamination= age-1
%%

        g = @(t,a,pg) pg(1)*(t>pg(2)); 
        b = 'volterra';
        nbr_pars_g = 2;
        nbr_pars_b = 0;
        
%%


F=@(x,age) cAtmosZone(@c2pop_onset,[x(1)*ones(size(age)),1*ones(size(age)), onsetcontamination],age,bc2,zeros(size(age)),dd,zone,@cGBD2, [0],g,b,[],[nbr_pars_g, nbr_pars_b, 0]); 
[Xcontamination,Rcontamination,J,COVB,MSE] = nlinfit(age,c14,F,[0.1],options); 
%%
AICRcontamination=AICc(nansum(Rcontamination.^2),2,n)


%%
[S,G]=sensitivity_analysis(F, Xcontamination, age)

%% G is parameter sensitivity and 1/G is carbon sensitivity (how much the parameter changes if I change the carbon)  High values are very sensitive to coonttaminations. 
sensitivity_contamination=1./G
c_contamination=G./(G+1) %1./(sensitivity_c_contamination)


%% scen 1 constant turnover 1 pop 
F=@(x,age) cAtmosZone(@c2pop,[1, x(1)],age,bc2,zeros(size(age)),dd,zone,@cConstantTurnover,0); 
[X1,R1,J,COVB,MSE] = nlinfit(age,c14,F,[0.01],options); %'weights', c)


AICR1=AICc(nansum(R1.^2),2,n)


%%
[S,G]=sensitivity_analysis(F, X1, age);
%% G is by how much the carbon value changs when I change parameter. High values are more affected by changes in parameters 
sensitivity_carbon14change=G.*sqrt(sum(X1.^2))
c_carbon14change= 1./(1+G.*sqrt(sum(X1.^2)))


%the weight of when changing 14C values what effect it has on the
%parameters. Low weigt is high change in parameter with 14C change- and
%high weight is little change in parameters when changing 14C 

%%

massweight=Mass

%%
massweight(massweight <= 5) = 0.5
massweight((massweight > 5) & (massweight <10)) = 1
massweight((massweight > 10) & (massweight <20)) = 1.5
massweight(massweight >= 20) = 2


%%

errweight=1./err_c14


%%
weight_cont_mass_14change=((c_contamination.*c_carbon14change.*errweight.*massweight)/40)%+0.1

