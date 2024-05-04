<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Ville;
use Exception;

class VilleApiController extends Controller
{
    public function index()
    {
        try {
            $villes = Ville::all();
        } catch (Exception $ex) {
            return response()->json(["message" => "Erreur lors de la récupération des villes."], 400);
        }
        return response()->json(['villes' => $villes], 200);
    }
}
