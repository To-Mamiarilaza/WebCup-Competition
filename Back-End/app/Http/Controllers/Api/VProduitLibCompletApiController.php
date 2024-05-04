<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\VProduitLibComplet;

class VProduitLibCompletApiController extends Controller
{
    public function index()
    {
        $vProduitLibComplets = VProduitLibComplet::all();
        return response()->json(['vProduitLibComplets' => $vProduitLibComplets], 200);
    }
}
