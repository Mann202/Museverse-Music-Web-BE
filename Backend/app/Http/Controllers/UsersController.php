<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Users;

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
}
