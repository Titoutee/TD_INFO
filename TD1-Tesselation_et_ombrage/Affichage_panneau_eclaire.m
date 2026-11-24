close all; clc;

if exist('Positions_soleil.mat', 'file')
    load('Positions_soleil.mat');
    Source = Positions_soleil(41, :);
else
    % Valeur exacte de la 40ème ligne donnée dans l'énoncé
    Source = [9.70, -8.05, 7.94];
end

alpha = 30;
[Sommets, Triangles] = Definition_scene_panneau(alpha);

% Si le triangle est tourné vers la source, alors on vérifie si le rayon
% source-G est en intersection avec un autre triangle 

nb_Triangles = size(Triangles,1);
Eclairement = zeros(nb_Triangles,1);

% Pour chaque triangle de sommets A B C, de centre de gravité G
for i = 1:nb_Triangles

    % Affichage pourcentage de calcul
    disp([num2str(i/nb_Triangles*100) ' %']),

    A = Sommets(Triangles(i,1),:);
    B = Sommets(Triangles(i,2),:);
    C = Sommets(Triangles(i,3),:);

    G = Calcul_centre_de_gravite(A,B,C);

    % Si le triangle est tourné vers la source, alors on vérifie si le rayon
    % source-G est en intersection avec un autre triangle 

    if Test_triangle_tourne_vers_source(A,B,C,Source)

        [test,~] = Calcul_intersection_objet(Sommets,Triangles,Source,G);

        if ~test
            % S'il ne l'est pas, on calcule la couleur du triangle
            Eclairement(i) = Calcul_eclairement_triangle(A,B,C,Source);
        end

    end
end

figure
hold on

Affichage_objet_eclaire(Sommets,Triangles,Eclairement)

plot3(Source(1),Source(2),Source(3),'or')
view(-83,25)
xlabel('Ouest - Est');
ylabel('Sud - Nord');
zlabel('Altitude');
title(['Éclairement du panneau = ', num2str(Eclairement(1), '%.4f')]);

axis equal;
grid on;
view(3); % Vue 3D par défaut
