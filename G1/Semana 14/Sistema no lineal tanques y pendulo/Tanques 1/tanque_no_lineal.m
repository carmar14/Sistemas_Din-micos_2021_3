function dhp=tanque_linealizado(t,X)

global q Q k A

q1=Q+q; %Entrada del sistema

h1=X(1); %Estados del sistema
h2=X(2);

% q12=k*sqrt(abs(h1-h2));
q12=k*sqrt(h1-h2);
qo=k*sqrt(h2);
h1p=(q1-q12)/A;
h2p=(q12-qo)/A;

dhp=[h1p;h2p]; %Sistema dinamico no lineal
