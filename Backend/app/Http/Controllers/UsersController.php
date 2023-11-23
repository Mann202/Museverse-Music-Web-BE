<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Users;

use function Laravel\Prompts\password;

class UsersController extends Controller
{
    function register()
    {
        return "API connected";
    }
    function signup(Request $req)
    {
        // $user->first_name = $req->input('first_name');
        // $user->last_name = $req->input('last_name');
        // $user->date_of_birth = $req->input('date_of_birth');
        // $user->contact_number = $req->input('contact_number');
        // $user->email_confirmed = $req->input('email_confirmed');
        // $user->accountTypeID = $req->input('accountTypeID');
        $user1 = Users::where("username", $req->username)
            ->orWhere("email_address", $req->email)
            ->first();
        if (!$user1) {
            $user = new Users;
            $user->email_address = $req->input('email');
            $user->username = $req->input('username');
            $user->password = $req->input('password');
            $user->accountTypeID = 1;      
            $user->accountStatusID = 1;     
            $user->save();
            return $user;
        } else {
            return ["error" => "Email or username is already existed"];
        }
    }

    function signin(Request $req)
    {
        $user = Users::where("username", $req->username)
            ->orWhere("email_address", $req->username)
            ->first();
        if (!$user || $user->password !=  $req->password)
            return ["error" => "Email or password is not match"];
        return $user;
    }

    function signingoogle(Request $req)
    {
        $user = Users::where("email_address", $req->email)->first();
        if (!$user) {
            $user = new Users;
            $user->email_address = $req->email;
            $user->first_name = $req->given_name;
            $user->last_name = $req->family_name;
            $user->username = $req->given_name;
            $user->accountTypeID = 1;      
            $user->accountStatusID = 1;             
            $user->password = "google";
            $user->save();
            return $user;
        }

        return $user;
    }
}
