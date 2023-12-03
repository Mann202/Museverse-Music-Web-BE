<?php

namespace App\Http\Controllers;

use App\Models\AlbumPhysical;
use App\Models\AlbumPhysicalDetail;
use Illuminate\Http\Request;

class AlbumPhysicalController extends Controller
{
    function getalbumphys(Request $req)
    {
        if ($req->album_physi_id == 0)
            return AlbumPhysical::all();
        else
            return AlbumPhysical::where("album_physi_id", $req->album_physi_id)->first();
    }
    function checkVersion(Request $req)
    {
        $album = AlbumPhysicalDetail::where("album_physi_id", $req->album_physi_id)->get();
        if(!$album)
            return 'false';
        else
            return $album;


        // return AlbumPhysical::where("album_physi_id", $req->album_physi_id)->first();
    }
}
