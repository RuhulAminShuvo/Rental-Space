<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCancelBookingsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('cancel_bookings', function (Blueprint $table) {
            $table->id();
            $table->integer('user_id');
            $table->integer('house_owner_id');
            $table->integer('house_id');
            $table->text('comment')->nullable();
            $table->integer('status')->default(0)->comment('0 for en-complete 1 for complete');
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
        Schema::dropIfExists('cancel_bookings');
    }
}
