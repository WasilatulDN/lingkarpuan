<?php
namespace App\Validation;

use Phalcon\Validation;
use Phalcon\Mvc\Model;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Regex;
use Phalcon\Validation\Validator\StringLength;
use Phalcon\Validation\Validator\Email;
use Phalcon\Validation\Validator\Confirmation;
use Phalcon\Validation\Validator\Uniqueness;
use User;

// use App\Model\User;
// use User as GlobalUser;

class UserValidation extends Validation
{
    public function initialize(){

    $this->add(
        'password',
        new Regex(
            [
                'pattern' => '/[^_\n\r\s]{8,}/',
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

    // $this->add(
    //     'email',
    //     new PresenceOf(
    //         [
    //             'message' => 'The email is required',
    //         ]
    //     )
    // );

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