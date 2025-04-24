<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TravellingAllowance extends Model
{
    use HasFactory;

    public $table = 'travelling_allowance';

    protected $fillable = [
        'from_date',
        'arrived_date',
        'train_id',
        'from_station',
        'to_station',
        'hrs_out_of_hq',
        'amt',
        'ta_percentage',
        'object_of_journey',
        'is_active',
        'created_by',
    ];
}
