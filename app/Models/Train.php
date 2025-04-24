<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Train extends Model
{
    use HasFactory;

    protected $fillable = [
        'train_name',
        'train_no',
        'from_station',
        'to_station',
        'short',
        'is_active',
    ];
}
