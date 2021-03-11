clear;
clc;

%% Modellerstellung

c = 500;
d = 5;
m = 10;
g = 9.81;

sim('Uebung11.slx')

figure
plot(t,y_t,t,ydiff_t)
% xlim([0,0.2])
legend('y-t','ydiff-t')
xlabel('Zeit [s]')
ylabel('Abstand')

