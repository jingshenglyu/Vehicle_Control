close all;
clear all;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%-----------sinus-------------------------------------%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ST_einspur_parameter_sinus;

%-----------sinus ohne ESP----------------------------%%
sw_ESP=0;
sim('ST_ESP_ESM2015_VMz02015a.slx');

psi_p_sinus_ohne_esp = psi_p;
beta_sinus_ohne_esp  = beta;

v_sinus_ohne_esp     = v;
pos_x_sinus_ohne_esp = pos_x;
pos_y_sinus_ohne_esp = pos_y;

%-----------sinus mit ESP-----------------------------%%
sw_ESP=1;
sim('ST_ESP_ESM2015_VMz02015a.slx');

psi_p_sinus_mit_esp = psi_p;
beta_sinus_mit_esp  = beta;
psi_p_filter_sinus  = psi_p_filter;
psi_p_soll_sinus    = psi_p_soll;

v_sinus_mit_esp     = v;
pos_x_sinus_mit_esp = pos_x;
pos_y_sinus_mit_esp = pos_y;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%-----------sprung-------------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ST_einspur_parameter_sprung;

%------------sprung ohne ESP---------------------------%
sw_ESP=0;
sim('ST_ESP_ESM2015_VMz02015a.slx');

psi_p_sprung_ohne_esp = psi_p;
beta_sprung_ohne_esp  = beta;

v_sprung_ohne_esp     = v;
pos_x_sprung_ohne_esp = pos_x;
pos_y_sprung_ohne_esp = pos_y;

%------------sprung mit ESP----------------------------%
sw_ESP=1;
sim('ST_ESP_ESM2015_VMz02015a.slx');

psi_p_sprung_mit_esp = psi_p;
beta_sprung_mit_esp  = beta;
psi_p_filter_sprung  = psi_p_filter;
psi_p_soll_sprung    = psi_p_soll;

v_sprung_mit_esp     = v;
pos_x_sprung_mit_esp = pos_x;
pos_y_sprung_mit_esp = pos_y;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%------------plot-------------------------------------%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(1)
plot(time,psi_p_sinus_ohne_esp, time, psi_p_sinus_mit_esp,'--r','linewidth',2.5)
legend('Gierrate-sinus-ohne-esp','Gierrate-sinus-mit-esp')
grid on
title('Vergleich der Gierraten bei Sinusfahrt')
xlabel('Zeit in s')
ylabel('Gierrate in rad/s');

figure(2)
plot(time,beta_sinus_ohne_esp, time, beta_sinus_mit_esp, '--r','linewidth', 2.5)
legend('Schwimmwinkel-sinus-ohne-esp','Schwimmwinkel-sinus-mit-esp')
grid on
title('Vergleich der Schwimmwinkel bei Sinusfahrt')
xlabel('Zeit in s')
ylabel('Schwimmwinkel in rad');

figure(3)
plot(time,psi_p_sprung_ohne_esp, time, psi_p_sprung_mit_esp,'--r','linewidth',2.5)
legend('Gierrate-sprung-ohne-esp','Gierrate-sprung-mit-esp')
grid on
title('Vergleich der Gierraten bei Sprungfahrt')
xlabel('Zeit in s')
ylabel('Gierrate in rad/s');

figure(4)
plot(time,beta_sprung_ohne_esp, time, beta_sprung_mit_esp,'--r','linewidth',2.5)
legend('Schwimmwinkel-sprung-ohne-esp','Schwimmwinkel-sprung-mit-esp')
grid on
title('Vergleich der Schwimmwinkel bei Sprungfahrt')
xlabel('Zeit in s')
ylabel('Schwimmwinkel in rad');

figure(5)
plot(time,psi_p_filter_sinus, time, psi_p_soll_sinus,'--r','linewidth',2.5)
legend('Gierrate-Ist-sinus','Gierrate-Soll-sinus')
grid on
title('Vergleich der Gierrate-Soll und Gierrate-Ist bei Sinusfahrt')
xlabel('Zeit in s')
ylabel('Gierrate in rad');

figure(6)
plot(time,psi_p_filter_sprung, time, psi_p_soll_sprung,'--r','linewidth',2.5)
legend('Gierrate-Ist-sprung','Gierrate-Soll-sprung')
grid on
title('Vergleich der Gierrate-Soll und Gierrate-Ist bei Sprungfahrt')
xlabel('Zeit in s')
ylabel('Gierrate in rad');

figure(7)
plot(pos_x_sinus_ohne_esp,pos_y_sinus_ohne_esp, pos_x_sinus_mit_esp,pos_y_sinus_mit_esp,'--r','linewidth',2.5)
legend('Fahrzeugposition ohne ESP','Fahrzeugposition mit ESP')
grid on
title('Vergleich der Fahrzeugpositionen bei Sinusfahrt')
xlabel('x in m')
ylabel('y in m');

figure(8)
plot(pos_x_sprung_ohne_esp,pos_y_sprung_ohne_esp, pos_x_sprung_mit_esp,pos_y_sprung_mit_esp,'--r','linewidth',2.5)
legend('Fahrzeugposition ohne ESP','Fahrzeugposition mit ESP')
grid on
title('Vergleich der Fahrzeugpositionen bei Sprungfahrt')
xlabel('x in m')
ylabel('y in m');

figure(9)
plot(time,v_sinus_ohne_esp, time,v_sinus_mit_esp,'--r','linewidth',2.5)
legend('Fahrzeuggeschwindigkeit ohne ESP','Fahrzeuggeschwindigkeit mit ESP')
grid on
title('Vergleich der Fahrzeuggeschwindigkeiten bei Sinusfahrt')
xlabel('Zeit in s')
ylabel('Fahrzeuggeschwindigkeit in m/s');

figure(10)
plot(time,v_sprung_ohne_esp, time,v_sprung_mit_esp,'--r','linewidth',2.5)
legend('Fahrzeuggeschwindigkeit ohne ESP','Fahrzeuggeschwindigkeit mit ESP')
grid on
title('Vergleich der Fahrzeuggeschwindigkeiten bei Sprungfahrt')
xlabel('Zeit in s')
ylabel('Fahrzeuggeschwindigkeit in m/s');
