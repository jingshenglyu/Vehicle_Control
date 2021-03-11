%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Technische Universität Berlin
% Fakultät Verkehrs-  und Maschinensystem 
% Fachgbiet Kraffahrzeuge
% M.Sc. Osama Al-Saidi
% 
% Fahrzeugregelung: Übung - Einführung in Matlab/Simulink
% Aufgabe: Mathematische Operationen
% Datum: 21.10.2014
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
clc
% Elementare mathematische Operationen
B= [1 2 3; 4 5 6; 7 8 9]
Z=[1 2 3]
B'
size(B)
size(Z)
sum(B)
min(B)
max(B)

% Inverse, Determinante und Eigenwerte einer Matrix
A =[3 1 0; 1 2 -1; 0 -1 1]
inv(A)     % inverse matrix
det(A)     % determinant
eig(A)     % eigenvalue
