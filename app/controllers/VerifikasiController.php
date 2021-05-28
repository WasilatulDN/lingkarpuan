<?php

// use Phalcon\Mvc\Controller;
// use Phalcon\Http\Response;
use App\Events\VerifikasiProtectController;

class VerifikasiController extends VerifikasiProtectController
{
	public function verifikasiAction()
	{
		$verifikasis = Artikel::find("id_status_artikel='1' ORDER BY updated_at DESC");
    $data_verifikasi = array();
    foreach ($verifikasis as $verifikasi)
    {
      $status = StatusArtikel::findFirst("id_status_artikel='$verifikasi->id_status_artikel'");
      $data_verifikasi[] = array(
          'id_artikel' => $verifikasi->id_artikel,
          'judul' => $verifikasi->judul,
          'status' => $status->nama_status,
      );
    }

    $data_konfirmasi = array();
    $konfirmasis = Artikel::find(
            [
                'columns' => '*',
                'conditions' => 'id_status_artikel = ?1 OR id_status_artikel = ?2 ORDER BY id_status_artikel DESC, updated_at DESC',
                'bind' => [
                    1 => Artikel::MENUNGGU_KONFIRMASI,
                    2 => Artikel::DIKONFIRMASI,
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
    $artikel = Artikel::findFirst("id_artikel='$id'");
		$penulis = User::findFirst("id_user='$artikel->id_user'");
    $status = StatusArtikel::findFirst("id_status_artikel='$artikel->id_status_artikel'");
    $this->view->artikel = $artikel;
    $this->view->penulis = $penulis;
    $this->view->status = $status;
  }

  public function terimaAction($id)
  {
    $artikel = Artikel::findFirst("id_artikel='$id'");
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
    $isi_artikel = $this->request->getPost('isi');
    $date = date('Y/m/d H:i:s', time());

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

    $artikel = Artikel::findFirst("id_artikel='$id_artikel'");
    $artikel->judul = $judul;
    $artikel->isi_artikel = $isi_artikel;
    $artikel->id_status_artikel = 4;
    $artikel->gambar = $nama_file;
    $artikel->updated_at = $date;
    $artikel->save();
    $this->flashSession->success('Artikel berhasil dipublikasikan');
    $this->response->redirect('verifikasi/');
  }

  public function tolakAction($id)
  {
    $artikel = Artikel::findFirst("id_artikel='$id'");
    $date = date('Y/m/d H:i:s', time());

    $artikel->id_status_artikel = 5;
    $artikel->updated_at = $date;
    $artikel->save();
    $this->flashSession->warning('Artikel ditolak');
    $this->response->redirect('verifikasi/');

  }

	public function hapusAction($id)
	{
		$artikel = Artikel::findFirst("id_artikel='$id'");
    $komentars = Komentar::find("id_artikel='$id'");
    if($komentars)
    {
      foreach ($komentars as $komentar) {
        $komentar->delete();
      }
    }
		$artikel->delete();
    $this->flashSession->warning('Artikel berhasil dihapus');
		$this->response->redirect('artikel/');
	}

  public function catatanpenilikAction()
  {
    $id_artikel = $this->request->getPost('id_artikel');
    $catatan_penilik = $this->request->getPost('catatan_penilik');
    $date = date('Y/m/d H:i:s', time());

    $artikel = Artikel::findFirst("id_artikel='$id_artikel'");
    $artikel->id_status_artikel = 2;
    $artikel->catatan_penilik = $catatan_penilik;
    $artikel->updated_at = $date;
    $artikel->save();
    $this->flashSession->success('Catatan revisi berhasil ditambahkan. Tunggu penulis memberikan tanggapan.');
    $this->response->redirect('verifikasi/');
  }

}