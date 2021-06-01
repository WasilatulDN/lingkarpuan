<?php
namespace App\Validation;

use Phalcon\Validation;
use Phalcon\Validation\Validator\Regex;
use Phalcon\Validation\Validator\Confirmation;
use Phalcon\Validation\Validator\Uniqueness;
use User;

class UserValidation extends Validation
{
    public function initialize(){

    $this->add(
        'password',
        new Regex(
            [
                'pattern' => '/[^_\s]{8,}/',
                'message' => 'Kata sandi harus terdiri dari minimal 8 karakter',
            ]
        )
    );

    $this->add(
        'konfirmasi_password',
        new Confirmation(
            [
                "message" => "Konfirmasi kata sandi tidak sesuai",
                "with"    => "password",
            ]
        )
    );

    $this->add(
        'email',
        new Uniqueness(
            [
                'model' => new User(),
                'message' => 'Email sudah digunakan',
            ]
        )
    );
    }
}

?>