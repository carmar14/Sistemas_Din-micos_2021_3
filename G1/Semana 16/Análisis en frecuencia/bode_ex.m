clc
close all
clear

%--------ganancia------
K1=tf(1.1,1);
K2=tf(-1.1,1);
K3=tf(1,1);
K4=tf(-1,1);
K5=tf(0.2,1);
K6=tf(-0.2,1);

bode(K1,'k');
grid on
hold on
bode(K2,'-.r');
bode(K3,'b');
bode(K4,'--k');
bode(K5,'--r');
bode(K6,'--b');


h=tf([1 0 0],1);
figure
bode(h)
grid on

h=tf(1,[1 0 0 0 0]);
figure
bode(h)
grid on

