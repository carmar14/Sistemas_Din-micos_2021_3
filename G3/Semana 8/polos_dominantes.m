clc
clear
close all
k=2.3;
wn=1;
e=.2;
h=tf(k*wn^2,[1 2*e*wn wn^2]);
tao=100;
ha=tf(1,[tao 1])*h;

pzmap(h,'k')
hold on
pzmap(ha,'r')
legend('SSO','SA')

figure
step(h,'k')
hold on
step(ha,'r')
%step(ha*tf(1,[1/8 1]),'g')
legend('SSO','SA')

k=1;
e=0.5; 
wn=4;
h2=tf(k*wn^2,[1 2*e*wn wn^2]);
h4=h2*h;
figure
step(h,'k')
hold on
step(h4,'r')
legend('SSO','SCO')

figure
pzmap(h)
hold on
pzmap(h4)

