%q1
clear all
close all
clc
Sb = 200e6 %potência de base
Vbz3 = 34.5e3  %tensão de base zona 3
Vbz2 = (138e3/13.8e3)*Vbz3  %tensão de base zona 2
Vbz1 = (13.8e3/138e3)*Vbz2 %tensão de base zona 1

%Zbz1 = Vbz1^2/Sb %impedância de base da zona 1
%Zbz2 = Vbz2^2/Sb  %impedância de base da zona 2
%Zbz3 = Vbz3^2/Sb %impedância de base da zona 3

Xg1 = i*25/100*(Sb/100e6)*(13.8e3/Vbz1)^2 %reatancia do gerador
Xta = i*7/100*(Sb/60e6)*(13.8e3/Vbz1)^2 %reatância do trafo a
Xtb = i*8/100*(Sb/50e6)*(138e3/Vbz2)^2 %reatância do trafo a
Xtc = i*10/100*(Sb/50e6)*(138e3/Vbz2)^2 %reatância do trafo a

LTapu = (2.9 + 8i)/Zbz2
LTbpu = (1.95 + 5i)/Zbz3


%% q2
close all
clear all
clc
S1 = 33e6;
V1 = 138e3;
I1 = S1/(sqrt(3)*V1);
Z1 = V1/I1;
S2 = 20e6;
V2 = 34.5e3;
I2 = S2/(sqrt(3)*V2);
Z2 = V2/I2;

Xps = 0.05*Z1; %Ohms
Xpt = 0.06*Z1; %Ohms
Xst = 0.1*Z2;   %Ohms

Zp = 0.5*(Xps+Xpt-Xst);
Zs = 0.5*(Xps+Xst-Xpt);
Zt = 0.5*(Xpt+Xst-Xps);

Sb = 100e6;
Vb = 345e3;
Ib = Sb/(sqrt(3)*Vb);
Zb = 1i*Vb/Ib;

Zp_pu = Zp/Zb 
Zs_pu = Zs/Zb
Zt_pu = Zt/Zb


%% q3
close all
clear all
clc
c = (1+2/100)^-1; %letra a
c2 = fasor(1,-4); %letra b
Yeq = (i*8/100)^-1
Y11 = Yeq
Y12 = -c*Yeq
Y22 = abs(c)^2*Yeq
Y21 = -conj(c)*Yeq


BY11 = Yeq
BY12 = -c2*Yeq
BY22 = abs(c2)^2*Yeq
BY21 = -conj(c2)*Yeq
