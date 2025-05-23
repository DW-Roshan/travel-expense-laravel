<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function login(Request $request)
    {
        $request->validate([
            'username' => 'required|string',
            'password' => 'required|string',
        ]);

        $user = User::where('username', $request->username)->first();

        if (!$user || !Hash::check($request->password, $user->password)) {
            return response()->json(['message' => 'Invalid credentials'], 401);
        }

        // Check if account is expired
        if ($user->expiry_date && now()->greaterThan($user->expiry_date)) {
            return response()->json(['message' => 'Account expired'], 403);
        }

        $token = $user->createToken('tteportal')->accessToken;

        return response()->json(['token' => $token, 'id' => $user->id, 'user_type' => $user->user_type, 'username' => $user->username, 'name' => $user->first_name." ".$user->last_name, 'email' => $user->email]);
    }

    public function logout(Request $request)
    {
        // // Remove all tokens for the user
        // $request->user()->tokens->each(function ($token) {
        //     $token->delete();
        // });

        // Remove the current token
        $request->user()->token()->delete();

        return response()->json(['message' => 'Logged out successfully']);
    }

    public function user(Request $request)
    {
        return response()->json($request->user());
    }
}
