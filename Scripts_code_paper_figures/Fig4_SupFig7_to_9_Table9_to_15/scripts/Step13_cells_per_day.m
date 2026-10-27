%% ===== 1. Model setup (your existing code) =====
s.ca = [10, 20;
        30, 20;
        70, 15];
s.dg = [10, 18;
        30, 18;
        70, 15];
       
cbdopts = cbdset();
cbdopts.nbpar.fraction_renewing = 1;
cbdopts.nbpar.death = 1;
cbdopts.nbpar.birth = 0;
cbdopts.nbpar.senescence = 1;
cbdopts.nbpar.sendeath = 2;
cbdopts.nbpar.nrdeath  = 2;
cbdopts.death      = @(t,a,pg) pg;
cbdopts.senescence = @(t,a,ps) ps*(t<=a);
cbdopts.sendeath   = @(t,a,pd) pd(1)*(t<=30) + pd(2)*(t>30);
cbdopts.nrdeath    = @(t,pd)   pd(1)*(t<=30) + pd(2)*(t>30);
cbdopts.birth = 'volterra_on_renewing';
cbdopts.bc = bc2;
cbdopts.bc_zone = zone;
cbdopts.age = 70;
cbdopts.doc = 2010; 
cbdopts.k_ploidy = zeros(size(age));
cbdopts.stereology = s;

% Fixed parameters from prior
pg = 0.01974; %CI minimum 
ps = 0.0340084887311051;

%% ===== 2. Run model and capture outputs =====
[age_density_sqmat, ntot, avg_age] = age_distribution_plot( ...
    [s2p2('IR',s), pg, ps, s2p2('SDR',s,1,[ps,ps]), s2p2('NRDR',s)], ...
    cbdopts);

%% ===== 3. Set up reference DG count =====
DG_ref_age   = 10;       % age at which reference count applies
DG_ref_count = 18e6;     % 18 million cells at age 10

rensen_at_ref = interp1(ntot.tt, ntot.rensen, DG_ref_age);
scale         = DG_ref_count / rensen_at_ref;

% Model-predicted absolute counts (cell death already incorporated)
DG_total_model   = ntot.rensen   * scale;
renewing_model   = ntot.renewing * scale;
senescent_model  = ntot.senescent * scale;

%% ===== 4. Fit quality: model vs stereology =====
fprintf('\n===== DG FIT QUALITY =====\n');

dg_ages_target = s.dg(:,1);
dg_vals_target = s.dg(:,2) * 1e6;   % convert to absolute counts

dg_vals_model  = interp1(ntot.tt, DG_total_model, dg_ages_target);
abs_error      = dg_vals_model - dg_vals_target;
pct_error      = 100 * abs_error ./ dg_vals_target;

fit_table = table(dg_ages_target, dg_vals_target/1e6, dg_vals_model/1e6, ...
    abs_error/1e6, pct_error, ...
    'VariableNames', {'Age','Target_M','Model_M','AbsError_M','PctError'});
disp(fit_table);

fprintf('Max absolute error: %.2f million cells\n', max(abs(abs_error))/1e6);
fprintf('Max relative error: %.2f%%\n\n', max(abs(pct_error)));

%% ===== 5. Annual exchange: model-based =====
% Births per year (replacing deaths only; senescent cells not replaced)
births_per_year_count = pg * renewing_model;
births_per_year_frac  = pg * ntot.renewing ./ ntot.rensen;
frac_renewing_dg      = ntot.renewing ./ ntot.rensen;

%% ===== 6. Annual exchange: rescaled to match data exactly =====
% Alternative calculation that forces the model DG total to equal stereology 
% at every age by interpolating the stereology data
dg_data_interp = interp1(dg_ages_target, dg_vals_target, ntot.tt, ...
                         'linear', 'extrap');
rescale_factor       = dg_data_interp ./ DG_total_model;
births_rescaled      = births_per_year_count .* rescale_factor;

%% ===== 7. Results table =====
fprintf('===== ANNUAL DG CELL EXCHANGE =====\n');

query_ages = [0, 10, 20, 30, 40, 50, 60, 70];

T = table(query_ages(:), ...
    round(interp1(ntot.tt, DG_total_model,        query_ages))', ...
    interp1(ntot.tt, frac_renewing_dg,            query_ages)', ...
    interp1(ntot.tt, births_per_year_frac,        query_ages)', ...
    round(interp1(ntot.tt, births_per_year_count, query_ages))', ...
    round(interp1(ntot.tt, births_rescaled,       query_ages))', ...
    'VariableNames', {'Age','DG_Total','FracRenew','FracExch',...
                      'NewCells_Model','NewCells_Rescaled'});
disp(T);

fprintf(['\nNotes:\n' ...
         '- NewCells_Model: from model output as-is (DG at 70 = %.2f M)\n' ...
         '- NewCells_Rescaled: scaled so DG total exactly matches stereology\n' ...
         '- Difference at age 70 is about %.1f%%\n\n'], ...
         dg_vals_model(end)/1e6, abs(pct_error(end)));

%% ===== 8. Summary plot =====
figure; 
subplot(2,1,1);
plot(ntot.tt, DG_total_model/1e6, 'b-', 'LineWidth', 2); hold on;
plot(dg_ages_target, dg_vals_target/1e6, 'ro', 'MarkerSize', 10, ...
     'MarkerFaceColor', 'r');
xlabel('Age (years)'); ylabel('DG cells (millions)');
legend('Model','Stereology data','Location','southwest');
title('DG population: model vs data'); grid on;

subplot(2,1,2);
plot(ntot.tt, births_per_year_count/1e3, 'b-', 'LineWidth', 2); hold on;
plot(ntot.tt, births_rescaled/1e3, 'r--', 'LineWidth', 2);
xlabel('Age (years)'); ylabel('New DG cells per year (thousands)');
legend('Model as-is','Rescaled to data','Location','northeast');
title('Annual DG cell exchange'); grid on;


%%%% ===== 1. Model setup (your existing code) =====
s.ca = [10, 20;
        30, 20;
        70, 15];
s.dg = [10, 18;
        30, 18;
        70, 15];
       
cbdopts = cbdset();
cbdopts.nbpar.fraction_renewing = 1;
cbdopts.nbpar.death = 1;
cbdopts.nbpar.birth = 0;
cbdopts.nbpar.senescence = 1;
cbdopts.nbpar.sendeath = 2;
cbdopts.nbpar.nrdeath  = 2;
cbdopts.death      = @(t,a,pg) pg;
cbdopts.senescence = @(t,a,ps) ps*(t<=a);
cbdopts.sendeath   = @(t,a,pd) pd(1)*(t<=30) + pd(2)*(t>30);
cbdopts.nrdeath    = @(t,pd)   pd(1)*(t<=30) + pd(2)*(t>30);
cbdopts.birth = 'volterra_on_renewing';
cbdopts.bc = bc2;
cbdopts.bc_zone = zone;
cbdopts.age = 70;
cbdopts.doc = 2010; 
cbdopts.k_ploidy = zeros(size(age));
cbdopts.stereology = s;

% Fixed parameters from prior
pg = 0.03527; %CI maximum
ps = 0.0340084887311051;

%% ===== 2. Run model and capture outputs =====
[age_density_sqmat, ntot, avg_age] = age_distribution_plot( ...
    [s2p2('IR',s), pg, ps, s2p2('SDR',s,1,[ps,ps]), s2p2('NRDR',s)], ...
    cbdopts);

%% ===== 3. Set up reference DG count =====
DG_ref_age   = 10;       % age at which reference count applies
DG_ref_count = 18e6;     % 18 million cells at age 10

rensen_at_ref = interp1(ntot.tt, ntot.rensen, DG_ref_age);
scale         = DG_ref_count / rensen_at_ref;

% Model-predicted absolute counts (cell death already incorporated)
DG_total_model   = ntot.rensen   * scale;
renewing_model   = ntot.renewing * scale;
senescent_model  = ntot.senescent * scale;

%% ===== 4. Fit quality: model vs stereology =====
fprintf('\n===== DG FIT QUALITY =====\n');

dg_ages_target = s.dg(:,1);
dg_vals_target = s.dg(:,2) * 1e6;   % convert to absolute counts

dg_vals_model  = interp1(ntot.tt, DG_total_model, dg_ages_target);
abs_error      = dg_vals_model - dg_vals_target;
pct_error      = 100 * abs_error ./ dg_vals_target;

fit_table = table(dg_ages_target, dg_vals_target/1e6, dg_vals_model/1e6, ...
    abs_error/1e6, pct_error, ...
    'VariableNames', {'Age','Target_M','Model_M','AbsError_M','PctError'});
disp(fit_table);

fprintf('Max absolute error: %.2f million cells\n', max(abs(abs_error))/1e6);
fprintf('Max relative error: %.2f%%\n\n', max(abs(pct_error)));

%% ===== 5. Annual exchange: model-based =====
% Births per year (replacing deaths only; senescent cells not replaced)
births_per_year_count = pg * renewing_model;
births_per_year_frac  = pg * ntot.renewing ./ ntot.rensen;
frac_renewing_dg      = ntot.renewing ./ ntot.rensen;

%% ===== 6. Annual exchange: rescaled to match data exactly =====
% Alternative calculation that forces the model DG total to equal stereology 
% at every age by interpolating the stereology data
dg_data_interp = interp1(dg_ages_target, dg_vals_target, ntot.tt, ...
                         'linear', 'extrap');
rescale_factor       = dg_data_interp ./ DG_total_model;
births_rescaled      = births_per_year_count .* rescale_factor;

%% ===== 7. Results table =====
fprintf('===== ANNUAL DG CELL EXCHANGE =====\n');

query_ages = [0, 10, 20, 30, 40, 50, 60, 70];

T = table(query_ages(:), ...
    round(interp1(ntot.tt, DG_total_model,        query_ages))', ...
    interp1(ntot.tt, frac_renewing_dg,            query_ages)', ...
    interp1(ntot.tt, births_per_year_frac,        query_ages)', ...
    round(interp1(ntot.tt, births_per_year_count, query_ages))', ...
    round(interp1(ntot.tt, births_rescaled,       query_ages))', ...
    'VariableNames', {'Age','DG_Total','FracRenew','FracExch',...
                      'NewCells_Model','NewCells_Rescaled'});
disp(T);

fprintf(['\nNotes:\n' ...
         '- NewCells_Model: from model output as-is (DG at 70 = %.2f M)\n' ...
         '- NewCells_Rescaled: scaled so DG total exactly matches stereology\n' ...
         '- Difference at age 70 is about %.1f%%\n\n'], ...
         dg_vals_model(end)/1e6, abs(pct_error(end)));

%% ===== 8. Summary plot =====
figure; 
subplot(2,1,1);
plot(ntot.tt, DG_total_model/1e6, 'b-', 'LineWidth', 2); hold on;
plot(dg_ages_target, dg_vals_target/1e6, 'ro', 'MarkerSize', 10, ...
     'MarkerFaceColor', 'r');
xlabel('Age (years)'); ylabel('DG cells (millions)');
legend('Model','Stereology data','Location','southwest');
title('DG population: model vs data'); grid on;

subplot(2,1,2);
plot(ntot.tt, births_per_year_count/1e3, 'b-', 'LineWidth', 2); hold on;
plot(ntot.tt, births_rescaled/1e3, 'r--', 'LineWidth', 2);
xlabel('Age (years)'); ylabel('New DG cells per year (thousands)');
legend('Model as-is','Rescaled to data','Location','northeast');
title('Annual DG cell exchange'); grid on;