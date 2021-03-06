%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Technische Universit?t Berlin
% Fakult?t Verkehrs-  und Maschinensystem 
% Fachgbiet Kraffahrzeuge
% M.Sc. Osama Al-Saidi
% 
% Fahrzeugregelung: Projekt - ESP WS16/17
% File: Parameter Lenkewinkelsprung
% Datum: 28.12.2016
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Parameterdatei des Einspurmodells
% Vor dem Starten des Simulinkmodells bitte laden
disp(' ');
disp('Parameter im Workspace werden gel?scht')
% clear all;


% Simulationswerte
SIM_time = 25;
% -------------------------------------------------------------
% Anfangswerte
% -------------------------------------------------------------
init_v0 = 40/3.6;        % Startgeschwindigkeit [m/s]
len_wahl = 3;           % Auswahl Fahrman?ver: 1..Konstanter Lenkwinkel, 2 = Dauersinus, 3 = Rampe auf delta_lr, 4 = Step
delta_lr = 90;          % Lenkradwinkel
step_time = 3;          % Lenkwinkelsprung Start
sin_freq = pi/2;        % Frequenz Sinusfahrt in rad/s]
fah_dkv = 0.6;          % Gaspedalstellung
fah_dkv2 = 0;           % Gaspedalstellung 2

% Fahrzeugparameter
% -------------------------------------------------------------
ST_einspur_parameter;