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

    public function edit(Categorie $category)
    {
        return view('categorie.edit', compact('category'));
    }

    public function update(Request $request, Categorie $category)
    {
        $category->update([
            'nom' => $request->input('nom'),
        ]);
        return redirect()->route('categorie.index')->with('success', 'Category updated successfully.');
    }
}
