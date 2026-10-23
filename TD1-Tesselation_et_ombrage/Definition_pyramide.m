function [Sommets, Triangles] = Definition_pyramide
% [Sommets, Triangles] = Definition_pyramide
%
% Pyramide à 4 faces utilisée pour les tests des séances 1 à 3
%
% Sorties :
% - Sommets [4 x 3]
% - Triangles [4 x 3], sommets ordonnés pour que les normales soient
% sortantes

Sommets = [0 0 0;
           1 0 0;
           1 1 0;
           1 1 1];

Triangles = [4 1 2;
             4 2 3;
             4 3 1;
             2 1 3];
