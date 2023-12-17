<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AlbumOrder extends Model
{
    protected $table = 'album_orders';
    protected $primaryKey = 'order_id';
    protected $fillable = [];
}
