<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Playlists extends Model
{
    use HasFactory;
    protected $fillable = [
        'playlist_id',
        'title_playlist',
        'user_id',
        'created_at'
    ];
}
