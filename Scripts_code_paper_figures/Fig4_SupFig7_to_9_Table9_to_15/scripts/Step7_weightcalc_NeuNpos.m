
%% 
%Step 2.2: modelling control NeuN+ with no foodlag and no developmental star att -0.5

clear

load('results/foodlags/NeuNpos_foodlag_0');


selectedData = data.LABELLING == 'NeuN+';

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
run('weights_calc.m');

%%
save('results/datasets/NeuNpos_ALL_foodlag_0_with210')
%%

%Step 2.2: modelling control NeuN+ with no foodlag and no developmental star att -0.5

clear

load('results/foodlags/NeuNpos_foodlag_05');


selectedData = data.LABELLING == 'NeuN+';

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
run('weights_calc.m');


%%
save('results/datasets/NeuNpos_ALL_foodlag_05_with210')
%%

%Step 2.2: modelling control NeuN+ with no foodlag and no developmental star att -0.5

clear

load('results/foodlags/NeuNpos_foodlag_1');


selectedData = data.LABELLING == 'NeuN+';

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
run('weights_calc.m');

%%
save('results/datasets/NeuNpos_ALL_foodlag_1_with210')

%% Step 2.2: modelling control NeuN+ with no foodlag and no developmental star att -0.5

clear

load('results/foodlags/NeuNpos_foodlag_15');


selectedData = data.LABELLING == 'NeuN+';

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
run('weights_calc.m');

%%
save('results/datasets/NeuNpos_ALL_foodlag_15_with210')

%%

%Step 2.2: modelling control NeuN+ with no foodlag and no developmental star att -0.5

clear

load('results/foodlags/NeuNpos_foodlag_2');


selectedData = data.LABELLING == 'NeuN+';

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
run('weights_calc.m');


%%
save('results/datasets/NeuNpos_ALL_foodlag_2_with210')







%% After manual check of weights:'

load ('results/datasets/NeuNpos_ALL_foodlag_1_with210')

%% Step7_weightcalc_NeuNpos — save group-filtered versions

% 0) Make group and ID comparable no matter original type
groupStr = string(group);
idStr    = string(ID);

% 1) Define exclusion (remove ND210)
keep = idStr ~= "ND210";      % true for rows to keep

% 2) Apply exclusion to the data you index by rows
w_wo210     = weight_cont_mass_14change(keep, :);
groupStr_wo = groupStr(keep);

% 3) Save all values (without ND210)
weights_NeuNpos_ALL = w_wo210;

% 4) Filter by group type (using the WO versions)

% Control only
weights_NeuNpos_control = ...
    w_wo210(groupStr_wo == "Control", :);

% Individual substance groups
weights_NeuNpos_ETOH = ...
    w_wo210(groupStr_wo == "ETOH", :);

weights_NeuNpos_coc = ...
    w_wo210(groupStr_wo == "Coc", :);

% Control extended: Control OR ETOH OR Coc
weights_NeuNpos_controlextended = ...
    w_wo210(ismember(groupStr_wo, ["Control","ETOH","Coc"]), :);

% Depression groups
weights_NeuNpos_MDE = ...
    w_wo210(groupStr_wo == "MDE", :);

weights_NeuNpos_RDD = ...
    w_wo210(groupStr_wo == "RDD", :);

weights_NeuNpos_depp = ...
    w_wo210(ismember(groupStr_wo, ["MDE","RDD"]), :);

% 5) Define save path (make sure the folder exists)
savePath = fullfile('results','weights');
if ~exist(savePath, 'dir')
    mkdir(savePath);
end

% 6) Save each variable into separate .mat files
save(fullfile(savePath, 'weights_NeuNpos_ALL.mat'), ...
    'weights_NeuNpos_ALL');

save(fullfile(savePath, 'weights_NeuNpos_control.mat'), ...
    'weights_NeuNpos_control');

save(fullfile(savePath, 'weights_NeuNpos_controlextended.mat'), ...
    'weights_NeuNpos_controlextended');

save(fullfile(savePath, 'weights_NeuNpos_MDE.mat'), ...
    'weights_NeuNpos_MDE');

save(fullfile(savePath, 'weights_NeuNpos_RDD.mat'), ...
    'weights_NeuNpos_RDD');

save(fullfile(savePath, 'weights_NeuNpos_depp.mat'), ...
    'weights_NeuNpos_depp');

%%
% (optional) save the workspace / updated variables as before
save('results/datasets/NeuNpos_ALL_foodlag_1')

