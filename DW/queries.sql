-- Où les pokemon sont-ils les plus ou moins capturés chaque mois ?

SELECT c1.ville, c1.mois, c1.nbPokemonCapture 
FROM CaptureParMoisEtParVille c1
GROUP BY c1.ville
HAVING nbPokemonCapture >= ALL (SELECT c2.nbPokemonCapture
				FROM CaptureParMoisEtParVille c2
                                WHERE c1.ville = c2.ville
                                GROUP BY c2.ville);

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

-- Quel sont les pokemon sur lesquelles les dresseurs utilisent le plus ou le moins de baie en moyenne ? (une baie facilite la capture)
SELECT nom, AVG(nombre_baie) AS NbBaieMoyen 
FROM JointureCapturePokemonCondition
GROUP BY nom
ORDER BY NbBaieMoyen;

-- Quel sont les pokemon qui nécessite le plus ou le moins de temps pour être capturer en moyenne ?
SELECT nom, AVG(duree) AS DureeMoyenne 
FROM JointureCapturePokemonCondition
GROUP BY nom
ORDER BY DureeMoyenne;

-- Combien les joueurs dépensent-ils en moyenne d'argent réel par mois ?
SELECT devise, mois, AVG(depense_total)
FROM TransactionEnArgentReel t
JOIN Date_entrepot d ON d.id_Date=t.id_Date
GROUP BY devise, mois
ORDER BY devise;

-- Quels sont les items les plus acheté autre que les pokecoins ?
SELECT nom, quantiteTotalVendu
FROM SumQuantiteVenduByItem
ORDER BY quantiteTotalVendu;

-- Quels sont les pays et les villes où les utilisateur dépensent le plus d'argent réel en moyenne ?
SELECT pays, ville, AVG(depense_total) AS depenseTotalMoyenne
FROM TransactionEnArgentReel t
JOIN Lieu l on l.id_Lieu=t.id_lieu
GROUP BY ROLLUP(pays, ville)
ORDER BY depenseTotalMoyenne;

-- Quels sont les moyens de paiement les plus utilisé pour acheter des pokécoins en France ?
SELECT moyen_paiement, COUNT(*) AS nbUtilisation
FROM  TransactionEnArgentReel t
JOIN Paiement p ON p.id_Paiement=t.id_Paiement
JOIN Lieu l on l.id_Lieu=t.id_lieu
GROUP BY moyen_paiement
HAVING pays="France";

-- Quel est le nombre moyen de pokemon capturé pour un dresseur ?
SELECT AVG(nbCapture)
FROM NbPokemonByDresseur;
