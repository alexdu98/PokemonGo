CREATE OR REPLACE TRIGGER Check_Nombre_Item
AFTER INSERT OR UPDATE ON Posseder_Item
FOR EACH ROW
DECLARE
	v_nb_items number;
BEGIN
	SELECT SUM(PI.nb_item) INTO v_nb_items FROM Posseder_Item PI WHERE :NEW.id_dresseur = PI.id_dresseur;
	IF v_nb_items > 350 THEN
		RAISE_APPLICATION_ERROR(-20101, 'Nombre d''items maximum atteint.');
	END IF;
END;
/

CREATE OR REPLACE TRIGGER Check_Nombre_Oeufs_Incube
AFTER INSERT OR UPDATE ON Dresseur
FOR EACH ROW
DECLARE
	v_nb_oeufs number;
BEGIN
	SELECT COUNT(o.incubation) INTO v_nb_oeufs FROM Dresseur d, Table (d.oeufs) o WHERE :NEW.id = d.id AND o.incubation = 1;
	IF v_nb_oeufs > 3 THEN
		RAISE_APPLICATION_ERROR(-20102, 'Nombre d''oeufs incubés maximum atteint.');
	END IF;
END;
/

CREATE OR REPLACE TRIGGER Check_Derniere_Visite_Pokestop
BEFORE UPDATE ON Visite_Pokestop
FOR EACH ROW
DECLARE
	v_date_derniere_visite date;
BEGIN
	SELECT VP.date_derniere_visite INTO v_date_derniere_visite FROM Visite_Pokestop VP WHERE :NEW.id_dresseur = VP.id_dresseur AND :NEW.id_pokestop = VP.id_pokestop;
	IF v_date_derniere_visite > (SYSDATE - 5/2880) THEN
		RAISE_APPLICATION_ERROR(-20103, 'Vous avec déjà visité ce pokestop il y a moins de 5 minutes.');
	END IF;
END;
/

CREATE OR REPLACE TRIGGER Check_Bonbon
BEFORE INSERT OR UPDATE ON Bonbon
FOR EACH ROW
DECLARE
	v_pokemon Pokemon.evolution_precedente%TYPE;
BEGIN
	SELECT evolution_precedente INTO v_pokemon FROM Pokemon p WHERE p.race = :NEW.race_pokemon;
	IF v_pokemon != null THEN
		RAISE_APPLICATION_ERROR(-20104, 'Les bonbons doivent être du type de base du pokemon.');
	END IF;
END;
/

CREATE OR REPLACE TRIGGER Check_Equipe_Pokemon_Arene
BEFORE UPDATE ON Arene
FOR EACH ROW
DECLARE
	v_equipe_dresseur Dresseur.equipe%TYPE;
BEGIN
	SELECT p.maitre.equipe INTO v_equipe_dresseur FROM Arene a, Table (:NEW.pokemons) p;
	IF v_equipe_dresseur != :NEW.equipe THEN
		RAISE_APPLICATION_ERROR(-20105, 'L''arène n''est pas de la même équipe que le dresseur.');
	END IF;
END;
/

CREATE OR REPLACE TRIGGER Check_Equipe_Pokemon_Arene
BEFORE UPDATE ON Arene
FOR EACH ROW
DECLARE
	v_equipe_dresseur Dresseur.equipe%TYPE;
	i number;
	TYPE v_dresseurs IS TABLE OF Dresseur;
BEGIN
	SELECT p.maitre INTO v_dresseurs FROM Arene a, Table(a.pokemons) p WHERE :NEW.id = a.id;
	FOR i IN v_dresseurs.FIRST..v_dresseurs.LAST LOOP
		SELECT v_dresseurs.EXISTS(i).equipe INTO v_equipe_dresseur FROM Arene a;
		IF v_equipe_dresseur != :NEW.equipe THEN
			RAISE_APPLICATION_ERROR(-20105, 'L''arène n''est pas de la même équipe que le dresseur.');
		END IF;
	END LOOP;
END;
/

CREATE OR REPLACE TRIGGER Check_Equipe_Pokemon_Arene
BEFORE UPDATE ON Arene
FOR EACH ROW
DECLARE
	couleur dresseur.equipe%TYPE;
	cursor poke IS
		SELECT T.id, T.maitre FROM Arene a, Table (a.pokemons) T WHERE :NEW.id = a.id;
BEGIN
	FOR i IN poke LOOP
		SELECT d.equipe.couleur INTO couleur FROM dresseur d WHERE d.id = i.maitre.id;
		IF couleur != :NEW.equipe.couleur THEN
			RAISE_APPLICATION_ERROR(-20105, 'aaa');
		END IF;
	END LOOP;
END;
/
