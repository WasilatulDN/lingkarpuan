<?php

namespace App\Validation;

use Phalcon\Validation;
use Phalcon\Validation\Validator\Regex;
use Phalcon\Validation\Validator\Confirmation;
use Phalcon\Validation\Validator\Callback;
use User;

class PasswordValidation extends Validation
{
    public function initialize()
    {

        $this->add(
            'password_lama',
            new Callback(
                [
                    "message" => "Kata sandi lama tidak sesuai",
                    "callback" => function ($data) {
                        $id_user = $data['id_user'];
                        $user = User::findFirst("id_user='$id_user'");
                        if ($this->security->checkHash($data['password_lama'], $user->password)) {
                            return true;
                        }
                    return false;                    
                    }
                ]
            )
        );
        
        $this->add(
            'password_baru',
            new Regex(
                [
                    'pattern' => '/[^_\s]{8,}/',
                    'message' => 'Kata sandi harus terdiri dari minimal 8 karakter',
                ]
            )
        );
    
        $this->add(
            'konfirmasi_password_baru',
            new Confirmation(
                [
                    "message" => "Konfirmasi kata sandi tidak sesuai",
                    "with"    => "password_baru",
                ]
            )
        );
    }
}
