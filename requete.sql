--Une requete pour tester le calcul de distance

--Cette requete ne marche pas...
SELECT p.coordonnees.distance(
	SELECT coordonnees 
	FROM pokestop p2 
	where p2.id=2)
FROM pokestop p
where p.id=1;

select p.coordonnees.distance(coordonnees_t(48.865487,2.321141)) 
from pokestop p 
where p.id=1;

set serveroutput on;
declare
	coord Coordonnees_t;
	res float;
begin
	select coordonnees into coord from pokestop p where p.id=2; 
	select p.coordonnees.distance(coord) into res from pokestop p where p.id=1;
	dbms_output.put_line('resultat : ' || res);
end;
/


--les resultats sont exprimés en metre

