<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Pays;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class TransactionApiController extends Controller
{
    public function userTransation(Request $request)
    {
        try{
            $id_user = $request->id_user;
            $result = DB::table('v_transaction')->where('id_utilisateur', $id_user)->paginate(5);
            return response()->json($result, 200);
        }catch(Exception $ex){
            Log::info($ex->getMessage());
            return response()->json(['message' => 'Erreur lors de la récupération des transactions de l` utilisateur'], 400);
        }
    }
}
