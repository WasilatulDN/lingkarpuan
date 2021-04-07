<?php

use Phalcon\Mvc\Model;

class PermintaanLayanan extends Model
{
    public $id_layanan;
    public $id_user;
    public $id_status_layanan;
    public $id_konsultan;
    public $tanggal;
    public $jam_mulai;
    public $durasi;
    public $jam_selesai;
    public $jenis_layanan;

    const PSIKOLOGI = 1;
    const HUKUM = 2;
}