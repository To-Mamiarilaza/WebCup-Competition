<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Pays;

class PaysApiController extends Controller
{
    public function index()
    {
        $pays = Pays::all();
        return response()->json(['pays' => $pays], 200);
    }
}
