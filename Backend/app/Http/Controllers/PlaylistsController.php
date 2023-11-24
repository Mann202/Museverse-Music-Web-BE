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

    public function uploadImage(Request $request) {
        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $user_id = $request->input('user_id'); 
            $playlist_id = $request->input('playlist_id'); 
    
            // Kiểm tra xem danh sách phát có sẵn trong cơ sở dữ liệu hay không
            $playlist = Playlists::where('user_id', $user_id)
                ->where('id', $playlist_id)
                ->first();
    
            if ($playlist) {
                $tempPath = 'uploads/' . $image->getClientOriginalName();
    
                // Di chuyển tệp hình ảnh vào thư mục 'public'
                $image->move('public', $tempPath);
                $tempImagePath = 'public/' . $tempPath;
    
                // Cập nhật trường 'picture' trong danh sách phát
                $playlist->picture = $tempImagePath;
                $playlist->save();
    
                return response()->json(['message' => 'Image uploaded and playlist updated successfully'], 200);
            } else {
                return response()->json(['message' => 'Playlist not found for the given user.'], 404);
            }
        } else {
            return response()->json(['message' => 'No image file uploaded.'], 400);
        }
    }    
}
