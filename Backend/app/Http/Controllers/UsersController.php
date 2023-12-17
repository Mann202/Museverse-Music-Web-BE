<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Users;
use Illuminate\Support\Facades\Hash;
use function Laravel\Prompts\password;

class UsersController extends Controller
{
    private $token_url = 'https://open.spotify.com/get_access_token?reason=transport&productType=web_player';

    function getUser(Request $req) {
        $user_id = $req->input('user_id');
        return Users::where('user_id', $user_id)->get();
    }

    function getToken()
    {
        $sp_dc = 'AQAScqUqmBZ92D7gcqUSzA2oP3n6QayeUPoAiMKbeAvARZXdIjRw75ZjcF067NA1HNj9AuGoKSNtfFVNBOnNdcjpDtT-xFn21c9fsYkU46B-UGYScIO7uNd_FDDkuo4_4GKTEEvU-jhjL829EyPOR22st4opg1e_';
        if ( !$sp_dc )
        throw new SpotifyException( 'Please set SP_DC as a environmental variable.' );
        $ch = curl_init();
        curl_setopt( $ch, CURLOPT_TIMEOUT, 600 );
        curl_setopt( $ch, CURLOPT_SSL_VERIFYPEER, 0 );
        curl_setopt( $ch, CURLOPT_SSL_VERIFYHOST, 0 );
        curl_setopt( $ch, CURLOPT_VERBOSE, 0 );
        curl_setopt( $ch, CURLOPT_RETURNTRANSFER, 1 );
        curl_setopt( $ch, CURLOPT_HEADER, 0 );
        curl_setopt( $ch, CURLOPT_FOLLOWLOCATION, false );
        curl_setopt( $ch, CURLOPT_CUSTOMREQUEST, 'GET' );
        curl_setopt( $ch, CURLOPT_HTTPHEADER, array(
            'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.0.0 Safari/537.36',
            'App-platform: WebPlayer',
            'content-type: text/html; charset=utf-8',
            "cookie: sp_dc=$sp_dc;"
        ) );
        curl_setopt($ch, CURLOPT_URL, $this->token_url);
        $result = curl_exec( $ch );
        $token_json = json_decode( $result, true );
        if ( !$token_json || $token_json[ 'isAnonymous' ] )
        throw new SpotifyException('The SP_DC set seems to be invalid, please correct it!' );
        $token_file = fopen('.cache', 'w' ) or die( 'Unable to open file!' );
        ;
        fwrite( $token_file, $result );

        return $result;
    }
    
    function signup(Request $req)
    {
        $user1 = Users::where("username", $req->username)
            ->orWhere("email_address", $req->email)
            ->first();
        if (!$user1) {
            $user = new Users;
            $user->email_address = $req->input('email');
            $user->username = $req->input('username');
            $user->password = Hash::make($req->input('password'));
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

    public function userUpdate(Request $request, string $userId)
    {
        $data = $request->only(['first_name', 'last_name', 'date_of_birth','contact_number']);
        $user = Users::query()->find($userId);
        if (empty($user)) {
            return response()->json('Lỗi', 500);
        }
        $user->update($data);
        return response()->json('Thành công');
    }

    public function getNewUserCount(Request $req) {
        $today = Carbon::now();
        $trialExpires = $today->addDays(30);
        $thirtyDaysAgo = $today->subDays(31);
        $newUserCount = Users::where('created_at', '>=', $thirtyDaysAgo)
                            ->count();

        return $newUserCount;
    }

    function updatePremium(Request $req) {
        $user = Users::where('user_id', $req->input('user_id'))->first();
        if($user) {
            $user->accountTypeID = 2;
            $user->save();
        }
    }
}
