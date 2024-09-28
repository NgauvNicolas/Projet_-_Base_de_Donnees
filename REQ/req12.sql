\! echo Requête 12 : Le nombre total de retour de produit en un exemplaire acceptes
SELECT count(Retour.retour_effectif)
FROM Retour
WHERE Retour.nb_exemplaire=1;
