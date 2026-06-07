<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class AppModel extends Model
{
    public $timestamps = false;

    public function getAll()
    {
        return DB::table($this->table)->get();
    }

    public function getById($id)
    {
        return DB::table($this->table)
            ->where($this->primaryKey, $id)
            ->first();
    }

    public function store($data)
    {
        return DB::table($this->table)->insertGetId($data);
    }

    public function updateById($id, $data)
    {
        return DB::table($this->table)
            ->where($this->primaryKey, $id)
            ->update($data);
    }

    public function deleteById($id)
    {
        return DB::table($this->table)
            ->where($this->primaryKey, $id)
            ->delete();
    }
}