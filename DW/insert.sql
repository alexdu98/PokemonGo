alter session set NLS_DATE_LANGUAGE=ENGLISH;
alter session set NLS_DATE_FORMAT='DD-MON-YYYY HH24:MI';

DELETE FROM Transaction;
DELETE FROM Capture;
DELETE FROM Pokemon;
DELETE FROM Condition;
DELETE FROM Transaction_type;
DELETE FROM Date_entrepot;
DELETE FROM Lieu;
DELETE FROM bridge_dresseur;
DELETE FROM Dresseur;
DELETE FROM Dresseur_dynamique;
DELETE FROM Paiement;
DELETE FROM Item;

INSERT INTO Item VALUES (568 , 'pokeball' , 'sert a capturer des pokemons' , 'simple' , 50 , null, 40 , null, 'commun', null , 'pokemon' , 50, null);
INSERT INTO Item VALUES (302 , 'pokecoin ',' sert de monnaie dans le jeu ', null , 10 , null, 15 , null , null , null , null , null , null);
INSERT INTO Item VALUES (259 , 'baies' , 'sert a apaiser le pokemon',  null , 20 , null, 15 , null, 'commun' , null, null , null, null);

INSERT INTO Paiement VALUES(12569 , 'VISA' , 'dollar' , 'american express' ,' Aexpress@mail.com' , 'www.amexp.com', 'BNP' , 'mabnp@bnp.com' , 'www.bnp.com' , 'mobile' , '127.100.25.03');
INSERT INTO Paiement VALUES(12570 , 'PAYPAL' ,' euros' , 'Paypal' , 'paypal_fr@hmail.fr' , 'www.paypal.fr', 'LCL' , 'lclbanque@lcl.com' , 'www.lcl.com', 'pc', '197.50.48.73' );
INSERT INTO Paiement VALUES(12571 , 'Pokebank' , 'pokecoins' ,  'niantic' , 'niantic@nmail.com' , 'www.niantic.com', 'Pokebank','Pokebank@poke.com', 'www.pokebank.pk', 'mobile' , '223.12.69.99');	

INSERT INTO Date_entrepot VALUES(18062016 , '18-JUN-2016' , 18 , 'samedi', 22 , 06, 2016 , 0 ,0);
INSERT INTO Date_entrepot VALUES(19032016 , '19-MAR-2016' , 19 , 'mardi' , 11 , 03 , 2016 , 0 , 0 );
INSERT INTO Date_entrepot VALUES(21112016 , '21-OCT-2016' , 21 , 'vendredi',  43 , 10 , 2016 , 1 , 1);

INSERT INTO Lieu VALUES(360001 , 43.6403 , 3.855126 , 57.2 , 'France ', 'Montpellier', 'Herault', 15 , 'Rue' , 'de la Chenaie' , 34096 , 5);
INSERT INTO Lieu VALUES(360051 , 58.6993 , 6.72051 , 48.0 , 'France' , 'Lille' , 'Nord' , 18  , 'Avenue', 'de France' , 59000 , 1 );
INSERT INTO Lieu VALUES(35807 , 48.2560 ,  2.65487 , 61.0 ,  'France' ,'Paris', 'Paris' , 65 ,'Rue' , 'de la gare' , 74092 ,  5 );

INSERT INTO Dresseur VALUES(00001 , 'max ' , 'francaise' , 'max22@gmail.com'  , '15-MAY-2016' , 'rouge' ,'M'  );
INSERT INTO Dresseur VALUES(32500 , 'sacha'  , 'americaine' , 'sacha18@hotmail.com'  , '20-APR-2016' , 'bleu' ,'M');
INSERT INTO Dresseur VALUES(5982 , 'dora'  ,  'anglaise' , 'dora12@free.fr' , '25-MAY-2016' , 'jaune' , 'F' );

INSERT INTO Dresseur_dynamique VALUES(1822, 22, 100, 'noir' , 'noir' , 'blanche' , 'bleu' ,'jean', 'bonnet' );
INSERT INTO Dresseur_dynamique VALUES(3518, 18, 85, 'blond' , 'bleu' , 'noir ', 'jaune'  , 'sweat','casquette');
INSERT INTO Dresseur_dynamique VALUES(1256, 12, 28, 'noir' ,' marron' , 'marron', 'rouge'  , 't-shirt', null );
INSERT INTO Dresseur_dynamique VALUES(2223, 13, 38, 'noir' ,' marron' , 'marron', 'rouge'  , 't-shirt', null );
INSERT INTO Dresseur_dynamique VALUES(4118, 18, 90, 'blond' , 'bleu' , 'noir ', 'jaune'  , 'sweat','casquette');

INSERT INTO bridge_dresseur VALUES(00001,1822,NULL,NULL,1,1);
INSERT INTO bridge_dresseur VALUES(5982,1256,NULL,NULL,1,1);
INSERT INTO bridge_dresseur VALUES(5982, 2223,NULL,NULL,1,2);
INSERT INTO bridge_dresseur VALUES(32500,3518,NULL,NULL,0,1);
INSERT INTO bridge_dresseur VALUES(32500,4118,NULL,NULL,1,2);

INSERT INTO Transaction VALUES (1,12569 , 00001 , 1822, 18062016 , 360001 , 568 , 1.0 , 10 , 10.0 );
INSERT INTO Transaction VALUES (2,12570 , 32500, 3518 , 19032016 , 360051 , 302 , 0.5 , 5 , 2.5 );
INSERT INTO Transaction VALUES (3,12571 , 5982, 1256 , 21112016 ,  35807 , 259 , 0.2 , 20 , 4.0 );

INSERT INTO Pokemon VALUES (025, 'Carabaffe', 'eau', NULL, 100, 320, 'charge', 'pistolet', 10.0, 5.0);
INSERT INTO Pokemon VALUES (308, 'Salameche', 'feu', NULL, 100, 90, 'fouet', 'gaz toxique', 15.0, 20.0);
INSERT INTO Pokemon VALUES (114, 'Roucoups', 'vol', NULL, 65, 82, 'coup de griffes', 'morsure', 10.0, 10.0);
 
INSERT INTO Transaction_type VALUES (56800, 'pending');
INSERT INTO Transaction_type VALUES (56801, 'completed');
INSERT INTO Transaction_type VALUES (32100, 'pending');
INSERT INTO Transaction_type VALUES (32101, 'rejected');
INSERT INTO Transaction_type VALUES (25901, 'pending');
INSERT INTO Transaction_type VALUES (25902, 'completed');
 
INSERT INTO Condition VALUES (601, 10, 15,14,2,10,'simple',2);
INSERT INTO Condition VALUES (25,15,01,54,5,20,'superball',1);
INSERT INTO Condition VALUES (201,20,22,34,7,9,'simple',4);
 
INSERT INTO Capture VALUES (1,00001, 1822, 18062016,360001, 025,56801, 601);
INSERT INTO Capture VALUES (2,32500,3518, 19032016,360051, 308, 32101, 25);
INSERT INTO Capture VALUES (3,5982,1256, 21112016,35807,114, 25902, 201);
INSERT INTO Capture VALUES (4,5982,1256, 21112016,35807,114, 25902, 201);
INSERT INTO Capture VALUES (5,5982,1256, 19032016,35807,114, 25902, 201);


        --**********************************************--
	--               VUES MATERIALISEES
	--**********************************************--	
DROP MATERIALIZED VIEW CaptureParMoisEtParVille;
DROP MATERIALIZED VIEW JointureCaptureMois;
DROP MATERIALIZED VIEW JoinCapturePokemonCondition;
DROP MATERIALIZED VIEW TransactionEnArgentReel;
DROP MATERIALIZED VIEW SumQuantiteVenduByItem;
DROP MATERIALIZED VIEW NbPokemonByDresseur;

CREATE MATERIALIZED VIEW CaptureParMoisEtParVille (mois, ville, nbPokemonCapture) AS 
SELECT mois, ville, COUNT(*) AS nbPokemonCapture 
FROM Capture c
JOIN Date_Capture d ON d.id_Date = c.id_Date
JOIN Lieu_Capture l ON l.id_Lieu = c.id_Lieu
GROUP BY mois, ville
ORDER BY nbPokemonCapture;

CREATE MATERIALIZED VIEW JointureCaptureMois (mois, id_Lieu, id_Condition) AS
SELECT mois, id_Lieu, id_Condition
FROM Capture c
JOIN Date_Capture d ON d.id_Date=c.id_Date;

CREATE MATERIALIZED VIEW JoinCapturePokemonCondition (nom, nombre_essai, nombre_baie, duree) AS
SELECT nom, nombre_essais, nombre_baie, duree
FROM Capture c
JOIN Pokemon p ON p.id_Pokemon=c.id_Pokemon
JOIN Condition co ON co.id_Condition=c.id_Condition;

CREATE MATERIALIZED VIEW TransactionEnArgentReel (id, id_paiement, id_dresseur, id_dresseur_dynamique, id_date, id_lieu, id_item, prix_unitaire, quantite, depense_total, devise) AS
SELECT t.id, t.id_paiement, t.id_dresseur, t.id_dresseur_dynamique, t.id_date, t.id_lieu, t.id_item, t.prix_unitaire, t.quantite, t.depense_total, devise
FROM Transaction t
JOIN Paiement p ON p.id_Paiement=t.id_Paiement
WHERE devise != 'pokecoins';

CREATE MATERIALIZED VIEW SumQuantiteVenduByItem (nom, quantiteTotalVendu) AS
SELECT nom, SUM(quantite) AS quantiteTotalVendu
FROM Transaction t
JOIN Item i ON i.id_Item = t.id_Item
GROUP BY nom;

CREATE MATERIALIZED VIEW NbPokemonByDresseur (id_dresseur, nbCapture) AS
SELECT c.id_Dresseur, COUNT(*) AS nbCapture
FROM Capture c
JOIN Dresseur_Capture d ON d.id_Dresseur=c.id_Dresseur
GROUP BY c.id_Dresseur;