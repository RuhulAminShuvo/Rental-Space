<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBookHousesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('book_houses', function (Blueprint $table) {
            $table->id();
            $table->integer('user_id');
            $table->integer('house_id');
            $table->integer('house_owner_id');
            $table->string('booking_date')->nullable();
            $table->string('expired_date')->nullable();
            $table->string('member')->nullable();
            $table->string('children')->nullable();
            $table->text('message')->nullable();
            $table->integer('status')->default(0)->comment('1 for active o for en-active 2 for booked');
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
        Schema::dropIfExists('book_houses');
    }
}
