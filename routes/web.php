<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\WebController;
use App\Http\Controllers\PaymentController;

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

Route::get('/', [WebController::class, 'index']);
Route::get('/about', [WebController::class, 'about']);
Route::get('/resumen', [WebController::class, 'resumen']);
Route::get('/detail/{id}',[WebController::class, 'detail'])->name('student.detail');
Route::post('/pagar',[PaymentController::class,'store'])->name('month.payment');
