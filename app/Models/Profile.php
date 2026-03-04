<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Profile extends Model
{
    use HasUuids;

    protected $table = 'profiles';
    protected $primaryKey = 'id';
    public $incrementing = false;
    protected $keyType = 'string';

    public $timestamps = true; // tiene created_at y updated_at

protected $fillable = [
    'user_id',
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
public function user()
{
    return $this->belongsTo(User::class, 'user_id', 'id');
}
}
