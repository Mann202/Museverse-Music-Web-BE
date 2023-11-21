<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UsersController;
use App\Http\Controllers\RolesController;
use App\Http\Controllers\FollowedArtistsController;
use App\Http\Controllers\HistoryController;
use App\Http\Controllers\LikedSongController;

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


Route::get('getUser', [UsersController::class, 'getUser']);
Route::get('roles', [RolesController::class, 'getRole']);
Route::get('followArtist', [FollowedArtistsController::class, 'getFollowed']);
Route::get('unfollowArtist', [FollowedArtistsController::class, 'unfollowArtist']);
Route::get('artistById', [FollowedArtistsController::class, 'getArtistById']);
Route::get('getAllFollowedArtist', [FollowedArtistsController::class, 'getFollowedArtists']);
Route::post('followArtist', [FollowedArtistsController::class, 'saveFollowed']);
Route::get('history', [HistoryController::class, 'getHistory']);
Route::post('history', [HistoryController::class, 'saveHistory']);
Route::get('allHistory', [HistoryController::class, 'getAllHistory']);
Route::get('getAllLikedSong', [LikedSongController::class, 'getLikedSong']);
Route::post('saveLikedSong', [LikedSongController::class, 'saveLikedSong']);
Route::get('getLikedSongID', [LikedSongController::class, 'getLikedSongID']);
Route::get('unsaveSong', [LikedSongController::class, 'unsaveSong']);