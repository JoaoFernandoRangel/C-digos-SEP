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
%%
close all
clear all
clc

%{
Example 2.9
Figure 2.17 shows a three-phase generator rated 300 MVA, 23 kV
supplying a system load of 240 MVA, 0.9 power-factor lagging at 230 kV through
a 330-MVA 23D/230Y-kV step-up transformer of leakage reactance 11%.
Neglecting magnetizing current and choosing base values at the load of 100 MVA
and 230 kV, find IA, IB, and Ic supplied to the load in per unit with as
reference. Specifying the proper base for the generator circuit, determine Ia, Ih,
and Ic from the generator and its terminal voltage.
%}
Sb = 100e6;
Vb = 230e3;
Ib = Sb/(sqrt(3)*Vb);

Sload = 240e6;
Vload = 230e3;
Iload = Sload/(sqrt(3)*Vload);

Iload_pu_mod = Iload/Ib;
pf = 0.9;
theta_pf = acos(0.9);
IA = Iload_pu_mod*exp(-1i*theta_pf);
IB = IA*exp(-1i*(theta_pf + deg2rad(120)));
IC = IA*exp(-1i*(theta_pf + deg2rad(-120)));
plot_3_fasores(IA,IB,IC);
close all
% A reatancia do transformador modificada para a nova base é:
Z_nb = 0.11*(100/330);
Ia = IA*exp(1i*(deg2rad(-30)));
% A tensão de terminal do gerador pode ser calculada com:
% Vt = Va /_-30 + jXIa
Vt_pu = 1*exp(1i*deg2rad((-30))) + 1i*Z_nb*Ia;
Vt = abs(Vt_pu) * 23e3;
P_load = 100e6*real(Vt_pu*conj(Ia));

%%
close all
clear all
clc

%{
Example 2.10
A 90-MVA single-phase transformer rated 80/120 kV is connected
as an autotransformer, as shown in Fig. 2.18(b). Rated voltage |V1| =80 kV is
applied to the low-voltage winding of the transformer. Consider the transformer to
be ideal and the load to be such that currents of rated magnitudes |I1| and |I2|
flow in the windings. Determine |K2| and the kilovoltampere rating of the
autotransformer.
%}

Strafo = 90e6;
V1= 80e3;
V2 = 120e3;
I1 = Strafo/V1;
I2 = Strafo/V2;
Vt = V1+V2;
Iin = I1 + I2;
Input_KVoltAmpere = Iin*V1/1000;
Output_KVoltAmpere = I2*Vt/1000
%%
close all
clear all
clc
%{
Example 2.11
Primario   -> Y 66kV   15MVA
Secundário -> Y 13.2kV 10MVA
Terciário  -> D 2.3kV   5MVA

Zps = 7% com 15MVA e 66kV
Zpt = 9% com 15MVA e 66kV
Zst = 8% com 10MVA e 13.2kV

Encontre a impedância equivalento do circuito com base de 15MVA e 66kV para
o circuito primário
%}
Zst = 1i*(8/100)*(15/10); % O terciário é o unico fora de base.
Zps = 1i*0.07;
Zpt = 1i*0.09;
Zp = 0.5*(Zps+Zpt-Zst)
Zs = 0.5*(Zps+Zst-Zpt)
Zp = 0.5*(Zpt+Zst-Zps)
%%
close all
clear all
clc
%{
Example 2.12
A constant-voltage source (infinite bus) supplies a purely resistive 5
MW, 2.3 kV three-phase load and a 7.5 MVA, 13.2 kV synchronous motor having
a subtransient reactance of X" = 20%. The source is connected to the primary of
the three-winding transformer described in Example 2.11. The motor and resistive
load are connected to the secondary and tertiary of the transformer. Draw the
impedance diagram of the system and mark the per-unit impedances for a base of
66 kV, 15 MVA in the primary. Neglect exciting current and all resistance except
that of the resistive load.
%}
%{
A fonte de tensão constante pode ser representada como um gerador sem
impedância interna.
%}
%A resistência da carga é de 1PU com base em 5MVA, 2.3kV no terciário.
%Expressa em 15MVA, 2.3kV a resistência da carga é:
R = 1*(15e6/5e6);
X = (20/100)*(15e6/7.5e6);
% [R X]
%Diagrama de impedâncias na página 85

%%
close all
clear all
clc
%{
Problemas 2.1,2.6,2.10,2.11,2.14,2.15,2.19
%}
%% 2.1
close all
clear all
clc

S = 7.2e3;
V1 = 1.2e3;
V2 = 120;
N1 = 800;
n = V2/V1;
I1 = S/V1
I2 = S/V2
%% 2.6
close all
clear all
clc
S = 7.2e3;
V1 = 1.2e3;
V2 = 120;
r1 = 0.8;
x1 = 1.2;
r2=0.01;
x2 = 0.01;
n = V1/V2;
R1 = r1 + n^2*r2; %Espelhando o secundário no primário
X1 = x1 + n^2*x2;
R2 = R1/n^2; %Passando as impedâncias para o secundário
X2 = X1/n^2;
z1 = R1 + 1i*X1;
I2 = (S/V2)*exp(-1i*acos(0.8));
I1 = I2/n;
V1 = n*V2 + I1*z1;
R = ((abs(V1)/n) - V2)/V2;
100*R
%% 2.10
close all
clear all
clc
%Imagem na página 75 do pdf
% Trafo = struct('V1',5,'V2',0);
T1_VA = 500;
T1_VB = 1.5e3;
T1_n = T1_VA/T1_VB;
T1_S = 9.6e3;
T1_x = 0.05;

T2_VB = 1.2e3;
T2_VC = 120;
T2_S = 7.2e3;
T2_x = 0.04;

Z_LinhaB = 1.5+1i*3;
Load_V = 120;
Load_S = 6e3;
Load_pf = 0.8;

%Determinar a impedância da carga em ohms. Determinar as impedancias dos
%transformadores referentes ao primario e secundário
Load_Z_ohm = (Load_V^2/Load_S)*exp(1i*acos(Load_pf));
T1_Z_Primario = (T1_VA^2/T1_S)*1i*T1_x;
T1_Z_secundario = (T1_VB^2/T1_S)*1i*T1_x;
T2_Z_Primario = (T2_VB^2/T2_S)*1i*T2_x;
T2_Z_secundario= (T2_VC^2/T2_S)*1i*T2_x;
%Tendo 1.2e3 como volt base para o circuito B e  10e3 kVa como base de
%potência para todo o sistema, determine todas as impedancias em PU
Vbase_B = 1.2e3;
Vbase_C = Vbase_B*(T2_VC/T2_VB);
Vbase_A = Vbase_B*(T1_VA/T1_VB);
S_base = 10e3;
Z_base_B = Vbase_B^2/S_base;
Z_base_C = Vbase_C^2/S_base;
Z_base_A = Vbase_A^2/S_base;

Z_T1_pu = T1_Z_secundario/Z_base_B;
Z_T2_pu = T2_Z_secundario/Z_base_C;
Z_LinhaB_pu = Z_LinhaB/Z_base_B;
Load_pu = Load_Z_ohm/Z_base_C;
% abs(Load_pu)
% rad2deg(angle(Load_pu))
%Qual valor de tensão deve ser estabelecido no fornecedor do circuito para
%manter as condições nominais de carga
Z_series = Z_LinhaB_pu+Z_T1_pu+Z_T2_pu;
Vr = 120; %1 pu
Ve = 1*((Load_pu+(Z_series))/Load_pu);
Vs_base = (500/1.5e3)*1.2e3;
Vs = Vs_base*Ve;
abs(Vs)
rad2deg(angle(Vs))
%%
close all
clear all
clc
%2.11
%Uma carga delta balanceade de 8.000 kW esta conectada ao lado baixo(D) de
%um Y-D trafo. 10.000 kV,138kV/13.8kV. Encontre a resistência em ohms em
%cada fase quando medida da fase-neutro no lado alto do transformador.
%Ignore impedancias e assuma que a tensão nominal esta sendo aplicada no
%lado alto do trafo.

I_linha_mod = 8000e3/(sqrt(3)*138e3); % S = sqrt(3)*|V|*|I|
%138e3 é a tensão fase-fase, divide-se por sqrt3 para fase-neutro
R = (138e3/sqrt(3))/I_linha_mod; 
%%
close all 
clear all
clc

%2.14
Snominal = 200e6;
V1 = 345e3; %Y;
V2 = 20.5e3; %D;

Load_S = 180e6;
Load_V = 22.5e3;
Load_pf = 0.8;
%Se o trafo trifasico for substituido por 3 trafos monofásicos, eles devem
%ser projetados para:
S_trafo = Snominal/3;
V1_trafo = (V1/sqrt(3));
V2_trafo = V2;
%Considerando as bases como:
Sbase = 100e6;
Vbase_linha = 345e3;
Vbase_carga = 20.5e3;
%Determine a impedancia da carga
Z_load_ohm = (Load_V^2/Load_S)*exp(1i*acos(Load_pf));
Zbase = Vbase_carga^2/Sbase;
Z_load_pu=Z_load_ohm/Zbase;
% abs(Z_load_pu)
% rad2deg(angle(Z_load_pu))
%%
close all
clear all
clc
%2.15
%Transformador trifásico com specs:
S3f = 5e6;
V1_3f = 115e3;
V2_3f = 13.2e3;
Imped_por_fase = 0.007+1i*0.075;
%Trafo esta conectado em uma linha que tem:
Sbase_linha = 10e6;
Vbase_linha = 13.2e3;
Zlinha = 0.02+1i*0.1;
%A linha alimenta uma carga trifasica balanceada com:
S3f_carga = 4e6;
V3f_carga = 13.2e3;
pf_carga = 0.85;

Z_trafo = (Sbase_linha/S3f)*(Imped_por_fase);
Vs = 1;
Load_Z_ohm = ((V3f_carga^2))/(3.4e6/0.85);
Zbase_load = V3f_carga^2/10e6;
Z_load_pu = (Load_Z_ohm/Zbase_load)*exp(1i*acos(pf_carga));
%Aqui para baixo sao os calculos de regulação de tensão
Corrente_total = 1/(Z_load_pu+Z_trafo+Zlinha);
Vr_fl = Corrente_total*Z_load_pu;
VR = 100*((1-abs(Vr_fl))/abs(Vr_fl));
%% 2.19
close all
clear all
clc
% Um trafo monofásico é conectado como um autotransformador
% Rated: 30kVa, 1200/120. Conectado para fornecer 1320V a partir de uma
% fonte de 1200V.

I2 = 30e3/1200;
I1 = 30e3/120;
It = I1+I2;

Pout = 30e3;
Pin = 1200*It;













