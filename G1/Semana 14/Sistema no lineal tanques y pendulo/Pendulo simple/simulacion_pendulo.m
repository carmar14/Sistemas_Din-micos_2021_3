clc
clear
close all

global Xe
Xe=[0 0];
Xini=[0.8 0];%0.9*Xe; %Condiciones iniciales del no lineal 15°->0.261799
Xinil=Xini-Xe; %Condiciones iniciales del lineal
t=linspace(0,4,200);
[t,y]=ode45(@pendulo_simple,t,Xini);
[m n]=size(y);
[t,y1]=ode45(@pendulo_simple_lineal,t,Xinil);

%error cuadratico medio

e1=(1/m)*sum((y(:,1)+Xe(1,1)-y1(:,1)).^2);

e2=(1/m)*sum((y(:,2)+Xe(1,2)-y1(:,2)).^2);

for i=1:n
    subplot(n,1,i)
    plot(t,y(:,i),t,y1(:,i)+Xe(1,i))
    if i==1
        ylabel("\theta");
    else
        ylabel("\omega");
    end
    xlabel('Tiempo (s)');
    legend('Sistema linealizado','Sistema no lineal')
end

function dXdt=pendulo_simple_lineal(t,X)  %
global Xe
%Parametros del sistema
m=5;
g=9.8;
l=1;
x1e=Xe(1,1);%0.01;

%x1=X(1), x2=X(2)

dXdt=[X(2);(-g/l)*cos(x1e)*X(1)];
%     dXdt=[X(2);(f-k*X(1)-c*X(2))/m];

end