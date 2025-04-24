<?php

namespace App\Http\Controllers;

use App\Models\Branch;
use App\Models\Designation;
use App\Models\Division;
use App\Models\Station;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller
{
    public function addUser()
    {
        $branches = Branch::where('is_active', 1)->select('id', 'branch_name')->get();
        $divisions = Division::where('is_active', 1)->select('id', 'division_name')->get();
        $designations = Designation::where('is_active', 1)->select('id', 'designation_name')->get();
        $stations = Station::where('is_active', 1)->select('id', 'station_name')->get();

        return response()->json([
            'branches' => $branches,
            'divisions' => $divisions,
            'designations' => $designations,
            'stations' => $stations,
        ]);
    }

    public function store(Request $request)
    {

        // return response()->json([
        //     'message' => 'User added successfully',
        //     'data' => $request->all(),
        // ]);
        $validator = Validator::make($request->all(),[
            'firstName' => 'required|string',
            'lastName' => 'required|string',
            'email' => 'required|email|unique:users,email',
            'username' => 'required|string|unique:users,username',
            'password' => 'required|confirmed|string|min:6',
            'branch' => 'required|exists:branches,id',
            'division' => 'required|exists:divisions,id',
            'designation' => 'required|exists:designations,id',
            'station' => 'required|exists:stations,id',
            'dateOfBirth' => 'required|date',
            'dateOfJoining' => 'required|date',
            'loginValidUpto' => 'required|date',
            'phoneNumber' => 'required|string',
            'payBand' => 'required|string',
            'gPay' => 'required|string'
        ]);

        // $validated = $request->validate([
        //     'firstName' => 'required|string',
        //     'lastName' => 'required|string',
        //     'email' => 'required|email|unique:users,email',
        //     'username' => 'required|string|unique:users,username',
        //     'password' => 'required|confirmed|string|min:6',
        //     'branch' => 'required|exists:branches,id',
        //     'division' => 'required|exists:divisions,id',
        //     'designation' => 'required|exists:designations,id',
        //     'station' => 'required|exists:stations,id',
        //     'dateOfBirth' => 'required|date',
        //     'dateOfJoining' => 'required|date',
        //     'loginValidUpto' => 'required|date',
        //     'phoneNumber' => 'required|string',
        //     'payBand' => 'required|string',
        //     'gPay' => 'required|string'
        // ]);

        if($validator->fails()){
            return response()->json([
                'message' => 'Validation failed',
                'errors' => $validator->errors()
            ], 422);
        }
        $validated = $validator->validated();

        return response()->json([
            'message' => 'User added successfully',
            'data' => $validated,
        ]);
    }
}
