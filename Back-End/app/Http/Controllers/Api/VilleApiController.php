<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Ville;

class VilleApiController extends Controller
{
    public function index()
    {
        $villes = Ville::all();
        return response()->json(['villes' => $villes], 200);
    }
}
