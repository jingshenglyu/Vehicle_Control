clear;
clc;

%% RLC-Schwingkreis

R = 100;
L = 100;
C = 10;

sim('Uebung22.slx')

plot(t,u_t,t,udiff_t)
legend('u-t','udiff-t')
xlabel('Zeit [s]')
ylabel('Spannung')