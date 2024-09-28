\! echo Requête 16 : Le prix le plus bas pour chaque produit
SELECT EP.id_prod, MIN(EP.prix)
FROM EvolPrix EP
GROUP BY EP.id_prod;
