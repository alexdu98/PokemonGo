-- Le nom, les HP et les CP de tous les Pokémon capturés par le dresseur Sacha. 
SELECT deref(VALUE(p)).race, deref(VALUE(p)).cp, deref(VALUE(p)).hp
FROM Dresseur d,  TABLE (d.pokemons) p
WHERE d.pseudo='Sacha';

-- Le total de Pokéball possédé par l'ensemble des dresseurs
SELECT SUM(nb_item) 
FROM Posseder_Item p
JOIN Item i ON i.type_item = p.type_item
WHERE i.type_item = 'Pokeball';

-- Le nom et la quantité de tous les items possédés par le dresseur Pierre
SELECT type_item, nb_item 
FROM Posseder_Item p
JOIN Dresseur d ON d.id = p.id_dresseur
WHERE d.pseudo = 'Pierre';

-- Nom et position de toutes les arènes dans un rayon de 1000 m autour du dresseur Sacha
SELECT a.nom, a.coordonnees
FROM Arene a, 
    (SELECT coordonnees 
     FROM Dresseur dr 
     WHERE dr.pseudo = 'Sacha') d
WHERE d.coordonnees.distance(a.coordonnees) < 1000;

-- Tous les dresseurs ayant au moins un exemplaire de chaque Pokémon
SELECT d.pseudo, COUNT(DISTINCT deref(value(p)).race) AS nb_poke
FROM Dresseur d, TABLE (d.pokemons) p
GROUP BY d.pseudo
HAVING COUNT(DISTINCT deref(value(p)).race) = (
	SELECT COUNT(po.race)
	FROM Pokemon po
);

-- Le dernier dresseur qui a visité un Pokéstop donné (id = 1)
SELECT deref(vp.dresseur).pseudo
FROM Visite_Pokestop vp
WHERE vp.id_pokestop = 1 AND ROWNUM = 1
ORDER BY date_derniere_visite DESC;

-- Trouver les dresseurs qui défendent des arènes dont le prestige vaut 500 ou plus
SELECT distinct deref(deref(value(def)).maitre).pseudo
FROM Arene a, TABLE(a.Pokemons) def
WHERE prestige >= 500;

-- Tous les Pokémon qui n'ont pas de spécimen sauvage en ce moment
SELECT p.race
FROM Pokemon p
LEFT JOIN Pokemon_Sauvage ps ON ps.race = p.race
WHERE ps.race IS NULL;

-- Toutes les evolutions de carapuce
SELECT LEVEL AS Longueur, race, evolution
FROM Pokemon
CONNECT BY PRIOR evolution=race
START WITH race='Carapuce';

-- Le nom des dresseurs qui ont au moins un Pokémon qui peut évoluer (parce qu'ils ont assez de bonbons du bon type)
SELECT deref(maitre).pseudo, pc.race, p.cout_evolution, b.nb_bonbons
FROM Pokemon_capture pc, Bonbon b, Pokemon p
WHERE b.nb_bonbons > p.cout_evolution AND p.cout_evolution > 0
AND pc.race=p.race
AND b.race_pokemon IN (
              SELECT p.evolution_precedente
              FROM Pokemon p
              CONNECT BY PRIOR race=evolution_precedente
              START WITH race=pc.race);    
