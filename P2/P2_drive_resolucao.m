clear all
close all
clc
%Exemplo do Slide
TA = struct('S',41.5e6,'V1',138e3,'V2',69e3,'X',5.5/100);
TB = struct('S',33e6,'V1',69e3,'V2',13.8e3,'X',7/100);
TC = struct('S',24e6,'V1',69e3,'V2',34.5e3,'X',5/100);
LTa = 150*(0.12+1i*0.92);
LTb = 230*(0.19+1i*1.84);
Sb = 50e6;
Vb = 230e3;
Vb1 = Vb;
Vb2 = Vb1/(TA.V1/TA.V2);
Vb3 = Vb2/(TC.V1/TC.V2);
Vb4 = Vb2/(TB.V1/TB.V2);
Zb1 = Vb1^2/Sb
Zb2 = Vb2^2/Sb
Zb3 = Vb3^2/Sb
Zb4 = Vb4^2/Sb
Zta_pu = 1i*TA.X*(Sb/TA.S)*(TA.V1/Vb1)^2 
Ztb_pu = 1i*TB.X*(Sb/TB.S)*(TB.V1/Vb2)^2 
ZtC_pu = 1i*TC.X*(Sb/TC.S)*(TC.V1/Vb2)^2 
clc
Zta_pu = 1i*TA.X*(Sb/TA.S)*(TA.V1/Vb1)^2 
Ztb_pu = 1i*TB.X*(Sb/TB.S)*(TB.V1/Vb2)^2 
ZtC_pu = 1i*TC.X*(Sb/TC.S)*(TC.V1/Vb2)^2 

Ib1 = Sb/(sqrt(3)*Vb1)
Ib2 = Sb/(sqrt(3)*Vb2)
Ib3 = Sb/(sqrt(3)*Vb3)
Ib4 = Sb/(sqrt(3)*Vb4)

LTa_pu = LTa/Zb2
LTb_pu = LTb/Zb3

LTa_pu
LTb_pu
%%
close all
clear all
clc
%Minha resolução da 1
Sb = 200e6;
Vb = 13.8e3;
Zb = Vb^2/Sb; %Ohm
G1 = struct('Sn',50e6,'Vn',13.8e3,'Xd',8/100);
TA = struct('Sn',60e6,'V1',13.8e3,'V2',138e3,'X',0.06);
TB = struct('Sn',30e6,'V1',138e3,'V2',69e3,'X',0.06);
TC = struct('Sn',50e6,'V1',138e3,'V2',13.8e3,'X',0.07);
LTa = (1.9 + 1i*4)/Zb
LTb = (2.85 +1i*6)/Zb
Vb1 = Vb;
Vb2 = Vb1/(TA.V2/TA.V1);
Vb3 = Vb2/(TB.V2/TB.V1);
Vb4 = Vb2/(TC.V2/TC.V1);
ZTA_pu = 1i*TA.X*(Sb/TA.Sn)*(TA.V1/Vb1)^2
ZTB_pu = 1i*TB.X*(Sb/TB.Sn)*(TB.V1/Vb3)^2
ZTC_pu = 1i*TC.X*(Sb/TC.Sn)*(TC.V1/Vb2)^2
ZB2 = Vb2^2/Sb
ZB4 = Vb4^2/Sb
G1Z_pu = G1.Xd*(Sb/G1.Sn)*(G1.Vn/Vb)^2
% Zb1_ohm = Zb;
% Zb2_ohm = Vb2^2/Sb;
% Zb3_ohm = Vb3^2/Sb;
% Zb4_ohm = Vb4^2/Sb;
% Zta
%%
close all
clear all
clc
%Questão 4
Vb = 34.5e3;
Sb = 500e6;
Ib = Sb/(sqrt(3)*Vb)
Xd = 1i*2;
Vt = fasor(1,0);
Ia = fasor_rad(8530/Ib,-acos(0.85));
Ei = Vt + Ia*Xd;
moduloEi = abs(Ei)
faseEi = rad2deg(angle(Ei))
plot_3_fasores(Ei,Vt,Ia)
S = sqrt(3)*Vt*Ia
P = real(S)
Q = imag(S)
gama_novo = rad2deg(asin(sin(angle(Ei))/1.15))
Ei_novo = fasor(Ei,gama_novo)
plot_4_fasores(Vt,Ei,Ia,Ei_novo)
%%
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
%%
close all
clear all
clc







 
