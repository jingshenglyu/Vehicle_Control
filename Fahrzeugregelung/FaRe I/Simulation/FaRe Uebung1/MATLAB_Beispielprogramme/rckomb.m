%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Technische Universität Berlin
% Fakultät Verkehrs-  und Maschinensystem 
% Fachgbiet Kraffahrzeuge
% M.Sc. Osama Al-Saidi
% 
% Fahrzeugregelung: Übung - Einführung in Matlab/Simulink
% Aufgabe: Lösung von DGL (Tiefpass)
% Datum: 21.10.2014
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [udot]=rckomb(t,u)          % Funktion rckomb
                                     % Aufruf über: [udot]=rckomb(t,u)
%Die vorliegende Funktion definiert die DGL einer RC-Kombination mit
% Spannungsquelle u1(t)

% Parameter
R=10000;                             % Widerstand R
C=4.7*10e-6;                         % Kapazität des Kondensators C
udot=0;                              % Vorinitialisierung

% DGL
udot=-(1/(R*C))*u + (1/(R*C))*u1(t); % Die Gleichung 1.Ordnung
