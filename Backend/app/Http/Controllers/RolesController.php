<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Roles;

class RolesController extends Controller
{
    function getRole() {
        $role = Roles::all();
        return $role;
    }
}
