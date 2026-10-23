% Test_Test_triangle_tourne_vers_source.m
%
% Triangle du plan z = 0, de normale [0 0 1], pour trois positions de la
% source. Un dessin par cas, valeur de test dans le titre

A = [0 0 0];  B = [1 0 0];  C = [0 1 0];
G = Calcul_centre_de_gravite(A, B, C);
N = Calcul_normale_triangle(A, B, C);

% Une source par ligne :
% 1 : au-dessus du triangle -> attendu 1
% 2 : en dessous du triangle -> attendu 0
% 3 : dans le plan du triangle (cas limite) -> attendu 0
Sources = [0 0 2;
           0 0 -2;
           2 0 0];

figure

for k = 1:3
    Source = Sources(k,:);
    test = Test_triangle_tourne_vers_source(A, B, C, Source);

    subplot(1,3,k)
    hold on
    patch('Vertices', [A; B; C], 'Faces', [1 2 3], 'FaceColor', [0.7 0.8 1])
    quiver3(G(1), G(2), G(3), N(1), N(2), N(3), 'b', 'LineWidth', 2)
    plot3([G(1) Source(1)], [G(2) Source(2)], [G(3) Source(3)], 'r--')
    plot3(Source(1), Source(2), Source(3), 'or', 'MarkerFaceColor', 'r')
    axis equal
    view(3)
    title(['test = ' num2str(test)])
end
