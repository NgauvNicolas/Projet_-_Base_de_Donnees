\! echo Requête 3 : (Les clients qui n ont acheté qu une seule fois depuis leur inscription sur le site
SELECT Client.mail
FROM Client JOIN Commande ON (Client.mail=Commande.mail)
EXCEPT 
(SELECT C1.mail FROM Commande C1, Commande C2 WHERE C1.mail=C2.mail and C1.id_cmd <> C2.id_cmd);
