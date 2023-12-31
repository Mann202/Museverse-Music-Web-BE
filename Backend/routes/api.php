<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UsersController;
use App\Http\Controllers\RolesController;
use App\Http\Controllers\UserRoleController;
use App\Http\Controllers\FollowedArtistsController;
use App\Http\Controllers\HistoryController;
use App\Http\Controllers\LikedSongController;
use App\Http\Controllers\AlbumPhysicalController;
use App\Http\Controllers\PlaylistsController;
use App\Http\Controllers\AlbumOrdersController;
use App\Http\Controllers\AlbumOrderDetailController;
use App\Http\Controllers\OrderController;

use App\Http\Controllers\AlbumOrderController;
use App\Models\AlbumPhysical;

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
Route::post('getalbumphys', [AlbumPhysicalController::class, 'getalbumphys']);
Route::post('allusers', [UsersController::class, 'allusers']);
Route::post('checkVersion', [AlbumPhysicalController::class, 'checkVersion']);
Route::post('addtocart', [AlbumOrderController::class, 'addtocart']);
Route::post('loadCart', [AlbumOrderController::class, 'loadCart']);
Route::post('deleteCart', [AlbumOrderController::class, 'deleteCart']);
Route::post('pay', [AlbumOrderController::class, 'pay']);

Route::get('getPlaylistID', [PlaylistsController::class, 'getPlaylistID']);
Route::post('createPlaylist', [PlaylistsController::class, 'createPlaylist']);
Route::get('getPlaylist', [PlaylistsController::class, 'getPlaylist']);
Route::get('getAllPlaylist', [PlaylistsController::class, 'getAllPlaylist']);
Route::post('addPlaylist', [PlaylistsController::class, 'addPlaylist']);
Route::post('changeTitle', [PlaylistsController::class, 'changeTitle']);
Route::post('removeSong', [PlaylistsController::class, 'removeSong']);
Route::post('removePlaylist', [PlaylistsController::class, 'removePlaylist']);
Route::get('checkSongID', [PlaylistsController::class, 'checkSongID']);

Route::post('user/{id}', [UsersController::class, 'userUpdate']);
Route::get('getOrderReport', [AlbumOrderDetailController::class, 'getOrderReport']);
Route::get('getRevenueReport', [AlbumOrderDetailController::class, 'getRevenueReport']);
Route::get('getNewUserCount', [UsersController::class, 'getNewUserCount']);
Route::get('getUsersDashboard', [AlbumOrderDetailController::class, 'getUsersDashboard']);
Route::get('getSaleReport', [AlbumOrderDetailController::class, 'getSaleReport']);
Route::get('getDistributorReport', [AlbumOrderDetailController::class, 'getDistributorReport']);
Route::get('getUsers', [AlbumOrderDetailController::class, 'getUsers']);
Route::post('insertDistributor', [AlbumOrderDetailController::class, 'insertDistributor']);
Route::post('insertUser', [AlbumOrderDetailController::class, 'insertUser']);
Route::get('getAlbumDistributor', [AlbumOrderDetailController::class, 'getAlbumDistributor']);
Route::post('insertNewAlbum', [AlbumOrderDetailController::class, 'insertNewAlbum']);

Route::get('getAlbum', [AlbumOrderDetailController::class, 'getAlbum']);
Route::post('updateAlbum', [AlbumOrderDetailController::class, 'updateAlbum']);
Route::get('deteleAlbum', [AlbumOrderDetailController::class, 'deteleAlbum']);

Route::post('getUserOrder', [AlbumOrderDetailController::class, 'getUserOrder']);
Route::post('deleteUserOrder', [AlbumOrderDetailController::class, 'deleteUserOrder']);
Route::post('getOrderDetail', [AlbumOrderDetailController::class, 'getOrderDetail']);
Route::post('getDistributorAlbum', [AlbumPhysicalController::class, 'getDistributorAlbum']);
Route::post('searchCusEmail', [UsersController::class, 'searchCusEmail']);
Route::post('checkCustomer', [UsersController::class, 'checkCustomer']);
Route::post('createOrder', [AlbumOrderController::class, 'createOrder']);
Route::post('deleteOrderDuplicate', [AlbumOrderController::class, 'deleteOrderDuplicate']);

Route::post('/order/create', [OrderController::class, 'createOrder']);
Route::post('updatePremium', [UsersController::class, 'updatePremium']);
Route::post('getPaymentLinkInfoOfOrder/{id}', [OrderController::class, 'getPaymentLinkInfoOfOrder']);

Route::get('report/user', [\App\Http\Controllers\ReportController::class, 'reportUser']);

Route::get('getNewestPlaylistID', [PlaylistsController::class, 'getNewestPlaylistID']);