function [E] = Calcul_eclairement_panneau(Sommets, Triangles, Source)
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
E = Eclairement_direct_norm(1);