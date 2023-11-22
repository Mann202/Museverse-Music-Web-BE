<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Roles;

class RolesController extends Controller
{
    function getRole(Request $req) {
        $id = $req->input("id");
        $role = Roles::where('role_id', $id)->first();
        return $role;
    }
}
