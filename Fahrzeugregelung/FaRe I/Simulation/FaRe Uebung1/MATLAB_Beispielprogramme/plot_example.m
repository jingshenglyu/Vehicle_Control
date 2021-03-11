%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Technische Universität Berlin
% Fakultät Verkehrs-  und Maschinensystem 
% Fachgbiet Kraffahrzeuge
% M.Sc. Osama Al-Saidi
% 
% Fahrzeugregelung: Übung - Einführung in Matlab/Simulink
% Aufgabe: Plot
% Datum: 21.10.2014
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear
clc
% Plot 1
x=0:0.01:4*pi;
y=sin(x);
figure(1);
plot(x,y,'r*--');;
grid on;
xlabel('pi');
ylabel('y-Wert');
legend('Sinusschwingung');


% Plot 2
hold on
z=cos(x);
plot(x,z,'r')
grid on
legend('Sinusschwingung', 'Cosinusschwingung')

% Plot 3
figure(2);
phi=0:0.1:4*pi;
x=sin(phi);
y=cos(phi);
plot3(x,y,phi)

% Plot 4
x=-pi:0.1:pi;
y=-pi:0.1:pi;
[X,Y]=meshgrid (x,y);
Z=cos(Y).*sin(X);
figure(3); mesh(Z);
view(-40,30);

% Plot 5
figure(4);
surf(Z);
view(-40,30);
