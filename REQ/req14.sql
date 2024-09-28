\! echo Requête 14 : Les clients n ayant jamais retourne de produit
SELECT C1.mail, C1.nom, C1.prenom
FROM Client C1
EXCEPT
(SELECT C.mail, C.nom, C.prenom
FROM Client C, Retour R, Commande CMD
WHERE C.mail=CMD.mail and CMD.id_cmd=R.id_cmd);
