function Affichage_verification(Sommets, Triangles, Source)
% Affichage_verification(Sommets, Triangles, Source)
%
% Permet de vérifier que la scène est correcte
%
% Entrées : 
% - Sommets : matrice [nb_sommets x 3]
% - Triangles : matrice des indices des
% sommets [nb_triangles x 3] 
% - Source : vecteur des coordonnées d'un point (1 x 3)

figure
hold on 

plot3(Sommets(:,1),Sommets(:,2),Sommets(:,3),'o')

patch('Faces',Triangles,'Vertices',Sommets,'Facecolor',[0.7 0.2 0.3])

plot3(Source(1),Source(2),Source(3),'or')

for i = 1:size(Triangles,1)
    A = Sommets(Triangles(i,1),:);
    B = Sommets(Triangles(i,2),:);
    C = Sommets(Triangles(i,3),:);

    G = Calcul_centre_de_gravite(A, B, C);
    N = Calcul_normale_triangle(A, B, C);
    
    quiver3(G(1), G(2), G(3), N(1), N(2), N(3))
end
axis equal 