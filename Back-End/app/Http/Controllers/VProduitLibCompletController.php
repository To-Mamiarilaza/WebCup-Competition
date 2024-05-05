<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Categorie;
use App\Models\VProduitLibComplet;

class VProduitLibCompletController extends Controller
{

    public function __construct()
    {
        $this->middleware('utilisateur.session');
    }

    public function index()
    {
        $produits = VProduitLibComplet::where('etat', 'Non validee')->get();
        return view('vente.index', compact('produits'));
    }

    public function details($id)
    {
        $produit = VProduitLibComplet::with('photos')->findOrFail($id);
        return view('vente.details', compact('produit'));
    }
}
