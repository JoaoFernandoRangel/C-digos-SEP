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
Sb = p + 1i*Q;
%%
clear all
close all
clc

z = 500; %Ohm
Vnp = 13800; %Volt
Vns = 220; %Volt
pf = 1;
Sb = 150e3; %kVa
n = Vnp/Vns
Ibase = Sb/Vnp
Zbase = ((Vnp)^2)/Sb
Zpu = n^2*(z/Zbase)
Zohm = Zpu * Zbase
P = Vnp^2/Zohm % Watts
%%
clear all
close all
clc
% Trafo(Vprim, Vsec, Pnom, Vnom)
TA = Trafo(138e3, 69e3, 41.5e6,0.055 );
TB = Trafo(69e3,13.8e3,33e6,0.07);
TC = Trafo(69e3,34.5e3,24e6,0.05);
LtA = LinhaT(0.12,0.92,150);
LtB = LinhaT(0.19,1.84,230);
Sb = 50e6; %MVA
Vb1 = 230e3;
Vb2 = Vb1/TA.n;
Vb3 = Vb2/TC.n;
Vb4 = Vb2/TB.n;
Zb1 = Vb1^2/Sb
Ib1 = Sb/(sqrt(3)*Vb1)
Zb2 = Vb2^2/Sb
Ib2 = Sb/(sqrt(3)*Vb2)
Zb3 = Vb3^2/Sb
Ib3 = Sb/(sqrt(3)*Vb3)
Zb4 = Vb4^2/Sb
Ib4 = Sb/(sqrt(3)*Vb4)
Zb2 = Vb2^2/Sb
Zb3 = Vb3^2/Sb
ZLta = LtA.Z/Zb2
ZLtb = LtB.Z/Zb3
ZTa = TA.xf*(Sb/TA.Pnominal)*(TA.Vprimario/Vb1)^2
ZTb = TB.xf*(Sb/TB.Pnominal)*(TB.Vprimario/Vb2)^2
ZTc = TC.xf*(Sb/TC.Pnominal)*(TC.Vprimario/Vb2)^2
%%
clear all
close all
clc
Vll = 208; %Volts linha - linha
Vfn = Vll/sqrt(3); %Volts fase - neutro
Va = Vfn*exp(1i*0);
Vb = Vfn*exp(1i*(deg2rad(-120)));
Vc = Vfn*exp(1i*(deg2rad(120)));
Vca = Vc - Va;
Vab = Va - Vb;
Vbc = Vb - Vc;
plot_3_fasores(Va,Vb,Vc);
plot_3_fasores(Vca,Vab,Vbc);
Z1 = 10*exp(-1i*deg2rad(15));
I1 = Vfn/Z1;
%%
close all
clear all
clc
%1.19
S1 = 250 + 1i*250; %kVa 
S2 = 0 -1i*60; %kVa Potência do banco de capacitores
S_total = S1 + S2; %Soma das potências
I_modulo = abs(S_total)*1000/(sqrt(3)*440) % |S| = sqrt(3)*|V|*|I|
pf = cos(angle(S_total)) 


%%
close all
clear all
clc
%{
A generator (which may be represented by an emf in series with an 
inductive reactance) is rated 500 MVA, 22 kV. Its Y-connected windings 
have a reactance of 1.1 per unit. Find the ohmic value of the reactance of 
the windings.
%}

S = 500e6; %MVA
Vll = 22e3; %kV
Xf_pu = 1.1; %pu
Xfb = Vll^2/S %ohm
Xf = Xf_pu*Xfb %ohm
%%
close all
clear all
clc
%{
The values for the parameters of Fig. 1.23 are given in per unit as follows:
Ya = -j0.8 Yb = -j4.0 Yc = -j4.0 Yd=-j8.0 Ye=-;5.0
Yf = -j2.5 Yg = -j0.8 I3 = l.o/—90° I4 = 0.68/- 135°
Substituting these values in the equations determined in Prob. 1.25, compute the
voltages at the nodes of Fig- 1-23. Numerically determine the corresponding Zbus
matrix.
%}
Ya = -1i*0.8;
Yb = -1i*4.0;
Yc = -1i*4.0;
Yd = -1i*8.0;
Ye = -1i*5.0;
Yf = -1i*2.5;
Yg = -1i*0.8;
I3 = 1*exp(1i*deg2rad(-90));
I4 = 0.68*exp(1i*deg2rad(-135));
% Definir a matriz Y de admitâncias
Y_matriz = [(Yc+Yf+Yd), -Yd,       -Yc,      -Yf;
            -Yd,       (Yb+Yd+Ye), -Yb,      -Ye;
            -Yc,       -Yb,        (Ya+Yb+Yc), 0;
            -Yf,       -Ye,        0,        (Ye+Yf+Yg)]
        
% Definir a matriz de correntes I
I_matriz = [0; 0; I3; I4]; % I3 e I4 são valores conhecidos
V_matriz = inv(Y_matriz)*I_matriz;
Z_matriz = inv(Y_matriz)
% plot_4_fasores(V_matriz(1),V_matriz(2),V_matriz(3),V_matriz(4))
%%
close all
clear all
clc
Ya = -1i*0.8;
Yb = -1i*0.8;
Yc = -1i*0.8;
Yd = -1i*5.0;
Ye = -1i*8.0;
Yf = -1i*4.0;
Yg = -1i*2.5;
Yh = -1i*5.0;
Y_matriz = [(Ya+Yf+Yd), 0,       -Yf,      -Yd;
            0,       (Yb+Yg+Yh), -Yg,      -Yh;
            -Yf,       -Yg,        (Yc+Yf+Yg+Ye), -Ye;
            -Yd,       -Yh,        -Ye,        (Yd+Ye+Yh)];
I_matriz = [1.2;5;-6;0];
Z_matriz = inv(Y_matriz)
V_matriz = inv(Y_matriz)*I_matriz
%%
close all
clear all
clc
%{
A partir da rede a seguir, baseada na rede utilizada na
aula de pu, determine:
a) As impedâncias em pu dos 5 elementos principais da
rede (3 transformadores + 2 LTs), considerando uma
base de 100 MVA e 138 kV na barra 1.
b) A matriz de admitância Y.
c) A matriz de impedância Z.
d) O vetor de tensões V.
%}
% Definindo os valores base de tensão e potência
S_base = 100e6;    % Potência base em VA (100 MVA)
V_base = 138e3;    % Tensão base em volts (138 kV)
Z_base = S_base^2/V_base;
%Linhas de transmissão
LTa = LinhaT(0.12,0.92,30);
LTb = LinhaT(0.19,1.84,10);

% Criando os objetos dos transformadores
Ta = Trafo(138e3, 69e3, 41.5e6, 5.5);
Tb = Trafo(69e3, 13.8e3, 33e6, 7);
Tc = Trafo(69e3, 34e3, 24e6, 5); 
%calcularPU(obj, Vbase, Pbase, Zbase)
Ta = calcularPU(Ta,V_base,S_base,Z_base);
Ta.Zpu





































