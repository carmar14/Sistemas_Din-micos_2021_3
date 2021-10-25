clear
close all
clc

ue=1;
h1e=ue^2;
h2e=h1e;  %Ejemplo 1

% ue=sqrt(h1e);

%Matriz A jacobiana
A=[(-0.5*h1e^(-0.5)*h1e^2-2*h1e*(ue-sqrt(h1e)))/h1e^4               0;
    0.5*h1e^(-0.5)                                          -0.5*h2e^(-0.5)];
%Matriz B jacobiana
B=[1/h1e^2 ; 0];
%Matriz C jacobiana
C=[0 1];
%Matriz D jacobiana
D=[0];

%Sistema Linealizado en espacio de estado
sis=ss(A,B,C,D);

%Funcion de transferencia
[num den]=ss2tf(A,B,C,D);
sisft=tf(num,den);

%Respuesta al escalon (magnitud cercana a ue);
u=0.001;
[y t]=step(u*sis);
Tsim=t(end);
step(u*sis,'-k')
hold on
step(u*sisft,'--r')
legend('State Space', 'Transfer Function')
grid on

figure
pzmap(sis)
grid on

% close all