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

CREATE OR REPLACE TYPE Attaque_t AS OBJECT (
	nom varchar(31),
	type varchar(31), -- soin ou dégât
	valeur_min NUMBER,
	valeur_max NUMBER
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


CREATE OR REPLACE TYPE Oeuf_t AS OBJECT (
	incubation number(1),
	km_parcourus NUMBER,
	km_eclosion NUMBER
);
/

CREATE OR REPLACE TYPE Liste_Oeufs AS VARRAY (9) OF Oeuf_t;
/

CREATE OR REPLACE TYPE Entite_Pokemon_t AS OBJECT (
       id NUMBER,
       race varchar(32)
) NOT INSTANTIABLE NOT FINAL;
/

CREATE OR REPLACE TYPE Pokemon_Sauvage_t UNDER Entite_Pokemon_t (
	coordonnees Coordonnees_t
);
/

CREATE OR REPLACE TYPE Pokemon_Capture_t UNDER Entite_Pokemon_t (
	cout_evolution NUMBER,
	cp NUMBER,
	hp NUMBER,
	Attaques Liste_Attaques,
	taille float,
	poids float
	-- maitre REF Dresseur_t -- besoin du alter type
);
/

CREATE OR REPLACE TYPE Liste_Pokemon AS VARRAY (250) OF Pokemon_Capture_t;
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
	prestige NUMBER,
	Pokemons Liste_Defenseurs
);
/

CREATE OR REPLACE TYPE Dresseur_t AS OBJECT (
	id NUMBER,
	avatar Avatar_t,
	pseudo varchar(31),
	coordonnees Coordonnees_t,
	xp_actuel NUMBER,
	niveau NUMBER,
	date_inscription date,	
	equipe Equipe_t,
	pokecoins NUMBER,
	stardusts NUMBER,
	pokemons Liste_Pokemon,
	oeufs Liste_Oeufs
);
/

CREATE OR REPLACE TYPE Couleur_t AS OBJECT (
	couleur Niveau_Succes_t,
	maitre REF Dresseur_t,
	succes REF Succes_t
);
/


-- On ajoute la référence du dresseur dans un Pokémon capturé car ils ont une référence l'un à l'autre
ALTER TYPE Pokemon_Capture_t ADD ATTRIBUTE maitre REF Dresseur_t CASCADE;

-- ################################################
-- ################################################

/*
	Creation des tables
*/


CREATE TABLE Niveau (
       id NUMBER,
       min_xp FLOAT,
       max_xp FLOAT,
       CONSTRAINT PK_Niveau_ID PRIMARY KEY (id),
       CONSTRAINT NN_Niveau_max_xp CHECK (max_xp IS NOT NULL),
       CONSTRAINT NN_Niveau_min_xp CHECK (min_xp IS NOT NULL),			
       CONSTRAINT CK_MIN_MAX CHECK (min_xp < max_xp)
);

CREATE TABLE Dresseur OF Dresseur_t (
       CONSTRAINT FK_Dresseur_Niveau FOREIGN KEY (niveau) REFERENCES Niveau(id) 
);

CREATE TABLE Succes (
	id NUMBER,
	nom varchar(255),
	conditions varchar(255),
	CONSTRAINT PK_Succes_ID PRIMARY KEY (id),
	CONSTRAINT NN_Succes_Nom CHECK (nom IS NOT NULL),
	CONSTRAINT UNI_Succes_Nom CHECK (nom IS UNIQUE)
);

CREATE TABLE Avancement_Succes (
       id_succes NUMBER,
       dresseur REF Dresseur_t,
       avancement ENUM ('bronze', 'argent', 'or'),
       CONSTRAINT PK_Av_Succes PRIMARY KEY (id_succes, dresseur),
       CONSTRAINT FK_AvSuc_ID_Suc FOREIGN KEY (id_succes) REFERENCES Succes(id) ON DELETE CASCADE,
       CONSTRAINT REF_AvSuc_Dresseur FOREIGN KEY (dresseur) REFERENCES Dresseur ON DELETE CASCADE
);

CREATE TABLE Item (
       type_item varchar(31),
       description varchar(255)
       CONSTRAINT PK_Item_TypeI PRIMARY KEY (type_item),
       CONSTRAINT NN_Item_Desc CHECK (description IS NOT NULL)
);

CREATE TABLE Posseder_Item (
       type_item VARCHAR(31),
       dresseur Dresseur_t,
       nb_item NUMBER,
       CONSTRAINT PK_PossItem PRIMARY KEY (type_item, dresseur),
       CONSTRAINT FK_PossItem_Item FOREIGN KEY (type_item) REFERENCES Item(type_item),
       CONSTRAINT FK_PossItem_Dresseur FOREIGN KEY (dresseur)REFERENCES Dresseur ON DELETE CASCADE
);

CREATE TABLE Pokemon (
	race varchar(32),
	cout_evolution NUMBER,
	type_elementaire varchar(31),
	evolution varchar(32),
	CONSTRAINT PK_Pokemon_Nom PRIMARY KEY (nom) ON DELETE CASCADE,
	CONSTRAINT FK_Pokemon_evol FOREIGN KEY (evolution) REFERENCES Pokemon(nom) ON DELETE CASCADE
   
);

CREATE TABLE Pokemon_Capture OF Pokemon_Capture_t (
       CONSTRAINT PK_PokeCapt_id PRIMARY KEY (id),
       CONSTRAINT FK_PokeCapt_Pokemon FOREIGN KEY (race) REFERENCES Pokemon(race) 
);

CREATE TABLE Pokemon_Sauvage OF Pokemon_Sauvage_t (
       CONSTRAINT PK_PokeSauv_id PRIMARY KEY (id),
       CONSTRAINT FK_PokeSauv_Pokemon FOREIGN KEY (race) REFERENCES Pokemon(race)
);

CREATE TABLE Bonbon (
       race_pokemon VARCHAR(32),
       dresseur REF Dresseur_t,
       nb_bonbons NUMBER,
       CONSTRAINT PK_Bonbon PRIMARY KEY (race_pokemon, dresseur),
       CONSTRAINT FK_Bonbon_Pokemon FOREIGN KEY (race_pokemon) REFERENCES Pokemon(race),
       CONSTRAINT FK_Bonbon_Dresseur FOREIGN KEY (dresseur) REFERENCES Dresseur ON DELETE CASCADE
);


CREATE TABLE Visite_Pokestop (
	date_derniere_visite DATE,
	dresseur REF Dresseur_t,
	pokestop REF Pokestop_t
	CONSTRAINT PK_Visite_Pokestop PRIMARY KEY (dresseur, pokestop),
	CONSTRAINT FK_VisitePKS_dresseur FOREIGN KEY (dresseur) REFERENCES Dresseur ON DELETE CASCADE,
	CONSTRAINT FK_VisitePKS_pokestop FOREIGN KEY (pokestop) REFERENCES Pokestop ON DELETE CASCADE
);
/



-- ################################################
-- ################################################

/*
	Création des triggers de vérification des contraintes
*/
