<?php

use Phalcon\Mvc\Model;

class Jadwal extends Model
{
    public $id_jadwal;
    public $id_user;
    public $hari;
    public $jam_mulai;
    public $jam_selesai;
}