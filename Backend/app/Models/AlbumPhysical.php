<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AlbumPhysical extends Model
{
    use HasFactory;
    
    protected $fillable = [
        'album_physi_id',
        'album_name',
        'type',
        'user_id',
        'updated_at',
        'created_at',
        'artist_id',
        'quantity',
        'min_price',
        'max_price',
        'description',
        'url_poster',
    ];
}
