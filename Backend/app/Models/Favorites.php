<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Favorites extends Model
{
    use HasFactory;
    protected $fillable = [
        'favorite_id',
        'song_id',
        'user_id'
    ];
}
