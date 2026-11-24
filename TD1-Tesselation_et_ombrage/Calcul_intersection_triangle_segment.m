function [test, I] = Calcul_Intersection_Triangle_Segment(A, B, C, P1, P2)
% [test, I] = Calcul_Intersection_Triangle_Segment(A, B, C, P1, P2)
%
% Calcule l'intersection entre un triangle et un segment dans l'espace 3D.
%
% Entrées :
% - A, B, C : vecteurs (1 x 3) représentant les sommets du triangle
% - P1, P2 : vecteurs (1 x 3) représentant les extrémités du segment
%
% Sorties :
% - test : booléen, true si une intersection existe dans le segment [P1,P2]
% - I : vecteur (1 x 3) contenant les coordonnées du point d'intersection
%       (vide si pas d'intersection)
%
% Algorithme : Basé sur l'intersection rayon-plan puis test de position du
%              point par rapport aux arêtes du triangle.
% 
% Version : 1.0
% Auteur : Nicolas Mocellin
% Date : 12 / 10 / 2024

test = false;
I = [];

N = Calcul_normale_triangle(A,B,C);

dir = P2-P1;
den = dot(N,dir);

if( abs(den)>eps ) % sinon c'est que le segment est // au plan du triangle

    t = dot(N,(A-P1)) / den;
    if( t>=0 && t<=1) % sinon c'est que l'intersection est avant P1 ou après P2
        I = P1 + t*dir;
        if( dot(N,cross(B-A, I-A))>=0 && dot(N,cross(C-B, I-B))>=0 && dot(N,cross(A-C, I-C))>=0 )
            test = true; % on vérifie que I est bien 'à gauche' de chaque arrête = à l'intérieur du triangle
        end
    end

end