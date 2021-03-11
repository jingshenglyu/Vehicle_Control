%__________________________________________________________________________
%
% Matlab Skript zur Berechnung Reifenkurven zur
% in Abhängigkeit von Reifenlast und Schlupf
%
% Uebung zur Vorlesung "Fahrzeugrgelung"
% Thema: Pacejka Magic Tire Formula (simple)
%
% Version:  20100422
% Autor:    Osama Al-Saidi
%           Fachgebiet Kraftfahrzeuge
%           TU Berlin

%__________________________________________________________________________
clear all;
close all;
clc;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   DRY ASPHALT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Paceijka
Fzeta0_1 = 4000;            % Peak Value in N
C_1 = 1.45;                 % Determines limits of the range of the argument of the sine function
B_1 = 20;                   % Use to Control Slope at Origin (where slope = arctan(BCD))
mu_1 = 1.05;                % Haftbeiwert 
Fzeta_1 = 4500;             % Beispielwert für Radlast

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   WET ASPHALT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Fzeta0_2 = 4000;            % Peak Value
C_2 = 1.45;                 % Determines limits of the range of the argument of the sine function
B_2 = 20;                   % Use to Control Slope at Origin (where slope = arctan(BCD))
mu_2 = 0.6;                 % Haftbeiwert 
Fzeta_2 = 4500;             % Beispielwert für Radlast
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   GENERAL VALUES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k_Fzeta = 0.2;

% Calculate Fmax:
Fmax_1 = mu_1*Fzeta_1*(1+k_Fzeta*(Fzeta0_1-Fzeta_1)/Fzeta0_1);
Fmax_2 = mu_2*Fzeta_2*(1+k_Fzeta*(Fzeta0_2-Fzeta_2)/Fzeta0_2);

% Calculate slip curves
slip = 0:0.001:0.4;
Fxi_1(1,:) = (Fmax_1*sin(C_1*atan(B_1*slip/mu_1)));
Fxi_2(1,:) = (Fmax_2*sin(C_2*atan(B_2*slip/mu_2)));

% Variation der Kurven-Parameter:
B_1_var = 10:2:30;
for i=1:length(B_1_var)
    Fxi_1(i+1,:) = (Fmax_1*sin(C_1*atan(B_1_var(i)*slip/mu_1)));
    Fxi_2(i+1,:) = (Fmax_2*sin(C_2*atan(B_1_var(i)*slip/mu_2)));
end

% Calculate Fmax curves
Fzeta = 0:10:8000;
Fmax_1 = mu_1*Fzeta.*(1+k_Fzeta*(Fzeta0_1-Fzeta)./Fzeta0_1);
Fmax_2 = mu_2*Fzeta.*(1+k_Fzeta*(Fzeta0_2-Fzeta)./Fzeta0_2);

% ------------------------- Plot Paceijka's model -----------------------------
close all;

figure(1);
subplot(2,2,1)
plot(slip,Fxi_1(1,:),'r-','LineWidth',1.5);
hold on;
plot(slip,Fxi_2(1,:),'b','LineWidth',1.5);
title('Empirical slip curves for different road conditions')
legend('dry condition1', 'wet condition 2');
ylabel('\xi [ ]')
xlabel('Slip []')
% axis([0,0.04,0,1.]);
grid on;

subplot(2,2,3)
plot(Fzeta,Fmax_1,'r-','LineWidth',1.5);
hold on;
plot(Fzeta,Fmax_2,'b','LineWidth',1.5);
title('Empirical Fmax curves for different road conditions')
legend('dry condition1', 'wet condition 2');
ylabel('\xi [ ]')
xlabel('Fzeta []')
grid on;

subplot(2,2,[2,4])
plot(slip,Fxi_1,'r-','LineWidth',1);
hold on;
plot(slip,Fxi_2,'b','LineWidth',1);
title('Empirical slip curves for different road conditions, parameter variation B')
ylabel('\xi [ ]')
xlabel('Slip []')
% axis([0,0.04,0,1.]);
grid on;

