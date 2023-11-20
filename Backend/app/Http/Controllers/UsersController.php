<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Users;

class UsersController extends Controller
{
    function register()
    {
        return "API connected";
    }
    function signup(Request $req)
    {
        $rowCount = Users::count();
        $user = new Users;
        $user->user_id = "u" . ($rowCount+1);
        // $user->first_name = $req->input('first_name');
        // $user->last_name = $req->input('last_name');
        // $user->date_of_birth = $req->input('date_of_birth');
        // $user->contact_number = $req->input('contact_number');
        $user->email_address = $req->input('email_address');
        // $user->email_confirmed = $req->input('email_confirmed');
        // $user->accountTypeID = $req->input('accountTypeID');
        $user->username = $req->input('username');
        $user->password = $req->input('password');
        $user->save();

        return $user;
    }

    function signin(Request $req)
    {
        $user = Users::where("username", $req->username)->first();

        if (!$user)        
            return ["error" => "Email or password is not match"];
        return $user;
    }
    
}
