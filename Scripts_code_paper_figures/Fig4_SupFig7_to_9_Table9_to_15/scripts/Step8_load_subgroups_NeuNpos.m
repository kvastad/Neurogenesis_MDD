
%% 
%Step 2.2: modelling control NeuN+ with no foodlag and no developmental star att -0.5

clear

load('results/foodlags/NeuNpos_foodlag_0');


%%

selectedData = data.LABELLING == 'NeuN+' & strcmp(data.group,'Control');

age=data.AGE(selectedData);
c14=data.F14C_corr(selectedData);
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

%%
load('results/weights/weights_NeuNpos_control.mat')

weight_cont_mass_14change_frombc1= weights_NeuNpos_control


%%
save('results/datasets/NeuNpos_control_foodlag_0')
%%

%Step 2.2: modelling control NeuN+ with no foodlag and no developmental star att -0.5

clear

load('results/foodlags/NeuNpos_foodlag_05');


selectedData = data.LABELLING == 'NeuN+' & strcmp(data.group,'Control');

age=data.AGE(selectedData);
c14=data.F14C_corr(selectedData);
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



load('results/weights/weights_NeuNpos_control.mat')
weight_cont_mass_14change_frombc1= weights_NeuNpos_control

save('results/datasets/NeuNpos_control_foodlag_05')
%%

%Step 2.2: modelling control NeuN+ with no foodlag and no developmental star att -0.5

clear

load('results/foodlags/NeuNpos_foodlag_1');


selectedData = data.LABELLING == 'NeuN+' & strcmp(data.group,'Control');

age=data.AGE(selectedData);
c14=data.F14C_corr(selectedData);
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


%%
load('results/weights/weights_NeuNpos_control.mat')
weight_cont_mass_14change_frombc1= weights_NeuNpos_control
%%
save('results/datasets/NeuNpos_control_foodlag_1')

%% Step 2.2: modelling control NeuN+ with no foodlag and no developmental star att -0.5

clear

load('results/foodlags/NeuNpos_foodlag_15');


selectedData = data.LABELLING == 'NeuN+' & strcmp(data.group,'Control');

age=data.AGE(selectedData);
c14=data.F14C_corr(selectedData);
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

%%
%%
load('results/weights/weights_NeuNpos_control.mat')
weight_cont_mass_14change_frombc1= weights_NeuNpos_control
%%
save('results/datasets/NeuNpos_control_foodlag_15')

%%

%Step 2.2: modelling control NeuN+ with no foodlag and no developmental star att -0.5

clear

load('results/foodlags/NeuNpos_foodlag_2');


selectedData = data.LABELLING == 'NeuN+' & strcmp(data.group,'Control');

age=data.AGE(selectedData);
c14=data.F14C_corr(selectedData);
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

%%
%%
load('results/weights/weights_NeuNpos_control.mat')
weight_cont_mass_14change_frombc1= weights_NeuNpos_control

%%
save('results/datasets/NeuNpos_control_foodlag_2')

%% 
%Step 2.2: modelling control NeuN+ with no foodlag and no developmental star att -0.5

clear

load('results/foodlags/NeuNpos_foodlag_0');


selectedData = data.LABELLING == 'NeuN+' & (strcmp(data.group,'Coc') | strcmp(data.group,'Control')| strcmp(data.group,'ETOH'));

age=data.AGE(selectedData);
c14=data.F14C_corr(selectedData);
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

%%
load('results/weights/weights_NeuNpos_controlextended.mat') 
weight_cont_mass_14change_frombc1= weights_NeuNpos_controlextended

%%
save('results/datasets/NeuNpos_controlextended_foodlag_0')
%%

%Step 2.2: modelling control NeuN+ with no foodlag and no developmental star att -0.5

clear

load('results/foodlags/NeuNpos_foodlag_05');


selectedData = data.LABELLING == 'NeuN+' & (strcmp(data.group,'Coc') | strcmp(data.group,'Control')| strcmp(data.group,'ETOH'));

age=data.AGE(selectedData);
c14=data.F14C_corr(selectedData);
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

%%
load('results/weights/weights_NeuNpos_controlextended.mat') 
weight_cont_mass_14change_frombc1= weights_NeuNpos_controlextended

%%
save('results/datasets/NeuNpos_controlextended_foodlag_05')
%%

%Step 2.2: modelling control NeuN+ with no foodlag and no developmental star att -0.5

clear

load('results/foodlags/NeuNpos_foodlag_1');


selectedData = data.LABELLING == 'NeuN+' & (strcmp(data.group,'Coc') | strcmp(data.group,'Control')| strcmp(data.group,'ETOH'));

age=data.AGE(selectedData);
c14=data.F14C_corr(selectedData);
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

%%
load('results/weights/weights_NeuNpos_controlextended.mat') 
weight_cont_mass_14change_frombc1= weights_NeuNpos_controlextended
%%
save('results/datasets/NeuNpos_controlextended_foodlag_1')

%% Step 2.2: modelling control NeuN+ with no foodlag and no developmental star att -0.5

clear

load('results/foodlags/NeuNpos_foodlag_15');


selectedData = data.LABELLING == 'NeuN+' & (strcmp(data.group,'Coc') | strcmp(data.group,'Control')| strcmp(data.group,'ETOH'));

age=data.AGE(selectedData);
c14=data.F14C_corr(selectedData);
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

%%
load('results/weights/weights_NeuNpos_controlextended.mat') 
weight_cont_mass_14change_frombc1= weights_NeuNpos_controlextended
%%
save('results/datasets/NeuNpos_controlextended_foodlag_15')

%%

%Step 2.2: modelling control NeuN+ with no foodlag and no developmental star att -0.5

clear

load('results/foodlags/NeuNpos_foodlag_2');


selectedData = data.LABELLING == 'NeuN+' & (strcmp(data.group,'Coc') | strcmp(data.group,'Control')| strcmp(data.group,'ETOH'));

age=data.AGE(selectedData);
c14=data.F14C_corr(selectedData);
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

%%
load('results/weights/weights_NeuNpos_controlextended.mat') 

weight_cont_mass_14change_frombc1= weights_NeuNpos_controlextended
%%
save('results/datasets/NeuNpos_controlextended_foodlag_2')


%% 
%Step 2.2: modelling control NeuN+ with no foodlag and no developmental star att -0.5

clear

load('results/foodlags/NeuNpos_foodlag_0');


selectedData = data.LABELLING == 'NeuN+' & (strcmp(data.group,'RDD'));

age=data.AGE(selectedData);
c14=data.F14C_corr(selectedData);
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

%%
load('results/weights/weights_NeuNpos_RDD.mat')
weight_cont_mass_14change_frombc1= weights_NeuNpos_RDD

%%
save('results/datasets/NeuNpos_RDD_foodlag_0')
%%

%Step 2.2: modelling control NeuN+ with no foodlag and no developmental star att -0.5

clear

load('results/foodlags/NeuNpos_foodlag_05');


selectedData = data.LABELLING == 'NeuN+' & (strcmp(data.group,'RDD'));

age=data.AGE(selectedData);
c14=data.F14C_corr(selectedData);
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

%%
load('results/weights/weights_NeuNpos_RDD.mat')

weight_cont_mass_14change_frombc1= weights_NeuNpos_RDD
%%
save('results/datasets/NeuNpos_RDD_foodlag_05')
%%

%Step 2.2: modelling control NeuN+ with no foodlag and no developmental star att -0.5

clear

load('results/foodlags/NeuNpos_foodlag_1');


selectedData = data.LABELLING == 'NeuN+' & (strcmp(data.group,'RDD'));

age=data.AGE(selectedData);
c14=data.F14C_corr(selectedData);
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

%%
load('results/weights/weights_NeuNpos_RDD.mat')
weight_cont_mass_14change_frombc1= weights_NeuNpos_RDD
%%
save('results/datasets/NeuNpos_RDD_foodlag_1')

%% Step 2.2: modelling control NeuN+ with no foodlag and no developmental star att -0.5

clear

load('results/foodlags/NeuNpos_foodlag_15');


selectedData = data.LABELLING == 'NeuN+' & (strcmp(data.group,'RDD'));

age=data.AGE(selectedData);
c14=data.F14C_corr(selectedData);
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

%%
load('results/weights/weights_NeuNpos_RDD.mat')
weight_cont_mass_14change_frombc1= weights_NeuNpos_RDD
%%
save('results/datasets/NeuNpos_RDD_foodlag_15')

%%

%Step 2.2: modelling control NeuN+ with no foodlag and no developmental star att -0.5

clear

load('results/foodlags/NeuNpos_foodlag_2');


selectedData = data.LABELLING == 'NeuN+' & (strcmp(data.group,'RDD'));

age=data.AGE(selectedData);
c14=data.F14C_corr(selectedData);
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

%%
load('results/weights/weights_NeuNpos_RDD.mat')
weight_cont_mass_14change_frombc1= weights_NeuNpos_RDD

%%
save('results/datasets/NeuNpos_RDD_foodlag_2')
%%




%% 
%Step 2.2: modelling control NeuN+ with no foodlag and no developmental star att -0.5

clear

load('results/foodlags/NeuNpos_foodlag_0');


selectedData = data.LABELLING == 'NeuN+' & ~ strcmp(data.ID,'ND210');

age=data.AGE(selectedData);
c14=data.F14C_corr(selectedData);
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

%%
load('results/weights/weights_NeuNpos_ALL.mat')

weight_cont_mass_14change_frombc1= weights_NeuNpos_ALL

%%
save('results/datasets/NeuNpos_ALL_foodlag_0')
%%

%Step 2.2: modelling control NeuN+ with no foodlag and no developmental star att -0.5

clear

load('results/foodlags/NeuNpos_foodlag_05');


selectedData = data.LABELLING == 'NeuN+' & ~ strcmp(data.ID,'ND210');

age=data.AGE(selectedData);
c14=data.F14C_corr(selectedData);
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

%%
load('results/weights/weights_NeuNpos_ALL.mat')

weight_cont_mass_14change_frombc1= weights_NeuNpos_ALL

%%
save('results/datasets/NeuNpos_ALL_foodlag_05')
%%

%Step 2.2: modelling control NeuN+ with no foodlag and no developmental star att -0.5

clear

load('results/foodlags/NeuNpos_foodlag_1');


selectedData = data.LABELLING == 'NeuN+' & ~ strcmp(data.ID,'ND210');

age=data.AGE(selectedData);
c14=data.F14C_corr(selectedData);
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

%%
load('results/weights/weights_NeuNpos_ALL.mat')

weight_cont_mass_14change_frombc1= weights_NeuNpos_ALL

%%
save('results/datasets/NeuNpos_ALL_foodlag_1')

%% Step 2.2: modelling control NeuN+ with no foodlag and no developmental star att -0.5

clear

load('results/foodlags/NeuNpos_foodlag_15');


selectedData = data.LABELLING == 'NeuN+' & ~ strcmp(data.ID,'ND210');

age=data.AGE(selectedData);
c14=data.F14C_corr(selectedData);
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

%%
load('results/weights/weights_NeuNpos_ALL.mat')

weight_cont_mass_14change_frombc1= weights_NeuNpos_ALL

%%
save('results/datasets/NeuNpos_ALL_foodlag_15')

%%

%Step 2.2: modelling control NeuN+ with no foodlag and no developmental star att -0.5

clear

load('results/foodlags/NeuNpos_foodlag_2');


selectedData = data.LABELLING == 'NeuN+' & ~ strcmp(data.ID,'ND210');

age=data.AGE(selectedData);
c14=data.F14C_corr(selectedData);
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

%%
load('results/weights/weights_NeuNpos_ALL.mat')

weight_cont_mass_14change_frombc1= weights_NeuNpos_ALL


%%
save('results/datasets/NeuNpos_ALL_foodlag_2')






%% 
%Step 2.2: modelling control NeuN+ with no foodlag and no developmental star att -0.5

clear

load('results/foodlags/NeuNpos_foodlag_0');


selectedData = data.LABELLING == 'NeuN+' & (strcmp(data.group,'MDE') | strcmp(data.group,'RDD'))& ~ strcmp(data.ID,'ND210');

age=data.AGE(selectedData);
c14=data.F14C_corr(selectedData);
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

%%
load('results/weights/weights_NeuNpos_depp.mat')

weight_cont_mass_14change_frombc1= weights_NeuNpos_depp
%%
save('results/datasets/NeuNpos_depp_foodlag_0')
%%

%Step 2.2: modelling control NeuN+ with no foodlag and no developmental star att -0.5

clear

load('results/foodlags/NeuNpos_foodlag_05');


selectedData = data.LABELLING == 'NeuN+' & (strcmp(data.group,'MDE') | strcmp(data.group,'RDD')) & ~ strcmp(data.ID,'ND210');

age=data.AGE(selectedData);
c14=data.F14C_corr(selectedData);
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

%%
load('results/weights/weights_NeuNpos_depp.mat')
weight_cont_mass_14change_frombc1= weights_NeuNpos_depp

%%
save('results/datasets/NeuNpos_depp_foodlag_05')
%%

%Step 2.2: modelling control NeuN+ with no foodlag and no developmental star att -0.5

clear

load('results/foodlags/NeuNpos_foodlag_1');


selectedData = data.LABELLING == 'NeuN+' & (strcmp(data.group,'MDE') | strcmp(data.group,'RDD')) & ~ strcmp(data.ID,'ND210');

age=data.AGE(selectedData);
c14=data.F14C_corr(selectedData);
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

%%
load('results/weights/weights_NeuNpos_depp.mat')
weight_cont_mass_14change_frombc1= weights_NeuNpos_depp
%%
save('results/datasets/NeuNpos_depp_foodlag_1')

%% Step 2.2: modelling control NeuN+ with no foodlag and no developmental star att -0.5

clear

load('results/foodlags/NeuNpos_foodlag_15');


selectedData = data.LABELLING == 'NeuN+' & (strcmp(data.group,'MDE') | strcmp(data.group,'RDD')) & ~ strcmp(data.ID,'ND210');

age=data.AGE(selectedData);
c14=data.F14C_corr(selectedData);
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

%%
load('results/weights/weights_NeuNpos_depp.mat')
weight_cont_mass_14change_frombc1= weights_NeuNpos_depp
%%
save('results/datasets/NeuNpos_depp_foodlag_15')

%%

%Step 2.2: modelling control NeuN+ with no foodlag and no developmental star att -0.5

clear

load('results/foodlags/NeuNpos_foodlag_2');


selectedData = data.LABELLING == 'NeuN+' & (strcmp(data.group,'MDE') | strcmp(data.group,'RDD')) & ~ strcmp(data.ID,'ND210');

age=data.AGE(selectedData);
c14=data.F14C_corr(selectedData);
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

%%
load('results/weights/weights_NeuNpos_depp.mat')
weight_cont_mass_14change_frombc1= weights_NeuNpos_depp

%%
save('results/datasets/NeuNpos_depp_foodlag_2')
%%



%%

%Step 2.2: modelling control NeuN+ with no foodlag and no developmental star att -0.5

clear

load('results/foodlags/NeuNpos_foodlag_0');


selectedData = data.LABELLING == 'NeuN+' & (strcmp(data.group,'MDE')) & ~ strcmp(data.ID,'ND210');

age=data.AGE(selectedData);
c14=data.F14C_corr(selectedData);
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

%%
load('results/weights/weights_NeuNpos_MDE.mat')

weight_cont_mass_14change_frombc1= weights_NeuNpos_MDE
%%
save('results/datasets/NeuNpos_MDE_foodlag_0')
%%


%%

%Step 2.2: modelling control NeuN+ with no foodlag and no developmental star att -0.5

clear

load('results/foodlags/NeuNpos_foodlag_05');


selectedData = data.LABELLING == 'NeuN+' & (strcmp(data.group,'MDE')) & ~ strcmp(data.ID,'ND210');

age=data.AGE(selectedData);
c14=data.F14C_corr(selectedData);
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

%%
load('results/weights/weights_NeuNpos_MDE.mat')

weight_cont_mass_14change_frombc1= weights_NeuNpos_MDE
%%
save('results/datasets/NeuNpos_MDE_foodlag_05')
%%

%Step 2.2: modelling control NeuN+ with no foodlag and no developmental star att -0.5

clear

load('results/foodlags/NeuNpos_foodlag_1');


selectedData = data.LABELLING == 'NeuN+' & (strcmp(data.group,'MDE')) & ~ strcmp(data.ID,'ND210');

age=data.AGE(selectedData);
c14=data.F14C_corr(selectedData);
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

%%
load('results/weights/weights_NeuNpos_MDE.mat')
weight_cont_mass_14change_frombc1= weights_NeuNpos_MDE
%%
save('results/datasets/NeuNpos_MDE_foodlag_1')

%% Step 2.2: modelling control NeuN+ with no foodlag and no developmental star att -0.5

clear

load('results/foodlags/NeuNpos_foodlag_15');


selectedData = data.LABELLING == 'NeuN+' & (strcmp(data.group,'MDE')) & ~ strcmp(data.ID,'ND210');

age=data.AGE(selectedData);
c14=data.F14C_corr(selectedData);
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

%%
load('results/weights/weights_NeuNpos_MDE.mat')
weight_cont_mass_14change_frombc1= weights_NeuNpos_MDE
%%
save('results/datasets/NeuNpos_MDE_foodlag_15')

%%

%Step 2.2: modelling control NeuN+ with no foodlag and no developmental star att -0.5

clear

load('results/foodlags/NeuNpos_foodlag_2');


selectedData = data.LABELLING == 'NeuN+' & (strcmp(data.group,'MDE')) & ~ strcmp(data.ID,'ND210');

age=data.AGE(selectedData);
c14=data.F14C_corr(selectedData);
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

%%
load('results/weights/weights_NeuNpos_MDE.mat')
weight_cont_mass_14change_frombc1= weights_NeuNpos_MDE

%%
save('results/datasets/NeuNpos_MDE_foodlag_2')

%% 

