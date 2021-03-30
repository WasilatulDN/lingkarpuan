<?php

use Phalcon\Mvc\Router\Group as RouterGroup;

class VerifikasiRoutes extends RouterGroup
{
    public function initialize()
    {
        $this->setPaths([
            'controller' => 'verifikasi',
        ]);

        $this->setPrefix('/verifikasi');

        $this->addGet(
            '/',
            [
                'action' => 'verifikasi',
            ]
        );

        $this->addGet(
            '/detail/{id}',
            [
                'action' => 'detail',
            ]
        );

        $this->addGet(
            '/terima/{id}',
            [
                'action' => 'terima',
            ]
        );

        $this->addPost(
            '/terima',
            [
                'action' => 'postterima',
            ]
        );

        $this->addGet(
            '/tolak/{id}',
            [
                'action' => 'tolak',
            ]
        );

        $this->addGet(
            '/hapus/{id}',
            [
                'action' => 'hapus',
            ]
        );

        $this->addPost(
            '/catatan_penilik',
            [
                'action' => 'catatanpenilik',
            ]
        );
    }
}