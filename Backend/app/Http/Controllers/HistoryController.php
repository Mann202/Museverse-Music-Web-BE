<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\History;

class HistoryController extends Controller
{
    function getHistory(Request $req) {
        $id = $req->input();
        return History::where("user_id", $id)
            ->orderBy('updated_at', 'desc') 
            ->take(6) 
            ->get();
    }

    function saveHistory(Request $req) {
        $user_id = $req->input('user_id');
        $track = $req->input('track');
        $listenedAt = now();
    
        $result = History::updateOrInsert(
            ['song_id' => $track],
            ['user_id' => $user_id, 'updated_at' => $listenedAt]
        );
    }

    function getAllHistory(Request $req) {
        $user_id = $req->input('user_id');
        return History::where("user_id", $user_id)
        ->orderBy('updated_at', 'desc') 
        ->get();
    }
}
