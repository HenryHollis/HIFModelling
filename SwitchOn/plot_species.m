function ans = plot_species(s, t, t1, t2, a, b)
MP1 = 1;
MP2 = 2;
MC1 = 3;
MC2 = 4;
MREV = 5;
MCLK = 6;
MBM1 = 7;
MROR = 8;
P1= 9;
P2 = 10;
C1  = 11;
C2 = 12;
REV = 13;
CLK = 14;
BM1 = 15;
ROR = 16;
P1C1 = 17;
P2C1 = 18;
P1C2 = 19;
P2C2 = 20;
CLKBM1 = 21;
MHFA = 22;
HFA = 23;
HFAHFB = 24;
HFABM1 = 25;

%close all;
%% recreate figure plots
figure();
tiledlayout(4, 2);

nexttile;
yyaxis left
plot(t(a:b),s(a:b,MREV), Color='blue');
yyaxis right
plot(t(a:b),s(a:b, REV), Color='red');
xlim([t1 t2]);
title('mRev, REV');

nexttile;
yyaxis left
plot(t(a:b),s(a:b,MC2), Color='blue');
yyaxis right
plot(t(a:b),s(a:b, C2), Color='red');
xlim([t1 t2]);
title('mCry2, CRY2');

nexttile;
yyaxis left
plot(t(a:b),s(a:b,MP1), Color='blue');
yyaxis right
plot(t(a:b),s(a:b, P1), Color='red');
xlim([t1 t2]);
title('mPer1, PER1');

nexttile;
yyaxis left
plot(t(a:b),s(a:b,MROR), Color='blue');
yyaxis right
plot(t(a:b),s(a:b, ROR), Color='red');
xlim([t1 t2]);
title('mRor, Ror');

nexttile;
yyaxis left
plot(t(a:b),s(a:b,MP2), Color='blue');
yyaxis right
plot(t(a:b),s(a:b, P2), Color='red');
xlim([t1 t2]);
title('mPer2, Per2');

nexttile;
yyaxis left
plot(t(a:b),s(a:b,MBM1), Color='blue');
yyaxis right
plot(t(a:b),s(a:b, BM1), Color='red');
xlim([t1 t2]);
title('mBmal1, BMAL1');

nexttile;
yyaxis left
plot(t(a:b),s(a:b,MC1), Color='blue');
yyaxis right
plot(t(a:b),s(a:b, C1), Color='red');
xlim([t1 t2]);
title('mCry1, CRY1');

nexttile;
yyaxis left
plot(t(a:b),s(a:b,MCLK), Color='blue');
yyaxis right
plot(t(a:b),s(a:b, CLK), Color='red');
xlim([t1 t2]);
title('mClk, CLK');

% %% phase plots
% figure()
% tiledlayout(3, 1);
% nexttile;
% plot(s(a:b, BM1), s(a:b, CLK));
% title('BMAL v CLK');
% nexttile;
% plot(s(a:b, BM1), s(a:b, P1));
% title('BMAL v PER1');
% nexttile;
% plot(s(a:b, BM1), s(a:b, P2));
% title('BMAL v PER2');
% 
% figure()
% plot(t(a:b), s(a:b, CLKBM1));
% title('CLKBM1');
% xlim([t1, t2]);
% HIF-1A
figure()
tiledlayout(5, 1);
nexttile;
plot(t(a:b), s(a:b, MHFA));
title('MHFA')
nexttile;
plot(t(a:b), s(a:b, HFA));
title('HIF1-A');
nexttile;
plot(t(a:b), s(a:b, HFAHFB));
title('HFA/HFB');
nexttile;
plot(t(a:b), s(a:b, HFABM1));
title('HFA/BMAL1');
nexttile;
plot(t(a:b), s(a:b, CLKBM1));
title('CLK/BM1');



% % Top two plots
% figure(1)
% tiledlayout(2, 1);
% nexttile
% plot(t, s(:,MHFA));%, t, s(:,7) );
% legend('Hfa mRNA');%, 'BML1' );
% 
% % Plot that spans
% nexttile
% plot( t, s(:,23));
% legend('HIF1A protein');
% %%
% figure(2)
% tiledlayout(2, 1);
% 
% nexttile
% plot( t, s(:,24));
% legend('HIF1A/HIF1B protein');
% 
% nexttile
% plot( t, s(:,25));
% legend('HIF1A/BM1 protein');
% 
% figure(3)
% plot(t, s(:, REV), t, s(:,MREV));
% 
% figure(4)
% plot(s(:, 15), s(:, 10))



 end