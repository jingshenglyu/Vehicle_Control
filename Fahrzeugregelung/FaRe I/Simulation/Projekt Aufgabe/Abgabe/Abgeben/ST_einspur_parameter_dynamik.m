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
disp('Parameter im Workspace werden gelöscht')
clear all;


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

ESP = 0

sim('ST_ESP_ESM_2016a');

%schlupf
sv = -(v - omega_v * rad_r ) ./ v;
sh = -(v - omega_h * rad_r) ./ v;

%%%%%%%%%%%%%%%% plot %%%%%%%%%%%%%%%%%%%%
figure(1)
plot(time,sv,'k',time,sh,'r','LineWidth',1.2)
grid on
xlabel('Zeit [s]');
ylabel('Schlupf [-]');
title('Schlupf');
legend('sv','sh');
xlim([0 6])
ylim([-1 1])

figure(2)
plot(pos_x,pos_y,'k','LineWidth',1.2)
grid on
xlabel('x [m]');
ylabel('y [m]');
title('Bahnkurve');
legend('Pfad');

figure(3)
plot(time,Fxv,'k',time,Fxh,'r','LineWidth',1.2)
grid on
xlabel('Zeit [s]');
ylabel('Reifenlaengskraft [N]');
title('Reifenlaengskraft');
legend('Fxv','Fxh');
xlim([0 6])