<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\ConditionProduit;

class ConditionProduitApiController extends Controller
{
    public function index()
    {
        $conditionProduits = ConditionProduit::all();
        return response()->json(['conditionProduits' => $conditionProduits], 200);
    }
}
