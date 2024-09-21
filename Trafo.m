classdef Trafo
    properties
        Vprimario     % Tensão no primário
        Vsecundario   % Tensão no secundário
        n             % Relação de transformação
        Pnominal      % Potência nominal
        Vnominal      % Tensão nominal
        Znominal      % Impedância nominal 
    end
    methods
        % Construtor da classe
        function obj = Trafo(Vprim, Vsec, Pnom, Vnom)
            if nargin > 0
                obj.Vprimario = Vprim;
                obj.Vsecundario = Vsec;
                obj.n = Vprim/Vsec;
                obj.Pnominal = Pnom;
                obj.Vnominal = Vnom;
                obj.Znominal = Vnom^2/Pnom;
            end
        end
    end
end


