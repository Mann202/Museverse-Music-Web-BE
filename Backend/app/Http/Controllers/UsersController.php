<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Users;

class UsersController extends Controller
{
    function getUser(Request $req) {
        $user_id = $req->input('user_id');
        return Users::where('user_id', $user_id)->get();
    }
}
