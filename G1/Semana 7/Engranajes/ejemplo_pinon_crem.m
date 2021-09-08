clc
clear
close all

%parametros
R=0.01;
K=100;
B1=450;
B2=200;
J=0.1;
M=0.3;

A=[0 1 0 0;
   -K/J -B1/J K/(R*J) 0;
   0 0 0 1;
   K/(R*M) 0 -K/(R^2*M) -B2/M];
B=[0 1/J 0 0]';
C=[0 0 1 0];
D=zeros(1,1);
sis=ss(A,B,C,D);
step(sis)