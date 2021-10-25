function dhpl=tanque_linealizado2(t,X)
global Aj Bj q
h=X; %Vector de estados linealizados

dhpl=Aj*h+Bj*q;
% dhpl=dhpl+[h1e;h2e];

