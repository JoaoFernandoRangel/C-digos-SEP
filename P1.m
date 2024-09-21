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


















