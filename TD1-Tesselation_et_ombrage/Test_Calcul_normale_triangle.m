% Test_Calcul_normale_triangle.m
%
% Un dessin par cas : le triangle, sa normale tracée depuis son centre de
% gravité, et la valeur de la normale dans le titre.

figure

%% Cas général : triangle du plan z = 0, parcouru dans le sens
% trigonométrique, attendu [0 0 1]
A = [0 0 0];  B = [1 0 0];  C = [0 1 0];
N = Calcul_normale_triangle(A, B, C);
G = Calcul_centre_de_gravite(A, B, C);

subplot(2,2,1)
hold on
patch('Vertices', [A; B; C], 'Faces', [1 2 3], 'FaceColor', [0.7 0.8 1])
quiver3(G(1), G(2), G(3), N(1), N(2), N(3), 'r', 'LineWidth', 2)
text(A(1), A(2), A(3), ' A'), text(B(1), B(2), B(3), ' B'), text(C(1), C(2), C(3), ' C')
axis equal; grid on; view(3)
title(['ABC : N = ' num2str(N)])

% Le même triangle parcouru dans l'autre sens, attendu [0 0 -1]
N = Calcul_normale_triangle(A, C, B);

subplot(2,2,2)
hold on
patch('Vertices', [A; C; B], 'Faces', [1 2 3], 'FaceColor', [0.7 0.8 1])
quiver3(G(1), G(2), G(3), N(1), N(2), N(3), 'r', 'LineWidth', 2)
text(A(1), A(2), A(3), ' A'), text(B(1), B(2), B(3), ' B'), text(C(1), C(2), C(3), ' C')
axis equal; grid on; view(3)
title(['ACB : N = ' num2str(N)])

% Triangle quelconque : la normale doit être perpendiculaire au triangle
P = [1 2 0];  Q = [3 -1 2];  R = [0 1 4];
N = Calcul_normale_triangle(P, Q, R);
G = Calcul_centre_de_gravite(P, Q, R);

subplot(2,2,3)
hold on
patch('Vertices', [P; Q; R], 'Faces', [1 2 3], 'FaceColor', [0.7 0.8 1])
quiver3(G(1), G(2), G(3), N(1), N(2), N(3), 'r', 'LineWidth', 2)
text(P(1), P(2), P(3), ' P'), text(Q(1), Q(2), Q(3), ' Q'), text(R(1), R(2), R(3), ' R')
axis equal; grid on; view(3)
title(['PQR : N = ' num2str(N)])

%% Cas limite : trois points alignés, la normale n'existe pas, attendu NaN
A = [0 0 0];  B = [1 1 1];  C = [2 2 2];
N = Calcul_normale_triangle(A, B, C);

subplot(2,2,4)
hold on
plot3([A(1) C(1)], [A(2) C(2)], [A(3) C(3)], 'k', 'LineWidth', 2)
axis equal; grid on; view(3)
title(['Points alignés : N = ' num2str(N)])
