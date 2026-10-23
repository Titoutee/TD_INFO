% Test_Calcul_centre_de_gravite.m

%% Cas général : G doit être à l'intersection des médianes, en [1 1 1]
A = [0 0 0];  B = [3 0 0];  C = [0 3 3];
G = Calcul_centre_de_gravite(A, B, C);

figure

subplot(1,2,1)
hold on

P = [A; B; C; A];
plot3(P(:,1), P(:,2), P(:,3), 'k', 'LineWidth', 2)

M = [(B+C)/2; (A+C)/2; (A+B)/2]; % milieu de l'arête pour dessiner médiane

for i = 1:3
    plot3([P(i,1) M(i,1)], [P(i,2) M(i,2)], [P(i,3) M(i,3)], 'b:')
end

plot3(G(1), G(2), G(3), 'or', 'MarkerFaceColor', 'r')

axis equal
view(3)
title(['G = ' num2str(G)])

%% Cas limite : trois points alignés, G doit être le point du milieu, en [1 1 1]
A = [0 0 0];  B = [1 1 1];  C = [2 2 2];
G = Calcul_centre_de_gravite(A, B, C);

subplot(1,2,2)
hold on

plot3([A(1) C(1)], [A(2) C(2)], [A(3) C(3)], 'k', 'LineWidth', 2)
plot3(G(1), G(2), G(3), 'or', 'MarkerFaceColor', 'r')

axis equal
view(3)
title(['G = ' num2str(G)])
