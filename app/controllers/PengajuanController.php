<?php

// use Phalcon\Mvc\Controller;
// use Phalcon\Http\Response;
use App\Events\PengajuanProtectController;

class PengajuanController extends PengajuanProtectController
{
	public function daftarAction()
	{
		$id_user = $this->session->get('user')['id'];

		$layanans = PermintaanLayanan::find("id_konsultan='$id_user' and id_status_layanan = 1");

		$data_layanan = array();

        foreach ($layanans as $layanan) {
            $klien = User::findFirst("id_user='$layanan->id_user'");
            $data_layanan[] = array(
              'id_layanan' => $layanan->id_layanan,
              'klien' => $klien->nama,
              'tanggal' => $layanan->tanggal,
              'jam_mulai' => date('H:i', strtotime($layanan->jam_mulai)),
              // 'jam_mulai' => $layanan->jam_mulai,
              'durasi' => $layanan->durasi,
          );
        }

        $this->view->data_layanan = $data_layanan;
	}

    public function diterimaAction()
	{
		$id_user = $this->session->get('user')['id'];

		$layanans = PermintaanLayanan::find("id_konsultan='$id_user' and id_status_layanan = 2");

		$data_layanan = array();

        foreach ($layanans as $layanan) {
            $klien = User::findFirst("id_user='$layanan->id_user'");
            $data_layanan[] = array(
              'id_layanan' => $layanan->id_layanan,
              'klien' => $klien->nama,
              'tanggal' => $layanan->tanggal,
              'jam_mulai' => date('H:i', strtotime($layanan->jam_mulai)),
              // 'jam_mulai' => $layanan->jam_mulai,
              'durasi' => $layanan->durasi,
          );
        }

        $this->view->data_layanan = $data_layanan;
	}

	public function tolakAction($id)
	{
		$layanan = PermintaanLayanan::findFirst("id_layanan='$id'");
		$layanan->id_status_layanan = 3;
		$layanan->save();
        $this->flashSession->warning('Konsultasi ditolak.');
		$this->back();
	}

	public function terimaAction($id)
	{
		$layanan = PermintaanLayanan::findFirst("id_layanan='$id'");
		$id_user = $this->session->get('user')['id'];
		$tanggal = $layanan->tanggal;
		$jam_mulai = $layanan->jam_mulai;
		$jam_selesai = $layanan->jam_selesai;

		$query_1 = 'id_konsultan = :id_user:';
        $query_2 = 'tanggal = :tanggal:';
        $query_3 = 'id_status_layanan = 2';
        $query_4 = 'TIME(jam_mulai) between TIME(:jam_mulai:) AND TIME(:jam_selesai:)';
        $query_5 = 'TIME(jam_selesai) between TIME(:jam_mulai:) AND TIME(:jam_selesai:)';
        $query_6 = 'TIME(:jam_mulai:) between TIME(jam_mulai) AND TIME(jam_selesai)';

        $parameter = [
            'id_user' => $id_user,
            'tanggal' => $tanggal,
            'jam_mulai' => $jam_mulai,
            'jam_selesai' => $jam_selesai,
        ];

        $layananCheck = PermintaanLayanan::findFirst(
            [
                'conditions' => $query_1.' AND '.$query_2.' AND '.$query_3.' AND ('.$query_4.' OR '.$query_5.' OR '.$query_6.' )',
                'bind' => $parameter,
            ]
        );

        if($layananCheck)
        {
        	$this->flashSession->error('Kamu memiliki konsultasi lain di jam tersebut.');
            $this->back();
        }
        else
        {
        	$layanan->id_status_layanan = 2;
        	$layanan->save();
            $this->flashSession->success('Konsultasi berhasil diterima.');
        	$this->back();
        }

        
	}

}