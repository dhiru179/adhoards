<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\adhoards\AddPostController;
use App\Http\Controllers\adhoards\AdhordsController;

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


Route::get('/', [AdhordsController::class, 'adhoards']);
Route::get('/adposts', [AddPostController::class, 'adposts']);
Route::post('/onclick_proceed',[AddPostController::class,'proceed']);
Route::get('/adposts/{cat}/{sub_cat}', [AddPostController::class, 'formGenerate']);
