<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Album_Physical extends Model
{
    use HasFactory;
    protected $fillable = [
        'album_physi_id',
        'album_name',
        'created_ad',
        'artist_id',
        'quantity',
        'price'
    ];
}
