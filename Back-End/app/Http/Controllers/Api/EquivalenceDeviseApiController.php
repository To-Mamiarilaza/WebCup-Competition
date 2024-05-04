<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\EquivalenceDevise;

class EquivalenceDeviseApiController extends Controller
{
    public function index()
    {
        $equivalenceDevises = EquivalenceDevise::all();
        return response()->json(['equivalenceDevises' => $equivalenceDevises], 200);
    }
}
