<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;

class UtilisateurFrontOffice extends Authenticatable
{
    use HasFactory;

    protected $table = 'utilisateur_front_office';
    protected $fillable = [
        'email',
        'telephone',
        'avatar',
        'name',
        'password',
        'profile'
    ];
    public $timestamps = false;
}
