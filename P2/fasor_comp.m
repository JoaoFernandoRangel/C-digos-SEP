function [mod,angulo] = fasor_comp(Z)
%FASOR_COMP Summary of this function goes here
%   Detailed explanation goes here
fasor = [abs(Z) rad2deg(angle(Z))]
mod = fasor(1);
angulo = fasor(2);
end

