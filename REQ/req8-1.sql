\! echo Requête 8.1 : Les clients ayant note toutes les consoles (avec sous-requête corrélée)
SELECT C.mail
FROM Client C
WHERE NOT EXISTS 
	(SELECT DISTINCT N1.id_prod FROM Notation N1, ConsoleAchete CA WHERE N1.id_prod=CA.id_prod and N1.id_prod NOT IN
		(SELECT N2.id_prod FROM Notation N2, ConsoleAchete CA2 WHERE N2.id_prod=CA2.id_prod and N2.mail=C.mail));
