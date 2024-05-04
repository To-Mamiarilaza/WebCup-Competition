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

Route::get('/categories', [CategorieController::class, 'index']);
Route::post('/categories', [CategorieController::class, 'store']);
Route::delete('/categories/{categorie}', [CategorieController::class, 'destroy'])->name('categories.destroy');

