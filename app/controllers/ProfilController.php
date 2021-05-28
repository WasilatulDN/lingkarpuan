<?php

use Phalcon\Mvc\Controller;
// use Phalcon\Http\Response;

class ProfilController extends Controller
{
	public function detailAction($id)
	{
		$artikel = Artikel::find("id_user='$id'");
		$user = User::findFirst("id_user='$id'");
        $role = Role::findFirst("id_role='$user->id_role'");
        $jadwals = Jadwal::find("id_user='$id'");
		$this->view->artikels = $artikel;
    	$this->view->user = $user;
        $this->view->role = $role;

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

}