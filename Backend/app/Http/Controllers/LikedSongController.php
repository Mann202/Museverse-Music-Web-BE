<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\LikedSong;

class LikedSongController extends Controller
{
    function getLikedSong(Request $req) {
        $user_id = $req->input('user_id');
        return LikedSong::where('user_id', $user_id)->orderBy('created_at', 'desc')->get();
    }

    function saveLikedSong(Request $req) {
        $user_id = $req->input('user_id');
        $track_id = $req->input('track_id');
    
        $existingRecord = LikedSong::where('user_id', $user_id)
            ->where('song_id', $track_id)
            ->first();
    
        if (!$existingRecord) {
            $newRecord = new LikedSong();
            $newRecord->user_id = $user_id;
            $newRecord->song_id = $track_id;
            $newRecord->save();
        } else {
        }
    }
    
    function getLikedSongID(Request $req) {
        $user_id = $req->input('user_id');
        $track_id = $req->input('track_id');
    
        $existingRecord = LikedSong::where('user_id', $user_id)
            ->where('song_id', $track_id)
            ->first();

        if($existingRecord) {
            return "Yes";
        } else {
            return "No";
        }
    }

    function unsaveSong(Request $req) {
        $user_id = $req->input('user_id'); 
        $track_id = $req->input('track_id');

        $followedArtist = LikedSong::where('user_id', $user_id)
            ->where('song_id', $track_id)
            ->first();

        if ($followedArtist) {
            $followedArtist->delete();
            return "Unsave successfully";
        } else {
            return "You are not save this track.";
        }
    }
}
