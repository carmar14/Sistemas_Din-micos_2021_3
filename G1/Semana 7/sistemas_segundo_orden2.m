clear
close all
clc
%Sistema sobre amortiguado
e=1.1:1:9; %Diferentes valores de e>1  
wn=2;
k=1;

%usando el comando step---Respuesta al escalon del sistema
for i=length(e):-1:1 %for para encontrar cada una de las funciones de trasnferencia asociadas a ?
  H=tf(k*wn^2,[1 2*e(i)*wn wn^2]);%Funcion de transferencia del sistema
  step(H)
  hold on
end

legend('\zeta=1.1','\zeta=2.1','\zeta=3.1','\zeta=4.1','\zeta=5.1','\zeta=6.1','\zeta=7.1','\zeta=8.1')
title('Respuesta al escalón, Caso 1: \zeta>1, \omega_{n}=2')
grid on
 
%Respuesta al escalon usando la expresion encontrada en (5)
A=k;
t=0:0.01:80;
figure
for i=1:length(e) %for para encontrar cada una de los polinomios caracteristicos asociadas a ?
  H=tf(k*wn^2,[1 2*e(i)*wn wn^2]);%Funcion de transferencia del sistema
  [p z]=pzmap(H); %Polos y ceros del sistema
  s1=max(p);
  s2=min(p);
  B=k*s2/(s1-s2);
  C=k*s1/(s2-s1);
  y=A+B*exp(s1*t)+C*exp(s2*t);
  plot(t,y)
  hold on
end

legend('\zeta=1.1','\zeta=2.1','\zeta=3.1','\zeta=4.1','\zeta=5.1','\zeta=6.1','\zeta=7.1','\zeta=8.1')
title('Respuesta al escalón usando la expresión (5), Caso 1: \zeta>1, \omega_{n}=2')
grid on

 
% %Sistema criticamente amortiguado
e=1;
wn=1.1:1:9; 
k=1;
figure
%usando el comando step---Respuesta al escalon del sistema
for i=length(wn):-1:1 %for para encontrar cada una de las funciones de trasnferencia asociadas a ?
  H=tf(k*wn(i)^2,[1 2*e*wn(i) wn(i)^2]);%Funcion de transferencia del sistema
  step(H)
  hold on
end

legend('\omega_{n}=1.1','\omega_{n}=2.1','\omega_{n}=3.1','\omega_{n}=4.1','\omega_{n}=5.1','\omega_{n}=6.1','\omega_{n}=7.1','\omega_{n}=8.1')
title('Respuesta al escalón, Caso 2: \zeta=1, 1.1<\omega_{n}<8.1')
grid on
 
%Respuesta al escalon usando la expresion encontrada en (8)
A=k;
t=0:0.01:10;
figure
for i=1:length(wn) %for para encontrar cada una de los polinomios caracteristicos asociadas a ?
  H=tf(k*wn(i)^2,[1 2*wn(i) wn(i)^2]);%Funcion de transferencia del sistema
  [p z]=pzmap(H); %Polos y ceros del sistema
  s1=max(p);
  s2=min(p);
  B=-k;
  C=-k*wn(i);
  y=A+B*exp(s1*t)+C*t.*exp(s2*t);
  plot(t,y)
  hold on
end

legend('\omega_{n}=1.1','\omega_{n}=2.1','\omega_{n}=3.1','\omega_{n}=4.1','\omega_{n}=5.1','\omega_{n}=6.1','\omega_{n}=7.1','\omega_{n}=8.1')
title('Respuesta al escalón (8), Caso 2: \zeta=1, 1.1<\omega_{n}<8.1')
grid on

% %Sistema subamortiguado
figure
e=0.1:0.1:0.9; %Diferentes valores de 0<e<1 
wn=2;
k=1;

%usando el comando step---Respuesta al escalon del sistema
for i=length(e):-1:1 %for para encontrar cada una de las funciones de trasnferencia asociadas a ?
  H=tf(k*wn^2,[1 2*e(i)*wn wn^2]);%Funcion de transferencia del sistema
  step(H)
  hold on
end

legend('\zeta=0.1','\zeta=0.2','\zeta=0.3','\zeta=0.4','\zeta=0.5','\zeta=0.6','\zeta=0.7','\zeta=0.8','\zeta=0.9')
title('Respuesta al escalón, Caso 3: 0<\zeta<1, \omega_{n}=2')
grid on
 
%Respuesta al escalon usando la expresion encontrada en (12)
A=k;
t=0:0.01:30;
figure
for i=1:length(e) %for para encontrar cada una de los polinomios caracteristicos asociadas a ?
  H=tf(k*wn^2,[1 2*e(i)*wn wn^2]);%Funcion de transferencia del sistema
  [p z]=pzmap(H); %Polos y ceros del sistema
  s1=max(p);
  s2=min(p);
  B=k*s2/(s1-s2);
  C=k*s1/(s2-s1);
  y=A+B*exp(s1*t)+C*exp(s2*t);
  plot(t,y)
  hold on
end

legend('\zeta=0.1','\zeta=0.2','\zeta=0.3','\zeta=0.4','\zeta=0.5','\zeta=0.6','\zeta=0.7','\zeta=0.8','\zeta=0.9')
title('Respuesta al escalón (12), Caso 3: 0<\zeta<1, \omega_{n}=2')

%Respuesta al escalon usando la expresion encontrada en (13)
A=k;
t=0:0.01:30;
figure
for i=1:length(e) %for para encontrar cada una de los polinomios caracteristicos asociadas a ?
  H=tf(k*wn^2,[1 2*e(i)*wn wn^2]);%Funcion de transferencia del sistema
  [p z]=pzmap(H); %Polos y ceros del sistema
  s1=max(p);
  s2=min(p);
  sigma=abs(real(s1));
  wd=abs(imag(s1));
  tetha=acos(e(i));
  y=k*(1-exp(-sigma*t)/(sqrt(1-e(i)^2)).*(sin(wd*t+tetha)));
  plot(t,y)
  hold on
end

legend('\zeta=0.1','\zeta=0.2','\zeta=0.3','\zeta=0.4','\zeta=0.5','\zeta=0.6','\zeta=0.7','\zeta=0.8','\zeta=0.9')
title('Respuesta al escalón (13), Caso 3: 0<\zeta<1, \omega_{n}=2')

%Sistema marginalmente estable
figure
e=0; 
wn=2;
k=1;

%usando el comando step---Respuesta al escalon del sistema

H=tf(k*wn^2,[1 2*e*wn wn^2]);%Funcion de transferencia del sistema
step(H)
title('Respuesta al escalón, Caso 4: \zeta=0, \omega_{n}=2')
xlim([0 30])
hold on
grid on
 
%Respuesta al escalon usando la expresion encontrada en (16)
A=k;
t=0:0.01:30;
[p z]=pzmap(H); %Polos y ceros del sistema
s1=max(p);
s2=min(p);
B=k*s2/(s1-s2);
C=k*s1/(s2-s1);
y=A+B*exp(s1*t)+C*exp(s2*t); 
plot(t,y,'or')

%Respuesta al escalon usando la expresion encontrada en (17)
y=k*(1-cos(wn*t)); 
plot(t,y,'--g')
legend('Step','16','17')

