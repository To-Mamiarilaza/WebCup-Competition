<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Categorie;

class CategorieController extends Controller
{

    public function __construct()
    {
        $this->middleware('utilisateur.session');
    }

    public function index()
    {
        $categories = Categorie::all();
        return view('categorie.index', compact('categories'));
    }

    public function store(Request $request)
    {
        Categorie::create($request->only('nom'));
        return redirect('/categories')->with('success', 'Category created successfully.');
    }

    public function destroy(Categorie $categorie)
    {
        $categorie->delete();
        return redirect('/categories')->with('success', 'Category deleted successfully.');
    }
}
