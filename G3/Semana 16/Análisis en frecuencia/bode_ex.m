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

h=tf([1 4],4);
figure
bode(h)
grid on

h=tf(10,[1 10]);
figure
bode(h)
grid on


wn=2;
e=0.1;
h=tf(wn^2,[1 2*e*wn wn^2]);
figure
bode(h)
grid on

h=tf([1 2*e*wn wn^2],wn^2);
figure
bode(h)
grid on

close all

K=3;
h1=tf(2,[1 2]);
h2=tf([1 8],8);
d=conv([1 5-2*i],[1 5+2*i]);
h3=tf(29,d);
h=K*h1*h2*h3;
figure
pzmap(h)
figure
bode(h)
grid on

