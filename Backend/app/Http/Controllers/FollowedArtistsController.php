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
        
        return response()->json($latestFollowedArtists);
    }    

    function saveFollowed(Request $req) {
        $user_id = $req->input('user_id'); 
        $artist_id = $req->input('artist_id');
        $followedArtist = new FollowedArtists();
        $followedArtist->user_id = $user_id;
        $followedArtist->artist_id = $artist_id;
        $followedArtist->follow_at = now();
        $followedArtist->save();
    }

    function getArtistById(Request $req) {
        $user_id = $req->input('user_id'); 
        $artist_id = $req->input('artist_id');
        $followedArtist = FollowedArtists::where('user_id', $user_id)
        ->where('artist_id', $artist_id)
        ->first(); 

        if ($followedArtist) {
            return "Yes";
        } else {
            return "No";
        }
    }

    function unfollowArtist(Request $req) {
        $user_id = $req->input('user_id'); 
        $artist_id = $req->input('artist_id');

        $followedArtist = FollowedArtists::where('user_id', $user_id)
            ->where('artist_id', $artist_id)
            ->first();

        if ($followedArtist) {
            $followedArtist->delete();
            return "Unfollowed successfully";
        } else {
            return "You are not following this artist.";
        }
    }

    function getFollowedArtists(Request $req) {
        $user_id = $req->input('user_id'); 
        $followedArtist = FollowedArtists::where('user_id', $user_id)
            ->orderBy('follow_at', 'desc')
            ->get();
        return $followedArtist;
    }
}
