%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Technische Universität Berlin
% Fakultät Verkehrs-  und Maschinensystem 
% Fachgbiet Kraffahrzeuge
% M.Sc. Osama Al-Saidi
% 
% Fahrzeugregelung: Übung - Einspurmodell
% File: Plot  
% Datum: 24.11.2014
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% plot results
figure;
subplot(3,3,1);
plot(time,sim_beta*180/pi);
title('Schwimmwinkelverlauf in °');grid on;
subplot(3,3,2);
plot(time,sim_psip*180/pi);
title('Gierrate in °');grid on;
subplot(3,3,3);
plot(sim_x',sim_y');
title('Fahrzeugbahn');
axis equal;grid on;
subplot(3,3,4);
plot(time,sim_Fyf);
title('Querkraft (vorne)');grid on;
subplot(3,3,5);
plot(time,sim_Fyr);
title('Querkraft (hinten)');grid on;
subplot(3,3,6);
plot(time,sim_delta_r*180/pi);
title('Lenkwinkel (Rad) in °');grid on;
subplot(3,3,7);
plot(time,sim_alphaf*180/pi);
title('Schräglaufwinkel (vorne) in °');grid on;
subplot(3,3,8);
plot(time,sim_alphar*180/pi);
title('Schräglaufwinkel (hinten) in °');grid on;
