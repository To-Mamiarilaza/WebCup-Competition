<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Categorie;

class CategorieApiController extends Controller
{
    public function index()
    {
        $categories = Categorie::all();
        return response()->json(['categories' => $categories], 200);
    }
}
