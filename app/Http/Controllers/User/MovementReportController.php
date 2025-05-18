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

    //   public function reportMR(Request $request)
    // {
    //     $userId = Auth::id();
    //     try {
    //         $monthYear = $request->query('month');
    //         if ($monthYear && preg_match('/^(0[1-9]|1[0-2])-\d{4}$/', $monthYear)) {
    //             [$month, $year] = explode('-', $monthYear);
    //         } else {
    //             $month = Carbon::now()->format('m');
    //             $year = Carbon::now()->year;
    //         }

    //         $startOfMonth = Carbon::createFromDate($year, $month, 1)->startOfDay();
    //         $endOfMonth = Carbon::createFromDate($year, $month, 1)->endOfMonth()->endOfDay();

    //         $travelingAllowances = TravelingAllowance::where('created_by', $userId)
    //             ->whereBetween('from_date', [$startOfMonth, $endOfMonth])
    //             ->orWhereBetween('arrived_date', [$startOfMonth, $endOfMonth])
    //             ->with(['train:id,train_name,train_no', 'fromStation:id,station_code', 'toStation:id,station_code'])
    //             ->orderBy('from_date', 'desc')
    //             ->get()
    //             ->groupBy(fn($item) => Carbon::parse($item->from_date)->toDateString())
    //             ->map(fn($group, $date) => ['from_date' => $date, 'travel_data' => $group])
    //             ->values();

    //         $leaves = Leave::where('created_by', $userId)
    //             ->whereBetween('from_date', [$startOfMonth, $endOfMonth])
    //             ->orWhereBetween('to_date', [$startOfMonth, $endOfMonth])
    //             ->get();

    //         $leaveSummary = collect($leaves)->map(function ($leave) {
    //             $start = Carbon::parse($leave->from_date);
    //             $end = Carbon::parse($leave->to_date);

    //             $dates = collect(range(0, $start->diffInDays($end)))
    //                 ->map(fn($i) => $start->copy()->addDays($i)->format('d'));

    //             return [
    //                 'type' => 'leave',
    //                 'date' => $dates->implode('/') . '-' . $start->format('m-Y'),
    //                 'status' => 'LEAVE',
    //                 'leave_purpose' => $leave->leave_purpose,
    //             ];
    //         });

    //         $summary = $travelingAllowances->map(function ($item) use ($month, $year) {
    //             $travelData = collect($item['travel_data'])->sortBy('from_date')->values();

    //             if ($travelData->isEmpty()) {
    //                 return null;
    //             }

    //             $allDates = $travelData->flatMap(function ($td) use ($month){
    //                 $from = Carbon::parse($td->from_date);
    //                 $to = Carbon::parse($td->arrived_date);

    //                 if($from->month != $month){
    //                     return [$to->format('d')];
    //                 } else if($to->month != $month){
    //                     return [$from->format('d')];
    //                 }

    //                 if ($to->lessThan($from)) {
    //                     return [$from->format('d')];
    //                 } else if($to->greaterThan($from)){
    //                     return [$from->format('d'), $to->format('d')];
    //                 }

    //                 return collect(range(0, $from->diffInDays($to)))
    //                     ->map(fn($i) => $from->copy()->addDays($i)->format('d'));
    //             })->unique()->sort()->values();

    //             $dataD =  $travelData->flatMap(function ($td) {
    //                 $from = Carbon::parse($td->from_date)->format('d-m-Y');
    //                 $to = Carbon::parse($td->arrived_date)->format('d-m-Y');

    //                 // if ($to->lessThan($from)) {
    //                 //     return [$from->format('d')];
    //                 // }

    //                 return ["from_date" => $from , "arrived_date" => $to];
    //             });

    //             $monthYear = Carbon::parse($travelData->first()->from_date)->format('m-Y');
    //             // $dateString = $allDates->implode('/') . '-' . $monthYear;
    //             $dateString = $allDates->implode('/') . '-' . $month . '-' . $year;

    //             $trains = $travelData->pluck('train.train_no')->implode(' - ');

    //             $stations = [];
    //             foreach ($travelData as $index => $td) {
    //                 $fromDate = Carbon::parse($td->from_date);
    //                 $arrivedDate = Carbon::parse($td->arrived_date);

    //                 if($fromDate->month != $month){
    //                     $stations[] = "(" . $td->fromStation->station_code . " ON " . $fromDate->format('d-m') . ") - " . $td->toStation->station_code;
    //                 } else if($arrivedDate->month != $month){
    //                     $stations[] = $td->fromStation->station_code . " - (" . $td->toStation->station_code . " ON " . $arrivedDate->format('d-m') . ")";
    //                 } else {
    //                     if ($index === 0) {
    //                         $stations[] = $td->fromStation->station_code;
    //                     }
    //                     $stations[] = $td->toStation->station_code;
    //                 }
    //             }

    //             $stationString = implode(' - ', $stations);

    //             return [
    //                 'type' => 'travel',
    //                 'date' => $dateString,
    //                 'trains' => $trains,
    //                 'stations' => $stationString,
    //             ];
    //         })->filter()->values();

    //         $fullSummary = $summary->merge($leaveSummary)->sortBy(function ($item) {
    //             return (int) explode('/', $item['date'])[0];
    //         })->values();


    //         return response()->json([
    //             'summary' => $fullSummary,
    //         ]);
    //     } catch (\Exception $e) {
    //         return response()->json([
    //             'error' => $e,
    //             'summary' => null,
    //         ]);
    //     }
    // }

    // public function index(Request $request)
    // {
    //     $userId = Auth::id();
    //     try {

    //         $monthYear = $request->query('month');

    //         if ($monthYear && preg_match('/^(0[1-9]|1[0-2])-\d{4}$/', $monthYear)) {
    //             [$month, $year] = explode('-', $monthYear);
    //         } else {
    //             $month = Carbon::now()->format('m');
    //             $year = Carbon::now()->year;
    //         }

    //         // Step 2: Calculate start and end of month
    //         $startOfMonth = Carbon::createFromDate($year, $month, 1)->startOfDay();
    //         $endOfMonth = Carbon::createFromDate($year, $month, 1)->endOfMonth()->endOfDay();

    //         $travelingAllowances = TravelingAllowance::where('created_by', $userId)
    //             ->whereBetween('from_date', [$startOfMonth, $endOfMonth])
    //             ->with(['train:id,train_name,train_no', 'fromStation:id,station_code', 'toStation:id,station_code'])
    //             ->orderBy('from_date', 'desc')
    //             ->get()
    //             ->groupBy(fn($item) => Carbon::parse($item->from_date)->toDateString())
    //             ->map(fn($group, $date) => ['from_date' => $date, 'travel_data' => $group])
    //             ->values();

    //         $leaves = Leave::where('created_by', $userId)
    //             ->whereBetween('from_date', [$startOfMonth, $endOfMonth])
    //             ->orWhereBetween('to_date', [$startOfMonth, $endOfMonth])
    //             ->get();

    //         // Add leave records to summary
    //         $leaveSummary = collect($leaves)->map(function ($leave) {
    //             $start = Carbon::parse($leave->from_date);
    //             $end = Carbon::parse($leave->to_date);

    //             $dates = collect(range(0, $start->diffInDays($end)))
    //                 ->map(fn($i) => $start->copy()->addDays($i)->format('d'));

    //             return [
    //                 'type' => 'leave',
    //                 'date' => $dates->implode('/') . '-' . $start->format('m-Y'),
    //                 'status' => 'LEAVE',
    //                 'leave_purpose' => $leave->leave_purpose,
    //             ];
    //         });

    //         $summary = $travelingAllowances->map(function ($item) {
    //             $travelData = collect($item['travel_data'])->sortBy('from_date')->values();

    //             if ($travelData->isEmpty()) {
    //                 return null;
    //             }

    //             // Step 1: Collect both 'from' and 'arrival' dates
    //             $allDates = $travelData->flatMap(function ($td) {
    //                 $from = Carbon::parse($td->from_date);
    //                 $to = Carbon::parse($td->arrived_date);

    //                 // If arrival is before from (possible time zone/logic issues), correct it
    //                 if ($to->lessThan($from)) {
    //                     return [$from->format('d')];
    //                 }

    //                 // Create all dates in between
    //                 return collect(range(0, $from->diffInDays($to)))
    //                     ->map(fn($i) => $from->copy()->addDays($i)->format('d'));
    //             })->unique()->sort()->values();

    //             // Step 2: Get month and year from first travel entry
    //             $monthYear = Carbon::parse($travelData->first()->from_date)->format('m-Y');

    //             // Step 3: Format the date string
    //             $dateString = $allDates->implode('/') . '-' . $monthYear;

    //             // Trains
    //             $trains = $travelData->pluck('train.train_no')->implode(' - ');

    //             // Stations in travel order
    //             $stations = [];
    //             foreach ($travelData as $index => $td) {
    //                 if ($index === 0) {
    //                     $stations[] = $td->fromStation->station_code;
    //                 }
    //                 $stations[] = $td->toStation->station_code;
    //             }

    //             $stationString = implode(' - ', $stations);

    //             return [
    //                 'type' => 'travel',
    //                 'date' => $dateString,
    //                 'trains' => $trains,
    //                 'stations' => $stationString,
    //             ];
    //         })->filter()->values();

    //         // Merge and sort all summary entries by the first numeric date
    //         $fullSummary = $summary->merge($leaveSummary)->sortBy(function ($item) {
    //             return (int) explode('/', $item['date'])[0];
    //         })->values();

    //         return response()->json([
    //             // 'movementReports' => $travelingAllowances,
    //             'summary' => $fullSummary,
    //         ]);
    //     } catch (\Exception $e) {
    //         return response()->json([
    //             'error' => $e
    //         ]);
    //     }
    // }

    public function index(Request $request)
    {
        $userId = Auth::id();
        try {
            [$month, $year] = $this->parseMonth($request->query('month'));

            $start = Carbon::create($year, $month, 1)->startOfDay();
            $end = Carbon::create($year, $month, 1)->endOfMonth()->endOfDay();

            $travelData = TravelingAllowance::where('created_by', $userId)
                ->where(function ($q) use ($start, $end) {
                    $q->whereBetween('from_date', [$start, $end])
                        ->orWhereBetween('arrived_date', [$start, $end]);
                })
                ->with(['train:id,train_name,train_no', 'fromStation:id,station_code', 'toStation:id,station_code'])
                ->orderBy('from_date', 'desc')
                ->get();

            $leaveData = Leave::where('created_by', $userId)
                ->where(function ($q) use ($start, $end) {
                    $q->whereBetween('from_date', [$start, $end])
                        ->orWhereBetween('to_date', [$start, $end]);
                })
                ->get();

            $travelSummary = $this->formatTravels($travelData, $month, $year);
            $leaveSummary = $this->formatLeaves($leaveData);

            $summary = collect([...$travelSummary, ...$leaveSummary])
                ->sortBy(fn($item) => (int) explode('/', $item['date'])[0])
                ->values();

            return response()->json(['summary' => $summary]);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage(), 'summary' => null]);
        }
    }

    private function parseMonth($monthYear)
    {
        if ($monthYear && preg_match('/^(0[1-9]|1[0-2])-\d{4}$/', $monthYear)) {
            return explode('-', $monthYear);
        }
        return [Carbon::now()->format('m'), Carbon::now()->year];
    }

    private function formatTravels($travels, $month, $year)
    {
        $sorted = $travels->sortBy('from_date')->values();
        $merged = collect();

        $i = 0;
        while ($i < $sorted->count()) {
            $group = collect([$sorted[$i]]);
            $lastArrived = Carbon::parse($sorted[$i]->arrived_date);

            $j = $i + 1;

            while ($j < $sorted->count()) {
                $next = $sorted[$j];
                $nextFrom = Carbon::parse($next->from_date);

                // Merge if previous arrived_date == next from_date (same day)
                if ($lastArrived->isSameDay($nextFrom)) {
                    $group->push($next);
                    $lastArrived = Carbon::parse($next->arrived_date);
                    $j++;
                } else {
                    break;
                }
            }

            // Prepare merged summary
            $dates = $group->flatMap(function ($trip) use ($month) {
                $from = Carbon::parse($trip->from_date);
                $to = Carbon::parse($trip->arrived_date);

                if ($from->month != $month) {
                    return [$to->format('d')];
                } else if ($to->month != $month) {
                    return [$from->format('d')];
                }

                return collect(range(0, $from->diffInDays($to)))
                    ->map(fn($i) => $from->copy()->addDays($i)->format('d'));
            })->unique()->sort();

            $trains = $group->pluck('train.train_no')->filter()->unique()->implode(' - ');

            // $stations = collect();
            // foreach ($group as $index => $trip) {
            //     if ($index == 0) {
            //         $stations->push($trip->fromStation->station_code);
            //     }
            //     $stations->push($trip->toStation->station_code);
            // }

            $stations = collect();
            foreach ($group as $index => $td) {
                $fromDate = Carbon::parse($td->from_date);
                $arrivedDate = Carbon::parse($td->arrived_date);

                if ($fromDate->month != $month) {
                    $stations->push("(" . $td->fromStation->station_code . " ON " . $fromDate->format('d-m') . ") - " . $td->toStation->station_code);
                } else if ($arrivedDate->month != $month) {
                    $stations->push($td->fromStation->station_code . " - (" . $td->toStation->station_code . " ON " . $arrivedDate->format('d-m') . ")");
                } else {
                    if ($index === 0) {
                        $stations->push($td->fromStation->station_code);
                    }
                    $stations->push($td->toStation->station_code);
                }
            }

            $merged->push([
                'type' => 'travel',
                'date' => $dates->implode('/') . "-$month-$year",
                'trains' => $trains,
                'stations' => $stations->implode(' - ')
            ]);

            $i = $j;
        }

        return $merged->values()->toArray();
    }


    private function formatLeaves($leaves)
    {
        return $leaves->map(function ($leave) {
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
        })->toArray();
    }
}
