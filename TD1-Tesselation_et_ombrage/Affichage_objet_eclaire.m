function Affichage_objet_eclaire(Sommets, Triangles, Couleurs)
% Affichage_objet_eclaire(Sommets, Triangles, Couleurs)
%
% Affiche l'objet avec les couleurs spécifiées
%
% Entrées : 
% - Sommets [nb_sommets x 3]
% - Triangles [nb_triangles x 3]
% - Couleurs [nb_triangles x 1] (niveaux de gris) ou [nb_triangles x 3] (RVB)
%
% Version : 1.0
% Auteur : Fabien Chevillotte et Raphaël Labayrade
% Date : 18/01/2024

patch('Faces',Triangles(:,1:3),'Vertices',Sommets,'Facecolor','flat','FaceVertexCData',Couleurs,'LineStyle','none')
colormap(gray)