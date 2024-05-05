<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Categorie;
use App\Models\VProduitLibComplet;
use App\Models\Produit;

class ProduitController extends Controller
{

    public function __construct()
    {
        $this->middleware('utilisateur.session');
    }

    public function venteValider($id)
    {
        $produit = Produit::findOrFail($id);
        $produit->id_etat = 10;
        $produit->save();
        return redirect('/nouvelle_ventes');
    }

    public function venteRefuser($id)
    {
        $produit = Produit::findOrFail($id);
        $produit->id_etat = 15;
        $produit->save();
        return redirect('/nouvelle_ventes');
    }
}
