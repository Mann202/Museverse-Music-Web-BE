<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\FollowedArtists;

class FollowedArtistsController extends Controller
{
    function getFollowed(Request $req) {
        $user_id = $req->input('id'); 
        $latestFollowedArtists = FollowedArtists::where('user_id', $user_id)
            ->orderBy('follow_at', 'desc') 
            ->take(3) 
            ->get();
    
        return $latestFollowedArtists;
    }
}
