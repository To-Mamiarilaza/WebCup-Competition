<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Produit;
use App\Models\Transaction;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class AchatApiController extends Controller
{
    public function achat(Request $request)
    {
        try{
            $produit = Produit::find($request->id_produit);
            $this->peutAcheter($produit);

            $id_user = $request->id_user;
            $prix = $produit->prix;
            if($this->HasNecessaireJeton($id_user, $prix)){
                $this->AjoutDoubleTransaction($id_user, $produit);
                $this->setIndisponibleProduit($produit);
            }
            return response()->json(['message' => 'Achat en cours.'], 201);

        }catch(Exception $ex){
            Log::error($ex->getMessage());
            return response()->json(['message' => $ex->getMessage()], 401);
        }
    }

    public function HasNecessaireJeton($id_user, $valeur)
    {
        $reste = DB::table('v_reste_jeton_par_utilisateur')->where('id', $id_user)->first();

        if($reste){
            if($reste->reste >= $valeur){
                return true;
            }
        }

        return false;
    }

    public function AjoutDoubleTransaction($id_user, $produit){
        // 0 Vente
        // 1 Achat
        try{
            Transaction::create([
                'id_utilisateur' => $id_user,
                'id_type' => 1,
                'id_produit' => $produit->id,
                'prix' => $produit->prix,
                'id_utilisateur_tiers' => $produit->id_utilisateur,
                'id_etat' => 0,
            ]);
            Transaction::create([
                'id_utilisateur' => $produit->id_utilisateur,
                'id_type' => 0,
                'id_produit' => $produit->id,
                'prix' => $produit->prix,
                'id_utilisateur_tiers' => $id_user,
                'id_etat' => 0,
            ]);
        }catch(Exception $ex){
            throw $ex;
        }
    }

    public function setIndisponibleProduit($produit){
        try{
            $produit->id_etat = 30;
            $produit->save();
        }catch(Exception $ex){
            throw $ex;
        }
    }

    public function peutAcheter($produit){
        try{
            if($produit->id_etat <= 20){
                throw new Exception('Ce produit n` est pas encore en vente.');
            };
            if($produit->id_etat == 40){
                throw new Exception('Ce produit est déjà vendu.');
            };
        }catch(Exception $ex){
            throw $ex;
        }
    }

// select*from type_transaction;

// select*from utilisateur_front_office;

// select*from produit where id = 3;

// select*from transaction;

// delete from transaction;
}
