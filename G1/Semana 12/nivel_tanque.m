%-----------Animacion de llenado de tanque---------

clear
close all
clc

%Parametros del tanque
R=2;
C=150;
sis=tf(R,[R*C 1]); %H(s)/Qi(s)
sis2=tf(1,[R*C 1]); %Qo(s)/Qi(s)
step(sis2)
ylabel('q_o(m^3/s)');
xlabel('Tiempo (s)');
title('Caudal de salida')

[y t]=step(sis);
figure
plot(t,y)
ylabel('h(m)');
xlabel('Tiempo (s)');
title('Nivel de altura del l�quido almacenado')
pause(1)

%Tanque animaci�n
figure
l=length(y);

%Creaci�n del tanque
x1=[0 0];
y1=[0 y(end)+1];
x2=[0 C];
y2=[0 0];
x3=[C C];
y3=[0 y(end)+1];


v=7;
if v==1
    x=[0 C C 0]; %para el fill
    line(x1,y1,'Color','black','LineWidth',2)
    hold on
    line(x2,y2,'Color','black','LineWidth',2)
    line(x3,y3,'Color','black','LineWidth',2)
else
    x=linspace(0,C,l); %para el area
end
%Llenado de tanque
for i=1:l
    if v==1
        nively=[0 0 y(i) y(i)]; %para el fill
        fill(x,nively,'b')
        hold on
        ylim([0 y(end)+1.5])
        pause(0.05)
    else
        nively=y(i)*ones(1,l); %Para el area
        area(x,nively,'FaceColor','g','FaceAlpha',.6,'EdgeAlpha',0)
        hold on
        %Para el area
        line(x1,y1,'Color','black','LineWidth',2)
        line(x2,y2,'Color','black','LineWidth',2)
        line(x3,y3,'Color','black','LineWidth',2)
        hold off
        %Para el area
        
        ylim([0 y(end)+1.5])
        pause(0.05)
    end
    
end