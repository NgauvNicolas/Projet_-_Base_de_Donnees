\! echo Requête 6.2 : Le client ayant achete le plus de jeux
SELECT Commande.mail, count(distinct Livre.id_prod)
FROM Commande JOIN Livre ON (Commande.id_cmd=Livre.id_cmd)
GROUP BY Commande.mail
HAVING count(distinct Livre.id_prod) >= ALL (SELECT (Commande.mail, count(distinct Livre.id_prod) FROM (Commande JOIN Livre ON (Commande.id_cmd=Livre.id_cmd)) GROUP BY Commande.mail));
