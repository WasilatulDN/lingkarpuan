<?php
namespace App\Validation;

use Phalcon\Validation;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Regex;
use Phalcon\Validation\Validator\StringLength;

class PasienValidation extends Validation
{
    public function initialize(){

    $this->add(
        'namaPasien',
        new PresenceOf(
            [
                'message' => 'The nama pasien is required',
            ]
        )
    );

    $this->add(
        'tgllahir',
        new PresenceOf(
            [
                'message' => 'The tanggal lahir is required',
            ]
        )
    );

    $this->add(
        'jkel',
        new PresenceOf(
            [
                'message' => 'The jenis kelamin is required',
            ]
        )
    );

    $this->add(
        'alamat',
        new PresenceOf(
            [
                'message' => 'The alamat is required',
            ]
        )
    );

    $this->add(
        'alamat',
        new StringLength(
            [
                'min' => 5,
                'max' => 100
            ]
        )
    );

    $this->add(
        'telepon',
        new PresenceOf(
            [
                'message' => 'The telepon is required',
            ]
        )
    );

    $this->add(
        'telepon',
        new Regex(
            [
                'pattern' => '/[0-9]{9,13}/',
                'message' => 'The telephone is not valid',
            ]
        )
    );

    $this->add(
        'nik',
        new PresenceOf(
            [
                'message' => 'The NIK is required',
            ]
        )
    );

    $this->add(
        'nik',
        new Regex(
            [
                'pattern' => '/[0-9]{16}/',
                'message' => 'The NIK is not valid',
            ]
        )
    );
    }
}

?>