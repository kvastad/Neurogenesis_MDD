function setup_paths()
%SETUP_PATHS  Put this repository on the MATLAB path and create output folders.
%
%   Run this ONCE per MATLAB session, from the repository root:
%
%       >> setup_paths
%
%   All scripts use paths relative to the repository root, so keep the
%   repository root as the MATLAB working directory while running them.

root = fileparts(mfilename('fullpath'));
addpath(fullfile(root,'scripts'));
addpath(fullfile(root,'scripts','carbonDating_functions'));
addpath(fullfile(root,'data'));

folders = {fullfile('results','foodlags'), ...
           fullfile('results','datasets'), ...
           fullfile('results','datasets','purity_corr'), ...
           fullfile('results','weights'), ...
           fullfile('results','mcmc'), ...
           fullfile('results','figures')};
for i = 1:numel(folders)
    if ~exist(fullfile(root,folders{i}),'dir')
        mkdir(fullfile(root,folders{i}));
    end
end

fprintf('Paths set. Working directory must stay at: %s\n', root);
if isempty(which('bInt_mex'))
    warning(['bInt_mex not found on the path. Compile it with:\n' ...
             '   cd scripts/carbonDating_functions\n   mex -O bInt_mex.c']);
end
end
