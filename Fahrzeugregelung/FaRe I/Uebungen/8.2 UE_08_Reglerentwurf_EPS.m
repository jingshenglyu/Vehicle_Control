%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Technische Universität Berlin
% Fakultät Verkehrs-  und Maschinensystem 
% Fachgbiet Kraffahrzeuge
%
% Fahrzeugmechatronik II: Übung 9
% Aufgabe : Regelung einer elektromechanischen Servolenkung (Reglerentwurf)
% M.Sc. Thang Nguyen
% Datum: 14.12.2018
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


 close all;
 clear all;
 clc;


%% Systemparameter
J_1    = 0.004;   % Massenträgheit Lenkrad, Lenksäule [kgm^2]
J_2    = 0.0982;  % Massenträgheit Ritzel, Zahnstange, Räder, Motor [kgm^2]
c_ds   = 90.00;   % Steifigkeit Drehstab [Nm/rad]
b_1    = 0.02;    % Reibung Lenkrad, Lenksäule [Nms/rad]
b_2    = 0.5;     % Reibung Ritzel, Zahnstange, Räder, Motor [Nms/rad]
tau    = 1e-3;    % Zeitkonstante Motor [s]
i_rori = 11.41;   % Übersetzung  Rotor-Ritzel[-]
i_rizs = 112;     % Übersetzung Ritzel-Zahnstange [rad/m] 
i_kmzs = 897;     % Übersetzung Kugelmutter-Zahnstange [rad/m]
i_rokm = 1.37;    % Übersetzung Rotor - Kugelmutter[-]


%% Systemmodell %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Matrizen des Zustandsraummodells


% Anfangswerte der Zustände
 x0 = [2*pi/180 0 0 0]';  % 2° Lenkwinkel
% 
% Definition Zustandsraummodell
sys = ss(A,B,C,D);



%% Systemanalye des ungeregelten Systems %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% Reglerentwurf %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% ----------------------- Polzuweisung (ZRF) ---------------------------- %

% Regelparameter der Zustandsrückführung
K_PZ(1,:) = [0 0 0 0];
K_PZ(2,:) = [-29 -0.67 0.71 0.16];
K_PZ(3,:) = [-2 -4.6 0.71 0.5];


% Zustandraummodell des geschlossenen Regelkreises


% Stabilität des geregelten Systems

% Verhalten des gereglten Systems



