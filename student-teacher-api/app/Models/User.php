<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;

use PHPOpenSourceSaver\JWTAuth\Contracts\JWTSubject;

class User extends Authenticatable implements JWTSubject
{
    protected $table = 'tbl_users';

    protected $primaryKey = 'user_id';

    protected $username = 'vch_email';

    protected $keyType = 'integer'; // ✅ Tell Laravel the key type explicitly

    public $incrementing = true;    // ✅ Confirm it's auto-incrementing

    public $timestamps = false;

    protected $fillable = [
        'vch_name', 
        'vch_email', 
        'vch_password', 
        'int_role', 
        'is_active'
    ];

    protected $hidden = [
        'vch_password'
    ];

    public function getAuthIdentifier()
    {
        // dd($this->user_id);
        return $this->user_id; // ✅ Explicitly reference user_id
    }

    public function getAuthPassword()
    {
        return $this->vch_password;
    }

    public function getJWTIdentifier()
    {
        return $this->getKey();
    }

    // ✅ FIXED: was getJWTIdentifier() — must be getJWTSubject()
    public function getJWTSubject()
    {
        // return (string) $this->getKey(); // Cast to string — fixes the null error
        return (string) $this->user_id;  
    }

    public function getJWTCustomClaims()
    {
        return [];
    } 
 
}