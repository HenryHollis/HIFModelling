function dydt = SwitchOnHIF(t,y,B)
MP1 = y(1);
MP2 = y(2);
MC1 = y(3);
MC2 = y(4);
MREV = y(5);
MCLK = y(6);
MBM1 = y(7);
MROR = y(8);
P1= y(9);
P2 = y(10);
C1  = y(11);
C2 = y(12);
REV = y(13);
CLK = y(14);
BM1 = y(15);
ROR = y(16);
P1C1 = y(17);
P2C1 = y(18);
P1C2 = y(19);
P2C2 = y(20);
CLKBM1 = y(21);
MHFA = y(22);
HFA = y(23);
HFAHFB = y(24);
HFABM1 = y(25);

% Parameters
vs0P1 = B(1);
vs1P1 = B(2);
vs0P2 = B(3);
vs1P2 = B(4);
vs0C1 = B(5);
vs1C1 = B(6);
vs2C1 = B(7);
vs0C2 = B(8);
vs1C2 = B(9);
vs2C2 = B(10);
vs1REV = B(11);
vs0CLK = B(12);
vs1CLK = B(13);
vs0BM1 = B(14);
vs1BM1 = B(15);
vs0ROR = B(16);
vs1ROR = B(17);
vs2ROR = B(18);

na1_P1 = B(19);
ni1_P1 = B(20);
ni2_P1 = B(21);
ni3_P1 = B(22);
ni4_P1 = B(23);
na1_P2 = B(24);
ni1_P2 = B(25);
ni2_P2 = B(26);
ni3_P2 = B(27);
ni4_P2 = B(28);
na1_C1 = B(29);
na2_C1 = B(30);
ni1_C1 = B(31);
ni2_C1 = B(32);
ni3_C1 = B(33);
ni4_C1 = B(34);
ni5_C1 = B(35);
na1_C2 = B(36);
na2_C2 = B(37);
ni1_C2 = B(38);
ni2_C2 = B(39);
ni3_C2 = B(40);
ni4_C2 = B(41);
ni5_C2 = B(42);
na1_REV = B(43);
ni1_REV = B(44);
ni2_REV = B(45);
ni3_REV = B(46);
ni4_REV = B(47);
na1_CLK = B(48);
ni1_CLK = B(49);
na1_BM1 = B(50);
ni1_BM1 = B(51);
na1_ROR = B(52);
na2_ROR = B(53);
ni1_ROR = B(54);
ni2_ROR = B(55);
ni3_ROR = B(56);
ni4_ROR = B(57);
ni5_ROR = B(58);

KA1P1 = B(59);
KI1P1 = B(60);
KI2P1 = B(61);
KI3P1 = B(62);
KI4P1 = B(63);
KA1P2 = B(64);
KI1P2 = B(65);
KI2P2 = B(66);
KI3P2 = B(67);
KI4P2 = B(68);
KA1C1 = B(69);
KA2C1 = B(70);
KI1C1 = B(71);
KI2C1 = B(72);
KI3C1 = B(73);
KI4C1 = B(74);
KI5C1 = B(75);
KA1C2 = B(76);
KA2C2 = B(77);
KI1C2 = B(78);
KI2C2 = B(79);
KI3C2 = B(80);
KI4C2 = B(81);
KI5C2 = B(82);
KA1REV = B(83);
KI1REV = B(84);
KI2REV = B(85);
KI3REV = B(86);
KI4REV = B(87);
KA1CLK = B(88);
KI1CLK = B(89);
KA1BM1 = B(90);
KI1BM1 = B(91);
KA1ROR = B(92);
KA2ROR = B(93);
KI1ROR = B(94);
KI2ROR = B(95);
KI3ROR = B(96);
KI4ROR = B(97);
KI5ROR = B(98);

kdmP1 = B(99);
kdmP2 = B(100);
kdmC1 = B(101);
kdmC2 = B(102);
kdmREV = B(103);
kdmCLK = B(104);
kdmBM1 = B(105);
kdmROR = B(106);

tlP1  = B(107);
tlP2  = B(108);
tlC1  = B(109);
tlC2  = B(110);
tlREV = B(111);
tlCLK = B(112);
tlBM1 = B(113);
tlROR = B(114);

upP1  = B(115);
upP2  = B(116);
upC1 = B(117);
upC2 = B(118);
upREV = B(119);
upCLK = B(120);
upBM1 = B(121);
upROR = B(122);
arP1C1 = B(123);
arP1C2 = B(124);
arP2C1 = B(125);
arP2C2 = B(126);
arCLKBM1 = B(127);

drP1C1 = B(128);
drP1C2 = B(129);
drP2C1 = B(130);
drP2C2 = B(131);
drCLKBM1 = B(132);
%% adding Hif model params
vs0Hfa = B(133);     % basal rate of transcription of Hif-1a gene
vs1Hfa = B(134);     % maximal transcription rate of Hif-1a gene under CLK/BM1 
KA1Hfa = B(135);     % dissociation constant for CLK/BMAL binding to promoter of Hif1a
na1_Hfa = B(136);    % hill coefficient for CLk/BMAL-Hif-1a
kdmHfa = B(137);     % degredation term for Hif-1a mRNA
tlHFA = B(138);      % translation rate of HIF1A
arHFAHFB = B(139);   % complex association rate for HIF1A/HIF1B complex, FOR NOW ASSSUME HIF1B is constant
upHFA = B(140);      % degredation rate for HIF1A
drHFAHFB = B(141);   % dissoaciation rate for HIF1A/HIF1B
arHFABM1 = B(142);   % association rate for HIF1A/BM1 complex
drHFABM1 = B(143);   % dissociation rate for HIF1A/BM1 complex

% max transcrip rate from HFAHFB
vs2REV = B(144);      
vs2P2 = B(145);
vs3C1 = B(146);
%vs3C2 = B(147);     

% max rate of transcrip of P1 from HFA/BM1
vs3REV = B(148);      
vs3P2 = B(149);
vs4C1 = B(150);
vs4C2 = B(151);

%hill coeffs for transcription from HFAHFB
na2_REV = B(152);
na2_P2 = B(153);
na3_C1 = B(154);
%na3_C2 = B(155);

%hill coeffs for transcription from HFABM1
na3_REV = B(156);
na3_P2 = B(157);
na4_C1 = B(158);
%na4_C2 = B(159);

%m-m constant for transcript from HFAHFB
KA2REV = B(160);
KA2P2 = B(161);
KA3C1 = B(162);
%KA3C2 = B(163);

%m-m constant for transcript from HFABM1
KA3REV = B(164);
KA3P2 = B(165);
KA4C1 = B(166);
%KA4C2 = B(167);


if t>100 && t<200
    vs0Hfa = 5;
    
    %vs2P2 = 0;
end

%% ODEs
%modifying cry1, cry2, per2, per1 transcription to include HFA/HFB and HFA/BM1 promoter
%dydt(1,1) = (vs0P1+vs1P1*(CLKBM1^na1_P1)/(KA1P1^na1_P1+CLKBM1^na1_P1) +   vs2P1*(HFAHFB^na2_P1)/(KA2P1^na2_P1+HFAHFB^na2_P1) + vs3P1* (HFABM1^na3_P1)/(KA3P1^na3_P1+HFABM1^na3_P1)   )*(KI1P1^ni1_P1)/(KI1P1^ni1_P1+P1C1^ni1_P1)*(KI2P1^ni2_P1)/(KI2P1^ni2_P1+P1C2^ni2_P1)*(KI3P1^ni3_P1)/(KI3P1^ni3_P1+P2C1^ni3_P1)*(KI4P1^ni4_P1)/(KI4P1^ni4_P1+P2C2^ni4_P1)-kdmP1*MP1;
dydt(1,1) = (vs0P1+vs1P1*(CLKBM1^na1_P1)/(KA1P1^na1_P1+CLKBM1^na1_P1))*(KI1P1^ni1_P1)/(KI1P1^ni1_P1+P1C1^ni1_P1)*(KI2P1^ni2_P1)/(KI2P1^ni2_P1+P1C2^ni2_P1)*(KI3P1^ni3_P1)/(KI3P1^ni3_P1+P2C1^ni3_P1)*(KI4P1^ni4_P1)/(KI4P1^ni4_P1+P2C2^ni4_P1)-kdmP1*MP1;
%dydt(2,1) = (vs0P2+vs1P2*(CLKBM1^na1_P2)/(KA1P2^na1_P2+CLKBM1^na1_P2) +   vs2P2*(HFAHFB^na2_P2)/(KA2P2^na2_P2+HFAHFB^na2_P2) + vs3P2* (HFABM1^na3_P2)/(KA3P2^na3_P2+HFABM1^na3_P2)   )*(KI1P2^ni1_P2)/(KI1P2^ni1_P2+P1C1^ni1_P2)*(KI2P2^ni2_P2)/(KI2P2^ni2_P2+P1C2^ni2_P2)*(KI3P2^ni3_P2)/(KI3P2^ni3_P2+P2C1^ni3_P2)*(KI4P2^ni4_P2)/(KI4P2^ni4_P2+P2C2^ni4_P2)-kdmP2*MP2;
%dydt(3,1) = (vs0C1+vs1C1*(CLKBM1^na1_C1)/(KA1C1^na1_C1+CLKBM1^na1_C1)+vs2C1*(ROR^na2_C1)/(KA2C1^na2_C1+ROR^na2_C1)    +  vs3C1*(HFAHFB^na3_C1)/(KA3C1^na3_C1+HFAHFB^na3_C1) + vs4C1* (HFABM1^na4_C1)/(KA4C1^na4_C1+HFABM1^na4_C1)  )*(KI1C1^ni1_C1)/(KI1C1^ni1_C1+P1C1^ni1_C1)*(KI2C1^ni2_C1)/(KI2C1^ni2_C1+P1C2^ni2_C1)*(KI3C1^ni3_C1)/(KI3C1^ni3_C1+P2C1^ni3_C1)*(KI4C1^ni4_C1)/(KI4C1^ni4_C1+P2C2^ni4_C1)*(KI5C1^ni5_C1)/(KI5C1^ni5_C1+REV^ni5_C1)-kdmC1*MC1;
dydt(2,1) = (vs0P2+vs1P2*(CLKBM1^na1_P2)/(KA1P2^na1_P2+CLKBM1^na1_P2)  )*(KI1P2^ni1_P2)/(KI1P2^ni1_P2+P1C1^ni1_P2)*(KI2P2^ni2_P2)/(KI2P2^ni2_P2+P1C2^ni2_P2)*(KI3P2^ni3_P2)/(KI3P2^ni3_P2+P2C1^ni3_P2)*(KI4P2^ni4_P2)/(KI4P2^ni4_P2+P2C2^ni4_P2)  +   vs2P2*(HFAHFB^na2_P2)/(KA2P2^na2_P2+HFAHFB^na2_P2) + vs3P2* (HFABM1^na3_P2)/(KA3P2^na3_P2+HFABM1^na3_P2)   -kdmP2*MP2;
dydt(3,1) = (vs0C1+vs1C1*(CLKBM1^na1_C1)/(KA1C1^na1_C1+CLKBM1^na1_C1)+vs2C1*(ROR^na2_C1)/(KA2C1^na2_C1+ROR^na2_C1) )*(KI1C1^ni1_C1)/(KI1C1^ni1_C1+P1C1^ni1_C1)*(KI2C1^ni2_C1)/(KI2C1^ni2_C1+P1C2^ni2_C1)*(KI3C1^ni3_C1)/(KI3C1^ni3_C1+P2C1^ni3_C1)*(KI4C1^ni4_C1)/(KI4C1^ni4_C1+P2C2^ni4_C1)*(KI5C1^ni5_C1)/(KI5C1^ni5_C1+REV^ni5_C1) +  vs3C1*(HFAHFB^na3_C1)/(KA3C1^na3_C1+HFAHFB^na3_C1) + vs4C1* (HFABM1^na4_C1)/(KA4C1^na4_C1+HFABM1^na4_C1)   -kdmC1*MC1;

%dydt(4,1) = (vs0C2+vs1C2*(CLKBM1^na1_C2)/(KA1C2^na1_C2+CLKBM1^na1_C2)+vs2C2*(ROR^na2_C2)/(KA2C2^na2_C2+ROR^na2_C2)    +  vs3C2*(HFAHFB^na3_C2)/(KA3C2^na3_C2+HFAHFB^na3_C2) + vs4C2* (HFABM1^na4_C2)/(KA4C2^na4_C2+HFABM1^na4_C2)  )*(KI1C2^ni1_C2)/(KI1C2^ni1_C2+P1C1^ni1_C2)*(KI2C2^ni2_C2)/(KI2C2^ni2_C2+P1C2^ni2_C2)*(KI3C2^ni3_C2)/(KI3C2^ni3_C2+P2C1^ni3_C2)*(KI4C2^ni4_C2)/(KI4C2^ni4_C2+P2C2^ni4_C2)*(KI5C2^ni5_C2)/(KI5C2^ni5_C2+REV^ni5_C2)-kdmC2*MC2;
dydt(4,1) = (vs0C2+vs1C2*(CLKBM1^na1_C2)/(KA1C2^na1_C2+CLKBM1^na1_C2)+vs2C2*(ROR^na2_C2)/(KA2C2^na2_C2+ROR^na2_C2))*(KI1C2^ni1_C2)/(KI1C2^ni1_C2+P1C1^ni1_C2)*(KI2C2^ni2_C2)/(KI2C2^ni2_C2+P1C2^ni2_C2)*(KI3C2^ni3_C2)/(KI3C2^ni3_C2+P2C1^ni3_C2)*(KI4C2^ni4_C2)/(KI4C2^ni4_C2+P2C2^ni4_C2)*(KI5C2^ni5_C2)/(KI5C2^ni5_C2+REV^ni5_C2)-kdmC2*MC2;

%dydt(5,1) = vs1REV*(CLKBM1^na1_REV)/(KA1REV^na1_REV+CLKBM1^na1_REV)*(KI1REV^ni1_REV)/(KI1REV^ni1_REV+P1C1^ni1_REV)*(KI2REV^ni2_REV)/(KI2REV^ni2_REV+P1C2^ni2_REV)*(KI3REV^ni3_REV)/(KI3REV^ni3_REV+P2C1^ni3_REV)*(KI4REV^ni4_REV)/(KI4REV^ni4_REV+P2C2^ni4_REV)-kdmREV*MREV;
dydt(5,1) = vs1REV*(CLKBM1^na1_REV)/(KA1REV^na1_REV+CLKBM1^na1_REV)*(KI1REV^ni1_REV)/(KI1REV^ni1_REV+P1C1^ni1_REV)*(KI2REV^ni2_REV)/(KI2REV^ni2_REV+P1C2^ni2_REV)*(KI3REV^ni3_REV)/(KI3REV^ni3_REV+P2C1^ni3_REV)*(KI4REV^ni4_REV)/(KI4REV^ni4_REV+P2C2^ni4_REV) + vs2REV*(HFAHFB^na2_REV)/(KA2REV^na2_REV+HFAHFB^na2_REV) + vs3REV*(HFABM1^na3_REV)/(KA3REV^na3_REV+HFABM1^na3_REV) -kdmREV*MREV;

dydt(6,1) = (vs0CLK+vs1CLK*(ROR^na1_CLK)/(KA1CLK^na1_CLK+ROR^na1_CLK))*(KI1CLK^ni1_CLK)/(KI1CLK^ni1_CLK+REV^ni1_CLK)-kdmCLK*MCLK;
dydt(7,1) = (vs0BM1+vs1BM1*(ROR^na1_BM1)/(KA1BM1^na1_BM1+ROR^na1_BM1))*(KI1BM1^ni1_BM1)/(KI1BM1^ni1_BM1+REV^ni1_BM1)-kdmBM1*MBM1;
dydt(8,1) = (vs0ROR+vs1ROR*(CLKBM1^na1_ROR)/(KA1ROR^na1_ROR+CLKBM1^na1_ROR)+vs2ROR*(ROR^na2_ROR)/(KA2ROR^na2_ROR+ROR^na2_ROR))*(KI1ROR^ni1_ROR)/(KI1ROR^ni1_ROR+P1C1^ni1_ROR)*(KI2ROR^ni2_ROR)/(KI2ROR^ni2_ROR+P1C2^ni2_ROR)*(KI3ROR^ni3_ROR)/(KI3ROR^ni3_ROR+P2C1^ni3_ROR)*(KI4ROR^ni4_ROR)/(KI4ROR^ni4_ROR+P2C2^ni4_ROR)*(KI5ROR^ni5_ROR)/(KI5ROR^ni5_ROR+REV^ni5_ROR)-kdmROR*MROR;

dydt(9,1) = tlP1*MP1 - upP1*P1 - arP1C1*P1*C1 - arP1C2*P1*C2 + drP1C1*P1C1 + drP1C2*P1C2;
dydt(10,1) = tlP2*MP2 - upP2*P2 - arP2C1*P2*C1 - arP2C2*P2*C2 + drP2C1*P2C1 + drP2C2*P2C2;
dydt(11,1) = tlC1*MC1 - upC1*C1 - arP1C1*P1*C1 - arP2C1*P2*C1 + drP1C1*P1C1 + drP2C1*P2C1;
dydt(12,1) = tlC2*MC2 - upC2*C2 - arP1C2*P1*C2 - arP2C2*P2*C2 + drP1C2*P1C2 + drP2C2*P2C2;
dydt(13,1) = tlREV*MREV - upREV*REV;
dydt(14,1) = tlCLK*MCLK - upCLK*CLK - arCLKBM1*CLK*BM1 + drCLKBM1*CLKBM1;
dydt(15,1) = tlBM1*MBM1 - upBM1*BM1 - arCLKBM1*CLK*BM1 + drCLKBM1*CLKBM1;
dydt(16,1) = tlROR*MROR - upROR*ROR;

dydt(17,1) = arP1C1*P1*C1 - drP1C1*P1C1;
dydt(18,1) = arP2C1*P2*C1 - drP2C1*P2C1;
dydt(19,1) = arP1C2*P1*C2 - drP1C2*P1C2;
dydt(20,1) = arP2C2*P2*C2 - drP2C2*P2C2;
dydt(21,1) = arCLKBM1*CLK*BM1 - drCLKBM1*CLKBM1;
%New equations for hif
dydt(22,1) = (vs0Hfa+vs1Hfa*(CLKBM1^na1_Hfa)/(KA1Hfa^na1_Hfa+CLKBM1^na1_Hfa))-kdmHfa* MHFA;    %Hif1a mRNA
dydt(23,1) = tlHFA*MHFA - upHFA*HFA - arHFAHFB*HFA + drHFAHFB*HFAHFB;                          %HIF1A protein
dydt(24,1) = arHFAHFB*HFA     - drHFAHFB*HFAHFB;                                               %HIF1A/HIF1B complex                            %HIF1A/HIF1B complex
dydt(25,1) = arHFABM1*HFA*BM1 - drHFABM1*HFABM1;                                               %Hif1A/BM1 complex






