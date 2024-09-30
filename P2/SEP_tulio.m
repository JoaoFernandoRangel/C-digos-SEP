%% Nodal 1 - exemplo 2.1
clear all
close all
clc
E1 = 100
[E2(1), E2(2)] = pol2cart(deg2rad(30),100);
E2 = E2(1) + i*E2(2)
Z = 5i
I = (E1-E2)/Z
S1 = E1*-conj(I)
S2 = E2*conj(I)
Sz = S1+S2
%% Nodal 2 - exercício pu
clear all
close all
clc

Vh = 13800
Vl = 220
n = 13800/220
Zl = 500
Zh = 500*n^2
P = 150e3
pc = Vl^2/Zl

Ibaseh = P/Vh
Ipuh = 1
Ibasel = P/Vl
Zbasel = Vl/Ibasel
Zpul = Zl/Zbasel
Zbaseh = Vh/Ibaseh
Zpuh = Zh/Zbaseh

pcpu=P/(Ipuh^2*Zpuh);


%% Nodal 3 - Representação pu
clear all
close all
clc

Pb = 50e6
Sn1 = 41.5e6
Sn2 = 33e6
Sn3 = 24e6
X1 = 5.5/100
X2 =7/100
X3 =5/100
Vb1 = 230e3
Vb2 = Vb1/(138e3/69e3)
Vb4 = Vb2/(69e3/13.8e3)
Vb3 = Vb2/(69e3/34.5e3)
Zb1 = Vb1^2/Pb
Ib1 = Pb/Vb1/(3^(1/2))
Zb2 = Vb2^2/Pb
Ib2 = Pb/Vb2/(3^(1/2))
Zb3 = Vb3^2/Pb
Ib3 = Pb/Vb3/(3^(1/2))
Zb4 = Vb4^2/Pb
Ib4 = Pb/Vb4/(3^(1/2))

ZLtapu = 150*(0.12+i*0.92)/Zb2
ZLtbpu = 230*(0.19+i*1.84)/Zb3

ZT1 = X1*(Pb/Sn1)*(138e3/Vb1)^2
ZT2 = X2*(Pb/Sn2)*(69e3/Vb2)^2
ZT3 = X3*(Pb/Sn3)*(69e3/Vb2)^2
%% Nodal 3 - exercício 1
clear all 
close all 
clc
Y = [-0.8-4-5,0,4,5;0,-0.8-2.5-5,2.5,5;4,2.5,-4-8-2.5-.8,8;5,5,8,-5-8-5]*i
Z = inv(Y)
I = [1.2;5;-6;0]   
V = Z*I

Y1 = [-0.8-4-5,0,4,5 ; 0,-0.8-2.5-5,2.5,5 ; 4,2.5,-4-2.5-.8,0 ; 5,5,0,-5-5]*i

Y2 = [-0.8-4-5,0,4,5,0.8 ; 0,-0.8-2.5-5,2.5,5,0.8 ; 4,2.5,-4-8-2.5-.8,8,0.8 ; 5,5,8,-5-8-5,0 ; 0.8,0.8,0.8,0,-0.8-0.8-0.8]*i

%% Nodal 4 - exercício 2
clear all
close all
clc

Pb = 100e6
T1p = 138e3
T1s = 69e3
S1 = 41.5e6
X1 = 5.5/100
T2p = 69e3
T2s = 13.8e3
S2 = 33e6
X2 = 7/100
T3p = 69e3
T3s = 34.5e3
S3 = 24e6
X3 = 5/100

Vb1 = 138e3
Vb2 = Vb1/(T1p/T1s)
Vb3 = Vb2/(T2p/T2s)
Vb4 = Vb2/(T3p/T3s)
Ib1 = Pb/Vb1/(3^(1/2))
Ib2 = Pb/Vb2/(3^(1/2))
Ib3 = Pb/Vb3/(3^(1/2))
Ib4 = Pb/Vb4/(3^(1/2))
Zb1 = Vb1^2/Pb
Zb2 = Vb2^2/Pb
Zb3 = Vb3^2/Pb
Zb4 = Vb4^2/Pb

ZLTa = 30*(0.12+i*0.92)/Zb2
ZLTb = 10*(0.19+i*1.84)/Zb4

ZT1 = (X1*(Pb/S1)*(T1p/Vb1)^2)*i
ZT2 = (X2*(Pb/S2)*(T2p/Vb2)^2)*i
ZT3 = (X3*(Pb/S3)*(T3p/Vb2)^2)*i
Zf1 = i*0.1
Zf2 = i*1e12

YLTa = 1/ZLTa
YLTb = 1/ZLTb

YT1 = 1/ZT1
YT2 = 1/ZT2
YT3 = 1/ZT3
Yf1 = 1/Zf1
Yf2 = 1/Zf2

I1 = 1/Zf1

I6 = (10e6/Pb)/(34.5e3/Vb4);
[I6(1), I6(2)] = pol2cart(deg2rad(154.158),I6);
I6 = I6(1) + i*I6(2)

I = [I1;0;0;0;0;I6]
%Falta matriz de admitância, Matriz de impedância, vetor de tensão

%% Trafo 1 - exemplo 2.1
clear all
close all
clc
N1 = 2000;
N2 = 500;
n = N1/N2;
V1 = 1200;
[I1(1), I1(2)] = pol2cart(deg2rad(-30),5);
I1 = I1(1) +I1(2)*i;
V2 = V1/n;
I2 = I1*n;
Z2 = V2/I2
Z2r = V1/I1

%% Trafo 2 - exemplo 2.2
clear all
close all
clc
N1 = 2000;
N2 = 500;
n = N1/N2;
V1 = 1200;
rc = 12;
x1 = 8i;
x1r = x1/(n^2);
x2 = 0.5i;
r1 = 2;
r1r = (r1/n^2);
r2 = 0.125;
V2 = V1/n;
V2c = rc/(rc+x1r+x2+r1r+r2)*V2
[V2p(2),V2p(1)] = cart2pol(real(V2c),imag(V2c))
V2p(2) = rad2deg(V2p(2))

reg = (V2 - V2p(1))/V2p(1)*100


%% Trafo 3 - exemplo 2.7
clear all
close all
clc
n = 10;
pb = 75e6;
vba = 66e3;
vbb = vba/n/3^(1/2);
zbb = vbb^2/pb;
zba = vba^2/pb;
zpub = 0.6/zbb;
zpua = 0.6*(vba/vbb)^2/zba;

%% Trafo 4 - exemplo 2.10
clear all
close all
clc
p = 90e6;
vp = 80e3;
vs = 120e3;
I2 = p/vs;
pt = I2*(vs+vp);

%% Trafo 5 - exemplo 2.9
clear all
close all
clc
Ic = 240e6/230e3;
Ibpu = 100e6/230e3;

Icpu = Ic / Ibpu;

%% Trafo 6 - exemplo 2.11
pb = 15e6;
vb = 66e3;
pst = 10e6;
vst = 13.2e3;


zst = 8/100*(pb/pst);
zpt = 9/100;
zps = 7/100;

Zp = i*1/2*(zps + zpt - zst);

%% Trafo 7 - exercício 3.9 (glover)
close all 
clear all
clc

pb = 300e6;
vbp = 13.8e3;
vbs = 199.2e3;

zps = 0.1*(pb/pb)*(vbp/vbp)^2
zpt = 0.16*(pb/50e6)*(vbp/vbp)^2
zst = 0.14*(pb/50e6)*(vbs/vbs)^2

Zp = i*1/2*(zps+zpt-zst)

%% Trafo 8 - exercício 3.12 (glover)
clear all
close all
clc
Vp=13.8e3;
Vs=345e3;
Zpu = i*0.1*(50/100);
b = Vp/Vs;
a = b;
c = a/b;
Ya  = c*1/Zpu;
Yb = (1-c)*1/Zpu;
Yc = (c^2-c)/1/Zpu;

%% Trafo 8 b - exercício 3.12 (glover)
clear all
close all
clc
Vp=13.8e3;
Vs=345e3;

Zpu = i*0.1*(50/100);
b = Vp/Vs;
a = Vp/(0.9*Vs);
c = a/b;
Ya  = c*1/Zpu;
Yb = (1-c)*1/Zpu;
Yc = (c^2-c)/1/Zpu;

%% Trafo 9 - exercício 3.13 (glover)
clear all
close all
clc
c = 1/(1+5/100)
c2 = 1
Zeq = i*0.25
Zeq2 =i*0.2
Y11 = 1/Zeq
Y12 = -c*1/Zeq
Y22 = c^2*1/Zeq
Y21=Y12

LY11 = 1/Zeq2
LY12 = -c2*1/Zeq2
LY22 = c2^2*1/Zeq2
LY21 = LY12

Y_1 = [Y11,Y12;Y21,Y22]
Y_2 = [LY11,LY12;LY21,LY22]

Yt = Y_1+Y_2


%% Trafo 9
clear all
close all
clc

[c(1),c(2)]=pol2cart(deg2rad(-3),1);
c = c(1) + i*c(2);
c2 = 1
Zeq = i*0.25
Zeq2 =i*0.2
Y11 = 1/Zeq
Y12 = -c*1/Zeq
Y22 = abs(c)^2*1/Zeq
Y21=  -conj(c)*1/Zeq

LY11 = 1/Zeq2
LY12 = -c2*1/Zeq2
LY22 = c2^2*1/Zeq2
LY21 = LY12

Y_1 = [Y11,Y12;Y21,Y22]
Y_2 = [LY11,LY12;LY21,LY22]

Yt = Y_1+Y_2

abs(Yt)
rad2deg(angle(Yt))

%% Máquina síncrona 1
clear all
close all
clc
ppu = 1;
Vapu = 1;
[Ipu(1),Ipu(2)] = pol2cart(deg2rad(-25.8419),1);
Ipu = Ipu(1) + i*Ipu(2);
Zd = i*2*pi*60*(2.7656e-3 + 1.3828e-3)
Zb = i*24e3^2/635e6
Xd = i*Zd/Zb
Ei = Ipu*Xd+Vapu
abs(Ei)
rad2deg(angle(Ei))


%% Máquina síncrona 2 - exemplo
clear all
close all
clc
ppu = 1;
Vapu = 1;
[Ipu(1),Ipu(2)] = pol2cart(deg2rad(-25.8419),0.8);
Ipu = Ipu(1) + i*Ipu(2);
Zd = i*2*pi*60*(2.7656e-3 + 1.3828e-3)
Zb = i*24e3^2/635e6
Xd = i*Zd/Zb
Ei = Ipu*Xd+Vapu

P = abs(Ei)*Vapu/imag(Xd)*sin(angle(Ei))
Q = Vapu/imag(Xd)*(abs(Ei)*cos(angle(Ei))-Vapu)


b = asin(P/(abs(Ei)*Vapu/imag(Xd)*1.2))
k = rad2deg(b)
Q = Vapu/imag(Xd)*(1.2*abs(Ei)*cos(b)-Vapu)

c = asin(P/(abs(Ei)*Vapu/imag(Xd)*0.8))
j = rad2deg(c)
Q = Vapu/imag(Xd)*(0.8*abs(Ei)*cos(c)-Vapu)

%% Máquina síncrona 3 - exemplo 3.8
clear all
close all
clc

Sb = 75e6
Vbh = 69e3
Vbl = 13.8e3
Eipu = 66e3/Vbh            %tensão antes da falha/tensão pós falha
Sg1 = 50e6
Sg2 = 25e6
Xd1 = i*0.25*Sb/Sg1
Xd2 = i*0.25*Sb/Sg2
Xt = i*0.1
Xd_paralelo = Xd1*Xd2/(Xd1+Xd2)
Ipu = Eipu/(Xt+Xd_paralelo)
Vbpu = Ipu*Xt
Ig1 = (Eipu-Vbpu)/Xd1
Ig2 = (Eipu-Vbpu)/Xd2

%% Máquina síncrona 4 - Exemplo 3.12
close all
clear all
clc
Sb = 50e6
Vb1 = 220e3
Xg1 = i*0.2*(50e6/20e6)*(13.8e3/13.8e3)^2
Xg2 = i*0.2*(50e6/30e6)*(18e3/18e3)^2
Xg3 = i*0.2*(50e6/30e6)*(20e3/22e3)^2
Xt1 = i*0.1*(50e6/25e6)*(13.8e3/13.8e3)^2
Xt2 =i*0.1*(50e6/30e6)*(18e3/18e3)^2
Xt3 =i*0.1*(50e6/35e6)*(220e3/220e3)^2
Zb = Vb1^2/Sb
XL1 = i*80/Zb
XL2 = i*100/Zb
Xramo1 = Xg1+Xt1+XL1
Xramo2 = Xg2+Xt2+XL2
Xramo3 = Xg3+Xt3
Xeq = 1/(1/Xramo1+1/Xramo2+1/Xramo3)
I = 1/Xeq
