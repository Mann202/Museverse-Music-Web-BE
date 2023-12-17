<?php

namespace App\Http\Controllers;

use App\Models\AlbumPhysical;
use App\Models\AlbumPhysicalDetail;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AlbumPhysicalController extends Controller
{
    function getalbumphys(Request $req)
    {
        if ($req->album_physi_id == 0)
            return AlbumPhysical::all();
        else
            return AlbumPhysical::where("album_physi_id", $req->album_physi_id)->first();
    }
    function getDistributorAlbum(Request $req)
    {

        $albums1 = DB::table('album_physicals')
            ->where('user_id', $req->input('user_id'))
            ->Join('album_physical_details', 'album_physicals.album_physi_id', '=', 'album_physical_details.album_physi_id')
            ->select('album_physicals.*', 'album_physical_details.*')
            ->get();

        $albumsWithoutDetails = DB::table('album_physicals as a')
            ->where('user_id', $req->input('user_id'))
            ->whereNotIn('a.album_physi_id', function ($query) {
                $query->select('b.album_physi_id')
                    ->from('album_physical_details as b')
                    ->join('album_physicals as a', 'b.album_physi_id', '=', 'a.album_physi_id');
            })
            ->get();

        $combinedQuery = $albums1->union($albumsWithoutDetails);

        return $combinedQuery;
    }
    function checkVersion(Request $req)
    {
        $album = AlbumPhysicalDetail::where("album_physi_id", $req->album_physi_id)->get();
        if (!$album)
            return 'false';
        else
            return $album;
    }
}
