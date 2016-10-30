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

INSERT INTO Pokemon VALUES ('Salamèche', 25, 'Feu', NULL,NULL);
INSERT INTO Pokemon VALUES ('Reptincel', 50, 'Feu',NULL,'Salamèche');
INSERT INTO Pokemon VALUES ('Dracaufeu', 0, 'Feu',NULL, 'Reptincel');
UPDATE Pokemon SET evolution = 'Reptincel' WHERE race = 'Salamèche';
UPDATE Pokemon SET evolution = 'Dracaufeu' WHERE race = 'Reptincel';
