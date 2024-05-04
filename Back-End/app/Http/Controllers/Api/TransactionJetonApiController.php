<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\TransactionJeton;
use Exception;
use Illuminate\Http\Request;


class TransactionJetonApiController extends Controller
{
    public function store(Request $request)
    {
        try{
            $valeurDevise = $request->valeur_devise;
            $montant = $request->montant;
            $valeur = $montant / $valeurDevise;
            $user = new TransactionJeton([
                'id_utilisateur' => $request->id_user,
                'valeur' => $valeur,
            ]);
            $user->save();
            return response()->json(['message' => 'Jeton acheté.'], 201);

        }catch(Exception $ex){
            return response()->json(['message' => 'Erreur lors de l` achat de jeton'], 401);
        }
    }
}
