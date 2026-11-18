function [Sommets, Triangles] = Definition_scene
% [Sommets, Triangles] = Definition_scene
%
% Exemple de scene 3D
%
% Sorties: 
% - Sommets [nb_sommets x 3]
% - Triangles [nb_triangles x 3]
%
% Version : 1.0
% Auteur : Fabien Chevillotte
% Date : 18/01/2024

%Dimensions 
x = 0.2;
y = 0.5;
z = 0.3;
a = 0.5;
b = 0.4;

Sommets = [
%Objet parallélépipède
0,0,0;
x,0,0;
x,y,0;
x,0,z;
0,y,0;
0,y,z;
0,0,z;
x,y,z;
%Tétraèdre
-a,-a,a;
-a-b,-a,a;
-a,-a+b,a;
-a,-a,a+b];

Triangles = [
%Objet parallélépipède
1,2,3;
1,3,5;
1,4,2;
1,7,4;
1,5,6;
1,6,7;
2,8,3;
2,4,8;
5,3,8;
5,8,6;
7,8,4;
7,6,8;
%Tétraèdre
9,12,11;
9,11,10;
9,10,12;
11,12,10];

% Inversion des normales
Triangles_normale_opposee = Triangles;
Triangles_normale_opposee(:,1) = Triangles(:,2);
Triangles_normale_opposee(:,2) = Triangles(:,1);
Triangles = Triangles_normale_opposee;

