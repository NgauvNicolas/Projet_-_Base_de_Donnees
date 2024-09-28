\! echo Requête 5 : Les clients qui ont déjà acheté au moins une console et un jeu dans une seule commande 
SELECT DISTINCT Client.mail, nom, prenom, Commande.id_cmd, date_cmd
FROM Client, Commande, Livre L1, Livre L2
WHERE (Client.mail=Commande.mail 
	and (
		(Commande.id_cmd=L1.id_cmd and ((L1.id_prod IN (SELECT ConsoleAchete.id_prod FROM ConsoleAchete)) and (L2.id_prod IN (SELECT JVachete.id_prod FROM JVachete)))) 
		or 
		(Commande.id_cmd=L2.id_cmd and ((L2.id_prod IN (SELECT ConsoleAchete.id_prod FROM ConsoleAchete)) and (L1.id_prod IN (SELECT JVachete.id_prod FROM JVachete))))) 
	and L1.id_prod <> L2.id_prod);
