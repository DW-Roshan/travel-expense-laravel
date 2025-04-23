<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->enum('user_type', ['A', 'U'])->default('U');
            $table->string('username')->unique();
            $table->string('email')->unique();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password');
            $table->string('first_name');
            $table->string('last_name');
            $table->string('father_name')->nullable();
            $table->string('pf_no', 10)->nullable();
            $table->enum('gender', ['m', 'f', '0'])->nullable();
            $table->date('date_of_birth')->nullable();
            $table->date('date_of_joining')->nullable();
            $table->integer('branch_id')->nullable();
            $table->integer('divison_id')->nullable();
            $table->integer('designation_id')->nullable();
            $table->integer('station_head_quarter_id')->nullable();
            $table->string('mobile_no', 15);
            $table->string('authority_no', 40)->nullable();
            $table->string('first_class_duty_card_no', 60)->nullable();
            $table->string('ta_sr_no', 60)->nullable();
            $table->decimal('insentive_amount', 10, 2)->nullable();
            $table->decimal('insentive_percentage', 10, 2)->nullable();
            $table->decimal('pay_band', 10, 2)->nullable();
            $table->decimal('g_pay', 10, 2)->nullable();
            $table->string('profile_image')->nullable();
            $table->date('expiry_date')->nullable();
            $table->string('timezone', 100)->nullable();
            $table->integer('reporting_to', 11)->nullable();
            $table->enum('is_active', ['0','1'])->default('1');
            $table->integer('created_by')->nullable();
            $table->date('deactive_date')->nullable();
            $table->rememberToken();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('users');
    }
};
