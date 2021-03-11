%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Technische Universit�t Berlin
% Fakult�t Verkehrs-  und Maschinensystem 
% Fachgbiet Kraffahrzeuge
% M.Sc. Osama Al-Saidi
% 
% Fahrzeugregelung: �bung - Einf�hrung in Matlab/Simulink
% Aufgabe: L�sung von DGL (Tiefpass)
% Datum: 21.10.2014
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [udot]=rckomb(t,u)          % Funktion rckomb
                                     % Aufruf �ber: [udot]=rckomb(t,u)
%Die vorliegende Funktion definiert die DGL einer RC-Kombination mit
% Spannungsquelle u1(t)

% Parameter
R=10000;                             % Widerstand R
C=4.7*10e-6;                         % Kapazit�t des Kondensators C
udot=0;                              % Vorinitialisierung

% DGL
udot=-(1/(R*C))*u + (1/(R*C))*u1(t); % Die Gleichung 1.Ordnung
