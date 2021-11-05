close all;
clear all;
clc;

Datos=xlsread('Datos.xlsx');
tiempo = Datos(:,1);
respuesta = Datos(:,2);
escalon = Datos(:,3);
Vss = escalon(length(escalon));

K=(Vss-0)/1; %(Vss-Vinicial)/(Cambio en la entrada)
figure;
plot(tiempo,escalon,tiempo,respuesta,'LineWidth',2);
legend('u(t)','y(t)');
grid;
figure;
plot(tiempo,respuesta,'LineWidth',1);
grid;

% Primer orden
t28=446;
t63=601;
tao=1.5*(t63-t28);
timeHead1=t63-tao;
num1 = K;
den1 = [tao 1];
tsim = 15;
tu = 1;

% Segundo orden
t25 = 338;
t50 = 470;
t75 = 742;
tm2 = 1.5552*t25 - 0.5552*t75;
tao1 = 0.5776*(t75-t25);
a = (t50-tm2-1.4362*tao1)/(1.9844*tao1-t50+tm2);
tao2 = (2*tao1)/(1+a);
t1 = tao2;
t2 = a*tao2;
num2 = K;
den2 = [t1*t2 t1+t2 1];

sim('PracticaUdeAII',t);

figure
yMo = ScopeData.signals(1).values;
plot(tout,yMo,tout,ysi);
legend('Modelo Primer orden');
grid on;


figure
yMo2 = ScopeData1.signals(1).values;
plot(tout,yMo2,tout,ysi);
legend('Modelo segundo orden','Original');
grid on;




