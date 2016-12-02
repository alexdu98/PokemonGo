CREATE TABLE Pokemon(
	id_pokemon number,
	nom charchar varchar(32),
	type1 varchar(32),
	type2 varchar(32),
	CP number,
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

CREATE TABLE Capture(
	id_dresseur number,
	id_date number,
	id_lieux number,
	id_pokemon number,
	id_transaction_type number,
	id_condition number,
	CONSTRAINT PK_CAPTURE PRIMARY KEY (id_dresseur, id_date, id_lieux, id_pokemon, id_transaction_type, id_condition),
	CONSTRAINT FK_ID_DRESSEUR_CAPTURE FOREIGN KEY id_dresseur REFERENCES Dresseur(id_dresseur),
	CONSTRAINT FK_ID_DRESSEUR_CAPTURE FOREIGN KEY id_date REFERENCES Date_entrepot(id_date),
	CONSTRAINT FK_ID_DRESSEUR_CAPTURE FOREIGN KEY id_lieux REFERENCES Lieux(id_lieux),
	CONSTRAINT FK_ID_DRESSEUR_CAPTURE FOREIGN KEY id_pokemon REFERENCES Pokemon(id_pokemon),
	CONSTRAINT FK_ID_DRESSEUR_CAPTURE FOREIGN KEY id_transaction_type REFERENCES Transaction_type(id_transaction_type),
	CONSTRAINT FK_ID_DRESSEUR_CAPTURE FOREIGN KEY id_condition REFERENCES Condition(id_condition)
);