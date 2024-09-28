\! echo Requête 6.1 : Pour chaque client, retourner le nombre de commande qu il a passé, à condition qu il en ait passé au moins 2
SELECT Commande.mail, count(id_cmd)
FROM Commande
GROUP BY Commande.mail
HAVING count(id_cmd) > 1;
