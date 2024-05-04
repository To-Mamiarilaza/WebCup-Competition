<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\VProduitLibComplet;
use Illuminate\Http\Request;


class VProduitLibCompletApiController extends Controller
{
    public function index()
    {
        $vProduitLibComplets = VProduitLibComplet::all();
        return response()->json(['vProduitLibComplets' => $vProduitLibComplets], 200);
    }

    public function currentUserProduits(Request $request)
    {
        $minPrice = $request->input('min_price');
        $maxPrice = $request->input('max_price');
        $categories = $request->input('categorie');
        $conditions = $request->input('condit');
        $ville = $request->input('ville');
        $pays = $request->input('pays');
        $page = $request->input('page', 1);
        $produits = VProduitLibComplet::where('prix', '>=', $minPrice)
            ->where('prix', '<=', $maxPrice)
            ->whereIn('id_categorie', $categories)
            ->whereIn('id_condition', $conditions)
            ->where('id_ville', $ville)
            ->where('id_pays', $pays)
            ->paginate(2);
        return response()->json($produits);
    }

    public function rechercheProduits(Request $request)
    {
        $cle = $request->input('cle');
        $page = $request->input('page', 1);
        $produits = VProduitLibComplet::where('titre', 'like', '%' . $cle . '%')->paginate(10);
        return response()->json($produits);
    }
}
