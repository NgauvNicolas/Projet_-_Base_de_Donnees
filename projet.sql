drop table if exists Client cascade;
drop table if exists Commande cascade;
drop table if exists Produit cascade;
drop table if exists ProdAchete cascade;
drop table if exists JVachete cascade;
drop table if exists ConsoleAchete cascade;
drop table if exists ProdDispo cascade;
drop table if exists JVdispo cascade;
drop table if exists ConsoleDispo cascade;
drop table if exists Notation cascade;
drop table if exists EvolPrix cascade;
drop table if exists Livre cascade;
drop table if exists EnLivraison cascade;
drop table if exists EnPreparation cascade;
drop table if exists EnAttente cascade;
drop table if exists Retour cascade;
drop table if exists jvlist cascade;
drop table if exists consoleslist cascade;




create table Client(
mail varchar(80) primary key,
nom varchar(40),
prenom varchar(40),
adresse varchar(64) NOT NULL,
telephone varchar(14),
anniversaire date,
date_inscrit date,
pays varchar(40)
);
create table Commande(
id_cmd int primary key,
date_cmd date,
adresse varchar(64) NOT NULL,
mail varchar(64),
foreign key(mail) references Client(mail)
);
create table Produit(
id_prod int primary key,
nom_prod varchar(70),
prix decimal NOT NULL,
CHECK (prix > 0)
);
create table ProdAchete(
id_prod int primary key,
nom_prod varchar(70),
prix decimal NOT NULL,
qteVendu int,
CHECK (qteVendu >= 0)
);
create table JVachete(
id_prod int primary key,
nom_prod varchar(70),
prix decimal NOT NULL,
qteVendu int,
genre varchar(50),
multijoueur boolean,
plateforme varchar(20),
CHECK (qteVendu >= 0)
);
create table ConsoleAchete(
id_prod int primary key,
nom_prod varchar(40),
prix decimal NOT NULL,
qteVendu int,
portabilite varchar(20),
constructeur varchar(20),
CHECK (qteVendu >= 0)
);
create table ProdDispo(
id_prod int primary key,
nom_prod varchar(70),
prix decimal NOT NULL,
qteDispo int,
CHECK (qteDispo >= 0)
);
create table JVdispo(
id_prod int primary key,
nom_prod varchar(70),
prix decimal NOT NULL,
qteDispo int,
genre varchar(50),
multijoueur boolean,
plateforme varchar(20),
CHECK (qteDispo >= 0)
);
create table ConsoleDispo(
id_prod int primary key,
nom_prod varchar(40),
prix decimal NOT NULL,
qteDispo int,
portabilite varchar(20),
constructeur varchar(20),
CHECK (qteDispo >= 0)
);
create table Notation(
mail varchar(64),
id_prod int,
id_cmd int,
note int,
avis varchar (300),
primary key(mail, id_prod, id_cmd),
foreign key(mail) references Client(mail),
foreign key(id_prod) references Produit(id_prod),
foreign key(id_cmd) references Commande(id_cmd),
CHECK (note >= 0),
CHECK (note <= 10)
);
create table EvolPrix(
id_prod int,
date_prix date,
prix decimal NOT NULL,
primary key(id_prod, date_prix),
foreign key(id_prod) references Produit(id_prod)
);
create table Livre(
id_cmd int,
id_prod int,
primary key(id_cmd, id_prod),
date_exp date NOT NULL,
date_livraison date NOT NULL,
nb_exemplaire int NOT NULL,
refus boolean,
foreign key(id_prod) references Produit(id_prod),
foreign key(id_cmd) references Commande(id_cmd)
);
create table EnLivraison(
id_cmd int,
id_prod int,
primary key(id_cmd, id_prod),
date_exp date NOT NULL,
date_livraison_estimee date,
nb_exemplaire int NOT NULL,
foreign key(id_prod) references Produit(id_prod),
foreign key(id_cmd) references Commande(id_cmd)
);
create table EnPreparation(
id_cmd int,
id_prod int,
primary key(id_cmd, id_prod),
annul_cmd_prod varchar(50),
nb_exemplaire int NOT NULL,
foreign key(id_prod) references Produit(id_prod),
foreign key(id_cmd) references Commande(id_cmd)
);
create table EnAttente(
id_cmd int,
id_prod int,
primary key(id_cmd, id_prod),
annul_cmd_prod varchar(50),
date_restock_estimee date,
nb_exemplaire int NOT NULL,
foreign key(id_prod) references Produit(id_prod),
foreign key(id_cmd) references Commande(id_cmd)
);
create table Retour(
id_cmd int,
id_prod int,
primary key(id_cmd, id_prod),
cause varchar(50) NOT NULL,
date_demande date,
retour_effectif boolean,
nb_exemplaire int NOT NULL,
foreign key(id_prod) references Produit(id_prod),
foreign key(id_cmd) references Commande(id_cmd)
);

create temporary table jvlist(
titre varchar(70),
handheld boolean,
joueurmax int,
multiplatform boolean,
online boolean,
genre varchar(70),
licence boolean,
publisher varchar(50),
sequel boolean,
score int,
ventes decimal,
used_price decimal,
console varchar(30),
id_prod int
);

create temporary table consoleslist(
id_prod int,
nom_prod varchar(40),
prix decimal NOT NULL,
qteDispo int,
qteVendu int,
portabilite varchar(20),
constructeur varchar(20)
);



