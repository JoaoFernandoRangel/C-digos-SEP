classdef Trafo
    properties
        %Todas as tensão são fase-fase.
        Vprimario     % Tensão nominal no primário do transformador (em volts)
        Vsecundario   % Tensão nominal no secundário do transformador (em volts)
        n             % Relação de transformação do transformador (Vprimario/Vsecundario)
        Pnominal      % Potência nominal do transformador (em volt-ampères, VA ou kVA)
        Znominal      % Impedancia nominal
        xf_porcento   % Impedância do transformador em porcentagem, em relação à potência nominal

        Vprim_pu      % Tensão no primário em unidades por unidade (p.u.)
        Vsec_pu       % Tensão no secundário em unidades por unidade (p.u.)
        Pnominal_pu   % Potência nominal em unidades por unidade (p.u.)
        Zpu           % Impedância em unidades por unidade (p.u.), obtida a partir da impedância percentual
    end
    methods
        % Construtor da classe
        function obj = Trafo(Vprim, Vsec, Pnom, Xfporcento)
            if nargin > 0
                obj.Vprimario = Vprim;
                obj.Vsecundario = Vsec;
                obj.n = Vprim/Vsec;
                obj.Pnominal = Pnom;
                obj.Znominal = Vprim^2/Pnom;
                obj.xf_porcento = 1i*Xfporcento/100;
            end
        end
                % Função para calcular os valores em PU
        function obj = calcularPU(obj, Vbase, Pbase, Zbase)
            % Função para calcular os valores do transformador em PU
            
            % Calcular tensão primária e secundária em PU
            obj.Vprim_pu = obj.Vprimario / Vbase;
            obj.Vsec_pu = obj.Vsecundario / Vbase;
        
            % Calcular a potência nominal em PU
            obj.Pnominal_pu = obj.Pnominal / Pbase;
            
            % Calcular a impedância em PU
            obj.Zpu = obj.Znominal/Zbase;
        end
    end
end


