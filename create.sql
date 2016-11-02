set sqlblanklines on
/*
	Suppression de tous les types et
	de toutes les tables.
*/

DROP TABLE Niveau CASCADE CONSTRAINTS;
DROP TABLE Dresseur CASCADE CONSTRAINTS;
DROP TABLE Succes CASCADE CONSTRAINTS;
DROP TABLE Avancement_Succes CASCADE CONSTRAINTS; 
DROP TABLE Item CASCADE CONSTRAINTS;
DROP TABLE Posseder_Item CASCADE CONSTRAINTS;
DROP TABLE Pokemon CASCADE CONSTRAINTS;
DROP TABLE Pokemon_Capture CASCADE CONSTRAINTS;
DROP TABLE Pokemon_Sauvage CASCADE CONSTRAINTS;
DROP TABLE Bonbon CASCADE CONSTRAINTS;
DROP TABLE Pokestop CASCADE CONSTRAINTS;
DROP TABLE Arene CASCADE CONSTRAINTS;
DROP TABLE Visite_Pokestop CASCADE CONSTRAINTS;

DROP TYPE Dresseur_t FORCE;
DROP TYPE Arene_t FORCE;
DROP TYPE Liste_Defenseurs FORCE;
DROP TYPE Pokestop_t FORCE;
DROP TYPE Point_Interet_t FORCE;
DROP TYPE Pokemon_Sauvage_t FORCE;
DROP TYPE Liste_Pokemon FORCE;
DROP TYPE Pokemon_Capture_t FORCE;
DROP TYPE Entite_Pokemon_t FORCE;
DROP TYPE Liste_attaques FORCE;
DROP TYPE Attaque_t FORCE;
DROP TYPE Avatar_t FORCE;
DROP TYPE Liste_Oeufs FORCE;
DROP TYPE Oeuf_t FORCE;
DROP TYPE Coordonnees_t FORCE;
DROP TYPE Equipe_t FORCE;

-- ################################################
-- ################################################

/*
	Création des types "simples" utilisés par d'autres types
*/

CREATE OR REPLACE TYPE Coordonnees_t AS OBJECT(
	latitude float,
	longitude float,
	MEMBER FUNCTION distance(coordDirection Coordonnees_t) return FLOAT,
	STATIC FUNCTION convertRad(nb FLOAT) return FLOAT
);
/

CREATE OR REPLACE TYPE BODY Coordonnees_t AS 
MEMBER FUNCTION distance(coordDirection Coordonnees_t) RETURN FLOAT IS
	rayonTerre NUMBER;
	latA FLOAT;
	longA FLOAT;
	latB FLOAT;
	longB FLOAT;
	resultat FLOAT;
	BEGIN
		rayonTerre := 6378000;		

		latA := Coordonnees_t.convertRad(self.latitude);
		longA := Coordonnees_t.convertRad(self.longitude);
		latB := Coordonnees_t.convertRad(coordDirection.latitude);
		longB := Coordonnees_t.convertRad(coordDirection.longitude);

		resultat := ACOS(SIN(latB) * SIN(latA) + COS(longB - longA) * COS(latB) * COS(latA));
		resultat := (resultat * rayonTerre);
		
		RETURN resultat;
	END distance;

STATIC FUNCTION convertRad(nb FLOAT) return FLOAT IS
	PI FLOAT;
	begin
		PI := 3.141592654;

		RETURN ((PI * nb)/180);
	end convertRad;
end;
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
	id NUMBER,
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
	cp NUMBER,
	hp NUMBER,
	Attaques Liste_Attaques,
	taille float,
	poids float
	-- maitre REF Dresseur_t -- besoin du alter type
);
/

CREATE OR REPLACE TYPE Liste_Pokemon AS VARRAY (250) OF REF Pokemon_Capture_t;
/

CREATE OR REPLACE TYPE Point_Interet_t AS OBJECT (
	id NUMBER,
	coordonnees Coordonnees_t,
	nom varchar(255)
) NOT INSTANTIABLE NOT FINAL;
/

CREATE OR REPLACE TYPE Pokestop_t UNDER Point_Interet_t (
);
/

CREATE OR REPLACE TYPE Liste_Defenseurs AS VARRAY (3) OF REF Pokemon_Capture_t;
/

CREATE OR REPLACE TYPE Arene_t UNDER Point_Interet_t (
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
	CONSTRAINT PK_Dresseur_id PRIMARY KEY (id),
       	CONSTRAINT FK_Dresseur_Niveau FOREIGN KEY (niveau) REFERENCES Niveau(id) 
);

CREATE TABLE Succes (
	id NUMBER,
	nom varchar(255),
	conditions varchar(255),
	CONSTRAINT PK_Succes_ID PRIMARY KEY (id),
	CONSTRAINT NN_Succes_Nom CHECK (nom IS NOT NULL),
	CONSTRAINT UNI_Succes_Nom UNIQUE(nom)
);

CREATE TABLE Avancement_Succes (
       id_succes NUMBER,
       id_dresseur NUMBER, /* On est oblige d'ajouter l'id des objets dresseur_t car une ref ne peut pas etre une cle primaire */
       dresseur REF Dresseur_t,
       avancement VARCHAR(7),
       CONSTRAINT PK_Av_Succes PRIMARY KEY (id_succes, id_dresseur),
       CONSTRAINT FK_AvSuc_ID_Suc FOREIGN KEY (id_succes) REFERENCES Succes(id) ON DELETE CASCADE,
       CONSTRAINT FK_AvSuc_ID_Dresseur FOREIGN KEY (id_dresseur) REFERENCES Dresseur(id) ON DELETE CASCADE,
       CONSTRAINT REF_AvSuc_Dresseur FOREIGN KEY (dresseur) REFERENCES Dresseur ON DELETE CASCADE,
       CONSTRAINT CK_AvSc_AvDomain CHECK (avancement in ('bronze', 'argent', 'or'))

);

CREATE TABLE Item (
       type_item varchar(31),
       description varchar(255),
       CONSTRAINT PK_Item_TypeI PRIMARY KEY (type_item),
       CONSTRAINT NN_Item_Desc CHECK (description IS NOT NULL)
);

CREATE TABLE Posseder_Item (
       type_item VARCHAR(31),
       id_dresseur NUMBER, 
       dresseur REF Dresseur_t,
       nb_item NUMBER,
       CONSTRAINT PK_PossItem PRIMARY KEY (type_item, id_dresseur),
       CONSTRAINT FK_PossItem_Item FOREIGN KEY (type_item) REFERENCES Item(type_item),
       CONSTRAINT FK_PossItem_ID_Dresseur FOREIGN KEY (id_dresseur) REFERENCES Dresseur(id) ON DELETE CASCADE,
       CONSTRAINT REF_PossItem_Dresseur FOREIGN KEY (dresseur) REFERENCES Dresseur ON DELETE CASCADE
);

CREATE TABLE Pokemon (
	race varchar(32),
	cout_evolution NUMBER,
	type_elementaire varchar(31),
	evolution varchar(32),
	evolution_precedente varchar(32),
	CONSTRAINT PK_Pokemon_race PRIMARY KEY (race),
	CONSTRAINT FK_Pokemon_evol FOREIGN KEY (evolution) REFERENCES Pokemon(race) ON DELETE CASCADE,
	CONSTRAINT FK_Pokemon_evol_prec FOREIGN KEY (evolution_precedente) REFERENCES Pokemon(race) ON DELETE CASCADE
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
	   id_dresseur NUMBER,
       dresseur REF Dresseur_t,
       nb_bonbons NUMBER,
       CONSTRAINT PK_Bonbon PRIMARY KEY (race_pokemon, id_dresseur),
       CONSTRAINT FK_Bonbon_Pokemon FOREIGN KEY (race_pokemon) REFERENCES Pokemon(race),
       CONSTRAINT FK_Bonbon_ID_Dresseur FOREIGN KEY (id_dresseur) REFERENCES Dresseur(id) ON DELETE CASCADE,
       CONSTRAINT REF_Bonbon_Dresseur FOREIGN KEY (dresseur) REFERENCES Dresseur ON DELETE CASCADE

);

CREATE TABLE Pokestop OF Pokestop_t (
	CONSTRAINT PK_Pokestop_ID PRIMARY KEY (id)
);

CREATE TABLE Arene OF Arene_t (
	CONSTRAINT PK_Arene_ID PRIMARY KEY (id)
);

CREATE TABLE Visite_Pokestop (
	date_derniere_visite DATE,
	id_dresseur NUMBER,
	id_pokestop NUMBER,
	dresseur REF Dresseur_t,
	pokestop REF Pokestop_t,
	CONSTRAINT PK_Visite_Pokestop PRIMARY KEY (id_dresseur, id_pokestop),
	CONSTRAINT REF_VisitePKS_dresseur FOREIGN KEY (dresseur) REFERENCES Dresseur ON DELETE CASCADE,
	CONSTRAINT REF_VisitePKS_pokestop FOREIGN KEY (pokestop) REFERENCES Pokestop ON DELETE CASCADE,
	CONSTRAINT FK_VisitePKS_id_dresseur FOREIGN KEY (id_dresseur) REFERENCES Dresseur(id) ON DELETE CASCADE,
	CONSTRAINT FK_VisitePKS_id_pokestop FOREIGN KEY (id_pokestop) REFERENCES Pokestop(id) ON DELETE CASCADE

);


-- ################################################
-- ################################################

/*
	Création des triggers de vérification des contraintes
*/
