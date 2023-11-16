<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class History extends Model
{
    use HasFactory;
    protected $fillable = [
        'id',
        'song_id',
        'user_id',
        'listened_at'
    ];
}
