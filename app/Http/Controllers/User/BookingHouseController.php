<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\House;
use App\Models\User;
use App\Models\BookHouse;
use App\Models\BookHouseDate;
use App\Models\Review;
use Auth;
use Carbon\Carbon;
class BookingHouseController extends Controller
{
    public function booking(Request $request){
        
        if (Auth::user()->file == null) {
            $notification=array(
            'message'=>'Please first update your notional id card',
            'alert-type'=>'error'
            );
            return Redirect()->back()->with($notification);
        }
        else{


        $date = explode(' - ',$request->booking_date);
        $bDate = $date[0];
        $eDate = $date[1];
        
        
        $findHouse = BookHouseDate::where('house_id',$request->house_id)->first();
                $bDate = strtotime($bDate);
                $eDate = strtotime($eDate);
                $bDate = date('y-m-d',$bDate);
                $eDate = date('y-m-d',$eDate);
                
            $findHouseDate = BookHouseDate::where('house_id',$request->house_id)->whereBetween('booking_date',[$bDate,$eDate])->get();
            $findHouseDateE = BookHouseDate::where('house_id',$request->house_id)->whereBetween('expired_date',[$bDate,$eDate])->get();

            $i = 1;
            foreach($findHouseDate as $findHouseDates){
                $i++;
            }
            foreach($findHouseDateE as $findHouseDateEs){
                $i++;
            }
            
            
            if ($i != 1) {
                $notification=array(
                    'message'=>'This day This house is not available',
                    'alert-type'=>'success'
                );
                
                return Redirect()->back()->with($notification);
            }
            else{
                $bookHouse = BookHouse::insertGetId([
                'user_id'               => Auth::user()->id,
                'house_id'              => $request->house_id,
                'house_owner_id'        => $request->house_owner_id,
                'booking_date'          => $bDate,
                'expired_date'          => $eDate,
                'member'                => $request->member,
                'children'              => $request->children,
                'message'               => $request->message,
                'created_at'            => Carbon::now(),
               ]);
                $bHouse = BookHouse::where('id',$bookHouse)->first();
                
                return view('fontend.confirmBookHouse',compact('bHouse'));
            }
        }    
    }

    public function index($id){
        $bookHouses = BookHouse::latest()->where('house_owner_id',Auth::user()->id)->where('house_id',$id)->where('status',0)->get();
        return view('backend.HouseOwner.bookHouse.all',compact('bookHouses'));
    }

    public function approve(Request $request){
        $house = House::where('id',$request->house_id)->first();

        $bookHouse = BookHouse::where('id',$request->id)->first();
        

        //$otherBookHouses = BookHouse::where('house_id',$house->id)->where('id','!=',$bookHouse->id)->get();
        $bookHouseDate = BookHouseDate::insertGetId([
            'house_id' => $request->house_id,
            'booking_date' => $bookHouse->booking_date,
            'expired_date' => $bookHouse->expired_date,
            'created_at'   => Carbon::now(),
        ]);
        $bookHouseUpdate = BookHouse::findOrFail($bookHouse->id)->update([
            'status' => 1,
            'updated_at' => Carbon::now(),
        ]);

        // if ($otherBookHouses != null) {
        //     foreach($otherBookHouses as $otherBookHouse){
        //         $otherBookHouseUpdate = BookHouse::findOrFail($otherBookHouse->id)->update([
        //             'status' => 2,
        //             'updated_at' => Carbon::now(),
        //         ]);
        //     }
        // }
        return Redirect()->back();


    }

    public function reviewStore(Request $request){
        $house = House::where('id',$request->house_id)->first();
        $total_review   = $house->total_review + 1;
        $total_rating   = $house->total_rating + $request->rating;
        $average_rating = $total_rating / $total_review;

        $review  = Review::Find($request->id);
        $review->rating = $request->rating;
        $review->comment = $request->comment;
        $review->status = 1;
        $review->save();
        $houseUpdate = House::Find($house->id);
        $houseUpdate->total_review = $total_review;
        $houseUpdate->total_rating = $total_rating;
        $houseUpdate->average_rating = $average_rating;
        $houseUpdate->save();
        return Redirect()->back();
    }
}

