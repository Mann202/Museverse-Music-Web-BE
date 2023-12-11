<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AlbumOrders extends Model
{
    use HasFactory;
    protected $fillable = [
        'order_id',
        'cust_name',
        'cust_email',
        'cust_contact_number',
        'cust_address',
        'cust_id',
        'note',
        'status',
        'total',
        'created_at',
        'updated_at'
    ];
}
