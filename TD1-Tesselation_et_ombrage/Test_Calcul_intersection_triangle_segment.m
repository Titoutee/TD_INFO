% Test_Calcul_intersection_triangle_segment.m
%
% Triangle du plan z = 0 et cinq segments [P1, P2]. Un dessin par cas : le
% triangle, le segment, le point I s'il y a intersection, et la valeur de
% test dans le titre.

A = [0 0 0];  B = [1 0 0];  C = [0 1 0];

% Un segment par ligne :
% 1 : traverse le triangle, attendu 1
% 2 : trop court, s'arrête avant le plan (cas limite), attendu 0
% 3 : passe à côté du triangle (cas limite), attendu 0
% 4 : parallèle au plan du triangle (cas limite), attendu 0
% 5 : contenu dans le plan du triangle (cas limite), attendu 0
P1 = [0.2 0.2 1;
      0.2 0.2 1;
      2   0   1;
      0   0   1;
     -0.5 0.2 0];
P2 = [0.2 0.2 -1;
      0.2 0.2 0.5;
      2   0  -1;
      1   1   1;
      1   0.2 0];

figure

for k = 1:5
    [test, I] = Calcul_intersection_triangle_segment(A, B, C, P1(k,:), P2(k,:));

    subplot(2,3,k)
    hold on
    patch('Vertices', [A; B; C], 'Faces', [1 2 3], 'FaceColor', [0.7 0.8 1])
    plot3([P1(k,1) P2(k,1)], [P1(k,2) P2(k,2)], [P1(k,3) P2(k,3)], 'b', 'LineWidth', 2)
    if test == 1
        plot3(I(1), I(2), I(3), 'or', 'MarkerFaceColor', 'r')
    end
    axis equal
    view(3)
    title(['test = ' num2str(test)])
end
