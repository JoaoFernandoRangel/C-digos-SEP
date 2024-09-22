function plot_4_fasores(Va, Vb, Vc, Vd)
    % Função para plotar o diagrama fasorial das tensões Va, Vb, Vc e Vd
    
    % Criar o diagrama fasorial
    magnitudes = [abs(Va), abs(Vb), abs(Vc), abs(Vd)];
    figure;
    hold on;
    grid on;
    
    % Plotar cada fasor
    quiver(0, 0, real(Va), imag(Va), 'r', 'LineWidth', 2, 'MaxHeadSize', 0.5); % Fasor Va
    quiver(0, 0, real(Vb), imag(Vb), 'g', 'LineWidth', 2, 'MaxHeadSize', 0.5); % Fasor Vb
    quiver(0, 0, real(Vc), imag(Vc), 'b', 'LineWidth', 2, 'MaxHeadSize', 0.5); % Fasor Vc
    quiver(0, 0, real(Vd), imag(Vd), 'm', 'LineWidth', 2, 'MaxHeadSize', 0.5); % Fasor Vd
    
    % Ajustar os eixos de acordo com a maior magnitude
    axis equal;
    limite = max(magnitudes);
    xlim([-limite, limite]);
    ylim([-limite, limite]);
    
    % Adicionar legendas com os nomes das variáveis passadas
    legend(inputname(1), inputname(2), inputname(3), inputname(4));
    
    % Título com os nomes das variáveis passadas
    title(sprintf('Diagrama Fasorial das Tensões %s, %s, %s, %s', inputname(1), inputname(2), inputname(3), inputname(4)));
    
    % Configurar eixos
    xlabel('Real');
    ylabel('Imaginary');
    
    hold off;
end
