<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AlbumOrder extends Model
{
    use HasFactory;

    protected $primaryKey = 'order_id';
    
    protected $fillable = [
        'order_id ',
        'cust_name',
        'cust_email',
        'cust_contact_number',
        'cust_address',
        'cust_id',
        'note',
        'total',
        'total_final',
        'status',
        'created_at',
        'updated_at'
    ];
}
