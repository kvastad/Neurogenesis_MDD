function out = cbdset()
% CBDSET set default parameter for birth-death-senescence simulations
%
% SEE ALSO
%   CGENBDS
%
%   Copyright 2008-2022

if nargin == 0 
  opt.nbpar.fraction_renewing = 1;
  opt.nbpar.death = 0;
  opt.nbpar.birth = 0;
  opt.nbpar.senescence = 0;
  opt.nbpar.sendeath = 0;
  opt.nbpar.nrdeath  = 0;

  opt.death      = @(~,~,~) 0;
  opt.birth      = @(~,~)   0;
  opt.senescence = @(~,~,~) 0;
  opt.sendeath   = @(~,~,~) 0;
  opt.nrdeath    = @(~,~) 0;

  opt.bc = [];

  opt.bc_zone  = [];
  opt.k_ploidy = [];
  opt.age = [];
  opt.doc = [];
  opt.ageloss = [];
  opt.resolution = 101;
  opt.tolg = 1e-8;
  
  opt.stereology = [];
  
  out = opt; 
  return;
end

