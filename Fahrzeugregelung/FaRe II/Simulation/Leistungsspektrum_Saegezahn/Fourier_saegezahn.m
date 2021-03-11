% ########################################################################
% Fahrzeugregelung II, M.Sc. Jochen Gallep
% Übung 1
% Fourier Analyse einer Sägezahnfunktion mit Periode 2pi und Amplitude 2pi
% #######################################################################

x=[0:0.01:6*pi];
y=pi*sawtooth(x)+pi;
y_fourier=pi-2*(sin(x)+0.5*sin(2*x)+1/3*sin(3*x));

y1=ones(size(x))*pi;
y2=2*sin(x);
y3=sin(2*x);
y4=2/3*sin(3*x);

subplot(2,1,1);
plot(x,y,x,y_fourier);
legend('y(x)','y_{fourier}(x)');
grid
xlabel('x');
ylabel('y(x)');

subplot(2,1,2);
plot(x,y1,x,y2,x,y3,x,y4);
legend('y1_{fourier}(x)','y2_{fourier}(x)','y3_{fourier}(x)','y4_{fourier}(x)');
xlabel('x');
grid;