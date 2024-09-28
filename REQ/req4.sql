\! echo Requête 4 :  Les commandes des clients qui résident en France
SELECT t1.mail, nom, prenom, pays, id_cmd, date_cmd
FROM (SELECT * FROM Client WHERE Client.pays='France') AS t1 JOIN Commande t2 ON t1.mail=t2.mail;
