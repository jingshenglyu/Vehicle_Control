%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Technische Universität Berlin
% Fakultät Verkehrs-  und Maschinensystem 
% Fachgbiet Kraffahrzeuge
% M.Sc. Osama Al-Saidi
% 
% Fahrzeugregelung: Übung - Einführung in Matlab/Simulink
% Aufgabe: Lösung von DGL (Math. Pendel)
% Datum: 21.10.2014
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% [t, loesung] = ode23(@pendgl,[0,20],[pi/4,0]);
% plot(t,loesung(:,1),'r-',t,loesung(:,2),'g--')


function [alphadot]= pendgl(t,alpha)
%Funktion pendgl
%Aufruf über: [alphadot]= pendgl(t,alpha)
%Beispiel für die Lösung von DGL's unter MATLAB mit ode23
%Die vorliegende Funktion definiert die DGL des mathem. Pendels
%Damit MATLAB damit ungehen kann, muss die DGL 2.Ord. vorher in ein
%System von DGL 1.Ordnung überführt werden
%% Voreinstellung der Konstanten
l=10;       %Pendellänge
g=9.81;     %Erdbeschleunigung
            %Diese Parameter können auch als weitere Parameter an 
            %die Definitionsfunktion der DGL'en übergeben werden.
%% Vorinitialisierung
alphadot=[0; 0];
%% Darstellung der DGL
alphadot(1)=alpha(2);               %erste Gleichung 1.Ordnung
alphadot(2)=-(g/l)*sin(alpha(1));   %zweite Gleichung 1.Ordnung?
end
[t, loesung] = ode23(@pendgl,[0,20],[pi/4,0]);
plot(t,loesung(:,1),'r-',t,loesung(:,2),'g--')
