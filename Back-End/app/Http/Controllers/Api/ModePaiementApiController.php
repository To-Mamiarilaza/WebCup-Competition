<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\ModePaiement;

class ModePaiementApiController extends Controller
{
    public function index()
    {
        $modePaiements = ModePaiement::all();
        return response()->json(['modePaiements' => $modePaiements], 200);
    }
}
