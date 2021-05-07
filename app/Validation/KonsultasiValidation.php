<?php

namespace App\Validation;

use Phalcon\Validation;
use Phalcon\Validation\Validator\Callback;

class KonsultasiValidation extends Validation
{
    public function initialize()
    {

        $this->add(
            'tanggal',
            new Callback(
                [
                    "message" => "Cek kembali tanggal konsultasi",
                    "callback" => function ($data) {
                        if ($data['tanggal'] < date("Y-m-d")) {
                            return false;
                        }
                        return true;
                    }
                ]
            )
        );
        
        date_default_timezone_set('Asia/Jakarta');
        $this->add(
            'jam',
            new Callback(
                [
                    "message" => "Cek kembali jam konsultasi",
                    "callback" => function ($data) {
                        if ($data['tanggal'] == date("Y-m-d") && $data['jam'] < date("h:i")) {
                            return false;
                        }
                        return true;
                    }
                ]
            )
        );
    }
}
