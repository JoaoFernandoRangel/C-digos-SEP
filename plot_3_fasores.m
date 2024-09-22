function plot_3_fasores(Va,Vb,Vc)
 % Função para plotar o diagrama fasorial das tensões Va, Vb e Vc    
    % Criar o diagrama fasorial
    tamanho = [abs(Va) abs(Vb) abs(Vc)];
    figure;
    hold on;
    grid on;    
    % Plotar cada fasor
    quiver(0, 0, real(Va), imag(Va), 'r', 'LineWidth', 2, 'MaxHeadSize', 0.5); % Fasor Va
    quiver(0, 0, real(Vb), imag(Vb), 'g', 'LineWidth', 2, 'MaxHeadSize', 0.5); % Fasor Vb
    quiver(0, 0, real(Vc), imag(Vc), 'b', 'LineWidth', 2, 'MaxHeadSize', 0.5); % Fasor Vc    
    % Ajustar os eixos
    axis equal;
    xlim([-max(tamanho), max(tamanho)]);
    ylim([-max(tamanho), max(tamanho)]);    
    % Adicionar legendas
    legend(inputname(1),inputname(2),inputname(3));
    xlabel('Real');
    ylabel('Imaginary');
    title(sprintf('Diagrama Fasorial das Tensões %s, %s, %s', inputname(1), inputname(2), inputname(3)));    
    hold off;
end

