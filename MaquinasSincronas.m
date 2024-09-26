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
Ibase = Sbase/sqrt(3)*Vbase;
Vbus = 15e3;
Ei_mod = 24e3; %fase-fase
Ei_ang = 27.4;

Va = Vbus/Vbase; % Volt bus PU
Ei = fasor(Ei_mod/Vbase,27.4); %pu
Ia_pu = (Ei-Va)/(Xd);
% fasor_comp(Ia_pu);
Ia = abs(Ia_pu)*Ibase







