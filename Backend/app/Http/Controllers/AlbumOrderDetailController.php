<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Models\Users;
use App\Models\AlbumOrders;
use Illuminate\Support\Facades\Hash;
use App\Models\AlbumOrderDetail;
use App\Models\AlbumPhysical;

class AlbumOrderDetailController extends Controller
{
    function getOrderReport(Request $req)
    {
        $currentDate = now();
        $startDate = $currentDate->subDays(30);
        $orders = AlbumOrderDetail::where('created_at', '>=', $startDate)
            ->orderBy('created_at', 'desc')
            ->get();
        $jsonString = json_encode($orders, JSON_UNESCAPED_UNICODE);
        return $jsonString;
    }

    function getRevenueReport()
    {
        $currentDate = now();
        $startDate = $currentDate->subDays(30);
        $totalRevenue = AlbumOrderDetail::where('created_at', '>=', $startDate)
            ->orderBy('created_at', 'desc')
            ->sum('total_money');

        return $totalRevenue;
    }

    function getUsersDashboard()
    {
        $usersAndOrders = DB::table('users')
            ->join('album_orders', 'users.user_id', '=', 'album_orders.cust_id')
            ->select('users.user_id', 'users.first_name', 'users.last_name', 'users.accountStatusId', DB::raw('COUNT(users.first_name) as name_count'), DB::raw('SUM(album_orders.total) as total_sum'))
            ->whereIn('users.accountTypeId', [1, 2])
            ->groupBy('users.user_id', 'users.first_name', 'users.last_name', 'users.accountStatusId')
            ->get();

        $jsonString = json_encode($usersAndOrders, JSON_UNESCAPED_UNICODE);
        return $jsonString;
    }

    function getSaleReport()
    {
        $albumAndOrder = DB::table('album_order_details')
            ->join('album_physicals', 'album_physicals.album_physi_id', '=', 'album_order_details.album_physi_id')
            ->select('album_physicals.album_physi_id', 'album_physicals.album_name', 'album_physicals.url_poster', DB::raw('SUM(album_order_details.total_money) as revenue'), DB::raw('SUM(album_order_details.num) as number'))
            ->groupBy('album_physicals.album_physi_id', 'album_physicals.album_name', 'album_physicals.url_poster')
            ->orderByDesc('revenue')
            ->take(5)
            ->get();

        $jsonString = json_encode($albumAndOrder, JSON_UNESCAPED_UNICODE);
        return $jsonString;
    }

    function getDistributorReport()
    {
        $albumAndOrder = DB::table('album_order_details')
            ->join('album_physicals', 'album_physicals.album_physi_id', '=', 'album_order_details.album_physi_id')
            ->join('users', 'users.user_id', '=', 'album_physicals.user_id')
            ->select('users.first_name', 'users.last_name', DB::raw('SUM(album_order_details.total_money) as revenue'), DB::raw('SUM(album_order_details.num) as number'))
            ->groupBy('users.first_name', 'users.last_name')
            ->orderByDesc('revenue')
            ->take(5)
            ->get();

        $jsonString = json_encode($albumAndOrder, JSON_UNESCAPED_UNICODE);
        return $jsonString;
    }

    function getUsers()
    {
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

    function insertDistributor(Request $req)
    {
        $user1 = Users::where("username", $req->username)
            ->orWhere("email_address", $req->email)
            ->first();

        if (!$user1) {
            $user = new Users;
            $user->email_address = $req->input('email');
            $user->username = $req->input('username');
            $user->last_name = $req->input('lastname');
            $user->first_name = $req->input('firstname');
            $user->password = $req->input('password');
            $user->accountTypeID = 4;
            $user->accountStatusID = 1;
            $user->save();
            return $user;
        } else {
            return ["error" => "Email or username is already existed"];
        }
    }

    function insertUser(Request $req)
    {
        $user1 = Users::where("username", $req->username)
            ->orWhere("email_address", $req->email)
            ->first();

        if (!$user1) {
            $user = new Users;
            $user->email_address = $req->input('email');
            $user->username = $req->input('username');
            $user->last_name = $req->input('lastname');
            $user->first_name = $req->input('firstname');
            $user->password = $req->input('password');
            $user->accountTypeID = 1;
            $user->accountStatusID = 1;
            $user->save();
            return $user;
        } else {
            return ["error" => "Email or username is already existed"];
        }
    }

    function getAlbumDistributor(Request $req)
    {
        $distributorAndAlbum = DB::table('album_physicals')
            ->join('users', 'users.user_id', '=', 'album_physicals.user_id')
            ->select('album_physicals.album_physi_id', 'album_physicals.album_name', 'album_physicals.type', 'album_physicals.artist_id', 'album_physicals.quantity', 'album_physicals.description', 'album_physicals.url_poster')
            ->where('users.user_id', $req->input('user_id'))
            ->get();

        $jsonString = json_encode($distributorAndAlbum, JSON_UNESCAPED_UNICODE);
        return $jsonString;
    }

    function insertNewAlbum(Request $req)
    {
        $album_physical = new AlbumPhysical;
        $album_physical->album_name = $req->input('album_name');
        $album_physical->quantity = $req->input('quantity');
        $album_physical->type = $req->input('type');
        $album_physical->user_id = $req->input('user_id');
        $album_physical->min_price = $req->input('min_price');
        $album_physical->max_price = $req->input('max_price');
        $album_physical->description = $req->input('description');
        $album_physical->url_poster = $req->input('url_poster');
        $album_physical->save();
    }

    function getAlbum(Request $req)
    {
        $album_physical = AlbumPhysical::where('album_physi_id', $req->input('id'))->get();
        return $album_physical;
    }

    function updateAlbum(Request $req)
    {
        $album_physical = AlbumPhysical::find($req->input('id'));

        if ($album_physical) {
            $album_physical->album_name = $req->input('album_name');
            $album_physical->quantity = $req->input('quantity');
            $album_physical->type = $req->input('type');
            $album_physical->user_id = $req->input('user_id');
            $album_physical->min_price = $req->input('min_price');
            $album_physical->max_price = $req->input('max_price');
            $album_physical->description = $req->input('description');
            $album_physical->url_poster = $req->input('url_poster');
            $album_physical->save();

            return response()->json(['message' => 'Album updated successfully'], 200);
        } else {
            return response()->json(['error' => 'Album not found'], 404);
        }
    }

    function deteleAlbum(Request $req)
    {
        $id = $req->input('id');

        $album = AlbumPhysical::where('album_physi_id', $id)->first();

        if ($album) {
            $album->delete();
            return response()->json(['message' => 'Album deleted successfully'], 200);
        } else {
            return response()->json(['error' => 'Album not found'], 404);
        }
    }

    function getUserOrder(Request $req)
    {
        $UserOrder = DB::table('album_order_details')
            ->join('album_physicals', 'album_physicals.album_physi_id', '=', 'album_order_details.album_physi_id')
            ->join('album_orders', 'album_orders.order_id', '=', 'album_order_details.order_id')
            ->groupBy('order_id', 'cust_name', 'cust_email', 'cust_contact_number', 'cust_address', 'cust_id', 'note', 'status', 'total', 'created_at', 'updated_at', 'total_final')
            ->where('album_physicals.user_id', $req->input('user_id'))
            ->where('album_orders.status', 0)
            ->select('album_orders.*', DB::raw('COUNT(album_order_details.order_id) as album_quantity'))
            ->get();

        return $UserOrder;
    }

    function deleteUserOrder(Request $req)
    {
        $deletedAlbumOrderDetail = DB::table('album_order_details')
            ->where('order_id', $req->input('order_id'))
            ->delete();

        $deletedAlbumOrder = DB::table('album_orders')
            ->where('order_id', $req->input('order_id'))
            ->delete();

        if ($deletedAlbumOrderDetail > 0 || $deletedAlbumOrder > 0)
            return response()->json(['message' => 'AlbumOrder deleted successfully'], 200);
        else
            return response()->json(['error' => 'AlbumOrder not found'], 404);
    }

    function getOrderDetail(Request $req)
    {
        $details = AlbumOrderDetail::where('order_id', $req->input('order_id'))
            ->join('album_physicals', 'album_physicals.album_physi_id', '=', 'album_order_details.album_physi_id')
            ->get();

        if ($details)
            return $details;
        else
            return response()->json(['error' => 'OrderDetail not found'], 404);
    }
}
