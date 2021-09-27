clc
clear
close all


%[q1p,q1pp,q2p]'-->[q1,q1p,q2]'
[t,y] = ode45(@sis_ele,[0 20],[0;0;0]);

plot(t,y(:,1))
ylabel('q1 (C)')
xlabel('t(seg)')

figure
plot(t,y(:,2))
ylabel('dq1/dt (A)')
xlabel('t(seg)')
figure
plot(t,y(:,3))
ylabel('q2 (C)')
xlabel('t(seg)')

function yp = sis_ele(t,y)
%-----parametros del sistema
%[x1,x2,x3]'
%%[x1p,x2p,x3p]'
L=1e-3;
C1=10e-6;
C2=100e-6;
R=10e3;

v=5;

x1=y(1);
x2=y(2);
x3=y(3);
x1p=x2;
x2p=(v-1/C1*(x1-x3))/L;
x3p=((x1-x3)/C1-x3/C2)/R;
yp=[x1p;x2p;x3p];
end





