<?php

use Phalcon\Mvc\Controller;
use Phalcon\Http\Response;
use App\Events\UserProtectController;
use Phalcon\Security\Random;

class KonsultasiController extends Controller
{
	public function hukumAction()
    {
    	$hukums = user::find("id_role='3'");
		$this->view->hukums = $hukums;


    }

    public function psikologiAction()
    {
    	$psikologs = user::find("id_role='2'");
		$this->view->psikologs = $psikologs;

    }

    public function postpsikologiAction()
    {
        $random = new \Phalcon\Security\Random();
        $layanan = new PermintaanLayanan();

        $id_layanan = $random->uuid();
        $id_user = $this->session->get('user')['id'];
        $id_konsultan = $this->request->getPost('psikolog');
        /**
         * Tambah status layanan disini
         * $id_status_layanan = 0;
         */
        $tanggal = $this->request->getPost('tanggal');
        $jam_mulai = $this->request->getPost('jam');
        $durasi = $this->request->getPost('durasi');
        $jam_selesai = date('H:i', strtotime('+' . $durasi . 'minutes', strtotime($jam_mulai)));
        $jenis_layanan = $layanan::PSIKOLOGI;
        if ($jam_mulai > $jam_selesai) {
            // throw error
            return $this->response->redirect('/');
        }

        $layanan->id_layanan = $id_layanan;
        $layanan->id_user = $id_user;
        $layanan->id_konsultan = $id_konsultan;
        /**
         * Tambah status layanan disini
         * $layanan->id_status_layanan = $id_status_layanan;
         */
        $layanan->tanggal = $tanggal;
        $layanan->jam_mulai = $jam_mulai;
        $layanan->durasi = $durasi;
        $layanan->jam_selesai = $jam_selesai;
        $layanan->jenis_layanan = $jenis_layanan;
        if ($this->cekTanggalLayanan($layanan) and $this->cekJadwal($layanan)) {
            $layanan->save();
            return $this->response->redirect('/');
        }
        else
        {
            return $this->response->redirect('/');
        }
    }

    public function posthukumAction()
    {
        $random = new \Phalcon\Security\Random();
        $layanan = new PermintaanLayanan();

        $id_layanan = $random->uuid();
        $id_user = $this->session->get('user')['id'];
        $id_konsultan = $this->request->getPost('hukum');
        /**
         * Tambah status layanan disini
         * $id_status_layanan = 0;
         */
        $tanggal = $this->request->getPost('tanggal');
        $jam_mulai = $this->request->getPost('jam');
        $durasi = $this->request->getPost('durasi');
        $jam_selesai = date('H:i', strtotime('+' . $durasi . 'minutes', strtotime($jam_mulai)));
        $jenis_layanan = $layanan::HUKUM;
        if ($jam_mulai > $jam_selesai) {
            // throw error
            return $this->response->redirect('/');
        }

        $layanan->id_layanan = $id_layanan;
        $layanan->id_user = $id_user;
        $layanan->id_konsultan = $id_konsultan;
        /**
         * Tambah status layanan disini
         * $layanan->id_status_layanan = $id_status_layanan;
         */
        $layanan->tanggal = $tanggal;
        $layanan->jam_mulai = $jam_mulai;
        $layanan->durasi = $durasi;
        $layanan->jam_selesai = $jam_selesai;
        $layanan->jenis_layanan = $jenis_layanan;
        if ($this->cekTanggalLayanan($layanan) and $this->cekJadwal($layanan)) {
            $layanan->save();
            return $this->response->redirect('/');
        }
        else
        {
            return $this->response->redirect('/');
        }
    }

    private function cekTanggalLayanan($layanan)
    {
        $tanggal = $layanan->tanggal;
        $jam_mulai = $layanan->jam_mulai;
        $jam_selesai = $layanan->jam_selesai;

        $query_1 = 'tanggal = :tanggal:';
        $query_2 = 'TIME(jam_mulai) between TIME(:jam_mulai:) AND TIME(:jam_selesai:)';
        $query_3 = 'TIME(jam_selesai) between TIME(:jam_mulai:) AND TIME(:jam_selesai:)';
        $query_4 = 'TIME(:jam_mulai:) between TIME(jam_mulai) AND TIME(jam_selesai)';

        $parameter = [
            'tanggal' => $tanggal,
            'jam_mulai' => $jam_mulai,
            'jam_selesai' => $jam_selesai,
        ];

        $layananCheck = PermintaanLayanan::findFirst(
            [
                'conditions' => $query_1.' AND ('.$query_2.' OR '.$query_3.' OR '.$query_4.' )',
                'bind' => $parameter,
            ]
        );

        // $layananCheckCount = count($layananCheck);

        if($layananCheck)
        {
            return false;
        }
        else
        {
            return true;
        }
    }

    private function cekJadwal($layanan)
    {
        $id_konsultan = $layanan->id_konsultan;
        $tanggal = $layanan->tanggal;
        // $cektanggal = strtotime($tanggal);
        $hari = date('l', strtotime($tanggal));
        $jam_mulai = $layanan->jam_mulai;
        $jam_selesai = $layanan->jam_selesai;

        $query_1 = 'id_user = :id_konsultan:';
        $query_2 = 'hari = :hari:';
        $query_3 = 'TIME(:jam_mulai:) between TIME(jam_mulai) AND TIME(jam_selesai)';
        $query_4 = 'TIME(:jam_selesai:) between TIME(jam_mulai) AND TIME(jam_selesai)';
        // $query_4 = 'TIME(:jam_mulai:) between TIME(jam_mulai) AND TIME(jam_selesai)';

        $parameter = [
            'id_konsultan' => $id_konsultan,
            'hari' => $hari,
            'jam_mulai' => $jam_mulai,
            'jam_selesai' => $jam_selesai,
        ];

        $jadwalCheck = Jadwal::findFirst(
            [
                'conditions' => $query_1.' AND '.$query_2.' AND '.$query_3.' AND '.$query_4,
                'bind' => $parameter,
            ]
        );

        // $jadwalCheckCount = count($jadwalCheck);

        if($jadwalCheck)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

}