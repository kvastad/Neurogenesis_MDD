# Radiocarbon birth dating of neuronal turnover in depression

MATLAB code accompanying the manuscript. The pipeline reconstructs cell
turnover from atmospheric-bomb-pulse <sup>14</sup>C measurements in sorted
NeuN− (non-neuronal) and NeuN+ (neuronal) nuclei, and compares depression
groups against controls.

---

## Requirements

* MATLAB (Statistics and Machine Learning Toolbox; Parallel Computing Toolbox
  optional but strongly recommended — the MCMC steps are long-running).
* A C compiler for the MEX file, unless a prebuilt binary for your platform is
  already present in `scripts/carbonDating_functions/`.

## Setup

From the repository root, in MATLAB:

```matlab
setup_paths
```

This adds `scripts/`, `scripts/carbonDating_functions/` and `data/` to the
path and creates the `results/` output folders. **Keep the repository root as
the MATLAB working directory** — every script uses paths relative to it.

If `setup_paths` warns that `bInt_mex` is missing, compile it:

```matlab
cd scripts/carbonDating_functions
mex -O bInt_mex.c
```

`bInt_mex` is required, not optional: `bcDelay.m` and `cAdjustedForPloidy.m`
call it directly. Prebuilt binaries are included for macOS Intel
(`.mexmaci64`) and Linux x86-64 (`.mexa64`); Apple Silicon and Windows users
must compile.

---

## Layout

```
data/                        input measurements (Excel)
scripts/                     pipeline, in run order
scripts/carbonDating_functions/   shared carbon-dating library + bomb curves
results/                     all generated output (git-ignored)
  foodlags/                    per-food-lag datasets
  datasets/                    analysis datasets by group
  weights/                     measurement weights
  mcmc/                        MCMC chains
  figures/                     figures
```

## Naming convention

Datasets and MCMC chains are named `label_group_foodlag`:

| part | values |
|---|---|
| label | `NeuNpos`, `NeuNneg` |
| group | `ALL`, `control`, `controlextended`, `depp`, `MDE`, `RDD`, `ETOH`, `coc` |
| foodlag | `0`, `05`, `1`, `15`, `2` (years of dietary lag) |

`depp` = MDE ∪ RDD. `controlextended` = Control ∪ ETOH ∪ Coc.

MCMC chains add `_scenario_N`.

A plain name is always the analysis cohort, with sample ND210 excluded. The
`_with210` suffix appears only on the intermediate datasets Step 7 uses to
calculate the measurement weights on the full cohort; nothing downstream of
Step 7 reads them.

---

## Run order

| Step | Script | Purpose |
|---|---|---|
| 1 | `Step1_loaddata_foodlags_NeuNneg.m` | import NeuN− data, build food-lag datasets |
| 2 | `Step2_weightcalc_NeuNneg.m` | NeuN− measurement weights, saved for Step 3 |
| 3 | `Step3_NeuNneg_modelling.m` | NeuN− MCMC model fits |
| 3b | `Step3b_NeuNneg_modelling_individual.m` | NeuN− individual-level fits |
| 4 | `Step4_figs_and_stats_NeuNneg.m` | NeuN− figures and statistics |
| 5 | `Step5_theoretical_NeuNneg_for_puritycorr.m` | theoretical NeuN− curve used for NeuN+ purity correction |
| 6 | `Step6_loaddata_foodlags_NeuNpos.m` | import NeuN+ data, build food-lag datasets |
| 7 | `Step7_weightcalc_NeuNpos.m` | NeuN+ measurement weights on the **full cohort**, then ND210 removed |
| 8 | `Step8_load_subgroups_NeuNpos.m` | build ALL and per-group analysis datasets |
| 9 | `Step9_NeuNpos_modelling_ALL.m` | NeuN+ ALL-cohort MCMC model fits |
| 10a | `Step10a_run_controls.m` | controls |
| 10b | `Step10b_run_controlsextended.m` | extended controls |
| 10c | `Step10c_run_depp.m` | depression (MDE ∪ RDD) |
| 10d | `Step10d_run_RDD.m` | recurrent depressive disorder |
| 10e | `Step10e_run_MDE.m` | major depressive episode |
| 11 | `Step11_priorAICcalc.m` | prior sensitivity / AIC comparison |
| 11b | `Step11b_figs_and_stats_NeuNneg.m` | scenario 9_2 figures for each NeuN+ group |
| 12a | `Step12a_individual_turnover.m` | individual turnover estimates |
| 12b | `Step12b_average_age.m` | average cell age |
| 13 | `Step13_cells_per_day.m` | cells replaced per day |

`run_bestMCMC_prior_NeuNneg.m` and `run_bestMCMC_prior_NeuNpos.m` are helper
routines invoked by Steps 3 and 11; they are not run directly.

Steps 3, 9 and 10a–e each run many MCMC chains and take a long time. They are
independent of one another once Step 8 has completed, so they can be run in
parallel.

---

## Analytical decisions worth knowing

**Sample ND210 is excluded from all modelling.** The measurement
weights are calculated on the **full cohort, ND210 included**, in the first
part of Step 7. The second part of Step 7 then row-subsets that weight vector
to drop ND210 — the weights themselves are never recomputed on the reduced
cohort. Recomputing them was tested and made almost no difference, so the
full-cohort weights were kept for stability.

Step 7 is therefore the boundary: the `_with210` datasets exist only inside it,
and every step from Step 8 onwards works on the ND210-excluded cohort of 112
samples under the plain file names.

**NeuN+ measurements use the purity-corrected fraction modern carbon**
(`F14C_corr`) throughout. The associated uncertainty is `F14C_ERR`; the source
data contains no separate error column for the corrected values.

**The food lag** (dietary delay between atmospheric and tissue <sup>14</sup>C)
is not fixed to one value. Every step is run across lags of 0, 0.5, 1, 1.5 and
2 years so the results can be assessed for sensitivity to this assumption.

---

## Known issues

* `age_distribution_plot.m` contains a dormant fallback that loads
  `atmospheric_radiocarbon/Schauinsland_2016.mat` when no bomb curve is passed
  in. That file is not present; the equivalent curve ships as
  `scripts/carbonDating_functions/bcSchauinsland_2016_convertF14C.mat`. All
  current callers pass a curve, so the branch is never reached.
* `Step12a_individual_turnover.m` and `Step12b_average_age.m` both finish with
  a whole-workspace `save` to `results/datasets/NeuNpos_ALL_foodlag_1.mat`,
  which Step 8 also writes. Run them in that order, and do not re-run Step 8
  afterwards without re-running Step 12.
* `Step13_cells_per_day.m` contains no `load`. It expects `bc2`, `zone` and
  `age` to be in the workspace already, so run it directly after Step 12b.
* MATLAB variable names inside the scripts still carry the older `frombc0` /
  `frombc1` markers (which bomb-curve set the weights derive from). These are
  workspace variables only; no file name uses them.
