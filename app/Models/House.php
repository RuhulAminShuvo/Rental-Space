<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class House extends Model
{
    use HasFactory;
    protected $fillable = [
        'user_id',
        'title',
        'description',
        'booking_date',
        'expired_date',
        'rent',
        'service_charge',
        'security_deposit',
        'flat_release_policy',
        'address',
        'flat_size',
        'room_category',
        'facilities',
        'additional_facilities',
        'indoor_features',
    ];
    public function houseImages(){
        return $this->hasMany('App\Models\HouseImage');
    }
    public function bookHouseDates(){
        return $this->hasMany('App\Models\BookHouseDate');
    }
    public function user(){
        return $this->belongsTo('App\Models\User');
    }
}
