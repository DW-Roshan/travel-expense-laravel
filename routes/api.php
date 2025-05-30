<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\User\LeaveController;
use App\Http\Controllers\User\MovementReportController;
use App\Http\Controllers\User\TravelingAllowanceController;
use App\Http\Controllers\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::post('login', [AuthController::class, 'login']);

Route::middleware('auth:api')->group( function() {
    Route::post('logout', [AuthController::class, 'logout']);

    Route::get('/user', function (Request $request) {
        return $request->user();
    });

    Route::middleware('userType:A')->prefix('admin')->group(function () {
        Route::get('/session', function (Request $request) {
            return $request->user();
        });

        Route::get('/users', [UserController::class, 'index']);

        Route::get('/user/add', [UserController::class, 'addUser']);
        Route::post('/user/store', [UserController::class, 'store']);
    });

    Route::middleware('userType:U')->group(function () {
        Route::get('/session', function (Request $request) {
            return $request->user();
        });
        Route::get('/traveling-allowances', [TravelingAllowanceController::class, 'index']);
        Route::get('/traveling-allowances/add', [TravelingAllowanceController::class, 'create']);
        Route::post('/traveling-allowances/store', [TravelingAllowanceController::class, 'store']);
        Route::get('/traveling-allowances/{id}', [TravelingAllowanceController::class, 'show']);
        Route::put('/traveling-allowances/{id}', [TravelingAllowanceController::class, 'update']);
        Route::delete('/traveling-allowances/{id}', [TravelingAllowanceController::class, 'destroy']);

        Route::get('/leaves', [LeaveController::class, 'index']);
        Route::post('/leaves/store', [LeaveController::class, 'store']);
        Route::put('/leaves/{id}', [LeaveController::class, 'update']);

        Route::get('/movement-reports', [MovementReportController::class, 'index']);

        Route::get('/mr', [MovementReportController::class, 'getMR']);
        Route::get('/report', [MovementReportController::class, 'reportMR']);
    });

});
