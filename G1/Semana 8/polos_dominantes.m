clc
clear
close all
k=1;
wn=1;
e=.5;
h=tf(k*wn^2,[1 2*e*wn wn^2];

pzmap(h)
