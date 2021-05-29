<?php

use Phalcon\Mvc\Model;

class User extends Model
{
    public $id_user;
    public $id_role;
    public $email;
    public $nama;
    public $password;
    public $status_verifikasi;
    public $kode_verifikasi;

    const PUAN = 1;
    const REKAN_CERITA = 2;
    const REKAN_HUKUM = 3;
    const PENILIK = 4;
    const ADMIN = 5;
}