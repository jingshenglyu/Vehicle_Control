% Technische Universität Berlin
% ILS Fachgebiet Kraftfahrzeuge
% MATLAB/Simulink an Beispielen aus der Fahrzeugdynamik
% WiSe 2018
% Niklas Kunz, M.Sc.

%--------------------------------------------------------------------------
% 3. Teilaufgabe - Vertikaldynamik-Simulation am Beispiel des 1/4-Fzg.
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
disp(' 3. Teilaufgabe - Vertikaldynamik-Simulation am Beispiel des 1/4-Fzg. ')
disp(' ')
disp('###  Gruppe 6  ###')
disp('Manns, Müller, Lyu , Zhu')
disp(' ')
disp(' ~ Starte Skript ~ ');
disp(' ');

%% --- Initialisierung und Berechnungen -

disp(' > Initialisiere Parameter ... ')
disp(' ')
pause(2)

% Bedatung des Modells
m_vehicle_body = 480;    % in kg
c_suspension = 18000;    % in N/m
d_suspension = 1600;     % in Ns/m
c_tire = 310000;         % in N/m
m_wheel_body = 40;       % in kg

% Festlegen der Simulationszeit
h = 0.001;               % in s
t_start = 0;             % in s
t_end = 4 - h;           % in s

% Ruhelage
z1_0 = -((m_vehicle_body+m_wheel_body)*9.81)/c_tire;
z2_0 = z1_0 - m_vehicle_body*9.81/c_suspension;

pause(2);

disp(' > Lade Settings... ')
% tsim [s] | m_vehicle_body [kg] | c_suspension [N/m] | d_suspension [Ns/m]
% | c_tire [N/m] | m_wheel_body [kg]
setting = [...
    4 480 18000 1600 310000 40;...
    4 480 36000 1600 310000 40;...
    4 480 9000 1600 310000 40;...
    4 480 18000 3200 310000 40;...
    4 480 18000 800 310000 40;...
    4 480 18000 1600 620000 40;...
    4 480 18000 1600 155000 40;...
    4 530 18000 1600 310000 40;...
    4 430 18000 1600 310000 40];

row = size(setting,1);
data = cell([row 6]);

pause(2);
disp(' ~ Initialisierung abgeschlossen ~ ')
%% Simulation 1/4 Fzg
disp(' ~ Starte Simulationsprozess Einspurmodell ~ ')
disp(' ')
pause(2)

for i = 1:9
       
    %Simulation Setting
    t_sim = setting(i,1);
    m_vehicle_body = setting(i,2);
    c_suspension = setting(i,3);
    d_suspension = setting(i,4);
    c_tire = setting(i,5);
    m_wheel_body = setting(i,6);
    
    disp(strcat('Starte Simulation mit: '))
    disp(strcat('Aufbaumasse = ',num2str(m_vehicle_body),...
        ' kg | Federsteifigkeit = ',num2str(c_suspension),...
        ' N/m | Dämpferkonstante = ',num2str(d_suspension),...
        ' Ns/m | Reifensteifigkeit = ',num2str(c_tire),' N/m'));
    
    z1_0 = -((m_vehicle_body+m_wheel_body)*9.81)/c_tire;
    z2_0 = z1_0 - m_vehicle_body*9.81/c_suspension;
    
    sim A3_ViertelFzg.slx
    
    data{i,1} = z_Body_out;
    data{i,2} = z_wheel_out;
    data{i,3} = v_Body_out;
    data{i,4} = v_wheel_out;
    data{i,5} = a_Body_out;
    data{i,6} = a_wheel_out;
    
    pause(2)
end
    
%% Plotting 1/4 Fzg

disp(' > Initialisiere Datenauswertung ... ')
disp(' ')
disp(' ... erzeuge Ordnerstruktur ')
disp(' ')
pause(2)

% --- Ordnerstruktur
    mkdir('Plots/14Fzg_A3');

disp(' ... erzeuge Plots ')
disp(' ')
pause(2)
%Aufbauweg Plattenstoß
    h = figure('Color',[1 1 1],'Visible','off');
    hold on
    box on
    grid on
    plot(t_out,data{1,1},'black','LineWidth',0.5)
    plot(t_out,step,'red','LineWidth',0.5)
    xlabel ('Zeit in s','FontSize',10)
    ylabel ('Aufbaubewegung z_A in m','FontSize',10)
    le=legend('Location','NorthEast','Basis', 'Sprungantwort');
    set(le,'FontSize',8);
    set(gca,'Color',[1 1 1],'FontSize',10,'Ylim',[0 0.035]);
    hold off
    saveas(h,strcat('./Plots/14Fzg_A3/Step_Response_Plot_z_Body'),'png')
    
    %Radweg Plattenstoß
    h = figure('Color',[1 1 1],'Visible','off');
    hold on
    box on
    grid on
    plot(t_out,data{1,2},'black','LineWidth',0.5)
    plot(t_out,step,'red','LineWidth',0.5)
    xlabel ('Zeit in s','FontSize',10)
    ylabel ('Radweg z_R in m','FontSize',10)
    le=legend('Location','NorthEast','Basis', 'Sprungantwort');
    set(le,'FontSize',8);
    set(gca,'Color',[1 1 1],'FontSize',10,'Ylim',[0 0.035]);
    hold off
    saveas(h,strcat('./Plots/14Fzg_A3/Step_Response_Plot_z_wheel'),'png')
    
    %Aufbaugeschwindigkeit Plattenstoß
    h = figure('Color',[1 1 1],'Visible','off');
    hold on
    box on
    grid on
    plot(t_out,data{1,3},'black','LineWidth',0.5)
    xlabel ('Zeit in s','FontSize',10)
    ylabel ('Aufbaugeschwindigkeit in m/s','FontSize',10)
    le=legend('Location','NorthEast','Basis');
    set(le,'FontSize',8);
    set(gca,'Color',[1 1 1],'FontSize',10,'Ylim',[-0.08 0.12]);
    hold off
    saveas(h,strcat('./Plots/14Fzg_A3/Step_Response_Plot_v_Body'),'png')
    
    %Radgeschwindigkeit Plattenstoß
    h = figure('Color',[1 1 1],'Visible','off');
    hold on
    box on
    grid on
    plot(t_out,data{1,4},'black','LineWidth',0.5)
    xlabel ('Zeit in s','FontSize',10)
    ylabel ('Radgeschwindigkeit in m/s','FontSize',10)
    le=legend('Location','NorthEast','Basis');
    set(le,'FontSize',8);
    set(gca,'Color',[1 1 1],'FontSize',10,'Ylim',[-1 1.5]);
    hold off
    saveas(h,strcat('./Plots/14Fzg_A3/Step_Response_Plot_v_tire'),'png')
    
    %Aufbaubeschleunigung Plattenstoß
    h = figure('Color',[1 1 1],'Visible','off');
    hold on
    box on
    grid on
    plot(t_out,data{1,5},'black','LineWidth',0.5)
    xlabel ('Zeit in s','FontSize',10)
    ylabel ('Aufbaubeschleunigung in m/s^2','FontSize',10)
    le=legend('Location','NorthEast','Basis');
    set(le,'FontSize',8);
    set(gca,'Color',[1 1 1],'FontSize',10,'Ylim',[-2 5]);
    hold off
    saveas(h,strcat('./Plots/14Fzg_A3/Step_Response_Plot_a_body'),'png')
    
    %Radbeschleunigung Plattenstoß
    h = figure('Color',[1 1 1],'Visible','off');
    hold on
    box on
    grid on
    plot(t_out,data{1,6},'black','LineWidth',0.5)
    xlabel ('Zeit in s','FontSize',10)
    ylabel ('Radbeschleunigung in m/s^2','FontSize',10)
    le=legend('Location','NorthEast','Basis');
    set(le,'FontSize',8);
    set(gca,'Color',[1 1 1],'FontSize',10,'Ylim',[-100 200]);
    hold off
    saveas(h,strcat('./Plots/14Fzg_A3/Step_response_a_tire'),'png')
    

%Plots für die Parametervariation
%Aufbauweg, -geschwindigkeit, -beschleunigung
    
    %Aufbaubewegung Federvariation 
    h = figure('Color',[1 1 1],'Visible','off');
    hold on
    box on
    grid on
    plot(t_out,data{1,1},'black','LineWidth',0.5)
    plot(t_out,data{2,1},'red','LineWidth',0.5)
    plot(t_out,data{3,1},'green','LineWidth',0.5)
    xlabel ('Zeit in s','FontSize',10)
    ylabel ('Aufbaubewegung z_A in m','FontSize',10)
    le=legend('Location','NorthEast','Basis', '2*c suspension', '0.5*c suspension');
    set(le,'FontSize',8);
    set(gca,'Color',[1 1 1],'FontSize',10,'Ylim',[0 0.035]);
    hold off
    saveas(h,strcat('./Plots/14Fzg_A3/Plot_z_Body_c_suspension_variation'),'png')
    
    %Aufbaubewegung Dämpfervariation
     h = figure('Color',[1 1 1],'Visible','off');
    hold on
    box on
    grid on
    plot(t_out,data{1,1},'black','LineWidth',0.5)
    plot(t_out,data{4,1},'red','LineWidth',0.5)
    plot(t_out,data{5,1},'green','LineWidth',0.5)
    xlabel ('Zeit in s','FontSize',10)
    ylabel ('Aufbaubewegung z_A in m','FontSize',10)
    le=legend('Location','NorthEast','Basis','2*d suspension', '0.5*d suspension');
    set(le,'FontSize',8);
    set(gca,'Color',[1 1 1],'FontSize',10,'Ylim',[0 0.035]);
    hold off
    saveas(h,strcat('./Plots/14Fzg_A3/Plot_z_Body_d_suspension_variation'),'png')
    
    %Aufbaubewegung Reifensteifigkeitvariation
    h = figure('Color',[1 1 1],'Visible','off');
    hold on
    box on
    grid on
    plot(t_out,data{1,1},'black','LineWidth',0.5)
    plot(t_out,data{6,1},'red','LineWidth',0.5)
    plot(t_out,data{7,1},'green','LineWidth',0.5)
    xlabel ('Zeit in s','FontSize',10)
    ylabel ('Aufbaubewegung z_A in m','FontSize',10)
    le=legend('Location','NorthEast','Basis','2*c tire', '0.5*c tire');
    set(le,'FontSize',8);
    set(gca,'Color',[1 1 1],'FontSize',10,'Ylim',[0 0.035]);
    hold off
    saveas(h,strcat('./Plots/14Fzg_A3/Plot_z_Body_c_tire_variation'),'png')    


%Aufbaugeschwindigkeit

    
    %Aufbaugeschwindigkeit Federvariation 
    h = figure('Color',[1 1 1],'Visible','off');
    hold on
    box on
    grid on
    plot(t_out,data{1,3},'black','LineWidth',0.5)
    plot(t_out,data{2,3},'red','LineWidth',0.5)
    plot(t_out,data{3,3},'green','LineWidth',0.5)
    xlabel ('Zeit in s','FontSize',10)
    ylabel ('Aufbaugeschwindigkeit v_A in m/s','FontSize',10)
    le=legend('Location','NorthEast','Basis', '2*c suspension', '0.5*c suspension');
    set(le,'FontSize',8);
    set(gca,'Color',[1 1 1],'FontSize',10,'Ylim',[-0.2 0.2]);
    hold off
    saveas(h,strcat('./Plots/14Fzg_A3/Plot_v_Body_c_suspension_variation'),'png')
    
    %Aufbaugeschwindigkeit Dämpfervariation
    h = figure('Color',[1 1 1],'Visible','off');
    hold on
    box on
    grid on
    plot(t_out,data{1,3},'black','LineWidth',0.5)
    plot(t_out,data{4,3},'red','LineWidth',0.5)
    plot(t_out,data{5,3},'green','LineWidth',0.5)
    xlabel ('Zeit in s','FontSize',10)
    ylabel ('Aufbaugeschwindigkeit v_A in m/s','FontSize',10)
    le=legend('Location','NorthEast','Basis','2*d suspension', '0.5*d suspension');
    set(le,'FontSize',8);
    set(gca,'Color',[1 1 1],'FontSize',10,'Ylim',[-0.2 0.2]);
    hold off
    saveas(h,strcat('./Plots/14Fzg_A3/Plot_v_Body_d_suspension_variation'),'png')
    
    %Aufbaugeschwindigkeit Reifensteifigkeitvariation
    h = figure('Color',[1 1 1],'Visible','off');
    hold on
    box on
    grid on
    plot(t_out,data{1,3},'black','LineWidth',0.5)
    plot(t_out,data{6,3},'red','LineWidth',0.5)
    plot(t_out,data{7,3},'green','LineWidth',0.5)
    xlabel ('Zeit in s','FontSize',10)
    ylabel ('Aufbaugeschwindigkeit v_A in m/s','FontSize',10)
    le=legend('Location','NorthEast','Basis','2*c tire', '0.5*c tire');
    set(le,'FontSize',8);
    set(gca,'Color',[1 1 1],'FontSize',10,'Ylim',[-0.2 0.2]);
    hold off
    saveas(h,strcat('./Plots/14Fzg_A3/Plot_v_Body_c_tire_variation'),'png') 
    
    %Aufbaubeschleunigung

    %Aufbaubeschleunigung Federvariation 
    h = figure('Color',[1 1 1],'Visible','off');
    hold on
    box on
    grid on
    plot(t_out,data{1,5},'black','LineWidth',0.5)
    plot(t_out,data{2,5},'red','LineWidth',0.5)
    plot(t_out,data{3,5},'green','LineWidth',0.5)
    xlabel ('Zeit in s','FontSize',10)
    ylabel ('Aufbaubeschleunigung a_A in m/s^2','FontSize',10)
    le=legend('Location','NorthEast','Basis', '2*c suspension', '0.5*c suspension');
    set(le,'FontSize',8);
    set(gca,'Color',[1 1 1],'FontSize',10,'Ylim',[-3 8]);
    hold off
    saveas(h,strcat('./Plots/14Fzg_A3/Plot_a_Body_c_suspension_variation'),'png')
    
    %Aufbaubeschleunigung Dämpfervariation
    h = figure('Color',[1 1 1],'Visible','off');
    hold on
    box on
    grid on
    plot(t_out,data{1,5},'black','LineWidth',0.5)
    plot(t_out,data{4,5},'red','LineWidth',0.5)
    plot(t_out,data{5,5},'green','LineWidth',0.5)
    xlabel ('Zeit in s','FontSize',10)
    ylabel ('Aufbaubeschleunigung a_A in m/s^2','FontSize',10)
    le=legend('Location','NorthEast','Basis','2*d suspension', '0.5*d suspension');
    set(le,'FontSize',8);
    set(gca,'Color',[1 1 1],'FontSize',10,'Ylim',[-3 8]);
    hold off
    saveas(h,strcat('./Plots/14Fzg_A3/Plot_a_Body_d_suspension_variation'),'png')
    
    %Aufbaubeschleunigung Reifensteifigkeitvariation
    h = figure('Color',[1 1 1],'Visible','off');
    hold on
    box on
    grid on
    plot(t_out,data{1,5},'black','LineWidth',0.5)
    plot(t_out,data{6,5},'red','LineWidth',0.5)
    plot(t_out,data{7,5},'green','LineWidth',0.5)
    xlabel ('Zeit in s','FontSize',10)
    ylabel ('Aufbaubeschleunigung a_A in m/s^2','FontSize',10)
    le=legend('Location','NorthEast','Basis','2*c tire', '0.5*c tire');
    set(le,'FontSize',8);
    set(gca,'Color',[1 1 1],'FontSize',10,'Ylim',[-5 8]);
    hold off
    saveas(h,strcat('./Plots/14Fzg_A3/Plot_a_Body_c_tire_variation'),'png') 

%Radweg, -geschwindigkeit, -beschleunigung
    
    %Radweg Federvariation 
    h = figure('Color',[1 1 1],'Visible','off');
    hold on
    box on
    grid on
    plot(t_out,data{1,2},'black','LineWidth',0.5)
    plot(t_out,data{2,2},'red','LineWidth',0.5)
    plot(t_out,data{3,2},'green','LineWidth',0.5)
    xlabel ('Zeit in s','FontSize',10)
    ylabel ('Radweg z_R in m','FontSize',10)
    le=legend('Location','NorthEast','Basis', '2*c suspension', '0.5*c suspension');
    set(le,'FontSize',8);
    set(gca,'Color',[1 1 1],'FontSize',10,'Ylim',[0 0.035]);
    hold off
    saveas(h,strcat('./Plots/14Fzg_A3/Plot_z_tire_c_suspension_variation'),'png')
    
    %Radweg Dämpfervariation
    h = figure('Color',[1 1 1],'Visible','off');
    hold on
    box on
    grid on
    plot(t_out,data{1,2},'black','LineWidth',0.5)
    plot(t_out,data{4,2},'red','LineWidth',0.5)
    plot(t_out,data{5,2},'green','LineWidth',0.5)
    xlabel ('Zeit in s','FontSize',10)
    ylabel ('Radweg z_R in m','FontSize',10)
    le=legend('Location','NorthEast','Basis','2*d suspension', '0.5*d suspension');
    set(le,'FontSize',8);
    set(gca,'Color',[1 1 1],'FontSize',10,'Ylim',[0 0.035]);
    hold off
    saveas(h,strcat('./Plots/14Fzg_A3/Plot_z_tire_d_suspension_variation'),'png')
    
    %Radweg Reifensteifigkeitvariation
    h = figure('Color',[1 1 1],'Visible','off');
    hold on
    box on
    grid on
    plot(t_out,data{1,2},'black','LineWidth',0.5)
    plot(t_out,data{6,2},'red','LineWidth',0.5)
    plot(t_out,data{7,2},'green','LineWidth',0.5)
    xlabel ('Zeit in s','FontSize',10)
    ylabel ('Radweg z_R in m','FontSize',10)
    le=legend('Location','NorthEast','Basis','2*c tire', '0.5*c tire');
    set(le,'FontSize',8);
    set(gca,'Color',[1 1 1],'FontSize',10,'Ylim',[0 0.035]);
    hold off
    saveas(h,strcat('./Plots/14Fzg_A3/Plot_z_tire_c_tire_variation'),'png')    


%Radgeschwindigkeit

    
    %Radgeschwindigkeit Federvariation 
    h = figure('Color',[1 1 1],'Visible','off');
    hold on
    box on
    grid on
    plot(t_out,data{1,4},'black','LineWidth',0.5)
    plot(t_out,data{2,4},'red','LineWidth',0.5)
    plot(t_out,data{3,4},'green','LineWidth',0.5)
    xlabel ('Zeit in s','FontSize',10)
    ylabel ('Radgeschwindigkeit v_R in m/s','FontSize',10)
    le=legend('Location','NorthEast','Basis', '2*c suspension', '0.5*c suspension');
    set(le,'FontSize',8);
    set(gca,'Color',[1 1 1],'FontSize',10,'Ylim',[-1.5 1.5]);
    hold off
    saveas(h,strcat('./Plots/14Fzg_A3/Plot_v_tire_c_suspension_variation'),'png')
    
    %Radgeschwindigkeit Dämpfervariation
    h = figure('Color',[1 1 1],'Visible','off');
    hold on
    box on
    grid on
    plot(t_out,data{1,4},'black','LineWidth',0.5)
    plot(t_out,data{4,4},'red','LineWidth',0.5)
    plot(t_out,data{5,4},'green','LineWidth',0.5)
    xlabel ('Zeit in s','FontSize',10)
    ylabel ('Radgeschwindigkeit v_R in m/s','FontSize',10)
    le=legend('Location','NorthEast','Basis','2*d suspension', '0.5*d suspension');
    set(le,'FontSize',8);
    set(gca,'Color',[1 1 1],'FontSize',10,'Ylim',[-1.5 1.5]);
    hold off
    saveas(h,strcat('./Plots/14Fzg_A3/Plot_v_tire_d_suspension_variation'),'png')
    
    %Radgeschwindigkeit Reifensteifigkeitvariation
    h = figure('Color',[1 1 1],'Visible','off');
    hold on
    box on
    grid on
    plot(t_out,data{1,4},'black','LineWidth',0.5)
    plot(t_out,data{2,4},'red','LineWidth',0.5)
    plot(t_out,data{3,4},'green','LineWidth',0.5)
    xlabel ('Zeit in s','FontSize',10)
    ylabel ('Radgeschwindigkeit v_R in m/s','FontSize',10)
    le=legend('Location','NorthEast','Basis','2*c tire', '0.5*c tire');
    set(le,'FontSize',8);
    set(gca,'Color',[1 1 1],'FontSize',10,'Ylim',[-1.5 1.5]);
    hold off
    saveas(h,strcat('./Plots/14Fzg_A3/Plot_v_tire_c_tire_variation'),'png') 
    
    %Radbeschleunigung

    
    %Radbeschleunigung Federvariation 
    h = figure('Color',[1 1 1],'Visible','off');
    hold on
    box on
    grid on
    plot(t_out,data{1,6},'black','LineWidth',0.5)
    plot(t_out,data{2,6},'red','LineWidth',0.5)
    plot(t_out,data{3,6},'green','LineWidth',0.5)
    xlabel ('Zeit in s','FontSize',10)
    ylabel ('Radbeschleunigung a_R in m/s^2','FontSize',10)
    le=legend('Location','NorthEast','Basis', '2*c suspension', '0.5*c suspension');
    set(le,'FontSize',8);
    set(gca,'Color',[1 1 1],'FontSize',10,'Ylim',[-200 200]);
    hold off
    saveas(h,strcat('./Plots/14Fzg_A3/Plot_a_tire_c_suspension_variation'),'png')
    
    %Reifenbeschleunigung Dämpfervariation
    h = figure('Color',[1 1 1],'Visible','off');
    hold on
    box on
    grid on
    plot(t_out,data{1,6},'black','LineWidth',0.5)
    plot(t_out,data{4,6},'red','LineWidth',0.5)
    plot(t_out,data{5,6},'green','LineWidth',0.5)
    xlabel ('Zeit in s','FontSize',10)
    ylabel ('Radbeschleunigung a_R in m/s^2','FontSize',10)
    le=legend('Location','NorthEast','Basis','2*d suspension', '0.5*d suspension');
    set(le,'FontSize',8);
    set(gca,'Color',[1 1 1],'FontSize',10,'Ylim',[-200 200]);
    hold off
    saveas(h,strcat('./Plots/14Fzg_A3/Plot_a_tire_d_suspension_variation'),'png')
    
    %Radbeschleunigung Reifensteifigkeitvariation
    h = figure('Color',[1 1 1],'Visible','off');
    hold on
    box on
    grid on
    plot(t_out,data{1,6},'black','LineWidth',0.5)
    plot(t_out,data{6,6},'red','LineWidth',0.5)
    plot(t_out,data{7,6},'green','LineWidth',0.5)
    xlabel ('Zeit in s','FontSize',10)
    ylabel ('Radbeschleunigung a_R in m/s^2','FontSize',10)
    le=legend('Location','NorthEast','Basis','2*c tire', '0.5*c tire');
    set(le,'FontSize',8);
    set(gca,'Color',[1 1 1],'FontSize',10,'Ylim',[-200 200]);
    hold off
    saveas(h,strcat('./Plots/14Fzg_A3/Plot_a_tire_c_tire_variation'),'png') 
    
    %Variation des Aufbaugewichtes
    %Aufbauweg 
    h = figure('Color',[1 1 1],'Visible','off');
    hold on
    box on
    grid on
    plot(t_out,data{1,1},'black','LineWidth',0.5)
    plot(t_out,data{8,1},'red','LineWidth',0.5)
    plot(t_out,data{9,1},'green','LineWidth',0.5)
    xlabel ('Zeit in s','FontSize',10)
    ylabel ('Aufbaubewegung z_A in m','FontSize',10)
    le=legend('Location','NorthEast','Basis','Aufbau +50kg', 'Aufbau -50kg');
    set(le,'FontSize',8);
    set(gca,'Color',[1 1 1],'FontSize',10,'Ylim',[0 0.035]);
    hold off
    saveas(h,strcat('./Plots/14Fzg_A3/variation_mass_Plot_z_Body'),'png')
    
    %Radweg 
    h = figure('Color',[1 1 1],'Visible','off');
    hold on
    box on
    grid on
    plot(t_out,data{1,2},'black','LineWidth',0.5)
    plot(t_out,data{8,2},'red','LineWidth',0.5)
    plot(t_out,data{9,2},'green','LineWidth',0.5)
    xlabel ('Zeit in s','FontSize',10)
    ylabel ('Radweg z_R in m','FontSize',10)
    le=legend('Location','NorthEast','Basis','Aufbau +50kg', 'Aufbau -50kg');
    set(le,'FontSize',8);
    set(gca,'Color',[1 1 1],'FontSize',10,'Ylim',[0 0.035]);
    hold off
    saveas(h,strcat('./Plots/14Fzg_A3/variation_mass_Plot_z_wheel'),'png')
    
    %Aufbaugeschwindigkeit 
    h = figure('Color',[1 1 1],'Visible','off');
    hold on
    box on
    grid on
    plot(t_out,data{1,3},'black','LineWidth',0.5)
    plot(t_out,data{8,3},'red','LineWidth',0.5)
    plot(t_out,data{9,3},'green','LineWidth',0.5)
    xlabel ('Zeit in s','FontSize',10)
    ylabel ('Aufbaugeschwindigkeit in m/s','FontSize',10)
    le=legend('Location','NorthEast','Basis','Aufbau +50kg', 'Aufbau -50kg');
    set(le,'FontSize',8);
    set(gca,'Color',[1 1 1],'FontSize',10,'Ylim',[-0.08 0.12]);
    hold off
    saveas(h,strcat('./Plots/14Fzg_A3/variation_mass_Plot_v_Body'),'png')
    
    %Radgeschwindigkeit 
    h = figure('Color',[1 1 1],'Visible','off');
    hold on
    box on
    grid on
    plot(t_out,data{1,4},'black','LineWidth',0.5)
    plot(t_out,data{8,4},'red','LineWidth',0.5)
    plot(t_out,data{9,4},'green','LineWidth',0.5)
    xlabel ('Zeit in s','FontSize',10)
    ylabel ('Radgeschwindigkeit in m/s','FontSize',10)
    le=legend('Location','NorthEast','Basis','Aufbau +50kg', 'Aufbau -50kg');
    set(le,'FontSize',8);
    set(gca,'Color',[1 1 1],'FontSize',10,'Ylim',[-1 1.5]);
    hold off
    saveas(h,strcat('./Plots/14Fzg_A3/variation_mass_Plot_v_tire'),'png')
    
    %Aufbaubeschleunigung 
    h = figure('Color',[1 1 1],'Visible','off');
    hold on
    box on
    grid on
    plot(t_out,data{1,5},'black','LineWidth',0.5)
    plot(t_out,data{8,5},'red','LineWidth',0.5)
    plot(t_out,data{9,5},'green','LineWidth',0.5)
    xlabel ('Zeit in s','FontSize',10)
    ylabel ('Aufbaubeschleunigung in m/s^2','FontSize',10)
    le=legend('Location','NorthEast','Basis','Aufbau +50kg', 'Aufbau -50kg');
    set(le,'FontSize',8);
    set(gca,'Color',[1 1 1],'FontSize',10,'Ylim',[-2 5]);
    hold off
    saveas(h,strcat('./Plots/14Fzg_A3/variation_mass_Plot_a_body'),'png')
    
    %Radbeschleunigung 
    h = figure('Color',[1 1 1],'Visible','off');
    hold on
    box on
    grid on
    plot(t_out,data{1,6},'black','LineWidth',0.5)
    plot(t_out,data{8,6},'red','LineWidth',0.5)
    plot(t_out,data{9,6},'green','LineWidth',0.5)
    xlabel ('Zeit in s','FontSize',10)
    ylabel ('Radbeschleunigung in m/s^2','FontSize',10)
    le=legend('Location','NorthEast','Basis','Aufbau +50kg', 'Aufbau -50kg');
    set(le,'FontSize',8);
    set(gca,'Color',[1 1 1],'FontSize',10,'Ylim',[-100 200]);
    hold off
    saveas(h,strcat('./Plots/14Fzg_A3/variation_mass_a_tire'),'png')

disp(' ')
disp(' ~ Datenauswertung abgeschlossen ~ ')
disp(' ')
disp(' > öffne Ergebnisauswertung ')
winopen(pwd)
disp(' ')
pause(2)