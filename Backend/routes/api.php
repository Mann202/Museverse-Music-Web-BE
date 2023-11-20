<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UsersController;
use App\Http\Controllers\RolesController;
use App\Http\Controllers\UserRoleController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


Route::post('register', [UsersController::class, 'register']);
Route::post('signin', [UsersController::class, 'signin']);
Route::post('signup', [UsersController::class, 'signup']);
Route::get('roles', [RolesController::class, 'getRole']);
Route::post('checkrole', [UserRoleController::class, 'checkrole']);