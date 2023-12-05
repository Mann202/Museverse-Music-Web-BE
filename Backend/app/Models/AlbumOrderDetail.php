<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AlbumOrderDetail extends Model
{
    use HasFactory;
<<<<<<< Updated upstream
    
    protected $primaryKey = 'detail_id';
    protected $fillable = [
        'detail_id',
        'order_id ',
        'album_physi_id',
        'order_status',
        'price',
=======
    protected $fillable = [
        'detail_id',
        'order_id',
        'album_physi_id',
        'variant_id',
>>>>>>> Stashed changes
        'num',
        'total_money',
        'created_at',
        'updated_at'
    ];
}
