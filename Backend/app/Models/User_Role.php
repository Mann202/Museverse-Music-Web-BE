<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class User_Role extends Model
{
    use HasFactory;

    protected $table = 'user_role'; // Thêm dòng này để xác định tên của bảng
    
    protected $fillable = [
        'user_id',
        'role_id'
    ];
}
