\! echo Requête 2 : Les clients nés le même jour qu au moins un autre client
SELECT C1.mail, C1.nom, C1.prenom, C1.anniversaire
FROM Client C1 JOIN Client C2 ON (C1.mail <> C2.mail and C1.anniversaire=C2.anniversaire);
