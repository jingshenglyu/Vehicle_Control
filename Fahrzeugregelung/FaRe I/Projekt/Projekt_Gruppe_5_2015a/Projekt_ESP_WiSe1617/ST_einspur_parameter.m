%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Technische Universität Berlin
% Fakultät Verkehrs-  und Maschinensystem 
% Fachgbiet Kraffahrzeuge
% M.Sc. Osama Al-Saidi
% 
% Fahrzeugregelung: Projekt - ESP WS16/17
% File: Parameter Einspurmodell  
% Datum: 28.12.2016
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Parameterdatei des Einspurmodells
% Vor dem Starten des Simulinkmodells bitte laden
% disp(' ');
% disp('Parameter im Workspace werden gelöscht')
% clear all;

% Bestimmen des aktuellen Pfades
global verzeichnis;
verzeichnis = pwd;

% Setzen aller benötigten Pfade
addpath(genpath(verzeichnis));


% Simulationswerte
% -------------------------------------------------------------
stepsize = 1e-3;         % Rechenschrittweite in [s]
%SIM_time = 25;           % Simulationszeit [s]

g = 9.81;                % Erdbeschleunigung [m/s^2]

% Fahrzeugparameter
% -------------------------------------------------------------
fzg_m = 1700;           % Fahrzeuggesamtmasse [kg]
fzg_Jz = 3489;          % Trägheitsmoment Gesamtfahrzeug z-Achse [kgm^2]
fzg_l = 2.758;          % Achsabstand [m]
fzg_lv = 1.6;           % Abstand Schwerpunkt-Vorderachse [m]
fzg_lh = fzg_l-fzg_lv;  % Abstand Schwerpunkt-Hinterachse [m]
fzg_s = 1.7;            % Spurweite des Fahrzeugs [m]
h_sp = 0.56;            % Schwerpunktshöhe [m]
i_lenk = 18;            % Übersetzung Rad -> Lenkrad
s_dp = 0;
auf_nk_v = 0.02798;     % Konstruktiver Reifennachlauf vorne [m]  
auf_nk_h = 0;           % Konstruktiver Reifennachlauf hinten [m]
c_alpha = 140000;       % Schräglaufbeiwert [N/rad]
% mue = 1.1;            % Haftbeiwert
Fzeta0 = 7000;          % Normierte Radaufstandskraft
mue_h = 1.0;            % Haftreibwert Reifen-Straße
mue_v = 1.0;            % Haftreibwert Reifen-Straße
pac_Fz0 = 7000;         % [N] Nominale Radlast
pac_kFz = 0.1;          % [-] Degressivitätsfaktor des Reifens
d_rad = 5e-2;           % Parameter viskose Reibung Radlager

% Reifenparameter
% -------------------------------------------------------------
rad_r = 0.31;           % Reifenradius [m]
rad_J_v = 2.2397;       % Trägheitsmoment Reifen y-Achse [kgm^2] ... für 2 Räder!
rad_J_h = 2.2397;       % Trägheitsmoment Reifen y-Achse [kgm^2] ... für 2 Räder!
pac_Bv = 12;            % Reifenparameter vl (Pacejka)
pac_Bh = 12;            % Reifenparameter vr (Pacejka)
pac_Cv = 1.65;          % Reifenparameter vr (Pacejka)
pac_Ch = 1.65;          % Reifenparameter vr (Pacejka)
rad_nr_max = 0.03;      % Maximaler Reifennachlauf

% Antriebs- und Bremsparameter
% -------------------------------------------------------------
p_max = 110000;         % Maximale Leistung [W]
omega_max = 630;        % Maximale Drehzal [rad/s]
i_getr = 4.2;           % Getriebeübersetzung 1. Gang
i_diff = 3.5;           % Differentialübersetzung
brems_k_max = 25000;    % Bremsverstärkung

% Umweltparameter
% -------------------------------------------------------------
A = 2.26;               % Querspantfläche [m^2]
cw = 0.32;              % Luftwiderstandsbeiwert [-]
rho = 1.226;            % Luftdichte [kg/m^3]


% Reglerparameter
% -------------------------------------------------------------
Mz_threshold = 0; %[Nm]
Kp_Mz = 0;
Ki_Mz = 0;
Kd_Mz = 0;
Kp_beta = 0;

ESP_v_max = 0; % Maximale Fahrzeuggeschwindigkeit



disp('Parameter für Einspurmodell wurden geladen')
disp(' ')

% 
% % Test: Pacejka Kurve:
% s_v = 0:0.01:1;
% Fx = mue_v*Fzeta0*sin(pac_Cv*atan(pac_Bv.*s_v/mue_v));
% plot(s_v,Fx);
% hold on