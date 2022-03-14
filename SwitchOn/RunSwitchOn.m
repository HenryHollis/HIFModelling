%function RunSwitchOn

ODEFUN=@SwitchOnHIF;

B =[0.17; 3.84; 0.09; 3.29; 0.26; 2.44; 2.89; 1.29;...  %param set for hif model
    2.72; 4.28; 1.03; 3.98; 3.36; 1.98; 4.12; 0.69;...
    3.55; 0.46; 3.28; 3.93; 2.61; 1.66; 4.85; 4.50; 4.45; 3.70; 4.35;...
    3.67; 4.91; 3.01; 4.65; 3.66; 2.59; 0.29; 2.24; 4.39; 4.43; 4.68; 4.71;...
    2.23; 0.48; 1.75; 4.40; 0.30; 0.67; 1.93; 3.58; 3.50; 1.96; 4.13; 0.02;...
    1.57; 0.56; 2.25; 4.73; 3.43; 0.84; 4.33; 1.98; 1.07; 3.96;...
    1.68; 3.11; 1.90; 4.51; 2.98; 2.24; 3.31; 1.46;...
    3.76; 0.03; 0.77; 3.59; 3.44; 2.82; 0.69; 2.96;...
    4.63; 2.95; 3.57; 2.75; 3.97; 3.15; 3.56; 3.62;...
    4.71; 1.23; 1.59; 0.83; 2.59; 2.47; 4.30; 4.89;...
    3.49; 2.34; 2.71; 2.09; 3.36; 2.18; 0.20; 0.22; 0.41; 0.60;...
    3.19; 1.42; 1.50; 3.05; 2.38; 3.94; 1.69; 1.60; 3.04; 4.00; 1.39; 2.58;...
    0.16; 3.03; 1.72; 0.31; 1.52; 2.28; 3.33; 3.57; 3.12; 3.81;...
    0.95; 1.98; 1.32; 1.85; 1.37; 2.42; 0.97;...
    0; 0.3; 5; 4.5; 2;... %basal mhifa, max hifa under CLKBM1, KA1Hfa, na1_Hfa, kdmHfa
    2; 1.9; 1.5; .97; 1.9; .97;...  %tlHFA, arHFAHFB, upHFA, drHFAHFB, arHFABM1, drHFABM1
    0.015; 0.05; 0.015; 3.5;...  %max trxn rate of mREV,p2,c1,c2 under HFAHFB DEFAULT 2.5  
    0.015; 0.05; 0.015; 3.5;...  %max trxn rate of mREV,p2,c1,c2 under HFABM1
    3.5; 3.5; 3.5; 4.5;...  %hill coeff for trxn rate of mREV,p2,c1,c2 under HFAHFB
    3.5; 3.5; 3.5; 4.5;...  %hill coeff for trxn rate of mREV,p2,c1,c2 under HFABM1
    2; 2; 2; 2;...  %mm constant for trxn rate of mREV,p2,c1,c2 under HFAHFB
    2; 2; 2; 2;...  %mm constant for trxn rate of mREV,p2,c1,c2 under HFABM1
    ];


%set init conditions for hif model
s0= [0.23; 0.25; .125; 1.7; 0.07; 1.2; 0.713; 0.13; 0.75; 12; 5; 5; 0.3; 8.5; 7.45; 0; 0;0;0;0;0; 0; 8; 0; 0];

% Specify the final time; the simulation will run over the interval [0, Tend]
Tend=500;
opts = odeset('RelTol',1e-9,'AbsTol',1e-9);


%% Generate the simulation.
[t,s]= ode45(@(t2, y) ODEFUN(t2,y,B), [0 Tend], s0 , opts);
%% Get t indices
% we only want the clean oscillations so we'll plot t1 through t1+50

 tp1 = 45;
 tp2 = tp1+300;
 tp3 = 150;
 tp4 = tp3+60;
a = find(t>tp1 & t <(tp1+0.1), 1);  %find t~~48 in t vector
b = find(t>tp2 & t <(tp2+0.1), 1);  %find t~~98 in t vector
f = find(t>tp1+60 & t <(tp1+60+0.1), 1);  %find t~~98 in t vector

c = find(t>tp3 & t <(tp3+0.1), 1);  %find t~~48 in t vector
d = find(t>tp4 & t <(tp4+0.1), 1);  %find t~~98 in t vector

plot_species(s, t, tp1, tp2, a, b);
[period, amp, avg] = get_period(s, t, a, f);
[period_hif, amp_hif, avg_hif] = get_period(s, t, c, d);
%plot_period_amp_diff(t, t2, s, s2);
%get_period_and_amp({t2}, {s2});

%% plot amplitude ratio and period ratio:
species = categorical({'MP1', 'MP2', 'MC1', 'MC2', 'MREV','MCLK', 'MBM1', 'MROR'});
figure()
bar(species, amp(1:8)./amp_hif(1:8));
title('Amplitude Ratio (peaks to troughs) Normozia:Hypoxia');
figure()
avgs = zeros(2, 21);
avgs(1, :) = avg./avg;
avgs(2, :) = avg_hif./avg;
bar(categorical({'MBMAL', 'MCLOCK', 'MCRY1', 'MCRY2', 'MPER1', 'MPER2', 'MREV' }), avgs(:, [7 6 3 4  1 2 5])');
title('Fold Change in Average mRNA species')
legend('Normoxia', 'Hypoxia');
%end

