<?php

use App\Events\ProfilProtectController;
use App\Validation\PasswordValidation;

class ProfilController extends ProfilProtectController
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

    
    public function ubahpasswordAction()
    {
        $this->view->messages = $this->messages;

    }

    public function postubahpasswordAction()
    {
        $val = new PasswordValidation();
        $messages = $val->validate($_POST);

        if (count($messages)) {
            $this->messages = array();
            foreach ($messages as $m) {
                $this->messages[$m->getField()] = $m;
            }
            $this->dispatcher->forward(['action' => 'ubahpassword']);
            return;
        }

        $id_user = $this->request->getPost('id_user');
        $password_baru = $this->request->getPost('password_baru');

        $user = User::findFirst("id_user='$id_user'");
        $user->password = $this->security->hash($password_baru);
        $user->save();
        
        $this->flashSession->success("Kata sandi berhasil diperbarui.");
        $this->back();
        
    }

}