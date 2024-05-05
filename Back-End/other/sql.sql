drop database techmavericks_webcup;
create database techmavericks_webcup;
use techmavericks_webcup;

create table utilisateur(
    id int primary key auto_increment,
    nom varchar(255),
    mdp varchar(255),
    privilege varchar(255)
);

insert into utilisateur(nom,mdp,privilege) values('techmavericks','rollback001','admin');

create table categorie(
    id int primary key auto_increment,
    nom varchar(255) not null unique
);

insert into categorie(nom) values('Vehicule');
insert into categorie(nom) values('Vetement');
insert into categorie(nom) values('Sport');
insert into categorie(nom) values('Technologie');

create table etat_produit(
    id int primary key,
    nom varchar(255) not null
);

insert into etat_produit(id,nom) values(0,'Non validee');
insert into etat_produit(id,nom) values(10,'Validee');
insert into etat_produit(id,nom) values(20,'En vente');
insert into etat_produit(id,nom) values(30,'Indisponible');
insert into etat_produit(id,nom) values(40,'Vendu');

create table condition_produit(
    id int primary key auto_increment,
    nom varchar(255) not null
);

insert into condition_produit(nom) values('Nouveau');
insert into condition_produit(nom) values('Occasion');
insert into condition_produit(nom) values('Rarement utilise');

create table pays(
    id int primary key auto_increment,
    nom varchar(255) not null
);

insert into pays(nom) values('Madagascar');
insert into pays(nom) values('Maurice');
insert into pays(nom) values('Seychelles');
insert into pays(nom) values('La Reunion');

create table ville(
    id int primary key auto_increment,
    nom varchar(255),
    id_pays int,
    foreign key(id_pays) references pays(id) on update cascade on delete cascade
);

insert into ville(nom,id_pays) values('Antananarivo',1);
insert into ville(nom,id_pays) values('Toamasina',1);
insert into ville(nom, id_pays) values ('Port Louis', 2);
insert into ville(nom, id_pays) values ('Beau Bassin-Rose Hill', 2);
insert into ville(nom, id_pays) values ('Saint-Denis', 3);
insert into ville(nom, id_pays) values ('Saint-Paul', 3);
insert into ville(nom, id_pays) values ('Victoria', 4);
insert into ville(nom, id_pays) values ('Anse Boileau', 4);

create table avatar(
    id int primary key auto_increment,
    url text
);

insert into avatar(url) values('https://robohash.org/4a3d58780f220d8b39a97eb1c9e4140a?set=set3&bgset=&size=200x200');
insert into avatar(url) values('https://gravatar.com/avatar/96952aff22a59789bbd940bd4f46a26b?s=200&d=robohash&r=g');
insert into avatar(url) values('https://gravatar.com/avatar/ea83f5388750df3dd53c64c3ed370a26?s=200&d=robohash&r=g');
insert into avatar(url) values('https://gravatar.com/avatar/e9254a2c866bacfd69c84e2c72195f31?s=200&d=robohash&r=g');


CREATE  TABLE utilisateur_front_office ( 
	id                   INT  NOT NULL   AUTO_INCREMENT  PRIMARY KEY,
	email                VARCHAR(255)  NOT NULL     ,
	telephone            VARCHAR(20)  NOT NULL     ,
	avatar               VARCHAR(255)  NOT NULL     ,
	name                 VARCHAR(50)  NOT NULL     ,
	password             VARCHAR(255)  NOT NULL     ,
	profile              INT  NOT NULL DEFAULT (0)    
 );

insert into utilisateur_front_office(email,telephone,avatar,name,password) values('user1@mail.com','0323245665','','user1','user1');


create table produit(
    id int primary key auto_increment,
    titre varchar(255) not null,
    description text not null,
    prix double not null,
    id_etat int,
    id_condition int,
    id_localisation int,
    id_categorie int,
    id_utilisateur int,
    foreign key(id_etat) references etat_produit(id) on update cascade on delete cascade,
    foreign key(id_condition) references condition_produit(id) on update cascade on delete cascade,
    foreign key(id_localisation) references ville(id) on update cascade on delete cascade,
    foreign key(id_categorie) references categorie(id) on update cascade on delete cascade,
    foreign key(id_utilisateur) references utilisateur_front_office(id) on update cascade on delete cascade
);

insert into produit(titre, id_categorie, description, prix, id_condition, id_localisation, id_etat, id_utilisateur) 
values('Samsung Galaxy S20', 1, 'Smartphone haut de gamme avec un ecran AMOLED de 6.2 pouces, un processeur puissant et un systeme de camera triple.', 799.99, 1, 1, 0,1);
insert into produit(titre, id_categorie, description, prix, id_condition, id_localisation, id_etat, id_utilisateur) 
values('Velo de montagne tout suspendu', 2, 'Velo de montagne tout suspendu avec cadre en aluminium, suspension a double pivot et freins a disque hydrauliques.', 1499.99, 1, 1, 10,1);
insert into produit(titre, id_categorie, description, prix, id_condition, id_localisation, id_etat, id_utilisateur) 
values('Chemise en lin pour homme', 3, 'Chemise en lin legere et respirante, parfaite pour les journees chaudes. Disponible en plusieurs couleurs et tailles.', 49.99, 1, 1, 20,1);
insert into produit(titre, id_categorie, description, prix, id_condition, id_localisation, id_etat, id_utilisateur) 
values('Harry Potter et la pierre philosophale', 4, 'Premier livre de la serie Harry Potter ecrit par J.K. Rowling. Un classique de la litterature fantastique pour tous les ages.', 12.99, 2, 1, 30,1);
insert into produit(titre, id_categorie, description, prix, id_condition, id_localisation, id_etat, id_utilisateur) 
values('Refrigerateur à deux portes', 1, 'Refrigerateur spacieux avec congelateur superieur, parfait pour stocker les aliments frais et surgeles.', 799.99, 2, 1, 40,1);
insert into produit(titre, id_categorie, description, prix, id_condition, id_localisation, id_etat, id_utilisateur) 
values('Nikon D850 Appareil photo reflex numerique', 2, 'Appareil photo reflex numerique professionnel avec un capteur haute resolution de 45.7 MP et un systeme AF ultra-precis.', 2499.99, 3, 1, 10,1);

create table photo_produit(
    id int primary key auto_increment,
    id_produit int,
    url text not null,
    foreign key(id_produit) references produit(id) on update cascade on delete cascade
);

insert into photo_produit(id_produit,url) values(1,'');
insert into photo_produit(id_produit,url) values(2,'');
insert into photo_produit(id_produit,url) values(3,'');
insert into photo_produit(id_produit,url) values(4,'');
insert into photo_produit(id_produit,url) values(5,'');
insert into photo_produit(id_produit,url) values(6,'');


update categorie set created_at='2024-05-04 10:49:46', updated_at='2024-05-04 10:49:46';
update etat_produit set created_at='2024-05-04 10:49:46', updated_at='2024-05-04 10:49:46';
update condition_produit set created_at='2024-05-04 10:49:46', updated_at='2024-05-04 10:49:46';
update photo_produit set created_at='2024-05-04 10:49:46', updated_at='2024-05-04 10:49:46';
update pays set created_at='2024-05-04 10:49:46', updated_at='2024-05-04 10:49:46';
update ville set created_at='2024-05-04 10:49:46', updated_at='2024-05-04 10:49:46';

drop view v_produit_lib_complet;
create or replace view v_produit_lib_complet as 
select
p.id,p.titre,p.description,p.prix,p.id_etat,p.id_categorie,p.id_utilisateur,p.id_localisation as id_ville,p.id_condition,
c.nom as categorie,
u.name as utilisateur,
cp.nom as condition_,
ep.nom as etat,
v.nom as ville,
pa.id as id_pays,
pa.nom as pays
from 
produit p 
join 
categorie c on c.id=p.id_categorie
join
utilisateur_front_office u on u.id=p.id_utilisateur
join 
condition_produit cp on cp.id=p.id_condition
join
etat_produit ep on ep.id=p.id_etat
join
ville v on v.id=p.id_localisation
join pays pa on pa.id=v.id_pays
;

drop view v_ville_lib_complet;
create or replace view v_ville_lib_complet as
select
v.id,v.nom,v.id_pays,p.nom as pays
from
ville v
join pays p on p.id=v.id_pays
;


-- 
create table type_transaction(
    id int primary key,
    nom varchar(255)
);

insert into type_transaction(id,nom) values(0,'vente');
insert into type_transaction(id,nom) values(1,'achat');

create table etat_transaction(
    id int primary key,
    nom varchar(255)
);

create table transaction(
    id int primary key auto_increment,
    id_utilisateur int,
    id_type int,
    id_produit int,
    prix double,
    id_utilisateur_tiers int,
    id_etat int,
    foreign key(id_type) references type_transaction(id),
    foreign key(id_utilisateur) references utilisateur_front_office(id),
    foreign key(id_produit) references produit(id),
    foreign key(id_utilisateur_tiers) references utilisateur_front_office(id),
    foreign key(id_etat) references etat_transaction(id)
);


create table equivalence_devise(
    id int primary key auto_increment,
    nom varchar(255) not null,
    valeur double not null
);

create table mode_paiement(
    id int primary key auto_increment,
    nom varchar(255)
);


create table transaction_jeton(
    id int primary key auto_increment,
    id_utilisateur int,
    valeur double,
    foreign key(id_utilisateur) references utilisateur_front_office(id)
);

create table tokens(
    id int primary key auto_increment,
    id_user int not null,
    token varchar(255) not null,
    foreign key(id_user) references utilisateur_front_office(id)
);


insert into mode_paiement(nom) values('Mobile Money');
insert into mode_paiement(nom) values('Paypal');


insert into equivalence_devise(nom,valeur) values('Ariary',100);
insert into equivalence_devise(nom,valeur) values('Euro',0.002);

