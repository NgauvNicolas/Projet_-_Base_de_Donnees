\! echo Requête 8.2 : Les clients ayant note toutes les consoles (avec agrégation)
SELECT C.mail
FROM Client C JOIN Notation N ON (C.mail=N.mail)
GROUP BY C.mail
HAVING count(DISTINCT(CONCAT(N.mail, N.id_prod, N.id_cmd))) = (SELECT count(DISTINCT(CONCAT(N.mail, N.id_prod, N.id_cmd))) FROM Notation);
