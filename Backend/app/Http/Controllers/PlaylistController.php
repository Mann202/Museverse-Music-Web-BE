<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Models\Playlists;
use Mockery\Exception;

class PlaylistController extends Controller
{
    public function add(Request $request)
    {
        try {
            $exits_playlist = Playlists::where([['user_id','=',$request->json()->get('userId')],['playlist_id','=', $request->json()->get('playlistId')]])->exists();
            if(!$exits_playlist){
                $user_playlist = Playlists::create([
                    'user_id' => $request->json()->get('userId'),
                    'playlist_id' => $request->json()->get('playlistId'),
                    'created_at' => Carbon::now(),
                    'title_playlist' => $request->titlePlaylist,
                ]);
                return response()->json($user_playlist);
            }
            return response()->json(['message'=>'Playlist invalid'],400);

        } catch (\Exception $e) {
            return response()->json($e->getMessage(), 500);
        }
    }

    public function delete(Request $request)
    {
        try {
            Playlists::where([['user_id', '=', $request->json()->get('userId')], ['playlist_id', '=', $request->json()->get('playlistId')]])->delete();
            return response()->json(['message' => 'Success'], 200);
        } catch (\Exception $e) {
            return response()->json($e->getMessage(), 500);
        }
    }

    public function getAllByUser($user_id)
    {
        try {
            return response()->json(Playlists::where("user_id", $user_id)->get());
        } catch (Exception $e) {
            return response()->json($e->getMessage(), 500);
        }
    }
}
?>