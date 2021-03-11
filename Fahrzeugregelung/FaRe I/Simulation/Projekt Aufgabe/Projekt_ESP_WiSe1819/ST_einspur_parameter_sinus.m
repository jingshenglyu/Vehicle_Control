%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Technische Universität Berlin
% Fakultät Verkehrs-  und Maschinensystem 
% Fachgbiet Kraffahrzeuge
% M.Sc. Thang Nguyen
% 
% Fahrzeugregelung: Projekt - ESP WS18/19
% File: Parameter Sinusfahrt  
% Datum: 19.12.2018
%
% Gruppe  10
% Jingsheng Lyu: 398756
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



% Parameterdatei des Einspurmodells
% Vor dem Starten des Simulinkmodells bitte laden
disp(' ');
disp('Parameter im Workspace werden geloescht')
clear all;
clc;

% Simulationswerte
SIM_time = 10;
% -------------------------------------------------------------
% Anfangswerte
% -------------------------------------------------------------
init_v0 =50/3.6;        % Startgeschwindigkeit [m/s]
len_wahl = 2;           % Auswahl Fahrmanoever: 1..Konstanter Lenkwinkel, 2 = Dauersinus, 3 = Rampe auf delta_lr, 4 = Step
delta_lr = 90;          % Lenkradwinkel[grad]
step_time = 1;          % Lenkwinkelsprung Start
sin_freq = pi/3;        % Frequenz Sinusfahrt in [rad/s]
fah_dkv = 0.2;          % Gaspedalstellung
fah_dkv2 = 0;           % Gaspedalstellung 2

% Fahrzeugparameter
% -------------------------------------------------------------
ST_einspur_parameter;

%%
sw_ESP = 0; % ohne ESP
sim('WW_ST_ESP_ESM_2016a.slx')

figure(1)
plot(time,psi_p)
grid on
xlabel('Zeit [s]')
ylabel('Gierrate [rad/s]')
title('Gierrate bei Sinusfahrt')

figure(2)
plot(pos_x,pos_y)
grid on
xlabel('x [m]')
ylabel('y [m]')
title('Position bei Sinusfahrt')

figure(3)
plot(time,beta)
grid on
xlabel('Zeit [s]')
ylabel('Schwimmwinkel [rad]')
title('Schwimmwinkel bei Sinusfahrt')

%% Aufgabe 4

%% Sinuslenken

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
sim('ST_ESP_ESM_2016a.slx')
psi_p_mit = psi_p;
pos_x_mit = pos_x;
pos_y_mit = pos_y;
v_mit = v;
beta_mit = beta;
delta_Mz_mit = delta_Mz;

figure(4)
plot(time,psi_p_ohne,'k',time,psi_p_mit,'r','LineWidth',1.2)
grid on
xlabel('Zeit [s]')
ylabel('Gierrate [rad/s]')
title('Vergleich der Gierrate beim Sinuslenken')
legend('ohne ESP','mit ESP')
print('Gierrate sin','-dpng')

figure(5)
plot(time,v_ohne,'k',time,v_mit,'r','LineWidth',1.2)
grid on
xlabel('Zeit [s]')
ylabel('Geschwindigkeit [km/h]')
title('Vergleich der Geschwindigkeit beim Sinuslenken')
legend('ohne ESP','mit ESP')
print('v sin','-dpng')

figure(6)
plot(time,beta_ohne,'k',time,beta_mit,'r','LineWidth',1.2)
grid on
xlabel('Zeit [s]')
ylabel('Schwimmwinkel [rad]')
title('Vergleich des Schwimmwinkels beim Sinuslenken')
legend('ohne ESP','mit ESP')
print('beta sin','-dpng')

figure(7)
plot(pos_x_ohne,pos_y_ohne,'k',pos_x_mit,pos_y_mit,'r','LineWidth',1.2)
grid on
xlabel('Position X [m]')
ylabel('Position Y [m]')
title('Vergleich der Fahrzeugposition beim Sinuslenken')
legend('ohne ESP','mit ESP')
print('Position sin','-dpng')

figure(8)
plot(time,delta_Mz_ohne,'k',time,delta_Mz_mit,'r','LineWidth',1.2)
grid on
xlabel('Zeit [s]')
ylabel('{\Delta}Mz [Nm]')
title('Vergleich der Giermomentaenderung {\Delta}Mz')
legend('ohne ESP','mit ESP')
print('delta_Mz sin','-dpng')



