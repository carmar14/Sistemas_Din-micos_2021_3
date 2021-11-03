clc
clear
close all

%Ganancia
ft=tf(5);
bode(ft)
grid on
%Derivador puro
figure
ft=tf([1 0 0],1); %H(s)=s^2
bode(ft)
grid on

%Integrador puro
figure
ft=tf(1,[1 0 0 0]); %H(s)=1/s^3
bode(ft)
grid on

%Ceros reales
figure
ft=tf([1 2],2); %H(s)=(s+2)/2
bode(ft)
grid on

%Polos reales
figure
ft=tf(3,[1 3]);%H(s)=3/(s+3)
bode(ft)
grid on

%Polos conjugados
figure
e=0.1:0.1:0.9; %Diferentes valores de 0<e<1 
wn=2;


for i=1:length(e) %for para encontrar cada una de las funciones de trasnferencia asociadas a ?
  %H(s)=wn^2/(s+2*e*wn*s+wn^2)
    H=tf(wn^2,[1 2*e(i)*wn wn^2]);%Funcion de transferencia del sistema
  bode(H)
  hold on
end

legend('\zeta=0.1','\zeta=0.2','\zeta=0.3','\zeta=0.4','\zeta=0.5','\zeta=0.6','\zeta=0.7','\zeta=0.8','\zeta=0.9')
grid on

%Ceros conjugados
figure
e=0.1:0.1:0.9; %Diferentes valores de 0<e<1 
wn=2;


for i=1:length(e) %for para encontrar cada una de las funciones de trasnferencia asociadas a ?
  %H(s)=(s+2*e*wn*s+wn^2)/wn^2
  H=tf([1 2*e(i)*wn wn^2],wn^2);%Funcion de transferencia del sistema
  bode(H)
  hold on
end

legend('\zeta=0.1','\zeta=0.2','\zeta=0.3','\zeta=0.4','\zeta=0.5','\zeta=0.6','\zeta=0.7','\zeta=0.8','\zeta=0.9')
grid on

%Sistema de fase no minima
figure
ft1=tf([0.5 1],[1 1]);
bode(ft1)
hold on
grid on
ft=tf([-0.5 1],[1 1]);
bode(ft)
legend('SFM','SFNM')
figure
step(ft1)
hold on
grid on
step(ft)
legend('SFM','SFNM')

figure
ft=tf([1 -4],-4)
bode(ft)
hold on
grid on
ft=tf([1 4],4)
bode(ft)
legend('SFNM','SFM')


%Analisis de estabilidad en frecuencia
ft=8*tf([1 70],1)*tf(1,[1 0])*tf(1,[1 4])*tf(1,[1 25]);
ft2=5.6*tf([1 70],70)*tf(1,[1 0])*tf(4,[1 4])*tf(25,[1 25]);
figure
step(ft);
hold on
step(ft2);
[mg,mf,wmg,wmf] = margin (ft.numerator,ft.denominator);
figure
margin(ft.numerator,ft.denominator);
grid on
figure
step(feedback(ft,1))

%Analisis de estabilidad bucle abierto k*1/(s(s+1)^2)
figure
k=[0.1 2 10];
for i=1:length(k)
    subplot(1,3,i)
    sys=k(i)*tf(1,[1 0])*tf(1,[1 2 1]);
    margin(sys.numerator,sys.denominator);
    hold on
    grid on
    if i==1
        legend('k=0.1')
    elseif i==2
        legend('k=2')
    else
        legend('k=10')
    end
end

figure
for i=1:length(k)
    subplot(1,3,i)
    sys=k(i)*tf(1,[1 0])*tf(1,[1 2 1]);
    step(feedback(sys,1));
    grid on
    if i==1
        legend('k=0.1')
    elseif i==2
        legend('k=2')
    else
        legend('k=10')
    end
end




