<?php

namespace App\Http\Controllers;

use App\Models\Branch;
use App\Models\Designation;
use App\Models\Division;
use App\Models\Station;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller
{

    public function index()
    {
        try{

            $users = User::where('user_type', 'U')->with(['branch:id,branch_name', 'division:id,division_name', 'designation:id,designation_name', 'stationHeadQuarter:id,station_name'])->get();
            return response()->json($users);

        } catch (\Throwable $th) {
            return response()->json([
                'message' => 'Something went wrong.',
                'throws' => $th
            ], 500);
        }
    }

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

        $validator = Validator::make($request->all(),[
            'firstName' => 'required|string|max:255',
            'lastName' => 'required|string|max:255',
            'email' => 'required|email|unique:users,email|max:255',
            'username' => 'required|alpha_num:ascii|unique:users,username|max:20',
            'password' => 'required|confirmed|string|min:6|max:20',
            'branch' => 'required|exists:branches,id',
            'division' => 'required|exists:divisions,id',
            'designation' => 'required|exists:designations,id',
            'station' => 'required|exists:stations,id',
            'dateOfBirth' => 'required|date',
            'dateOfJoining' => 'required|date',
            'loginValidUpto' => 'required|date',
            'phoneNumber' => 'required|string|max:15',
            'payBand' => 'required|string|max:10',
            'gPay' => 'required|string|max:10'
        ]);

        if($validator->fails()){
            return response()->json([
                'message' => 'Validation failed',
                'errors' => $validator->errors()
            ], 422);
        }

        $validated = $validator->validated();

        if($validated) {

            try {

                $user = User::create([
                    'user_type' => 'U',
                    'username' => $request->username,
                    'email' => $request->email,
                    'password' => Hash::make($request->password),
                    'first_name' => $request->firstName,
                    'last_name' => $request->lastName,
                    'date_of_birth' => Carbon::parse($request->dateOfBirth)->toDateString(),
                    'date_of_joining' => Carbon::parse($request->dateOfJoining)->toDateString(),
                    'gender' => $request->gender,
                    'pf_no' => $request->pfNo,
                    'father_name' => $request->fatherName,
                    'first_class_duty_pass' => $request->firstClassDutyPassNo,
                    'branch_id' => $request->branch,
                    'division_id' => $request->division,
                    'designation_id' => $request->designation,
                    'station_head_quarter_id' => $request->station,
                    'mobile_no' => $request->phoneNumber,
                    'authority_no' => $request->checkingAuthority,
                    'expiry_date' => Carbon::parse($request->loginValidUpto)->toDateString(),
                    'ta_sr_no' => $request->taSrNo,
                    'incentive_amount' => $request->incentiveAmt,
                    'incentive_percentage' => $request->incentivePercentage,
                    'pay_band' => $request->payBand,
                    'g_pay' => $request->gPay
                ]);

                if($user){

                    return response()->json([
                        'message' => 'User added successfully.',
                    ]);

                }else{

                    return response()->json([
                        'message' => 'User not added, something went wrong.'
                    ], 500);

                }
            } catch (\Throwable $th) {

                return response()->json([
                    'message' => 'User not added, something went wrong.',
                    'throws' => $th
                ], 500);
            }

        } else {

            return response()->json([
                'message' => 'User not added, something went wrong.'
            ], 500);

        }

    }
}
