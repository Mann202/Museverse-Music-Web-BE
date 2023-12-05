<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Models\Users;
use App\Models\AlbumOrders;
use Illuminate\Support\Facades\Hash;
use App\Models\AlbumOrderDetail;

class AlbumOrderDetailController extends Controller
{
    function getOrderReport(Request $req) {
        $currentDate = now();
        $startDate = $currentDate->subDays(30);
        $orders = AlbumOrderDetail::where('created_at', '>=', $startDate)
                        ->orderBy('created_at', 'desc') 
                        ->get();
        $jsonString = json_encode($orders, JSON_UNESCAPED_UNICODE);
        return $jsonString;
    }

    function getRevenueReport() {
        $currentDate = now();
        $startDate = $currentDate->subDays(30);
        $totalRevenue = AlbumOrderDetail::where('created_at', '>=', $startDate)
                        ->orderBy('created_at', 'desc') 
                        ->sum('total_money');

        return $totalRevenue;
    }

    function getUsersDashboard() {
        $usersAndOrders = DB::table('users')
            ->join('album_orders', 'users.user_id', '=', 'album_orders.cust_id')
            ->select('users.user_id', 'users.first_name', 'users.last_name', 'users.accountStatusId', DB::raw('COUNT(users.first_name) as name_count'), DB::raw('SUM(album_orders.total) as total_sum'))
            ->whereIn('users.accountTypeId', [1, 2])
            ->groupBy('users.user_id', 'users.first_name', 'users.last_name', 'users.accountStatusId')
            ->get();
    
        $jsonString = json_encode($usersAndOrders, JSON_UNESCAPED_UNICODE);
        return $jsonString;
    }
    
    function getSaleReport() {
        $albumAndOrder = DB::table('album_order_details')
            ->join('album_physical', 'album_physical.album_physi_id', '=', 'album_order_details.album_physi_id')
            ->select('album_physical.album_physi_id', 'album_physical.album_name', 'album_physical.url_poster', DB::raw('SUM(album_order_details.total_money) as revenue'), DB::raw('SUM(album_order_details.num) as number'))
            ->groupBy('album_physical.album_physi_id', 'album_physical.album_name', 'album_physical.url_poster')
            ->orderByDesc('revenue') 
            ->take(5)
            ->get();
    
        $jsonString = json_encode($albumAndOrder, JSON_UNESCAPED_UNICODE);
        return $jsonString;
    }    

    function getDistributorReport() {
        $albumAndOrder = DB::table('album_order_details')
            ->join('album_physical', 'album_physical.album_physi_id', '=', 'album_order_details.album_physi_id')
            ->join('users', 'users.user_id', '=', 'album_physical.user_id')
            ->select('users.first_name', 'users.last_name', DB::raw('SUM(album_order_details.total_money) as revenue'), DB::raw('SUM(album_order_details.num) as number'))
            ->groupBy('users.first_name', 'users.last_name')
            ->orderByDesc('revenue') 
            ->take(5)
            ->get();
    
        $jsonString = json_encode($albumAndOrder, JSON_UNESCAPED_UNICODE);
        return $jsonString;
    } 

    function getUsers() {
        $usersAndOrders = DB::table('users')
            ->join('album_orders', 'users.user_id', '=', 'album_orders.cust_id')
            ->join('album_order_details', 'album_order_details.order_id', '=', 'album_orders.order_id')
            ->select('users.first_name', 'users.last_name', DB::raw('SUM(album_order_details.num) as sale'), DB::raw('SUM(album_order_details.total_money) as spend'))
            ->whereIn('users.accountTypeId', [1, 2])
            ->groupBy('users.first_name', 'users.last_name')
            ->get();
    
        $jsonString = json_encode($usersAndOrders, JSON_UNESCAPED_UNICODE);
        return $jsonString;
    }

    function insertDistributor(Request $req) {
        $user1 = Users::where("username", $req->username)
            ->orWhere("email_address", $req->email)
            ->first();

        if (!$user1) {
            $user = new Users;
            $user->email_address = $req->input('email');
            $user->username = $req->input('username');
            $user->lastname = $req->input('lastname');
            $user->firstname = $req->input('firstname');
            $user->password = $req->input('password');
            $user->accountTypeID = 4;      
            $user->accountStatusID = 1;     
            $user->save();
            return $user;
        } else {
            return ["error" => "Email or username is already existed"];
        }
    }

    function insertUser(Request $req) {
        $user1 = Users::where("username", $req->username)
            ->orWhere("email_address", $req->email)
            ->first();

        if (!$user1) {
            $user = new Users;
            $user->email_address = $req->input('email');
            $user->username = $req->input('username');
            $user->lastname = $req->input('lastname');
            $user->firstname = $req->input('firstname');
            $user->password = $req->input('password');
            $user->accountTypeID = 1;      
            $user->accountStatusID = 1;     
            $user->save();
            return $user;
        } else {
            return ["error" => "Email or username is already existed"];
        }
    }
}
