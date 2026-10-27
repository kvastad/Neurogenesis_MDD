function out = s2p2(output_type,count,groups,senescence_rates)
% S2P2 renewal parameters from stereological data
%  out = s2p2(output_type,count,groups,senescence_rates)
%
%  Given hippocampus dentate gyrus (DG) and place cells (CA)
%  counts from stereology, and the senescence rate of
%  DG neurons, determine 
%
%   - the death rate of CA neurons (call with NRDR)
%   - the initial fraction of DG/CA neurons (call with IR)
%   - the death rate of senescent DG neurons (call with SDR)
%
%  Assuming that
%
%   - CA neurons do not renew
%   - DG neurons that are not senescent renew 1-to-1
%
%  INPUT
%
%  OUTPUT_TYPE  'IR' | 'SDR' | 'NRDR'
%               which type of parameter to return,
%               IR: initial renewing fraction 
%                 *********************************************
%                 At the moment, we assume that cell numbers
%                 are constant between t=0 and t=t1.
%                 TODO: extrapolate initial numbers from the
%                 rates between t=t1 and t=t2
%                 *********************************************
%               SDR: senescence death rate
%               NRDR: non-renewing death rate
%
%  COUNT        A cell array of structures.
%               Each cell S is a structure with two fields
%
%               S.dg      [ t1, dg1;
%                           ...,...;  
%                           tN, dgN]
%
%               S.ca      [ t1, ca1;
%                           ...,...;
%                           tN, caN]
% 
%               All dg fields should have the same size, and
%               all ca fields should have the same size. 
%               There should be at least two distinct time points.
%
%  GROUPS       (optional) a vector of positive integers of size N
%               for corresponding groups. Group G will
%               use stereology data COUNT{G}. The max value
%               of GROUPS should be less than or equal to the 
%               number of dataset in COUNT.
%               In absence of GROUPS input, GROUPS takes 
%               the default value 1.
% 
%  SENESCENCE_RATES (optional) senescence rates 
%               Two different formats:
%               1) Same parameters for all samples:
%                 A single row: the senescence rates for each life interval
%               2) Different parameters for each sample:
%                 For a sample of size N, an array of 
%                 with N rows.
%               SENESCENCE_RATES is mandatory for output type 'SDR'
%
%
%  OUTPUT    
%               
%  OUT          A column vector with a number of rows
%               equal to the number of rows in GROUPS or SENESCENCE_RATES.
%               OUT is an estimate of the value specified by OUTPUT_TYPE:
%               IR, NRDR or SDR.
%
%  EXAMPLES 
% 
%  1) one stereology dataset, one group
%  
%  s.ca = [10,20;
%    15,10;
%    25,10;
%    30,9];
%  s.dg = [10,15;
%    15,12;
%    30,10];
%  
%  s2p2('IR',s,[1,1,1]')
%  s2p2('NRDR',s,[1,1,1]')
%  s2p2('SDR',s,[1,1,1]',[0.1, 0.05])
%  
%  2) multiple stereology datasets, multiple groups
%  
%  
%  s1.ca = [10,20;
%    15,10;
%    25,10;
%    30,9];
%  s2.ca = [10,20;
%    15,18;
%    25,15;
%    30,12];
%  s1.dg = [10,15;
%    15,12;
%    30,10];
%  s2.dg = s1.dg;
%  multi_s = {s1,s2};
%  
%  s2p2('IR',multi_s,[1,1,1,2,2]')
%  s2p2('NRDR',multi_s,[1,1,1,2,2]')
%  s2p2('SDR',multi_s,[1,1,1,2,2]',[0.1, 0.01])

% get execution time
% tic;

% check number of arguments
if nargin < 2 
  error('Error, at least two arguments are required: ''output_type'', and ''count''.')
end

if nargin == 2 % no group provided, assuming a single group
  groups = 1;
end


% from here, nargin >= 3: output_type, count and groups are defined
switch lower(output_type)
    case 'ir'
    case 'nrdr'
    case 'sdr'
    otherwise
        output_type
        error(['Error, unknown value for output_type: ''' output_type '''. Choose one of ''ir'', ''nrndr'', ''sdr''.']);
end

if nargin == 3 % no senescence rates: output_type must be IR or NRDR
  if strcmpi(output_type,'sdr') 
      error('Error. When ''senescence_rates'' is not present, the first argument must be ''IR'' or ''NRDR''.');
  end
end


nbr_stereology = length(count);
if nbr_stereology == 0
    error('Error, ''count'' should have a least one stereology data.');
end
[nbr_samples,nbr_grp_cols] = size(groups);
if nbr_grp_cols > 1
  error('Error, ''groups'' should have only one column, the group index.');
end
if max(groups) > nbr_stereology
    error(['Max group index = ', num2str(max(groups)), '. There should be at least ', num2str(max(groups)), ' stereology counts, but found only ', num2str(nbr_stereology), '.']);
end   

% check dimensions of groups and senescence_rates
nbr_sr_rows = 0;
nbr_sr_cols = 0;
if nargin == 4 % senescence_rates presents
  [nbr_sr_rows,nbr_sr_cols] = size(senescence_rates);
  senescence_rates = abs(senescence_rates);
  if nbr_sr_rows ~= nbr_samples
    if nbr_sr_rows == 1 % replicate senescence_rates
      senescence_rates = repmat(senescence_rates,nbr_samples,1);
      nbr_sr_rows = nbr_samples;
    end
    if nbr_samples == 1 % replicate groups
      groups = repmat(groups,nbr_sr_rows,1);
      nbr_samples = nbr_sr_rows;
    end
  end
end

% check sizes of stereology data
% should all be of the same size
if nbr_stereology > 1
  [n_ca, m_ca] = size(count{1}.ca);
  [n_dg, m_dg] = size(count{1}.dg);
  for i = 1:nbr_stereology
    [n_ca2, m_ca2] = size(count{i}.ca);
    [n_dg2, m_dg2] = size(count{i}.dg);
    if any(size(count{1}.ca) ~= size(count{i}.ca))
      errmsg = sprintf(['Error, all fields ''ca'' should be of the same size, ' ...
        'count{1}.ca is of size %d x %d, and count{%d}.ca is of size %d x %d.'], ...
      size(count{1}.ca), i, size(count{i}.ca));
      error(errmsg);
    end
    if any(size(count{1}.dg) ~= size(count{i}.dg))
      errmsg = sprintf(['Error, all fields ''dg'' should be of the same size, ' ...
        'count{1}.dg is of size %d x %d, and count{%d}.dg is of size %d x %d.'], ...
      size(count{1}.dg), i, size(count{i}.dg));
      error(errmsg);
    end
  end
else
  [n_ca, m_ca] = size(count.ca);
  [n_dg, m_dg] = size(count.dg);
end


% initialize output 'out'
switch lower(output_type)
    case 'ir'
      out = zeros(nbr_samples,1);
    case 'nrdr'
      out = zeros(nbr_samples,n_ca - 1);
    case 'sdr'
      if (n_dg - 1) ~= nbr_sr_cols
        error(['Error, the number of data points in the ''dg'' (%d) field should ' ...
          'be 1 + the length of ''senescence_rates'' (%d).'], n_dg, nbr_sr_cols); 
      end
      out = zeros(nbr_samples,nbr_sr_cols);
end

%--------- MAIN LOOP ---------%   
for s = 1:nbr_samples

    grp = groups(s);
    
    if nbr_stereology == 1
        ca = count.ca;
        dg = count.dg;
    else
        ca = count{grp}.ca;
        dg = count{grp}.dg;
    end    

    switch lower(output_type)
      case 'nrdr'

        %% CA cell count
        % ca0 is the CA cell count at time start
        ca0 = ca(1,2); % cell count at first time point

        %% CA death rate
        % gamma is the CA cell death rate
        for i = 1:(n_ca - 1)
          if ca(i+1,1) > ca(i,1)
            gamma(i) = log( ca(i,2)/ca(i+1,2) )/( ca(i+1,1) - ca(i,1) );
          else
            gamma(i) = 0.0;
          end
        end
        out(s,:) = gamma; % non_renewing_death_rate

      case 'sdr'
        %% DG cell count and senescent cell death rate 
        % senescence rate is given, compute senescence death rate 
        senescence_rate = senescence_rates(s,:);
        [senescence_death_rate, fval] = ...
          find_senescence_death_rates(senescence_rate,dg);

        ftol = 1e-4;  % tolerance, make lower to be more stringent on dg count and death rate
        if ( fval > ftol ) 
          warning('Senescence rate too low. DG count will differ from stereological data. Senescence death rates are maxed to 1.0.');
	  out(s,:) = min(senescence_death_rate,1); % senescence_death_rate
	else
	  out(s,:) = senescence_death_rate; % senescence_death_rate
	end

      case 'ir'
        % out(s) = beta(1)/(beta(1) + ca0); % initial_renewing 
        out(s,:) = dg(1,2)/(ca(1,2) + dg(1,2));
    end

end

% display('s2p2:execution time');
% toc 

end

function [k, y] = non_renewing_count(t,stereo)
% NON_RENEWING_COUNT death rates and cell count from stereological data
  
  % Y(t) = Y0*exp(-kSY*(t - t0)) if t > t1,

  tt = stereo(:,1);
  count = stereo(:,2);

  k = [];

  if t <= tt(1)       % return the initial count
    y = count(1);
    return;
  end

  ind_tt = min(max(find(t > tt)), length(tt) - 1); % 1 <= ind_tt <= length(tt) - 1
  for i = 1:ind_tt  % ind_tt < length(tt)
      Y0 = count(i);              % Y(t0) 
      Y1 = count(i+1);            % Y(t1)
      t0 = tt(i);
      t1 = tt(i+1);
      if ( t1 > t0 )
        k(i) = - log(Y1/Y0)/(t1 - t0); % loss rate
      else
        k(i) = 0.0;
      end
  end
  y = Y0*exp(-k(i)*(t - t0));

end


function Q = renewing_senescent_count(tt,kSRs,kSDRs,R0)
  
  % S(t) =   R0*kSR/(kSDR - kSR)*(exp(-kSR*(t - t0)) - exp(-kSDR*(t - t0))) 
  %        + S0*exp(-kSDR*(t - t0))
  % R(t) =   R0*exp(-kSY*(t - t0))    if t > t1,
  % Q(t) = R(t) + S(t)

  Q = zeros(size(tt));

  S0 = 0; 
  Q(1) = R0 + S0;

  for i = 2:length(tt)
    t0 = tt(i-1);
    t1 = tt(i);
    kSR = kSRs(i-1);
    kSDR = kSDRs(i-1);
    S0 = R0*kSR/(kSDR - kSR)*(exp(-kSR*(t1 - t0)) - exp(-kSDR*(t1 - t0))) + ...
         S0*exp(-kSDR*(t1 - t0));
    R0 = R0*exp(-kSR*(t1 - t0)); 
    Q(i) = R0 + S0;
  end

end

function [kSDR, fval] = find_senescence_death_rates(kSR,stereo)
  
  % S(t) =   R0*kSR/(kSDR - kSR)*(exp(-kSR*(t - t0)) - exp(-kSDR*(t - t0))) 
  %        + S0*exp(-kSDR*(t - t0))
  % R(t) =   R0*exp(-kSY*(t - t0))    if t > t1,
  % Q(t) = R(t) + S(t)

  % Assumptions: S(0) = 0, R(0) = DG

  tt = stereo(:,1);
  count = stereo(:,2);
  
  R0 = count(1);
  kSDR_init = 0.01*ones(1,length(count) - 1); 

  % solve nonlinear equations 
  opts = optimset('Display','off','TolX',1e-6);
  fobj = @(kSDR) sum( (renewing_senescent_count(tt,kSR,kSDR,R0) - count).^2 );
  [kSDR, fval] = fminsearch(fobj,kSDR_init,opts);

  % validate the senescence death rates 
  % If the senescence rate = 0 and the senescent count S = 0, then 
  % the total renewal count Q is independent from the senescence death rate
  % This will occur over the first time intervals as long as the senescence rates are zero. 
  % The senescence death ratea are set to zero.
  nonvalid_sdr_index = 1:(find(kSR,1)-1);
  kSDR(nonvalid_sdr_index) = 0.0;


end
