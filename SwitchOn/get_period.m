function [init_period, init_amp, avg] = get_period(s, t, a, b)


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
% 
%get s for case vs0hfa == 0:
% tp1 = 150;
% tp2 = tp1+60;
% 
% a = find(t>tp1 & t <(tp1+0.1), 1);  %find t~~48 in t vector
% b = find(t>tp2 & t <(tp2+0.1), 1);  %find t~~98 in t vector

init_amp = zeros(1, 21);
init_period = zeros(1, 21);
avg = zeros(1, 21);
for i=1:21
    temp_t = t(a:b);
    [p, l] = findpeaks(s(a:b, i), 'SortStr','descend');
    mini = min(s(a:b, i));
    %[b, ~] = findpeaks(-s(a:b, i));
   
    
    if ~isempty(p) && length(l)>=2
    p = p(1);    
    Tau1 = abs(temp_t(l(2))-temp_t(l(1)));
    init_period(i) = Tau1;
    init_amp(i) = abs(p-mini);
    avg(i) = mean(s(a:b, i));
 
    else
    init_amp(i) = 0;
    init_period(i) = 0;
    
    end
    avg(i) = mean(s(a:b, i));

end

