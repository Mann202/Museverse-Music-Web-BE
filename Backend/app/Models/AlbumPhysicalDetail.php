<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AlbumPhysicalDetail extends Model
{
    use HasFactory;
    
    protected $fillable = [
        'id',
        'album_physi_id',
        'variant_name',
        'stock_quantity',
        'variant_price',
        'created_at',
        'updated_at'
    ];
}
