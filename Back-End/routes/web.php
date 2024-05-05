<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return redirect('/login');
});

use App\Http\Controllers\UtilisateurController;

Route::get('/login', [UtilisateurController::class, 'showLoginForm']);
Route::post('/login', [UtilisateurController::class, 'login']);

use App\Http\Controllers\CategorieController;
use App\Http\Controllers\ProduitController;
use App\Http\Controllers\VProduitLibCompletController;

Route::get('/categories', [CategorieController::class, 'index'])->name('categorie.index');
Route::post('/categories', [CategorieController::class, 'store']);
Route::get('/categories/{category}/edit', [CategorieController::class, 'edit'])->name('categories.edit');
Route::post('/categories/{category}', [CategorieController::class, 'update'])->name('categories.update');

Route::get('/nouvelle_ventes', [VProduitLibCompletController::class, 'index'])->name('nouvelle_ventes');
Route::get('/produits/{id}', [VProduitLibCompletController::class, 'details'])->name('produit.details');
Route::get('/vente-valider/{id}', [ProduitController::class, 'venteValider'])->name('vente.valider');
Route::get('/vente-refuser/{id}', [ProduitController::class, 'venteRefuser'])->name('vente.refuser');


Route::get('/logout', [UtilisateurController::class, 'logout'])->name('logout');




