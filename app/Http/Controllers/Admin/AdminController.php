<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Carbon\Carbon;
use Intervention\Image\Facades\Image;
use App\Models\User;
use App\Models\BookHouseDate;
use Illuminate\Support\Facades\Hash;
use File;
use Auth;
class AdminController extends Controller
{
    public function index(){
        return view('backend.index');
    }

    public function allHosueOwner(){
        $house_owners =   User::latest()->where('role_id',2)->get();
        return view('backend.admin.houseOwner.all',compact('house_owners'));
    }
    public function allVarati(){
        $users =   User::latest()->where('role_id',3)->get();
        return view('backend.admin.user.all',compact('users'));
    }
    public function allBookingHouse(){
        $allBookingHouses =   BookHouseDate::latest()->get();
        return view('backend.admin.house.allBookingHouse',compact('allBookingHouses'));
    }
    public function edit(){
        $user = User::where('id',Auth::user()->id)->first();
        return view('backend.user.edit',compact('user'));
    }

    public function update(Request $request){
        $request->validate([
            'name' => 'required',
       ]);
        $save_url = null;
        if ($request->file('image')) {
            $image = $request->file('image');
            $name_gen=hexdec(uniqid()).'.'.$image->getClientOriginalExtension();
            Image::make($image)->save('image/user/'.$name_gen);
            $save_url = 'image/user/'.$name_gen;
        }
        User::findOrFail(Auth::user()->id)->update([
            'name' => $request->name,
            'phone' => $request->phone,
            'image' => $save_url,
            'updated_at' => Carbon::now(),
        ]);
        return Redirect()->back();   
    }
    public function changePassword(){
        $user = User::where('id',Auth::user()->id)->first();
        return view('backend.user.changePassword',compact('user'));
    }
    //store password
    public function storePassword(Request $request){
        $request->validate([
            'old_password' => 'required',
            'new_password' => 'required|min:8',
            'password_confirmation' => 'required|min:8',
        ]);

        $db_pass = Auth::user()->password;
        $current_password = $request->old_password;
        $newpass = $request->new_password;
        $confirmpass = $request->password_confirmation;

       if (Hash::check($current_password,$db_pass)) {
          if ($newpass === $confirmpass) {
              User::findOrFail(Auth::id())->update([
                'password' => Hash::make($newpass)
              ]);

              Auth::logout();
              $notification=array(
                'message'=>'Your Password Change Success. Now Login With New Password',
                'alert-type'=>'success'
            );
            return Redirect()->route('login')->with($notification);

          }else {

            $notification=array(
                'message'=>'New Password And Confirm Password Not Same',
                'alert-type'=>'success'
            );
            return Redirect()->back()->with($notification);
          }
       }else {
        $notification=array(
            'message'=>'Old Password Not Match',
            'alert-type'=>'error'
        );
        return Redirect()->back()->with($notification);
       }
    }

    public function downloadNationalId($id){
        $user = User::Find($id);
        if ($user->file !== null) {
            return response()->download(public_path('uploads/'.$user->file));
        }
        else{
           $notification=array(
            'message'=>'User do not update national id card',
            'alert-type'=>'error'
            );
            return Redirect()->back()->with($notification);
           } 
        }
        
    
}
