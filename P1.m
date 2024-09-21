clear all
close all
clc

[x,y] = pol2cart(30*pi/180, 20);
Zfase = x + 1i*y; %Ohm Impedância de fase
Vlinha = 4.4e3; % Volts
[x,y] = pol2cart(75*pi/180,1.4);
Zlinha = x +1i*y; %Ohm - Impedância de linha
V_fase_neutro = Vlinha/sqrt(3)
I_fase_neutro = V_fase_neutro/Zfase
[t,r] = cart2pol(real(I_fase_neutro), imag(I_fase_neutro));
Tensao = V_fase_neutro + I_fase_neutro*Zlinha;
[t,r] = cart2pol(real(Tensao), imag(Tensao));
t = t*180/pi
r
tenssao_barramento_sub = r*sqrt(3);
%%
clear all
close all
clc

%Example 1.4
Zbase = (4.4e3/sqrt(3))/127;                 % Calculando a impedância base
Zlinha_mod =1.4/real(Zbase);                 % Modulo de impedancia de linha
Zlinha_ang = deg2rad(75)-angle(Zbase);       % Angulo de impedância de linha
Zlinha = Zlinha_mod*exp(1i*Zlinha_ang);      
Van_pu = 1*exp(1i*0) + 1*exp(1i*deg2rad(-30))*Zlinha;
% Van_pu_ = [real(Van_pu) rad2deg(angle(Van_pu))];
Vln_pu = real(Van_pu)*4.4e3/sqrt(3)
Vll_pu = real(Van_pu)*4.4e3
%%
clear all
close all
clc

%Cáculo de PU
V_nominal = 18e3;
P_nominal = 500e6;
V_base = 20e3;
P_base = 100e6;
Z_dado = 0.25;
Z_novo_pu = Z_dado*((V_nominal/V_base)^2)*(P_base/P_nominal)
%Outro método para calcular é transfomar o valor da impedancia para Ohm e
%comparar com o novo valor base
Z_novo_pu_alt = Z_dado *((V_nominal^2)/P_nominal)/(((V_base)^2)/(P_base))
%%
clear all
close all
clc

%1.1
f = 60;
t = 0:0.001:5/f;
v = 141.1*sin(2*pi*f.*t + deg2rad(30)); %Volts
i = 11.31*cos(2*pi*f.*t - deg2rad(30)); %Ampere
plot(t,v);
hold on
plot(t,i)
grid on
%%
clear all
close all
clc

%1.6
p = 10e6; %MW
pf = 0.6;
theta = acos(pf);
Q = tan(theta)*p;
S = p + 1i*Q;
%%
clear all
close all
clc

z = 500; %Ohm
Vnp = 13800; %Volt
Vns = 220; %Volt
pf = 1;
S = 150e3; %kVa
n = Vnp/Vns
Ibase = S/Vnp
Zbase = ((Vnp)^2)/S
Zpu = n^2*(z/Zbase)
Zohm = Zpu * Zbase
P = Vnp^2/Zohm % Watts
%%
clear all
close all
clc
% Trafo(Vprim, Vsec, Pnom, Vnom)
TA = Trafo(138e3, 69e3, 41.5e6, 138e3);
TB = Trafo(69e3,13.8e3,33e6,69e3);
TC = Trafo(69e3,34.5e3,24e6,69e3);
LtA = LinhaT(0.12,0.92,150);
LtB = LinhaT(0.19,1.84,230);
S = 50e6; %MVA
Vb1 = 230e3;
Vb2 = Vb1/TA.n;
Vb3 = Vb2/TC.n;
Vb4 = Vb2/TB.n;
Zb1 = Vb1^2/S
Ib1 = S/(sqrt(3)*Vb1)
Zb2 = Vb2^2/S
Ib2 = S/(sqrt(3)*Vb2)
Zb3 = Vb3^2/S
Ib3 = S/(sqrt(3)*Vb3)
Zb4 = Vb4^2/S
Ib4 = S/(sqrt(3)*Vb4)


























