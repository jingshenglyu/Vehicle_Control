%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Technische Universität Berlin
% Fakultät Verkehrs-  und Maschinensystem 
% Fachgbiet Kraffahrzeuge
% M.Sc. Osama Al-Saidi
% 
% Fahrzeugregelung: Übung - Einspurmodell
% File: Steuerung 
% Datum: 24.11.2014
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%
clear all;
% close all;
clc;


%%%%%%%%%%%%%%%%%%%%%%%%% Modellparameter %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Fahrzeug- und Umgebungsparameter
fzg_m = 1770;       % Masse des Fahrzeuges in kg mit 2 Personen
r_dyn = 0.33;       % Reifenhalbmesser in m
l = 2.709;          % Radstand
lh = 1.75;          % Schwerpunktslage zur Hinterachse
lv = (l-lh);        % Schwerpunktslage zur Hinterachse
g = 9.81;           % Graitationskraft
fzg_Jz = 1752;      % Massenträgheit um Gierachse

%
% Reifenparameter
% simple Pacejka
Bf = 10.96;                 % Parameter B Pacejka          
Br = 12.67;                 % Parameter B Pacejka 
Cf = 1.1;                   % Parameter C Pacejka 
Cr = 1.3;                   % Parameter C Pacejka 
Fzeta0 = 8000;              % Peak Value in N
Fzetaf = fzg_m*g*lh/l;      % tire normal force front
Fzetar = fzg_m*g*(l-lh)/l;  % tire normal force rear
mu = 1.05;                  % frition coefficient 
k_Fzeta = 0.25;             % Degressivitätsfaktor

%
% linear tire model
%
cf = 60000;         % tire cornering stiffness (front)
cr = 75000;         % tire cornering stiffness (rear)

%
% Lenkungsparameter
% 
% nr = 0.02;          % Reifennachlauf
% nk = 0.06;          % Konstruktiver Radnachlauf
iL = 14;            % transformation steering angle to tire angle

%%%%%%%%%%%%%%%%%%%%%%%%% Simulationsparameter %%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
speed = 120/3.6;                 % vehicle speed [m/s]

tire_choice = 1;            % 0 ... linear tire model
                            % 1 ... simple Pacejka model

steering_angle = 80*pi/180; % steering angle in [rad]

manoever_choice = 1;        % 0 ... sinus
                            % 1 ... constant
sinus_freq = 1/6;           % Frequenz Sinusmanoever [hz]

SIM_time = 20;              % simulation time

lh_var = [1.5; 1.75 ; 2];
for  j = 1:1:3 
    for  i = 1:1:20
        speed = i;
        lh = lh_var(j);
        sim('lyyuEinspurmodell_ISIS.slx')
        Gier(j,i) = Gierverstaerkung(5000,1);
    end
    v_gier = linspace(1,20,20);
    plot(v_gier,Gier(j,:))
    title('Gierverstaerkung')
    grid on
    xlabel('v in [m/s]')
    ylabel('Gierverstaerkung in [1/s]')
    hold on 
end

legend('lh=1.5m','lh=1.75m','lh=2.0m')


