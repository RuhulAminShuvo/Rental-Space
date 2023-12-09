<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateHousesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('houses', function (Blueprint $table) {
            $table->id();
            $table->integer('user_id');
            $table->integer('category_id')->nullable();
            $table->string('title');
            $table->text('description')->nullable();
            $table->string('booking_date')->nullable();
            $table->string('expired_date')->nullable();
            $table->integer('rent');
            $table->string('service_charge')->nullable();;
            $table->string('security_deposit')->nullable();
            $table->string('flat_release_policy')->nullable();
            $table->string('address')->nullable();
            $table->text('flat_size')->nullable();
            $table->text('floor')->nullable();
            $table->text('room_category')->nullable();
            $table->string('facilities')->nullable();
            $table->text('additional_facilities')->nullable();
            $table->text('indoor_features')->nullable();
            $table->text('bed_room')->nullable();
            $table->text('bath_room')->nullable();
            $table->string('image')->nullable();
            $table->integer('total_review')->default(0)->nullable();
            $table->integer('total_rating')->default(0)->nullable();
            $table->integer('average_rating')->default(0)->nullable();
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
        Schema::dropIfExists('houses');
    }
}
