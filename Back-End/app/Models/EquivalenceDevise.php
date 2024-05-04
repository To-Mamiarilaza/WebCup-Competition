<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EquivalenceDevise extends Model
{
    use HasFactory;

    protected $table = 'equivalence_devise';

    protected $fillable = ['nom', 'valeur'];

}