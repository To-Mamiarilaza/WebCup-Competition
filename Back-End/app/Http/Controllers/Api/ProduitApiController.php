<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Produit;
use Illuminate\Http\Request;

class ProduitApiController extends Controller
{
    public function newVente(Request $request)
    {
        $validatedData = $request->validate([
            'nom_produit' => 'required|string',
            'prix' => 'required|numeric',
            'id_categorie' => 'required|integer',
            'condition' => 'required|integer',
            'description' => 'required|string',
            'pays' => 'required|integer',
            'ville' => 'required|integer',
            'images' => 'nullable|array',
            'images.*' => 'url',
        ]);
        $vente = new Produit();
        $vente->titre = $validatedData['nom_produit'];
        $vente->prix = $validatedData['prix'];
        $vente->id_categorie = $validatedData['id_categorie'];
        $vente->id_condition = $validatedData['condition'];
        $vente->description = $validatedData['description'];
        $vente->id_localisation = $validatedData['ville'];

        $vente->id_etat = 0;
        
        // Save the vente instance to the database
        $vente->save();

        // Handle images
        if (isset($validatedData['images'])) {
            // Attach images to the vente instance
            $vente->images()->createMany(array_map(function($url) {
                return ['url' => $url];
            }, $validatedData['images']));
        }

        // Return a success response
        return response()->json(['message' => 'Vente created successfully'], 201);
    }   
}
