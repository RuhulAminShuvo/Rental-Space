<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBookHouseDatesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('book_house_dates', function (Blueprint $table) {
            $table->id();
            $table->integer('house_id');
            $table->integer('user_id');
            $table->integer('house_owner_id');
            $table->date('booking_date')->nullable();
            $table->string('change')->nullable();
            $table->string('total_rent')->nullable();
            $table->string('total_rent_with_commission')->nullable();
            $table->string('commission')->nullable();
            $table->string('days')->nullable();
            $table->string('currency')->nullable();
            $table->string('transaction_id')->nullable();
            $table->date('expired_date')->nullable();
            $table->integer('status')->default(1)->comment('1 for active 2 for cancel request 3 for cancel');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('book_house_dates');
    }
}
