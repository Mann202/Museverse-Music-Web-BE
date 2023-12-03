<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User_Role;

class UserRoleController extends Controller
{
    function checkrole(Request $req)
    {
        // $userRole = User_Role::where("user_id", $req->user_id)->first();

        // if (!$userRole)        
        //     return ["error" => "UserID does not exist"];
        // return $userRole;
        return response()->json([]); // Trả rỗng
    }
}
