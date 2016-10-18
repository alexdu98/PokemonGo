DROP TYPE Bonbon_t;
DROP TYPE Dresseur_t;
DROP TYPE Entite_Pokemon_t;
DROP TYPE Entite_Item_t;
DROP TYPE Item_t;
DROP TYPE Point_Interet_t;
DROP TYPE Arene_t;
DROP TYPE Pokestop_t;
DROP TYPE Pokemon_Capture_t;
DROP TYPE Pokemon_Sauvage_t;
DROP TYPE Entite_Pokemon_t;
DROP TYPE Pokemon_t;
DROP TYPE Oeuf_t;
DROP TYPE Niveau_t;
DROP TYPE Succes_t;
DROP TYPE Niveau_Succes_t;





CREATE OR REPLACE TYPE Coordonnees_t AS OBJECT (
	longitude float,
	latitude float
);
/

CREATE OR REPLACE TYPE Niveau_Succes_t AS OBJECT (
	niveau ENUM('bronze', 'argent', 'or')
):
/

CREATE OR REPLACE TYPE Attaque_t AS OBJECT (
	nom varchar(31),
	type varchar(31), -- soin ou dégât
	valeur_min int,
	valeur_max int
);
/

CREATE OR REPLACE TYPE Avatar_t AS OBJECT (
	sexe char(1),
	couleur_cheveux varchar(31),
	couleur_peau varchar(31)
	couleur_yeux varchar(31)
);
/

CREATE OR REPLACE TYPE Equipe_t AS OBJECT (
	couleur ENUM('rouge', 'bleu', 'jaune')
);
/

CREATE OR REPLACE TYPE Liste_attaques AS VARRAY (2) OF Attaque_t;
/

CREATE OR REPLACE TYPE Liste_succes AS TABLE OF Succes_t;
/

CREATE OR REPLACE TYPE Liste_Oeufs AS VARRAY (9) OF Oeuf_t;
/

CREATE OR REPLACE TYPE Liste_Items AS TABLE OF Item_t;
/

CREATE OR REPLACE TYPE Liste_Pokemon AS VARRAY (150) OF Pokemon_Capture_t;
/






CREATE OR REPLACE TYPE Succes_t AS OBJECT (
	id int,
	niveau_succes Niveau_Succes_t,
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

CREATE OR REPLACE TYPE Entite_Pokemon_t AS OBJECT (
	race REF Pokemon_t
) NOT INSTANTIABLE NOT FINAL;

CREATE OR REPLACE TYPE Pokemon_Capture_t UNDER Entite_Pokemon_t (
	cout_evolution int,
	cp int,
	hp int,
	Attaques Liste_Attaques,
	taille float,
	poids float,
	maitre REF Dresseur_t
);
/

CREATE OR REPLACE TYPE Pokemon_Sauvage_t UNDER Entite_Pokemon_t (
	coordonnees Coordonnees_t;
);
/

CREATE OR REPLACE TYPE Oeuf_t AS OBJECT (
	incubation number(1),
	km_parcourus int,
	km_eclosion int
);
/

CREATE OR REPLACE TYPE Point_Interet_t AS OBJECT (
	coordonnees Coordonnees_t,
	nom varchar(255)
) NOT INSTANTIABLE NOT FINAL;
/

CREATE OR REPLACE TYPE Pokestop_t UNDER Point_Interet_t (
	point_interet Point_interet_t,
);
/

CREATE OR REPLACE TYPE Arene_t AS OBJECT (
	point_interet Point_Interet_t,
	equipe Equipe_t,
	prestige int
);
/

CREATE OR REPLACE TYPE Entite_Item_t AS OBJECT (
	nb_item int,
	description REF Item_t
);
/

CREATE OR REPLACE TYPE Item_t AS OBJECT (
	type varchar(31),
	description varchar(255)
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
	succes Liste_succes,
	pokemons Liste_Pokemon,
	items Liste_items,
	oeufs Liste_Oeufs
) NESTED TABLE succes STORE AS table_succes, NESTED TABLE items STORE AS table_items;
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






CREATE TABLE Dresseur();
CREATE TABLE Pokemon();
CREATE TABLE Item();
CREATE TABLE Attaque();
