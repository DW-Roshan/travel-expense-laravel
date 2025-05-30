<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Branch extends Model
{
    use HasFactory;

    protected $fillable = [
        'branch_name',
        'short',
        'is_active'
    ];

    // public function users()
    // {
    //     return $this->hasMany(User::class);
    // }
}
