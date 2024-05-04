CREATE SCHEMA techmavericks_webcup;

CREATE  TABLE techmavericks_webcup.avatar ( 
	id                   INT  NOT NULL   AUTO_INCREMENT  PRIMARY KEY,
	url                  TEXT       
 ) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE  TABLE techmavericks_webcup.categorie ( 
	id                   INT  NOT NULL   AUTO_INCREMENT  PRIMARY KEY,
	nom                  VARCHAR(255)  NOT NULL     ,
	created_at           TIMESTAMP       ,
	updated_at           TIMESTAMP       ,
	CONSTRAINT nom UNIQUE ( nom ) 
 ) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE  TABLE techmavericks_webcup.condition_produit ( 
	id                   INT  NOT NULL   AUTO_INCREMENT  PRIMARY KEY,
	nom                  VARCHAR(255)  NOT NULL     ,
	created_at           TIMESTAMP       ,
	updated_at           TIMESTAMP       
 ) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE  TABLE techmavericks_webcup.equivalence_devise ( 
	id                   INT  NOT NULL   AUTO_INCREMENT  PRIMARY KEY,
	nom                  VARCHAR(255)  NOT NULL     ,
	valeur               DOUBLE  NOT NULL     ,
	created_at           TIMESTAMP       ,
	updated_at           TIMESTAMP       
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE  TABLE techmavericks_webcup.etat_produit ( 
	id                   INT  NOT NULL     PRIMARY KEY,
	nom                  VARCHAR(255)  NOT NULL     ,
	created_at           TIMESTAMP       ,
	updated_at           TIMESTAMP       
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE  TABLE techmavericks_webcup.etat_transaction ( 
	id                   INT  NOT NULL     PRIMARY KEY,
	nom                  VARCHAR(255)       ,
	created_at           TIMESTAMP       ,
	updated_at           TIMESTAMP       
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE  TABLE techmavericks_webcup.failed_jobs ( 
	id                   BIGINT UNSIGNED NOT NULL   AUTO_INCREMENT  PRIMARY KEY,
	uuid                 VARCHAR(255)  NOT NULL     ,
	connection           TEXT  NOT NULL     ,
	queue                TEXT  NOT NULL     ,
	payload              LONGTEXT  NOT NULL     ,
	exception            LONGTEXT  NOT NULL     ,
	failed_at            TIMESTAMP  NOT NULL DEFAULT (current_timestamp())    ,
	CONSTRAINT failed_jobs_uuid_unique UNIQUE ( uuid ) 
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE  TABLE techmavericks_webcup.migrations ( 
	id                   INT UNSIGNED NOT NULL   AUTO_INCREMENT  PRIMARY KEY,
	migration            VARCHAR(255)  NOT NULL     ,
	batch                INT  NOT NULL     
 ) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE  TABLE techmavericks_webcup.mode_paiement ( 
	id                   INT  NOT NULL   AUTO_INCREMENT  PRIMARY KEY,
	nom                  VARCHAR(255)       ,
	created_at           TIMESTAMP       ,
	updated_at           TIMESTAMP       
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE  TABLE techmavericks_webcup.password_resets ( 
	email                VARCHAR(255)  NOT NULL     ,
	token                VARCHAR(255)  NOT NULL     ,
	created_at           TIMESTAMP       
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE INDEX password_resets_email_index ON techmavericks_webcup.password_resets ( email );

CREATE  TABLE techmavericks_webcup.pays ( 
	id                   INT  NOT NULL   AUTO_INCREMENT  PRIMARY KEY,
	nom                  VARCHAR(255)  NOT NULL     ,
	created_at           TIMESTAMP       ,
	updated_at           TIMESTAMP       
 ) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE  TABLE techmavericks_webcup.personal_access_tokens ( 
	id                   BIGINT UNSIGNED NOT NULL   AUTO_INCREMENT  PRIMARY KEY,
	tokenable_type       VARCHAR(255)  NOT NULL     ,
	tokenable_id         BIGINT UNSIGNED NOT NULL     ,
	name                 VARCHAR(255)  NOT NULL     ,
	token                VARCHAR(64)  NOT NULL     ,
	abilities            TEXT       ,
	last_used_at         TIMESTAMP       ,
	created_at           TIMESTAMP       ,
	updated_at           TIMESTAMP       ,
	CONSTRAINT personal_access_tokens_token_unique UNIQUE ( token ) 
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON techmavericks_webcup.personal_access_tokens ( tokenable_type, tokenable_id );

CREATE  TABLE techmavericks_webcup.type_transaction ( 
	id                   INT  NOT NULL     PRIMARY KEY,
	nom                  VARCHAR(255)       ,
	created_at           TIMESTAMP       ,
	updated_at           TIMESTAMP       
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE  TABLE techmavericks_webcup.users ( 
	id                   BIGINT UNSIGNED NOT NULL   AUTO_INCREMENT  PRIMARY KEY,
	name                 VARCHAR(255)  NOT NULL     ,
	email                VARCHAR(255)  NOT NULL     ,
	email_verified_at    TIMESTAMP       ,
	password             VARCHAR(255)  NOT NULL     ,
	remember_token       VARCHAR(100)       ,
	created_at           TIMESTAMP       ,
	updated_at           TIMESTAMP       ,
	CONSTRAINT users_email_unique UNIQUE ( email ) 
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE  TABLE techmavericks_webcup.utilisateur ( 
	id                   INT  NOT NULL   AUTO_INCREMENT  PRIMARY KEY,
	nom                  VARCHAR(255)       ,
	mdp                  VARCHAR(255)       ,
	privilege            VARCHAR(255)       
 ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
 ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE  TABLE techmavericks_webcup.ville ( 
	id                   INT  NOT NULL   AUTO_INCREMENT  PRIMARY KEY,
	nom                  VARCHAR(255)       ,
	id_pays              INT       ,
	created_at           TIMESTAMP       ,
	updated_at           TIMESTAMP       
 ) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
	updated_at           TIMESTAMP       
 ) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
	updated_at           TIMESTAMP       
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
	updated_at           TIMESTAMP       
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
	updated_at           TIMESTAMP       
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE INDEX id_utilisateur ON techmavericks_webcup.transaction_jeton ( id_utilisateur );

CREATE  TABLE techmavericks_webcup.photo_produit ( 
	id                   INT  NOT NULL   AUTO_INCREMENT  PRIMARY KEY,
	id_produit           INT       ,
	url                  TEXT  NOT NULL     ,
	created_at           TIMESTAMP       ,
	updated_at           TIMESTAMP       
 ) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE INDEX id_produit ON techmavericks_webcup.photo_produit ( id_produit );

ALTER TABLE techmavericks_webcup.photo_produit ADD CONSTRAINT photo_produit_ibfk_1 FOREIGN KEY ( id_produit ) REFERENCES techmavericks_webcup.produit( id ) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE techmavericks_webcup.produit ADD CONSTRAINT produit_ibfk_1 FOREIGN KEY ( id_etat ) REFERENCES techmavericks_webcup.etat_produit( id ) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE techmavericks_webcup.produit ADD CONSTRAINT produit_ibfk_2 FOREIGN KEY ( id_condition ) REFERENCES techmavericks_webcup.condition_produit( id ) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE techmavericks_webcup.produit ADD CONSTRAINT produit_ibfk_3 FOREIGN KEY ( id_localisation ) REFERENCES techmavericks_webcup.ville( id ) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE techmavericks_webcup.produit ADD CONSTRAINT produit_ibfk_4 FOREIGN KEY ( id_categorie ) REFERENCES techmavericks_webcup.categorie( id ) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE techmavericks_webcup.produit ADD CONSTRAINT produit_ibfk_5 FOREIGN KEY ( id_utilisateur ) REFERENCES techmavericks_webcup.utilisateur_front_office( id ) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE techmavericks_webcup.tokens ADD CONSTRAINT tokens_ibfk_1 FOREIGN KEY ( id_user ) REFERENCES techmavericks_webcup.utilisateur_front_office( id ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE techmavericks_webcup.transaction ADD CONSTRAINT transaction_ibfk_1 FOREIGN KEY ( id_type ) REFERENCES techmavericks_webcup.type_transaction( id ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE techmavericks_webcup.transaction ADD CONSTRAINT transaction_ibfk_2 FOREIGN KEY ( id_utilisateur ) REFERENCES techmavericks_webcup.utilisateur_front_office( id ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE techmavericks_webcup.transaction ADD CONSTRAINT transaction_ibfk_3 FOREIGN KEY ( id_produit ) REFERENCES techmavericks_webcup.produit( id ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE techmavericks_webcup.transaction ADD CONSTRAINT transaction_ibfk_4 FOREIGN KEY ( id_utilisateur_tiers ) REFERENCES techmavericks_webcup.utilisateur_front_office( id ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE techmavericks_webcup.transaction ADD CONSTRAINT transaction_ibfk_5 FOREIGN KEY ( id_etat ) REFERENCES techmavericks_webcup.etat_transaction( id ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE techmavericks_webcup.transaction_jeton ADD CONSTRAINT transaction_jeton_ibfk_1 FOREIGN KEY ( id_utilisateur ) REFERENCES techmavericks_webcup.utilisateur_front_office( id ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE techmavericks_webcup.ville ADD CONSTRAINT ville_ibfk_1 FOREIGN KEY ( id_pays ) REFERENCES techmavericks_webcup.pays( id ) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE VIEW techmavericks_webcup.v_produit_lib_complet AS select `p`.`id` AS `id`,`p`.`titre` AS `titre`,`p`.`description` AS `description`,`p`.`prix` AS `prix`,`p`.`id_etat` AS `id_etat`,`p`.`id_categorie` AS `id_categorie`,`p`.`id_utilisateur` AS `id_utilisateur`,`p`.`id_localisation` AS `id_ville`,`p`.`id_condition` AS `id_condition`,`c`.`nom` AS `categorie`,`u`.`name` AS `utilisateur`,`cp`.`nom` AS `condition_`,`ep`.`nom` AS `etat`,`v`.`nom` AS `ville`,`pa`.`id` AS `id_pays`,`pa`.`nom` AS `pays` from ((((((`techmavericks_webcup`.`produit` `p` join `techmavericks_webcup`.`categorie` `c` on(`c`.`id` = `p`.`id_categorie`)) join `techmavericks_webcup`.`utilisateur_front_office` `u` on(`u`.`id` = `p`.`id_utilisateur`)) join `techmavericks_webcup`.`condition_produit` `cp` on(`cp`.`id` = `p`.`id_condition`)) join `techmavericks_webcup`.`etat_produit` `ep` on(`ep`.`id` = `p`.`id_etat`)) join `techmavericks_webcup`.`ville` `v` on(`v`.`id` = `p`.`id_localisation`)) join `techmavericks_webcup`.`pays` `pa` on(`pa`.`id` = `v`.`id_pays`));

CREATE VIEW techmavericks_webcup.v_ville_lib_complet AS select `v`.`id` AS `id`,`v`.`nom` AS `nom`,`v`.`id_pays` AS `id_pays`,`p`.`nom` AS `pays` from (`techmavericks_webcup`.`ville` `v` join `techmavericks_webcup`.`pays` `p` on(`p`.`id` = `v`.`id_pays`));

INSERT INTO techmavericks_webcup.avatar( id, url ) VALUES ( 1, 'https://robohash.org/4a3d58780f220d8b39a97eb1c9e4140a?set=set3&bgset=&size=200x200');
INSERT INTO techmavericks_webcup.avatar( id, url ) VALUES ( 2, 'https://gravatar.com/avatar/96952aff22a59789bbd940bd4f46a26b?s=200&d=robohash&r=g');
INSERT INTO techmavericks_webcup.avatar( id, url ) VALUES ( 3, 'https://gravatar.com/avatar/ea83f5388750df3dd53c64c3ed370a26?s=200&d=robohash&r=g');
INSERT INTO techmavericks_webcup.avatar( id, url ) VALUES ( 4, 'https://gravatar.com/avatar/e9254a2c866bacfd69c84e2c72195f31?s=200&d=robohash&r=g');
INSERT INTO techmavericks_webcup.categorie( id, nom, created_at, updated_at ) VALUES ( 1, 'Vehicule', null, null);
INSERT INTO techmavericks_webcup.categorie( id, nom, created_at, updated_at ) VALUES ( 2, 'Vetement', null, null);
INSERT INTO techmavericks_webcup.categorie( id, nom, created_at, updated_at ) VALUES ( 3, 'Sport', null, null);
INSERT INTO techmavericks_webcup.categorie( id, nom, created_at, updated_at ) VALUES ( 4, 'Technologie', null, null);
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
INSERT INTO techmavericks_webcup.migrations( id, migration, batch ) VALUES ( 1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO techmavericks_webcup.migrations( id, migration, batch ) VALUES ( 2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO techmavericks_webcup.migrations( id, migration, batch ) VALUES ( 3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO techmavericks_webcup.migrations( id, migration, batch ) VALUES ( 4, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO techmavericks_webcup.migrations( id, migration, batch ) VALUES ( 5, '2024_05_04_110347_add_timestamps_to_tables', 1);
INSERT INTO techmavericks_webcup.migrations( id, migration, batch ) VALUES ( 6, '2024_05_04_110347_add_timestamps_to_tables copy', 2);
INSERT INTO techmavericks_webcup.mode_paiement( id, nom, created_at, updated_at ) VALUES ( 4, 'Mobile Money', null, null);
INSERT INTO techmavericks_webcup.mode_paiement( id, nom, created_at, updated_at ) VALUES ( 5, 'Paypal', null, null);
INSERT INTO techmavericks_webcup.pays( id, nom, created_at, updated_at ) VALUES ( 1, 'Madagascar', null, null);
INSERT INTO techmavericks_webcup.pays( id, nom, created_at, updated_at ) VALUES ( 2, 'Maurice', null, null);
INSERT INTO techmavericks_webcup.pays( id, nom, created_at, updated_at ) VALUES ( 3, 'Seychelles', null, null);
INSERT INTO techmavericks_webcup.pays( id, nom, created_at, updated_at ) VALUES ( 4, 'La Reunion', null, null);
INSERT INTO techmavericks_webcup.utilisateur( id, nom, mdp, privilege ) VALUES ( 1, 'techmavericks', 'rollback001', 'admin');
INSERT INTO techmavericks_webcup.utilisateur_front_office( id, email, telephone, avatar, name, password, profile, created_at, updated_at ) VALUES ( 1, 'user1@mail.com', '0323245665', '', 'user1', 'user1', 0, null, null);
INSERT INTO techmavericks_webcup.utilisateur_front_office( id, email, telephone, avatar, name, password, profile, created_at, updated_at ) VALUES ( 2, 'example@example.com', '1234567890', 'https://gravatar.com/avatar/e9254a2c866bacfd69c84e2c72195f31?s=200&d=robohash&r=g', 'user2', '$2y$10$tXRdHSS0D.s2VyjjRuzCFe/8TETLdaS3hsEQt.nJt4WbQgrZcRsF2', 0, null, null);
INSERT INTO techmavericks_webcup.ville( id, nom, id_pays, created_at, updated_at ) VALUES ( 1, 'Antananarivo', 1, null, null);
INSERT INTO techmavericks_webcup.ville( id, nom, id_pays, created_at, updated_at ) VALUES ( 2, 'Toamasina', 1, null, null);
INSERT INTO techmavericks_webcup.ville( id, nom, id_pays, created_at, updated_at ) VALUES ( 3, 'Port Louis', 2, null, null);
INSERT INTO techmavericks_webcup.ville( id, nom, id_pays, created_at, updated_at ) VALUES ( 4, 'Beau Bassin-Rose Hill', 2, null, null);
INSERT INTO techmavericks_webcup.ville( id, nom, id_pays, created_at, updated_at ) VALUES ( 5, 'Saint-Denis', 3, null, null);
INSERT INTO techmavericks_webcup.ville( id, nom, id_pays, created_at, updated_at ) VALUES ( 6, 'Saint-Paul', 3, null, null);
INSERT INTO techmavericks_webcup.ville( id, nom, id_pays, created_at, updated_at ) VALUES ( 7, 'Victoria', 4, null, null);
INSERT INTO techmavericks_webcup.ville( id, nom, id_pays, created_at, updated_at ) VALUES ( 8, 'Anse Boileau', 4, null, null);
INSERT INTO techmavericks_webcup.produit( id, titre, description, prix, id_etat, id_condition, id_localisation, id_categorie, id_utilisateur, created_at, updated_at ) VALUES ( 1, 'Samsung Galaxy S20', 'Smartphone haut de gamme avec un ecran AMOLED de 6.2 pouces, un processeur puissant et un systeme de camera triple.', 799.99, 0, 1, 1, 1, 1, null, null);
INSERT INTO techmavericks_webcup.produit( id, titre, description, prix, id_etat, id_condition, id_localisation, id_categorie, id_utilisateur, created_at, updated_at ) VALUES ( 2, 'Velo de montagne tout suspendu', 'Velo de montagne tout suspendu avec cadre en aluminium, suspension a double pivot et freins a disque hydrauliques.', 1499.99, 10, 1, 1, 2, 1, null, null);
INSERT INTO techmavericks_webcup.produit( id, titre, description, prix, id_etat, id_condition, id_localisation, id_categorie, id_utilisateur, created_at, updated_at ) VALUES ( 3, 'Chemise en lin pour homme', 'Chemise en lin legere et respirante, parfaite pour les journees chaudes. Disponible en plusieurs couleurs et tailles.', 49.99, 20, 1, 1, 3, 1, null, null);
INSERT INTO techmavericks_webcup.produit( id, titre, description, prix, id_etat, id_condition, id_localisation, id_categorie, id_utilisateur, created_at, updated_at ) VALUES ( 4, 'Harry Potter et la pierre philosophale', 'Premier livre de la serie Harry Potter ecrit par J.K. Rowling. Un classique de la litterature fantastique pour tous les ages.', 12.99, 30, 2, 1, 4, 1, null, null);
INSERT INTO techmavericks_webcup.produit( id, titre, description, prix, id_etat, id_condition, id_localisation, id_categorie, id_utilisateur, created_at, updated_at ) VALUES ( 5, 'Refrigerateur ? deux portes', 'Refrigerateur spacieux avec congelateur superieur, parfait pour stocker les aliments frais et surgeles.', 799.99, 40, 2, 1, 1, 1, null, null);
INSERT INTO techmavericks_webcup.produit( id, titre, description, prix, id_etat, id_condition, id_localisation, id_categorie, id_utilisateur, created_at, updated_at ) VALUES ( 6, 'Nikon D850 Appareil photo reflex numerique', 'Appareil photo reflex numerique professionnel avec un capteur haute resolution de 45.7 MP et un systeme AF ultra-precis.', 2499.99, 10, 3, 1, 2, 1, null, null);
INSERT INTO techmavericks_webcup.produit( id, titre, description, prix, id_etat, id_condition, id_localisation, id_categorie, id_utilisateur, created_at, updated_at ) VALUES ( 7, 'Lunette', 'Description of the product', 22.0, 0, 1, null, 1, 1, '2024-05-04 05.57.38 pm', '2024-05-04 05.57.38 pm');
INSERT INTO techmavericks_webcup.produit( id, titre, description, prix, id_etat, id_condition, id_localisation, id_categorie, id_utilisateur, created_at, updated_at ) VALUES ( 8, 'Lunette', 'Description of the product', 22.0, 15, 1, 1, 1, 1, '2024-05-04 05.58.28 pm', '2024-05-04 07.42.26 pm');
INSERT INTO techmavericks_webcup.produit( id, titre, description, prix, id_etat, id_condition, id_localisation, id_categorie, id_utilisateur, created_at, updated_at ) VALUES ( 9, 'Lunette', 'Description of the product', 22.0, 10, 1, 1, 1, 1, '2024-05-04 06.00.21 pm', '2024-05-04 07.42.31 pm');
INSERT INTO techmavericks_webcup.produit( id, titre, description, prix, id_etat, id_condition, id_localisation, id_categorie, id_utilisateur, created_at, updated_at ) VALUES ( 10, 'Lunette', 'Description of the product', 22.0, 0, 1, 1, 1, 1, '2024-05-04 06.02.37 pm', '2024-05-04 06.02.37 pm');
INSERT INTO techmavericks_webcup.produit( id, titre, description, prix, id_etat, id_condition, id_localisation, id_categorie, id_utilisateur, created_at, updated_at ) VALUES ( 11, 'Lunette', 'Description of the product', 22.0, 0, 1, 1, 1, 1, '2024-05-04 06.03.45 pm', '2024-05-04 06.03.45 pm');
INSERT INTO techmavericks_webcup.produit( id, titre, description, prix, id_etat, id_condition, id_localisation, id_categorie, id_utilisateur, created_at, updated_at ) VALUES ( 12, 'Lunette', 'Description of the product', 22.0, 0, 1, 1, 1, null, '2024-05-04 06.08.57 pm', '2024-05-04 06.08.57 pm');
INSERT INTO techmavericks_webcup.produit( id, titre, description, prix, id_etat, id_condition, id_localisation, id_categorie, id_utilisateur, created_at, updated_at ) VALUES ( 13, 'Lunette', 'Description of the product', 22.0, 10, 1, 1, 1, 2, '2024-05-04 06.09.28 pm', '2024-05-04 06.55.12 pm');
INSERT INTO techmavericks_webcup.produit( id, titre, description, prix, id_etat, id_condition, id_localisation, id_categorie, id_utilisateur, created_at, updated_at ) VALUES ( 14, 'Lunette', 'Description of the product', 22.0, 10, 1, 1, 1, 2, '2024-05-04 06.43.22 pm', '2024-05-04 06.53.57 pm');
INSERT INTO techmavericks_webcup.produit( id, titre, description, prix, id_etat, id_condition, id_localisation, id_categorie, id_utilisateur, created_at, updated_at ) VALUES ( 15, 'Ray-Ban Aviator Sunglasses', 'The iconic Ray-Ban Aviator sunglasses were originally designed for U.S. aviators in 1937. They are a timeless model that combines great aviator styling with exceptional quality, performance, and comfort.', 99.99, 0, 2, 1, 2, 2, '2024-05-04 07.17.31 pm', '2024-05-04 07.17.31 pm');
INSERT INTO techmavericks_webcup.produit( id, titre, description, prix, id_etat, id_condition, id_localisation, id_categorie, id_utilisateur, created_at, updated_at ) VALUES ( 16, 'Ray-Ban Aviator Sunglasses', 'The iconic Ray-Ban Aviator sunglasses were originally designed for U.S. aviators in 1937. They are a timeless model that combines great aviator styling with exceptional quality, performance, and comfort.', 99.99, 0, 2, 1, 2, 2, '2024-05-04 08.31.43 pm', '2024-05-04 08.31.43 pm');
INSERT INTO techmavericks_webcup.produit( id, titre, description, prix, id_etat, id_condition, id_localisation, id_categorie, id_utilisateur, created_at, updated_at ) VALUES ( 17, 'Ray-Ban Aviator Sunglasses', 'The iconic Ray-Ban Aviator sunglasses were originally designed for U.S. aviators in 1937. They are a timeless model that combines great aviator styling with exceptional quality, performance, and comfort.', 99.99, 0, 2, 1, 2, 2, '2024-05-04 11.41.38 pm', '2024-05-04 11.41.38 pm');
INSERT INTO techmavericks_webcup.produit( id, titre, description, prix, id_etat, id_condition, id_localisation, id_categorie, id_utilisateur, created_at, updated_at ) VALUES ( 18, 'Ray-Ban Aviator Sunglasses', 'The iconic Ray-Ban Aviator sunglasses were originally designed for U.S. aviators in 1937. They are a timeless model that combines great aviator styling with exceptional quality, performance, and comfort.', 99.99, 0, 2, 1, 2, 2, '2024-05-04 11.45.02 pm', '2024-05-04 11.45.02 pm');
INSERT INTO techmavericks_webcup.tokens( id, id_user, token, created_at, updated_at ) VALUES ( 1, 2, 'hlqcWHyxluN4hUvIPTel60ieG1RAd4iwlFZeSHcVy0BKOS4vF8MqgurEohEy', null, null);
INSERT INTO techmavericks_webcup.tokens( id, id_user, token, created_at, updated_at ) VALUES ( 2, 2, 'U363U3id1GZcNB8nUmQVnl7YyhKBFRQMy58j9zp07MEKTKRxXvFkArWLkLTZ', null, null);
INSERT INTO techmavericks_webcup.tokens( id, id_user, token, created_at, updated_at ) VALUES ( 3, 2, 'M576WJnBR9tQm0NmQQw1WLnuKh0ApwBJmVMSo6sksH4g24kRNwAoIofXRoWm', null, null);
INSERT INTO techmavericks_webcup.photo_produit( id, id_produit, url, created_at, updated_at ) VALUES ( 1, 1, '', null, null);
INSERT INTO techmavericks_webcup.photo_produit( id, id_produit, url, created_at, updated_at ) VALUES ( 2, 2, '', null, null);
INSERT INTO techmavericks_webcup.photo_produit( id, id_produit, url, created_at, updated_at ) VALUES ( 3, 3, '', null, null);
INSERT INTO techmavericks_webcup.photo_produit( id, id_produit, url, created_at, updated_at ) VALUES ( 4, 4, '', null, null);
INSERT INTO techmavericks_webcup.photo_produit( id, id_produit, url, created_at, updated_at ) VALUES ( 5, 5, '', null, null);
INSERT INTO techmavericks_webcup.photo_produit( id, id_produit, url, created_at, updated_at ) VALUES ( 6, 6, '', null, null);
INSERT INTO techmavericks_webcup.photo_produit( id, id_produit, url, created_at, updated_at ) VALUES ( 7, 9, 'lien1', '2024-05-04 06.00.21 pm', '2024-05-04 06.00.21 pm');
INSERT INTO techmavericks_webcup.photo_produit( id, id_produit, url, created_at, updated_at ) VALUES ( 8, 9, 'lien2', '2024-05-04 06.00.21 pm', '2024-05-04 06.00.21 pm');
INSERT INTO techmavericks_webcup.photo_produit( id, id_produit, url, created_at, updated_at ) VALUES ( 9, 9, 'lien3', '2024-05-04 06.00.21 pm', '2024-05-04 06.00.21 pm');
INSERT INTO techmavericks_webcup.photo_produit( id, id_produit, url, created_at, updated_at ) VALUES ( 10, 10, 'https://fre.com/dod.jpg', '2024-05-04 06.02.37 pm', '2024-05-04 06.02.37 pm');
INSERT INTO techmavericks_webcup.photo_produit( id, id_produit, url, created_at, updated_at ) VALUES ( 11, 11, 'https://fre.com/dod.jpg', '2024-05-04 06.03.45 pm', '2024-05-04 06.03.45 pm');
INSERT INTO techmavericks_webcup.photo_produit( id, id_produit, url, created_at, updated_at ) VALUES ( 12, 12, 'https://fre.com/dod.jpg', '2024-05-04 06.08.57 pm', '2024-05-04 06.08.57 pm');
INSERT INTO techmavericks_webcup.photo_produit( id, id_produit, url, created_at, updated_at ) VALUES ( 13, 13, 'https://fre.com/dod.jpg', '2024-05-04 06.09.28 pm', '2024-05-04 06.09.28 pm');
INSERT INTO techmavericks_webcup.photo_produit( id, id_produit, url, created_at, updated_at ) VALUES ( 14, 14, 'https://fastly.picsum.photos/id/0/5000/3333.jpg?hmac=_j6ghY5fCfSD6tvtcV74zXivkJSPIfR9B8w34XeQmvU', '2024-05-04 06.43.22 pm', '2024-05-04 06.43.22 pm');
INSERT INTO techmavericks_webcup.photo_produit( id, id_produit, url, created_at, updated_at ) VALUES ( 15, 14, 'https://fastly.picsum.photos/id/2/5000/3333.jpg?hmac=_KDkqQVttXw_nM-RyJfLImIbafFrqLsuGO5YuHqD-qQ', '2024-05-04 06.43.22 pm', '2024-05-04 06.43.22 pm');
INSERT INTO techmavericks_webcup.photo_produit( id, id_produit, url, created_at, updated_at ) VALUES ( 16, 15, 'https://fastly.picsum.photos/id/0/5000/3333.jpg?hmac=_j6ghY5fCfSD6tvtcV74zXivkJSPIfR9B8w34XeQmvU', '2024-05-04 07.17.31 pm', '2024-05-04 07.17.31 pm');
INSERT INTO techmavericks_webcup.photo_produit( id, id_produit, url, created_at, updated_at ) VALUES ( 17, 15, 'https://fastly.picsum.photos/id/2/5000/3333.jpg?hmac=_KDkqQVttXw_nM-RyJfLImIbafFrqLsuGO5YuHqD-qQ', '2024-05-04 07.17.31 pm', '2024-05-04 07.17.31 pm');
INSERT INTO techmavericks_webcup.photo_produit( id, id_produit, url, created_at, updated_at ) VALUES ( 18, 15, 'https://fastly.picsum.photos/id/11/2500/1667.jpg?hmac=xxjFJtAPgshYkysU_aqx2sZir-kIOjNR9vx0te7GycQ', '2024-05-04 07.17.31 pm', '2024-05-04 07.17.31 pm');
INSERT INTO techmavericks_webcup.photo_produit( id, id_produit, url, created_at, updated_at ) VALUES ( 19, 15, 'https://fastly.picsum.photos/id/16/2500/1667.jpg?hmac=uAkZwYc5phCRNFTrV_prJ_0rP0EdwJaZ4ctje2bY7aE', '2024-05-04 07.17.31 pm', '2024-05-04 07.17.31 pm');
INSERT INTO techmavericks_webcup.photo_produit( id, id_produit, url, created_at, updated_at ) VALUES ( 20, 15, 'https://fastly.picsum.photos/id/17/2500/1667.jpg?hmac=HD-JrnNUZjFiP2UZQvWcKrgLoC_pc_ouUSWv8kHsJJY', '2024-05-04 07.17.31 pm', '2024-05-04 07.17.31 pm');
INSERT INTO techmavericks_webcup.photo_produit( id, id_produit, url, created_at, updated_at ) VALUES ( 21, 16, 'https://fastly.picsum.photos/id/0/5000/3333.jpg?hmac=_j6ghY5fCfSD6tvtcV74zXivkJSPIfR9B8w34XeQmvU', '2024-05-04 08.31.43 pm', '2024-05-04 08.31.43 pm');
INSERT INTO techmavericks_webcup.photo_produit( id, id_produit, url, created_at, updated_at ) VALUES ( 22, 16, 'https://fastly.picsum.photos/id/2/5000/3333.jpg?hmac=_KDkqQVttXw_nM-RyJfLImIbafFrqLsuGO5YuHqD-qQ', '2024-05-04 08.31.43 pm', '2024-05-04 08.31.43 pm');
INSERT INTO techmavericks_webcup.photo_produit( id, id_produit, url, created_at, updated_at ) VALUES ( 23, 16, 'https://fastly.picsum.photos/id/11/2500/1667.jpg?hmac=xxjFJtAPgshYkysU_aqx2sZir-kIOjNR9vx0te7GycQ', '2024-05-04 08.31.43 pm', '2024-05-04 08.31.43 pm');
INSERT INTO techmavericks_webcup.photo_produit( id, id_produit, url, created_at, updated_at ) VALUES ( 24, 16, 'https://fastly.picsum.photos/id/16/2500/1667.jpg?hmac=uAkZwYc5phCRNFTrV_prJ_0rP0EdwJaZ4ctje2bY7aE', '2024-05-04 08.31.43 pm', '2024-05-04 08.31.43 pm');
INSERT INTO techmavericks_webcup.photo_produit( id, id_produit, url, created_at, updated_at ) VALUES ( 25, 16, 'https://fastly.picsum.photos/id/17/2500/1667.jpg?hmac=HD-JrnNUZjFiP2UZQvWcKrgLoC_pc_ouUSWv8kHsJJY', '2024-05-04 08.31.43 pm', '2024-05-04 08.31.43 pm');
INSERT INTO techmavericks_webcup.photo_produit( id, id_produit, url, created_at, updated_at ) VALUES ( 26, 17, 'https://fastly.picsum.photos/id/0/5000/3333.jpg?hmac=_j6ghY5fCfSD6tvtcV74zXivkJSPIfR9B8w34XeQmvU', '2024-05-04 11.41.38 pm', '2024-05-04 11.41.38 pm');
INSERT INTO techmavericks_webcup.photo_produit( id, id_produit, url, created_at, updated_at ) VALUES ( 27, 17, 'https://fastly.picsum.photos/id/2/5000/3333.jpg?hmac=_KDkqQVttXw_nM-RyJfLImIbafFrqLsuGO5YuHqD-qQ', '2024-05-04 11.41.38 pm', '2024-05-04 11.41.38 pm');
INSERT INTO techmavericks_webcup.photo_produit( id, id_produit, url, created_at, updated_at ) VALUES ( 28, 17, 'https://fastly.picsum.photos/id/11/2500/1667.jpg?hmac=xxjFJtAPgshYkysU_aqx2sZir-kIOjNR9vx0te7GycQ', '2024-05-04 11.41.38 pm', '2024-05-04 11.41.38 pm');
INSERT INTO techmavericks_webcup.photo_produit( id, id_produit, url, created_at, updated_at ) VALUES ( 29, 17, 'https://fastly.picsum.photos/id/16/2500/1667.jpg?hmac=uAkZwYc5phCRNFTrV_prJ_0rP0EdwJaZ4ctje2bY7aE', '2024-05-04 11.41.38 pm', '2024-05-04 11.41.38 pm');
INSERT INTO techmavericks_webcup.photo_produit( id, id_produit, url, created_at, updated_at ) VALUES ( 30, 17, 'https://fastly.picsum.photos/id/17/2500/1667.jpg?hmac=HD-JrnNUZjFiP2UZQvWcKrgLoC_pc_ouUSWv8kHsJJY', '2024-05-04 11.41.38 pm', '2024-05-04 11.41.38 pm');
INSERT INTO techmavericks_webcup.photo_produit( id, id_produit, url, created_at, updated_at ) VALUES ( 31, 18, 'https://fastly.picsum.photos/id/0/5000/3333.jpg?hmac=_j6ghY5fCfSD6tvtcV74zXivkJSPIfR9B8w34XeQmvU', '2024-05-04 11.45.02 pm', '2024-05-04 11.45.02 pm');
INSERT INTO techmavericks_webcup.photo_produit( id, id_produit, url, created_at, updated_at ) VALUES ( 32, 18, 'https://fastly.picsum.photos/id/2/5000/3333.jpg?hmac=_KDkqQVttXw_nM-RyJfLImIbafFrqLsuGO5YuHqD-qQ', '2024-05-04 11.45.02 pm', '2024-05-04 11.45.02 pm');
INSERT INTO techmavericks_webcup.photo_produit( id, id_produit, url, created_at, updated_at ) VALUES ( 33, 18, 'https://fastly.picsum.photos/id/11/2500/1667.jpg?hmac=xxjFJtAPgshYkysU_aqx2sZir-kIOjNR9vx0te7GycQ', '2024-05-04 11.45.02 pm', '2024-05-04 11.45.02 pm');
INSERT INTO techmavericks_webcup.photo_produit( id, id_produit, url, created_at, updated_at ) VALUES ( 34, 18, 'https://fastly.picsum.photos/id/16/2500/1667.jpg?hmac=uAkZwYc5phCRNFTrV_prJ_0rP0EdwJaZ4ctje2bY7aE', '2024-05-04 11.45.02 pm', '2024-05-04 11.45.02 pm');
INSERT INTO techmavericks_webcup.photo_produit( id, id_produit, url, created_at, updated_at ) VALUES ( 35, 18, 'https://fastly.picsum.photos/id/17/2500/1667.jpg?hmac=HD-JrnNUZjFiP2UZQvWcKrgLoC_pc_ouUSWv8kHsJJY', '2024-05-04 11.45.02 pm', '2024-05-04 11.45.02 pm');