<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Carbon\Carbon;
use App\Models\Contact;
class ContactController extends Controller
{
    public function store(Request $request){
        $request->validate([
            'name' => 'required',
            // 'image' => 'required',
            
       ]);
        
        
       Contact::insert([
        'name' => $request->name,
        'email' => $request->email,
        'website' => $request->website,
        'message' => $request->message,
        'created_at' => Carbon::now(),
       ]);
       return Redirect()->back();
    }
    public function all(){
        $contacts = Contact::latest()->get();
        return view('backend.Contact.all',compact('contacts'));
    }
}
