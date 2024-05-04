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
    nom varchar(255)

);

insert into categorie(nom) values('C1');
insert into categorie(nom) values('C2');
