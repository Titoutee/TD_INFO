%% Script de test d'éclairage d'un objet
%
% Exemple de TD
%
% Version : 1.0
% Auteur : Fabien Chevillotte et Raphaël Labayrade
% Date : 18/01/2024

clear all;
close all;
disp('...')

%% Définition de la scène

[Sommets,Triangles] = Definition_scene;

% Définition de la source
Source = [-1.6,-1.0,1.3];

%% Affichage objet non tessellé avec normales pour vérification

Affichage_verification(Sommets,Triangles,Source);
view([-160  30])
title('Scène initiale')
drawnow

%% Boucle principale

nb_Triangles = size(Triangles,1);
Eclairement_direct_norm = zeros(nb_Triangles,1);

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
            Eclairement_direct_norm(i) = Calcul_eclairement_triangle(A,B,C,Source);
        end
 
    end
end

%% Affichage final

% Affichage de l'objet éclairé
figure
hold on

Affichage_objet_eclaire(Sommets,Triangles,Eclairement_direct_norm)

plot3(Source(1),Source(2),Source(3),'or')
view(-83,25)
axis equal
title('Scène tessellée avec éclairements et ombres')
drawnow