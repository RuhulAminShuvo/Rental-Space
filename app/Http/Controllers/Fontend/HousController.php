<?php

namespace App\Http\Controllers\Fontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\House;
use App\Models\HouseImage;
use App\Models\BookHouseDate;
use Carbon\Carbon;
use Intervention\Image\Facades\Image;
use Auth;
class HousController extends Controller
{
    public function singleHouse($id){
        $house = House::where('id',$id)->with('bookHouseDates')->first();
        $houseDates = BookHouseDate::where('house_id',$house->id)->get()->take(5);
        return view('fontend.singleHouse',compact('house','houseDates'));
    }
    public function allHouse(){
        $houses = House::orderBy('id','desc')->with('bookHouseDates')->get();
        return view('fontend.allHouse',compact('houses'));
    }
    public function categoryHouse($id){
        $houses = House::orderBy('id','desc')->where('category_id',$id)->get();
        return view('fontend.allHouse',compact('houses'));

    }
    
    public function newToOldHouse(){
        $houses = House::orderBy('id','desc')->get();
        return view('fontend.allHouse',compact('houses'));
    }
    public function oldToNewHouse(){
        $houses = House::orderBy('id','asc')->get();
        return view('fontend.allHouse',compact('houses'));
    }
    public function newToOldHousePrice(){
        $houses = House::orderBy('rent','desc')->get();
        return view('fontend.allHouse',compact('houses'));
    }
    public function oldToNewHousePrice(){
        $houses = House::orderBy('rent','asc')->get();
        return view('fontend.allHouse',compact('houses'));
    }
    public function availAbleHouse(Request $request){

        $houses = House::orderBy('id','desc')->with('bookHouseDates')->where("address","LIKE","%".$request->address."%")->whereBetween('rent', [$request->min_rent,$request->max_rent])->get();

        return view('fontend.allHouse',compact('houses'));
    }
}
