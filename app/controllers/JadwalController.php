<?php

// use Phalcon\Mvc\Controller;
// use Phalcon\Http\Response;
use App\Events\JadwalProtectController;
use Phalcon\Security\Random;

class JadwalController extends JadwalProtectController
{
	public function buatAction()
	{

	}

	public function postbuatAction()
	{
		$random = new Random();
		$jadwal = new Jadwal();

		$id_jadwal = $random->uuid();
		$id_user = $this->session->get('user')['id'];
        $hari = $this->request->getPost('hari');
        $jam_mulai = $this->request->getPost('jam_mulai');
        $jam_selesai = $this->request->getPost('jam_selesai');

        if ($jam_mulai > $jam_selesai) {
            // throw error
            return $this->response->redirect('/');
        }

        $jadwal->id_jadwal = $id_jadwal;
        $jadwal->id_user = $id_user;
        $jadwal->hari = $hari;
        $jadwal->jam_mulai = $jam_mulai;
        $jadwal->jam_selesai = $jam_selesai;

        if ($this->cekJadwal($jadwal)) {
            // throw error
            return $this->response->redirect('/');
        }
        $jadwal->save();
        return $this->response->redirect('/');

	}

	private function cekJadwal($jadwal)
	{
		$id_user = $jadwal->id_user;
		$hari = $jadwal->hari;
		$jam_mulai = $jadwal->jam_mulai;
		$jam_selesai = $jadwal->jam_selesai;

        $query_1 = 'id_user = :id_user:';
        $query_2 = 'hari = :hari:';
        $query_3 = 'TIME(jam_mulai) between TIME(:jam_mulai:) AND TIME(:jam_selesai:)';
        $query_4 = 'TIME(jam_selesai) between TIME(:jam_mulai:) AND TIME(:jam_selesai:)';
        $query_5 = 'TIME(:jam_mulai:) between TIME(jam_mulai) AND TIME(jam_selesai)';

        $parameter = [
        	'id_user' => $id_user,
            'hari' => $hari,
            'jam_mulai' => $jam_mulai,
            'jam_selesai' => $jam_selesai,
        ];

        $jadwalCheck = Jadwal::findFirst(
            [
                'conditions' => $query_1.' AND '. $query_2. ' AND ('.$query_3.' OR '.$query_4.' OR '.$query_5.' )',
                'bind' => $parameter,
            ]
        );

        // $jadwalCheckCount = count($jadwalCheck);

        return $jadwalCheck ?? 0;

	}

    public function jadwalsayaAction()
    {
        $id = $this->session->get('user')['id'];
        $jadwals = Jadwal::find("id_user='$id'");

        $data_jadwal = array();

        foreach ($jadwals as $jadwal) {
            $hari = $this->cekhari($jadwal->hari);
            $data_jadwal[] = array(
                'id_jadwal' => $jadwal->id_jadwal,
                'hari' => $hari,
                'jam_mulai' => $jadwal->jam_mulai,
                'jam_selesai' => $jadwal->jam_selesai,
            );
        }

        $this->view->jadwals = $data_jadwal;
        
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

	public function hapusAction($id)
	{
        $jadwal = Jadwal::findFirst("id_jadwal='$id'");
		$jadwal->delete();
		return $this->back();
	}

}