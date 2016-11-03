/* Deletion des rows pour toutes les tables */

DELETE FROM Dresseur;
DELETE FROM Pokemon_Capture;
DELETE FROM Pokemon_Sauvage;
DELETE FROM Pokemon;
DELETE FROM Niveau;
DELETE FROM Item;
DELETE FROM Pokestop;
DELETE FROM Succes;
DELETE FROM Arene;
DELETE FROM Bonbon;


prompt Insertion de quelques Pokemon;

INSERT INTO Pokemon VALUES ('Pikachu', 50, 'electrique', NULL, NULL);
INSERT INTO Pokemon VALUES ('Raichu', 0, 'electrique', NULL, 'Pikachu');
UPDATE Pokemon SET evolution = 'Raichu' WHERE race = 'Pikachu';

INSERT INTO Pokemon VALUES ('Carapuce', 25, 'Eau', NULL, NULL);
INSERT INTO Pokemon VALUES ('Carabaffe', 50, 'Eau', NULL, 'Carapuce');
INSERT INTO Pokemon VALUES ('Tortank', 0, 'Eau', NULL, 'Carabaffe');
UPDATE Pokemon SET evolution = 'Carabaffe' WHERE race = 'Carapuce';
UPDATE Pokemon SET evolution = 'Tortank' WHERE race = 'Carabaffe';

INSERT INTO Pokemon VALUES ('Insecateur', 0, 'Vol', NULL, NULL);

INSERT INTO Pokemon VALUES ('Bulbizarre', 25, 'Plante', NULL, NULL);
INSERT INTO Pokemon VALUES ('Herbizarre', 50, 'Plante', NULL, 'Bulbizarre');
INSERT INTO Pokemon VALUES ('Florizarre', 0, 'Plante',NULL, 'Herbizarre');
UPDATE Pokemon SET evolution = 'Herbizarre' WHERE race = 'Bulbizarre';
UPDATE Pokemon SET evolution = 'Florizarre' WHERE race = 'Herbizarre';

INSERT INTO Pokemon VALUES ('Salameche', 25, 'Feu', NULL, NULL);
INSERT INTO Pokemon VALUES ('Reptincel', 50, 'Feu', NULL, 'Salameche');
INSERT INTO Pokemon VALUES ('Dracaufeu', 0, 'Feu', NULL, 'Reptincel');
UPDATE Pokemon SET evolution = 'Reptincel' WHERE race = 'Salameche';
UPDATE Pokemon SET evolution = 'Dracaufeu' WHERE race = 'Reptincel';

INSERT INTO Pokemon VALUES ('Roucool', 25, 'Vol', NULL, NULL);
INSERT INTO Pokemon VALUES ('Roucoups', 50, 'Vol', NULL, 'Roucool');
INSERT INTO Pokemon VALUES ('Roucarnage', 0, 'Vol', NULL, 'Roucoups');
UPDATE Pokemon SET evolution = 'Roucoups' WHERE race = 'Roucool';
UPDATE Pokemon SET evolution = 'Roucarnage' WHERE race = 'Roucoups';

INSERT INTO Pokemon VALUES ('Rattata', 25, 'Normal', NULL, NULL);
INSERT INTO Pokemon VALUES ('Rattatac', 50, 'Normal', NULL, 'Rattata');
UPDATE Pokemon SET evolution = 'Rattatac' WHERE race = 'Rattata';

Prompt Insertion des niveaux;

INSERT INTO Niveau VALUES (1, 0, 1000);
INSERT INTO Niveau VALUES (2, 1000, 3000);
INSERT INTO Niveau VALUES (3, 3000, 6000);
INSERT INTO Niveau VALUES (4, 6000, 10000);
INSERT INTO Niveau VALUES (5, 10000, 15000);
INSERT INTO Niveau VALUES (6, 15000, 21000);
INSERT INTO Niveau VALUES (7, 21000, 28000);
INSERT INTO Niveau VALUES (8, 28000, 36000);
INSERT INTO Niveau VALUES (9, 36000, 45000);
INSERT INTO Niveau VALUES (10, 45000, 55000);

Prompt Insertion des items;

INSERT INTO Item VALUES ('Pokeball', 'Capture les pokemons sauvages. Se jette comme une balle.');
INSERT INTO Item VALUES ('Encens', 'Attire les pokemon sauvages vers vous pendant 30 min.');
INSERT INTO Item VALUES ('Leurre', 'Attire les pokemons sur un pokestop pour tous les joueurs.');
INSERT INTO Item VALUES ('Potion', 'Rend 20 points de vie.');
INSERT INTO Item VALUES ('Super potion', 'Rend 50 points de vie.');
INSERT INTO Item VALUES ('Hyper potion', 'Rend 200 points de vie.');
INSERT INTO Item VALUES ('Baie', 'Rend le pokemon plus apte a etre capture.');

PROMPT Insertion des succes

INSERT INTO Succes VALUES (1, 'Joggeur', 'Parcourez X km');
INSERT INTO Succes VALUES (2, 'Collectionneur', 'Capturez X Pokemon');
INSERT INTO Succes VALUES (3, 'Scientifique', 'Faites evoluer X Pokemon');
INSERT INTO Succes VALUES (4, 'Eleveur', 'Faites eclore X oeufs');
INSERT INTO Succes VALUES (5, 'Ornithologue', 'Attrapez X Pokemon Vol');
INSERT INTO Succes VALUES (6, 'Randonneur', 'Visiter X Pokestop');
INSERT INTO Succes VALUES (7, 'Combattante', 'Remportez X combats en arene');

Prompt Insertion de pokestop;

INSERT INTO pokestop VALUES(1, coordonnees_t(48.873729, 2.294920), 'Arc de triomphe');
INSERT INTO pokestop VALUES(2, coordonnees_t(48.865487, 2.321141), 'Place de la concorde');
INSERT INTO pokestop VALUES(3, coordonnees_t(43.631789, 3.866898), 'Faculte des Sciences de Montpellier');
INSERT INTO pokestop VALUES(4, coordonnees_t(43.618999, 3.869439), 'Stade Philipides de Montpellier');
INSERT INTO pokestop VALUES(5, coordonnees_t(46.72658, 2.485807), 'Gare d''Orval');

PROMPT Insertion de Dresseur;

/* Ajout du dresseur Pierre, de ses oeufs et de ses Pokemon captures */
INSERT INTO Dresseur VALUES (1, 
			Avatar_t('M', 'Brun', 'Bronzee', 'Marron'), 
			'Pierre', 
			Coordonnees_t(10.3, 89.5), 
			1200, 2, '01-JUL-2016', NULL, 120, 62, 
			NULL, 
			Liste_Oeufs(Oeuf_t(0, 2, 5), Oeuf_t(0, 3, 5))
);

INSERT INTO Dresseur VALUES (2, 
			Avatar_t('F', 'Rousse', 'Blanche', 'Vert'), 
			'Ondine', 
			Coordonnees_t(26.8, 42.5), 
			11000, 5, '04-JUL-2016', Equipe_t('rouge'), 120, 62, 
			NULL, 
			Liste_Oeufs(Oeuf_t(1, 7, 10), Oeuf_t(1, 1, 2), Oeuf_t(1, 8, 10), Oeuf_t(0, 3, 5))
);

INSERT INTO Dresseur VALUES(3,
			Avatar_t('M', 'Brun', 'Blanche', 'Marron'), 
			'Sacha', 
			Coordonnees_t(43.60357, 3.91561),
			12000, 5, '15-JUL-2016', Equipe_t('bleu'), 100, 10,
			NULL,
			Liste_Oeufs(Oeuf_t(1, 8, 10), Oeuf_t(0, 0, 2))
);

INSERT INTO Dresseur VALUES(4,
			Avatar_t('M', 'Blond', 'Noir', 'Marron'), 
			'Zaakary', 
			Coordonnees_t(48.860611, 2.337644),
			37000, 9, '15-JUL-2016', Equipe_t('jaune'), 0, 0,
			NULL,
			Liste_Oeufs(Oeuf_t(0, 0, 5))
);

INSERT INTO Dresseur VALUES(5,
			Avatar_t('F', 'Brunne', 'Blanche', 'Bleu'), 
			'Agatha', 
			Coordonnees_t(46.435453, 3.054045),
			20000, 6, '29-JUL-2016', Equipe_t('rouge'), 52, 0,
			NULL,
			Liste_Oeufs(Oeuf_t(1, 2, 25))
);

Prompt Insertion de pokemon sauvage;
INSERT INTO Pokemon_Sauvage VALUES(1, 'Pikachu', Coordonnees_t(48.86361, 2.31198451));
INSERT INTO Pokemon_Sauvage VALUES(2, 'Raichu', Coordonnees_t(48.984165, 2.984165));
INSERT INTO Pokemon_Sauvage VALUES(3, 'Carapuce', Coordonnees_t(48.62512981, 2.269846));
INSERT INTO Pokemon_Sauvage VALUES(4, 'Tortank', Coordonnees_t(47.624762762, 2.91346217));
INSERT INTO Pokemon_Sauvage VALUES(5, 'Tortank', Coordonnees_t(48.86361, 2.31198451));
INSERT INTO Pokemon_Sauvage VALUES(6, 'Salameche', Coordonnees_t(43.6042, 3.8836));
INSERT INTO Pokemon_Sauvage VALUES(7, 'Florizarre', Coordonnees_t(43.615225, 3.8462453));
INSERT INTO Pokemon_Sauvage VALUES(8, 'Insecateur', Coordonnees_t(43.628962, 3.8660557));

Prompt Insertion d arenes;
INSERT INTO Arene VALUES(1, Coordonnees_t(43.635765, 3.847425), 'Occitania', Equipe_t('bleu'), 210, Liste_Defenseurs());
INSERT INTO Arene VALUES(2, Coordonnees_t(43.603578, 3.915617), 'Odyseumia', Equipe_t('rouge'), 256, Liste_Defenseurs());
INSERT INTO Arene VALUES(3, Coordonnees_t(43.608401, 3.879314), 'Comedia', Equipe_t(''), 451, Liste_Defenseurs());
INSERT INTO Arene VALUES(4, Coordonnees_t(48.858214, 2.292516), 'TourEiffelia', Equipe_t('jaune'), 545, Liste_Defenseurs());
INSERT INTO Arene VALUES(5, Coordonnees_t(48.860611, 2.337644), 'MuseeLouvria', Equipe_t('rouge'), 682, Liste_Defenseurs());

Prompt Insertion de pokemon capture
INSERT INTO Pokemon_Capture VALUES(1, 'Insecateur', 100, 320,
	Liste_Attaques(Attaque_t('Onde vide', 'combat', 40, 75), Attaque_t('Vive attaque', 'normal', 35, 70)),
	75,
	35,
	(SELECT REF(D) FROM Dresseur D WHERE D.id = '1')
);

INSERT INTO Pokemon_Capture VALUES(2, 'Tortank', 100, 320,
	Liste_Attaques(Attaque_t('Charge', 'normal', 40, 75), Attaque_t('Pistolet a O', 'eau', 45, 65)),
	80,
	90,
	(SELECT REF(D) FROM Dresseur D WHERE D.id = '2')
);

INSERT INTO Pokemon_Capture VALUES(3, 'Pikachu', 100, 320,
	Liste_Attaques(Attaque_t('Eclair', 'electrique', 40, 70), Attaque_t('Reflet', 'normal', 30, 60)),
	50,
	25,
	(SELECT REF(D) FROM Dresseur D WHERE D.id = '3')
);

INSERT INTO Pokemon_Capture VALUES(4, 'Raichu', 100, 320,
	Liste_Attaques(Attaque_t('Eclair', 'electrique', 40, 70), Attaque_t('Cage electrique', 'electrique', 30, 60)),
	60,
	25,
	(SELECT REF(D) FROM Dresseur D WHERE D.id = '4')
);

INSERT INTO Pokemon_Capture VALUES(5, 'Rattata', 50, 120,
	Liste_Attaques(Attaque_t('Morsure', 'normal', 40, 75), Attaque_t('Confusion', 'psy', 45, 65)),
	80,
	90,
	(SELECT REF(D) FROM Dresseur D WHERE D.id = '5')
);

INSERT INTO Pokemon_Capture VALUES(6, 'Roucoups', 65, 82,
	Liste_Attaques(Attaque_t('Morsure', 'normal', 40, 75), Attaque_t('Coup de griffes', 'combat', 45, 65)),
	12,
	23,
	(SELECT REF(D) FROM Dresseur D WHERE D.id = '1')
);

INSERT INTO Pokemon_Capture VALUES (7, 'Roucoups', 65, 82,
	Liste_Attaques(Attaque_t('Morsure', 'normal', 40, 75), Attaque_t('Coup de griffes', 'combat', 45, 65)),
	12,
	23,
	(SELECT REF(D) FROM Dresseur D WHERE D.id = '2')
);

INSERT INTO Pokemon_Capture VALUES (8, 'Bulbizarre', 50, 70,
	Liste_Attaques(Attaque_t('Fouet liane', 'combat', 40, 75), Attaque_t('Charge', 'combat', 45, 65)),
	12,
	23,
	(SELECT REF(D) FROM Dresseur D WHERE D.id = '3')
);

INSERT INTO Pokemon_Capture VALUES (9, 'Florizarre', 120, 170,
	Liste_Attaques(Attaque_t('Fouet liane', 'combat', 40, 75), Attaque_t('Gaz toxique', 'poison', 45, 65)),
	80,
	80,
	(SELECT REF(D) FROM Dresseur D WHERE D.id = '4')
);

INSERT INTO Pokemon_Capture VALUES (10, 'Salameche', 100, 90,
	Liste_Attaques(Attaque_t('Flameche', 'combat', 40, 75), Attaque_t('Charge', 'combat', 45, 65)),
	29,
	45,
	(SELECT REF(D) FROM Dresseur D WHERE D.id = '5')
);


/* Ajout des Pokemon dans la liste des Pokemon du dresseur */

-- Pokemon de Pierre 
UPDATE Dresseur d
SET d.pokemons = (SELECT CAST(COLLECT(REF(pc)) as Liste_Pokemon)
    	       	 FROM Pokemon_Capture pc
		 WHERE pc.id = 1 AND pc.id = 6)
WHERE d.id = 1;

-- Pokemon de Ondine
UPDATE Dresseur d
SET d.pokemons = (SELECT CAST(COLLECT(REF(pc)) as Liste_Pokemon)
    	       	 FROM Pokemon_Capture pc
		 WHERE pc.id = 2 AND pc.id = 7)
WHERE d.id = 2;

-- Pokemon de Sacha
UPDATE Dresseur d
SET d.pokemons = (SELECT CAST(COLLECT(REF(pc)) as Liste_Pokemon)
    	       	 FROM Pokemon_Capture pc
		 WHERE pc.id = 3 AND pc.id = 8)
WHERE d.id = 3;

-- Pokemon de Zaakary 
UPDATE Dresseur d
SET d.pokemons = (SELECT CAST(COLLECT(REF(pc)) as Liste_Pokemon)
    	       	 FROM Pokemon_Capture pc
		 WHERE pc.id = 4 AND pc.id = 9)
WHERE d.id = 4;

-- Pokemon d'Agatha
UPDATE Dresseur d
SET d.pokemons = (SELECT CAST(COLLECT(REF(pc)) as Liste_Pokemon)
    	       	 FROM Pokemon_Capture pc
		 WHERE pc.id = 5 AND pc.id = 10)
WHERE d.id = 5;


Prompt Insertion de bonbon
INSERT INTO Bonbon VALUES('Pikachu', 3, (SELECT REF(D) FROM Dresseur D WHERE D.id = 3), 5);
INSERT INTO Bonbon VALUES('Carapuce', 2, (SELECT REF(D) FROM Dresseur D WHERE D.id = 2), 3);


