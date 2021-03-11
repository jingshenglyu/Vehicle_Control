% Technische Universit�t Berlin
% ILS Fachgebiet Kraftfahrzeuge
% Fahrzeugregelung II
% Projektarbeit
% Sommersemester 2019
% Andreas Hartmann, M. Sc.
% -------------------------------------------------------------------------
% Fahrzeug
% -------------------------------------------------------------------------
% Jingsheng Lyu 398756
%%
clear all;
clc;

%% Gegebene Gr��en
vehicle_mass = 1500;                    % [kg]        Gesamtmasse des Fahrzeugs
in.m_v = 750.8 / 1500 * vehicle_mass;   % [kg]        Achslast vorn
in.m_h = 749.2 / 1500 * vehicle_mass;   % [kg]        Achslast hinten
in.m = vehicle_mass;                  % [kg]        Gesamtmasse des Fahrzeugs  
in.T_z = 2081.2;                    % [kg*m�]     Tr�gheitsmoment um z-Achse
in.L = 2.72;                        % [m]         Radstand
in.EG = 0.25 * pi / 180;            % [Grad*s�/m] Eigenlenkgradient    
in.SG = 0.30 * pi / 180;            % [Grad*s�/m] Schwimmwinkelgradient
in.mu = 0.9;                        % [-]         Reibungskoeffizient
in.C = 1.3;                         % [-]         Formfaktor f�r Magic Formula
in.E = 0.85;                        % [-]         Kr�mmungsfaktor f�r Magic Formula
in.g = 9.81;                        % [m/s^2]     Erdbeschleunigung        
in.rho = 1.2;                       % [kg/m^2]    Dichte der Luft
in.c_w = 0.4;                       % [-]         Luftwiderstandsbeiwert
in.A = 1.5;                         % [m^2]       Stirnfl�che des Fahrzeugs


%% Berechnungen

% Achslastverteilung aus Momentenbilanz
in.l_h = (in.m_v * in.L) / in.m;                %  [m]  Achsabstand Schwerpunkt zu Hinterachse
in.l_v = (in.m_h * in.L) / in.m;                %  [m]  Achsabstand Schwerpunkt zu Vorderachse

% Linearisierte Schr�glaufsteifigkeit hinten - hergeleitet anhand der Definition des
% Schwimmwinkelgradienten SG
in.c_h = ( (in.m * in.l_v) / (in.SG * in.L ) );                     %  [N/rad]  

% Linearisierte Schr�glaufsteifigkeit vorne - hergeleitet anhand der Definition des
% Eigenlenkgradienten EG
in.c_v = in.l_h / ( ((in.EG * in.L) / in.m) + in.l_v / in.c_h );    %  [N/rad]

%% Berechnung der fehlenden Faktoren f�r die Magic Formula

% Amplitudenfaktor D (abh�ngig von Achslasten "vertical load")
in.D_v = in.mu * in.m_v * in.g;             %  [N]        
in.D_h = in.mu * in.m_h * in.g;             %  [N]

% Steifigkeitsfaktor B
in.B_v = in.c_v / (in.C * in.D_v);          %  [1/rad]
in.B_h = in.c_h / (in.C * in.D_h);          %  [1/rad]

%%
% -------------------------------------------------------------------------
% Man�ver
% -------------------------------------------------------------------------

crgmainpath = '/Users/eason/Downloads/Fahrzeugregelung/FaRe_II/Projekt/Projektdateien/OpenCRG.1.0.6'; % Hier vollst�ndigen Pfad zu: ...\OpenCRG.1.0.6\matlab\lib Verzeichnis angeben
addpath(genpath(crgmainpath));

n=2;% Stecke ausw�hlen
switch n
    case 1
        data = crg_read('Spurwechsel_ab30m.crg'); %Spurwechsel
        param.course='Spurwechsel_ab30m.crg';
    case 2
        data = crg_read('Slalom_3x18m.crg'); % Slalom
        param.course='Slalom_3x18m.crg';
end
data=rmfield(data,{'ct','struct'}); % Struct Elemente l�schen damit embedded Matlab Function diese verarbeiten kann
crg_show_refline_map(data);
%%
%%%%%%%%%%%%%%%%%%%%%
%%---------------Reglerentwurf----------------%%
%%%%%%%%%%%%%%%%%%%%%

%% Aufgabe 1: Zustandraumdarstellung und Berechnung der Eigenwerten

sim('Projekt_FARE2_SS19_template')

% figure(2)
% plot(ay_EG,delta_EG)

% case 1 v = 5 [m/s]
v_x = 5; % Geschiwindigkeit v= 20 [m/s], da beta klein ist. v_x = v = 5m/s

% Parameteren vom Zustandraum bei v = 5m/s
A1 = [0, 1, 0, 0;0, -(in.c_v+in.c_h)/(in.m*v_x), 0, -v_x-(in.c_v*in.l_v-in.c_h*in.l_h)/(in.m*v_x);...
    0, 0, 0, 1;0, -(in.c_v*in.l_v+in.c_h*in.l_h)/(in.T_z*v_x), 0, -(in.c_v*in.l_v^2+in.c_h*in.l_h^2)/(in.T_z*v_x) ]; % Zustandsmatrix

B1 = [0 ; in.c_v/in.m ; 0 ; in.c_v*in.l_v/in.T_z]; % Eingangsmatrix

C1 = eye(4); % Steuermatrix

D1 = [0 ; 0 ; 0 ; 0]; % Durchgangsmatrix

% Zustandraumdarstellung
sys1 = ss(A1,B1,C1,D1);

% Eigenwerten
EW_v_5 = eig(sys1);

% case 2 v = 20 [m/s]
v_x = 20; % Geschiwindigkeit v= 20 [m/s], da beta klein ist. v_x = v = 20m/s

% Parameteren vom Zustandraum bei v = 20m/s
A2 = [0, 1, 0, 0;0, -(in.c_v+in.c_h)/(in.m*v_x), 0, -v_x-(in.c_v*in.l_v-in.c_h*in.l_h)/(in.m*v_x);...
    0, 0, 0, 1;0, -(in.c_v*in.l_v+in.c_h*in.l_h)/(in.T_z*v_x), 0, -(in.c_v*in.l_v^2+in.c_h*in.l_h^2)/(in.T_z*v_x) ]; % Zustandsmatrix

B2 = [0 ; in.c_v/in.m ; 0 ; in.c_v*in.l_v/in.T_z]; % Eingangsmatrix

C2 = eye(4); % Steuermatrix

D2 = [0 ; 0 ; 0 ; 0]; % Durchgangsmatrix

% Zustantdraumdarstellung
sys2 = ss(A2,B2,C2,D2);

% Eigenwerten
EW_v_20 = eig(sys2);

%% Aufgabe 2: 
% UeF = tf(sys2); % Bestimmung der Uebergangsfunktion fuer v = 20m/s

Ss = [B2 A2*B2 A2*B2.^2 A2*B2.^3];

rang_Ss = rank(Ss);
% Rang(Ss) = 3 ~= n, nicht vollstaendig steuerbar ? 
% Das System ist nicht steuerbar

P = [-40+40i -40-40i -100 -100]; % Bestimmung der Polen

K = place(A2,B2,P); % Bestimmung der Zustandrueckfuehrung

%% Aufgabe 3:

v_a3 = 20; % Geschwindigkeit 20 [m/s]

r_a3 = 100; % Radius 100 [m]










