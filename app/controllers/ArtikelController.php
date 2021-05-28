<?php

use Phalcon\Mvc\Controller;
// use Phalcon\Http\Response;
use Phalcon\Security\Random;

class ArtikelController extends Controller
{
    public function artikelAction()
    {
        $artikels = Artikel::find("id_status_artikel='4' ORDER BY updated_at DESC");

        $data_artikel = array();

        foreach ($artikels as $artikel) {
            $penulis_artikel = User::findFirst("id_user='$artikel->id_user'");
            $data_artikel[] = array(
                'id_artikel' => $artikel->id_artikel,
                'judul' => $artikel->judul,
                'nama_user' => $penulis_artikel->nama,
                'gambar' => $artikel->gambar,
                'tanggal' => $artikel->updated_at,
            );
        }

        $this->view->artikels = $data_artikel;
    }

    public function detailAction($id)
    {
        $artikel = Artikel::findFirst("id_artikel='$id'");
        $penulis = User::findFirst("id_user='$artikel->id_user'");
        $komentars = Komentar::find("id_artikel='$id' ORDER BY created_at ASC");

        // echo $penulis->nama; die();

        $data_komentar = array();

        foreach ($komentars as $komentar) {
            $penulis_komentar = User::findFirst("id_user='$komentar->id_user'");
            $data_komentar[] = array(
                'id_komentar' => $komentar->id_komentar,
                'id_user' => $komentar->id_user,
                'role_user' => $penulis_komentar->id_role,
                'nama_user' => $penulis_komentar->nama,
                'isi_komentar' => $komentar->isi_komentar,
            );
        }

        // var_dump($data_komentar); die();

        $this->view->artikel = $artikel;
        $this->view->penulis = $penulis;
        $this->view->data_komentar = $data_komentar;
    }

    public function postkomentarAction()
    {
        $random = new Random();
        $komentar = new Komentar();

        $id_komentar = $random->uuid();
        $id_user = $this->session->get('user')['id'];
        $id_artikel = $this->request->getPost('id_artikel');
        $isi_komentar = $this->request->getPost('isi_komentar');
		$date = date('Y/m/d H:i:s', time());

        $komentar->id_komentar = $id_komentar;
        $komentar->id_user = $id_user;
        $komentar->id_artikel = $id_artikel;
        $komentar->isi_komentar = $isi_komentar;
        $komentar->created_at = $date;
        $komentar->save();
        $this->response->redirect('artikel/detail/' . $id_artikel);
    }

    public function hapuskomentarAction($id)
    {
        $komentar = Komentar::findFirst("id_komentar='$id'");
        $id_artikel = $komentar->id_artikel;
        $komentar->delete();
        $this->response->redirect('artikel/detail/' . $id_artikel);
    }
}