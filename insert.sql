/* Deletion des rows pour toutes les tables */

DELETE FROM Pokemon;
DELETE FROM Niveau;
DELETE FROM Item;
DELETE FROM Oeuf;
DELETE FROM Pokestop;
DELETE FROM Succes;

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
INSERT INTO Succes VALUES (0, 'Joggeur', 'Parcourez X km');
INSERT INTO Succes VALUES (1, 'Collectionneur', 'Capturez X Pokemon');
INSERT INTO Succes VALUES (2, 'Scientifique', 'Faites evoluer X Pokemon');
INSERT INTO Succes VALUES (3, 'Eleveur', 'Faites eclore X oeufs');
INSERT INTO Succes VALUES (4, 'Ornithologue', 'Attrapez X Pokemon Vol');
INSERT INTO Succes VALUES (5, 'Randonneur', 'Visiter X Pokestop');
INSERT INTO Succes VALUES (6, 'Combattante', 'Remportez X combats en arene');

Prompt Insertion des oeufs;

--Dresseur 1
INSERT INTO Oeuf VALUES (1, 0, 2, 5); 
INSERT INTO Oeuf VALUES (2, 0, 3, 5);
--Dresseur 2
INSERT INTO Oeuf VALUES (3, 1, 7, 10); 
INSERT INTO Oeuf VALUES (4, 1, 1, 2);
INSERT INTO Oeuf VALUES (5, 1, 8, 10);
INSERT INTO Oeuf VALUES (6, 0, 3, 5);
--Dresseur 3
INSERT INTO Oeuf VALUES (7, 1, 1, 5); 
INSERT INTO Oeuf VALUES (8, 1, 2, 5);
INSERT INTO Oeuf VALUES (9, 0, 0, 2);
--Dresseur 4
INSERT INTO Oeuf VALUES (10, 0, 0, 5);

Prompt Insertion de pokestop;

INSERT INTO pokestop VALUES(1, coordonnees_t(48.873729, 2.294920),'Arc de triomphe');
INSERT INTO pokestop VALUES(2, coordonnees_t(48.865487, 2.321141),'Place de la concorde');
