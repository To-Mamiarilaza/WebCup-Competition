<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Produit;
use App\Models\PhotoProduit;
use Illuminate\Support\Facades\Validator;
use Exception;

use Illuminate\Http\Request;

class ProduitApiController extends Controller
{

    public function newVente(Request $request)
    {
        $rules = [
            'nom_produit' => 'required|string',
            'prix' => 'required|numeric',
            'id_categorie' => 'required|integer',
            'condition' => 'required|integer',
            'description' => 'required|string',
            'pays' => 'required|integer',
            'ville' => 'required|integer',
            'images' => 'required|array',
            'images.*' => 'url',
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }
        $vente = new Produit();
        $vente->titre = $request->nom_produit;
        $vente->prix = $request->prix;
        $vente->id_categorie = $request->id_categorie;
        $vente->id_condition = $request->condition;
        $vente->description = $request->description;
        $vente->id_localisation = $request->ville;
        $vente->id_etat = 0;
        $vente->id_utilisateur = $request->id_user;
        $vente->save();
        if ($request->has('images')) {
            foreach ($request->images as $url) {
                $photoProduit = new PhotoProduit();
                $photoProduit->id_produit = $vente->id;
                $photoProduit->url = $url;
                $photoProduit->save();
            }
        }
        return response()->json(['message' => 'Vente created successfully'], 201);
    }
}
