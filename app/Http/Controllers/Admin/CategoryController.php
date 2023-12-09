<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Category;
use Carbon\Carbon;
use Intervention\Image\Facades\Image;
use File;
class CategoryController extends Controller
{
    public function index(){
        $categories = Category::latest()->get();
        return view('backend.category.index',compact('categories'));
    }
    public function create(){
        return view('backend.category.create');
    }
    public function store(Request $request){
        $request->validate([
            'name' => 'required',
            // 'image' => 'required',
            
       ]);
        $save_url = null;
        if ($request->file('image')) {
            $image = $request->file('image');
            $name_gen=hexdec(uniqid()).'.'.$image->getClientOriginalExtension();
            Image::make($image)->save('image/category/'.$name_gen);
            $save_url = 'image/category/'.$name_gen;
        }
        
       Category::insert([
        'name' => $request->name,
        'category_slug' => strtolower(str_replace(' ','-',$request->name)),
        'image' => $save_url,
        'created_at' => Carbon::now(),
       ]);
       return Redirect()->route('category.manage');
    }
    public function edit($id){
        $category = Category::find($id);
        return view('backend.category.edit',compact('category'));
    }
    public function update($id, Request $request){
        $request->validate([
            'name' => 'required',
            // 'image' => 'required',
            
       ]);
        $save_url = null;
        if ($request->file('image')) {
            $image = $request->file('image');
            $name_gen=hexdec(uniqid()).'.'.$image->getClientOriginalExtension();
            Image::make($image)->save('image/category/'.$name_gen);
            $save_url = 'image/category/'.$name_gen;
        }
        $categories = Category::findOrFail($id)->update([
            'name' => $request->name,
            'category_slug' => strtolower(str_replace(' ','-',$request->name)),
            'image' => $save_url,
            'updated_at' => Carbon::now(),
        ]);
        return Redirect()->route('category.manage');   
    }
    public function distroy(Request $request){
        Category::findOrFail($request->id)->delete();
        return Redirect()->back();
    }


}
