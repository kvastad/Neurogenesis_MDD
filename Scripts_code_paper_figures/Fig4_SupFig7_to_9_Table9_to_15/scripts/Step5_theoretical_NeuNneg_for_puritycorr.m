
%% 
%Step 2.2: modelling control NeuN- with no foodlag and no developmental
%star att -0.5 from alk modelling ffor consistency. 

clear

load('results/foodlags/NeuNneg_foodlag_05');


selectedData = data.LABELLING == 'NeuN+';

age=data.AGE(selectedData);
c14=data.F14C(selectedData);
err_c14=data.F14C_ERR(selectedData);
dd=data.DOC(selectedData);
dob=data.DOB(selectedData);
n=sum(selectedData);
sample_type = data.LABELLING(selectedData);
ID=data.ID(selectedData);
group=data.group(selectedData);
Mass=data.c_meas(selectedData);
BMI=data.BMI(selectedData);
c = ones(size(age));
kind = zeros(size(age));
zone=data.zone(selectedData);
fprintf('done...\n');


%% parameters from NeuNneg modelling best scenario 11 bc0.5 wights from bc 0.5 
    

options = optimset('TolFun',1e-10,'TolX',1e-12,'FunValCheck','on', 'Display','iter');
for i=1:n
    if (~(isnan(age(i)) || isnan(c14(i)) || isnan(dd(i)) ))
        
        
        clearvars FGBD
      
        %%
        fprintf('\n--\ni=%3d, age=%f, 14C=%f\n',i,age(i),c14(i));
        
  
     y_bestXMCMC11_weightsfrombc05(i)= cAtmosZone(@c2pop,[0.641383756743238,0.0329426703584062],age(i),bc2,0,dd(i),zone(i),@cConstantTurnover,0)
    
             end
end
%%
y_bestXMCMC11_weightsfrombc05=transpose(y_bestXMCMC11_weightsfrombc05)
%%
save('results/datasets/purity_corr/Theoretical_NeuNneg_for_NeuNpos_puritycorr_ALL_foodlag_05')
%%
