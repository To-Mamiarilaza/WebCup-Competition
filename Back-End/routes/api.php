<?php

use App\Http\Controllers\Api\AchatApiController;
use App\Http\Controllers\Api\AvatarApiController;
use App\Http\Controllers\Api\TransactionJetonApiController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\CategorieApiController;
use App\Http\Controllers\Api\ConditionProduitApiController;
use App\Http\Controllers\Api\EquivalenceDeviseApiController;
use App\Http\Controllers\Api\ModePaiementApiController;
use App\Http\Controllers\Api\PaysApiController;
use App\Http\Controllers\Api\TransactionApiController;
use App\Http\Controllers\Api\VenteApiController;
use App\Http\Controllers\Api\ProduitApiController;
use App\Http\Controllers\Api\UtilisateurFrontOfficeApiController;
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

Route::get('/mode-paiements', [ModePaiementApiController::class, 'index']);
Route::get('/devises', [EquivalenceDeviseApiController::class, 'index']);
Route::get('/avatars', [AvatarApiController::class, 'index']);
Route::get('/utilisateurs/{id_utilisateur}', [UtilisateurFrontOfficeApiController::class, 'utilisateur']);



// Front office
Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);

Route::middleware(['checkUserToken'])->group(function () {
    Route::post('/test', [AuthController::class, 'test']);
    Route::get('/mode_paiements', [ModePaiementApiController::class, 'index']);
    Route::get('/equivalence_devises', [EquivalenceDeviseApiController::class, 'index']);
    Route::post('/transaction_jetons', [TransactionJetonApiController::class, 'store']); // valeur_devise, montant
    Route::post('/achat_produits', [AchatApiController::class, 'achat']);
    Route::get('/transactions', [TransactionApiController::class, 'userTransation']);
    Route::get('/historique_ventes', [VenteApiController::class, 'historiqueVente']);
    Route::get('/annulation_vente', [VenteApiController::class, 'annulerVente']);

    Route::post('/vente-jetons', [TransactionJetonApiController::class, 'store']); // valeur_devise, montant, id_user
    Route::post('/new-vente',[ProduitApiController::class,'newVente']);
    Route::post('/change-avatar',[AvatarApiController::class,'changeAvatar']);
    Route::post('/modifier-profil',[UtilisateurFrontOfficeApiController::class,'modifierProfil']);

    Route::post('/utilisateur', [UtilisateurFrontOfficeApiController::class, 'currentUtilisateur']);

    // Vos routes protégées par le token
});


