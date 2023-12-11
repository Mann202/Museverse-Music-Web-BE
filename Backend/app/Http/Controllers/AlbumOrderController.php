<?php

namespace App\Http\Controllers;

use App\Models\AlbumOrder;
use App\Models\AlbumOrderDetail;
use App\Models\AlbumPhysical;
use App\Models\AlbumPhysicalDetail;
use App\Models\Users;
use Illuminate\Http\Request;

class AlbumOrderController extends Controller
{
    function addtocart(Request $req)
    {
        $order = AlbumOrder::where("cust_id", $req->cust_id)->first();
        if (!$order) {
            $neworder = new AlbumOrder;
            $neworder->cust_id = $req->input('cust_id');
            $neworder->status = 1;
            $neworder->total = 0;

            $neworder->save();
        } else {
            // echo "This cus already have order, move to add to cart";            
        }

        $order = AlbumOrder::where("cust_id", $req->cust_id)->first();

        $ordetail = AlbumOrderDetail::where("order_id", $order->order_id)
            ->where("album_physi_id", $req->input('album_physi_id'))
            ->where("price", $req->input('price'))
            ->whereNot("order_status", 0)
            ->first();

        echo $ordetail;
        if (!$ordetail) {
            $orderdetail = new AlbumOrderDetail;
            $orderdetail->order_id = $order->order_id;
            $orderdetail->album_physi_id = $req->input('album_physi_id');
            $orderdetail->price = $req->input('price');
            $orderdetail->num = $req->input('num');
            $orderdetail->order_status = 1;
            $orderdetail->total_money = $req->input('price') * $req->input('num');

            $orderdetail->save();
            return $orderdetail;
        } else {

            $ordetail->num += 1;
            $ordetail->total_money = $req->input('price') * $ordetail->num;
            $ordetail->save();
        }
    }
    function loadCart(Request $req)
    {
        $order = AlbumOrder::where('cust_id', $req->cust_id)->first();
        if (!$order) {
            return ["Error" => 1];
        } else {
            $order_id = $order->order_id;
            $orders = AlbumOrderDetail::where('order_id', $order_id)
                ->where('order_status', 1)
                ->join('album_physicals', 'album_physicals.album_physi_id', '=', 'album_order_details.album_physi_id')
                ->select('album_physicals.*', 'album_order_details.*' )
                ->get();

            return $orders;
        }
    }
    function deleteCart(Request $req)
    {
        $rowIds = $req->input('arr');
        $deletedRows = 0;

        if (is_array($rowIds) && count($rowIds) > 0) {
            $deletedRows = AlbumOrderDetail::whereIn('detail_id', $rowIds)->delete();
        }

        return $deletedRows; // Trả về số lượng dòng đã bị xóa

    }

    function pay(Request $req)
    {
        $order = AlbumOrder::where('cust_id', $req->cust_id)->first();
        if (!$order) {
            return ["Error" => 1];
        } else {
            $order->cust_name = $req->input('first_name') . " " . $req->input('last_name');
            $order->cust_email = $req->input('email_address');
            $order->cust_contact_number = $req->input('contact_number');
            $order->cust_address = $req->input('address');
            $order->note = $req->input('note');
            $order->total_final += $req->input('total_final');

            $details = $req->input('details');
            // $details = json_decode($req->input('details'), true);


            foreach ($details as $item) {
                $detail = AlbumOrderDetail::where('detail_id', $item['detail_id'])->first();
                $detail->order_status = 0;
                $detail->save();

                $albumVer = AlbumPhysicalDetail::where('album_physi_id', $item['album_physi_id'])->first();
                if ($albumVer) {
                    $albumVer->stock_quantity -= $item['num'];
                    $albumVer->save();
                }else{
                    $album = AlbumPhysical::where('album_physi_id', $item['album_physi_id'])->first();
                    $album->quantity -= $item['num'];
                    $album->save();
                }
                
            }
            $order->save();
            return $order;
        }
    }
}
