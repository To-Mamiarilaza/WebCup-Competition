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
    foreign key(id_pays) references pays(id)
);

insert into ville(nom,id_pays) values('Antananarivo',1);
insert into ville(nom,id_pays) values('Toamasina',1);
insert into ville(nom, id_pays) values ('Port Louis', 2);
insert into ville(nom, id_pays) values ('Beau Bassin-Rose Hill', 2);
insert into ville(nom, id_pays) values ('Saint-Denis', 3);
insert into ville(nom, id_pays) values ('Saint-Paul', 3);
insert into ville(nom, id_pays) values ('Victoria', 4);
insert into ville(nom, id_pays) values ('Anse Boileau', 4);

create table produit(
    id int primary key auto_increment,
    titre varchar(255) not null,
    description text not null,
    prix double not null,
    id_etat int,
    id_condition int,
    id_localisation int,
    id_categorie int,
    foreign key(id_etat) references etat_produit(id),
    foreign key(id_condition) references condition_produit(id),
    foreign key(id_localisation) references ville(id),
    foreign key(id_categorie) references categorie(id)
);

insert into produit(titre, id_categorie, description, prix, id_condition, id_localisation, id_etat) 
values('Samsung Galaxy S20', 1, 'Smartphone haut de gamme avec un ecran AMOLED de 6.2 pouces, un processeur puissant et un systeme de camera triple.', 799.99, 1, 1, 0);
insert into produit(titre, id_categorie, description, prix, id_condition, id_localisation, id_etat) 
values('Velo de montagne tout suspendu', 2, 'Velo de montagne tout suspendu avec cadre en aluminium, suspension a double pivot et freins a disque hydrauliques.', 1499.99, 1, 1, 10);
insert into produit(titre, id_categorie, description, prix, id_condition, id_localisation, id_etat) 
values('Chemise en lin pour homme', 3, 'Chemise en lin legere et respirante, parfaite pour les journees chaudes. Disponible en plusieurs couleurs et tailles.', 49.99, 1, 1, 20);
insert into produit(titre, id_categorie, description, prix, id_condition, id_localisation, id_etat) 
values('Harry Potter et la pierre philosophale', 4, 'Premier livre de la serie Harry Potter ecrit par J.K. Rowling. Un classique de la litterature fantastique pour tous les ages.', 12.99, 2, 1, 30);
insert into produit(titre, id_categorie, description, prix, id_condition, id_localisation, id_etat) 
values('Refrigerateur à deux portes', 1, 'Refrigerateur spacieux avec congelateur superieur, parfait pour stocker les aliments frais et surgeles.', 799.99, 2, 1, 40);
insert into produit(titre, id_categorie, description, prix, id_condition, id_localisation, id_etat) 
values('Nikon D850 Appareil photo reflex numerique', 2, 'Appareil photo reflex numerique professionnel avec un capteur haute resolution de 45.7 MP et un systeme AF ultra-precis.', 2499.99, 3, 1, 10);


create table photo_produit(
    id int primary key auto_increment,
    id_produit int,
    url text not null,
    foreign key(id_produit) references produit(id)
);

insert into photo_produit(id_produit,url) values(1,'');
insert into photo_produit(id_produit,url) values(2,'');
insert into photo_produit(id_produit,url) values(3,'');
insert into photo_produit(id_produit,url) values(4,'');
insert into photo_produit(id_produit,url) values(5,'');
insert into photo_produit(id_produit,url) values(6,'');


