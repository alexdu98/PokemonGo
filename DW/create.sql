DROP TABLE Pokemon CASCADE CONSTRAINTS;
DROP TABLE Condition CASCADE CONSTRAINTS;
DROP TABLE Transaction_type CASCADE CONSTRAINTS;
DROP TABLE Date_table CASCADE CONSTRAINTS;
DROP TABLE Lieu CASCADE CONSTRAINTS;
DROP TABLE Dresseur CASCADE CONSTRAINTS;
DROP TABLE Dresseur_dynamique CASCADE CONSTRAINTS;
DROP TABLE bridge_dresseur CASCADE CONSTRAINTS;
DROP TABLE Paiement CASCADE CONSTRAINTS;
DROP TABLE Item CASCADE CONSTRAINTS;
DROP TABLE Transaction CASCADE CONSTRAINTS;
DROP TABLE Capture CASCADE CONSTRAINTS;


CREATE TABLE Pokemon(
	id_pokemon number,
	nom varchar(32),
	type1 varchar(32),
	type2 varchar(32),
	CP number, --Ici on ecrase la valeur du CP lors d'update
	HP number,
	attaque1 number,
	attaque2 number,
	taille float,
	poids float,
	CONSTRAINT PK_POKEMON PRIMARY KEY (id_pokemon)
);

CREATE TABLE Condition(
	id_condition number,
	heure_debut number,
	minute_debut number,
	seconde_debut number,
	duree number,
	nombre_baie number,
	type_pokeball varchar(32),
	nombre_essais number,
	CONSTRAINT PK_CONDITION PRIMARY KEY (id_condition)
);

CREATE TABLE Transaction_type(
	id_transaction number,
	description varchar(256),
	CONSTRAINT PK_TRANSACTION_TYPE PRIMARY KEY (id_transaction)
);


Create table Date_table(
	id_date NUMBER,
	date_champ DATE,
	jour NUMBER,
	jour_semaine VARCHAR(10),
	num_semaine NUMBER CHECK (num_semaine > 0 AND num_semaine <= 52),
	mois NUMBER CHECK (mois > 0 AND mois <= 12),
	annee NUMBER,
	indication_promotion NUMBER,
	indicateur_vacance NUMBER,
	CONSTRAINT PK_id_date PRIMARY KEY (id_date),
	CONSTRAINT CK_jour_semaine CHECK (jour_semaine in ('lundi','mardi','mercredi','jeudi','vendredi','samedi','dimanche'))
);

Create table Lieu(
	id_lieu NUMBER,
	longitude NUMBER,
	latitude NUMBER,
	altitude NUMBER,
	pays VARCHAR(255),
	ville VARCHAR(255),
	departement VARCHAR(255),
	num_rue NUMBER,
	type_rue VARCHAR(255),
	intitule_rue VARCHAR(255),
	code_postal NUMBER,
	cedex NUMBER,
	CONSTRAINT PK_id_lieu PRIMARY KEY (id_lieu)
);

Create table Dresseur(
	id_dresseur  NUMBER,
	pseudo VARCHAR(32),
	--age  NUMBER,
	mail  VARCHAR(255),
	nationalite VARCHAR(255),
	--XP_Actuel  NUMBER,
	date_inscription date,
	equipe  VARCHAR(5),
	sexe  VARCHAR(1),
	couleur_cheveux  VARCHAR(255), 
	couleur_yeux  VARCHAR(255),
	couleur_peau  VARCHAR(255),
	couleur_sac  VARCHAR(255),
	type_vetement  VARCHAR(255),
	type_bonnet  VARCHAR(255),
	CONSTRAINT PK_id_dresseur PRIMARY KEY (id_dresseur),
	CONSTRAINT CK_equipe CHECK (equipe in ('rouge','jaune','bleu')),
	CONSTRAINT CK_sexe CHECK (sexe in ('M','F','I'))
);

create table Dresseur_dynamique(
	id_dresseur_dynamique NUMBER,
	age NUMBER,
	XP_Actuel NUMBER,
	CONSTRAINT PK_id_dresseur_dynamique PRIMARY KEY (id_dresseur_dynamique)
);

create table bridge_dresseur(
	id_dresseur NUMBER,
	id_dresseur_dynamique NUMBER,
	valid_from date,
	valid_to date,
	newest NUMBER,
	version NUMBER,
	CONSTRAINT PK_bridge PRIMARY KEY (id_dresseur,id_dresseur_dynamique, valid_from),
	CONSTRAINT FK_ID_DRESSEUR_BRIDGE_DRESSEUR FOREIGN KEY (id_dresseur) REFERENCES Dresseur(id_dresseur),
	CONSTRAINT FK_ID_DRESSEUR_DYNAMIQUE_BRIDGE_DRESSEUR FOREIGN KEY (id_dresseur_dynamique) REFERENCES Dresseur_dynamique(id_dresseur_dynamique),
	CONSTRAINT CK_newest CHECK(newest in (0,1))
);

-- Il faut réaliser un trigger pour éviter que deux dates se chevauchent il me semble


CREATE TABLE Paiement(
	id_Paiement NUMBER,
	moyen_paiement  VARCHAR(32),
	devise  VARCHAR(32),
	entreprise_responsable  VARCHAR(255),
	mail_entreprise  VARCHAR(255),
	site_entreprise  VARCHAR(255),
	banque_responsable  VARCHAR(255),
	mail_banque  VARCHAR(255),
	site_banque VARCHAR(255),
	device_type  VARCHAR(32),
	adresse_ip  VARCHAR(128),
	CONSTRAINT PK_id_Paiement PRIMARY KEY (id_Paiement)
);

-- il y a un attribut OLD_nomAttribut pour les attributs susceptibles d'etre changés pour un équilibrage du jeu
CREATE TABLE Item(
	id_Item  NUMBER,
	nom  VARCHAR(255),
	description  VARCHAR(255),
	type  VARCHAR(255),
	bonus_HP  NUMBER,
	OLD_bonus_HP NUMBER,
	bonus_CP  NUMBER,
	OLD_bonus_CP  NUMBER,
	rarete  VARCHAR(255),
	OLD_rarete VARCHAR(255),
	cible_item  VARCHAR(255),
	efficacite_pokeball  NUMBER,
	OLD_efficacite_pokeball  NUMBER,
	CONSTRAINT id_Item PRIMARY KEY (id_Item)
);

CREATE TABLE Transaction(
	id NUMBER,
	id_Paiement NUMBER,
	id_Dresseur NUMBER,
	id_Date NUMBER,
	id_Lieu NUMBER,
	id_Item NUMBER,
	prix_unitaire NUMBER,
	quantite NUMBER,
	depense_total NUMBER,
	CONSTRAINT PK_ID PRIMARY KEY (id),
	CONSTRAINT FK_ID_PAIEMENT_TRANSACTION FOREIGN KEY (id_Paiement) REFERENCES Paiement(id_Paiement),
	CONSTRAINT FK_ID_DRESSEUR_TRANSACTION FOREIGN KEY (id_Dresseur) REFERENCES Dresseur(id_Dresseur),
	CONSTRAINT FK_ID_DATE_TRANSACTION FOREIGN KEY (id_Date) REFERENCES Date_table(id_Date),
	CONSTRAINT FK_ID_LIEU_TRANSACTION FOREIGN KEY (id_Lieu) REFERENCES Lieu(id_Lieu),
	CONSTRAINT FK_ID_ITEM_TRANSACTION FOREIGN KEY (id_Item) REFERENCES Item(id_Item)
);



CREATE TABLE Capture(
	id_Capture NUMBER,
	id_dresseur number,
	id_date number,
	id_lieu number,
	id_pokemon number,
	id_transaction_type number,
	id_condition number,
	CONSTRAINT PK_ID_CAPTURE PRIMARY KEY (id_Capture),
	CONSTRAINT FK_ID_DRESSEUR_CAPTURE FOREIGN KEY (id_dresseur) REFERENCES Dresseur(id_dresseur),
	CONSTRAINT FK_ID_DATE_CAPTURE FOREIGN KEY (id_date) REFERENCES Date_table(id_date),
	CONSTRAINT FK_ID_LIEUX_CAPTURE FOREIGN KEY (id_lieu) REFERENCES Lieu(id_lieu),
	CONSTRAINT FK_ID_POKEMON_CAPTURE FOREIGN KEY (id_pokemon) REFERENCES Pokemon(id_pokemon),
	CONSTRAINT FK_ID_TRANSACTION_TYPE_CAPTURE FOREIGN KEY (id_transaction_type) REFERENCES Transaction_type(id_transaction),
	CONSTRAINT FK_ID_CONDITION_CAPTURE FOREIGN KEY (id_condition) REFERENCES Condition(id_condition)
);