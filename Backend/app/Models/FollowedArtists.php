<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Followed_Artists extends Model
{
    use HasFactory;
    protected $fillable = [
        'follow_id',
        'user_id',
        'artirst_id',
        'follow_at'
    ];
}
