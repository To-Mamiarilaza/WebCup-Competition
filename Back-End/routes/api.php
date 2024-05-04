<?php

use App\Http\Controllers\Api\TransactionJetonApiController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\CategorieApiController;
use App\Http\Controllers\Api\ConditionProduitApiController;
use App\Http\Controllers\Api\EquivalenceDeviseApiController;
use App\Http\Controllers\Api\ModePaiementApiController;
use App\Http\Controllers\Api\PaysApiController;
use App\Http\Controllers\Api\VilleApiController;
use App\Http\Controllers\Api\VProduitLibCompletApiController;
use App\Http\Controllers\Api\VVilleLibCompletApiController;
use App\Http\Controllers\Authentification\AuthController;
use App\Models\TransactionJeton;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('/categories', [CategorieApiController::class, 'index']);
Route::get('/condition-produit', [ConditionProduitApiController::class, 'index']);
Route::get('/pays', [PaysApiController::class, 'index']);
Route::get('/ville', [VilleApiController::class, 'index']);
Route::get('/v-produit-lib-complet', [VProduitLibCompletApiController::class, 'index']);
Route::get('/v-ville-lib-complet', [VVilleLibCompletApiController::class, 'index']);
Route::get('/current-user-produits', [VProduitLibCompletApiController::class, 'currentUserProduits']);
Route::get('/recherche-produits', [VProduitLibCompletApiController::class, 'rechercheProduits']);

Route::get('/produits/{id}', [VProduitLibCompletApiController::class, 'produit']);
Route::get('/related-produits/{id_produit}', [VProduitLibCompletApiController::class, 'relatedProduits']);












// Front office
Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);


Route::middleware(['checkUserToken'])->group(function () {
    Route::post('/test', [AuthController::class, 'test']);
    Route::get('/mode_paiements', [ModePaiementApiController::class, 'index']);
    Route::get('/equivalence_devises', [EquivalenceDeviseApiController::class, 'index']);
    Route::post('/transaction_jetons', [TransactionJetonApiController::class, 'store']); // valeur_devise, montant, id_user
    // Vos routes protégées par le token
});


