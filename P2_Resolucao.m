%{
Aluno: João Fernando Rangel Guimarães
NÃO EXECUTE NO RUN LA EM CIMA!
Execute cada seção apertando CTRL+Enter.
%}
%Questão 1
clear all
close all
clc
Sb = 200e6;                  %potência de base
Vbz3 = 34.5e3;               %tensão de base zona 3
Vbz2 = (138e3/13.8e3)*Vbz3;  %tensão de base zona 2
Vbz1 = (13.8e3/138e3)*Vbz2;  %tensão de base zona 1

Zbz1 = Vbz1^2/Sb; %impedância de base da zona 1
Zbz2 = Vbz2^2/Sb;  %impedância de base da zona 2
Zbz3 = Vbz3^2/Sb; %impedância de base da zona 3

Xg1 = 1i*25/100*(Sb/100e6)*(13.8e3/Vbz1)^2; %reatancia do gerador
Xta = 1i*7/100*(Sb/60e6)*(13.8e3/Vbz1)^2; %reatância do trafo a
Xtb = 1i*8/100*(Sb/50e6)*(138e3/Vbz2)^2; %reatância do trafo a
Xtc = 1i*10/100*(Sb/50e6)*(138e3/Vbz2)^2; %reatância do trafo a

LTapu = (2.9 + 8i)/Zbz2;
LTbpu = (1.95 + 5i)/Zbz3;

YG1 = 1/Xg1
YTa = 1/Xta
YTb = 1/Xtb
YTc = 1/Xtc
YLa = 1/LTapu
YLb = 1/LTbpu

Matriz_de_Admitancia = [(YG1+YTa) -YTa       0       0         0;
                        -YTa (YTa+YLa+YTb) -YLa      0        -YTc;
                          0       -YLa   (YLa+YTb)  -YTb        0;
                          0         0       -YTb    (YTb+YLb) -YLb;
                          0       -YTc      0  -YLb    (YLb + YTc)]

%% Questão 2
close all
clear all
clc

Sb = 200e6;
Vb = 345e3;

Xps = 1i*0.09*(Sb/33e6)*(138e3/Vb)^2
Xpt = 1i*0.07*(Sb/33e6)*(138e3/Vb)^2
Xst = 1i*0.12*(Sb/20e6)*(4*34.5e3/Vb)^2
Zp = 0.5*(Xps+Xpt-Xst)
Zs = 0.5*(Xps+Xst-Xpt)
Zt = 0.5*(Xpt+Xst-Xps)

%% Questão 4
close all
clear all
clc

Sb = 100e6;
Vb = 13.8e3;
Ib = Sb/(sqrt(3)*Vb);

Xd = fasor(1,90)
Vt_mod = 13.8e3;
Vt_pu = Vt_mod/Vb;
Ia_mod = 3300;
Ia_pu = Ia_mod/Ib;
pf = 0.8;

Vt = fasor(Vt_pu,0);
Ia = fasor_rad(Ia_pu,-acos(pf));
Ei = Vt + Ia*Xd;
Ei_modulo = abs(Ei)
Ei_fase = rad2deg(angle(Ei))
P_pu = abs(Vt)*abs(Ei)*sin(angle(Ei))/abs(Xd)
Q_pu = (abs(Vt)/abs(Xd))*(abs(Ei)*cos(angle(Ei))-abs(Vt))
%Desenvolvimento da conta na folha de prova
Nova_fase = rad2deg(asin(sin(angle(Ei))/0.9))
Q_pu_novo = (abs(Vt)/abs(Xd))*(abs(0.9*Ei)*cos(angle(0.9*Ei))-abs(Vt))
%% Questão 3
close all
clear all
clc
deltaV = 0.03;
Xd = fasor(0.05,90);
ca = 1/(1+deltaV);
Yeq = 1/Xd;

%Letra A
Ya = [ Yeq              -ca*Yeq;
      Yeq*abs(ca)^2     -conj(ca)*Yeq;]

cb = fasor(1,1);

Yb = [ Yeq              -cb*Yeq;
      Yeq*abs(cb)^2     -conj(cb)*Yeq;]


