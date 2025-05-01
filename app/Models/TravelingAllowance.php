<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TravelingAllowance extends Model
{
    use HasFactory;

    public $table = 'traveling_allowances';

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

    protected $casts = [
        'departure_date' => 'datetime',
        'arrived_date' => 'datetime',
    ];

    public function train()
    {
        return $this->belongsTo(Train::class, 'train_id', 'id');
    }

    public function fromStation()
    {
        return $this->belongsTo(Station::class, 'from_station', 'id');
    }

    public function toStation()
    {
        return $this->belongsTo(Station::class, 'to_station', 'id');
    }
}
