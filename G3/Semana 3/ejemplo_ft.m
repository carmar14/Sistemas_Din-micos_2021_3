clc
close all
clear 

num = 2;
den = [1 4 8];
h = tf(num,den);

pzmap(h)
[p z]= pzmap(h)