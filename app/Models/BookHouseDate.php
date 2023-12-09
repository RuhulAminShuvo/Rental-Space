<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BookHouseDate extends Model
{
    use HasFactory;
    protected $fillable = [
        'house_id',
        'booking_date',
        'expired_date',
    ];
}
