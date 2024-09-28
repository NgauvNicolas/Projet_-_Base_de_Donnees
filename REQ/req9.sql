\! echo Requête 9 : (Jointure externe) Pour chaque client, afficher leurs notations (en affichant tous les clients, même ceux n ayant fournit aucune notation)
SELECT C.mail, N.note, N.avis
FROM Client C NATURAL LEFT OUTER JOIN Notation N
GROUP BY C.mail, N.note, N.avis;
