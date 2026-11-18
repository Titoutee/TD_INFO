function [test, I] = Calcul_intersection_objet(Sommets, Triangles, O, G)
% [test, I] = Calcul_intersection_objet(Sommets, Triangles, O, G)
%
% Cette fonction vérifie si le segment OG coupe l'objet constitué de
% triangles (matrice Triangles)
%
% Entrées :
% - Matrices Sommets [nb_sommets x 3] et Triangles [nb_triangles x 3], points O et G 
%
% Sorties : 
% - test : booléen (1 si intersection, 0 sinon) 
% - I : point d'intersection éventuel ([] si pas d'intersection)
%
% Version : 1.0
% Auteur : Raphaël Labayrade
% Date : 01/10/2024

test = 0;
I = [];
s = size(Triangles);
l = s(1);

for k = 1:l % pour toutes les faces (triangles) de l'objet
    
    a = Triangles(k,1); % on va chercher les coordonnées des sommets
    A = [Sommets(a,1), Sommets(a,2), Sommets(a,3)] ;
    
    b = Triangles(k,2);
    B = [Sommets(b,1), Sommets(b,2), Sommets(b,3)] ;
    
    c = Triangles(k,3);
    C = [Sommets(c,1), Sommets(c,2), Sommets(c,3)] ;
    
    GG = Calcul_centre_de_gravite(A,B,C);
    
    if norm(GG-G) > eps % on ignore la face dont G est le centre de gravité
        
        [result, Ip] = Calcul_intersection_triangle_segment(A,B,C,O,G); % on vérifie si le segment OG coupe le triangle ; si c'est le cas, on arrête la boucle
     
        if result == 1 % s'il y a intersection, on renvoie test = 1 et le point d'intersection I entre le segment et cette face
          
            test = 1;
            I = Ip;
            break
            
        end
    end
    
end
