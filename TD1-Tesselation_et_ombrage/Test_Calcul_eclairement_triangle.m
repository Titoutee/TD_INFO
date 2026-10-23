% Test_Calcul_eclairement_triangle.m
%
% Triangle du plan z = 0, de normale [0 0 1] ; 4 positions de la
% source. Un dessin par cas : le triangle a pour niveau de gris E 
% (valeur de E dans le titre)

A = [0 0 0];  B = [1 0 0];  C = [0 1 0];
G = Calcul_centre_de_gravite(A, B, C);
N = Calcul_normale_triangle(A, B, C);

% Une source par ligne, à la distance 2 de G :
% 1 : à la verticale de G -> attendu 1
% 2 : rayon à 60 degrés de la normale -> attendu cos(60°) = 0.5
% 3 : lumière rasante (cas limite) -> attendu 0
% 4 : derrière le triangle -> attendu 0
Sources = [G + [0 0 2];
           G + [sqrt(3) 0 1];
           G + [2 0 0];
           G + [0 0 -2]];

figure

for k = 1:4
    Source = Sources(k,:);
    E = Calcul_eclairement_triangle(A, B, C, Source);

    subplot(2,2,k)
    hold on
    patch('Vertices', [A; B; C], 'Faces', [1 2 3], 'FaceColor', [E E E])   % gris : noir si E = 0, blanc si E = 1
    quiver3(G(1), G(2), G(3), N(1), N(2), N(3), 'b', 'LineWidth', 2)
    plot3([G(1) Source(1)], [G(2) Source(2)], [G(3) Source(3)], 'r--')
    plot3(Source(1), Source(2), Source(3), 'or', 'MarkerFaceColor', 'r')
    axis equal
    view(3)
    title(['E = ' num2str(E)])
end
