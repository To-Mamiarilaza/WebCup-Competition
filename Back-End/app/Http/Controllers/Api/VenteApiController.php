<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Produit;
use App\Models\VProduitLibComplet;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class VenteApiController extends Controller
{
    public function historiqueVente(Request $request)
    {
        try{
            $id_user = $request->id_user;
            $vProduitLibComplets = VProduitLibComplet::where("id_utilisateur",$id_user)->orderBy("id","desc")->get();
            return response()->json([$vProduitLibComplets], 200);
        }catch(Exception $ex){
            Log::info($ex->getMessage());
            return response()->json(["message" => "Erreur lors de la récupération de l' historique des ventes."], 400);
        }
    }

    public function annulerVente(Request $request)
    {
        try{
            $id_produit = $request->id_produit;
            $produit = Produit::find($id_produit);
            if ($produit) {
                $produit->id_etat = 30;
                $produit->save();
            }
            return response()->json([$produit], 200);
        }catch(Exception $ex){
            Log::info($ex->getMessage());
            return response()->json(["message"=> "L` annulation a été refusé"], 400);
        }
    }
}
