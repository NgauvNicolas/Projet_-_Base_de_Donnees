\! echo Requête 13 : Le nombre de note attribuee aux produits achetes par client
SELECT N.mail, count(N.note)
FROM Notation N
GROUP BY N.mail;
