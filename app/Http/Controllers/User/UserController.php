<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\BookHouseDate;
use Carbon\Carbon;
use Illuminate\Support\Facades\Hash;
use Intervention\Image\Facades\Image;
use App\Models\User;
use File;
use Auth;
class UserController extends Controller
{
    public function index(){
        return view('fontend.index');
    }
    public function myAccount(){
        $bookHouses = BookHouseDate::latest()->where('user_id',Auth::user()->id)->get();
        return view('fontend.myAccount',compact('bookHouses'));
    }
    public function myAccountDetail(){
        $user = User::where('id',Auth::user()->id)->first();
        return view('fontend.accoutDetails',compact('user'));
    }
    public function changePassword(){
        $user = User::where('id',Auth::user()->id)->first();
        return view('fontend.changePassword',compact('user'));
    }
    public function update(Request $request){
        $request->validate([
            'name' => 'required',
       ]);
        $save_url = null;
        $save_file = null;
        if ($request->file('image')) {
            $image = $request->file('image');
            $name_gen=hexdec(uniqid()).'.'.$image->getClientOriginalExtension();
            Image::make($image)->save('image/user/'.$name_gen);
            $save_url = 'image/user/'.$name_gen;
        }
        if ( $request->file ) 
        {
            $file                   = $request->file('file');
            $fileName = time().'.'.$request->file->extension();
            $request->file->move(public_path('uploads'), $fileName);
            $save_file             = $fileName;
        }
        User::findOrFail(Auth::user()->id)->update([
            'name' => $request->name,
            'phone' => $request->phone,
            'image' => $save_url,
            'file' => $save_file,
            'updated_at' => Carbon::now(),
        ]);
        return Redirect()->back();   
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
}
