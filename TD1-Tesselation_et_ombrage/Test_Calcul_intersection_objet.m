% Test_Calcul_intersection_objet.m
%
% La pyramide et quatre segments. Un dessin par cas : la pyramide, le
% segment, le point I s'il y a intersection, et la valeur de test dans le
% titre.

[Sommets, Triangles] = Definition_pyramide;
Source = [2 -1.2 1.6];

% Centre de gravité de la face 1, tournée vers la source
G1 = Calcul_centre_de_gravite(Sommets(Triangles(1,1),:), Sommets(Triangles(1,2),:), Sommets(Triangles(1,3),:));

% Centre de gravité de la face 3, qui n'est pas tournée vers la source
G3 = Calcul_centre_de_gravite(Sommets(Triangles(3,1),:), Sommets(Triangles(3,2),:), Sommets(Triangles(3,3),:));

% Un segment par ligne :
% 1 : traverse la pyramide, attendu 1
% 2 : passe à côté de la pyramide, attendu 0
% 3 : de la source à G1 ; la face 1 elle-même ne compte pas (cas limite), attendu 0
% 4 : de la source à G3 ; le segment traverse la pyramide, attendu 1
P1 = [0.8 0.5 2;
      3   3   3;
      Source;
      Source];
P2 = [0.8 0.5 -1;
      3  -3   3;
      G1;
      G3];

figure

for k = 1:4
    [test, I] = Calcul_intersection_objet(Sommets, Triangles, P1(k,:), P2(k,:));

    subplot(2,2,k)
    hold on
    patch('Faces', Triangles, 'Vertices', Sommets, 'FaceColor', [0.7 0.8 1], 'FaceAlpha', 0.5)
    plot3([P1(k,1) P2(k,1)], [P1(k,2) P2(k,2)], [P1(k,3) P2(k,3)], 'b', 'LineWidth', 2)
    if test == 1
        plot3(I(1), I(2), I(3), 'or', 'MarkerFaceColor', 'r')
    end
    axis equal
    view(3)
    title(['test = ' num2str(test)])
end
