clc
close all
clear

%parametros del sistema
R1=4;
R2=7;
CT=9;
%entradas del sistema
qi=0.05; %u1
Ta=32; %u2
T2=26; %u3

%dinamica del sistema
A=-(1/R1+1/R2)/CT;
B=[qi Ta/R1 T2/R2]/CT;
C=1;
D=0;
sis=ss(A,B,C,D);

step(sis);
[y t]=step(sis);
figure
subplot(2,3,1)
plot(t,y(:,1,1))
xlim([0 t(end)])
grid on
xlabel('Tiempo(s)')
ylabel('Temperatura en el cuarto (°C)')
title('Temperatura bajo el estímulo q_i')

subplot(2,3,2)
plot(t,y(:,1,2))
grid on
xlim([0 t(end)])
xlabel('Tiempo(s)')
ylabel('Temperatura en el cuarto (°C)')
title('Temperatura bajo el estímulo T_a')

subplot(2,3,3)
plot(t,y(:,1,3))
grid on
xlim([0 t(end)])
xlabel('Tiempo(s)')
ylabel('Temperatura en el cuarto (°C)')
title('Temperatura bajo el estímulo T_2')

subplot(2,3,[4 6])
plot(t,y(:,1,1)+y(:,1,2)+y(:,1,3))
grid on
xlim([0 t(end)])
xlabel('Tiempo(s)')
ylabel('Temperatura en el cuarto (°C)')
title('Temperatura total en el cuarto')
