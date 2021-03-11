clear;
clc;

%% Modellerstellung

c = 5000;
d = 0.01;
m = 10;

sim('Uebung11.slx')

plot(t,y_t,t,ydiff_t,'rg')
legend('y-t','ydiff-t')
xlabel('Zeit [s]')
ylabel('Abstand')