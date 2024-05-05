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
insert into ville(nom, id_pays) values ('Beau Bassin-Rose Hill' , 2);
insert into ville(nom, id_pays) values ('Saint-Denis', 3);
insert into ville(nom, id_pays) values ('Saint-Paul' , 3);
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
values('Refrigerateur a deux portes', 1, 'Refrigerateur spacieux avec congelateur superieur, parfait pour stocker les aliments frais et surgeles.', 799.99, 2, 1, 40,1);
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
insert into mode_paiement(nom) values('Paypal ');


insert into equivalence_devise(nom,valeur) values('Ariary',100);
insert into equivalence_devise(nom,valeur) values('Euro',0.002);


alter table categorie add url varchar(255) not null;


INSERT INTO produit(titre, id_categorie, description, prix, id_condition, id_localisation, id_etat, id_utilisateur) 
VALUES('Chapeau Western',
2,
'Le chapeau western de Ken dans le film Barbie est un chapeau de cowboy blanc classique. Le chapeau presente un large bord et une bande noire autour de la couronne, lui conferant un style cowboy traditionnel. Ce chapeau fait partie de la tenue Western Fun de Ken, qui comprend egalement une chemise a franges, un jean et une grande boucle de ceinture. Le chapeau de cowboy blanc, ainsi que le reste de l ensemble d inspiration western de Ken, represente sa tentative d etablir sa propre identite distincte de Barbie et d explorer son style personnel. Ce choix de tenue reflete le moment Kenaissance de Ken dans le film, où il tente de se liberer du fait d être considere uniquement comme l accessoire de Barbie.',
100,
1,
1,
20,
1);

INSERT INTO produit(titre, id_categorie, description, prix, id_condition, id_localisation, id_etat, id_utilisateur) 
VALUES('Gant de box',
3,
'Les gants de boxe sont un element cle du nouveau look de Ken, inspire de l esthetique hypermasculine de la star du film d action Sylvester Stallone. En enfilant les gants de boxe, Ken imite le personnage dur, muscle et agressif incarne par les personnages emblematiques de Stallone comme Rocky Balboa. La couleur rouge des gants souligne encore le style audacieux et machiste que Ken essaie de projeter, contrairement a ses precedentes tenues de plage aux couleurs pastel dans Barbieland. Les gants de boxe symbolisent le desir de Ken d affirmer sa domination et son autorite, alors qu il cherche a etablir un Kendom patriarcal au sein du monde autrefois centre sur les femmes de Barbieland.',
200,
1,
1,
20,
1);

INSERT INTO produit(titre, id_categorie, description, prix, id_condition, id_localisation, id_etat, id_utilisateur) 
VALUES('Sac de box',
3,
'Le role de Ken en tant que punching-ball dans Barbie est decrit comme le resultat de la decision strategique de Mattel de le positionner davantage comme une cible de critiques plutot que comme un compagnon apprecie.',
400,
1,1,
20,
1);

INSERT INTO produit(titre, id_categorie, description, prix, id_condition, id_localisation, id_etat, id_utilisateur) 
VALUES('Veste blanche en laine',
2,
'La veste en laine blanche de Ken dans Barbie est une piece remarquable qui ajoute une touche d elegance et de style au personnage. Cette veste, inspiree de Ken dans le film Barbie, est fabriquee en fausse fourrure de haute qualite, garantissant durabilite et confort pour le porteur. Il presente une belle couleur blanche qui permet a celui qui le porte de se demarquer et d être magnifique. La veste a un devant ouvert pour un port facile, un col a revers pour une touche moderne et des manches amples qui se terminent par des poignets ouverts. De plus, il comprend deux poches exterieures et deux poches interieures pour plus de praticite. La doublure interieure de la veste est en fausse fourrure douce, ameliorant sa chaleur et son confort. Cette piece emblematique capture l essence du personnage de Ken dans le film, incarnant un melange de mode et de sophistication qui complete l esthetique globale du monde Barbie.',
200,
1,
1,
20,
1);

INSERT INTO produit(titre, id_categorie, description, prix, id_condition, id_localisation, id_etat, id_utilisateur) 
VALUES('Bandeau',
1,
'Le bandeau de Ken dans Barbie est decrit comme un bandeau en bandana noir. Il fait partie de sa tenue dans le film, assorti d un manteau de fourrure par-dessus un gilet a franges en cuir et d un collier de cheval.',
400,
1,
1,
20,
1);


INSERT INTO produit(titre, id_categorie, description, prix, id_condition, id_localisation, id_etat, id_utilisateur) 
VALUES('PXG 0811X Gen4 Golf',
3,
'Dans le film Barbie, Ken surprend les amateurs de golf en revelant ses talents de golfeur. Identifie sur Reddit, Ken utilise un pilote PXG, en particulier le pilote PXG 0811X Gen4 avec un arbre ProjectX Riptide CB. Cette tournure inattendue du film presente Ken comme un golfeur, ajoutant une dimension unique a son personnage au-dela du fait d être le petit ami de Barbie. L utilisation d un club de golf haut de gamme comme le PXG met en evidence l interêt et la maîtrise de Ken pour le golf, faisant de lui plus qu un simple personnage secondaire dans le monde de Barbie.',
200,
1,
1,
20,
1);

INSERT INTO produit(titre, id_categorie, description, prix, id_condition, id_localisation, id_etat, id_utilisateur) 
VALUES('Montre Heuer Carrera',
1,
'Dans le film Barbie, Ken, joue par Ryan Gosling, est represente comme portant trois montres chronographes Heuer Carrera vintage en même temps. Le choix de faire porter a Ken trois montres simultanement est un gag comique qui met en evidence sa comprehension superficielle de la masculinite et du statut. Les multiples montres sont censees transmettre la conviction de Ken que porter plus de montres le fera paraître plus respecte et plus puissant, même s il s agit d une notion enfantine et absurde.',
1000,
1,
1,
20,
1);
insert into photo_produit(id_produit, url) values(1,'https://firebasestorage.googleapis.com/v0/b/web-cup-image.appspot.com/o/images%2Fwestern_hat1.jpeg?alt=media&token=4bb537d1-0630-4a2e-b134-3ac885a22a33');
insert into photo_produit(id_produit, url) values(1,'https://firebasestorage.googleapis.com/v0/b/web-cup-image.appspot.com/o/images%2Fwestern_hat2.jpg?alt=media&token=42dc27f7-4e8a-4c81-b049-28f77e2b6ffe');
insert into photo_produit(id_produit, url) values(2,'https://firebasestorage.googleapis.com/v0/b/web-cup-image.appspot.com/o/images%2Fgant1.jpeg?alt=media&token=f9ea13ed-7266-4b3a-87ad-b2e0ae7b90da');
insert into photo_produit(id_produit, url) values(3,'https://firebasestorage.googleapis.com/v0/b/web-cup-image.appspot.com/o/images%2Fsacbox1.jpg?alt=media&token=8f28e746-1214-4165-94ff-a18c524f5eb2');
insert into photo_produit(id_produit, url) values(3,'https://firebasestorage.googleapis.com/v0/b/web-cup-image.appspot.com/o/images%2Fsacbox2.jpeg?alt=media&token=fc1b3be3-fe30-43c1-86b5-1e402db776e1');
insert into photo_produit(id_produit, url) values(4,'https://firebasestorage.googleapis.com/v0/b/web-cup-image.appspot.com/o/images%2Fveste1.jpeg?alt=media&token=1e490663-90bb-4d5d-8673-4e4a80e15a13');
insert into photo_produit(id_produit, url) values(4,'https://firebasestorage.googleapis.com/v0/b/web-cup-image.appspot.com/o/images%2Fvest2.jpg?alt=media&token=009688ea-114d-4fc0-a097-76b8d1aed680');
insert into photo_produit(id_produit, url) values(5,'https://firebasestorage.googleapis.com/v0/b/web-cup-image.appspot.com/o/images%2Fbandeau1.jpeg?alt=media&token=02e1d803-e10b-4e9b-9b54-816f0b03636c');
insert into photo_produit(id_produit, url) values(5,'https://firebasestorage.googleapis.com/v0/b/web-cup-image.appspot.com/o/images%2Fbandeau2.jpeg?alt=media&token=2fd67c06-b174-4934-be1f-4beb8879fcb8');
insert into photo_produit(id_produit, url) values(6,'https://firebasestorage.googleapis.com/v0/b/web-cup-image.appspot.com/o/images%2Fgolf1.jpeg?alt=media&token=df4c4b23-2dbe-4d08-8ce1-3ad83c8f3472');
insert into photo_produit(id_produit, url) values(7,'https://firebasestorage.googleapis.com/v0/b/web-cup-image.appspot.com/o/images%2Fmontre1.jpg?alt=media&token=e2d37f25-b94e-4a2a-8f83-45bb3e67715c');
insert into photo_produit(id_produit, url) values(7,'https://firebasestorage.googleapis.com/v0/b/web-cup-image.appspot.com/o/images%2Fmontre2.jpeg?alt=media&token=f25da5aa-d437-4806-b786-15365433a129');




update categorie set url='https://firebasestorage.googleapis.com/v0/b/web-cup-image.appspot.com/o/categorie_images%2Fc_vehicle.jpeg?alt=media&token=0075eee9-fa1a-49b4-8fb0-fd4e0a7ad741' where id=1;
update categorie set url='https://firebasestorage.googleapis.com/v0/b/web-cup-image.appspot.com/o/categorie_images%2Fc_vetement.jpeg?alt=media&token=9e8f5e8e-c3bb-40df-b7e0-a1c33cb72e81' where id=2;
update categorie set url='https://firebasestorage.googleapis.com/v0/b/web-cup-image.appspot.com/o/categorie_images%2Fc_sport.png?alt=media&token=6d36f463-2f54-4bd7-a1bb-53ccdef832af' where id=3;
update categorie set url='https://firebasestorage.googleapis.com/v0/b/web-cup-image.appspot.com/o/categorie_images%2Fc_autre.jpeg?alt=media&token=4c9c1f14-2058-4630-be8e-a617657e2bf6',nom='Autres' where id=4;

