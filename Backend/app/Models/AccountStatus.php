<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AccountStatus extends Model
{
    use HasFactory;

    protected $table = 'account_status';

    protected $primaryKey = 'account_status_id';
    protected $fillable = [
        'accountStatusID',
        'status'
    ];
}
