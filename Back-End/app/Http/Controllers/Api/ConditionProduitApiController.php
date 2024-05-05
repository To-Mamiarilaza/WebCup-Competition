<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\ConditionProduit;
use Exception;

class ConditionProduitApiController extends Controller
{
    public function index()
    {
        try {
            $conditionProduits = ConditionProduit::all();
            return response()->json(['conditionProduits' => $conditionProduits], 200);
        } catch (Exception $ex) {
            return response()->json(["message" => "Erreur lors de la récupération des conditions de produit."], 400);
        }
    }
}
