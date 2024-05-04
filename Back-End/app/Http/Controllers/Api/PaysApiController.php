<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Pays;
use Exception;

class PaysApiController extends Controller
{
    public function index()
    {
        try {
            $pays = Pays::all();
        } catch (Exception $ex) {
            return response()->json(["message" => "Erreur lors de la récupération des pays."], 400);
        }
        return response()->json(['pays' => $pays], 200);
    }
}
