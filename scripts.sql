\copy jvlist from 'CSV/video_games.csv' WITH (FORMAT CSV, HEADER);
ALTER TABLE jvlist DROP COLUMN handheld;
ALTER TABLE jvlist DROP COLUMN multiplatform;
ALTER TABLE jvlist DROP COLUMN joueurmax;
ALTER TABLE jvlist DROP COLUMN licence;
ALTER TABLE jvlist DROP COLUMN publisher;
ALTER TABLE jvlist DROP COLUMN sequel;
ALTER TABLE jvlist DROP COLUMN score;
ALTER TABLE jvlist DROP COLUMN ventes;
\copy consoleslist from 'CSV/consoles.csv' WITH (FORMAT CSV, HEADER);
\copy Client from 'CSV/clients.csv' delimiter E'\t' CSV HEADER;
\copy Commande from 'CSV/commandes.csv' WITH (FORMAT CSV, HEADER);

insert into Produit (id_prod, nom_prod, prix) SELECT id_prod, titre, used_price FROM jvlist;
insert into Produit (id_prod, nom_prod, prix) SELECT id_prod, nom_prod, prix FROM consoleslist;

\copy Livre from 'CSV/livre.csv' WITH (FORMAT CSV, HEADER);
\copy Notation from 'CSV/notations.csv' WITH (FORMAT CSV, HEADER);
\copy EnLivraison from 'CSV/enLivraison.csv' WITH (FORMAT CSV, HEADER);
\copy EnPreparation from 'CSV/enPreparation.csv' WITH (FORMAT CSV, HEADER);
\copy EnAttente from 'CSV/enAttente.csv' WITH (FORMAT CSV, HEADER);
\copy Retour from 'CSV/retour.csv' WITH (FORMAT CSV, HEADER);
\copy EvolPrix from 'CSV/evolPrix.csv' WITH (FORMAT CSV, HEADER);
\copy JVachete from 'CSV/JVachete.csv' WITH (FORMAT CSV, HEADER);
\copy ConsoleAchete from 'CSV/consoleAchete.csv' WITH (FORMAT CSV, HEADER);
\copy ProdAchete from 'CSV/prodAchete.csv' WITH (FORMAT CSV, HEADER);
\copy JVdispo from 'CSV/JVdispo.csv' WITH (FORMAT CSV, HEADER);
\copy ConsoleDispo from 'CSV/consoleDispo.csv' WITH (FORMAT CSV, HEADER);
\copy ProdDispo from 'CSV/prodDispo.csv' WITH (FORMAT CSV, HEADER);
