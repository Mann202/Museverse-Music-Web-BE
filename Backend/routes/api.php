<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UsersController;
use App\Http\Controllers\RolesController;
use App\Http\Controllers\UserRoleController;
use App\Http\Controllers\FollowedArtistsController;
use App\Http\Controllers\HistoryController;
use App\Http\Controllers\LikedSongController;
use App\Http\Controllers\PlaylistsController;

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
Route::post('signingoogle', [UsersController::class, 'signingoogle']);
Route::get('roles', [RolesController::class, 'getRole']);
Route::post('checkrole', [UserRoleController::class, 'checkrole']);
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
Route::get('getToken', [UsersController::class, 'getToken']);

Route::get('getPlaylistID', [PlaylistsController::class, 'getPlaylistID']);
Route::post('createPlaylist', [PlaylistsController::class, 'createPlaylist']);
Route::get('getPlaylist', [PlaylistsController::class, 'getPlaylist']);
Route::get('getAllPlaylist', [PlaylistsController::class, 'getAllPlaylist']);
Route::post('addPlaylist', [PlaylistsController::class, 'addPlaylist']);
Route::post('changeTitle', [PlaylistsController::class, 'changeTitle']);
Route::post('removeSong', [PlaylistsController::class, 'removeSong']);
Route::post('removePlaylist', [PlaylistsController::class, 'removePlaylist']);
Route::get('checkSongID', [PlaylistsController::class, 'checkSongID']);