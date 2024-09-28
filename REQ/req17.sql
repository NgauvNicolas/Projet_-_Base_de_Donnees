\! echo Requête 17 : Le nombre maximum de commandes passees par client
SELECT CMD.mail, count(CMD.id_cmd)
FROM Commande CMD
GROUP BY CMD.mail;
