<?php
namespace App\Http\Controllers\adhoards;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AdhordsController extends Controller{

    public function adhoards()
    {
        return view('adhoards.home');
    }

}