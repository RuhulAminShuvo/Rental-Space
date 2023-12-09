<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BookHouse extends Model
{
    use HasFactory;
    protected $fillable = [
        'user_id',
        'house_id',
        'booking_date',
        'expired_date',
        'member',
        'children',
        'message',
        'status',
    ];
    public function bookHouseDates(){
        return $this->hasMany('App\Models\BookHouseDate');
    }
    public function House(){
        return $this->belongsTo('App\Models\House');
    }
    public function user(){
        return $this->belongsTo('App\Models\User');
    }
}
