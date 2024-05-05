export interface UserTransaction {
    id_utilisateur: number,
    id_type: number,
    id_produit: number,
    prix: number,
    id_utilisateur_tiers: number,
    id_etat: number,
    nom: string,
    name: string,
    titre_produit: string,
    created_at: Date,
    updated_at: Date,
}