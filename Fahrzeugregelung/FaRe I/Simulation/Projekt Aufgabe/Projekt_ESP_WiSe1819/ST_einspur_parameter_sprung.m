%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Technische Universität Berlin
% Fakultät Verkehrs-  und Maschinensystem 
% Fachgbiet Kraffahrzeuge
% M.Sc. Thang Nguyen
% 
% Fahrzeugregelung: Projekt - ESP WS18/19
% File: Parameter Lenkewinkelsprung
% Datum: 19.12.2018
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Parameterdatei des Einspurmodells
% Vor dem Starten des Simulinkmodells bitte laden
disp(' ');
disp('Parameter im Workspace werden geloescht')
clear all;
clc;

% Simulationswerte
SIM_time = 25;
% -------------------------------------------------------------
% Anfangswerte
% -------------------------------------------------------------
init_v0 = 40/3.6;        % Startgeschwindigkeit [m/s]
len_wahl = 3;           % Auswahl Fahrmanöver: 1..Konstanter Lenkwinkel, 2 = Dauersinus, 3 = Rampe auf delta_lr, 4 = Step
delta_lr = 90;          % Lenkradwinkel
step_time = 3;          % Lenkwinkelsprung Start
sin_freq = pi/2;        % Frequenz Sinusfahrt in rad/s]
fah_dkv = 0.6;          % Gaspedalstellung
fah_dkv2 = 0;           % Gaspedalstellung 2


% Fahrzeugparameter
% -------------------------------------------------------------
ST_einspur_parameter;


% ohne ESP

sw_ESP = 0;
sim('WW_ST_ESP_ESM_2016a.slx')
psi_p_ohne = psi_p;
pos_x_ohne = pos_x;
pos_y_ohne = pos_y;
v_ohne = v;
beta_ohne = beta;
delta_Mz_ohne = delta_Mz;

% mit ESP

sw_ESP = 1;
sim('WW_ST_ESP_ESM_2016a.slx')
psi_p_mit = psi_p;
pos_x_mit = pos_x;
pos_y_mit = pos_y;
v_mit = v;
beta_mit = beta;
delta_Mz_mit = delta_Mz;

figure(1)
plot(time,psi_p_ohne,'k',time,psi_p_mit,'r','LineWidth',1.2)
grid on
xlabel('Zeit [s]')
ylabel('Gierrate [rad/s]')
title('Vergleich der Gierrate beim Sprunglenken')
legend('ohne ESP','mit ESP')
print('Gierrate Spr','-dpng')

figure(2)
plot(time,v_ohne,'k',time,v_mit,'r','LineWidth',1.2)
grid on
xlabel('Zeit [s]')
ylabel('Geschwindigkeit [km/h]')
title('Vergleich der Geschwindigkeit beim Sprunglenken')
legend('ohne ESP','mit ESP')
print('v Spr','-dpng')

figure(3)
plot(time,beta_ohne,'k',time,beta_mit,'r','LineWidth',1.2)
grid on
xlabel('Zeit [s]')
ylabel('Schwimmwinkel [rad]')
title('Vergleich des Schwimmwinkels beim Sprunglenken')
legend('ohne ESP','mit ESP')
print('beta Spr','-dpng')

figure(4)
plot(pos_x_ohne,pos_y_ohne,'k',pos_x_mit,pos_y_mit,'r','LineWidth',1.2)
grid on
xlabel('Position X [m]')
ylabel('Position Y [m]')
title('Vergleich der Fahrzeugposition beim Sprunglenken')
legend('ohne ESP','mit ESP')
print('Position Spr','-dpng')

figure(5)
plot(time,delta_Mz_ohne,'k',time,delta_Mz_mit,'r','LineWidth',1.2)
grid on
xlabel('Zeit [s]')
ylabel('{\Delta}Mz [Nm]')
title('Vergleich der Giermomentaenderung {\Delta}Mz')
legend('ohne ESP','mit ESP')
print('delta_Mz Spr','-dpng')
% legend('ohne ESP','mit ESP')