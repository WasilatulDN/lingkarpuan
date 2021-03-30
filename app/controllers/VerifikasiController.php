<?php

use Phalcon\Mvc\Controller;
use Phalcon\Http\Response;
use App\Events\UserProtectController;
use Phalcon\Security\Random;

class VerifikasiController extends Controller
{
	public function verifikasiAction()
	{
		$data_verifikasi = Artikel::find("id_status_artikel='1'");
    $data_konfirmasi = array();
    $konfirmasis = Artikel::find(
            [
                'columns' => '*',
                'conditions' => 'id_status_artikel = ?1 OR id_status_artikel = ?2',
                'bind' => [
                    1 => '2',
                    2 => '3',
                ]
            ]
        );
    foreach ($konfirmasis as $konfirmasi)
    {
      $status = StatusArtikel::findFirst("id_status_artikel='$konfirmasi->id_status_artikel'");
      $data_konfirmasi[] = array(
          'id_artikel' => $konfirmasi->id_artikel,
          'judul' => $konfirmasi->judul,
          'status' => $status->nama_status,
      );
    }
    
    $this->view->data_verifikasi = $data_verifikasi;
    $this->view->data_konfirmasi = $data_konfirmasi;

	}

  public function detailAction($id)
  {
    $artikel = artikel::findFirst("id_artikel='$id'");
		$penulis = user::findFirst("id_user='$artikel->id_user'");
    $status = StatusArtikel::findFirst("id_status_artikel='$artikel->id_status_artikel'");
    $this->view->artikel = $artikel;
    $this->view->penulis = $penulis;
    $this->view->status = $status;
  }

  public function terimaAction($id)
  {
    $artikel = artikel::findFirst("id_artikel='$id'");
    $status = StatusArtikel::findFirst("id_status_artikel='$artikel->id_status_artikel'");
    $this->view->artikel = $artikel;
    $this->view->status = $status;
    // $artikel->id_status_artikel = 4;
    // $artikel->save();
    // $this->response->redirect('verifikasi/');
  }

  public function postterimaAction()
  {
    $id_artikel = $this->request->getPost('id_artikel');
    $judul = $this->request->getPost('judul');
    $isi_artikel = $this->request->getPost('isi_artikel');

    if (true == $this->request->hasFiles() && $this->request->isPost()) {
      $upload_dir = __DIR__ . '/../../public/uploads/';

      // if (!is_dir($upload_dir)) {
      //   mkdir($upload_dir, 0755);
      // }

      foreach ($this->request->getUploadedFiles() as $file) {
          $temp = explode(".", $_FILES["gambar"]["name"]);
          $file->moveTo($upload_dir.$file->getName());
          $file_lama = $upload_dir.$file->getName();
          $nama_file = $id_artikel.'.'.end($temp);

          $file_baru = $upload_dir.$nama_file;
          // echo $file_baru; die();
          rename($file_lama, $file_baru);
      }
    }

    $artikel = artikel::findFirst("id_artikel='$id_artikel'");
    $artikel->judul = $judul;
    $artikel->isi_artikel = $isi_artikel;
    $artikel->id_status_artikel = 4;
    $artikel->gambar = $nama_file;
    $artikel->save();
    $this->response->redirect('verifikasi/');
  }

  public function tolakAction($id)
  {
    $artikel = artikel::findFirst("id_artikel='$id'");
    $artikel->id_status_artikel = 5;
    $artikel->save();
    $this->response->redirect('verifikasi/');

  }

	public function hapusAction($id)
	{
		$artikel = artikel::findFirst("id_artikel='$id'");
		$artikel->delete();
		$this->response->redirect('artikel/');
	}

  public function catatanpenilikAction()
  {
    $id_artikel = $this->request->getPost('id_artikel');
    $catatan_penilik = $this->request->getPost('catatan_penilik');

    $artikel = artikel::findFirst("id_artikel='$id_artikel'");
    $artikel->id_status_artikel = 2;
    $artikel->catatan_penilik = $catatan_penilik;
    $artikel->save();
    $this->response->redirect('verifikasi/');
  }

}