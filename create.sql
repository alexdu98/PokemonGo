CREATE OR REPLACE TYPE Succes_t AS OBJECT (
	id int,
	couleur varchar(31),
	nom varchar(255),
	conditions varchar(255)
);
/

CREATE OR REPLACE TYPE Niveau_t AS OBJECT (
	id int,
	min_xp int,
	max_xp int
);
/

CREATE OR REPLACE TYPE Pokemon_t AS OBJECT (
	nom varchar(32),
	cout_evolution int,
	type varchar(31)
);
/

CREATE OR REPLACE TYPE Oeufs_t AS OBJECT (
	incubation number(1),
	km_parcourus int,
	km_eclosion int
);
/

CREATE OR REPLACE TYPE Coordonnees_t AS OBJECT (
	longitude float,
	latitude float
);
/

CREATE OR REPLACE TYPE Point_interet_t AS OBJECT (
	coordonnees Coordonnees_t,
	nom varchar(255)
);
/

CREATE OR REPLACE TYPE Pokestop_t AS OBJECT (
	point_interet Point_interet_t,
);
/

CREATE OR REPLACE TYPE Arene_libre_t AS OBJECT (
	point_interet Point_interet_t
);
/

CREATE OR REPLACE TYPE Equipe_t AS OBJECT (
	couleur varchar(12)
);
/

CREATE OR REPLACE TYPE Arene_conquise_t AS OBJECT (
	point_interet Point_interet_t,
	equipe Equipe_t,
	prestige int
);
/

CREATE OR REPLACE TYPE Avatar_t AS OBJECT (
	sexe char(1),
	couleur_cheveux varchar(31),
	couleur_peau varchar(31)
	couleur_yeux varchar(31)
);
/

CREATE OR REPLACE TYPE Item_t AS OBJECT (
	type varchar(31),
	description varchar(255)
);
/

CREATE OR REPLACE TYPE Item_dresseur_t AS OBJECT (
	items Item_t,
	nb_item int
);
/

CREATE OR REPLACE TYPE Dresseur_t AS OBJECT (
	id int,
	avatar Avatar_t,
	pseudo varchar(31),
	coordonnees Coordonnees_t,
	xp_actuel int,
	date_inscription date,
	equipe Equipe_t,
	pokecoins int,
	stardusts int,
	niveau Niveau_t,
	succes Succes_t,
	pokemons Pokemon_t,
	items Item_dresseur_t,
	oeufs Oeufs_t
);
/

CREATE OR REPLACE TYPE Attaque_t AS OBJECT (
	nom varchar(31),
	type varchar(31), -- heal ou dégat
	valeur_min int,
	valeur_max int
);
/

CREATE OR REPLACE TYPE Pokemon_attaque_t AS VARRAY (2) OF Attaque_t;

CREATE OR REPLACE TYPE Pokemon_capture_t AS OBJECT (
	cout_evolution int,
	cp int,
	hp int,
	Attaques Pokemon_attaque_t,
	taille float,
	poids float
);
/

CREATE OR REPLACE TYPE Dresseur_pokemon_t AS VARRAY (150) OF Pokemon_capture_t;

CREATE OR REPLACE TYPE Pokemon_sauvage_t AS OBJECT (
	coordonnees Coordonnees_t;
);
/

CREATE TABLE Dresseur();
CREATE TABLE Pokemon();
CREATE TABLE Item();
CREATE TABLE Attaque();
