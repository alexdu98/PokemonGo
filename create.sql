/*
	Suppression de tous les types et
	de toutes les tables.
*/

DROP TABLE Niveau_Succes FORCE;
DROP TABLE Equipe FORCE;
DROP TABLE Dresseur FORCE;

DROP TYPE Couleur_t FORCE;
DROP TYPE Date_Visite_t FORCE;
DROP TYPE Bonbon_t FORCE;
DROP TYPE Dresseur_t FORCE;
DROP TYPE Arene_t FORCE;
DROP TYPE Liste_Defenseurs FORCE;
DROP TYPE Pokestop_t FORCE;
DROP TYPE Point_Interet_t FORCE;
DROP TYPE Pokemon_Sauvage_t FORCE;
DROP TYPE Liste_Pokemon FORCE;
DROP TYPE Pokemon_Capture_t FORCE;
DROP TYPE Entite_Pokemon_t FORCE;
DROP TYPE Pokemon_t FORCE;
DROP TYPE Liste_attaques FORCE;
DROP TYPE Attaque_t FORCE;
DROP TYPE Equipe_t FORCE;
DROP TYPE Avatar_t FORCE;
DROP TYPE Niveau_t FORCE;
DROP TYPE Entite_Item_t FORCE;
DROP TYPE Liste_Items FORCE;
DROP TYPE Item_t FORCE;
DROP TYPE Liste_Oeufs FORCE;
DROP TYPE Oeuf_t FORCE;
DROP TYPE Succes_t FORCE;
DROP TYPE Niveau_Succes_t FORCE;
DROP TYPE Coordonnees_t FORCE;

-- ################################################
-- ################################################

/*
	Création des types "simples" utilisés par d'autres types
*/
CREATE OR REPLACE TYPE Coordonnees_t AS OBJECT (
	longitude float,
	latitude float
);
/

CREATE OR REPLACE TYPE Niveau_Succes_t AS OBJECT (
	niveau varchar(10)
);
/

CREATE OR REPLACE TYPE Attaque_t AS OBJECT (
	nom varchar(31),
	type varchar(31), -- soin ou dégât
	valeur_min int,
	valeur_max int
);
/

CREATE OR REPLACE TYPE Liste_attaques AS VARRAY (2) OF Attaque_t;
/

CREATE OR REPLACE TYPE Avatar_t AS OBJECT (
	sexe char(1),
	couleur_cheveux varchar(31),
	couleur_peau varchar(31),
	couleur_yeux varchar(31)
);
/

CREATE OR REPLACE TYPE Equipe_t AS OBJECT (
	couleur varchar(10)
);
/

-- ################################################
-- ################################################

/*
	Création des autres types
*/
CREATE OR REPLACE TYPE Succes_t AS OBJECT (
	id int,
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
	type varchar(31),
	evolution REF Pokemon_t
);
/

CREATE OR REPLACE TYPE Oeuf_t AS OBJECT (
	incubation number(1),
	km_parcourus int,
	km_eclosion int
);
/

CREATE OR REPLACE TYPE Liste_Oeufs AS VARRAY (9) OF Oeuf_t;
/

CREATE OR REPLACE TYPE Item_t AS OBJECT (
	type varchar(31),
	description varchar(255)
);
/

CREATE OR REPLACE TYPE Liste_Items AS TABLE OF Item_t;
/

CREATE OR REPLACE TYPE Entite_Item_t AS OBJECT (
	nb_item int,
	description REF Item_t
);
/

CREATE OR REPLACE TYPE Entite_Pokemon_t AS OBJECT (
	race REF Pokemon_t
) NOT INSTANTIABLE NOT FINAL;
/

CREATE OR REPLACE TYPE Pokemon_Sauvage_t UNDER Entite_Pokemon_t (
	coordonnees Coordonnees_t
);
/

CREATE OR REPLACE TYPE Pokemon_Capture_t UNDER Entite_Pokemon_t (
	cout_evolution int,
	cp int,
	hp int,
	Attaques Liste_Attaques,
	taille float,
	poids float
	-- maitre REF Dresseur_t -- besoin du alter type
);
/

CREATE OR REPLACE TYPE Liste_Pokemon AS VARRAY (150) OF Pokemon_Capture_t;
/

CREATE OR REPLACE TYPE Point_Interet_t AS OBJECT (
	coordonnees Coordonnees_t,
	nom varchar(255)
) NOT INSTANTIABLE NOT FINAL;
/

CREATE OR REPLACE TYPE Pokestop_t UNDER Point_Interet_t (
	point_interet Point_interet_t
);
/

CREATE OR REPLACE TYPE Liste_Defenseurs AS VARRAY (3) OF Pokemon_Capture_t;
/

CREATE OR REPLACE TYPE Arene_t AS OBJECT (
	point_interet Point_Interet_t,
	equipe Equipe_t,
	prestige int,
	Pokemons Liste_Defenseurs
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
	pokemons Liste_Pokemon,
	items Liste_items,
	oeufs Liste_Oeufs
);
/

CREATE OR REPLACE TYPE Couleur_t AS OBJECT (
	couleur Niveau_Succes_t,
	maitre REF Dresseur_t,
	succes REF Succes_t
);
/

CREATE OR REPLACE TYPE Bonbon_t AS OBJECT (
	nb_bonbon int,
	maitre REF Dresseur_t,
	race REF Pokemon_t
);
/

CREATE OR REPLACE TYPE Date_Visite_t AS OBJECT (
	date_visite date,
	dresseur REF Dresseur_t,
	pokestop REF Pokestop_t
);
/

-- On ajoute la référence du dresseur dans un Pokémon capturé car ils ont une référence l'un à l'autre
ALTER TYPE Pokemon_Capture_t ADD ATTRIBUTE maitre REF Dresseur_t CASCADE;

-- ################################################
-- ################################################

/*
	Création des tables
*/
CREATE TABLE Niveau_Succes OF Niveau_Succes_t (
	CHECK(niveau IN ('bronze', 'argent', 'or'))
);

CREATE TABLE Equipe OF Equipe_t (
	CHECK(couleur IN ('rouge', 'bleu', 'jaune'))
);

CREATE TABLE Dresseur OF Dresseur_t NESTED TABLE items STORE AS table_items;
