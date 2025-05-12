<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\Leave;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class LeaveController extends Controller
{
    public function index()
    {
        $leaves = Leave::where('created_by', auth()->user()->id)->orderBy('from_date', 'desc')->get();

        return response()->json([
            'leaves' => $leaves,
        ]);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'leavePurpose' => 'required|string|max:50',
            'fromDate' => 'required|date',
            'toDate' => 'required|date|after_or_equal:fromDate',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $validated = $validator->validated();

        if($validated) {
            try {
                $leave = Leave::create([
                    'leave_purpose' => $request->leavePurpose,
                    'from_date' => Carbon::parse($request->fromDate)->setTimezone('Asia/Kolkata')->toDateString(),
                    'to_date' => Carbon::parse($request->toDate)->setTimezone('Asia/Kolkata')->toDateString(),
                    'created_by' => auth()->user()->id,
                ]);

                if($leave) {
                    return response()->json([
                        'message' => 'Leave added successfully.',
                    ]);
                } else {
                    return response()->json([
                        'message' => 'Leave not added.',
                    ], 500);
                }


            } catch (\Exception $e) {
                return response()->json([
                    'message' => 'Error occurred while adding Leave.',
                    'error' => $e->getMessage()
                ], 500);
            }
        }
    }

    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'leavePurpose' => 'required|string|max:50',
            'fromDate' => 'required|date',
            'toDate' => 'required|date|after_or_equal:fromDate',
        ]);

        if($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $validated = $validator->validated();

        if($validated) {
            try {
                $leave = Leave::find($id);

                if($leave) {
                    $leave->update([
                        'leave_purpose' => $request->leavePurpose,
                        'from_date' => Carbon::parse($request->fromDate)->setTimezone('Asia/Kolkata')->toDateString(),
                        'to_date' => Carbon::parse($request->toDate)->setTimezone('Asia/Kolkata')->toDateString(),
                    ]);

                    return response()->json([
                        'message' => 'Leave updated successfully.',
                    ]);
                } else {
                    return response()->json([
                        'message' => 'Leave not found.',
                    ], 404);
                }

            } catch (\Exception $e) {
                return response()->json([
                    'message' => 'Error occurred while updating Leave.',
                    'error' => $e->getMessage()
                ], 500);
            }
        }
    }

}
