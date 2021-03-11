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
A = [0 1 0 0;-c_ds/J_1-c_ds/J_2 -b_1/J_1 -b_1/J_1+b_2/J_2 -i_rori/J_2;c_ds/J_2 0 -b_2/J_2 i_rori/J_2;0 0 0 -1/tau];
B = [0 ; 0 ; 0 ; 1/tau];
E = [0 0;1/J_1 -1/(J_2*i_rizs);0 1/(J_2*i_rizs); 0 0];
C = [c_ds 0 0 0;0 0 i_rori 0];
D = [0;0];

% Anfangswerte der Zustände
 x0 = [2*pi/180 0 0 0]';  % 2? Lenkwinkel
% 
% Definition Zustandsraummodell
sys = ss(A,B,C,D);

B_sim = [E B];
C_sim = eye(4);
D_sim = [0 0 0;0 0 0;0 0 0;0 0 0];

Sc = [B A*B A^2*B A^3*B];
rank(Sc)

Sb = [ C ; C*A ; C*A^2; C*A^3];
rank(Sb)

eig(A)

GS = tf(sys);



%% Systemanalye des ungeregelten Systems %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% Reglerentwurf %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% ----------------------- Polzuweisung (ZRF) ---------------------------- %

% Regelparameter der Zustandsrückführung

K_PZ = [0 0 0 0];
%

% Zustandraummodell des geschlossenen Regelkreises


% Stabilität des geregelten Systems

% Verhalten des gereglten Systems


