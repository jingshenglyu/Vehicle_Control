%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Technische Universit�t Berlin
% Fakult�t Verkehrs-  und Maschinensystem 
% Fachgbiet Kraffahrzeuge
% M.Sc. Osama Al-Saidi
% 
% Fahrzeugregelung: �bung - Einf�hrung in Matlab/Simulink
% Aufgabe: Einheitssprung
% Datum: 21.10.2014
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [sprng]=u1(t)      	%Funktion u1
                            	%Aufruf �ber: [sprng]=u1(t)
sprng=t>=0;                 