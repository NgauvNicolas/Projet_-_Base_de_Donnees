\! echo Requête 1 : Les clients ayant déjà achetés et reçu au moins une console de jeu
SELECT DISTINCT Client.mail, Client.nom, Client.prenom, Livre.id_cmd, date_cmd
FROM Client, Commande, Livre
WHERE (Client.mail=Commande.mail and Commande.id_cmd=Livre.id_cmd and (Livre.id_prod IN (SELECT ConsoleAchete.id_prod FROM ConsoleAchete)));

\! echo Requête 2 : Les clients nés le même jour qu au moins un autre client
SELECT C1.mail, C1.nom, C1.prenom, C1.anniversaire
FROM Client C1 JOIN Client C2 ON (C1.mail <> C2.mail and C1.anniversaire=C2.anniversaire);

\! echo Requête 3 : (cf. cours 2 page 155 entre autre) Les clients qui n ont acheté qu une seule fois depuis leur inscription sur le site
SELECT Client.mail
FROM Client JOIN Commande ON (Client.mail=Commande.mail)
EXCEPT 
(SELECT C1.mail FROM Commande C1, Commande C2 WHERE C1.mail=C2.mail and C1.id_cmd <> C2.id_cmd);

\! echo Requête 4 :  Les commandes des clients qui résident en France
SELECT t1.mail, nom, prenom, pays, id_cmd, date_cmd
FROM (SELECT * FROM Client WHERE Client.pays='France') AS t1 JOIN Commande t2 ON t1.mail=t2.mail;

\! echo Requête 5 : Les clients qui ont déjà acheté au moins une console et un jeu dans une seule commande 
SELECT DISTINCT Client.mail, nom, prenom, Commande.id_cmd, date_cmd
FROM Client, Commande, Livre L1, Livre L2
WHERE (Client.mail=Commande.mail 
	and (
		(Commande.id_cmd=L1.id_cmd and ((L1.id_prod IN (SELECT ConsoleAchete.id_prod FROM ConsoleAchete)) and (L2.id_prod IN (SELECT JVachete.id_prod FROM JVachete)))) 
		or 
		(Commande.id_cmd=L2.id_cmd and ((L2.id_prod IN (SELECT ConsoleAchete.id_prod FROM ConsoleAchete)) and (L1.id_prod IN (SELECT JVachete.id_prod FROM JVachete))))) 
	and L1.id_prod <> L2.id_prod);

\! echo Requête 6.1 : Pour chaque client, retourner le nombre de commande qu il a passé, à condition qu il en ait passé au moins 2
SELECT Client.mail, nom, prenom, count(id_cmd)
FROM Client JOIN Commande ON (Client.mail=Commande.mail)
GROUP BY Client.mail
HAVING count(id_cmd) > 1;

\! echo Requête 6.2 : Le client ayant achete le plus de jeux
SELECT Commande.mail, count(distinct Livre.id_prod)
FROM Commande JOIN Livre ON (Commande.id_cmd=Livre.id_cmd)
GROUP BY Commande.mail
HAVING count(distinct Livre.id_prod) >= ALL SELECT (count(distinct Livre.id_prod) FROM Commande JOIN Livre ON (Commande.id_cmd=Livre.id_cmd) GROUP BY Commande.mail);

\! echo Requête 7 : La moyenne des prix de tous les produits, a condition que le prix minimum des produits soit supérieur a 10 euros
SELECT EvolPrix.id_produit, AVG(EvolPrix.prix+0.0)
FROM EvolPrix
GROUP BY EvolPrix.id_prod
HAVING MIN(EvolPrix.id_prod) > 10+0.0;

\! echo Requête 8.1 : Les clients ayant note toutes les consoles (avec sous-requête corrélée)
SELECT C.mail
FROM Client C
WHERE NOT EXISTS 
	(SELECT DISTINCT N1.id_prod FROM Notation N1, ConsoleAchete CA WHERE N1.id_prod=CA.id_prod and N1.id_prod NOT IN
		(SELECT N2.id_prod FROM Notation N2, ConsoleAchete CA2 WHERE N2.id_prod=CA2.id_prod and N2.mail=C.mail));

\! echo Requête 8.2 : Les clients ayant note toutes les consoles (avec agrégation)
SELECT C.mail
FROM Client C JOIN Notation N ON (C.mail=Notation.mail)
GROUP BY C.mail
HAVING count(DISTINCT(CONCAT(N.mail, N.id_prod, N.id_cmd))) = (SELECT count(DISTINCT(CONCAT(N.mail, N.id_prod, N.id_cmd))) FROM Notation);

\! echo Requête 9 : (Jointure externe) Pour chaque client, afficher leurs notations (en affichant tous les clients, même ceux n ayant fournit aucune notation)
SELECT C.mail, N.note, N.avis
FROM Client C NATURAL LEFT OUTER JOIN Notation N
GROUP BY C.mail;

\! echo Requête 10.1 :

\! echo Requête 10.2 :

\! echo Requête 10.3 : Requete 10.1 modifie

\! echo Requête 10.4 : Requete 10.2 modifie

\! echo Requête 11 : Les clients n ayant achete et reçu que des jeux et aucune console 
SELECT Client.mail
FROM Client
EXCEPT
(SELECT C.mail
FROM Client C, Commande CMD, Livre
WHERE C.mail=CMD.mail and CMD.id_cmd=Livre.id_cmd and (Livre.id_prod IN (SELECT ConsoleAchete.id_prod FROM ConsoleAchete)));

\! echo Requête 12 : Le nombre total de retour de produit en un exemplaire acceptes
SELECT count(Retour.retour_effectif)
FROM Retour
WHERE Retour.nb_exemplaire=1;

\! echo Requête 13 : Le nombre de note attribuee aux produits achetes par client
SELECT N.mail, count(N.note)
FROM Notation N
GROUP BY N.mail;

\! echo Requête 14 : Les clients n ayant jamais retourne de produit
SELECT C1.mail, C1.nom, C1.prenom
FROM Client C1
EXCEPT
(SELECT C.mail, C.nom, C.prenom
FROM Client C, Retour R, Commande CMD
WHERE C.mail=CMD.mail and CMD.id_prod=Retour.id_prod);

\! echo Requête 15 : Les clients ayant achete un produit deja achete auparavant (donc dans une commande anterieure)
SELECT C1.mail, C1.nom, C1.prenom
FROM Client C1, Commande CMD1, Commande CMD2, Livre L1, Livre L2
WHERE CMD1.mail=CMD2.mail and CMD1.id_cmd <> CMD2.id_cmd and L1.id_cmd=CMD1.id_cmd and L2.id_cmd=CMD2.id_cmd and L1.id_prod=L2.id_prod;

\! echo Requête 16 : Le prix le plus bas pour chaque produit
SELECT EP.id_prod, MIN(EP.prix)
FROM EvolPrix EP
GROUP BY EP.id_prod;

\! echo Requête 17 : Le nombre maximum de commandes passees par client
SELECT CMD.mail, count(CMD.id_cmd)
FROM Commande CMD
GROUP BY CMD.mail
