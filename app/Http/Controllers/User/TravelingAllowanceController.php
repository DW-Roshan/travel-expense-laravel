<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\Station;
use App\Models\Train;
use Illuminate\Http\Request;

class TravelingAllowanceController extends Controller
{
    public function index()
    {
        return response()->json([
            'message' => 'Traveling Allowance List'
        ]);
    }

    public function create()
    {

        $trains = Train::all();
        $stations = Station::all();


        return response()->json([
            'message' => 'Create Traveling Allowance',
            'trains' => $trains,
            'stations' => $stations,
        ]);
    }

    public function store(Request $request)
    {
        return response()->json([
            'message' => 'Store Traveling Allowance'
        ]);
    }

    public function show($id)
    {
        return response()->json([
            'message' => 'Show Traveling Allowance'
        ]);
    }

    public function edit($id)
    {
        return response()->json([
            'message' => 'Edit Traveling Allowance'
        ]);
    }

    public function update(Request $request, $id)
    {
        return response()->json([
            'message' => 'Update Traveling Allowance'
        ]);
    }

    public function destroy($id)
    {
        return response()->json([
            'message' => 'Delete Traveling Allowance'
        ]);
    }

    public function approve($id)
    {
        return response()->json([
            'message' => 'Approve Traveling Allowance'
        ]);
    }

    public function reject($id)
    {
        return response()->json([
            'message' => 'Reject Traveling Allowance'
        ]);
    }

    public function download($id)
    {
        return response()->json([
            'message' => 'Download Traveling Allowance'
        ]);
    }
}
