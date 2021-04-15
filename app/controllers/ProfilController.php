<?php

use Phalcon\Mvc\Controller;
// use Phalcon\Http\Response;

class ProfilController extends Controller
{
	public function detailAction($id)
	{
		$artikel = artikel::find("id_user='$id'");
		$user = user::findFirst("id_user='$id'");
		$this->view->artikels = $artikel;
    	$this->view->user = $user;
	}

	
    private function cekhari($layanan)
    {
        $hari = date('l', strtotime($layanan->tanggal));
        switch ($hari) {
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