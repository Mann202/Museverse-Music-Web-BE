<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Playlists;

class PlaylistsController extends Controller
{
    function getPlaylistID(Request $req) {
        $user_id = $req->input("user_id");
        return Playlists::where('user_id', $user_id)->orderBy('created_at', 'desc')->first();
    }
    
    function createPlaylist(Request $req) {
        $user_id = $req->input("user_id");
        $id = $req->input("id");
        $title = $req->input("title");

        $userPlaylist = new Playlists();
        $userPlaylist->user_id = $user_id;
        $userPlaylist->title_playlist = $title;
        $userPlaylist->save();
    }

    function getPlaylist(Request $req) {
        $user_id = $req->input("user_id");
        $playlist_id = $req->input("playlist_id");

        $userPlaylist = Playlists::where('user_id', $user_id)
            ->where('id', $playlist_id)
            ->first();

        return $userPlaylist;
    }

    function getAllPlaylist(Request $req) {
        $user_id = $req->input("user_id");

        $userPlaylist = Playlists::where('user_id', $user_id)
            ->get();

        return $userPlaylist;
    }
      
    function getImage(Request $req) {
        $playlist_id = $req->input('id');
        $user_id = $req->input("user_id");

        return Playlists::where('user_id', $user_id)->where('id', $playlist_id)->select('picture')->first();
    }

    function addPlaylist(Request $req) {
        $playlist_id = $req->input('id');
        $song_id = $req->input('song_id');
        
        $playlist = Playlists::where('id', $playlist_id)->first();
        
        if ($playlist) {
            $existing_song_ids = $playlist->song_id;
            
            if ($existing_song_ids && strpos($existing_song_ids, $song_id) === false) {
                $playlist->song_id = $existing_song_ids . ',' . $song_id;
            } elseif (!$existing_song_ids) {
                $playlist->song_id = $song_id;
            }
            $playlist->save();
        }
    }  
    
    function changeTitle(Request $req) {
        $playlist_id = $req->input('id');
        $user_id = $req->input("user_id");
        $title = $req->input('title');

        $playlist = Playlists::where('id', $playlist_id)->first();
        if($playlist) {
            $playlist->title_playlist = $title;
            $playlist->save();
        }
    }

    function removeSong(Request $req) {
        $playlist_id = $req->input('id');
        
        if ($req->has('song_id')) {
            $song_id_to_remove = $req->input("song_id");
    
            $playlist = Playlists::where('id', $playlist_id)->first();
    
            if ($playlist) {
                $song_ids = explode(',', $playlist->song_id);
    
                $updated_song_ids = array_diff($song_ids, [$song_id_to_remove]);
    
                $playlist->song_id = implode(',', $updated_song_ids);
                $playlist->save();
    
                return response()->json(['message' => 'Xoá bài hát thành công'], 200);
            } else {
                return response()->json(['message' => 'Không tìm thấy playlist'], 404);
            }
        } else {
            return response()->json(['message' => 'Thiếu thông tin song_id'], 400);
        }
    }
    
    function removePlaylist(Request $req) {
        $playlist_id = $req->input('id');
        $playlist = Playlists::where('id', $playlist_id)->first();
        if($playlist) {
            $playlist->delete();
        }
    }
}
