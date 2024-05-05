<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Categorie;
use App\Models\VProduitLibComplet;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use App\Models\ConditionProduit;
use App\Models\Pays;
use App\Models\Ville;

class ListeProduitApiController extends Controller
{
    public function index()
    {
        try {
            $categories = Categorie::all();
            $conditionProduits = ConditionProduit::all();
            $pays = Pays::all();
            $villes = Ville::all();
            $produits = VProduitLibComplet::select('v_produit_lib_complet.*', DB::raw('(SELECT url FROM photo_produit WHERE photo_produit.id_produit = v_produit_lib_complet.id LIMIT 1) as photo_url'))
                ->where('etat', 'En vente')
                ->paginate(8);
            return response()->json([
                'categories' => $categories,
                'conditionProduits' => $conditionProduits,
                'pays' => $pays,
                'villes' => $villes,
                'produits' => $produits
            ]);
        } catch (Exception $ex) {
            return response()->json(['message' => $ex->getMessage()], 401);
        }
    }

    public function filtre(Request $request)
    {
        try {
            $minPrice = $request->input('min_price');
            $maxPrice = $request->input('max_price');
            $categories = $request->input('categorie');
            $conditions = $request->input('condit');
            $ville = $request->input('ville');
            $pays = $request->input('pays');
            $page = $request->input('page', 1);
            $produits = VProduitLibComplet::select('v_produit_lib_complet.*', DB::raw('(SELECT url FROM photo_produit WHERE photo_produit.id_produit = v_produit_lib_complet.id LIMIT 1) as photo_url'))
                ->where('etat', 'En vente')
                ->where('prix', '>=', $minPrice)
                ->where('prix', '<=', $maxPrice)
                ->whereIn('id_categorie', $categories)
                ->whereIn('id_condition', $conditions)
                ->where('id_ville', $ville)
                ->where('id_pays', $pays)
                ->paginate(8);
            return response()->json($produits);
        } catch (Exception $ex) {
            return response()->json(['message' => $ex->getMessage()], 401);
        }
    }
}
