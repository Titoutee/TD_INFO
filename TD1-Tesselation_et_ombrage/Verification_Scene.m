
close all; clc;

% 1. Définition des paramètres
alpha = 30; % Inclinaison en degrés
Source = [0, -5, 5]; % Position libre de la source lumineuse (ex: au Sud et en hauteur)



% 2. Génération de la géométrie de la scène
[Sommets_scene, Triangles_scene] = Definition_scene_panneau(alpha);

Affichage_verification(Sommets_scene, Triangles_scene, Source);
xlabel('Ouest - Est');
ylabel('Sud - Nord');
zlabel('Altitude');
title(['Représentation de la scène pour \alpha = ', num2str(alpha), '°']);
axis equal;
grid on;
view(3); % Vue 3D par défau