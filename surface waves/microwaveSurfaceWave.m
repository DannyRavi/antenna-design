clc 
clear
er = 2; % optinal number
u0 = pi*4e-7;
freq = 150; %150 hz for k0 near pi/2
k0 = 2*pi*freq*sqrt(er*u0);
disp(k0);
r = (er-1)*k0;
f1 = @(x,y) (x).^2 + (y).^2 - (r^2);
fimplicit(f1,'r')
hold on
f2 = @(x,y) -x*cot(x)-(y);
fimplicit(f2,'g')
hold off
axis equal



