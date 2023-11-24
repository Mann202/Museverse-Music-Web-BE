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
        'song_id',
        'user_id',
        'picture',
        'created_at',
        'updated_at'
    ];
}
