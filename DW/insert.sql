DELETE FROM Pokemon;
DELETE FROM Condition;
DELETE FROM Transaction_type;
DELETE FROM Date_entrepot;
DELETE FROM Lieu ;
DELETE FROM Dresseur ;
DELETE FROM Dresseur_dynamique ;
DELETE FROM bridge_dresseur ;
DELETE FROM Paiement  ;
DELETE FROM Item  ;
DELETE FROM Transaction ;
DELETE FROM Capture ;

INSERT INTO Item VALUES (568 , 'pokéball' , 'sert à capturer des pokemons' , 'simple' , 50 , 40 , 0 , 'pokemon' , 50 );
INSERT INTO Item VALUES (302 , 'pokécoin ',' sert de monnaie dans le jeu ', null , 10 , 15 , null , null , null );
INSERT INTO Item VALUES (259 , 'baies , sert à ',  null , 20 , 15 , 1 , null , null);

INSERT INTO Paiement VALUES(12569 , 'VISA' , 'dollar' , 'american express' ,' Aexpress@mail.com' , 'www.amexp.com');
INSERT INTO Paiement VALUES(12570 , 'PAYPAL' ,' euros' , 'Paypal' , 'paypal_fr@hmail.fr' , 'www.paypal.fr');
INSERT INTO Paiement VALUES(12571 , 'Pokébank' , 'pokécoins' ,  'niantic' , 'niantic@nmail.com' , 'www.niantic.com');	

INSERT INTO Date_entrepot VALUES(18062016 , 18 06 2016 , 18 , 'samedi ', 22 , 06, 2016 , 0 ,0);
INSERT INTO Date_entrepot VALUES(19032016 , 19 03 2016 , 19 , 'mardi' , 11 , 03 , 2016 , 0 , 0 );
INSERT INTO Date_entrepot VALUES(21112016 , 21 10 2016 , 21 , 'vendredi ',  43 , 10 , 2016 , 1 , 1);

INSERT INTO Lieu VALUES(360001 , 43.6403 , 3.855126 , 57.2 , 'France ', 'Montpellier');
INSERT INTO Lieu VALUES(360051 , 58.6993 , 6.72051 , 48 , 'France' , 'Lille' );
INSERT INTO Lieu VALUES(35807 , 48.2560 ,  2.65487 , 61 ,  'Paris' ,' France' );

INSERT INTO Dresseur VALUES(00001 , 'max ' , 'française' , 'max22@gmail.com'  , 15052016 , 'rouge' ,'H'  );
INSERT INTO Dresseur VALUES(32500 , 'sacha'  , 'americaine' , 'sacha18@hotmail.com'  , 20042016 , 'bleu' ,' H ');
INSERT INTO Dresseur VALUES(5982 , 'dora'  ,  'anglaise' , 'dora12@free.fr' , 25052016 , 'jaune' , 'F' );


INSERT INTO Dresseur_dynamique VALUES(1822, 22, 100, , 'noir' , 'noir' , 'blanche' , 'bleu' , 'bonnet' );
INSERT INTO Dresseur_dynamique VALUES(3518, 18, 85, , 'blond' , 'bleu' , 'noir ', 'jaune'  , 'casquette');
INSERT INTO Dresseur_dynamique VALUES(1256, 12, 28, 'noir' ,' marron' , 'marron', 'rouge'  ,  null );

INSERT INTO bridge_dresseur VALUES(00001,1822,15052016,15052017,0,2);
INSERT INTO bridge_dresseur VALUES(32500,3518,20042016,20042017,1,1);
INSERT INTO bridge_dresseur VALUES(5982,1256,25052016,25052017,0,2);

INSERT INTO Transaction VALUES (12569 & 00001 & 18062016 & 360001 & 568 & 1.0 & 10 & 10.0 );
INSERT INTO Transaction VALUES (12570 & 32500 & 19032016 & 360051 & 302 & 0.5 & 5 & 2.5 );
INSERT INTO Transaction VALUES (12571 & 5982 & 21112016 &  35807 & 259 & 0.2 & 20 & 4.0 );


INSERT INTO Pokemon VALUES (025, 'Carabaffe', 'eau', NULL, 100, 320, 'charge', 'pistolet', 10, 5);
INSERT INTO Pokemon VALUES (308, 'Salamèche', 'feu', NULL, 100, 90, 'fouet', 'gaz toxique', 15, 20);
INSERT INTO Pokemon VALUES (114, 'Roucoups', 'vol', NULL, 65, 82, 'coup de griffes', 'morsure', 10, 10);
 
INSERT INTO Transaction_type VALUES (56800, 'pending');
INSERT INTO Transaction_type VALUES (56800, 'completed');
INSERT INTO Transaction_type VALUES (32100, 'pending');
INSERT INTO Transaction_type VALUES (32100, 'rejected');
INSERT INTO Transaction_type VALUES (25901, 'pending');
INSERT INTO Transaction_type VALUES (25901, 'completed');
 
INSERT INTO Condition VALUES (601, 10, 15,14,2,10,'simple',2);
INSERT INTO Condition VALUES (25,15,01,54,5,20,'superball',1);
INSERT INTO Condition VALUES (201,20,22,34,7,9,'simple',4);
 
INSERT INTO Capture VALUES (00001,18062016,360001, 025,56800,601);
INSERT INTO Capture VALUES (32500,19032016,360051, 038, 32100, 25);
INSERT INTO Capture VALUES (5982,21112016,35807,114, 25901, 201);
