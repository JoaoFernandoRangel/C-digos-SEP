clear all
close all
clc

%Example 2.1 - pag 63
N1 = 2e3;
N2 = 500;
n = N2/N1;
V1 = 1200*exp(-1i*0);
I1 = 5*exp(1i*deg2rad(-30));
Z1 = V1/I1;
V2 = n*V1;
I2 = I1/n;
Z2 = V2/I2;
% Alternativamente pode-se passar a corrente do secundário para
%o primário para calcular a impedância
Z2_ = Z2/n^2; 
rad2deg(angle(Z2_))
abs(Z2_)
%%
clear all
close all
clc

%Example 2.2
N1 = 2000;
N2 = 500;
r1 = 2;
r2 = 0.125;
x1 = 8;
x2 = 0.5;
Z2 = 12;

V1 = 1200;
a = N1/N2;
R1 = r1 + a^2*r2
X1 = x1 + a^2*x2
Z2_ = a^2*Z2

I1 = 1200/(Z2_+R1 +1i*X1);
V2 = I1*Z2_/a;
Vr = 100*((V1/a - abs(V2))/abs(V2))

% rad2deg(angle(V2))
% abs(V2)
%%
clear all
close all
clc

%Example 2.23

S = 15e6; %MVA
Vs = 11.5e3;
Vp = 69e3; %Secundario

Zs = Vs^2/S; % Ohm
I1 = S/Vp;
R = 105.8e3/I1^2;
Z = 5.5e3/I1 
X = sqrt(Z^2-R^2)
%%
clear all
close all
clc

%Example 2.7 - Transformadores trifásicos

Sb = 75e6;
Vb = 66e3;
%Y - Delta
Vll = sqrt(3)*38.1e3;
% Considerando os tres transformadores como um banco de transformadores:
S = 3 * 25e6;
% 66Y/3.81D kV
Valto = 66e3;
Vbaixp = 3.81e3;
%Então a base para o lado de baixa é 3.81e3 V e 75MVA
Vbll = 3.81e3;
Sb = 75e6;
Zb_ladoBaixa = Vbll^2/Sb
Rl = 0.6/Zb_ladoBaixa; %PU
R1_ladoAlta = 0.6*(66/3.81)^2
Zb = Valto^2/Sb %PU
Rl_pu = R1_ladoAlta/Zb % PU
%%
clear all
close all
clc
%Gerador
Sgenerator = 300e6;
Vgenerator = 23e3;
%Transformador
n = 0.1;
%Carga
Sload = 240e6;
pfLoad = 0.9;
VLoad = 230e3;
Iload = Sload/(sqrt(3)*VLoad);

Sbase = 100e6;
Vbase = 230e3;
Zbase = Sbase/(Vbase^2);
Ibase = Sbase/(sqrt(3)*Vbase);
ThetaLoad = acos(pfLoad);

IA = (Iload/Ibase)*exp(1i*(-ThetaLoad));
IB = IA*exp(1i*(deg2rad(-120)));
IC = IA*exp(1i*(deg2rad(120)));
% plot_3_fasores(IA,IB,IC);
%Corrente do lado de baixo atrasa mais 30 graus
Ia = IA*exp(1i*(deg2rad(-30)));
Ib = IB*exp(1i*(deg2rad(-30)));
Ic = IC*exp(1i*(deg2rad(-30)));
% plot_3_fasores(Ia,Ib,Ic);
% angulos = [rad2deg(angle(Ia)) rad2deg(angle(Ib)) rad2deg(angle(Ic))]
% modulos = [abs(Ia) abs(Ib) abs(Ic)]




