classdef LinhaT
    properties
        R % Ohm/km
        X %Ohm/km
        L %km
        Z %Impedância
    end
    methods
        % Construtor da classe
        function obj = LinhaT(Re,Xe,Le)
            if nargin > 0
                obj.R = Re;
                obj.X = Xe;
                obj.L = Le;
                obj.Z = Re*Le + 1i*Le*Xe;
            end
        end
    end
end


