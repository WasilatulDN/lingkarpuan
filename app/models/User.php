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
}