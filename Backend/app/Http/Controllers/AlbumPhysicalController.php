<?php

namespace App\Http\Controllers;

use App\Models\AlbumPhysical;
use Illuminate\Http\Request;

class AlbumPhysicalController extends Controller
{
    function getalbumphys()
    {
        return AlbumPhysical::all();
    }
}
