<?php

namespace App\Http\Controllers\HouseOwner;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Category;
use App\Models\House;
use App\Models\BookHouseDate;
use App\Models\HouseImage;
use Carbon\Carbon;
use Intervention\Image\Facades\Image;
use Auth;
class HouseController extends Controller
{
    public function index(){
        $houses = House::latest()->where('user_id',Auth::user()->id)->get();
        return view('backend.HouseOwner.house.index',compact('houses'));
    }

    public function allHosue(){
        $houses = House::latest()->get();
        return view('backend.admin.house.all',compact('houses'));
    }
    public function create(){
        $categories = Category::latest()->get();
        return view('backend.HouseOwner.house.create',compact('categories'));
    }
    public function store(Request $request){
        $request->validate([
            // 'image' => 'required',
            
       ]);
        $save_image = null;
        if ($request->file('image')) {
            $image = $request->file('image');
            $name_gen=hexdec(uniqid()).'.'.$image->extension();
            Image::make($image)->resize(377,283)->save('image/house/'.$name_gen);
            $save_image = 'image/house/'.$name_gen;
        }
       $house = House::insertGetId([
        'user_id'               => Auth::user()->id,
        'category_id'           => $request->category_id,
        'title'                 => $request->title,
        'description'           => $request->description,
        'rent'                  => $request->rent,
        'service_charge'        => $request->service_charge,
        'security_deposit'      => $request->security_deposit,
        'flat_release_policy'   => $request->flat_release_policy,
        'address'               => $request->address,
        'flat_size'             => $request->flat_size,
        'floor'                 => $request->floor,
        'room_category'         => $request->room_category,
        'facilities'            => $request->facilities,
        'additional_facilities' => $request->additional_facilities,
        'indoor_features'       => $request->indoor_features,
        'bed_room'              => $request->bed_room,
        'bath_room'             => $request->bath_room,
        'image'                 => $save_image,
        'created_at' => Carbon::now(),
       ]);

       //////////////////// Multiple image uplod start /////////////////////////////////
        $images = $request->file('multi_img');
        foreach ($images as $img) {
            $make_name=hexdec(uniqid()).'.'.$img->extension();
            Image::make($img)->resize(750,549)->save('image/house/'.$make_name);
            $uplodPath = 'image/house/'.$make_name;

            HouseImage::insertGetId([
                'house_id' => $house,
                'image' => $uplodPath,
                'created_at' => Carbon::now(),
            ]);
        }
     //////////////////// Multiple image uplod End /////////////////////////////////

        $notification=array(
            'message'=>'House add Successfully Successfully',
            'alert-type'=>'success'
        );
       return Redirect()->back()->with($notification);
    }
    public function distroy(Request $request){
        House::findOrFail($request->id)->delete();
        return Redirect()->back();
    }
    public function edit($id){
        $house = House::find($id);
        return view('backend.HouseOwner.house.edit',compact('house'));
    }
    public function update($id, Request $request){
        $request->validate([
            // 'image' => 'required',
            
       ]);
        $save_image = null;
        if ($request->file('image')) {
            $image = $request->file('image');
            $name_gen=hexdec(uniqid()).'.'.$image->extension();
            Image::make($image)->resize(377,283)->save('image/house/'.$name_gen);
            $save_image = 'image/house/'.$name_gen;
        }
       $house = House::findOrFail($id)->update([
        'user_id'               => Auth::user()->id,
        'category_id'           => $request->category_id,
        'title'                 => $request->title,
        'description'           => $request->description,
        'rent'                  => $request->rent,
        'service_charge'        => $request->service_charge,
        'security_deposit'      => $request->security_deposit,
        'flat_release_policy'   => $request->flat_release_policy,
        'address'               => $request->address,
        'flat_size'             => $request->flat_size,
        'floor'                 => $request->floor,
        'room_category'         => $request->room_category,
        'facilities'            => $request->facilities,
        'additional_facilities' => $request->additional_facilities,
        'indoor_features'       => $request->indoor_features,
        'bed_room'              => $request->bed_room,
        'bath_room'             => $request->bath_room,
        'image'                 => $save_image,
        'created_at' => Carbon::now(),
       ]);

       //////////////////// Multiple image uplod start /////////////////////////////////
        $images = $request->file('multi_img');
        if ($images != null) {
            foreach ($images as $img) {
            $make_name=hexdec(uniqid()).'.'.$img->extension();
            Image::make($img)->resize(750,549)->save('image/house/'.$make_name);
            $uplodPath = 'image/house/'.$make_name;

            HouseImage::insertGetId([
                'house_id' => $house,
                'image' => $uplodPath,
                'created_at' => Carbon::now(),
            ]);
        }
        }
        
     //////////////////// Multiple image uplod End /////////////////////////////////

        $notification=array(
            'message'=>'House Update Successfully',
            'alert-type'=>'success'
        );
       return Redirect()->back()->with($notification);
    }
    public function all(){
        $bookHouses = BookHouseDate::latest()->where('house_owner_id',Auth::user()->id)->get();

        return view('backend.HouseOwner.bookHouse.all',compact('bookHouses'));
    }
}
