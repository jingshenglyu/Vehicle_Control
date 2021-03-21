% Technische Universität Berlin
% ILS Fachgebiet Kraftfahrzeuge
% Fahrzeugdynamik in der industriellen Anwendung
% Wintersemester 2018/19
% Niklas Kunz, M.Sc.

%--------------------------------------------------------------------------
% 1. Teilaufgabe - Untersuchungen am linearen Einspurmodell
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
disp(' 1. Teilaufgabe - Untersuchungen am linearen Einspurmodell ')
disp(' ')
disp('###  Gruppe 6  ###')
disp('Manns, Müller, Lyu , Zhu')
disp(' ')
disp(' ~ Starte Skript ~ ');
disp(' ');

%% --- Initialisierung und Berechnungen --- 
disp(' > Initialisiere Parameter ... ')
disp(' ')
pause(2)

% Gegebene Größen
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

% Parametrierung der Lenkung
Lenkwinkel = [-405 -180 -90 -45 0 45 90 180 410];
Radlenkwinkel = [-34.5 -10.5 -5.5 -3 0 3 5.5 10.5 35.5];

% Initialdefinition
i_L = 16;                       % [-]         Lenkübersetzung

%% Berechnungen!
% Legende: SP Schwerpunkt | VA Vorderachse | HA Hinterachse | CS
% Corneringstiffness

l_h = m_v * L / m;              % [m]       Berechnung SP-Lage HA
l_v = m_h * L / m;              % [m]       Berechnung SP-Lage VA

c_h = m_h / SG;                 % [N/grad]   Berechnung CS HA
c_v = l_h / (( L * EG / m ) + l_v / c_h );   % [N/grad] Berechnung CS VA

c_v = c_v * 180 / pi;           % [N/grad] => [N/rad]
c_h = c_h * 180 / pi;           % [N/grad] => [N/rad]

D_v = mu * m_v * 9.81;          % [1]       Berechnung Parameter D VA
D_h = mu * m_h * 9.81;          % [1]       Berechnung Parameter D HA

B_v = c_v / (C * D_v);          % [1]       Berechnung Parameter B VA
B_h = c_h / (C * D_h);          % [1]       Berechnung Parameter B HA

% tsim [s] | delta [°] | v [m/s] | set_delta [bool] | set_v [bool] | mode_tire [bool]
setting = [120 90 2.77 0 1 0; 120 90 2.77 0 1 1; 90 0 25 1 0 0; 90 0 25 1 0 1];
row = size(setting,1);
data = cell([row 11]);

disp(' ~ Initialisierung abgeschlossen ~ ')
disp(' ')
pause(2);

% --- Simulation ESM: Schleife über Fahrmanöver
disp(' ~ Starte Simulationsprozess Einspurmodell ~ ')
disp(' ')
pause(2)

for i = 1:4
    if i < 3
        disp(strcat(' > Starte Simulation',{' '},num2str(i),'/4: Fahrmanöver 1'))
    elseif i > 2
        disp(strcat(' > Starte Simulation',{' '},num2str(i),'/4: Fahrmanöver 2'))
    end
    
    % Simulation Setting
    t_sim = setting(i,1);
    set_delta = setting(i,4); % [bool] 
    set_v = setting(i,5); 
    Mode_Tire = setting(i,6);
    
    % Simulation Initalwert
    delta = setting(i,2);
    v = setting(i,3);
    
    a_y_init = 0.2695;
    R_init = 28.62;
    psi_p_init = 0;
    beta_init = 0;    
    
    sim A1_ESM.slx
    
    R_out(R_out>=1000)=0;
    
    disp(' ... speichere Ergebnisse ... ')
    
    data{i,1} = delta_out;
    data{i,2} = v_out;
    data{i,3} = a_y_out;
    data{i,4} = psi_p_out;
    data{i,5} = beta_out;
    data{i,6} = alpha_v_out;
    data{i,7} = alpha_h_out;
    data{i,8} = R_out;
    data{i,9} = x_out;
    data{i,10} = y_out;
    data{i,11} = t_out;
    
    disp(' Ergebnisse gespeichert ')
    disp(' ')
    pause(2)    
end

%% Plotting init

disp(' > Initialisiere Datenauswertung ... ')
disp(' ')

Comp = [1 2; 3 4];
row = size(Comp,1);

disp(' ... erzeuge Ordnerstruktur ')
disp(' ')
pause(2)
% --- Ordnerstruktur
    mkdir('Plots/ESM_A1');
%% Plotting ESM | All

disp(' ... visualsiere Ergebnisse Einspurmodell ')
disp(' ')

for i = 1:row
    % Lenkradwinkel
    h = figure('Color',[1 1 1],'Visible','off');
    hold on
    box on
    grid on
    plot(data{Comp(i,1),3},data{Comp(i,1),1},'black','LineWidth',0.5)
    plot(data{Comp(i,2),3},data{Comp(i,2),1},'red','LineWidth',0.5)
    xlabel ('Querbeschleunigung [m/s²]','FontSize',10)
    ylabel ('Lenkwinkel [grad]','FontSize',10)
    le=legend('Location','NorthEast','linear', 'nicht linear');
    set(le,'FontSize',8);
    set(gca,'Color',[1 1 1],'FontSize',10,'Ylim',[0 180]);
    hold off
    saveas(h,strcat('./Plots/ESM_A1/Plot_ay_delta', num2str(i)),'png') 
    
    % Querbeschleunigung
    h = figure('Color',[1 1 1],'Visible','off');
    hold on
    box on
    grid on
    plot(data{Comp(i,1),11},data{Comp(i,1),3},'black','LineWidth',0.5)
    plot(data{Comp(i,2),11},data{Comp(i,2),3},'red','LineWidth',0.5)
    xlabel ('Zeit [s]','FontSize',10)
    ylabel ('Querbeschleunigung [m/s²]','FontSize',10)
    le=legend('Location','NorthEast','linear', 'nicht linear');
    set(le,'FontSize',8);
    %set(gca,'Color',[1 1 1],'FontSize',10,'Ylim',[0 20]);
    hold off
    saveas(h,strcat('./Plots/ESM_A1/Plot_ay_t', num2str(i)),'png')

    % Gierwinkelgeschwindigkeit
    h = figure('Color',[1 1 1],'Visible','off');
    hold on
    box on
    grid on
    plot(data{Comp(i,1),3},data{Comp(i,1),4},'black','LineWidth',0.5)
    plot(data{Comp(i,2),3},data{Comp(i,2),4},'red','LineWidth',0.5)
    xlabel ('Querbeschleunigung [m/s²]','FontSize',10)
    ylabel ('Gierwinkelgeschwindigkeit [rad/s]','FontSize',10)
    le=legend('Location','NorthEast','linear', 'nicht linear');
    set(le,'FontSize',8);
    %set(gca,'Color',[1 1 1],'FontSize',10,'Ylim',[0 20]);
    hold off
    saveas(h,strcat('./Plots/ESM_A1/Plot_psip_ay', num2str(i)),'png')
    
    % Schwimmwinkel
    h = figure('Color',[1 1 1],'Visible','off');
    hold on
    box on
    grid on
    plot(data{Comp(i,1),3},data{Comp(i,1),5},'black','LineWidth',0.5)
    plot(data{Comp(i,2),3},data{Comp(i,2),5},'red','LineWidth',0.5)
    xlabel ('Querbeschleunigung [m/s²]','FontSize',10)
    ylabel ('Schwimmwinkel [rad]','FontSize',10)
    le=legend('Location','NorthEast','linear', 'nicht linear');
    set(le,'FontSize',8);
    %set(gca,'Color',[1 1 1],'FontSize',10,'Ylim',[0 20]);
    hold off
    saveas(h,strcat('./Plots/ESM_A1/Plot_beta_ay', num2str(i)),'png')
  
    % Bahnradius
    h = figure('Color',[1 1 1],'Visible','off');
    hold on
    box on
    grid on
    plot(data{Comp(i,1),3},data{Comp(i,1),8},'black','LineWidth',0.5)
    plot(data{Comp(i,2),3},data{Comp(i,2),8},'red','LineWidth',0.5)
    xlabel ('Querbeschleunigung [m/s²]','FontSize',10)
    ylabel ('Bahnradius [m]','FontSize',10)
    le=legend('Location','NorthEast','linear', 'nicht linear');
    set(le,'FontSize',8);
    %set(gca,'Color',[1 1 1],'FontSize',10,'Ylim',[0 20]);
    hold off
    saveas(h,strcat('./Plots/ESM_A1/Plot_R_ay', num2str(i)),'png')
    
    % Bahnkurve
    h = figure('Color',[1 1 1],'Visible','off');
    hold on
    box on
    grid on
    plot(data{Comp(i,1),9},data{Comp(i,1),10},'black','LineWidth',0.5)
    plot(data{Comp(i,2),9},data{Comp(i,2),10},'red','LineWidth',0.5)
    xlabel ('x-Koordinate [m]','FontSize',10)
    ylabel ('y-Koordinate [m]','FontSize',10)
    le=legend('Location','NorthEast','linear', 'nicht linear');
    set(le,'FontSize',8);
    % set(gca,'Color',[1 1 1],'FontSize',10,'XTick',0:1:15);
    hold off
    saveas(h,strcat('./Plots/ESM_A1/Plot_XY_ay', num2str(i)),'png')

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

disp(' ')
disp(' ~ Skript beendet ~ ')