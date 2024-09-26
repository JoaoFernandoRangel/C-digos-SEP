function [Z] = fasor_pf(modulo,pf)
Z= modulo*exp(1i*acos(pf));
end

