<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\Leave;
use App\Models\TravelingAllowance;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class MovementReportController extends Controller
{
    public function index(Request $request)
    {
        $userId = Auth::id();
        try {

            $monthYear = $request->query('month');

            if($monthYear && preg_match('/^(0[1-9]|1[0-2])-\d{4}$/', $monthYear)){
                [$month, $year] = explode('-', $monthYear);
            } else {
                $month = Carbon::now()->format('m');
                $year = Carbon::now()->year;
            }

            // Step 2: Calculate start and end of month
            $startOfMonth = Carbon::createFromDate($year, $month, 1)->startOfDay();
            $endOfMonth = Carbon::createFromDate($year, $month, 1)->endOfMonth()->endOfDay();

            $travelingAllowances = TravelingAllowance::where('created_by', $userId)
                ->whereBetween('from_date', [$startOfMonth, $endOfMonth])
                ->with(['train:id,train_name,train_no', 'fromStation:id,station_code', 'toStation:id,station_code'])
                ->orderBy('from_date', 'desc')
                ->get()
                ->groupBy(fn($item) => Carbon::parse($item->from_date)->toDateString())
                ->map(fn($group, $date) => ['from_date' => $date, 'travel_data' => $group])
                ->values();

            $leaves = Leave::where('created_by', $userId)
                ->whereBetween('from_date', [$startOfMonth, $endOfMonth])
                ->orWhereBetween('to_date', [$startOfMonth, $endOfMonth])
                ->get();

            // Add leave records to summary
            $leaveSummary = collect($leaves)->map(function ($leave) {
                $start = Carbon::parse($leave->from_date);
                $end = Carbon::parse($leave->to_date);

                $dates = collect(range(0, $start->diffInDays($end)))
                    ->map(fn($i) => $start->copy()->addDays($i)->format('d'));

                return [
                    'type' => 'leave',
                    'date' => $dates->implode('/') . '-' . $start->format('m-Y'),
                    'status' => 'LEAVE',
                    'leave_purpose' => $leave->leave_purpose,
                ];
            });

            $summary = $travelingAllowances->map(function ($item) {
                $travelData = collect($item['travel_data'])->sortBy('from_date')->values();

                if ($travelData->isEmpty()) {
                    return null;
                }

                // Step 1: Collect both 'from' and 'arrival' dates
                $allDates = $travelData->flatMap(function ($td) {
                    $from = Carbon::parse($td->from_date);
                    $to = Carbon::parse($td->arrived_date);

                    // If arrival is before from (possible time zone/logic issues), correct it
                    if ($to->lessThan($from)) {
                        return [$from->format('d')];
                    }

                    // Create all dates in between
                    return collect(range(0, $from->diffInDays($to)))
                        ->map(fn($i) => $from->copy()->addDays($i)->format('d'));
                })->unique()->sort()->values();

                // Step 2: Get month and year from first travel entry
                $monthYear = Carbon::parse($travelData->first()->from_date)->format('m-Y');

                // Step 3: Format the date string
                $dateString = $allDates->implode('/') . '-' . $monthYear;

                // Trains
                $trains = $travelData->pluck('train.train_no')->implode(' - ');

                // Stations in travel order
                $stations = [];
                foreach ($travelData as $index => $td) {
                    if ($index === 0) {
                        $stations[] = $td->fromStation->station_code;
                    }
                    $stations[] = $td->toStation->station_code;
                }

                $stationString = implode(' - ', $stations);

                return [
                    'type' => 'travel',
                    'date' => $dateString,
                    'trains' => $trains,
                    'stations' => $stationString,
                ];
            })->filter()->values();

            // Merge and sort all summary entries by the first numeric date
            $fullSummary = $summary->merge($leaveSummary)->sortBy(function ($item) {
                return (int) explode('/', $item['date'])[0];
            })->values();

            return response()->json([
                // 'movementReports' => $travelingAllowances,
                'summary' => $fullSummary,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'error' => $e
            ]);
        }
    }
}
