<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\CategorieApiController;
use App\Http\Controllers\Api\ConditionProduitApiController;
use App\Http\Controllers\Api\PaysApiController;
use App\Http\Controllers\Api\VilleApiController;
use App\Http\Controllers\Api\VProduitLibCompletApiController;

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



