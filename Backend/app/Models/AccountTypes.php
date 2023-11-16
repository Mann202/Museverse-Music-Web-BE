<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Account_Types extends Model
{
    use HasFactory;
    protected $fillable = [
        'account_id	',
        'account_type',
        'created_at',
        'accountStatusID'
    ];
}
