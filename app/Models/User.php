<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Passport\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'username',
        'email',
        'password',
        'user_type',
        'first_name',
        'last_name',
        'father_name',
        'pf_no',
        'gender',
        'date_of_birth',
        'date_of_joining',
        'branch_id',
        'division_id',
        'designation_id',
        'station_head_quarter_id',
        'mobile_no',
        'authority_no',
        'first_class_duty_card_no',
        'ta_sr_no',
        'incentive_amount',
        'incentive_percentage',
        'pay_band',
        'g_pay',
        'profile_image',
        'expiry_date',
        'timezone',
        'reporting_to',
        'is_active',
        'created_by',
        'deactive_date',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function branch()
    {
        return $this->belongsTo(Branch::class, 'branch_id');
    }
    public function division()
    {
        return $this->belongsTo(Division::class, 'division_id');
    }
    public function designation()
    {
        return $this->belongsTo(Designation::class, 'designation_id');
    }
    public function stationHeadQuarter()
    {
        return $this->belongsTo(Station::class, 'station_head_quarter_id');
    }
}
