<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\Station;
use App\Models\Train;
use App\Models\TravelingAllowance;
use App\Models\TravellingAllowance;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class TravelingAllowanceController extends Controller
{
    public function index()
    {

        $travelingAllowances = TravelingAllowance::where('created_by', auth()->user()->id)
        ->with(['train:id,train_name,train_no', 'fromStation:id,station_name', 'toStation:id,station_name'])
        ->orderBy('from_date', 'desc')
        ->get()
        ->groupBy(fn($item) => Carbon::parse($item->from_date)->toDateString())
        ->map(fn($group, $date) => ['from_date' => $date, 'travel_data' => $group])
        ->values();

        return response()->json([
            'message' => 'Traveling Allowance List',
            'data' => $travelingAllowances,
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

        $data = $request->all();
        $validator = Validator::make($data, [
            'journeys' => 'required|array|min:1',
            'journeys.*.trainId' => 'required|exists:trains,id',
            'journeys.*.fromStation' => 'required|exists:stations,id',
            'journeys.*.toStation' => 'required|exists:stations,id|different:journeys.*.fromStation',
            'journeys.*.departureDate' => 'required|date',
            'journeys.*.arrivedDate' => 'required|date|after:journeys.*.departureDate',
        ]);

        // return response()->json([
        //     'message' => 'Testing Data validation',
        //     'data' => $data,
        // ]);

        $validator->after(function ($validator) use ($data) {
            $journeys = $data['journeys'] ?? [];

            foreach ($journeys as $i => $journey) {
                if ($i > 0) {
                    $currentDeparture = isset($journey['departureDate']) ? new \DateTime($journey['departureDate']) : null;
                    $previousArrival = isset($journeys[$i - 1]['arrivedDate']) ? new \DateTime($journeys[$i - 1]['arrivedDate']) : null;

                    if ($currentDeparture && $previousArrival && $currentDeparture <= $previousArrival) {
                        $validator->errors()->add("journeys.$i.departureDate", 'Departure Time must be greater than previous Arrival Time.');
                    }
                }

                // Optional: validate same journey arrival > departure
                if (isset($journey['arrivedDate'], $journey['departureDate'])) {
                    $arrival = new \DateTime($journey['arrivedDate']);
                    $departure = new \DateTime($journey['departureDate']);

                    if ($arrival <= $departure) {
                        $validator->errors()->add("journeys.$i.arrivedDate", 'Arrival time must be greater than departure time.');
                    }
                }
            }
        });

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $validated = $validator->validated();

        if($validated) {
            try {

                foreach ($validated['journeys'] as $journey) {
                    TravelingAllowance::create([
                        'created_by' => auth()->user()->id,
                        'train_id' => $journey['trainId'],
                        'from_station' => $journey['fromStation'],
                        'to_station' => $journey['toStation'],
                        'from_date' => Carbon::parse($journey['departureDate'])->setTimezone('Asia/Kolkata'),
                        'arrived_date' => Carbon::parse($journey['arrivedDate'])->setTimezone('Asia/Kolkata'),
                    ]);
                }

                return response()->json([
                    'message' => 'Traveling Allowance added successfully.',
                ]);
            } catch (\Exception $e) {
                return response()->json([
                    'message' => 'Error occurred while adding traveling allowance.',
                    'error' => $e->getMessage()
                ], 500);
            }
        }

        // return response()->json([
        //     'message' => 'Store Traveling Allowance'
        // ]);
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
