<?php

// use Phalcon\Mvc\Controller;
// use Phalcon\Http\Response;
use App\Events\RuangKonsultasiProtectController;

class RuangkonsultasiController extends RuangKonsultasiProtectController
{
    public function chatAction($id)
    {
        $userData = $this->session->get('user');
        
        $cek_konsultasi = PermintaanLayanan::findFirst("id_layanan = '$id'");
        if($cek_konsultasi->id_status_layanan != PermintaanLayanan::DITERIMA)
        {
            $this->flashSession->warning('Konsultasi belum diterima.');
            $this->back();
            return;
        }

        // Check apakah ada jadwal yang sedang berjalan
        $query_1 = 'id_layanan = :id:';
        $query_2 = 'id_user = :id_user: OR id_konsultan = :id_konsultan:';
        $query_3 = 'TIME(:jam:) between TIME(jam_mulai) AND TIME(jam_selesai)';
        $query_4 = ':tanggal: = tanggal';

        $parameter = [
            'id' => $id,
            'id_user' => $userData['id'],
            'id_konsultan' => $userData['id'],
            'jam' => date('H:i'),
            'tanggal' => date('Y-m-d'),
        ];
        
        $konsultasi = PermintaanLayanan::findFirst(
            // "id_layanan='0837201c-ea2c-4d53-b223-b63b498f6b4b'"
            [
                'conditions' => $query_1.' AND ('.$query_2.') AND ('. $query_3.') AND '.$query_4,
                // 'conditions' => $query_1.' AND ('.$query_2.')',
                'bind' => $parameter
            ]
        );

        if (!$konsultasi) {
            $this->flashSession->error('Konsultasi belum dimulai atau sudah berakhir');
            $this->back();
            return;
        }

        $kodeRuangan = md5($konsultasi->id_konsultan . $konsultasi->id_user);
        if ($userData['role'] == 1) {
            // $this->view->lawan_id = 'f13a0532-21fe-41e6-9273-8b16891caa59';
            $this->view->lawan_id = $konsultasi->id_konsultan;
        } else {
            // $this->view->lawan_id = "e02ceaac-ba97-4e4a-94dc-b817c867f4e3";
            $this->view->lawan_id = $konsultasi->id_user;
        }

        $puan = User::findFirst("id_user='$konsultasi->id_user'");
        $konsultan = User::findFirst("id_user='$konsultasi->id_konsultan'");
        $this->view->puan = $puan;
        $this->view->konsultan = $konsultan;
        $this->view->user = $userData;
        $this->view->kode = $kodeRuangan;
        
    }
}
