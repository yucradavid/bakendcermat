<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class FeeConcept extends Model
{
    protected $table = 'fee_concepts';

    protected $fillable = [
        'name',
        'description',
        'amount',
        'type',         // concept_type
        'periodicity',  // concept_periodicity
        'is_active',
    ];

    public function charges(): HasMany
    {
        return $this->hasMany(Charge::class, 'concept_id');
    }
}
