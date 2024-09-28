\! echo Requête 1 : Les clients ayant déjà achetés et reçu au moins une console de jeu
SELECT DISTINCT Client.mail, Client.nom, Client.prenom, Livre.id_cmd, date_cmd
FROM Client, Commande, Livre
WHERE (Client.mail=Commande.mail and Commande.id_cmd=Livre.id_cmd and (Livre.id_prod IN (SELECT ConsoleAchete.id_prod FROM ConsoleAchete)));
