<?php

// use Phalcon\Mvc\Controller;
// use Phalcon\Http\Response;
use App\Validation\KonsultasiValidation;
use App\Events\KonsultasiProtectController;
use Phalcon\Security\Random;

class KonsultasiController extends KonsultasiProtectController
{
    private $messages;

	public function hukumAction()
    {
    	$hukums = User::find("id_role='3'");
		$this->view->hukums = $hukums;
        $this->view->messages = $this->messages;

    }

    public function psikologiAction()
    {
    	$psikologs = User::find("id_role='2'");
		$this->view->psikologs = $psikologs;
        $this->view->messages = $this->messages;
    }

    public function postpsikologiAction()
    {
        $val = new KonsultasiValidation();
        $messages = $val->validate($_POST);

        if (count($messages)) {
            $this->messages = array();
            foreach ($messages as $m) {
                $this->messages[$m->getField()] = $m;
            }
            $this->dispatcher->forward(['action' => 'psikologi']);
            return;
        }

        $random = new Random();
        $layanan = new PermintaanLayanan();

        $id_layanan = $random->uuid();
        $id_user = $this->session->get('user')['id'];
        $id_konsultan = $this->request->getPost('psikolog');
        $id_status_layanan = $layanan::MENUNGGU;
        $tanggal = $this->request->getPost('tanggal');
        $jam_mulai = $this->request->getPost('jam');
        $durasi = $this->request->getPost('durasi');
        $jam_selesai = date('H:i', strtotime('+' . $durasi . 'minutes', strtotime($jam_mulai)));
        $jenis_layanan = $layanan::PSIKOLOGI;
        if ($jam_mulai > $jam_selesai) {
            $this->flashSession->error('cek kembali jam pengajuan konsultasimu.');
            $this->back();
            return;
        }

        $layanan->id_layanan = $id_layanan;
        $layanan->id_user = $id_user;
        $layanan->id_konsultan = $id_konsultan;
        $layanan->id_status_layanan = $id_status_layanan; 
        $layanan->tanggal = $tanggal;
        $layanan->jam_mulai = $jam_mulai;
        $layanan->durasi = $durasi;
        $layanan->jam_selesai = $jam_selesai;
        $layanan->jenis_layanan = $jenis_layanan;
        if ($this->cekTanggalLayanan($layanan)) {
            if($this->cekJadwal($layanan))
            {
                $layanan->save();
                $this->flashSession->success('Berhasil mengajukan konsultasi psikologi.');
                return $this->response->redirect('konsultasi/psikologi/daftar');
            }
            else
            {
                $this->flashSession->error('Jam pengajuan tidak sesuai dengan jadwal rekan cerita yang dipilih.');
                $this->back();
            }
            
        }
        else
        {
            $this->flashSession->error('Kamu memiliki konsultasi lain di jam tersebut.');
            $this->back();
        }
    }

    public function posthukumAction()
    {
        $val = new KonsultasiValidation();
        $messages = $val->validate($_POST);

        if (count($messages)) {
            $this->messages = array();
            foreach ($messages as $m) {
                $this->messages[$m->getField()] = $m;
            }
            $this->dispatcher->forward(['action' => 'hukum']);
            return;
        }

        $random = new Random();
        $layanan = new PermintaanLayanan();

        $id_layanan = $random->uuid();
        $id_user = $this->session->get('user')['id'];
        $id_konsultan = $this->request->getPost('hukum');
        $id_status_layanan = $layanan::MENUNGGU;
        $tanggal = $this->request->getPost('tanggal');
        $jam_mulai = $this->request->getPost('jam');
        $durasi = $this->request->getPost('durasi');
        $jam_selesai = date('H:i', strtotime('+' . $durasi . 'minutes', strtotime($jam_mulai)));
        $jenis_layanan = $layanan::HUKUM;
        if ($jam_mulai > $jam_selesai) {
            $this->flashSession->error('cek kembali jam pengajuan konsultasimu.');
            $this->back();
            return;
        }

        $layanan->id_layanan = $id_layanan;
        $layanan->id_user = $id_user;
        $layanan->id_konsultan = $id_konsultan;
        $layanan->id_status_layanan = $id_status_layanan; 
        $layanan->tanggal = $tanggal;
        $layanan->jam_mulai = $jam_mulai;
        $layanan->durasi = $durasi;
        $layanan->jam_selesai = $jam_selesai;
        $layanan->jenis_layanan = $jenis_layanan;
        if ($this->cekTanggalLayanan($layanan)) {
            if($this->cekJadwal($layanan))
            {
                $layanan->save();
                $this->flashSession->success('Berhasil mengajukan konsultasi hukum.');
                return $this->response->redirect('konsultasi/hukum/daftar');
            }
            else
            {
                $this->flashSession->error('Jam pengajuan tidak sesuai dengan jadwal rekan hukum yang dipilih.');
                $this->back();
            }
            
        }
        else
        {
            $this->flashSession->error('Kamu memiliki konsultasi lain di jam tersebut.');
            $this->back();
        }
    }

    private function cekTanggalLayanan($layanan)
    {
        $id_user = $layanan->id_user;
        $tanggal = $layanan->tanggal;
        $jam_mulai = $layanan->jam_mulai;
        $jam_selesai = $layanan->jam_selesai;

        $query_1 = 'id_user = :id_user:';
        $query_2 = 'id_status_layanan != ' . PermintaanLayanan::DITOLAK;
        $query_3 = 'tanggal = :tanggal:';
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

    public function daftarpsikologiAction()
    {
        $id_user = $this->session->get('user')['id'];

        $query_1 = 'id_user = :id_user:';
        $query_2 = 'jenis_layanan = 1';

        $parameter = [
            'id_user' => $id_user,
        ];

        $layanans = PermintaanLayanan::find(
            [
                'conditions' => $query_1.' AND '.$query_2,
                'bind' => $parameter,
            ]
        );

        $data_layanan = array();

        foreach ($layanans as $layanan) {
            $psikolog = User::findFirst("id_user='$layanan->id_konsultan'");
            $status = StatusLayanan::findFirst("id_status_layanan='$layanan->id_status_layanan'");
            $data_layanan[] = array(
              'id_layanan' => $layanan->id_layanan,
              'psikolog' => $psikolog->nama,
              'tanggal' => $layanan->tanggal,
              'jam_mulai' => date('H:i', strtotime($layanan->jam_mulai)),
              // 'jam_mulai' => $layanan->jam_mulai,
              'durasi' => $layanan->durasi,
              'status' => $status->nama_status,
          );
        }

        $this->view->data_layanan = $data_layanan;

    }

    public function daftarhukumAction()
    {
        $id_user = $this->session->get('user')['id'];

        $query_1 = 'id_user = :id_user:';
        $query_2 = 'jenis_layanan = 2';

        $parameter = [
            'id_user' => $id_user,
        ];

        $layanans = PermintaanLayanan::find(
            [
                'conditions' => $query_1.' AND '.$query_2,
                'bind' => $parameter,
            ]
        );

        $data_layanan = array();

        foreach ($layanans as $layanan) {
            $psikolog =User::findFirst("id_user='$layanan->id_konsultan'");
            $status = StatusLayanan::findFirst("id_status_layanan='$layanan->id_status_layanan'");
            $data_layanan[] = array(
              'id_layanan' => $layanan->id_layanan,
              'psikolog' => $psikolog->nama,
              'tanggal' => $layanan->tanggal,
              'jam_mulai' => date('H:i', strtotime($layanan->jam_mulai)),
              // 'jam_mulai' => $layanan->jam_mulai,
              'durasi' => $layanan->durasi,
              'status' => $status->nama_status,
          );
        }

        $this->view->data_layanan = $data_layanan;

    }

    private function cekhari($harikonsultasi)
    {
        switch ($harikonsultasi) {
            case 'Monday':
                return 'Senin';
                break;

            case 'Tuesday':
                return 'Selasa';
                break;

            case 'Wednesday':
                return 'Rabu';
                break;

            case 'Thursday':
                return 'Kamis';
                break;

            case 'Friday':
                return 'Jumat';
                break;

            case 'Satudray':
                return 'Sabtu';
                break;

            case 'Sunday':
                return 'Minggu';
                break;
            
            default:
                # code...
                break;
        }
    }

    public function listjadwalAction($id){
        $jadwals = Jadwal::find("id_user='$id'");
        $jadwals_json = [];
        foreach ($jadwals as $jadwal) {
            $jadwals_json[] = [
                'hari' => $this->cekhari($jadwal->hari),
                'jam_mulai' => $jadwal->jam_mulai,
                'jam_selesai' => $jadwal->jam_selesai,
            ];
        }
        $this->response->setJsonContent($jadwals_json);
        return $this->response->send();
    }


}