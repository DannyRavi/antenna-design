clc
clear
%for 10Ghz frequency, we assume that Lambda/2 =0.012 and width<<(Lambda/2) or
%width <= (Lambda/100)
c = 3e8;
freq = 10e9;
Lambda = c/freq;
Lambda10th = Lambda/10;
width = Lambda/100;
disp(width)
c = loopCircular('Radius',Lambda10th,'Thickness',width);
figure;
pattern(c, freq);
figure;
pattern(c, freq, 0, 0:1:360);
P = polarpattern('gco');
P.AntennaMetrics = 1;