<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Avatar;
use Illuminate\Support\Facades\Validator;
use Exception;
use Illuminate\Support\Facades\DB;


use Illuminate\Http\Request;

class AvatarApiController extends Controller
{
    public function index()
    {
        try {
            $avatars = Avatar::all();
        } catch (Exception $ex) {
            return response()->json(["message" => "Erreur lors de la récupération des avatars."], 400);
        }
        return response()->json(['avatars' => $avatars], 200);
    }

    public function changeAvatar(Request $request)
    {
        try {
            $url = $request->avatar_name;
            $id_utilisateur = $request->id_user;
            DB::table('utilisateur_front_office')
                ->where('id', $id_utilisateur)
                ->update(['avatar' => $url]);
            return response()->json(['message' => 'Avatar mis à jour avec succès'], 200);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Erreur lors de la mise à jour de l\'avatar'], 500);
        }
    }
}
