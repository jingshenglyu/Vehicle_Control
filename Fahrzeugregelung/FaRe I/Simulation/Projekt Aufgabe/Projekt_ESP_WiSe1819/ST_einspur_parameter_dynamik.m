%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Technische Universität Berlin
% Fakultät Verkehrs-  und Maschinensystem 
% Fachgbiet Kraffahrzeuge
% M.Sc. Thang Nguyen
% 
% Fahrzeugregelung: Projekt - ESP WS18/19
% File: Parameter Geradeausfahrt
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
SIM_time = 10;
% -------------------------------------------------------------
% Anfangswerte
% -------------------------------------------------------------
init_v0 = 5/3.6;        % Startgeschwindigkeit [m/s]
len_wahl = 1;           % Auswahl Fahrmanöver: 1..Konstanter Lenkwinkel, 2 = Dauersinus, 3 = Rampe auf delta_lr, 4 = Step
delta_lr = 0;           % Lenkradwinkel
step_time = 1;          % Lenkwinkelsprung Start
sin_freq = pi/2;        % Frequenz Sinusfahrt in rad/s]
fah_dkv = 0.6;          % Gaspedalstellung
fah_dkv2 = 0;           % Gaspedalstellung 2

% Fahrzeugparameter
% -------------------------------------------------------------
ST_einspur_parameter;

%% 

sim('ST_ESP_ESM_2016a.slx')
S_v =-( 1 - rad_r*omega_v./v);
S_h =-( 1 - rad_r*omega_h./v);

figure(1)
plot(time,S_v,time,S_h)
grid on
xlabel('Zeit [s]')
ylabel('Schlupf [-]')
xlim([0 6])
ylim([-1 1])
legend('S_v','S_h')
title('Laengsschlupf an der Raedern bei Beschleunigung und Abbremsung')

figure(2)
plot(pos_x,pos_y)
grid on
xlabel('x [m]')
ylabel('y [m]')
legend('Pfad')
title('Fahrzeugposition ueber die Zeit')

figure(3)
plot(time,Fxv,time,Fxh)
grid on
xlabel('Zeit [s]')
xlim([0 6])
ylabel('Reifenlaengskraft [N]')
legend('Fxv','Fxh')
title('Reifenkraefte bei Laengsdynamik')


