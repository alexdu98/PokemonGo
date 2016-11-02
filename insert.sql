/* Deletion des rows pour toutes les tables */

DELETE FROM Dresseur ;
DELETE FROM Pokemon;
DELETE FROM Niveau;
DELETE FROM Item;
DELETE FROM Pokestop;
DELETE FROM Succes;
DELETE FROM Pokemon_Sauvage;

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

INSERT INTO Pokemon VALUES ('Bulbizarre', 25,'Plante',NULL,NULL);
INSERT INTO Pokemon VALUES ('Herbizarre', 50,'Plante',NULL,'Bulbizarre');
INSERT INTO Pokemon VALUES ('Florizarre', 0,'Plante',NULL,'Herbizarre');
UPDATE Pokemon SET evolution = 'Herbizarre' WHERE race = 'Bulbizarre';
UPDATE Pokemon SET evolution = 'Florizarre' WHERE race = 'Herbizarre';

INSERT INTO Pokemon VALUES ('Salameche', 25, 'Feu', NULL,NULL);
INSERT INTO Pokemon VALUES ('Reptincel', 50, 'Feu',NULL,'Salameche');
INSERT INTO Pokemon VALUES ('Dracaufeu', 0, 'Feu',NULL, 'Reptincel');
UPDATE Pokemon SET evolution = 'Reptincel' WHERE race = 'Salameche';
UPDATE Pokemon SET evolution = 'Dracaufeu' WHERE race = 'Reptincel';

Prompt Insertion des niveaux;
INSERT INTO Niveau VALUES (1,0,1000);
INSERT INTO Niveau VALUES (2,1000,3000);
INSERT INTO Niveau VALUES (3,3000,6000);
INSERT INTO Niveau VALUES (4,6000,10000);
INSERT INTO Niveau VALUES (5,10000,15000);
INSERT INTO Niveau VALUES (6,15000,21000);
INSERT INTO Niveau VALUES (7,21000,28000);
INSERT INTO Niveau VALUES (8,28000,36000);
INSERT INTO Niveau VALUES (9,36000,45000);
INSERT INTO Niveau VALUES (10,45000,55000);

Prompt Insertion des items;

INSERT INTO Item VALUES ('Pokeball','Capture les pokemons sauvages. Se jette comme une balle.');
INSERT INTO Item VALUES ('Encens','Attire les pokemon sauvages vers vous pendant 30 min.');
INSERT INTO Item VALUES ('Leurre','Attire les pokemons sur un pokestop pour tous les joueurs.');
INSERT INTO Item VALUES ('Potion','Rend 20 points de vie.');
INSERT INTO Item VALUES ('Super potion','Rend 50 points de vie.');
INSERT INTO Item VALUES ('Hyper potion','Rend 200 points de vie.');
INSERT INTO Item VALUES ('Baie','Rend le pokemon plus apte a etre capture.');

PROMPT Insertion des succes
INSERT INTO Succes VALUES (1, 'Joggeur', 'Parcourez X km');
INSERT INTO Succes VALUES (2, 'Collectionneur', 'Capturez X Pokemon');
INSERT INTO Succes VALUES (3, 'Scientifique', 'Faites evoluer X Pokemon');
INSERT INTO Succes VALUES (4, 'Eleveur', 'Faites eclore X oeufs');
INSERT INTO Succes VALUES (5, 'Ornithologue', 'Attrapez X Pokemon Vol');
INSERT INTO Succes VALUES (6, 'Randonneur', 'Visiter X Pokestop');
INSERT INTO Succes VALUES (7, 'Combattante', 'Remportez X combats en arene');

--Dresseur 3
-- INSERT INTO Oeuf VALUES (7, 1, 1, 5); 
-- INSERT INTO Oeuf VALUES (8, 1, 2, 5);
-- INSERT INTO Oeuf VALUES (9, 0, 0, 2);
--Dresseur 4
-- INSERT INTO Oeuf VALUES (10, 0, 0, 5);


Prompt Insertion de pokestop;

INSERT INTO pokestop VALUES(1, coordonnees_t(48.873729, 2.294920),'Arc de triomphe');
INSERT INTO pokestop VALUES(2, coordonnees_t(48.865487, 2.321141),'Place de la concorde');

PROMPT Insertion de Dresseur;

/* Ajout du dresseur Pierre, de ses oeufs et de ses Pokemon captures */
INSERT INTO Dresseur VALUES (1, 
			Avatar_t('M', 'Brun', 'Bronzee', 'Marron'), 
			'Pierre le pecheur', 
			Coordonnees_t(10.3, 89.5), 
			1200, 2, '01-JUL-2016', NULL, 120, 62, 
			NULL, 
			Liste_Oeufs(Oeuf_t(1, 0, 2, 5), Oeuf_t(2, 0, 3, 5))
);

INSERT INTO Dresseur VALUES (2, 
			Avatar_t('F', 'Rousse', 'Blanche', 'Vert'), 
			'Ondine a bicyclette', 
			Coordonnees_t(26.8, 42.5), 
			11000, 5, '04-JUL-2016', Equipe_t('rouge'), 120, 62, 
			NULL, 
			Liste_Oeufs(Oeuf_t(3, 1, 7, 10), Oeuf_t(4, 1, 1, 2), Oeuf_t(5, 1, 8, 10), Oeuf_t(6, 0, 3, 5))
);

INSERT INTO Dresseur VALUES(3,
			Avatar_t('M', 'Brun', 'Blanche', 'Marron'), 
			'Sacha', 
			Coordonnees_t(43.60357, 3.91561),
			12000, 5, '15-JUL-2016', Equipe_t('bleu'), 100, 10,
			NULL,
			Liste_Oeufs(Oeuf_t(7, 1, 8, 10), Oeuf_t(8, 0, 0, 2))
);

INSERT INTO Dresseur VALUES(4,
			Avatar_t('M', 'Blond', 'Noir', 'Marron'), 
			'Zaakary', 
			Coordonnees_t(48.860611, 2.337644),
			37000, 9, '15-JUL-2016', Equipe_t('jaune'), 0, 0,
			NULL,
			NULL
);

INSERT INTO Dresseur VALUES(5,
			Avatar_t('F', 'Brunne', 'Blanche', 'Bleu'), 
			'Agatha', 
			Coordonnees_t(46.435453, 3.054045),
			20000, 6, '29-JUL-2016', Equipe_t('rouge'), 52, 0,
			NULL,
			Liste_Oeufs(Oeuf_t(9, 1, 3, 5))
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
