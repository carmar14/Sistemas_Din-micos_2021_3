clc
clear
close all

K=1;

tau = [0.5 1 1.5]; %[tau2 tau1 tau3]

%subplot(3,1,1)
for i=1:length(tau)
    h(i)=tf(K,[tau(i) 1]);
    subplot(3,1,i)
    step(h(i))    
end

figure
pzmap(h(1),'r')
hold on
pzmap(h(2),'k')
pzmap(h(3),'b')
legend('\tau2','\tau1','\tau3')

tau = 4;
k=[-3 -1 -0.5 0.5 1 3];
figure
for i=1:length(k)
    H=tf(k(i),[tau 1]);    
    step(-3*H)
    hold on
end

legend('k=-3','k=-1','k=-0.5','k=0.5','k=1','k=3')

% 9, 3, 1.5, -1.5, -3, -9


k=2.3;
tau=1.2;
h= tf(k,[tau 1]);
figure
impulse(h)% h(t)=(k/tau) e^(-t/tau)



    