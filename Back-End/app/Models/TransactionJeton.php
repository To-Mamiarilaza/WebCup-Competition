<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TransactionJeton extends Model
{
    use HasFactory;

    protected $table = 'transaction_jeton';

    protected $fillable = ['id_utilisateur', 'valeur'];

}
