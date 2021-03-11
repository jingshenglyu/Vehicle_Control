%%%%%%%%%%%%%%%
% Jingsheng Lyu
%%%%%%%%%%%%%%%
clear
clc
%%
load('Motorkennfeld.mat')

%%
c_w = 0.33; %Luftwiderstandsbeiwert
A = 2.51; % Stirnflaeche
k_r = 0.015; %Rollwiderstandszahl
r = 0.33; % Radradius
roh = 1.22; % Luftdichte
m = 1770; % Fahrzeugmasse
g = 9.81; % Gewicht-Beschleunigung
m_rot = 48.3; % reduzierte Masse
i_G = 2.22; % Getriebeuebersetzung
i_D = 3.684; % Differentialuebersetzung

q = 0.3; % Definieren Steigungswinkel in Grad

% Definieren Drosselklappenstellungen = 0.2

sim('XX2015.slx')