<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\ModePaiement;
use Exception;

class ModePaiementApiController extends Controller
{
    public function index()
    {
        try{
            $paiement = ModePaiement::all();
        }catch(Exception $ex){
            return response()->json(["message"=> "Erreur lors de la récupération des modes de paiements."], 400);
        }
        return response()->json($paiement);
    }
}
