<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\EquivalenceDevise;
use Exception;

class EquivalenceDeviseApiController extends Controller
{
    public function index()
    {
        try{
            $pays = EquivalenceDevise::all();
        }catch(Exception $ex){
            return response()->json(["message"=> "Erreur lors de la récupération des devises."], 400);
        }
        return response()->json($pays);
    }
}
