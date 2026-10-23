% Test_Affichage_verification.m
%
% Affiche la pyramide, ses normales et la source.
% Les flèches doivent sortir de l'objet.

[Sommets, Triangles] = Definition_pyramide;
Source = [2 -1.2 1.6];

Affichage_verification(Sommets, Triangles, Source)
view(3)
title('Pyramide, normales et source')
