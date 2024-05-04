<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Utilisateur;

class UtilisateurController extends Controller
{

    public function showLoginForm(Request $request)
    {
        return view('utilisateur.login');
    }

    public function login(Request $request)
    {
        $credentials = $request->only('nom', 'mdp');
        $user = Utilisateur::where('nom', $credentials['nom'])->first();
        if ($user && $user->mdp === $credentials['mdp']) {
            $request->session()->put('user_id', $user->id);
            return redirect()->intended('/nouvelle_ventes');
        }
        return back()->withErrors(['message' => 'Nom d\'utilisateur ou mot de passe incorrect'])->withInput();
    }

    public function logout(Request $request)
    {
        $request->session()->flush();
        return redirect('/login');
    }
}
