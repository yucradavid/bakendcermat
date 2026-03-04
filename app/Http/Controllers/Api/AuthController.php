<?php

namespace App\Http\Controllers\Api;

use App\Http\Requests\LoginRequest;
use App\Models\Profile;
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

        /** @var \App\Models\User $user */
        $user = Auth::user();

        // ✅ Crear perfil si no existe
        $profile = $user->profile()->firstOrCreate(
            ['user_id' => $user->id],
            [
                'role' => 'admin', // ajusta según tu necesidad
                'full_name' => $user->name ?? 'Sin nombre',
                'email' => $user->email,
                'is_active' => true,
                // created_by opcional si lo manejas (si no, quítalo)
            ]
        );

        // ✅ Token Sanctum
        $token = $user->createToken('api-token')->plainTextToken;

        return response()->json([
            'token' => $token,
            'user' => $user->load('profile'), // ✅ para que venga el perfil en la respuesta
        ]);
    }

    public function me(Request $request)
    {
        return response()->json([
            'user' => $request->user()?->load('profile')
        ]);
    }

    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()?->delete();

        return response()->json([
            'message' => 'Sesión cerrada.'
        ]);
    }
}
