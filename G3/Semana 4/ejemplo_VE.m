clc
clear
close all

A = [0 1 0 0;
    0 0 1 0;
    0 0 0 1;
    -144 -49 -19 -4];

B = [0;0;0;1];

C = [1 0 0 0];

D = 0;

h = ss(A,B,C,D);

hs = tf(1,[1 4 19 49 144]);

pzmap(h)
hold on
pzmap(hs)

figure
step(h)
hold on
step(hs,'.r');

[num den] = ss2tf(A,B,C,D)
[A B C D] = tf2ss(1,[1 4 19 49 144])

ss2 = ss(A,B,C,D)
step(ss2,'--k')

legend('State space', 'Transfer function', 'ss2')

