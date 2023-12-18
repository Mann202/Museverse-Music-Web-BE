<?php

namespace App\Http\Controllers;

use App\Models\AlbumOrder;
use App\Models\AlbumOrderDetail;
use App\Models\AlbumPhysical;
use App\Models\AlbumPhysicalDetail;
use App\Models\Users;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AlbumOrderController extends Controller
{
    function addtocart(Request $req)
    {
        $order = AlbumOrder::where("cust_id", $req->cust_id)
            ->where('status', 1)
            ->first();
        if (!$order) {
            $neworder = new AlbumOrder;
            $neworder->cust_id = $req->input('cust_id');
            $neworder->status = 1;
            $neworder->total = 0;

            $neworder->save();
        } else {
            // echo "This cus already have order, move to add to cart";            
        }



        $order = AlbumOrder::where("cust_id", $req->cust_id)
            ->where('status', 1)
            ->first();

        $ordetail = AlbumOrderDetail::where("order_id", $order->order_id)
            ->where("album_physi_id", $req->input('album_physi_id'))
            ->where("price", $req->input('price'))
            ->whereNot("order_status", 0)
            ->first();

        if (!$ordetail) {
            $orderdetail = new AlbumOrderDetail;
            $orderdetail->order_id = $order->order_id;
            $orderdetail->album_physi_id = $req->input('album_physi_id');
            $orderdetail->price = $req->input('price');
            $orderdetail->num = $req->input('num');
            $orderdetail->order_status = 1;
            $orderdetail->total_money = $req->input('price') * $req->input('num');

            $orderdetail->save();
            return ["message" => "Add to cart successfully!"];
        } else {
            $ordetail->num += 1;
            $ordetail->total_money = $req->input('price') * $ordetail->num;
            $ordetail->save();
            return ["message" => "This album is already added to cart!"];
        }
    }
    function createOrder(Request $req)
    {
        $order = AlbumOrder::where("cust_id", $req->cust_id)
            ->where('status', 1)
            ->first();
        if (!$order) {
            $neworder = new AlbumOrder;
            $neworder->cust_id = $req->input('cust_id');
            $neworder->status = 1;
            $neworder->total = 0;

            $neworder->save();
        } else {
            // echo "This cus already have order, move to add to cart";            
        }



        $order = AlbumOrder::where("cust_id", $req->cust_id)
            ->where('status', 1)
            ->first();

        $details = $req->input('details');

        $return = [];

        foreach ($details as $detail) {
            $ordetail = AlbumOrderDetail::where("order_id", $order->order_id)
                ->where("album_physi_id", $detail['album_physi_id'])
                ->whereNot("order_status", 0)
                ->first();

            if (!$ordetail) {
                $orderdetail = new AlbumOrderDetail;
                $orderdetail->order_id = $order->order_id;
                $orderdetail->album_physi_id = $detail['album_physi_id'];
                if ($orderdetail->variant_name == null)
                    $orderdetail->price = $detail['min_price'];
                else
                    $orderdetail->price = $detail['variant_price'];

                $orderdetail->num = $detail['num'];
                $orderdetail->order_status = 1;
                $orderdetail->total_money = $detail['total_money'];

                $orderdetail->save();
                $return[] = $orderdetail;
            } else {
                $ordetail->num = $detail['num'];
                $ordetail->total_money = $detail['total_money'];
                $ordetail->save();
            }
        }

        return $return;
    }
    function loadCart(Request $req)
    {
        $order = AlbumOrder::where('cust_id', $req->cust_id)
            ->where('status', 1)
            ->first();
        if (!$order) {
            return ["Error" => 1];
        } else {
            $order_id = $order->order_id;
            $orders = AlbumOrderDetail::where('order_id', $order_id)
                ->where('order_status', 1)
                ->join('album_physicals', 'album_physicals.album_physi_id', '=', 'album_order_details.album_physi_id')
                ->select('album_physicals.*', 'album_order_details.*')
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
    function deleteOrderDuplicate()
    {
        $ordersToDelete = DB::table('album_orders as a')
            ->whereNotIn('a.order_id', function ($query) {
                $query->select('a.order_id')
                    ->from('album_orders as a')
                    ->join('album_order_details as b', 'a.order_id', '=', 'b.order_id');
            })
            ->pluck('a.order_id')
            ->toArray();

        $deletedRows = DB::table('album_orders')
            ->whereIn('order_id', $ordersToDelete)
            ->delete();

        return $deletedRows;
    }
    function pay(Request $req)
    {
        $order = AlbumOrder::where('cust_id', $req->cust_id)
            ->where('status', 1)
            ->first();

        if (!$order) {
            return ["Error" => "Order not found!"];
        } else {
            $old_order_id = $order->order_id;
            $order->cust_name = $req->input('first_name') . " " . $req->input('last_name');
            $order->cust_email = $req->input('email_address');
            $order->cust_contact_number = $req->input('contact_number');
            $order->cust_address = $req->input('address');
            $order->note = $req->input('note');
            $order->total_final += $req->input('total_final');
            $order->status = 0;

            $details = $req->input('details');


            foreach ($details as $item) {
                $detail = AlbumOrderDetail::where('detail_id', $item['detail_id'])->first();
                $detail->order_status = 0;
                $detail->num = $item['num'];
                $detail->total_money = $item['total_money'];
                $detail->save();

                $albumVer = AlbumPhysicalDetail::where('album_physi_id', $item['album_physi_id'])->first();
                if ($albumVer) {
                    $albumVer->stock_quantity -= $item['num'];
                    $albumVer->save();
                } else {
                    $album = AlbumPhysical::where('album_physi_id', $item['album_physi_id'])->first();
                    $album->quantity -= $item['num'];
                    $album->save();
                }
            }

            $order->save();

            $neworder = new AlbumOrder;
            $neworder->cust_id = $req->input('cust_id');
            $neworder->status = 1;
            $neworder->total = 0;

            $neworder->save();

            $norder = AlbumOrder::where("cust_id", $req->cust_id)
                ->where('status', 1)
                ->first();

            DB::table('album_order_details')
                ->where('order_id', $old_order_id)
                ->where('order_status', 1)
                ->update(['order_id' => $norder->order_id]);

            $this->deleteOrderDuplicate();
            return $order;
        }
    }
}
