<?php

use Phalcon\Mvc\Model;

class Komentar extends Model
{
    public $id_komentar;
    public $id_user;
    public $id_artikel;
    public $isi_komentar;
    public $created_at;
}