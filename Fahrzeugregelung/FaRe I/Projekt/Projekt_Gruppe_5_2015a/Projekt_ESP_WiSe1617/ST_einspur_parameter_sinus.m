%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Technische Universität Berlin
% Fakultät Verkehrs-  und Maschinensystem 
% Fachgbiet Kraffahrzeuge
% M.Sc. Osama Al-Saidi
% 
% Fahrzeugregelung: Projekt - ESP WS16/17
% File: Parameter Sinusfahrt  
% Datum: 28.12.2016
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



% Parameterdatei des Einspurmodells
% Vor dem Starten des Simulinkmodells bitte laden
disp(' ');
disp('Parameter im Workspace werden gelöscht')
% clear all;


% Simulationswerte
SIM_time = 10;
% -------------------------------------------------------------
% Anfangswerte
% -------------------------------------------------------------
init_v0 =50/3.6;        % Startgeschwindigkeit [m/s]
len_wahl = 2;           % Auswahl Fahrmanöver: 1..Konstanter Lenkwinkel, 2 = Dauersinus, 3 = Rampe auf delta_lr, 4 = Step
delta_lr = 90;          % Lenkradwinkel[°]
step_time = 1;          % Lenkwinkelsprung Start
sin_freq = pi/3;        % Frequenz Sinusfahrt in [rad/s]
fah_dkv = 0.2;          % Gaspedalstellung
fah_dkv2 = 0;           % Gaspedalstellung 2

% Fahrzeugparameter
% -------------------------------------------------------------
ST_einspur_parameter;


