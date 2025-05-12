<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\Leave;
use App\Models\TravelingAllowance;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class MovementReportController extends Controller
{
    public function index()
    {
        $userId = Auth::id();
        $movementReports = TravelingAllowance::where('created_by', $userId)->get();
        $leaves = Leave::where('created_by', $userId)->get();

        return response()->json([
            'movementReports' => []
        ]);
    }
}
