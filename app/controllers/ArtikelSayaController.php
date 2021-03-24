<?php

use Phalcon\Mvc\Controller;
use Phalcon\Http\Response;
use App\Events\UserProtectController;
use Phalcon\Security\Random;

class ArtikelSayaController extends Controller
{
	public function buatAction()
	{

	}

	public function postbuatAction()
	{

		$random = new \Phalcon\Security\Random();
    $artikel = new Artikel();

    $id_artikel = $random->uuid();
    $id_user = $this->session->get('user')['id'];
    $judul = $this->request->getPost('judul');
    $isi = $this->request->getPost('isi');
    
    date_default_timezone_set('Asia/Jakarta');
		$date = date('Y/m/d h:i:s', time());
		// echo $date; die();

    $artikel->id_artikel = $id_artikel;
    $artikel->id_user = $id_user;
    // $artikel->id_status_artikel = 1;
    $artikel->judul = $judul;
    $artikel->isi_artikel = $isi;
    $artikel->created_at = $date;
    $artikel->save();
    $this->response->redirect();
		
	}

}