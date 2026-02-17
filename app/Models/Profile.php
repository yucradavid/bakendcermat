<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Concerns\HasUuids;

class Profile extends Model
{
    use HasUuids;

    protected $table = 'profiles';
    protected $primaryKey = 'id';
    public $incrementing = false;
    protected $keyType = 'string';

    public $timestamps = true; // tiene created_at y updated_at

    protected $fillable = [
        'id',
        'role',
        'full_name',
        'dni',
        'phone',
        'email',
        'avatar_url',
        'is_active',
        'created_by',
    ];

    protected $casts = [
        'is_active' => 'boolean',
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];
}
