
%% 
%Step 2.2: modelling control NeuN- with no foodlag and no developmental star att -0.5

clear

load('results/foodlags/NeuNneg_foodlag_0');


selectedData = data.LABELLING == 'NeuN-';

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

%%
run('weights_calc.m');

%%
save('results/datasets/NeuNneg_ALL_foodlag_0')
%%

%Step 2.2: modelling control NeuN- with no foodlag and no developmental star att -0.5

clear

load('results/foodlags/NeuNneg_foodlag_05');


selectedData = data.LABELLING == 'NeuN-';

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

%%
run('weights_calc.m');


%%
save('results/datasets/NeuNneg_ALL_foodlag_05')
%%

%Step 2.2: modelling control NeuN- with no foodlag and no developmental star att -0.5

clear

load('results/foodlags/NeuNneg_foodlag_1');


selectedData = data.LABELLING == 'NeuN-';

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

%%
run('weights_calc.m');

%%
save('results/datasets/NeuNneg_ALL_foodlag_1')

%% Step 2.2: modelling control NeuN- with no foodlag and no developmental star att -0.5

clear

load('results/foodlags/NeuNneg_foodlag_15');


selectedData = data.LABELLING == 'NeuN-';

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

%%
run('weights_calc.m');

%%
save('results/datasets/NeuNneg_ALL_foodlag_15')

%%

%Step 2.2: modelling control NeuN- with no foodlag and no developmental star att -0.5

clear

load('results/foodlags/NeuNneg_foodlag_2');


selectedData = data.LABELLING == 'NeuN-';

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

%%
run('weights_calc.m');


%%
save('results/datasets/NeuNneg_ALL_foodlag_2')


%% After manual check of weights:

load ('results/datasets/NeuNneg_ALL_foodlag_1')

%% Step2_weightcalc_NeuNneg - save the weights
%  Whole NeuN- cohort; nothing is excluded.

weight_cont_mass_14change_frombc0 = weight_cont_mass_14change;

% Define save path (make sure the folder exists)
savePath = fullfile('results','weights');
if ~exist(savePath, 'dir')
    mkdir(savePath);
end

save(fullfile(savePath, 'weights_NeuNneg_ALL.mat'), ...
    'weight_cont_mass_14change_frombc0');

