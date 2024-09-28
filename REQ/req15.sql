\! echo Requête 15 : Les clients ayant achete et reçu un produit deja achete auparavant (donc dans une commande anterieure)
SELECT C1.mail, C1.nom, C1.prenom
FROM Client C1, Commande CMD1, Commande CMD2, Livre L1, Livre L2
WHERE CMD1.mail=CMD2.mail and CMD1.id_cmd <> CMD2.id_cmd and L1.id_cmd=CMD1.id_cmd and L2.id_cmd=CMD2.id_cmd and L1.id_prod=L2.id_prod;
