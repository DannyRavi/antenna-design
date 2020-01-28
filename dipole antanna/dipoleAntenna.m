clc
clear
%for 10Ghz frequency, we assume that landa/2 =0.012 and width<<(landa/2) or
%width <= (landa/100)
%--------------- auto generate antenna design -------------
c = 3e8;
freq = 10e9;
Lambda = c/freq;
Lambda2 = Lambda/2;
width = Lambda/100;
d = dipole('Length',Lambda2,'Width',width);
figure;
pattern(d, freq);
figure;
pattern(d, freq, 0, 0:1:360);
P = polarpattern('gco');
P.AntennaMetrics = 1;

%--------------- manual design by E and h formula -----------


%Dipole antanna
L = Lambda2;
%Phase constant
B = 2*pi/Lambda;
t = 0:0.0001:2*pi;
% Far-field pattern equation
E = abs((cos(B*L/2*cos(t))-cos(B*L/2))./sin(t));
%E = abs((cos((pi/2)*cos(t)))./sin(t));
figure()
polar(t,E)
title('E plain')
view([90 -90])

k = find(abs(E-0.5) < 0.0001);
k1=k(1);
radToDeg = 360/(2*pi);
HPBW = t(k1)*radToDeg*2;
disp("HPBW = ")
disp(HPBW)
dirctivity = 41352/(HPBW^2);
fprintf('dirctivity = %f',dirctivity);
%---------------------
H = E/(120*pi);
figure()
polar(t,H)
title('H plain')
view([90 -90])

