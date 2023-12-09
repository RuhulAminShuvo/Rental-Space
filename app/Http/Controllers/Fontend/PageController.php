<?php

namespace App\Http\Controllers\Fontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class PageController extends Controller
{
    public function index(){
        $categories = Category::latest()->get();
        return view('fontend.index',compact('categories'));
    }
    public function about(){
        return view('fontend.about');
    }
    public function contact(){
        return view('fontend.contact');
    }
}
