% Test_Affichage_objet_eclaire.m
%
% Une couleur donnée à chaque face de la pyramide
% Attendu -> face 1 noire, face 2 gris foncé

[Sommets, Triangles] = Definition_pyramide;
Couleurs = [0; 0.3; 0.6; 1];

figure
Affichage_objet_eclaire(Sommets, Triangles, Couleurs)
% Vue depuis le côté des faces 1 et 2
axis equal; view(60, 25)
title('Pyramide, une couleur par face')
