<?php

// use Phalcon\Mvc\Controller;
// use Phalcon\Http\Response;
use App\Events\ArtikelSayaProtectController;
use Phalcon\Security\Random;

class ArtikelsayaController extends ArtikelSayaProtectController
{
  public function artikelsayaAction()
  {
    $id_user = $this->session->get('user')['id'];
    $artikels = Artikel::find("id_user='$id_user' ORDER BY updated_at DESC");

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
    $date = date('Y/m/d H:i:s', time());

    $artikel->id_status_artikel = 3;
    $artikel->updated_at = $date;
    $artikel->save();
    $this->flashSession->success('Artikel berhasil dikonfirmasi. Silakan tunggu artikelmu dipublikasikan oleh tim penilik. Kamu bisa melihat status artikelmu pada halaman Artikel Saya');
    $this->response->redirect('artikelsaya/');
  }

  public function catatanpenulisAction()
  {
    $id_artikel = $this->request->getPost('id_artikel');
    $catatan_penulis = $this->request->getPost('catatan_penulis');
    $date = date('Y/m/d H:i:s', time());

    $artikel = Artikel::findFirst("id_artikel='$id_artikel'");
    $artikel->id_status_artikel = 3;
    $artikel->catatan_penulis = $catatan_penulis;
    $artikel->updated_at - $date;
    $artikel->save();
    $this->flashSession->success('Catatanmu untuk tim penilik berhasil dibuat. Silakan tunggu artikelmu dipublikasikan oleh tim penilik. Kamu bisa melihat status artikelmu pada halaman Artikel Saya');
    $this->response->redirect('artikelsaya/');
  }

	public function buatAction()
	{

	}

	public function postbuatAction()
	{

		$random = new Random();
    $artikel = new Artikel();

    $id_artikel = $random->uuid();
    $id_user = $this->session->get('user')['id'];
    $judul = $this->request->getPost('judul');
    $isi = $this->request->getPost('isi');
		$date = date('Y/m/d H:i:s', time());
		// echo $date; die();

    $artikel->id_artikel = $id_artikel;
    $artikel->id_user = $id_user;
    $artikel->id_status_artikel = 1;
    $artikel->judul = $judul;
    $artikel->isi_artikel = $isi;
    $artikel->updated_at = $date;
    $artikel->save();
    $this->flashSession->success('Artikel berhasil dibuat. Silakan tunggu hasil verifikasi dari tim penilik. Kamu bisa melihat status artikelmu pada halaman Artikel Saya');
    $this->response->redirect('artikelsaya/');
		
	}

}