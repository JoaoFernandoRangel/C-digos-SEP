close all
clear all
clc

f = 60;
S = 635e6;
fp = 0.90;
vs = 3600; %rpm
Vnom = 24e3;
Ls = 2.7656e-3;
Ms = 1.3828e-3;
R = 0;
Zohm_base = Vnom^2/S;
Xd = 1i*2*pi*f*(Ls+Ms)/Zohm_base; %pu
Va = 1*exp(1i*0); %pu
Ia = 1*exp(-1i*(acos(fp)));
% rad2deg(angle(Ia))
Ei = Va+Xd*Ia;
rad2deg(angle(Ei))
abs(Ei)
% plot_4_fasores(Va, Ia, Ei, Xd)
%%
close all
clear all
clc

Sbase = 635e6;
N = 3600; %rpm
Vt = 24e3;
Vt_pu = 1;
Xd = 1i*1.7241; %pu

fp = 0.9;
Ei = Vt_pu + 0.8*exp(-1i*acos(fp))*Xd;
% abs(Ei)
% rad2deg(angle(Ei))
P = abs(Vt_pu)*abs(Ei)*sin(angle(Ei))/abs(Xd);
Q = (abs(Vt_pu)/abs(Xd))*(abs(Ei)*cos(angle(Ei))-abs(Vt_pu));
S = P + 1i*Q;
% plot_3_fasores(S,P,1i*Q)
novo_delta_12 = asin((P*abs(Xd))/(abs(Vt_pu)*1.2*abs(Ei)));
rad2deg(novo_delta_12);
Novo_Q = (abs(Vt_pu)/abs(Xd))*(1.2*abs(Ei)*cos(novo_delta_12)-abs(Vt_pu));
novo_delta_08 = asin((P*abs(Xd))/(abs(Vt_pu)*0.8*abs(Ei)));
% rad2deg(novo_delta_08)
Novo_Q_08 = (abs(Vt_pu)/abs(Xd))*(0.8*abs(Ei)*cos(novo_delta_08)-abs(Vt_pu));
%%
%3.1, 3.3, 3.4, 3.5, 3.12, 3.13
%%
% 3.3
close all
clear all
clc

Xd_pu = 1.65*1i;
Vt = fasor(1,30);
%Ei para corrente de 1/30º pu
Ei_30 = Vt + Xd_pu*fasor(1,30);
% fasor_comp(Ei);
Ei_0 = Vt + Xd_pu*fasor(1,0);
Ei_30_ = Vt + Xd_pu*fasor(1,-30);
%%
% 3.4
close all
clear all
clc

V = 10e3;
S = 50e6;
R = 0.1;
Xd = 1i*1.65;
Ibase = 50e3/(sqrt(3)*10);
Ia = 2000/Ibase;

% Ei = 1 + fasor(Ia,rad2deg(acos(0.9)))*Xd;
Ei_pu = 1 + Ia*exp(1i*acos(0.9))*(R+Xd);
Ei = abs(Ei_pu*10)
%%
% 3.5
close all
clear all
clc

Vt = 16e3;
S = 200e6;
Xd = 1i*1.65; %Pu

Vbase = 16e3;
Sbase = 200e6;
% Ibase = Sbase/sqrt(3)*Vbase
Ibase = 200e3/(sqrt(3)*16);
Vbus = 15e3;
Ei = fasor(24e3/Vbase,27.4);

Ia = (Ei-fasor(Vbus/Vbase,0))/fasor(abs(Xd),90);
% abs(Ia)
% rad2deg(angle(Ia))
Ia_real = abs(Ia)*Ibase;
S_pu = (Vbus/Vbase)*abs(Ia);
S_mod = S_pu*200e6;
S = fasor(S_mod,rad2deg(angle(Ia)));
% P = S_real*cos(angle(Ia));
% Q = S_real*sin(angle(Ia));

Ia_novo = Ia*0.75;
ang = 90+ rad2deg(angle(Ia));
Ei_novo = (Vbus/Vbase) + fasor(abs(Ia_novo)*abs(Xd),ang);
% abs(Ei_novo)
% rad2deg(angle(Ei_novo))
Ei_novo_LL = Ei_novo*Vbase;
% abs(Ei_novo_LL)
% rad2deg(angle(Ei_novo_LL))

Ei_pf_0 = (Vbus/Vbase) + Xd*abs(Ia_novo)
% abs(Ei_pf_0)
% rad2deg(angle(Ei_pf_0))
%%
close all
clear all
clc

%3.12
G1 = struct('Snominal',20e6,'Vnominal',13.8e3,'Xd_pu',0.2);
G2 = struct('Snominal',30e6,'Vnominal',18e3,'Xd_pu',0.2);
G3 = struct('Snominal',30e6,'Vnominal',20e3,'Xd_pu',0.2);
T1 = struct('Snominal',25e6,'V1_y',220,'V2_d',13.8e3,'xd_pu',0.1);
T2 = struct('Snominal',30e6,'V1_y',220,'V2_d',18e3,'xd_pu',0.1);
T3 = struct('Snominal',35e6,'V1_y',220,'V2_y',22e3,'xd_pu',0.1);
Snovo = 50e6;
G1Z_novo = G1.Xd_pu*(Snovo/G1.Snominal)
G2Z_novo = G2.Xd_pu*(Snovo/G2.Snominal)
G3Z_novo = G3.Xd_pu*(G3.Vnominal/22e3)^2*(Snovo/G3.Snominal)
T1_Xpu = T1.xd_pu*(Snovo/T1.Snominal)
T2_Xpu = T2.xd_pu*(Snovo/T2.Snominal)
T3_Xpu = T3.xd_pu*(Snovo/T3.Snominal)
baseZ = 220^2/50;
L1_Zpu = 80/baseZ
L2_Zpu = 100/baseZ
clc
X1 = G1Z_novo+T1_Xpu+L1_Zpu
X2 = G2Z_novo+T2_Xpu+L2_Zpu
X3 = G3Z_novo+T3_Xpu
tensao = fasor(1,0);
I1 = tensao/fasor(X1,90);
I2 = tensao/fasor(X2,90);
I3 = tensao/fasor(X3,90);
If = I1+I2+I3;
Ibase = Snovo/(sqrt(3)*220e3);
If_real = abs(If)*Ibase
%%
%3.13
close all
clear all
clc
Sbase = 50e6;
Vbase = 138e3;

G1 = struct('S',20e6,'Vn',18e3,'Xd2',0.2);
G2 = struct('S',20e6,'Vn',18e3,'Xd2',0.2);
M3 = struct('S',30e6,'Vn',13.8e3,'Xd2',0.2);
Tyy = struct('S',20e6,'V1',138e3,'V2',20e3,'X',0.1);
Tyd = struct('S',15e6,'V1',138e3,'V2',13.8e3,'X',0.1);
%Linhas
Zbase = Vbase^2/Sbase;
Z40 = 40/Zbase
Z20 = 20/Zbase
%Transformadores
Tyy_Z = Tyy.X*(Sbase/Tyy.S)
Tyd_Z = Tyd.X*(Sbase/Tyd.S)
%Geradores 
G = G1.Xd2*(G1.Vn/20e3)^2*(Sbase/G1.S)
%Motor
M3 = M3.Xd2*(Sbase/M3.S)
% clc
Ei1 = fasor(1,0);
Ei2 = Ei1;
Ei3 = Ei1;
X1 = 1i*(G+Tyy_Z+Z20+Tyd_Z);
X2 = X1;
X3 = Tyd_Z;
I1 = Ei1/abs(X1);
I2 = I1;
I3 = Ei3/abs(X3);
If = I1+I2+I3;
Ibase = Sbase/(sqrt(3)*Vbase/10)
If_real = If * Ibase;



