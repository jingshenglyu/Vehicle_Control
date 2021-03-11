%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Technische Universität Berlin
% Fakultät Verkehrs-  und Maschinensystem 
% Fachgbiet Kraffahrzeuge
% M.Sc. Osama Al-Saidi
% 
% Fahrzeugregelung: Übung - Einführung in Matlab/Simulink
% Aufgabe: Schleifen (if, for, while)
% Datum: 21.10.2014
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Programm gerade und ungerade Zahlen (if-Schleife)
i = 40;                     % weist der Variablen i den Wert 40 zu
j = 2;                      % weist der Variablen j den Wert 2 zu
rest = mod(i,j);            % deklariert eine Variable rest und weist ihr
                            % den Rest der Division i/j zu. 
disp('Die Zahl');           % zeigt „Die Zahl“ im Command Window an
disp(i);                    % zeigt den Wert von i im C. Window an
if rest == 0                % wenn es keinen Rest gibt
	disp('ist gerade.');	% wird angezeigt: ist gerade, da durch 2 teilbar
else                        % ansonsten
	disp('ist ungerade.');	% wird angezeigt: ist ungerade, da nicht 
                            % durch 2 teilbar
end	



% for-Schleife
summe=0;               % Deklaration einer Variablen summe mit Startwert =0
for i=1:1:10           % Schleife wird beginnend mit i=1 mit Schrittweite 1 
                       % bis i=10 hochgezählt
    summe=summe+i;     % in jedem Durchgang der Schleife wird der Wert von 
                       % summe um i erhöht
end                    % Ende der Schleife
disp(summe);           % Anzeigen des Ergebnisses von summe



% while-Schleife
summe=0;
i=0;
while i<=10           % Solange die Variable i <= 10 ist, wird die Schleife
    summe=summe+i;    % ausgeführt
    i=i+1;            % i wird dabei extra hochgezählt
end
disp(summe);