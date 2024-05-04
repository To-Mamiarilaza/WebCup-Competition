<?php

namespace App\Http\Controllers\Authentification;

use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use App\Models\UtilisateurFrontOffice;
use Exception;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function login(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);
        $credentials = $request->only('email', 'password');

        if (Auth::guard('utilisateur_front_office')->attempt($credentials)) {
            $token = $this->generateToken(Auth::guard('utilisateur_front_office')->user());
            return response()->json(['token' => $token], 200);
        }

        return response()->json(['error' => 'Email ou mot de passe incorrect'], 401);
    }

    public function generateToken($user)
    {
        $token = Str::random(60);

        DB::table('tokens')->insert([
            'id_user' => $user->id,
            'token' => $token,
        ]);

        return response()->json(['token' => $token], 200);
    }

    public function register(Request $request)
    {
        try{
            $user = new UtilisateurFrontOffice([
                'email' => $request->email,
                'telephone' => $request->telephone,
                'avatar' => $request->avatar,
                'name' => $request->name,
                'password' => Hash::make($request->password),
                'profile' => $request->profile,
            ]);
            $user->save();
            return response()->json(['message' => 'Utilisateur enregistré avec succès'], 201);

        }catch(Exception $ex){
            return response()->json(['message' => $ex], 201);
        }
    }

    public function test(){
        return response()->json(['Success'], 201);
    }


}
