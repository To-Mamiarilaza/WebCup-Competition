<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\VProduitLibComplet;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

use Exception;

class VProduitLibCompletApiController extends Controller
{
    public function index()
    {
        try {
            $vProduitLibComplets = VProduitLibComplet::all();
        } catch (Exception $ex) {
            return response()->json(["message" => "Erreur lors de la récupération des produits."], 400);
        }
        return response()->json(['vProduitLibComplets' => $vProduitLibComplets], 200);
    }

    public function currentUserProduits(Request $request)
    {
        try {
            $minPrice = $request->input('min_price');
            $maxPrice = $request->input('max_price');
            $categories = $request->input('categorie');
            $conditions = $request->input('condit');
            $ville = $request->input('ville');
            $pays = $request->input('pays');
            $page = $request->input('page', 1);
            $produits = VProduitLibComplet::where('etat', 'En vente')
                ->where('prix', '>=', $minPrice)
                ->where('prix', '<=', $maxPrice)
                ->whereIn('id_categorie', $categories)
                ->whereIn('id_condition', $conditions)
                ->where('id_ville', $ville)
                ->where('id_pays', $pays)
                ->paginate(2);
            return response()->json($produits);
        } catch (Exception $ex) {
            return response()->json(["message" => "Erreur lors de la récupération des produits de l'utilisateur."], 400);
        }
    }

    public function rechercheProduits(Request $request)
    {
        try {
            $cle = $request->input('cle');
            $page = $request->input('page', 1);
            $produits = VProduitLibComplet::select('v_produit_lib_complet.*', DB::raw('(SELECT url FROM photo_produit WHERE photo_produit.id_produit = v_produit_lib_complet.id LIMIT 1) as photo_url'))
                ->where('etat', 'En vente')
                ->where('titre', 'like', '%' . $cle . '%')->paginate(10);
            return response()->json($produits);
        } catch (Exception $ex) {
            return response()->json(["message" => "Erreur lors de la recherche des produits."], 400);
        }
    }

    public function produit($id)
    {
        try {
            $produit = VProduitLibComplet::find($id);
            if (!$produit) {
                return response()->json(['error' => 'Produit non trouvé'], 404);
            }
            return response()->json($produit);
        } catch (Exception $ex) {
            return response()->json(["message" => "Erreur lors de la récupération du produit."], 400);
        }
    }

    public function relatedProduits($id_produit)
    {
        try {
            $product = VProduitLibComplet::find($id_produit);
            if (!$product) {
                return response()->json(['error' => 'Product not found'], 404);
            }
            $relatedProducts = VProduitLibComplet::where('id_categorie', $product->id_categorie)
                ->where('id', '!=', $product->id)
                ->limit(4)
                ->get();
            return response()->json($relatedProducts);
        } catch (Exception $ex) {
            return response()->json(["message" => "Erreur lors de la recherche des produits similaires."], 400);
        }
    }
}
