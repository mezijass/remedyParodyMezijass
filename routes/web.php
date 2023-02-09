<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\MainController as MainController;

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

Route::get('/', [MainController::class, 'main'])->name('main');
Route::get('/search', [MainController::class, 'search'])->name('search');
Route::get('/add', [MainController::class, 'addIncident']);
Route::get('/edit', [MainController::class, 'editIncident']);
Route::get('/editInCard', [MainController::class, 'editInCard']);
Route::get('/card', [MainController::class, 'showCard']);
Route::get('/addMessage', [MainController::class, 'addMessage']);
Route::get('/change_status', [MainController::class, 'change_status']);
Route::get('/change_user', [MainController::class, 'change_user']);
Route::get('/user_groups', [MainController::class, 'user_groups']);
Route::get('/check_categories', [MainController::class, 'check_categories']);


Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth'])->name('dashboard');

require __DIR__.'/auth.php';
