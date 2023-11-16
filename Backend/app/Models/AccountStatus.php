<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Account_Status extends Model
{
    use HasFactory;
    protected $fillable = [
        'accountStatusID',
        'status'
    ];
}
