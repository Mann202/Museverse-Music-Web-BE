<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Users extends Model
{
    use HasFactory;
    protected $primaryKey = "user_id";
    protected $fillable = [
        // 'user_id',
        'first_name',
        'last_name',
        'date_of_birth',
        'contact_number',
        // 'email_address',
        // 'email_confirmed',
        // 'accountTypeID',
        // 'accountStatusID',
        // 'username',
        // 'password',
    ];
    protected $hidden = [
        'password',
        'remember_token',
    ];
    // public $timestamps = false;
    public function accountStatus(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(AccountStatus::class, 'accountStatusID', 'account_status_id');
    }

    public function orders()
    {
        return $this->hasMany(AlbumOrder::class, 'cust_id', 'user_id');
    }
}
