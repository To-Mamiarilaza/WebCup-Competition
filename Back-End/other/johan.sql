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

