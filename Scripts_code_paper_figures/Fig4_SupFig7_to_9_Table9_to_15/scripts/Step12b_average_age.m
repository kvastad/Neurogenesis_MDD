%%
senescence=0.0340084887311051

%% Use age_distribution_plot to compute cell age distributions average cell age 
%  in each population subsets 
%Control
x_92_ind=[0.00954265764169395;
0.0204405910875648;
0.0198166415048763;
0.0428107856055722;
0.0302573650171981;
0.0190620464077220;
0.0204258370464668;
0.0115053452979773;
0.0107167715365067;
0.0350591176198796;
0.0318689523441717;
0.0358350938353688;
0.0114037060048431;
0.0170200681546703;
0.0192252379609272;
0.00127270780690017;
0.164901608221117;
0.0714637035661145;
0.0737738144928591;
0.167909827452153;
0.122375708594918;
0.0170030344780535;
0.0373948417631910;
0.0540817063255236;
0.0154406227404252;
0.0241657195929438;
NaN;
0.0181718091033399;
0.0403446378624067;
0.0256597716426477;
0.0871185187818484;
0.0823301543407143;
0.413000520193019;
NaN;
0.0461123735556613;
0.0783185778390617;
0.378255117312074;
0.0168706497354433;
0.0139892824413255;
0.0443453405974433;
0.0174514697873965;
0.0108261215062812;
0.0105338884135708;
0.00375360902491955;
0.00757234421465545;
0.0105235153222457;
0.0189842490265146;
0.0232773856939748;
0.00699718544632196;
0.103531565239653;
0.0121826031273231;
0.00550143653433769;
0.0124413841441274;
0.0218250914486125;
0.00547147759795188;
0.00925698175374418;
0;
NaN;
0.0570803464157508;
0.0737722362531350;
0.111007574157790;
0.0211569075202569;
0.0208445647619665;
0.0921180170122535;
0.00813691091351211;
0.00305161951575427;
0.0237677702233196;
0.281953246782069;
0.0235202217046172;
0.214463023621589;
0.150233431707137;
0.0972402150286363;
0.00918481870368123;
0.00508625916764139;
0.0226513169705868;
0;
0.0587522420547903;
1.19868586864323;
0.0207117624636740;
0.0534675392275677;
0.0532139192065225;
0.00903437720239162;
0.0604744565431030;
0.00730478114075958;
0.0960085870651530;
0.0248812273824588;
0.0868856844939293;
0.00824444381613284;
0.00122810399997982;
NaN;
0.158350400082418;
0.0692315441193060;
NaN;
0.109175799159333;
2.35745324128867;
0.0890539309484885;
0.0287944092527032;
0;
0.314995427353308;
0;
0.0602872604858131;
NaN;
0.0228310452746228;
NaN;
NaN;
NaN;
0.0352734159883112;
0.0190817831251770;
NaN;
0.0137898163283244;
0.0197425089096651;
0.648666504378431;
0]


%%



s.ca = [10, 20;
        30, 20;
        70, 15];
s.dg = [10, 18;
        30, 18;
        70, 15];

cbd_control = cbdset(); % initialize the options

cbd_control.nbpar.fraction_renewing = 1;
cbd_control.nbpar.death = 1;
cbd_control.nbpar.birth = 0;
cbd_control.nbpar.senescence = 1;
cbd_control.nbpar.sendeath = 2;
cbd_control.nbpar.nrdeath  = 2;
cbd_control.death = @(t,a,pg)pg;
cbd_control.senescence = @(t,a,ps) ps*(t<=a);
cbd_control.sendeath   = @(t,a,pd) pd(1)*(t<=30) + pd(2)*(t>30);
cbd_control.nrdeath    = @(t,pd) pd(1)*(t<=30) + pd(2)*(t>30);
cbd_control.birth = 'volterra_on_renewing';
cbd_control.bc = bc2;




%% visualization 



for i = 1:n % for testing: choose sample index between 1 and the number of samples in the group
    
cbd_control.bc_zone = zone(i);
cbd_control.age = age(i);
cbd_control.doc = dd(i); 
cbd_control.k_ploidy = zeros(size(age));
cbd_control.stereology = s; 

%% Cell age distribution plots 
figure(1); clf;
[~,ntot,avg_age] = age_distribution_plot([s2p2('IR',s), x_92_ind(i),senescence, s2p2('SDR',s,1,[senescence,senescence]), s2p2('NRDR',s)], cbd_control);

figure(2); clf;
hold on
plot(ntot.tt,avg_age.total)
plot(ntot.tt,avg_age.renewing,'--')
plot(ntot.tt,avg_age.senescent,'-.')
plot(ntot.tt,avg_age.nonrenewing,':')
legend('total','renewing','DG post-renewing','non-renewing');
ylabel('Average cell age (years)')
xlabel('age of individual (years)')

% average cell age at death
avg_age.total(end) 

ave_age_9_2_controlsen_controlsen(i,1)=avg_age.total(end);
end


%% visualization 

for i = 1:n % for testing: choose sample index between 1 and the number of samples in the group
    
cbd_control.bc_zone = zone(i);
cbd_control.age = age(i);
cbd_control.doc = dd(i); 
cbd_control.k_ploidy = zeros(size(age));
cbd_control.stereology = s; 

%% Cell age distribution plots 
figure(1); clf;
[~,ntot,avg_age] = age_distribution_plot([s2p2('IR',s), x_92_ind(i)*0.9,senescence, s2p2('SDR',s,1,[senescence,senescence]), s2p2('NRDR',s)], cbd_control);

figure(2); clf;
hold on
plot(ntot.tt,avg_age.total)
plot(ntot.tt,avg_age.renewing,'--')
plot(ntot.tt,avg_age.senescent,'-.')
plot(ntot.tt,avg_age.nonrenewing,':')
legend('total','renewing','DG post-renewing','non-renewing');
ylabel('Average cell age (years)')
xlabel('age of individual (years)')

% average cell age at death
avg_age.total(end) 

ave_age_9_2_controlsen_90perc(i,1)=avg_age.total(end);
end




%% visualization 

for i = 1:n % for testing: choose sample index between 1 and the number of samples in the group
    
cbd_control.bc_zone = zone(i);
cbd_control.age = age(i);
cbd_control.doc = dd(i); 
cbd_control.k_ploidy = zeros(size(age));
cbd_control.stereology = s; 

%% Cell age distribution plots 
figure(1); clf;
[~,ntot,avg_age] = age_distribution_plot([s2p2('IR',s), x_92_ind(i)*0.85,senescence, s2p2('SDR',s,1,[senescence,senescence]), s2p2('NRDR',s)], cbd_control);

figure(2); clf;
hold on
plot(ntot.tt,avg_age.total)
plot(ntot.tt,avg_age.renewing,'--')
plot(ntot.tt,avg_age.senescent,'-.')
plot(ntot.tt,avg_age.nonrenewing,':')
legend('total','renewing','DG post-renewing','non-renewing');
ylabel('Average cell age (years)')
xlabel('age of individual (years)')

% average cell age at death
avg_age.total(end) 

ave_age_9_2_controlsen_85perc(i,1)=avg_age.total(end);
end



%% visualization 

for i = 1:n % for testing: choose sample index between 1 and the number of samples in the group
    
cbd_control.bc_zone = zone(i);
cbd_control.age = age(i);
cbd_control.doc = dd(i); 
cbd_control.k_ploidy = zeros(size(age));
cbd_control.stereology = s; 

%% Cell age distribution plots 
figure(1); clf;
[~,ntot,avg_age] = age_distribution_plot([s2p2('IR',s), x_92_ind(i)*0.80,senescence, s2p2('SDR',s,1,[senescence,senescence]), s2p2('NRDR',s)], cbd_control);

figure(2); clf;
hold on
plot(ntot.tt,avg_age.total)
plot(ntot.tt,avg_age.renewing,'--')
plot(ntot.tt,avg_age.senescent,'-.')
plot(ntot.tt,avg_age.nonrenewing,':')
legend('total','renewing','DG post-renewing','non-renewing');
ylabel('Average cell age (years)')
xlabel('age of individual (years)')

% average cell age at death
avg_age.total(end) 

ave_age_9_2_controlsen_80perc(i,1)=avg_age.total(end);
end





%Shut off year range senescence from controlsen global, turnover from
%median individual turnover from controls (controlsen)

senescence=0.0340084887311051
turnover=0.02374243155



%%



s.ca = [10, 20;
        30, 20;
        70, 15];
s.dg = [10, 18;
        30, 18;
        70, 15];

cbd_control = cbdset(); % initialize the options

cbd_control.nbpar.fraction_renewing = 1;
cbd_control.nbpar.death = 3;
cbd_control.nbpar.birth = 0;
cbd_control.nbpar.senescence = 1;
cbd_control.nbpar.sendeath = 2;
cbd_control.nbpar.nrdeath  = 2;
cbd_control.death = @(t,a,pg)pg(1)*(t<=pg(2)) + pg(3)*(t>pg(2));
cbd_control.senescence = @(t,a,ps) ps*(t<=a);
cbd_control.sendeath   = @(t,a,pd) pd(1)*(t<=30) + pd(2)*(t>30);
cbd_control.nrdeath    = @(t,pd) pd(1)*(t<=30) + pd(2)*(t>30);
cbd_control.birth = 'volterra_on_renewing';
cbd_control.bc = bc2;



%%
%% visualization 

for i = 1:n % for testing: choose sample index between 1 and the number of samples in the group
    
cbd_control.bc_zone = zone(i);
cbd_control.age = age(i);
cbd_control.doc = dd(i); 
cbd_control.k_ploidy = zeros(size(age));
cbd_control.stereology = s; 

%% Cell age distribution plots 
figure(1); clf;
[~,ntot,avg_age] = age_distribution_plot([s2p2('IR',s), turnover, 10, turnover*0, senescence, s2p2('SDR',s,1,[senescence,senescence]), s2p2('NRDR',s)], cbd_control);

figure(2); clf;
hold on
plot(ntot.tt,avg_age.total)
plot(ntot.tt,avg_age.renewing,'--')
plot(ntot.tt,avg_age.senescent,'-.')
plot(ntot.tt,avg_age.nonrenewing,':')
legend('total','renewing','DG post-renewing','non-renewing');
ylabel('Average cell age (years)')
xlabel('age of individual (years)')

% average cell age at death
avg_age.total(end) 

ave_age_9_2_controlsen_shutoff_age10(i,1)=avg_age.total(end);
end

%%



%% visualization 

for i = 1:n % for testing: choose sample index between 1 and the number of samples in the group
    
cbd_control.bc_zone = zone(i);
cbd_control.age = age(i);
cbd_control.doc = dd(i); 
cbd_control.k_ploidy = zeros(size(age));
cbd_control.stereology = s; 

%% Cell age distribution plots 
figure(1); clf;
[~,ntot,avg_age] = age_distribution_plot([s2p2('IR',s), turnover, 15, turnover*0, senescence, s2p2('SDR',s,1,[senescence,senescence]), s2p2('NRDR',s)], cbd_control);

figure(2); clf;
hold on
plot(ntot.tt,avg_age.total)
plot(ntot.tt,avg_age.renewing,'--')
plot(ntot.tt,avg_age.senescent,'-.')
plot(ntot.tt,avg_age.nonrenewing,':')
legend('total','renewing','DG post-renewing','non-renewing');
ylabel('Average cell age (years)')
xlabel('age of individual (years)')

% average cell age at death
avg_age.total(end) 

ave_age_9_2_controlsen_shutoff_age15(i,1)=avg_age.total(end);
end

%%



%% visualization 

for i = 1:n % for testing: choose sample index between 1 and the number of samples in the group
    
cbd_control.bc_zone = zone(i);
cbd_control.age = age(i);
cbd_control.doc = dd(i); 
cbd_control.k_ploidy = zeros(size(age));
cbd_control.stereology = s; 

%% Cell age distribution plots 
figure(1); clf;
[~,ntot,avg_age] = age_distribution_plot([s2p2('IR',s), turnover, 20, turnover*0, senescence, s2p2('SDR',s,1,[senescence,senescence]), s2p2('NRDR',s)], cbd_control);

figure(2); clf;
hold on
plot(ntot.tt,avg_age.total)
plot(ntot.tt,avg_age.renewing,'--')
plot(ntot.tt,avg_age.senescent,'-.')
plot(ntot.tt,avg_age.nonrenewing,':')
legend('total','renewing','DG post-renewing','non-renewing');
ylabel('Average cell age (years)')
xlabel('age of individual (years)')

% average cell age at death
avg_age.total(end) 

ave_age_9_2_controlsen_shutoff_age20(i,1)=avg_age.total(end);
end

%%

%% visualization 

for i = 1:n % for testing: choose sample index between 1 and the number of samples in the group
    
cbd_control.bc_zone = zone(i);
cbd_control.age = age(i);
cbd_control.doc = dd(i); 
cbd_control.k_ploidy = zeros(size(age));
cbd_control.stereology = s; 

%% Cell age distribution plots 
figure(1); clf;
[~,ntot,avg_age] = age_distribution_plot([s2p2('IR',s), turnover, 25, turnover*0, senescence, s2p2('SDR',s,1,[senescence,senescence]), s2p2('NRDR',s)], cbd_control);

figure(2); clf;
hold on
plot(ntot.tt,avg_age.total)
plot(ntot.tt,avg_age.renewing,'--')
plot(ntot.tt,avg_age.senescent,'-.')
plot(ntot.tt,avg_age.nonrenewing,':')
legend('total','renewing','DG post-renewing','non-renewing');
ylabel('Average cell age (years)')
xlabel('age of individual (years)')

% average cell age at death
avg_age.total(end) 

ave_age_9_2_controlsen_shutoff_age25(i,1)=avg_age.total(end);
end

%%



%25% 

%%

%% visualization 

for i = 1:n % for testing: choose sample index between 1 and the number of samples in the group
    
cbd_control.bc_zone = zone(i);
cbd_control.age = age(i);
cbd_control.doc = dd(i); 
cbd_control.k_ploidy = zeros(size(age));
cbd_control.stereology = s; 

%% Cell age distribution plots 
figure(1); clf;
[~,ntot,avg_age] = age_distribution_plot([s2p2('IR',s), turnover, 25, turnover*0.25, senescence, s2p2('SDR',s,1,[senescence,senescence]), s2p2('NRDR',s)], cbd_control);

figure(2); clf;
hold on
plot(ntot.tt,avg_age.total)
plot(ntot.tt,avg_age.renewing,'--')
plot(ntot.tt,avg_age.senescent,'-.')
plot(ntot.tt,avg_age.nonrenewing,':')
legend('total','renewing','DG post-renewing','non-renewing');
ylabel('Average cell age (years)')
xlabel('age of individual (years)')

% average cell age at death
avg_age.total(end) 

ave_age_9_2_controlsen_shutoff25perc_age25(i,1)=avg_age.total(end);
end

%%



%% visualization 

for i = 1:n % for testing: choose sample index between 1 and the number of samples in the group
    
cbd_control.bc_zone = zone(i);
cbd_control.age = age(i);
cbd_control.doc = dd(i); 
cbd_control.k_ploidy = zeros(size(age));
cbd_control.stereology = s; 

%% Cell age distribution plots 
figure(1); clf;
[~,ntot,avg_age] = age_distribution_plot([s2p2('IR',s), turnover, 20, turnover*0.25, senescence, s2p2('SDR',s,1,[senescence,senescence]), s2p2('NRDR',s)], cbd_control);

figure(2); clf;
hold on
plot(ntot.tt,avg_age.total)
plot(ntot.tt,avg_age.renewing,'--')
plot(ntot.tt,avg_age.senescent,'-.')
plot(ntot.tt,avg_age.nonrenewing,':')
legend('total','renewing','DG post-renewing','non-renewing');
ylabel('Average cell age (years)')
xlabel('age of individual (years)')

% average cell age at death
avg_age.total(end) 

ave_age_9_2_controlsen_shutoff25perc_age20(i,1)=avg_age.total(end);
end

%%


%% visualization 

for i = 1:n % for testing: choose sample index between 1 and the number of samples in the group
    
cbd_control.bc_zone = zone(i);
cbd_control.age = age(i);
cbd_control.doc = dd(i); 
cbd_control.k_ploidy = zeros(size(age));
cbd_control.stereology = s; 

%% Cell age distribution plots 
figure(1); clf;
[~,ntot,avg_age] = age_distribution_plot([s2p2('IR',s), turnover, 15, turnover*0.25, senescence, s2p2('SDR',s,1,[senescence,senescence]), s2p2('NRDR',s)], cbd_control);

figure(2); clf;
hold on
plot(ntot.tt,avg_age.total)
plot(ntot.tt,avg_age.renewing,'--')
plot(ntot.tt,avg_age.senescent,'-.')
plot(ntot.tt,avg_age.nonrenewing,':')
legend('total','renewing','DG post-renewing','non-renewing');
ylabel('Average cell age (years)')
xlabel('age of individual (years)')

% average cell age at death
avg_age.total(end) 

ave_age_9_2_controlsen_shutoff25perc_age15(i,1)=avg_age.total(end);
end

%%


%% visualization 

for i = 1:n % for testing: choose sample index between 1 and the number of samples in the group
    
cbd_control.bc_zone = zone(i);
cbd_control.age = age(i);
cbd_control.doc = dd(i); 
cbd_control.k_ploidy = zeros(size(age));
cbd_control.stereology = s; 

%% Cell age distribution plots 
figure(1); clf;
[~,ntot,avg_age] = age_distribution_plot([s2p2('IR',s), turnover, 10, turnover*0.25, senescence, s2p2('SDR',s,1,[senescence,senescence]), s2p2('NRDR',s)], cbd_control);

figure(2); clf;
hold on
plot(ntot.tt,avg_age.total)
plot(ntot.tt,avg_age.renewing,'--')
plot(ntot.tt,avg_age.senescent,'-.')
plot(ntot.tt,avg_age.nonrenewing,':')
legend('total','renewing','DG post-renewing','non-renewing');
ylabel('Average cell age (years)')
xlabel('age of individual (years)')

% average cell age at death
avg_age.total(end) 

ave_age_9_2_controlsen_shutoff25perc_age10(i,1)=avg_age.total(end);
end

%%

%% visualization 

for i = 1:n % for testing: choose sample index between 1 and the number of samples in the group
    
cbd_control.bc_zone = zone(i);
cbd_control.age = age(i);
cbd_control.doc = dd(i); 
cbd_control.k_ploidy = zeros(size(age));
cbd_control.stereology = s; 

%% Cell age distribution plots 
figure(1); clf;
[~,ntot,avg_age] = age_distribution_plot([s2p2('IR',s), turnover, 5, turnover*0.25, senescence, s2p2('SDR',s,1,[senescence,senescence]), s2p2('NRDR',s)], cbd_control);

figure(2); clf;
hold on
plot(ntot.tt,avg_age.total)
plot(ntot.tt,avg_age.renewing,'--')
plot(ntot.tt,avg_age.senescent,'-.')
plot(ntot.tt,avg_age.nonrenewing,':')
legend('total','renewing','DG post-renewing','non-renewing');
ylabel('Average cell age (years)')
xlabel('age of individual (years)')

% average cell age at death
avg_age.total(end) 

ave_age_9_2_controlsen_shutoff25perc_age5(i,1)=avg_age.total(end);
end

%%




%% visualization 

for i = 1:n % for testing: choose sample index between 1 and the number of samples in the group
    
cbd_control.bc_zone = zone(i);
cbd_control.age = age(i);
cbd_control.doc = dd(i); 
cbd_control.k_ploidy = zeros(size(age));
cbd_control.stereology = s; 

%% Cell age distribution plots 
figure(1); clf;
[~,ntot,avg_age] = age_distribution_plot([s2p2('IR',s), turnover, 0, turnover*0.25, senescence, s2p2('SDR',s,1,[senescence,senescence]), s2p2('NRDR',s)], cbd_control);

figure(2); clf;
hold on
plot(ntot.tt,avg_age.total)
plot(ntot.tt,avg_age.renewing,'--')
plot(ntot.tt,avg_age.senescent,'-.')
plot(ntot.tt,avg_age.nonrenewing,':')
legend('total','renewing','DG post-renewing','non-renewing');
ylabel('Average cell age (years)')
xlabel('age of individual (years)')

% average cell age at death
avg_age.total(end) 

ave_age_9_2_controlsen_shutoff25perc_age0(i,1)=avg_age.total(end);
end

%%


%%10%

%%

%% visualization 

for i = 1:n % for testing: choose sample index between 1 and the number of samples in the group
    
cbd_control.bc_zone = zone(i);
cbd_control.age = age(i);
cbd_control.doc = dd(i); 
cbd_control.k_ploidy = zeros(size(age));
cbd_control.stereology = s; 

%% Cell age distribution plots 
figure(1); clf;
[~,ntot,avg_age] = age_distribution_plot([s2p2('IR',s), turnover, 25, turnover*0.10, senescence, s2p2('SDR',s,1,[senescence,senescence]), s2p2('NRDR',s)], cbd_control);

figure(2); clf;
hold on
plot(ntot.tt,avg_age.total)
plot(ntot.tt,avg_age.renewing,'--')
plot(ntot.tt,avg_age.senescent,'-.')
plot(ntot.tt,avg_age.nonrenewing,':')
legend('total','renewing','DG post-renewing','non-renewing');
ylabel('Average cell age (years)')
xlabel('age of individual (years)')

% average cell age at death
avg_age.total(end) 

ave_age_9_2_controlsen_shutoff10perc_age25(i,1)=avg_age.total(end);
end

%%


%% visualization 

for i = 1:n % for testing: choose sample index between 1 and the number of samples in the group
    
cbd_control.bc_zone = zone(i);
cbd_control.age = age(i);
cbd_control.doc = dd(i); 
cbd_control.k_ploidy = zeros(size(age));
cbd_control.stereology = s; 

%% Cell age distribution plots 
figure(1); clf;
[~,ntot,avg_age] = age_distribution_plot([s2p2('IR',s), turnover, 20, turnover*0.10, senescence, s2p2('SDR',s,1,[senescence,senescence]), s2p2('NRDR',s)], cbd_control);

figure(2); clf;
hold on
plot(ntot.tt,avg_age.total)
plot(ntot.tt,avg_age.renewing,'--')
plot(ntot.tt,avg_age.senescent,'-.')
plot(ntot.tt,avg_age.nonrenewing,':')
legend('total','renewing','DG post-renewing','non-renewing');
ylabel('Average cell age (years)')
xlabel('age of individual (years)')

% average cell age at death
avg_age.total(end) 

ave_age_9_2_controlsen_shutoff10perc_age20(i,1)=avg_age.total(end);
end

%%


%% visualization 

for i = 1:n % for testing: choose sample index between 1 and the number of samples in the group
    
cbd_control.bc_zone = zone(i);
cbd_control.age = age(i);
cbd_control.doc = dd(i); 
cbd_control.k_ploidy = zeros(size(age));
cbd_control.stereology = s; 

%% Cell age distribution plots 
figure(1); clf;
[~,ntot,avg_age] = age_distribution_plot([s2p2('IR',s), turnover, 15, turnover*0.10, senescence, s2p2('SDR',s,1,[senescence,senescence]), s2p2('NRDR',s)], cbd_control);

figure(2); clf;
hold on
plot(ntot.tt,avg_age.total)
plot(ntot.tt,avg_age.renewing,'--')
plot(ntot.tt,avg_age.senescent,'-.')
plot(ntot.tt,avg_age.nonrenewing,':')
legend('total','renewing','DG post-renewing','non-renewing');
ylabel('Average cell age (years)')
xlabel('age of individual (years)')

% average cell age at death
avg_age.total(end) 

ave_age_9_2_controlsen_shutoff10perc_age15(i,1)=avg_age.total(end);
end

%%


%% visualization 

for i = 1:n % for testing: choose sample index between 1 and the number of samples in the group
    
cbd_control.bc_zone = zone(i);
cbd_control.age = age(i);
cbd_control.doc = dd(i); 
cbd_control.k_ploidy = zeros(size(age));
cbd_control.stereology = s; 

%% Cell age distribution plots 
figure(1); clf;
[~,ntot,avg_age] = age_distribution_plot([s2p2('IR',s), turnover, 10, turnover*0.10, senescence, s2p2('SDR',s,1,[senescence,senescence]), s2p2('NRDR',s)], cbd_control);

figure(2); clf;
hold on
plot(ntot.tt,avg_age.total)
plot(ntot.tt,avg_age.renewing,'--')
plot(ntot.tt,avg_age.senescent,'-.')
plot(ntot.tt,avg_age.nonrenewing,':')
legend('total','renewing','DG post-renewing','non-renewing');
ylabel('Average cell age (years)')
xlabel('age of individual (years)')

% average cell age at death
avg_age.total(end) 

ave_age_9_2_controlsen_shutoff10perc_age10(i,1)=avg_age.total(end);
end

%%

%% visualization 

for i = 1:n % for testing: choose sample index between 1 and the number of samples in the group
    
cbd_control.bc_zone = zone(i);
cbd_control.age = age(i);
cbd_control.doc = dd(i); 
cbd_control.k_ploidy = zeros(size(age));
cbd_control.stereology = s; 

%% Cell age distribution plots 
figure(1); clf;
[~,ntot,avg_age] = age_distribution_plot([s2p2('IR',s), turnover, 5, turnover*0.1, senescence, s2p2('SDR',s,1,[senescence,senescence]), s2p2('NRDR',s)], cbd_control);

figure(2); clf;
hold on
plot(ntot.tt,avg_age.total)
plot(ntot.tt,avg_age.renewing,'--')
plot(ntot.tt,avg_age.senescent,'-.')
plot(ntot.tt,avg_age.nonrenewing,':')
legend('total','renewing','DG post-renewing','non-renewing');
ylabel('Average cell age (years)')
xlabel('age of individual (years)')

% average cell age at death
avg_age.total(end) 

ave_age_9_2_controlsen_shutoff10perc_age5(i,1)=avg_age.total(end);
end

%%




%% visualization 

for i = 1:n % for testing: choose sample index between 1 and the number of samples in the group
    
cbd_control.bc_zone = zone(i);
cbd_control.age = age(i);
cbd_control.doc = dd(i); 
cbd_control.k_ploidy = zeros(size(age));
cbd_control.stereology = s; 

%% Cell age distribution plots 
figure(1); clf;
[~,ntot,avg_age] = age_distribution_plot([s2p2('IR',s), turnover, 0, turnover*0.1, senescence, s2p2('SDR',s,1,[senescence,senescence]), s2p2('NRDR',s)], cbd_control);

figure(2); clf;
hold on
plot(ntot.tt,avg_age.total)
plot(ntot.tt,avg_age.renewing,'--')
plot(ntot.tt,avg_age.senescent,'-.')
plot(ntot.tt,avg_age.nonrenewing,':')
legend('total','renewing','DG post-renewing','non-renewing');
ylabel('Average cell age (years)')
xlabel('age of individual (years)')

% average cell age at death
avg_age.total(end) 

ave_age_9_2_controlsen_shutoff10perc_age0(i,1)=avg_age.total(end);
end

%%


years_AD=data.years_AD(selectedData);
years_depp=data.YEARS_depp(selectedData);
%%

save('results/datasets/NeuNpos_ALL_foodlag_1.mat')
%%

