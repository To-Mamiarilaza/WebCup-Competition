<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\UtilisateurFrontOffice;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class UtilisateurFrontOfficeApiController extends Controller
{

    public function utilisateur($id_utilisateur)
    {
        $user = UtilisateurFrontOffice::select('id', 'email', 'telephone', 'name', 'avatar', 'profile')
            ->find($id_utilisateur);
        if (!$user) {
            return response()->json(['error' => 'User not found'], 404);
        }
        return response()->json(['user' => $user], 200);
    }

    public function currentUtilisateur(Request $request)
    {
        $id_utilisateur = $request->id_user;    
        $user = UtilisateurFrontOffice::select('id', 'email', 'telephone', 'name', 'avatar', 'profile')
        ->find($id_utilisateur);
        if (!$user) {
            return response()->json(['error' => 'User not found'], 404);
        }
        return response()->json(['user' => $user], 200);
    }

    public function modifierProfil(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'telephone' => 'required',
            'name' => 'required',
            'password' => 'required|min:6',
            'confirm_password' => 'required|min:6|same:password',
            'avatar' => 'url'
        ]);

        $id_user = $request->id_user;

        $user = UtilisateurFrontOffice::find($id_user);
        if (!$user) {
            return response()->json(['error' => 'User not found'], 404);
        }

        $user->email = $request->input('email');
        $user->telephone = $request->input('telephone');
        $user->name = $request->input('name');
        $user->password = Hash::make($request->input('password'));
        $user->avatar = $request->input('avatar');
        $user->save();
        return response()->json(['message' => 'Profile updated successfully', 'user' => $user], 200);
    }
}
