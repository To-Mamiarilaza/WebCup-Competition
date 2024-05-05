<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Categorie;
use App\Models\PhotoProduit;
use App\Models\VProduitLibComplet;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class DetailProduitApiController extends Controller
{
    public function index($id)
    {
        try {
            $produit = VProduitLibComplet::find($id);
            if (!$produit) {
                return response()->json(['error' => 'Produit non trouvé'], 404);
            }
            $produitPhotos = PhotoProduit::where('id_produit', $produit->id)->get();
            $relatedProduits = VProduitLibComplet::select('v_produit_lib_complet.*', DB::raw('(SELECT url FROM photo_produit WHERE photo_produit.id_produit = v_produit_lib_complet.id LIMIT 1) as photo_url'))
                ->where('id_categorie', $produit->id_categorie)
                ->where('id', '!=', $produit->id)
                ->limit(4)
                ->get();
            return response()->json(['produit' => $produit, 'produitPhotos' => $produitPhotos, 'relatedProduits' => $relatedProduits]);
        } catch (Exception $ex) {
            return response()->json(['message' => $ex->getMessage()], 401);
        }
    }
}
