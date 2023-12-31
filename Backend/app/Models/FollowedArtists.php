<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FollowedArtists extends Model
{
    use HasFactory;
    protected $fillable = [
        'id',
        'user_id',
        'artirst_id',
        'follow_at'
    ];
}
