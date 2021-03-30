<?php

use Phalcon\Mvc\Controller;
use Phalcon\Http\Response;
use App\Events\UserProtectController;
use Phalcon\Security\Random;

class ArtikelSayaController extends Controller
{
  public function artikelsayaAction()
  {
    $id_user = $this->session->get('user')['id'];
    $artikels = Artikel::find("id_user='$id_user'");

    $data_artikel = array();
    foreach ($artikels as $artikel)
    {
      $status = StatusArtikel::findFirst("id_status_artikel='$artikel->id_status_artikel'");
      $data_artikel[] = array(
          'id_artikel' => $artikel->id_artikel,
          'judul' => $artikel->judul,
          'status' => $status->nama_status,
      );
    }

    $this->view->data_artikel = $data_artikel;
  }

  public function detailAction($id)
  {
    $artikel = Artikel::findFirst("id_artikel='$id'");
    $status = StatusArtikel::findFirst("id_status_artikel='$artikel->id_status_artikel'");
    $this->view->artikel = $artikel;
    $this->view->status = $status;
  }

  public function konfirmasiAction($id)
  {
    $artikel = Artikel::findFirst("id_artikel='$id'");
    $artikel->id_status_artikel = 3;
    $artikel->save();
    $this->response->redirect('artikelsaya/');
  }

  public function catatanpenulisAction()
  {
    $id_artikel = $this->request->getPost('id_artikel');
    $catatan_penulis = $this->request->getPost('catatan_penulis');

    $artikel = artikel::findFirst("id_artikel='$id_artikel'");
    $artikel->id_status_artikel = 3;
    $artikel->catatan_penulis = $catatan_penulis;
    $artikel->save();
    $this->response->redirect('artikelsaya/');
  }

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
    $artikel->id_status_artikel = 1;
    $artikel->judul = $judul;
    $artikel->isi_artikel = $isi;
    $artikel->created_at = $date;
    $artikel->save();
    $this->response->redirect();
		
	}

}