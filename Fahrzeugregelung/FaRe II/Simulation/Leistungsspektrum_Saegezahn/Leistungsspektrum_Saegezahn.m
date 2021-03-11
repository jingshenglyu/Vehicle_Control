% ########################################################################
% Fahrzeugregelung II, M.Sc. Jochen Gallep
% Übung 1
% Leistungsspektrum Sägezahn
% #######################################################################

syms x 

%%%%%%%%%%%%%%%%%%%%%% Ermittlung der Fourierkoeffizienten %%%%%%%%%%%%%%%%%%%%%

L=1; % Periodenlaenge in m
h=0.001; % halbe Höhe des Saegezahns in m


dz_1= (2/L*h*2/L/1*int(sin(1*2*pi*x/L)*x, x, -L/2, L/2))
dz_2= (2/L*h*2/L/1*int(sin(2*2*pi*x/L)*x, x, -L/2, L/2))
dz_3= (2/L*h*2/L/1*int(sin(3*2*pi*x/L)*x, x, -L/2, L/2))
dz_4= (2/L*h*2/L/1*int(sin(4*2*pi*x/L)*x, x, -L/2, L/2))
dz_5= (2/L*h*2/L/1*int(sin(5*2*pi*x/L)*x, x, -L/2, L/2))
dz_6= (2/L*h*2/L/1*int(sin(6*2*pi*x/L)*x, x, -L/2, L/2))
dz_7= (2/L*h*2/L/1*int(sin(7*2*pi*x/L)*x, x, -L/2, L/2))


ome_weg(1)= 2*pi/L*1;
dz_r(1)= double(2/L*h*2/L/1*int(sin(1*2*pi*x/L)*x, x, -L/2, L/2));
ome_weg(2)= 2*pi/L*2;
dz_r(2)= double(2/L*h*2/L/1*int(sin(2*2*pi*x/L)*x, x, -L/2, L/2));
ome_weg(3)= 2*pi/L*3;
dz_r(3)= double(2/L*h*2/L/1*int(sin(3*2*pi*x/L)*x, x, -L/2, L/2));
ome_weg(4)= 2*pi/L*4;
dz_r(4)= double(2/L*h*2/L/1*int(sin(4*2*pi*x/L)*x, x, -L/2, L/2));
ome_weg(5)= 2*pi/L*5;
dz_r(5)= double(2/L*h*2/L/1*int(sin(5*2*pi*x/L)*x, x, -L/2, L/2));
ome_weg(6)= 2*pi/L*6;
dz_r(6)= double(2/L*h*2/L/1*int(sin(6*2*pi*x/L)*x, x, -L/2, L/2));
ome_weg(7)= 2*pi/L*7;
dz_r(7)= double(2/L*h*2/L/1*int(sin(7*2*pi*x/L)*x, x, -L/2, L/2));

% Erhoehung der Periodenlaenge

L_1=10; % längere Periodenlaenge in m

ome_weg_1(1)= 2*pi/L_1*1;
dz_r_1(1)= double(2/L_1*h*2/L_1/1*int(sin(1*2*pi*x/L_1)*x, x, -L_1/2, L_1/2));
ome_weg_1(2)= 2*pi/L_1*2;
dz_r_1(2)= double(2/L_1*h*2/L_1/1*int(sin(2*2*pi*x/L_1)*x, x, -L_1/2, L_1/2));
ome_weg_1(3)= 2*pi/L_1*3;
dz_r_1(3)= double(2/L_1*h*2/L_1/1*int(sin(3*2*pi*x/L_1)*x, x, -L_1/2, L_1/2));
ome_weg_1(4)= 2*pi/L_1*4;
dz_r_1(4)= double(2/L_1*h*2/L_1/1*int(sin(4*2*pi*x/L_1)*x, x, -L_1/2, L_1/2));
ome_weg_1(5)= 2*pi/L_1*5;
dz_r_1(5)= double(2/L_1*h*2/L_1/1*int(sin(5*2*pi*x/L_1)*x, x, -L_1/2, L_1/2));
ome_weg_1(6)= 2*pi/L_1*6;
dz_r_1(6)= double(2/L_1*h*2/L_1/1*int(sin(6*2*pi*x/L_1)*x, x, -L_1/2, L_1/2));
ome_weg_1(7)= 2*pi/L_1*7;
dz_r_1(7)= double(2/L_1*h*2/L_1/1*int(sin(7*2*pi*x/L_1)*x, x, -L_1/2, L_1/2));


%%%%%%%%%%%%%%%%%%%%%%%%%%% Ermittlung der Amplitudenquadratwerte %%%%%%%%%%%%%%%%%%

% Fuer Periodenlänge L
dz_r_q(1)= dz_r(1)^2/2;
dz_r_q(2)= dz_r(2)^2/2;
dz_r_q(3)= dz_r(3)^2/2;
dz_r_q(4)= dz_r(4)^2/2;
dz_r_q(5)= dz_r(5)^2/2;
dz_r_q(6)= dz_r(6)^2/2;
dz_r_q(7)= dz_r(7)^2/2;

% Fuer laengere Periodenlaenge L_1
dz_r_q_1(1)= dz_r_1(1)^2/2;
dz_r_q_1(2)= dz_r_1(2)^2/2;
dz_r_q_1(3)= dz_r_1(3)^2/2;
dz_r_q_1(4)= dz_r_1(4)^2/2;
dz_r_q_1(5)= dz_r_1(5)^2/2;
dz_r_q_1(6)= dz_r_1(6)^2/2;
dz_r_q_1(7)= dz_r_1(7)^2/2;


%%%%%%%%%%%%%%%%%%%%%%%%%%% Ermittlung der diskreten Leistungsspektren %%%%%%%%%%%%%%%%%%

% Fuer Periodenlänge L
dz_r_q_l(1)= dz_r(1)^2/2/(2*pi/L);
dz_r_q_l(2)= dz_r(2)^2/2/(2*pi/L);
dz_r_q_l(3)= dz_r(3)^2/2/(2*pi/L);
dz_r_q_l(4)= dz_r(4)^2/2/(2*pi/L);
dz_r_q_l(5)= dz_r(5)^2/2/(2*pi/L);
dz_r_q_l(6)= dz_r(6)^2/2/(2*pi/L);
dz_r_q_l(7)= dz_r(7)^2/2/(2*pi/L);

% Fuer laengere Periodenlaenge L_1
dz_r_q_1_l(1)= dz_r_1(1)^2/2/(2*pi/L_1);
dz_r_q_1_l(2)= dz_r_1(2)^2/2/(2*pi/L_1);
dz_r_q_1_l(3)= dz_r_1(3)^2/2/(2*pi/L_1);
dz_r_q_1_l(4)= dz_r_1(4)^2/2/(2*pi/L_1);
dz_r_q_1_l(5)= dz_r_1(5)^2/2/(2*pi/L_1);
dz_r_q_1_l(6)= dz_r_1(6)^2/2/(2*pi/L_1);
dz_r_q_1_l(7)= dz_r_1(7)^2/2/(2*pi/L_1);


%%
%%%%%%%%%%%%%%%%%%%% Plot Ortsverlauf und Fourierkoeffizienten %%%%%%%%%%%%%%%%%%%%%

figure(1); clf;
x=0:0.001:3;
y_saw=h*sawtooth(2*pi/L*x);
dz_x=dz_r(1)*cos(1*2*pi/L*x+pi/2)+dz_r(2)*cos(2*2*pi/L*x-pi/2)+dz_r(3)*cos(3*2*pi/L*x+pi/2)+...
dz_r(4)*cos(4*2*pi/L*x-pi/2)+dz_r(5)*cos(5*2*pi/L*x+pi/2)+dz_r(6)*cos(6*2*pi/L*x-pi/2)+...
dz_r(7)*cos(7*2*pi/L*x+pi/2);
plot(x, dz_x,x,y_saw); grid on; axis([0 max(x) -10*max(dz_r) 10*max(dz_r)]);
title('Fourierreihe der sägezahnförmigen Fahrwegunebenheit'); 
xlabel('x [m]'); ylabel('\Delta z [m]');
text(0.5,5.5*max(dz_x),['Periodenlänge =', num2str(L), ' m']);
text(0.5,4.5*max(dz_x),['Höhe =', num2str(h), ' m']);

figure(2); clf;
bar(ome_weg, dz_r,'b'); grid on; hold on;
bar(ome_weg_1, dz_r_1,'r');
title('Amplitudenspektrum der sägezahnförmigen Unebenheit'); 
xlabel('n*2*pi/L [1/m]'); ylabel('Fourierkoeffizienten [m]');
text(25,0.6*dz_r(1),['Periodenlänge (blau) =', num2str(L), ' m']);
text(25,0.5*dz_r(1),['Periodenlänge (rot) =', num2str(L_1), ' m']);
text(25,0.4*dz_r(1),['Höhe =', num2str(h), ' m']);

%%
%%%%%%%%%%%%%%%%%%%% Plot Amplitudenquadratwerte %%%%%%%%%%%%%%%%%%%%%

figure(3); clf;
bar(ome_weg, dz_r_q,'b'); grid on; 
hold on;
bar(ome_weg_1, dz_r_q_1,'r');
title('Amplitudenquadratspektrum der sägezahnförmigen Unebenheit'); 
xlabel('n*2*pi/L [1/m]'); ylabel('0.5*Fourierkoeffizienten^2 [m]');
text(25,0.6*dz_r_q(1),['Periodenlänge (blau) =', num2str(L), ' m']);
text(25,0.5*dz_r_q(1),['Periodenlänge (rot) =', num2str(L_1), ' m']);
text(25,0.4*dz_r_q(1),['Höhe =', num2str(h), ' m']);

%%
%%%%%%%%%%%%%%%%%%%% Plot diskrete Leistungssprektren %%%%%%%%%%%%%%%%%%%%%

figure(4); clf;
bar(ome_weg, dz_r_q_l,'b'); grid on; 
hold on;
bar(ome_weg_1, dz_r_q_1_l,'r');
title('Diskrete Leistungsspektrum der sägezahnförmigen Unebenheit'); 
xlabel('n*2*pi/L [1/m]'); ylabel('0.5*Fourierkoeffizienten^2/(2*pi/L) [m^3]');
text(25,0.6*dz_r_q(1),['Periodenlänge (blau) =', num2str(L), ' m']);
text(25,0.5*dz_r_q(1),['Periodenlänge (rot) =', num2str(L_1), ' m']);
text(25,0.4*dz_r_q(1),['Höhe =', num2str(h), ' m']);

