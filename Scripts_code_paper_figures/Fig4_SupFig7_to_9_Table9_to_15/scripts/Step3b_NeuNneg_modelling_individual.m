%% parameters from NeuNneg modelling best scenario 11, lag of 0.5 and weights from bc0.5
    

clear
load('results/datasets/NeuNneg_ALL_foodlag_05.mat')


%% Scenario 2POP A Individual turnover rates with fixed renewing fractions
%5% renewal
Xind_11_90perc=zeros(n,1);
rind_11_90perc=zeros(n,1);

options = optimset('TolFun',1e-10,'TolX',1e-12);

parfor i=1:n
   if (~(isnan(age(i)) || isnan(c14(i)) || isnan(dd(i)) ))
%         fprintf('\nsubject i=%d: age=%f, 14Clevel=%f\n',i,age(i),c14(i));
      
      
        FAind=@(x)  (cAtmosZone(@c2pop,[0.9, x],age(i),bc2,kind(i),dd(i),zone(i), @cConstantTurnover,0)-c14(i)).^2;
        [Xtemp,Rtemp,Exitflag]=fminsearch(FAind,0.01,options); %FAind is run at both 0.1 and 0.01 
        if Exitflag==-1
            Xtemp = -1;
            Rtemp = -1;
        else
            Xtemp=abs(Xtemp);
            Xind_11_90perc(i)=Xtemp;
            rind_11_90perc(i) = Rtemp;
        end
        fprintf('\nsubject i=%d, turnover rate=%f per year\n',i,Xind_11_90perc(i));
    else
        Xind_11_90perc(i)=NaN;
%         fprintf('\nData missing\n');
    end
end



%%


%% Use age_distribution_plot to compute cell age distributions average cell age 
%  in each population subsets 
% BC lag 0.5% renewal 90 

x_11_ind_ren90perc=[0.0208741901451722;
0.0122485541757196;
0.0110921475207433;
0.0186971950493753;
0.0189539060611278;
0.0164135032054037;
0.0192314087962732;
0.0145164658846334;
0.0231735224220902;
0.0124045676030219;
0.0181994909811765;
0.0179326957669109;
0.00599028436187654;
0.0147121296301484;
0.00769360571727156;
NaN;
NaN;
0.0123342425376177;
0.0205691522313282;
0.0417366569209845;
0.0262199931815267;
0.012443237121217;
0.0144583840006962;
0.00161281714402142;
0.0141817140271887;
0.00747851385734975;
0.0121145667126402;
0.0128006332879886;
0.0160101394038647;
0.0264088014196605;
0.0122023306433111;
0.0072931324308738;
0.00514536858163773;
0.0161216412484646;
0.0162034281203523;
0.0449571204424138;
NaN;
0.0242110499599949;
0.0212704294640571;
0.0202737477822229;
0.00694552648440003;
0.0079945328971371;
0.0272655230164528;
0.00684866478387266;
0.00855860337335616;
0.018113684671931;
0.0140735621200875;
0.00979060175269842;
0.0299445398841054;
0.0743346527777613;
0.0201302307611331;
0.0084635110637173;
0.0343178959228099;
0.00890338296256959;
0.0244923372613266;
0.0117418921478093;
0.00875502381380647;
0.00971029147040099;
0.00881471361964941;
0.0162658423315734;
0.0100849908422679;
0.0154350628983229;
0.0275313848117367;
0.0458488446455449;
0.0252147389138118;
0.0180852768467739;
0.0128458581920713;
0.0156496051009745;
0.0180353488950059;
0.0195539029808715;
0.0219063879111782;
NaN;
0.0123184358347207;
0.0149448908874765;
0.00560632712393998;
0.0301488705016673;
0.0282307469053194;
0.0158326492961496;
0.0144995401827619;
0.0238685086201877;
0.0369783632736654;
0.0188045564610511;
0.0215121248196811;
0.0184445017976687;
0.0166383529985324;
0.00765821011830121;
0.010084779237397;
0.0190745204724372;
0.014307595314458;
0.0271298271678388;
0.0265982109913603;
0.0134785912949592;
0.0244038396114484;
0.0118406900782138;
0.0188938329694793;
0.0549277566308156;
0.030925972041674;
0.0170623994972557;
0.00842406444996595;
0.0114022238729522;
0.037025102917105;
0.00814033123012632;
0.0246816565087065;
0.021708658348769;
NaN;
0.0275354930600152;
0.0213646838935092;
0.00546392673347144;
NaN;
0.0320833069998771;
0.0234786849562079;
0.0593613200671972;
0.030947456272319;
0.00274521868769077;
0.0046473794505;
0.0131435445165262;
0.00891224654950201;
0.00894079164788127;
0.011061838102527;
0.0110440376196057;
0.0120947906756774;
0.0140985186127946;
0.270836386461743;
0.0102237824583426;
0.00661904533579945;
NaN;
0.0260002250522375]


%%

cbd_control = cbdset(); % initialize the options

cbd_control.nbpar.fraction_renewing = 1;
cbd_control.nbpar.death = 1;
cbd_control.nbpar.birth = 0;
cbd_control.death = @(t,a,pg)pg;
cbd_control.birth = 'volterra_on_renewing';
cbd_control.bc = bc2;


%% visualization


for i = 1:n % for testing: choose sample index between 1 and the number of samples in the group
    
cbd_control.bc_zone = zone(i);
cbd_control.age = age(i);
cbd_control.doc = dd(i); 
cbd_control.k_ploidy = zeros(size(age));

%% Cell age distribution plots 
figure(1); clf;
[~,ntot,avg_age] = age_distribution_plot([0.9, x_11_ind_ren90perc(i)], cbd_control);

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

ave_age_11(i,1)=avg_age.total(end);
end


%%
save('results/datasets/NeuNneg_ALL_foodlag_05.mat')

