function [Sommets_scene, Triangles_scene] = Definition_scene_panneau(alpha)
% De degrés en radians
alpha = deg2rad(alpha);
A = [-1, 0, 0];
B = [1, 0, 0];
C = [0, 2*cos(alpha), 2*sin(alpha)];

D = [ 3,  2.15, 0];
E = [ 3, -2.15, 0];
F = [ 3, -2.15, 4];
G = [ 3,  2.15, 4];

Sommets_scene = [A; B; C; D; E; F; G];
Triangles_scene = [1, 2, 3;
    4, 5, 6;
    4, 6, 7];
end