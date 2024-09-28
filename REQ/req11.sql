\! echo Requête 11 : Les clients n ayant achete et reçu que des jeux et aucune console 
SELECT Client.mail
FROM Client, Commande, Livre
WHERE Client.mail=Commande.mail and Commande.id_cmd=Livre.id_cmd
EXCEPT
(SELECT C.mail
FROM Client C, Commande CMD, Livre
WHERE C.mail=CMD.mail and CMD.id_cmd=Livre.id_cmd and (Livre.id_prod IN (SELECT ConsoleAchete.id_prod FROM ConsoleAchete)));
