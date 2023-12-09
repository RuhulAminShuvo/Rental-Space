<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\House;
use App\Models\User;
use App\Models\BookHouse;
use App\Models\BookHouseDate;
use App\Models\Review;
use Auth;
use Carbon\Carbon;
class StripeController extends Controller
{
    public function store(Request $request){
        $total_amount = $request->total_rent_with_commission;
        \Stripe\Stripe::setApiKey('sk_test_51JCzs9JXz4mwbqPLnWJp4CTKlQgvKdH1eHV9CtpGWppZdjFy6srKO0eXp33ApHztUTbV20n7vpxhbPNxCgsNRutp00PsCF9T0B');
        $token = $_POST['stripeToken'];
        $charge = \Stripe\Charge::create([
        'amount' => $total_amount*100,
        'currency' => 'usd',
        'description' => 'Payment From Rental Space',
        'source' => $token,
        'metadata' => ['user_id' => uniqid()],
        ]);

        $house = House::where('id',$request->house_id)->first();

        $bookHouse = BookHouse::where('id',$request->id)->first();
        

        
        $bookHouseDate = BookHouseDate::insertGetId([
            'house_id' => $request->house_id,
            'user_id' => Auth::user()->id,
            'house_owner_id' => $request->house_owner_id,
            'house_id' => $request->house_id,
            'booking_date' => $bookHouse->booking_date,
            'change' => $request->commission,
            'total_rent' => $request->total_rent,
            'total_rent_with_commission' => $request->total_rent_with_commission,
            'commission' => $request->commission,
            'days' => $request->days,
            'currency' => $charge->currency,
            'transaction_id' => $charge->balance_transaction,
            'expired_date' => $bookHouse->expired_date,
            'created_at'   => Carbon::now(),
        ]);
        $bookHouseUpdate = BookHouse::findOrFail($bookHouse->id)->update([
            'status' => 1,
            'updated_at' => Carbon::now(),
        ]);

        $review = Review::insertGetId([
            'house_id' => $request->house_id,
            'user_id' => Auth::user()->id,
            'house_owner_id' => $request->house_owner_id,
            'house_id' => $request->house_id,
            'created_at'   => Carbon::now(),
        ]);
        $notification=array(
            'message'=>'Room Book Success',
            'alert-type'=>'success'
        );
        return Redirect()->route('user.dashboard')->with($notification);

    }}
