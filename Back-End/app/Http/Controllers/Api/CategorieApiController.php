<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Categorie;
use Exception;

class CategorieApiController extends Controller
{
    public function index()
    {
        try {
            $categories = Categorie::all();
        } catch (Exception $ex) {
            return response()->json(["message" => "Erreur lors de la récupération des catégories."], 400);
        }
        return response()->json(['categories' => $categories], 200);
    }
}
