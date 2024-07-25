<?php

namespace App\Http\Controllers;
use App\Models\User;

use Illuminate\Http\Request;

class ArticleController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:edit articles')->only('edit', 'update');
    }
    public function index()
    {
        $user = User::all();
        return view('admin.dashboard', compact('user'));
    }
}
