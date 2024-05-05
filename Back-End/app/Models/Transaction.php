<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Transaction extends Model
{
    use HasFactory;

    protected $table = 'transaction';

    protected $fillable = [
        'id_utilisateur',
        'id_type',
        'id_produit',
        'prix',
        'id_utilisateur_tiers',
        'id_etat',
    ];

}
