<?php

use Phalcon\Mvc\Controller;
use Phalcon\Http\Response;
use App\Events\UserProtectController;
use Phalcon\Security\Random;

class RuangKonsultasiController extends Controller
{
    public function chatAction($id)
    {
        $userData = $this->session->get('user');
        // Check apakah ada jadwal yang sedang berjalan
        $query_1 = 'id_layanan = :id:';
        $query_2 = 'id_user = :id_user: OR id_konsultan = :id_konsultan:';

        $parameter = [
            'id' => $id,
            'id_user' => $userData['id'],
            'id_konsultan' => $userData['id'],
        ];
        // "de9ef2bd-a9cf-45be-b8d1-db764f7fb17e"
        // "f13a0532-21fe-41e6-9273-8b16891caa59"
        // "f13a0532-21fe-41e6-9273-8b16891caa59"
        // "205438eca328e1ee19e82b71cfa45782"
        $konsultasi = PermintaanLayanan::findFirst(
            [
                'conditions' => $query_1.' AND ('.$query_2.')',
                'bind' => $parameter
            ]
        );

        if (!$konsultasi) {
            # code...
        } else {
        }
        $a= $konsultasi->id_konsultan;
        $b= $konsultasi->id_user;
        $kodeRuangan = md5($konsultasi->id_konsultan . $konsultasi->id_user);
        $this->view->user = $userData;
        $this->view->kode = $kodeRuangan;
        
    }

    public function chatHistoryAction()
    {
        $userData = $this->session->get('user');
        // Check apakah ada jadwal yang sedang berjalan
        $this->view->user = $userData;
    }

}