CREATE OR REPLACE TYPE Succes_t AS OBJECT (
	id int,
	couleur varchar(31),
	nom varchar(255)
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

CREATE OR REPLACE TYPE Lieu_t AS OBJECT (
	Coordonnees_t coordonnees,
	nom varchar(255)
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
	description varchar(255)
);
/

CREATE OR REPLACE TYPE Dresseur_t AS OBJECT (
	id int,
	Avatar_t avatar,
	pseudo varchar(31),
	xp_actuel int,
	date_inscription date,
	equipe varchar(31),
	pokecoins int,
	stardusts int,
	Niveau_t niveau,
	Succes_t succes,
	Pokemon_t pokemons,
	Item_t items,
	Oeufs_t oeufs
);
/

CREATE TABLE Dresseur();
CREATE TABLE Pokemon();
CREATE TABLE Item();
