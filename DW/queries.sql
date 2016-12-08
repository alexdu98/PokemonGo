-- Où les pokemon sont-ils les plus ou moins capturés chaque mois ?
SELECT mois, longitude, latitude, COUNT(*) AS nbPokemonCapture 
FROM JointureCaptureMois c
JOIN Lieu l ON l.id_Lieu = c.id_Lieu
GROUP BY mois, longitude, latitude
ORDER BY nbPokemonCapture;

-- A quelles moments (heures et minute) les pokémon sont ils le plus ou le moins capturé chaque mois ?
SELECT mois, heure_debut, minute_debut COUNT(*) AS nbPokemonCapturé 
FROM JointureCaptureMois c
JOIN Condition co ON co.id_Condition=c.id_Condition
GROUP BY mois, heure_debut, minute_debut
ORDER BY nbPokemonCapturé;

-- Quel sont les pokemon qui nécessite le plus ou le moins de pokeball en moyenne pour être capturer ?
SELECT nom, AVG(nombre_essai) AS NbPokeBallMoyen 
FROM JointureCapturePokemonCondition
GROUP BY nom
ORDER BY NbPokeBallMoyen;
