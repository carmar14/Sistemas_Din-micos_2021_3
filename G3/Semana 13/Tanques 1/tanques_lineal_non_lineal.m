clear
close all
clc

global Aj Bj q Q k A
%Parametros del sistema
A=10;
g=9.8;
As=1;
k=As*sqrt(2*g);
Q=2; %Entrada de equilibrio %Para Q=20 requiere mas tiempo
q=0.01; % entrada del sistema lineal

%Matrices Jacobianas
syms h1 h2 q1
% q12=k*sqrt(abs(h1-h2));
% q2=k*sqrt(h2);
q12=k*sqrt(h1-h2);
q2=k*sqrt(h2);
h1p=(q1-q12)/A;
h2p=(q12-q2)/A;
hp=[h1p;h2p]; %Sistema dinamico no lineal

Aj=jacobian(hp,[h1 h2]);
Bj=jacobian(hp,[q1]);

%Punto de operacion
h2e=(Q/k)^2;
h1e=2*h2e;

Aj=subs(Aj,[h1 h2 q1],[h1e h2e Q]);
Aj=double(Aj);

Bj=subs(Bj,[h1 h2 q1],[h1e h2e Q]);
Bj=double(Bj);

t=linspace(0,80,5000); %Q=2
% t=linspace(0,800,5000); %Q=20
Xe=[h1e h2e]; %punto de equilibrio del sistema 
X0=1.1*Xe; %Condicion inicial del sistema no lineal debe estar cerca del punto de equilibrio

Xini=X0-Xe; %condicion inicial del sistema lineal

[t,y]=ode45(@tanque_linealizado2,t,Xini); %sistema linealizado
[m n]=size(y);


[t,y1]=ode45(@tanque_no_lineal,t,X0); %sistema no lineal

for i=1:n
    subplot(n,1,i)
    plot(t,y(:,i)+Xe(1,i),t,y1(:,i))
    ylabel("h"+i+"(m)");
    xlabel('Tiempo (s)');
    legend('Sistema linealizado','Sistema no lineal')
end

figure
for i=1:n
    subplot(n,1,i)
    plot(t,abs(y(:,i)+Xe(1,i)-y1(:,i)))
    ylabel("\Delta h"+i+"(m)");
    xlabel('Tiempo (s)');
    legend('Error absoluto')
end

%error cuadratico medio

e1=(1/m)*sum((y(:,1)+Xe(1,1)-y1(:,1)).^2);

e2=(1/m)*sum((y(:,2)+Xe(1,2)-y1(:,2)).^2);








