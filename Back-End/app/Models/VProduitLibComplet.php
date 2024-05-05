<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class VProduitLibComplet extends Model
{
    use HasFactory;

    protected $table = 'v_produit_lib_complet';

    public function photos()
    {
        return $this->hasMany(PhotoProduit::class, 'id_produit');
    }
}
