-- Pour chaque ville quel mois comptabilise le plus de capture ?
SELECT c1.ville, c1.mois, c1.nbPokemonCapture 
FROM CaptureParMoisEtParVille c1
GROUP BY c1.ville, c1.mois, c1.nbPokemonCapture
HAVING nbPokemonCapture >= ALL (SELECT c2.nbPokemonCapture
								FROM CaptureParMoisEtParVille c2
                                WHERE c1.ville = c2.ville
                                GROUP BY c2.ville, c2.nbPokemonCapture);

-- A quels moments (heures et minute) les pokémon sont ils le plus ou le moins capturé chaque mois ?
SELECT mois, heure_debut, minute_debut, COUNT(*) AS nbPokemonCapture
FROM JointureCaptureMois c
JOIN Condition co ON co.id_Condition=c.id_Condition
GROUP BY mois, heure_debut, minute_debut
ORDER BY nbPokemonCapture;

-- Quel sont les pokemon qui necessite le plus ou le moins de pokeball en moyenne pour être capturer ?
SELECT nom, AVG(nombre_essai) AS NbPokeBallMoyen 
FROM JoinCapturePokemonCondition
GROUP BY nom
ORDER BY NbPokeBallMoyen;

-- Quel sont les pokemon sur lesquelles les dresseurs utilisent le plus ou le moins de baie en moyenne ? (une baie facilite la capture)
SELECT nom, AVG(nombre_baie) AS NbBaieMoyen 
FROM JoinCapturePokemonCondition
GROUP BY nom
ORDER BY NbBaieMoyen;

-- Quel sont les pokemon qui necessite le plus ou le moins de temps pour être capturer en moyenne ?
SELECT nom, AVG(duree) AS DureeMoyenne 
FROM JoinCapturePokemonCondition
GROUP BY nom
ORDER BY DureeMoyenne;

-- Combien les joueurs depensent-ils en moyenne d'argent reel par mois ?
SELECT devise, mois, AVG(depense_total)
FROM TransactionEnArgentReel t
JOIN Date_entrepot d ON d.id_Date=t.id_Date
GROUP BY devise, mois
ORDER BY devise;

-- Quels sont les items les plus achete autre que les pokecoins ?
SELECT nom, quantiteTotalVendu
FROM SumQuantiteVenduByItem
ORDER BY quantiteTotalVendu;

-- Quels sont les pays et les villes où les utilisateur depensent le plus d'argent reel en moyenne ?
SELECT pays, ville, AVG(depense_total) AS depenseTotalMoyenne
FROM TransactionEnArgentReel t
JOIN Lieu l on l.id_Lieu=t.id_lieu
GROUP BY ROLLUP(pays, ville)
ORDER BY depenseTotalMoyenne;

-- Quels sont les moyens de paiement les plus utilise pour acheter des pokecoins en France ?
SELECT moyen_paiement, COUNT(*) AS nbUtilisation
FROM  TransactionEnArgentReel t
JOIN Paiement p ON p.id_Paiement=t.id_Paiement
JOIN Lieu l on l.id_Lieu=t.id_lieu
WHERE pays = 'France'
GROUP BY moyen_paiement;

-- Quel est le nombre moyen de pokemon capture pour un dresseur ?
SELECT AVG(nbCapture)
FROM NbPokemonByDresseur;
