\! echo Requête 7 : La moyenne des prix de tous les produits, a condition que le prix minimum des produits soit supérieur a 10 euros
SELECT CONCAT (EvolPrix.id_prod, date_prix), AVG(EvolPrix.prix+0.0)
FROM EvolPrix
GROUP BY (CONCAT (EvolPrix.id_prod, date_prix))
HAVING MIN(EvolPrix.prix) > 10+0.0;
