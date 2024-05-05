-- 0 : user
-- 1 : admin
create view v_reste_jeton_par_utilisateur as(
    select ufo.id, sum(COALESCE(tj.valeur, 0)) as reste
        from transaction_jeton  tj
        RIGHT join utilisateur_front_office ufo on tj.id_utilisateur = ufo.id
        group by ufo.id
);

-- ETAT TRANSACTION

INSERT INTO techmavericks_webcup.etat_transaction
	( id, nom) VALUES
    ( 0, 'Crée' ),
    ( 1, 'Livré' ),
    ( 2, 'Bien reçu' );


create view v_transaction as(
    select t.*, tt.nom, ut.name, p.titre as titre_produit
        from transaction t
        join utilisateur_front_office ut on t.id_utilisateur_tiers = ut.id
        join produit p on p.id = t.id_produit
        join type_transaction tt on tt.id = t.id_type
);


-- DATA
INSERT INTO techmavericks_webcup.categorie( nom, created_at, updated_at ) VALUES ( 'Vehicule', null, null);
INSERT INTO techmavericks_webcup.categorie( nom, created_at, updated_at ) VALUES ( 'Vetement', null, null);
INSERT INTO techmavericks_webcup.categorie( nom, created_at, updated_at ) VALUES ( 'Sport', null, null);
INSERT INTO techmavericks_webcup.categorie( nom, created_at, updated_at ) VALUES ( 'Technologie', null, null);
INSERT INTO techmavericks_webcup.condition_produit( nom, created_at, updated_at ) VALUES ( 'Nouveau', null, null);
INSERT INTO techmavericks_webcup.condition_produit( nom, created_at, updated_at ) VALUES ( 'Occasion', null, null);
INSERT INTO techmavericks_webcup.condition_produit( nom, created_at, updated_at ) VALUES ( 'Rarement utilise', null, null);
INSERT INTO techmavericks_webcup.equivalence_devise( nom, valeur, created_at, updated_at ) VALUES ( 'USD', 1.0, null, null);
INSERT INTO techmavericks_webcup.equivalence_devise( nom, valeur, created_at, updated_at ) VALUES ( 'EUR', 0.85, null, null);
INSERT INTO techmavericks_webcup.equivalence_devise( nom, valeur, created_at, updated_at ) VALUES ( 'GBP', 0.75, null, null);
INSERT INTO techmavericks_webcup.equivalence_devise( nom, valeur, created_at, updated_at ) VALUES ( 'JPY', 110.0, null, null);
INSERT INTO techmavericks_webcup.equivalence_devise( nom, valeur, created_at, updated_at ) VALUES ( 'AUD', 0.65, null, null);
INSERT INTO techmavericks_webcup.etat_produit( id, nom, created_at, updated_at ) VALUES ( 0, 'Non validee', null, null);
INSERT INTO techmavericks_webcup.etat_produit( id, nom, created_at, updated_at ) VALUES ( 10, 'Validee', null, null);
INSERT INTO techmavericks_webcup.etat_produit( id, nom, created_at, updated_at ) VALUES ( 20, 'En vente', null, null);
INSERT INTO techmavericks_webcup.etat_produit( id, nom, created_at, updated_at ) VALUES ( 30, 'Indisponible', null, null);
INSERT INTO techmavericks_webcup.etat_produit( id, nom, created_at, updated_at ) VALUES ( 40, 'Vendu', null, null);
INSERT INTO techmavericks_webcup.etat_transaction( id, nom, created_at, updated_at ) VALUES ( 0, 'Crée', null, null);
INSERT INTO techmavericks_webcup.etat_transaction( id, nom, created_at, updated_at ) VALUES ( 1, 'Livré', null, null);
INSERT INTO techmavericks_webcup.etat_transaction( id, nom, created_at, updated_at ) VALUES ( 2, 'Bien reçu', null, null);
INSERT INTO techmavericks_webcup.migrations( migration, batch ) VALUES ( '2014_10_12_000000_create_users_table', 1);
INSERT INTO techmavericks_webcup.migrations( migration, batch ) VALUES ( '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO techmavericks_webcup.migrations( migration, batch ) VALUES ( '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO techmavericks_webcup.migrations( migration, batch ) VALUES ( '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO techmavericks_webcup.migrations( migration, batch ) VALUES ( '2024_05_04_110347_add_timestamps_to_tables', 1);
INSERT INTO techmavericks_webcup.migrations( migration, batch ) VALUES ( '2024_05_04_110347_add_timestamps_to_tables copy', 2);
INSERT INTO techmavericks_webcup.mode_paiement( nom, created_at, updated_at ) VALUES ( 'Telma', null, null);
INSERT INTO techmavericks_webcup.mode_paiement( nom, created_at, updated_at ) VALUES ( 'Orange', null, null);
INSERT INTO techmavericks_webcup.mode_paiement( nom, created_at, updated_at ) VALUES ( 'Airtel', null, null);
INSERT INTO techmavericks_webcup.pays( nom, created_at, updated_at ) VALUES ( 'Madagascar', null, null);
INSERT INTO techmavericks_webcup.pays( nom, created_at, updated_at ) VALUES ( 'Maurice', null, null);
INSERT INTO techmavericks_webcup.pays( nom, created_at, updated_at ) VALUES ( 'Seychelles', null, null);
INSERT INTO techmavericks_webcup.pays( nom, created_at, updated_at ) VALUES ( 'La Reunion', null, null);
INSERT INTO techmavericks_webcup.type_transaction( id, nom, created_at, updated_at ) VALUES ( 0, 'Vente', null, null);
INSERT INTO techmavericks_webcup.type_transaction( id, nom, created_at, updated_at ) VALUES ( 1, 'Achat', null, null);
INSERT INTO techmavericks_webcup.utilisateur( nom, mdp, privilege ) VALUES ( 'techmavericks', 'rollback001', 'admin');
INSERT INTO techmavericks_webcup.utilisateur_front_office( email, telephone, avatar, name, password, profile, created_at, updated_at ) VALUES ( 'user1@mail.com', '0323245665', '', 'user1', 'user1', 0, null, null);
INSERT INTO techmavericks_webcup.utilisateur_front_office( email, telephone, avatar, name, password, profile, created_at, updated_at ) VALUES ( 'logan@gmail.com', '0341122233', 'https://exemple.com/avatar.jpg', 'Lo', '$2y$10$vVgkm5f207ZYodE5cb2Iq.dB.FAMoEaJbUFDVNhT1haFYsiAjWCD.', 0, null, null);
INSERT INTO techmavericks_webcup.utilisateur_front_office( email, telephone, avatar, name, password, profile, created_at, updated_at ) VALUES ( 'johan@gmail.com', '0341122233', 'https://exemple.com/avatar.jpg', 'Jo', '$2y$10$kSiYt.wfpN9N0/52BWBWUev17WQ9Ztg9WUwpxsthsP9/2jg8MO30e', 0, null, null);
INSERT INTO techmavericks_webcup.ville( nom, id_pays, created_at, updated_at ) VALUES ( 'Antananarivo', 1, null, null);
INSERT INTO techmavericks_webcup.ville( nom, id_pays, created_at, updated_at ) VALUES ( 'Toamasina', 1, null, null);
INSERT INTO techmavericks_webcup.ville( nom, id_pays, created_at, updated_at ) VALUES ( 'Port Louis', 2, null, null);
INSERT INTO techmavericks_webcup.ville( nom, id_pays, created_at, updated_at ) VALUES ( 'Beau Bassin-Rose Hill', 2, null, null);
INSERT INTO techmavericks_webcup.ville( nom, id_pays, created_at, updated_at ) VALUES ( 'Saint-Denis', 3, null, null);
INSERT INTO techmavericks_webcup.ville( nom, id_pays, created_at, updated_at ) VALUES ( 'Saint-Paul', 3, null, null);
INSERT INTO techmavericks_webcup.ville( nom, id_pays, created_at, updated_at ) VALUES ( 'Victoria', 4, null, null);
INSERT INTO techmavericks_webcup.ville( nom, id_pays, created_at, updated_at ) VALUES ( 'Anse Boileau', 4, null, null);
INSERT INTO techmavericks_webcup.produit( titre, description, prix, id_etat, id_condition, id_localisation, id_categorie, id_utilisateur, created_at, updated_at ) VALUES ( 'Samsung Galaxy S20', 'Smartphone haut de gamme avec un ecran AMOLED de 6.2 pouces, un processeur puissant et un systeme de camera triple.', 799.99, 0, 1, 1, 1, 1, null, null);
INSERT INTO techmavericks_webcup.produit( titre, description, prix, id_etat, id_condition, id_localisation, id_categorie, id_utilisateur, created_at, updated_at ) VALUES ( 'Velo de montagne tout suspendu', 'Velo de montagne tout suspendu avec cadre en aluminium, suspension a double pivot et freins a disque hydrauliques.', 1499.99, 10, 1, 1, 2, 1, null, null);
INSERT INTO techmavericks_webcup.produit( titre, description, prix, id_etat, id_condition, id_localisation, id_categorie, id_utilisateur, created_at, updated_at ) VALUES ( 'Chemise en lin pour homme', 'Chemise en lin legere et respirante, parfaite pour les journees chaudes. Disponible en plusieurs couleurs et tailles.', 49.99, 30, 1, 1, 3, 1, null, '2024-05-04 07.10.02 PM');
INSERT INTO techmavericks_webcup.produit( titre, description, prix, id_etat, id_condition, id_localisation, id_categorie, id_utilisateur, created_at, updated_at ) VALUES ( 'Harry Potter et la pierre philosophale', 'Premier livre de la serie Harry Potter ecrit par J.K. Rowling. Un classique de la litterature fantastique pour tous les ages.', 12.99, 30, 2, 1, 4, 1, null, null);
INSERT INTO techmavericks_webcup.produit( titre, description, prix, id_etat, id_condition, id_localisation, id_categorie, id_utilisateur, created_at, updated_at ) VALUES ( 'Refrigerateur ? deux portes', 'Refrigerateur spacieux avec congelateur superieur, parfait pour stocker les aliments frais et surgeles.', 799.99, 40, 2, 1, 1, 1, null, null);
INSERT INTO techmavericks_webcup.produit( titre, description, prix, id_etat, id_condition, id_localisation, id_categorie, id_utilisateur, created_at, updated_at ) VALUES ( 'Nikon D850 Appareil photo reflex numerique', 'Appareil photo reflex numerique professionnel avec un capteur haute resolution de 45.7 MP et un systeme AF ultra-precis.', 2499.99, 30, 3, 1, 2, 1, null, '2024-05-04 09.02.46 PM');
INSERT INTO techmavericks_webcup.tokens( id_user, token, created_at, updated_at ) VALUES ( 2, '2FmaZ6hC8zmDnmnzGvqkHccIE9peTHD0rHNiEpWpdIohpzKcTiAmC80CN4MI', null, null);
INSERT INTO techmavericks_webcup.tokens( id_user, token, created_at, updated_at ) VALUES ( 2, 'J4pfMhcPhOz1O1h8Rmy3bbkMh2ADHTyXF7n9qHyNh3RKDui24vJIHGfJL3O3', null, null);
INSERT INTO techmavericks_webcup.tokens( id_user, token, created_at, updated_at ) VALUES ( 2, '98jqgLqfszDQNvgc9aZoeHVplJjLyOYeHYNELskWX0Cze0AE5x9kmC232BRP', null, null);
INSERT INTO techmavericks_webcup.tokens( id_user, token, created_at, updated_at ) VALUES ( 2, '2Piw3w0xBL8aQYpd2Jgd8jBgJnKsIjJgmnfAKpUrOPnG2Xmy8PuILJOZGWGn', null, null);
INSERT INTO techmavericks_webcup.tokens( id_user, token, created_at, updated_at ) VALUES ( 2, 'b0wwHtHvLYDPGyeJgCKy5YonrTgasTt3gaGAVWRT24UUxPfzArWi50W8w60u', null, null);
INSERT INTO techmavericks_webcup.tokens( id_user, token, created_at, updated_at ) VALUES ( 2, 'Ye16jFbj40am3Swj9bRdAgqMdPVV55EA8t2N40C4YwWhowP7HyvisDfFTmUL', null, null);
INSERT INTO techmavericks_webcup.tokens( id_user, token, created_at, updated_at ) VALUES ( 2, '1YnK8uJYaW0CvxWAyakf7t6gnkQyDlUG6DIggffyBUV9rVHkgVCiGrr4ElnK', null, null);
INSERT INTO techmavericks_webcup.transaction( id_utilisateur, id_type, id_produit, prix, id_utilisateur_tiers, id_etat, created_at, updated_at ) VALUES ( 2, 1, 3, 49.99, 1, 0, '2024-05-04 07.10.01 PM', '2024-05-04 07.10.01 PM');
INSERT INTO techmavericks_webcup.transaction( id_utilisateur, id_type, id_produit, prix, id_utilisateur_tiers, id_etat, created_at, updated_at ) VALUES ( 1, 0, 3, 49.99, 2, 0, '2024-05-04 07.10.01 PM', '2024-05-04 07.10.01 PM');
INSERT INTO techmavericks_webcup.transaction_jeton( id_utilisateur, valeur, created_at, updated_at ) VALUES ( 2, 100.0, '2024-05-04 05.09.28 PM', '2024-05-04 05.09.28 PM');
INSERT INTO techmavericks_webcup.transaction_jeton( id_utilisateur, valeur, created_at, updated_at ) VALUES ( 2, -49.99, '2024-05-04 06.47.20 PM', '2024-05-04 06.47.20 PM');
INSERT INTO techmavericks_webcup.transaction_jeton( id_utilisateur, valeur, created_at, updated_at ) VALUES ( 1, 11.05, '2024-05-05 05.21.10 AM', '2024-05-05 05.21.10 AM');
INSERT INTO techmavericks_webcup.photo_produit( id_produit, url, created_at, updated_at ) VALUES ( 1, '', null, null);
INSERT INTO techmavericks_webcup.photo_produit( id_produit, url, created_at, updated_at ) VALUES ( 2, '', null, null);
INSERT INTO techmavericks_webcup.photo_produit( id_produit, url, created_at, updated_at ) VALUES ( 3, '', null, null);
INSERT INTO techmavericks_webcup.photo_produit( id_produit, url, created_at, updated_at ) VALUES ( 4, '', null, null);
INSERT INTO techmavericks_webcup.photo_produit( id_produit, url, created_at, updated_at ) VALUES ( 5, '', null, null);
INSERT INTO techmavericks_webcup.photo_produit( id_produit, url, created_at, updated_at ) VALUES ( 6, '', null, null);

