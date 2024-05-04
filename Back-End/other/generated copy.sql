CREATE SCHEMA techmavericks_webcup;

CREATE  TABLE techmavericks_webcup.categorie ( 
	id                   INT  NOT NULL   AUTO_INCREMENT  PRIMARY KEY,
	nom                  VARCHAR(255)  NOT NULL     ,
	created_at           TIMESTAMP       ,
	updated_at           TIMESTAMP       ,
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
CREATE  TABLE techmavericks_webcup.failed_jobs ( 
	id                   BIGINT UNSIGNED NOT NULL   AUTO_INCREMENT  PRIMARY KEY,
	uuid                 VARCHAR(255)  NOT NULL     ,
	connection           TEXT  NOT NULL     ,
	queue                TEXT  NOT NULL     ,
	payload              LONGTEXT  NOT NULL     ,
	exception            LONGTEXT  NOT NULL     ,
	failed_at            TIMESTAMP  NOT NULL DEFAULT (current_timestamp())    ,
	CONSTRAINT failed_jobs_uuid_unique UNIQUE ( uuid ) 
 );
CREATE  TABLE techmavericks_webcup.migrations ( 
	id                   INT UNSIGNED NOT NULL   AUTO_INCREMENT  PRIMARY KEY,
	migration            VARCHAR(255)  NOT NULL     ,
	batch                INT  NOT NULL     
 );
CREATE  TABLE techmavericks_webcup.mode_paiement ( 
	id                   INT  NOT NULL   AUTO_INCREMENT  PRIMARY KEY,
	nom                  VARCHAR(255)       ,
	created_at           TIMESTAMP       ,
	updated_at           TIMESTAMP       
 );
CREATE  TABLE techmavericks_webcup.password_resets ( 
	email                VARCHAR(255)  NOT NULL     ,
	token                VARCHAR(255)  NOT NULL     ,
	created_at           TIMESTAMP       
 );
CREATE INDEX password_resets_email_index ON techmavericks_webcup.password_resets ( email );

CREATE  TABLE techmavericks_webcup.pays ( 
	id                   INT  NOT NULL   AUTO_INCREMENT  PRIMARY KEY,
	nom                  VARCHAR(255)  NOT NULL     ,
	created_at           TIMESTAMP       ,
	updated_at           TIMESTAMP       
 );
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
 );
CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON techmavericks_webcup.personal_access_tokens ( tokenable_type, tokenable_id );

CREATE  TABLE techmavericks_webcup.type_transaction ( 
	id                   INT  NOT NULL     PRIMARY KEY,
	nom                  VARCHAR(255)       ,
	created_at           TIMESTAMP       ,
	updated_at           TIMESTAMP       
 );
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
INSERT INTO techmavericks_webcup.mode_paiement( id, nom, created_at, updated_at ) VALUES ( 4, 'Mobile Money', null, null);
INSERT INTO techmavericks_webcup.mode_paiement( id, nom, created_at, updated_at ) VALUES ( 5, 'Paypal', null, null);
INSERT INTO techmavericks_webcup.pays( id, nom, created_at, updated_at ) VALUES ( 1, 'Madagascar', null, null);
INSERT INTO techmavericks_webcup.pays( id, nom, created_at, updated_at ) VALUES ( 2, 'Maurice', null, null);
INSERT INTO techmavericks_webcup.pays( id, nom, created_at, updated_at ) VALUES ( 3, 'Seychelles', null, null);
INSERT INTO techmavericks_webcup.pays( id, nom, created_at, updated_at ) VALUES ( 4, 'La Reunion', null, null);
INSERT INTO techmavericks_webcup.utilisateur( id, nom, mdp, privilege ) VALUES ( 1, 'techmavericks', 'rollback001', 'admin');
INSERT INTO techmavericks_webcup.ville( id, nom, id_pays, created_at, updated_at ) VALUES ( 1, 'Antananarivo', 1, null, null);
INSERT INTO techmavericks_webcup.ville( id, nom, id_pays, created_at, updated_at ) VALUES ( 2, 'Toamasina', 1, null, null);
INSERT INTO techmavericks_webcup.ville( id, nom, id_pays, created_at, updated_at ) VALUES ( 3, 'Port Louis', 2, null, null);
INSERT INTO techmavericks_webcup.ville( id, nom, id_pays, created_at, updated_at ) VALUES ( 4, 'Beau Bassin-Rose Hill', 2, null, null);
INSERT INTO techmavericks_webcup.ville( id, nom, id_pays, created_at, updated_at ) VALUES ( 5, 'Saint-Denis', 3, null, null);
INSERT INTO techmavericks_webcup.ville( id, nom, id_pays, created_at, updated_at ) VALUES ( 6, 'Saint-Paul', 3, null, null);
INSERT INTO techmavericks_webcup.ville( id, nom, id_pays, created_at, updated_at ) VALUES ( 7, 'Victoria', 4, null, null);
INSERT INTO techmavericks_webcup.ville( id, nom, id_pays, created_at, updated_at ) VALUES ( 8, 'Anse Boileau', 4, null, null);