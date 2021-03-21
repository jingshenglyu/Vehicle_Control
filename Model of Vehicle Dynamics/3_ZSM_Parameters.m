% Technische Universität Berlin
% ILS Fachgebiet Kraftfahrzeuge
% Fahrzeugdynamik in der industriellen Anwendung
% Wintersemester 2018/19
% Niklas Kunz, M.Sc.

%--------------------------------------------------------------------------
% 2. Teilaufgabe - Erweiterung desReifenmodells & Fahrdynamiksimulation mit
% einem Zweispurmodell
%--------------------------------------------------------------------------
%   _______________________________________________
%   Gruppe 17
%   Manns, Dominik  | 352918
%   Müller, Mario   | 344042
%   Lyu, Jingsheng  | 398756
%   Zhu, Siguang    | 389499
%
%--------------------------------------------------------------------------

clear all;
close all;
clc;

disp('###  Fahrzeugdynamik in der industriellen Anwendung  ###')
disp(' 2. Teilaufgabe - Erweiterung desReifenmodells & Fahrdynamiksimulation mit einem Zweispurmodell ')
disp(' ')
disp('###  Gruppe 6  ###')
disp('Manns, Müller, Lyu , Zhu')
disp(' ')
disp(' ~ Starte Skript ~ ');
disp(' ');

%% --- Initialisierung und Berechnungen --- 
% Legende: SP Schwerpunkt | VA Vorderachse | HA Hinterachse 
% CS Corneringstiffness | 

disp(' > Initialisiere Parameter ... ')
disp(' ')
pause(2)

% Lade Kennfelder und Fahrmanöver
disp(' > Lade Reifenkennfeld... ')
fz = xlsread('./Data/Reifenkennfeld F_z.xls',1,'','basic');
fz1 = fz(:,1);
fz(:,1) = [];
pause(2);
disp(' Reifenkennfeld geladen ')
disp(' ')

disp(' > Lade Fahrmanöver: Stationäre Kreisfahrt .... ')
Test = xlsread('./Data/Vorgaben.xls',1,'','basic');
T_t = Test(:,1);
T_v = Test(:,2);
T_R = Test(:,3);
pause(2);
disp(' Fahrmanöver "Stationäre Kreisfahrt" geladen ')
disp(' ')

disp(' > Lade Fahrmanöver: Dauersinus nach ISO 7401 .... ')
load ./Data/Sollvorgaben_v80_ay6_f0p1
pause(2);
disp(' Fahrmanöver "Dauersinus" geladen ')
disp(' ')
% -------------------------------------------------------------------------

% Gegebene Größen nach Aufgabenstellung
m_v = 749.8;                    % [kg]        Achslast vorn
m_h = 750.0;                    % [kg]        Achslast hinten
m = m_v + m_h;                  % [kg]        Gesamtmasse des Fahrzeugs
T_z = 2080.4;                   % [kg*m²]     Trägheitsmoment um z-Achse
L = 2.71;                       % [m]         Radstand
EG = 0.25;                      % [Grad*s²/m] Eigenlenkgradient    
SG = 0.30;                      % [Grad*s²/m] Schwimmwinkelgradient
mu = 0.9;                       % [-]         Reibungskoeffizient
C  = 1.3;                       % [-]         Formfaktor für Magic Formula
E  = 0.85;                      % [-]         Krümmungsfaktor für Magic Formula

s_v = 1.54;                     % [m]         Spurweite VA
s_h = 1.57;                     % [m]         Spurweite HA
i_l = 16;                       % [-]         Lenkübersetzung
c_L = 10000;                    % [Nm/rad]    Lenkungssteifigkeit
h_s = 0.5;                      % [m]         Höhe Fahrzeugschwerpunkt
r_dyn = 0.35;                   % [m]         dynamischer Rollradius Reifen
rho = 1.2;                      % [kg/m³]     Dichte Luft
c_w = 0.4;                      % [-]         Luftwiderstandsbeiwert
A = 1.5;                        % [m²]        Fahrzeugstirnfläche
g = 9.81;                       % [m/s²]      Erdbeschleunigung

% Parametrierung der Lenkung
Lenkwinkel = [-405 -180 -90 -45 0 45 90 180 410];
Radlenkwinkel = [-34.5 -10.5 -5.5 -3 0 3 5.5 10.5 35.5];

% --- Berechnung SP-Lage (Hebelarme) und statischer Radlasten

l_h = m_v * L / m;              % [m]       Berechnung SP-Lage HA
l_v = m_h * L / m;              % [m]       Berechnung SP-Lage VA

SP_yl = 0.5;                   % [%]    SP-Lage Links
SP_yr = 1 - SP_yl;             % [%]    SP-Lage Rechts

m_vl = m * l_h / L * SP_yl;     % [kg]      Radmasse vorne Links
m_vr = m * l_h / L * SP_yr;     % [kg]      Radmasse vorne rechts
m_hl = m * l_v / L * SP_yl;     % [kg]      Radmasse hinten links
m_hr = m * l_v / L * SP_yr;     % [kg]      Radmasse hinten rechts

% --- Berechnung Schräglaufsteifigkeiten
c_h = m_h / SG;                 % [N/grad]   Berechnung CS HA
c_v = l_h / (( L * EG / m ) + l_v / c_h );   % [N/grad] Berechnung CS VA

c_v = c_v * 180 / pi;           % [N/grad] => [N/rad]
c_h = c_h * 180 / pi;           % [N/grad] => [N/rad]

c_v_r = 0.5 * c_v;              % Aufteilung der CS 
c_v_l = 0.5 * c_v;
c_h_r = 0.5 * c_h;
c_h_l = 0.5 * c_h;

% --- Berechnung statischer Reifenparameter für Pacejka
D_v = mu * m_v * 9.81;          % [1]       Berechnung Parameter D VA
D_h = mu * m_h * 9.81;          % [1]       Berechnung Parameter D HA

B_v = c_v / (C * D_v);          % [1]       Berechnung Parameter B VA
B_h = c_h / (C * D_h);          % [1]       Berechnung Parameter B HA

% maximaler Haftwert
F_x_max = m_v * 9.81 * mu;
F_x_min = - F_x_max;

% Erzeuge Datenarray für Speicherung der Ergebnisse
data_ESM = cell([2 17]);
data_car = cell([2 10]);
data_tire = cell([2 24]);

% Lösche Parameter 
clear Test

disp(' ~ Initialisierung abgeschlossen ~ ')
disp(' ')
pause(2);


%% Simulation 2.1 ESM 

% --- Berechnung spezifischer Initialwerte
R_init = 200;
v_init = 30/3.6;
a_r_init = v_init^2/200;
psi_p_init = (30/3.6)/200;
beta_init = l_h / R_init - m*l_v/(c_h*L)*a_r_init;
delta_init = 15.63;
t_sim = T_t(end,1);

% --- Simulation ESM: Schleife über Reifenmodus
disp(' ~ Starte Simulationsprozess Einspurmodell ~ ')
disp(' ')
pause(2)

for i = 1:2

    Mode_Tire = 2-i;    % Mode_Tire = 0: Längs- und Quer entkoppelt | = 1: Kamm'scher Kreis
    
    if i == 1
        disp(' > Starte Simulation 1/4: ESM - entkoppelte Reifenkräfte ')
    elseif i == 2
        disp(' > Starte Simulation 2/4: ESM - Kammscher Kreis ')
    end
    
    sim A2_ESM.slx
    
    R_out(R_out>=1000)=0;   % Filter Radius über 1000m
    
    disp(' ... speichere Ergebnisse ... ')
    
    % Schreibe Daten in Arrayƒ
    data_ESM{i,1} = delta_out;
    data_ESM{i,2} = v_out;
    data_ESM{i,3} = a_y_out;
    data_ESM{i,4} = psi_p_out;
    data_ESM{i,5} = beta_out;
    data_ESM{i,6} = alpha_v_out;
    data_ESM{i,7} = alpha_h_out;
    data_ESM{i,8} = R_out;
    data_ESM{i,9} = x_out;
    data_ESM{i,10} = y_out;
    data_ESM{i,11} = t_out;
    data_ESM{i,12} = 0;
    data_ESM{i,13} = F_y_v;
    data_ESM{i,14} = F_y_v_max;
    data_ESM{i,15} = F_y_h;
    data_ESM{i,16} = F_y_h_max;
    data_ESM{i,17} = F_v_max;
    
    disp(' Ergebnisse gespeichert ')
    disp(' ')
    pause(2)
end
disp(' ')
% --- Lösche Parameter
clear R_init v_init a_r_init psi_p_init beta_init delta_init

disp(' ~ Simulationsprozess Einspurmodell beendet ~ ')
disp(' ')

%% Simulation 2.3 ZSM

% --- Berechnung spezifischer Initialwerte
t_sim = 75;
v_init = 8.33;
f_x_init = 0.5*A*c_w*rho*v_init^2;

% --- Simulation ZSM: Schleife über Aufbaubewegung
disp(' ~ Starte Simulationsprozess Zweispurmodell  ~ ')
disp(' ')
pause(2)

for i = 1:2
    
    dynamicload_mode = i-1;   % 0 = static wheel load | 1 = dynamic wheel load
    
    if i == 1
        disp(' > Starte Simulation 3/4: ZSM - statische Radlasten ')
    elseif i == 2
        disp(' > Starte Simulation 4/4: ZSM - dynamische Radlasten ')
    end

    sim A2_ZSM
    
    disp(' ... speichere Ergebnisse ')
    
% Data Tire
    % Front Left
    data_tire{i,01} = alpha_v_l_out;
    data_tire{i,02} = F_v_l_max;
    data_tire{i,03} = F_x_v_l;
    data_tire{i,04} = F_y_v_l;
    data_tire{i,05} = F_y_v_l_max;
    data_tire{i,06} = F_z_v_l;
    % Front Right
    data_tire{i,07} = alpha_v_r_out;
    data_tire{i,08} = F_v_r_max;
    data_tire{i,09} = F_x_v_r;
    data_tire{i,10} = F_y_v_r;
    data_tire{i,11} = F_y_v_r_max;
    data_tire{i,12} = F_z_v_r;
    % Rear Left
    data_tire{i,13} = alpha_h_l_out;
    data_tire{i,14} = F_h_l_max;
    data_tire{i,15} = F_x_h_l;
    data_tire{i,16} = F_y_h_l;
    data_tire{i,17} = F_y_h_l_max;
    data_tire{i,18} = F_z_h_l;
    % Rear Right
    data_tire{i,19} = alpha_h_r_out;
    data_tire{i,20} = F_h_r_max;
    data_tire{i,21} = F_x_h_r;
    data_tire{i,22} = F_y_h_r;
    data_tire{i,23} = F_y_h_r_max;
    data_tire{i,24} = F_z_h_r;
    
% Dynamik
    data_car{i,1} = t_out;
    data_car{i,2} = delta_out;
    data_car{i,3} = v_out;
    data_car{i,4} = a_x_out;
    data_car{i,5} = a_y_out;
    data_car{i,6} = psi_p_out;
    data_car{i,7} = beta_out;
    % Radius Bahnkurve
    R_out(R_out >=  450) = nan;
    R_out(R_out <= -450) = nan;
    data_car{i,8} = R_out;
    data_car{i,9} = x_out;
    data_car{i,10} = y_out;
    
    disp(' Ergebnisse gespeichert ')
    disp(' ')
    pause(2)
end

% --- Berechnung dyn. Diagonalradlasten

% Änderung Radlast VL
F_z_cw_VLHR = data_tire{2,06} - data_tire{2,24};

% Änderung Radlast VR
F_z_cw_VRHL = data_tire{2,12} - data_tire{2,18};

F_z_dcw = F_z_cw_VRHL ./ (F_z_cw_VRHL-F_z_cw_VLHR);
F_z_dcw(F_z_dcw >= 0.6) = nan;
F_z_dcw(F_z_dcw <= 0.4) = nan;

clear t_sim v_init f_x_init

disp(' ~ Simulationsprozess Zweispurmodell beendet ~ ')
disp(' ')

disp(' ~ Alle Simulationen abgeschlossen ~ ')
disp(' ')
pause(2)
%% Plotting Setup

disp(' > Initialisiere Datenauswertung ... ')
disp(' ')
% --- Settings
pC1 = 'black';          % Farbe Plot level 1, Variante 1
pC1a = 'black--';       % Farbe Plot level 1, Variante 2
pC2 = 'red';            % Farbe Plot level 2, Variante 1
pC2a = 'red--';         % Farbe Plot level 2, Variante 2
pC3 = 'blue';           % Farbe Plot level 3, Variante 1
pC3a = 'blue--';        % Farbe Plot level 3, Variante 2
pC4 = 'green';          % Farbe Plot level 4, Variante 1
pC4a = 'green--';       % Farbe Plot level 4, Variante 2
pC5 = 'm';              % Farbe Plot level 5, Variante 1
pC5a = 'm--';           % Farbe Plot level 5, Variante 2

pNW = 'NorthWest';      % Orientierung Legende oben links
pNE = 'NorthEast';      % Orientierung Legende oben rechts
pSE = 'SouthEast';      % Orientierung Legende unten rechts

pBG = [1 1 1];          % Farbe Plot Hintergrund
pLW = 0.5;              % Strichstärke
pTS = 10;               % Schriftgröße Achsen
pLS = 8;                % Schriftgröße Legende
%%
disp(' ... erzeuge Ordnerstruktur ')
disp(' ')
pause(2)
% --- Ordnerstruktur
    mkdir('Plots/ESM_A2');
    mkdir('./Plots/ZSM/VL');
    mkdir('./Plots/ZSM/VR');
    mkdir('./Plots/ZSM/HL');
    mkdir('./Plots/ZSM/HR');

%% Plotting ESM | All

disp(' ... visualsiere Ergebnisse Einspurmodell ')
disp(' ')

% Runs zum Vergleich
Comp = [1 2];

% Y: Lenkradwinkel | X: Querbeschleunigung
    h = figure('Color',pBG,'Visible','off');
    hold on
    box on
    grid on
    plot(data_ESM{Comp(1,1),3},data_ESM{Comp(1,1),1},pC1,'LineWidth',pLW)
    plot(data_ESM{Comp(1,2),3},data_ESM{Comp(1,2),1},pC2,'LineWidth',pLW)
    xlabel ('Querbeschleunigung [m/s²]','FontSize',pTS)
    ylabel ('Lenkwinkel [grad]','FontSize',pTS)
    le = legend('Location',pNW,'entkoppelt', 'Kammscher Kreis');
    set(le,'FontSize',pLS);
    %set(gca,'Color',[1 1 1],'FontSize',10,'Ylim',[0 180]);
    hold off
    saveas(h,strcat('./Plots/ESM_A2/ESM_Plot_delta_ay'),'png');

% Y: Querbeschleunigung | X: Geschwindigkeit
    h = figure('Color',pBG,'Visible','off');
    hold on
    box on
    grid on
    plot(data_ESM{Comp(1,1),2},data_ESM{Comp(1,1),3},pC1,'LineWidth',pLW)
    plot(data_ESM{Comp(1,2),2},data_ESM{Comp(1,2),3},pC2,'LineWidth',pLW)
    xlabel ('Geschwindigkeit [m/s]','FontSize',pTS)
    ylabel ('Querbeschleunigung [m/s²]','FontSize',pTS)
    le = legend('Location',pNW,'entkoppelt', 'Kammscher Kreis');
    set(le,'FontSize',pLS);
    %set(gca,'Color',[1 1 1],'FontSize',10,'Ylim',[0 180]);
    hold off
    saveas(h,strcat('./Plots/ESM_A2/ESM_Plot_ay_v'),'png');  

% Y: Gierwinkelgeschwindigkeit | X: Querbeschleunigung
    h = figure('Color',pBG,'Visible','off');
    hold on
    box on
    grid on
    plot(data_ESM{Comp(1,1),3},data_ESM{Comp(1,1),4},pC1,'LineWidth',pLW)
    plot(data_ESM{Comp(1,2),3},data_ESM{Comp(1,2),4},pC2,'LineWidth',pLW)
    xlabel ('Querbeschleunigung [m/s²]','FontSize',pTS)
    ylabel ('Gierwinkelgeschwindigkeit [grad/s]','FontSize',pTS)
    le = legend('Location',pNW,'entkoppelt', 'Kammscher Kreis');
    set(le,'FontSize',pLS);
    %set(gca,'Color',[1 1 1],'FontSize',10,'Ylim',[0 20]);
    hold off
    saveas(h,strcat('./Plots/ESM_A2/ESM_Plot_psip_ay'),'png');
 
% Y: Schwimmwinkel | X: Querbeschleunigung    
    h = figure('Color',pBG,'Visible','off');
    hold on
    box on
    grid on
    plot(data_ESM{Comp(1,1),3},data_ESM{Comp(1,1),5},pC1,'LineWidth',pLW)
    plot(data_ESM{Comp(1,2),3},data_ESM{Comp(1,2),5},pC2,'LineWidth',pLW)
    xlabel ('Querbeschleunigung [m/s²]','FontSize',pTS)
    ylabel ('Schwimmwinkel [rad]','FontSize',pTS)
    le = legend('Location',pNE,'entkoppelt', 'Kammscher Kreis');
    set(le,'FontSize',pLS);
    %set(gca,'Color',[1 1 1],'FontSize',10,'Ylim',[0 20]);
    hold off
    saveas(h,strcat('./Plots/ESM_A2/ESM_Plot_beta_ay'),'png');
    
% Y: Bahnradius | X: Querbeschleunigung
    h = figure('Color',pBG,'Visible','off');
    hold on
    box on
    grid on
    plot(data_ESM{Comp(1,1),3},data_ESM{Comp(1,1),8},pC1,'LineWidth',pLW)
    plot(data_ESM{Comp(1,2),3},data_ESM{Comp(1,2),8},pC2,'LineWidth',pLW)
    xlabel ('Querbeschleunigung [m/s²]','FontSize',pTS)
    ylabel ('Bahnradius [m]','FontSize',pTS)
    le = legend('Location',pNE,'entkoppelt', 'Kammscher Kreis');
    set(le,'FontSize',pLS);
    %set(gca,'Color',[1 1 1],'FontSize',10);
    hold off
    saveas(h,strcat('./Plots/ESM_A2/ESM_Plot_R_t'),'png')
    
% Y: y-Position | X: x-Position Bahnkurve
    h = figure('Color',pBG,'Visible','off');
    hold on
    box on
    grid on
    plot(data_ESM{Comp(1,1),9},data_ESM{Comp(1,1),10},pC1,'LineWidth',pLW)
    plot(data_ESM{Comp(1,2),9},data_ESM{Comp(1,2),10},pC2,'LineWidth',pLW)
    xlabel ('x-Koordinate [m]','FontSize',pTS)
    ylabel ('y-Koordinate [m]','FontSize',pTS)
    le = legend('Location',pNE,'entkoppelt', 'Kammscher Kreis');
    set(le,'FontSize',pLS);
    %set(gca,'Color',pBG,'FontSize',pTS,'Xlim',[-250 250],'Ylim',[-50 450]);
    xlim([-250 250])
    ylim([-50 450])
    hold off
    saveas(h,strcat('./Plots/ESM_A2/ESM_Plot_XY'),'png')

% Y: Schräglaufwinkel | X: Querbeschleunigung
    h = figure('Color',pBG,'Visible','off');
    hold on
    box on
    grid on
    plot(data_ESM{Comp(1,1),3},data_ESM{Comp(1,1),6},pC1,'LineWidth',pLW)
    plot(data_ESM{Comp(1,2),3},data_ESM{Comp(1,2),6},pC2,'LineWidth',pLW)
    xlabel ('Querbeschleunigung [m/s²]','FontSize',pTS)
    ylabel ('Schräglaufwinkel [grad]','FontSize',pTS)
    le = legend('Location',pNW,'entkoppelt', 'Kammscher Kreis');
    set(le,'FontSize',pLS);
    %set(gca,'Color',[1 1 1],'FontSize',10,'Ylim',[0 180]);
    hold off
    saveas(h,strcat('./Plots/ESM_A2/ESM_Plot_alphav_ay'),'png');
    
% Y: Reifenkraft | X: Querbeschleunigung
    h = figure('Color',pBG,'Visible','off');
    hold on
    box on
    grid on  
    plot(data_ESM{Comp(1,1),3},data_ESM{Comp(1,1),17},pC1,'LineWidth',pLW)
    plot(data_ESM{Comp(1,1),3},data_ESM{Comp(1,1),13},pC2,'LineWidth',pLW)
    plot(data_ESM{Comp(1,2),3},data_ESM{Comp(1,2),13},pC3,'LineWidth',pLW)
    xlabel ('Querbeschleunigung [m/s²]','FontSize',pTS)
    ylabel ('Radseitenkraft [N]','FontSize',pTS)
    le = legend('Location',pSE,'maximale Kraft','entkoppelt','Kammscher Kreis');
    set(le,'FontSize',pLS);
    set(gca,'xtick',0:1:10,'ytick',0:1000:7000);
    hold off
    saveas(h,strcat('./Plots/ESM_A2/ESM_Plot_Fy_v'),'png');
    
pause(2)   

%% Plotting ZSM | Allgemein

disp(' ... visualisiere Ergebnisse Zweispurmodell ')
disp(' ')

% Y: Lenkradwinkel | X: Querbeschleunigung
    h = figure('Color',pBG,'Visible','off');
    hold on
    box on
    grid on
    plot(data_car{1,5},data_car{1,2},pC1,'LineWidth',pLW)
    plot(data_car{2,5},data_car{2,2},pC2,'LineWidth',pLW)
    xlabel ('Querbeschleunigung [m/s²]','FontSize',pTS)
    ylabel ('Lenkwinkel [grad]','FontSize',pTS)
    le = legend('Location',pNW,'static', 'dynamic');
    set(le,'FontSize',pLS);
    %set(gca,'Color',[1 1 1],'FontSize',10,'Ylim',[0 180]);
    hold off
    saveas(h,strcat('./Plots/ZSM/Plot_delta_ay'),'png');
       
% Y: Querbeschleunigung | X: Zeit
    h = figure('Color',pBG,'Visible','off');
    hold on
    box on
    grid on
    plot(data_car{1,1},data_car{1,5},pC1,'LineWidth',pLW)
    plot(data_car{2,1},data_car{2,5},pC2,'LineWidth',pLW)
    xlabel ('Zeit [s]','FontSize',pTS)
    ylabel ('Querbeschleunigung [m/s²]','FontSize',pTS)
    le = legend('Location',pNW,'static', 'dynamic');
    set(le,'FontSize',pLS);
    %set(gca,'Color',[1 1 1],'FontSize',10,'Ylim',[0 180]);
    hold off
    saveas(h,strcat('./Plots/ZSM/Plot_ay_t'),'png');
    
% Y: Gierwinkelgeschwindigkeit | X: Querbeschleunigung
    h = figure('Color',pBG,'Visible','off');
    hold on
    box on
    grid on
    plot(data_car{1,5},data_car{1,6},pC1,'LineWidth',pLW)
    plot(data_car{2,5},data_car{2,6},pC2,'LineWidth',pLW)
    xlabel ('Querbeschleunigung [m/s²]','FontSize',pTS)
    ylabel ('Gierwinkelgeschwindigkeit [rad/s]','FontSize',pTS)
    le = legend('Location',pNW,'static', 'dynamic');
    set(le,'FontSize',pLS);
    %set(gca,'Color',[1 1 1],'FontSize',10,'Ylim',[0 20]);
    hold off
    saveas(h,strcat('./Plots/ZSM/Plot_psip_ay'),'png');
    
% Y: Schwimmwinkel | X: Querbeschleunigung    
    h = figure('Color',pBG,'Visible','off');
    hold on
    box on
    grid on
    plot(data_car{1,5},data_car{1,7},pC1,'LineWidth',pLW)
    plot(data_car{2,5},data_car{2,7},pC2a,'LineWidth',pLW)
    xlabel ('Querbeschleunigung [m/s²]','FontSize',pTS)
    ylabel ('Schwimmwinkel [grad]','FontSize',pTS)
    le = legend('Location',pNW,'static', 'dynamic');
    set(le,'FontSize',pLS);
    %set(gca,'Color',[1 1 1],'FontSize',10,'Ylim',[0 20]);
    hold off
    saveas(h,strcat('./Plots/ZSM/Plot_beta_ay'),'png');
    
% Y: Schwimmwinkel | X: Querbeschleunigung    
    h = figure('Color',pBG,'Visible','off');
    hold on
    box on
    grid on
    plot(data_car{1,5},data_car{1,7},pC1,'LineWidth',pLW)
    plot(data_car{2,5},data_car{2,7},pC2,'LineWidth',pLW)
    xlabel ('Querbeschleunigung [m/s²]','FontSize',pTS)
    ylabel ('Schwimmwinkel [grad]','FontSize',pTS)
    le = legend('Location',pNW,'static', 'dynamic');
    set(le,'FontSize',pLS);
    %set(gca,'Color',[1 1 1],'FontSize',10,'Ylim',[0 20]);
    hold off
    saveas(h,strcat('./Plots/ZSM/Plot_beta_ay'),'png');
    
% Y: y-Koordinate | X: x-Koordinate    
    h = figure('Color',pBG,'Visible','off');
    hold on
    box on
    grid on
    plot(data_car{1,9},data_car{1,10},pC1,'LineWidth',pLW)
    plot(data_car{2,9},data_car{2,10},pC2,'LineWidth',pLW)
    xlabel ('x-Koordinate [m]','FontSize',pTS)
    ylabel ('y-Koordinate [m]','FontSize',pTS)
    le = legend('Location',pNW,'static', 'dynamic');
    set(le,'FontSize',pLS);
    set(gca,'xtick',(0:150:1500),'ytick',(0:100:600));
    hold off
    saveas(h,strcat('./Plots/ZSM/Plot_x_y'),'png');

disp(' ... :) ... ')
%% Plotting ZSM | Reifen

Tires = ['VL';'VR';'HL';'HR'];
j = 0;  % Verschiebevariable

for i = 1 : length(Tires)

% Y: Reifenkraft | X: Schräglaufwinkel
    h = figure('Color',pBG,'Visible','off');
    hold on
    box on
    grid on
    le1 = strcat('F_',Tires(i,1),'_',Tires(i,2),'_r_m_a_x_,_s_t_a_t');
    le2 = strcat('F_',Tires(i,1),'_',Tires(i,2),'_r_m_a_x_,_d_y_n');
    xl = strcat('Schräglaufwinkel ',{' '},Tires(i,:),' [°]');
    yl = strcat('Radseitenkraft ',{' '},Tires(i,:),' [N]');   
    plot(data_tire{1,1+j},data_tire{1,4+j},pC1,'LineWidth',pLW)
    plot(data_tire{2,1+j},data_tire{2,4+j},pC2,'LineWidth',pLW)
    xlabel (xl,'FontSize',pTS)
    ylabel (yl,'FontSize',pTS)
    le = legend('Location',pNW,le1,le2);
    set(le,'FontSize',pLS);
    %set(gca,'xtick',-6:1:6,'ytick',-4000:1000:4000);
    hold off
    saveas(h,strcat('./Plots/ZSM/',Tires(i,:),'/Plot_alpha_Fy'),'png');
 
% Y: Reifenkraft | X: Zeit | Statisch Dynamisch
    h = figure('Color',pBG,'Visible','off');
    hold on
    box on
    grid on
    le1 = strcat('F_',Tires(i,1),'_',Tires(i,2),'_m_a_x_,_s_t_a_t');
    le2 = strcat('F_',Tires(i,1),'_',Tires(i,2),'_m_a_x_,_d_y_n');
    le3 = strcat('F_',Tires(i,1),'_',Tires(i,2),'_y_,_s_t_a_t');
    le4 = strcat('F_',Tires(i,1),'_',Tires(i,2),'_y_,_d_y_n');
    xl = strcat('Zeit ',{' '},Tires(i,:),' [s]');
    yl = strcat('Kraft ',{' '},Tires(i,:),' [N]');   
    plot(data_car{1,1},data_tire{1,2+j},pC1,'LineWidth',pLW)
    plot(data_car{2,1},data_tire{2,2+j},pC2,'LineWidth',pLW)
    plot(data_car{1,1},abs(data_tire{1,4+j}),pC1a,'LineWidth',pLW)
    plot(data_car{2,1},abs(data_tire{2,4+j}),pC2a,'LineWidth',pLW)
    xlabel (xl,'FontSize',pTS)
    ylabel (yl,'FontSize',pTS)
    le = legend('Location',pNW,le1,le2,le3,le4);
    set(le,'FontSize',pLS);
    %set(gca,'xtick',-6:1:6,'ytick',-4000:1000:4000);
    hold off
    saveas(h,strcat('./Plots/ZSM/',Tires(i,:),'/Plot_stat_dyn_F_t'),'png');

% Y: Reifenkraft | X: Zeit | Statisch
    f_res_temp = data_tire{1,3+j} + abs(data_tire{1,4+j});
    
    h = figure('Color',pBG,'Visible','off');
    hold on
    box on
    grid on
    le1 = strcat('F_',Tires(i,1),'_',Tires(i,2),'_z');
    le2 = strcat('F_',Tires(i,1),'_',Tires(i,2),'_y_m_a_x');
    le3 = strcat('F_',Tires(i,1),'_',Tires(i,2),'_y');
    le4 = strcat('F_',Tires(i,1),'_',Tires(i,2),'_x');
    le5 = strcat('F_',Tires(i,1),'_',Tires(i,2),'_r_e_s');
    xl = strcat('Zeit ',{' '},Tires(i,:),' [s]');
    yl = strcat('Kraft ',{' '},Tires(i,:),' [N]');   
    plot(data_car{1,1},data_tire{1,6+j},pC1,'LineWidth',pLW)
    plot(data_car{1,1},abs(data_tire{1,5+j}),pC2,'LineWidth',pLW)
    plot(data_car{1,1},abs(data_tire{1,4+j}),pC3,'LineWidth',pLW)
    plot(data_car{1,1},abs(data_tire{1,3+j}),pC4,'LineWidth',pLW)
    plot(data_car{1,1},f_res_temp,pC1a,'LineWidth',pLW)
    xlabel (xl,'FontSize',pTS)
    ylabel (yl,'FontSize',pTS)
    le = legend('Location',pNW,le1,le2,le3,le4,le5);
    set(le,'FontSize',pLS);
    %set(gca,'xtick',-6:1:6,'ytick',-4000:1000:4000);
    hold off
    saveas(h,strcat('./Plots/ZSM/',Tires(i,:),'/Plot_stat_F_t'),'png');    
    
% Y: Reifenkraft | X: Zeit | Dynamisch
    f_res_temp = sqrt(data_tire{2,3+j}.^2 + data_tire{2,4+j}.^2);
    
    h = figure('Color',pBG,'Visible','off');
    hold on
    box on
    grid on
    le1 = strcat('F_',Tires(i,1),'_',Tires(i,2),'_z');
    le2 = strcat('F_',Tires(i,1),'_',Tires(i,2),'_y_m_a_x');
    le3 = strcat('F_',Tires(i,1),'_',Tires(i,2),'_y');
    le4 = strcat('F_',Tires(i,1),'_',Tires(i,2),'_x');
    le5 = strcat('F_',Tires(i,1),'_',Tires(i,2),'_r_e_s');
    xl = strcat('Zeit ',{' '},Tires(i,:),' [s]');
    yl = strcat('Kraft ',{' '},Tires(i,:),' [N]');   
    plot(data_car{1,1},data_tire{2,6+j},pC1,'LineWidth',pLW)
    plot(data_car{1,1},abs(data_tire{2,5+j}),pC2,'LineWidth',pLW)
    plot(data_car{1,1},abs(data_tire{2,4+j}),pC3,'LineWidth',pLW)
    plot(data_car{1,1},abs(data_tire{2,3+j}),pC4,'LineWidth',pLW)
    plot(data_car{1,1},f_res_temp,pC1a,'LineWidth',pLW)
    xlabel (xl,'FontSize',pTS)
    ylabel (yl,'FontSize',pTS)
    le = legend('Location',pNW,le1,le2,le3,le4,le5);
    set(le,'FontSize',pLS);
    %set(gca,'xtick',-6:1:6,'ytick',-4000:1000:4000);
    hold off
    saveas(h,strcat('./Plots/ZSM/',Tires(i,:),'/Plot_dyn_F_t'),'png'); 
    
    j = j + 6;
end
disp(' ')
disp(' ~ Datenauswertung abgeschlossen ~ ')
disp(' ')
disp(' > öffne Ergebnisauswertung ')
winopen(pwd)
disp(' ')
pause(2)
%% Footer

% --- Exit
disp(' > Workspace wird aufgeräumt ... ')
disp(' ')

clear h j f_res_temp

disp(' ')
disp(' ~ Skript beendet ~ ')