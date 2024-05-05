<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Categorie;
use App\Models\VProduitLibComplet;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class AcceuilApiController extends Controller
{
    public function index()
    {
        try {
            $categories = Categorie::all();
            $produits = VProduitLibComplet::select('v_produit_lib_complet.*', DB::raw('(SELECT url FROM photo_produit WHERE photo_produit.id_produit = v_produit_lib_complet.id LIMIT 1) as photo_url'))
                ->where('etat', 'En vente')
                ->take(4)
                ->get();
            return response()->json(['categories' => $categories, 'produits' => $produits]);
        } catch (Exception $ex) {
            return response()->json(['message' => $ex->getMessage()], 401);
        }
    }
}
