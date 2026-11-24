close all; clc;
nb_soleils = 144;
Eclairements = zeros(nb_soleils);
alpha = 30;
[Sommets, Triangles] = Definition_scene_panneau(alpha);

for i=1:nb_soleils
    Source = Positions_soleil(i, :);
    Eclairements(i) = Calcul_eclairement_panneau(Sommets, Triangles, Source);
end

plot(Eclairements);

% On remarque que
% l'éclairement du panneau
% est égal à 0 pour toutes
% positions du soleil en-dessous (strictemen) de 41, avant de brusquement
% passer à une valeur
% non-nulle (exactement
% 0.7235) à la position 41.
% Ensuite, pour les positions suivantes, on obtient une courbe en forme de
% cloche, cohérente avec la dérive à l'ouest et la descente du soleil en
% fin de journée.