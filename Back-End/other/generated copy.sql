CREATE  TABLE techmavericks_webcup.avatar ( 
	id                   INT  NOT NULL   AUTO_INCREMENT  PRIMARY KEY,
	url                  TEXT       
 );
CREATE  TABLE techmavericks_webcup.categorie ( 
	id                   INT  NOT NULL   AUTO_INCREMENT  PRIMARY KEY,
	nom                  VARCHAR(255)  NOT NULL     ,
	created_at           TIMESTAMP       ,
	updated_at           TIMESTAMP       ,
	url                  VARCHAR(255)  NOT NULL     ,
	CONSTRAINT nom UNIQUE ( nom ) 
 );
CREATE  TABLE techmavericks_webcup.condition_produit ( 
	id                   INT  NOT NULL   AUTO_INCREMENT  PRIMARY KEY,
	nom                  VARCHAR(255)  NOT NULL     ,
	created_at           TIMESTAMP       ,
	updated_at           TIMESTAMP       
 );
CREATE  TABLE techmavericks_webcup.equivalence_devise ( 
	id                   INT  NOT NULL   AUTO_INCREMENT  PRIMARY KEY,
	nom                  VARCHAR(255)  NOT NULL     ,
	valeur               DOUBLE  NOT NULL     ,
	created_at           TIMESTAMP       ,
	updated_at           TIMESTAMP       
 );
CREATE  TABLE techmavericks_webcup.etat_produit ( 
	id                   INT  NOT NULL     PRIMARY KEY,
	nom                  VARCHAR(255)  NOT NULL     ,
	created_at           TIMESTAMP       ,
	updated_at           TIMESTAMP       
 );
CREATE  TABLE techmavericks_webcup.etat_transaction ( 
	id                   INT  NOT NULL     PRIMARY KEY,
	nom                  VARCHAR(255)       ,
	created_at           TIMESTAMP       ,
	updated_at           TIMESTAMP       
 );
CREATE  TABLE techmavericks_webcup.mode_paiement ( 
	id                   INT  NOT NULL   AUTO_INCREMENT  PRIMARY KEY,
	nom                  VARCHAR(255)       ,
	created_at           TIMESTAMP       ,
	updated_at           TIMESTAMP       
 );
CREATE  TABLE techmavericks_webcup.pays ( 
	id                   INT  NOT NULL   AUTO_INCREMENT  PRIMARY KEY,
	nom                  VARCHAR(255)  NOT NULL     ,
	created_at           TIMESTAMP       ,
	updated_at           TIMESTAMP       
 );
CREATE  TABLE techmavericks_webcup.type_transaction ( 
	id                   INT  NOT NULL     PRIMARY KEY,
	nom                  VARCHAR(255)       ,
	created_at           TIMESTAMP       ,
	updated_at           TIMESTAMP       
 );
CREATE  TABLE techmavericks_webcup.utilisateur ( 
	id                   INT  NOT NULL   AUTO_INCREMENT  PRIMARY KEY,
	nom                  VARCHAR(255)       ,
	mdp                  VARCHAR(255)       ,
	privilege            VARCHAR(255)       
 );
CREATE  TABLE techmavericks_webcup.utilisateur_front_office ( 
	id                   INT  NOT NULL   AUTO_INCREMENT  PRIMARY KEY,
	email                VARCHAR(255)  NOT NULL     ,
	telephone            VARCHAR(20)  NOT NULL     ,
	avatar               VARCHAR(255)  NOT NULL     ,
	name                 VARCHAR(50)  NOT NULL     ,
	password             VARCHAR(255)  NOT NULL     ,
	profile              INT  NOT NULL DEFAULT (0)    ,
	created_at           TIMESTAMP       ,
	updated_at           TIMESTAMP       
 );
CREATE  TABLE techmavericks_webcup.ville ( 
	id                   INT  NOT NULL   AUTO_INCREMENT  PRIMARY KEY,
	nom                  VARCHAR(255)       ,
	id_pays              INT       ,
	created_at           TIMESTAMP       ,
	updated_at           TIMESTAMP       ,
	CONSTRAINT ville_ibfk_1 FOREIGN KEY ( id_pays ) REFERENCES techmavericks_webcup.pays( id ) ON DELETE CASCADE ON UPDATE CASCADE
 );
CREATE INDEX id_pays ON techmavericks_webcup.ville ( id_pays );

CREATE  TABLE techmavericks_webcup.produit ( 
	id                   INT  NOT NULL   AUTO_INCREMENT  PRIMARY KEY,
	titre                VARCHAR(255)  NOT NULL     ,
	description          TEXT  NOT NULL     ,
	prix                 DOUBLE  NOT NULL     ,
	id_etat              INT       ,
	id_condition         INT       ,
	id_localisation      INT       ,
	id_categorie         INT       ,
	id_utilisateur       INT       ,
	created_at           TIMESTAMP       ,
	updated_at           TIMESTAMP       ,
	CONSTRAINT produit_ibfk_1 FOREIGN KEY ( id_etat ) REFERENCES techmavericks_webcup.etat_produit( id ) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT produit_ibfk_2 FOREIGN KEY ( id_condition ) REFERENCES techmavericks_webcup.condition_produit( id ) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT produit_ibfk_3 FOREIGN KEY ( id_localisation ) REFERENCES techmavericks_webcup.ville( id ) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT produit_ibfk_4 FOREIGN KEY ( id_categorie ) REFERENCES techmavericks_webcup.categorie( id ) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT produit_ibfk_5 FOREIGN KEY ( id_utilisateur ) REFERENCES techmavericks_webcup.utilisateur_front_office( id ) ON DELETE CASCADE ON UPDATE CASCADE
 );
CREATE INDEX id_etat ON techmavericks_webcup.produit ( id_etat );

CREATE INDEX id_condition ON techmavericks_webcup.produit ( id_condition );

CREATE INDEX id_localisation ON techmavericks_webcup.produit ( id_localisation );

CREATE INDEX id_categorie ON techmavericks_webcup.produit ( id_categorie );

CREATE INDEX id_utilisateur ON techmavericks_webcup.produit ( id_utilisateur );

CREATE  TABLE techmavericks_webcup.tokens ( 
	id                   INT  NOT NULL   AUTO_INCREMENT  PRIMARY KEY,
	id_user              INT  NOT NULL     ,
	token                VARCHAR(255)  NOT NULL     ,
	created_at           TIMESTAMP       ,
	updated_at           TIMESTAMP       ,
	CONSTRAINT tokens_ibfk_1 FOREIGN KEY ( id_user ) REFERENCES techmavericks_webcup.utilisateur_front_office( id ) ON DELETE NO ACTION ON UPDATE NO ACTION
 );
CREATE INDEX id_user ON techmavericks_webcup.tokens ( id_user );

CREATE  TABLE techmavericks_webcup.transaction ( 
	id                   INT  NOT NULL   AUTO_INCREMENT  PRIMARY KEY,
	id_utilisateur       INT       ,
	id_type              INT       ,
	id_produit           INT       ,
	prix                 DOUBLE       ,
	id_utilisateur_tiers INT       ,
	id_etat              INT       ,
	created_at           TIMESTAMP       ,
	updated_at           TIMESTAMP       ,
	CONSTRAINT transaction_ibfk_1 FOREIGN KEY ( id_type ) REFERENCES techmavericks_webcup.type_transaction( id ) ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT transaction_ibfk_2 FOREIGN KEY ( id_utilisateur ) REFERENCES techmavericks_webcup.utilisateur_front_office( id ) ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT transaction_ibfk_3 FOREIGN KEY ( id_produit ) REFERENCES techmavericks_webcup.produit( id ) ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT transaction_ibfk_4 FOREIGN KEY ( id_utilisateur_tiers ) REFERENCES techmavericks_webcup.utilisateur_front_office( id ) ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT transaction_ibfk_5 FOREIGN KEY ( id_etat ) REFERENCES techmavericks_webcup.etat_transaction( id ) ON DELETE NO ACTION ON UPDATE NO ACTION
 );
CREATE INDEX id_type ON techmavericks_webcup.transaction ( id_type );

CREATE INDEX id_utilisateur ON techmavericks_webcup.transaction ( id_utilisateur );

CREATE INDEX id_produit ON techmavericks_webcup.transaction ( id_produit );

CREATE INDEX id_utilisateur_tiers ON techmavericks_webcup.transaction ( id_utilisateur_tiers );

CREATE INDEX id_etat ON techmavericks_webcup.transaction ( id_etat );

CREATE  TABLE techmavericks_webcup.transaction_jeton ( 
	id                   INT  NOT NULL   AUTO_INCREMENT  PRIMARY KEY,
	id_utilisateur       INT       ,
	valeur               DOUBLE       ,
	created_at           TIMESTAMP       ,
	updated_at           TIMESTAMP       ,
	CONSTRAINT transaction_jeton_ibfk_1 FOREIGN KEY ( id_utilisateur ) REFERENCES techmavericks_webcup.utilisateur_front_office( id ) ON DELETE NO ACTION ON UPDATE NO ACTION
 );
CREATE INDEX id_utilisateur ON techmavericks_webcup.transaction_jeton ( id_utilisateur );

CREATE  TABLE techmavericks_webcup.photo_produit ( 
	id                   INT  NOT NULL   AUTO_INCREMENT  PRIMARY KEY,
	id_produit           INT       ,
	url                  TEXT  NOT NULL     ,
	created_at           TIMESTAMP       ,
	updated_at           TIMESTAMP       ,
	CONSTRAINT photo_produit_ibfk_1 FOREIGN KEY ( id_produit ) REFERENCES techmavericks_webcup.produit( id ) ON DELETE CASCADE ON UPDATE CASCADE
 );
CREATE INDEX id_produit ON techmavericks_webcup.photo_produit ( id_produit );

CREATE VIEW techmavericks_webcup.v_produit_lib_complet AS select `p`.`id` AS `id`,`p`.`titre` AS `titre`,`p`.`description` AS `description`,`p`.`prix` AS `prix`,`p`.`id_etat` AS `id_etat`,`p`.`id_categorie` AS `id_categorie`,`p`.`id_utilisateur` AS `id_utilisateur`,`p`.`id_localisation` AS `id_ville`,`p`.`id_condition` AS `id_condition`,`c`.`nom` AS `categorie`,`u`.`name` AS `utilisateur`,`cp`.`nom` AS `condition_`,`ep`.`nom` AS `etat`,`v`.`nom` AS `ville`,`pa`.`id` AS `id_pays`,`pa`.`nom` AS `pays` from ((((((`techmavericks_webcup`.`produit` `p` join `techmavericks_webcup`.`categorie` `c` on(`c`.`id` = `p`.`id_categorie`)) join `techmavericks_webcup`.`utilisateur_front_office` `u` on(`u`.`id` = `p`.`id_utilisateur`)) join `techmavericks_webcup`.`condition_produit` `cp` on(`cp`.`id` = `p`.`id_condition`)) join `techmavericks_webcup`.`etat_produit` `ep` on(`ep`.`id` = `p`.`id_etat`)) join `techmavericks_webcup`.`ville` `v` on(`v`.`id` = `p`.`id_localisation`)) join `techmavericks_webcup`.`pays` `pa` on(`pa`.`id` = `v`.`id_pays`));

CREATE VIEW techmavericks_webcup.v_ville_lib_complet AS select `v`.`id` AS `id`,`v`.`nom` AS `nom`,`v`.`id_pays` AS `id_pays`,`p`.`nom` AS `pays` from (`techmavericks_webcup`.`ville` `v` join `techmavericks_webcup`.`pays` `p` on(`p`.`id` = `v`.`id_pays`));

INSERT INTO techmavericks_webcup.avatar( id, url ) VALUES ( 1, 'https://robohash.org/4a3d58780f220d8b39a97eb1c9e4140a?set=set3&bgset=&size=200x200');
INSERT INTO techmavericks_webcup.avatar( id, url ) VALUES ( 2, 'https://gravatar.com/avatar/96952aff22a59789bbd940bd4f46a26b?s=200&d=robohash&r=g');
INSERT INTO techmavericks_webcup.avatar( id, url ) VALUES ( 3, 'https://gravatar.com/avatar/ea83f5388750df3dd53c64c3ed370a26?s=200&d=robohash&r=g');
INSERT INTO techmavericks_webcup.avatar( id, url ) VALUES ( 4, 'https://gravatar.com/avatar/e9254a2c866bacfd69c84e2c72195f31?s=200&d=robohash&r=g');
INSERT INTO techmavericks_webcup.categorie( id, nom, created_at, updated_at, url ) VALUES ( 1, 'Vehicule', null, null, 'https://firebasestorage.googleapis.com/v0/b/web-cup-image.appspot.com/o/categorie_images%2Fc_vehicle.jpeg?alt=media&token=0075eee9-fa1a-49b4-8fb0-fd4e0a7ad741');
INSERT INTO techmavericks_webcup.categorie( id, nom, created_at, updated_at, url ) VALUES ( 2, 'Vetement', null, null, 'https://firebasestorage.googleapis.com/v0/b/web-cup-image.appspot.com/o/categorie_images%2Fc_vetement.jpeg?alt=media&token=9e8f5e8e-c3bb-40df-b7e0-a1c33cb72e81');
INSERT INTO techmavericks_webcup.categorie( id, nom, created_at, updated_at, url ) VALUES ( 3, 'Sport', null, null, 'https://firebasestorage.googleapis.com/v0/b/web-cup-image.appspot.com/o/categorie_images%2Fc_sport.png?alt=media&token=6d36f463-2f54-4bd7-a1bb-53ccdef832af');
INSERT INTO techmavericks_webcup.categorie( id, nom, created_at, updated_at, url ) VALUES ( 4, 'Autres', null, null, 'https://firebasestorage.googleapis.com/v0/b/web-cup-image.appspot.com/o/categorie_images%2Fc_autre.jpeg?alt=media&token=4c9c1f14-2058-4630-be8e-a617657e2bf6');
INSERT INTO techmavericks_webcup.condition_produit( id, nom, created_at, updated_at ) VALUES ( 1, 'Nouveau', null, null);
INSERT INTO techmavericks_webcup.condition_produit( id, nom, created_at, updated_at ) VALUES ( 2, 'Occasion', null, null);
INSERT INTO techmavericks_webcup.condition_produit( id, nom, created_at, updated_at ) VALUES ( 3, 'Rarement utilise', null, null);
INSERT INTO techmavericks_webcup.equivalence_devise( id, nom, valeur, created_at, updated_at ) VALUES ( 1, 'Ariary', 100.0, null, null);
INSERT INTO techmavericks_webcup.equivalence_devise( id, nom, valeur, created_at, updated_at ) VALUES ( 2, 'Euro', 0.002, null, null);
INSERT INTO techmavericks_webcup.etat_produit( id, nom, created_at, updated_at ) VALUES ( 0, 'Non validee', null, null);
INSERT INTO techmavericks_webcup.etat_produit( id, nom, created_at, updated_at ) VALUES ( 10, 'Validee', null, null);
INSERT INTO techmavericks_webcup.etat_produit( id, nom, created_at, updated_at ) VALUES ( 15, 'Refuse', null, null);
INSERT INTO techmavericks_webcup.etat_produit( id, nom, created_at, updated_at ) VALUES ( 20, 'En vente', null, null);
INSERT INTO techmavericks_webcup.etat_produit( id, nom, created_at, updated_at ) VALUES ( 30, 'Indisponible', null, null);
INSERT INTO techmavericks_webcup.etat_produit( id, nom, created_at, updated_at ) VALUES ( 40, 'Vendu', null, null);
INSERT INTO techmavericks_webcup.mode_paiement( id, nom, created_at, updated_at ) VALUES ( 1, 'Mobile Money', null, null);
INSERT INTO techmavericks_webcup.mode_paiement( id, nom, created_at, updated_at ) VALUES ( 2, 'Paypal', null, null);
INSERT INTO techmavericks_webcup.pays( id, nom, created_at, updated_at ) VALUES ( 1, 'Madagascar', null, null);
INSERT INTO techmavericks_webcup.pays( id, nom, created_at, updated_at ) VALUES ( 2, 'Maurice', null, null);
INSERT INTO techmavericks_webcup.pays( id, nom, created_at, updated_at ) VALUES ( 3, 'Seychelles', null, null);
INSERT INTO techmavericks_webcup.pays( id, nom, created_at, updated_at ) VALUES ( 4, 'La Reunion', null, null);
INSERT INTO techmavericks_webcup.utilisateur( id, nom, mdp, privilege ) VALUES ( 1, 'techmavericks', 'rollback001', 'admin');
INSERT INTO techmavericks_webcup.utilisateur_front_office( id, email, telephone, avatar, name, password, profile, created_at, updated_at ) VALUES ( 1, 'kelydoda724@gmail.com', '0326470822', 'https://gravatar.com/avatar/e9254a2c866bacfd69c84e2c72195f31?s=200&d=robohash&r=g', 'techmavericks', '$2y$10$nNY44pETcLoglQhOHtI6kuiQnARozs9QDnj7XMh.dJTPmRwJoTmB2', 0, null, null);
INSERT INTO techmavericks_webcup.ville( id, nom, id_pays, created_at, updated_at ) VALUES ( 1, 'Antananarivo', 1, null, null);
INSERT INTO techmavericks_webcup.ville( id, nom, id_pays, created_at, updated_at ) VALUES ( 2, 'Toamasina', 1, null, null);
INSERT INTO techmavericks_webcup.ville( id, nom, id_pays, created_at, updated_at ) VALUES ( 3, 'Port Louis', 2, null, null);
INSERT INTO techmavericks_webcup.ville( id, nom, id_pays, created_at, updated_at ) VALUES ( 4, 'Beau Bassin-Rose Hill', 2, null, null);
INSERT INTO techmavericks_webcup.ville( id, nom, id_pays, created_at, updated_at ) VALUES ( 5, 'Saint-Denis', 3, null, null);
INSERT INTO techmavericks_webcup.ville( id, nom, id_pays, created_at, updated_at ) VALUES ( 6, 'Saint-Paul', 3, null, null);
INSERT INTO techmavericks_webcup.ville( id, nom, id_pays, created_at, updated_at ) VALUES ( 7, 'Victoria', 4, null, null);
INSERT INTO techmavericks_webcup.ville( id, nom, id_pays, created_at, updated_at ) VALUES ( 8, 'Anse Boileau', 4, null, null);
INSERT INTO techmavericks_webcup.produit( id, titre, description, prix, id_etat, id_condition, id_localisation, id_categorie, id_utilisateur, created_at, updated_at ) VALUES ( 1, 'Chapeau Western', 'Le chapeau western de Ken dans le film Barbie est un chapeau de cowboy blanc classique. Le chapeau presente un large bord et une bande noire autour de la couronne, lui conferant un style cowboy traditionnel. Ce chapeau fait partie de la tenue Western Fun de Ken, qui comprend egalement une chemise a franges, un jean et une grande boucle de ceinture. Le chapeau de cowboy blanc, ainsi que le reste de l ensemble d inspiration western de Ken, represente sa tentative d etablir sa propre identite distincte de Barbie et d explorer son style personnel. Ce choix de tenue reflete le moment Kenaissance de Ken dans le film, o? il tente de se liberer du fait d ?tre considere uniquement comme l accessoire de Barbie.', 100.0, 20, 1, 1, 2, 1, null, null);
INSERT INTO techmavericks_webcup.produit( id, titre, description, prix, id_etat, id_condition, id_localisation, id_categorie, id_utilisateur, created_at, updated_at ) VALUES ( 2, 'Gant de box', 'Les gants de boxe sont un element cle du nouveau look de Ken, inspire de l esthetique hypermasculine de la star du film d action Sylvester Stallone. En enfilant les gants de boxe, Ken imite le personnage dur, muscle et agressif incarne par les personnages emblematiques de Stallone comme Rocky Balboa. La couleur rouge des gants souligne encore le style audacieux et machiste que Ken essaie de projeter, contrairement a ses precedentes tenues de plage aux couleurs pastel dans Barbieland. Les gants de boxe symbolisent le desir de Ken d affirmer sa domination et son autorite, alors qu il cherche a etablir un Kendom patriarcal au sein du monde autrefois centre sur les femmes de Barbieland.', 200.0, 20, 1, 1, 3, 1, null, null);
INSERT INTO techmavericks_webcup.produit( id, titre, description, prix, id_etat, id_condition, id_localisation, id_categorie, id_utilisateur, created_at, updated_at ) VALUES ( 3, 'Sac de box', 'Le role de Ken en tant que punching-ball dans Barbie est decrit comme le resultat de la decision strategique de Mattel de le positionner davantage comme une cible de critiques plutot que comme un compagnon apprecie.', 400.0, 20, 1, 1, 3, 1, null, null);
INSERT INTO techmavericks_webcup.produit( id, titre, description, prix, id_etat, id_condition, id_localisation, id_categorie, id_utilisateur, created_at, updated_at ) VALUES ( 4, 'Veste blanche en laine', 'La veste en laine blanche de Ken dans Barbie est une piece remarquable qui ajoute une touche d elegance et de style au personnage. Cette veste, inspiree de Ken dans le film Barbie, est fabriquee en fausse fourrure de haute qualite, garantissant durabilite et confort pour le porteur. Il presente une belle couleur blanche qui permet a celui qui le porte de se demarquer et d ?tre magnifique. La veste a un devant ouvert pour un port facile, un col a revers pour une touche moderne et des manches amples qui se terminent par des poignets ouverts. De plus, il comprend deux poches exterieures et deux poches interieures pour plus de praticite. La doublure interieure de la veste est en fausse fourrure douce, ameliorant sa chaleur et son confort. Cette piece emblematique capture l essence du personnage de Ken dans le film, incarnant un melange de mode et de sophistication qui complete l esthetique globale du monde Barbie.', 200.0, 20, 1, 1, 2, 1, null, null);
INSERT INTO techmavericks_webcup.produit( id, titre, description, prix, id_etat, id_condition, id_localisation, id_categorie, id_utilisateur, created_at, updated_at ) VALUES ( 5, 'Bandeau', 'Le bandeau de Ken dans Barbie est decrit comme un bandeau en bandana noir. Il fait partie de sa tenue dans le film, assorti d un manteau de fourrure par-dessus un gilet a franges en cuir et d un collier de cheval.', 400.0, 20, 1, 1, 1, 1, null, null);
INSERT INTO techmavericks_webcup.produit( id, titre, description, prix, id_etat, id_condition, id_localisation, id_categorie, id_utilisateur, created_at, updated_at ) VALUES ( 6, 'PXG 0811X Gen4 Golf', 'Dans le film Barbie, Ken surprend les amateurs de golf en revelant ses talents de golfeur. Identifie sur Reddit, Ken utilise un pilote PXG, en particulier le pilote PXG 0811X Gen4 avec un arbre ProjectX Riptide CB. Cette tournure inattendue du film presente Ken comme un golfeur, ajoutant une dimension unique a son personnage au-dela du fait d ?tre le petit ami de Barbie. L utilisation d un club de golf haut de gamme comme le PXG met en evidence l inter?t et la ma?trise de Ken pour le golf, faisant de lui plus qu un simple personnage secondaire dans le monde de Barbie.', 200.0, 20, 1, 1, 3, 1, null, null);
INSERT INTO techmavericks_webcup.produit( id, titre, description, prix, id_etat, id_condition, id_localisation, id_categorie, id_utilisateur, created_at, updated_at ) VALUES ( 7, 'Montre Heuer Carrera', 'Dans le film Barbie, Ken, joue par Ryan Gosling, est represente comme portant trois montres chronographes Heuer Carrera vintage en m?me temps. Le choix de faire porter a Ken trois montres simultanement est un gag comique qui met en evidence sa comprehension superficielle de la masculinite et du statut. Les multiples montres sont censees transmettre la conviction de Ken que porter plus de montres le fera para?tre plus respecte et plus puissant, m?me s il s agit d une notion enfantine et absurde.', 1000.0, 20, 1, 1, 1, 1, null, null);
INSERT INTO techmavericks_webcup.photo_produit( id, id_produit, url, created_at, updated_at ) VALUES ( 1, 1, 'https://firebasestorage.googleapis.com/v0/b/web-cup-image.appspot.com/o/images%2Fwestern_hat1.jpeg?alt=media&token=4bb537d1-0630-4a2e-b134-3ac885a22a33', null, null);
INSERT INTO techmavericks_webcup.photo_produit( id, id_produit, url, created_at, updated_at ) VALUES ( 2, 1, 'https://firebasestorage.googleapis.com/v0/b/web-cup-image.appspot.com/o/images%2Fwestern_hat2.jpg?alt=media&token=42dc27f7-4e8a-4c81-b049-28f77e2b6ffe', null, null);
INSERT INTO techmavericks_webcup.photo_produit( id, id_produit, url, created_at, updated_at ) VALUES ( 3, 2, 'https://firebasestorage.googleapis.com/v0/b/web-cup-image.appspot.com/o/images%2Fgant1.jpeg?alt=media&token=f9ea13ed-7266-4b3a-87ad-b2e0ae7b90da', null, null);
INSERT INTO techmavericks_webcup.photo_produit( id, id_produit, url, created_at, updated_at ) VALUES ( 4, 3, 'https://firebasestorage.googleapis.com/v0/b/web-cup-image.appspot.com/o/images%2Fsacbox1.jpg?alt=media&token=8f28e746-1214-4165-94ff-a18c524f5eb2', null, null);
INSERT INTO techmavericks_webcup.photo_produit( id, id_produit, url, created_at, updated_at ) VALUES ( 5, 3, 'https://firebasestorage.googleapis.com/v0/b/web-cup-image.appspot.com/o/images%2Fsacbox2.jpeg?alt=media&token=fc1b3be3-fe30-43c1-86b5-1e402db776e1', null, null);
INSERT INTO techmavericks_webcup.photo_produit( id, id_produit, url, created_at, updated_at ) VALUES ( 6, 4, 'https://firebasestorage.googleapis.com/v0/b/web-cup-image.appspot.com/o/images%2Fveste1.jpeg?alt=media&token=1e490663-90bb-4d5d-8673-4e4a80e15a13', null, null);
INSERT INTO techmavericks_webcup.photo_produit( id, id_produit, url, created_at, updated_at ) VALUES ( 7, 4, 'https://firebasestorage.googleapis.com/v0/b/web-cup-image.appspot.com/o/images%2Fvest2.jpg?alt=media&token=009688ea-114d-4fc0-a097-76b8d1aed680', null, null);
INSERT INTO techmavericks_webcup.photo_produit( id, id_produit, url, created_at, updated_at ) VALUES ( 8, 5, 'https://firebasestorage.googleapis.com/v0/b/web-cup-image.appspot.com/o/images%2Fbandeau1.jpeg?alt=media&token=02e1d803-e10b-4e9b-9b54-816f0b03636c', null, null);
INSERT INTO techmavericks_webcup.photo_produit( id, id_produit, url, created_at, updated_at ) VALUES ( 9, 5, 'https://firebasestorage.googleapis.com/v0/b/web-cup-image.appspot.com/o/images%2Fbandeau2.jpeg?alt=media&token=2fd67c06-b174-4934-be1f-4beb8879fcb8', null, null);
INSERT INTO techmavericks_webcup.photo_produit( id, id_produit, url, created_at, updated_at ) VALUES ( 10, 6, 'https://firebasestorage.googleapis.com/v0/b/web-cup-image.appspot.com/o/images%2Fgolf1.jpeg?alt=media&token=df4c4b23-2dbe-4d08-8ce1-3ad83c8f3472', null, null);
INSERT INTO techmavericks_webcup.photo_produit( id, id_produit, url, created_at, updated_at ) VALUES ( 11, 7, 'https://firebasestorage.googleapis.com/v0/b/web-cup-image.appspot.com/o/images%2Fmontre1.jpg?alt=media&token=e2d37f25-b94e-4a2a-8f83-45bb3e67715c', null, null);
INSERT INTO techmavericks_webcup.photo_produit( id, id_produit, url, created_at, updated_at ) VALUES ( 12, 7, 'https://firebasestorage.googleapis.com/v0/b/web-cup-image.appspot.com/o/images%2Fmontre2.jpeg?alt=media&token=f25da5aa-d437-4806-b786-15365433a129', null, null);

