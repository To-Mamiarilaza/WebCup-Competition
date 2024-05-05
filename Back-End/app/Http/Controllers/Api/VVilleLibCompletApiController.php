<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\VVilleLibComplet;

class VVilleLibCompletApiController extends Controller
{
    public function index()
    {
        $vVilleLibComplets = VVilleLibComplet::all();
        return response()->json(['vVilleLibComplets' => $vVilleLibComplets], 200);
    }
}
