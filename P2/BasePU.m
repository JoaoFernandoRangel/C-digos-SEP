classdef BasePU
    properties
        potencia  %Valor base de potencia 
        tensao_linha    %Valor base de potencia
        tensao_fase
        corrente  %Valor base de potencia
        imped     %Valor base de potencia
        fase      %Valor base de potencia
    
    end
    methods
        % Construtor da classe
        function obj = BasePU(pot, ten, cor, impe, f)
            if nargin > 0
                obj.potencia= pot;
                obj.tensao_linha= ten;
                obj.corrente= cor;
                obj.imped= impe;
                obj.fase= f;
                end
        end
        function obj = calcI(obj)
            obj.corrente = obj.potencia/obj.tensao_linha;
        end
        function obj = calcV(obj)
            obj.tensao_linha = obj.potencia/obj.corrente;
        end
        function obj = calcZ(obj)
            obj.imped = obj.tensao_linha^2/obj.potencia;
        end
        function obj = calcP(obj)
            obj.potencia = obj.tensao_linha*obj.corrente;
        end
    end
end


