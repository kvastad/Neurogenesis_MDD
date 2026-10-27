%%
%STEP1

clear

warning('OFF','MATLAB:quad:ImproperFcnValue')
options=optimset('Display','iter','MaxIter',250); % options for the nonlinear optimization

% import data
data_all   = import14CfromExcel(63,'NeuNneg_data','import'); 
%load all_turnoverrates

% select dataset
data = data_all;
data.AGE = data.DOC - data.DOB;
data.LABELLING = nominal(data.LABELLING);

% load the bombcurves in a cell array bc2
load bcSchauinsland_2016_convertF14C.mat
bc=bcDelay(0,bc);

bc2{1} = bc;

load bc_NHzone2_F.mat

% smooth the bombcurve
id1962 = find(bc(:,1) >= 1962,1);
bc1962 = bc(id1962:end,:);
wts = [1/24;repmat(1/12,11,1);1/24];
bc1962f = conv(bc1962(:,2),wts,'valid');
bc1962y = bc1962(7:end-6,1);

bc_nonsmoothed = bc;
bc = bc_nonsmoothed(1:id1962,:);
bc = [bc; bc1962y, bc1962f];

bc=bcDelay(0,bc);

bc2{2} = bc;

bcset=0
data.zone= ones(size(data.hemisphere_zone));

for i=1:size(data.hemisphere_zone)
    if strcmp(data.hemisphere_zone(i),'south')
        data.zone(i)= 2 ; 
    end
    
end


save('results/foodlags/NeuNneg_foodlag_0')

%% 

clear

warning('OFF','MATLAB:quad:ImproperFcnValue')
options=optimset('Display','iter','MaxIter',250); % options for the nonlinear optimization

% import data
data_all   = import14CfromExcel(63,'NeuNneg_data','import'); 
%load all_turnoverrates

% select dataset
data = data_all;
data.AGE = data.DOC - data.DOB;
data.LABELLING = nominal(data.LABELLING);

% load the bombcurves in a cell array bc2
load bcSchauinsland_2016_convertF14C.mat
bc=bcDelay(0.5,bc);

bc2{1} = bc;

load bc_NHzone2_F.mat

% smooth the bombcurve
id1962 = find(bc(:,1) >= 1962,1);
bc1962 = bc(id1962:end,:);
wts = [1/24;repmat(1/12,11,1);1/24];
bc1962f = conv(bc1962(:,2),wts,'valid');
bc1962y = bc1962(7:end-6,1);

bc_nonsmoothed = bc;
bc = bc_nonsmoothed(1:id1962,:);
bc = [bc; bc1962y, bc1962f];

bc=bcDelay(0.5,bc);

bc2{2} = bc;

bcset=0.5
data.zone= ones(size(data.hemisphere_zone));

for i=1:size(data.hemisphere_zone)
    if strcmp(data.hemisphere_zone(i),'south')
        data.zone(i)= 2 ; 
    end
    
end


save('results/foodlags/NeuNneg_foodlag_05')


%% 

clear

warning('OFF','MATLAB:quad:ImproperFcnValue')
options=optimset('Display','iter','MaxIter',250); % options for the nonlinear optimization

% import data
data_all   = import14CfromExcel(63,'NeuNneg_data','import'); 
%load all_turnoverrates

% select dataset
data = data_all;
data.AGE = data.DOC - data.DOB;
data.LABELLING = nominal(data.LABELLING);

% load the bombcurves in a cell array bc2
load bcSchauinsland_2016_convertF14C.mat
bc=bcDelay(1,bc);

bc2{1} = bc;

load bc_NHzone2_F.mat

% smooth the bombcurve
id1962 = find(bc(:,1) >= 1962,1);
bc1962 = bc(id1962:end,:);
wts = [1/24;repmat(1/12,11,1);1/24];
bc1962f = conv(bc1962(:,2),wts,'valid');
bc1962y = bc1962(7:end-6,1);

bc_nonsmoothed = bc;
bc = bc_nonsmoothed(1:id1962,:);
bc = [bc; bc1962y, bc1962f];

bc=bcDelay(1,bc);

bc2{2} = bc;

bcset=1
data.zone= ones(size(data.hemisphere_zone));

for i=1:size(data.hemisphere_zone)
    if strcmp(data.hemisphere_zone(i),'south')
        data.zone(i)= 2 ; 
    end
    
end


save('results/foodlags/NeuNneg_foodlag_1')


%% 

clear

warning('OFF','MATLAB:quad:ImproperFcnValue')
options=optimset('Display','iter','MaxIter',250); % options for the nonlinear optimization

% import data
data_all   = import14CfromExcel(63,'NeuNneg_data','import'); 
%load all_turnoverrates

% select dataset
data = data_all;
data.AGE = data.DOC - data.DOB;
data.LABELLING = nominal(data.LABELLING);

% load the bombcurves in a cell array bc2
load bcSchauinsland_2016_convertF14C.mat
bc=bcDelay(1.5,bc);

bc2{1} = bc;

load bc_NHzone2_F.mat

% smooth the bombcurve
id1962 = find(bc(:,1) >= 1962,1);
bc1962 = bc(id1962:end,:);
wts = [1/24;repmat(1/12,11,1);1/24];
bc1962f = conv(bc1962(:,2),wts,'valid');
bc1962y = bc1962(7:end-6,1);

bc_nonsmoothed = bc;
bc = bc_nonsmoothed(1:id1962,:);
bc = [bc; bc1962y, bc1962f];

bc=bcDelay(1.5,bc);

bc2{2} = bc;

bcset=1.5
data.zone= ones(size(data.hemisphere_zone));

for i=1:size(data.hemisphere_zone)
    if strcmp(data.hemisphere_zone(i),'south')
        data.zone(i)= 2 ; 
    end
    
end


save('results/foodlags/NeuNneg_foodlag_15')



%% 

clear

warning('OFF','MATLAB:quad:ImproperFcnValue')
options=optimset('Display','iter','MaxIter',250); % options for the nonlinear optimization

% import data
data_all   = import14CfromExcel(63,'NeuNneg_data','import'); 
%load all_turnoverrates

% select dataset
data = data_all;
data.AGE = data.DOC - data.DOB;
data.LABELLING = nominal(data.LABELLING);

% load the bombcurves in a cell array bc2
load bcSchauinsland_2016_convertF14C.mat
bc=bcDelay(2,bc);

bc2{1} = bc;

load bc_NHzone2_F.mat

% smooth the bombcurve
id1962 = find(bc(:,1) >= 1962,1);
bc1962 = bc(id1962:end,:);
wts = [1/24;repmat(1/12,11,1);1/24];
bc1962f = conv(bc1962(:,2),wts,'valid');
bc1962y = bc1962(7:end-6,1);

bc_nonsmoothed = bc;
bc = bc_nonsmoothed(1:id1962,:);
bc = [bc; bc1962y, bc1962f];

bc=bcDelay(2,bc);

bc2{2} = bc;

bcset=2
data.zone= ones(size(data.hemisphere_zone));

for i=1:size(data.hemisphere_zone)
    if strcmp(data.hemisphere_zone(i),'south')
        data.zone(i)= 2 ; 
    end
    
end


save('results/foodlags/NeuNneg_foodlag_2')

