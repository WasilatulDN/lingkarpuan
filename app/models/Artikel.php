<?php

use Phalcon\Mvc\Model;

class Artikel extends Model
{
    public $id_artikel;
    public $id_user;
    public $id_status_artikel;
    public $judul;
    public $isi_artikel;
    public $gambar;
    public $catatan_penilik;
    public $catatan_penulis;
    public $updated_at;

    const MENUNGGU_VERIFIKASI = 1;
    const MENUNGGU_KONFIRMASI = 2;
    const DIKONFIRMASI = 3;
    const DIPUBLIKASIKAN = 4;
    const DITOLAK = 5;
}