<?php

namespace App\Http\Controllers\Api;
use App\Http\Requests\LoginRequest;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller as RoutingController;
use Illuminate\Support\Facades\Auth;

class AuthController extends RoutingController
{
    public function login(LoginRequest $request)
    {
        $credentials = $request->validated();

        if (!Auth::attempt($credentials)) {
            return response()->json([
                'message' => 'Credenciales incorrectas.'
            ], 401);
        }

        $user = Auth::user();
        $token = $user->createToken('api-token')->plainTextToken;

        return response()->json([
            'token' => $token,
            'user' => $user,
        ]);
    }

    public function me(Request $request)
    {
        return response()->json([
            'user' => $request->user()
        ]);
    }

    public function logout(Request $request)
    {
        // Borra el token actual
        $request->user()->currentAccessToken()?->delete();

        return response()->json([
            'message' => 'Sesión cerrada.'
        ]);
    }
}
