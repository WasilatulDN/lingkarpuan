<?php

use Phalcon\Mvc\Router\Group as RouterGroup;

class KonsultasiRoutes extends RouterGroup
{
    public function initialize()
    {
        $this->setPaths([
            'controller' => 'konsultasi',
        ]);

        $this->setPrefix('/konsultasi');

        $this->addGet(
            '/psikologi',
            [
                'action' => 'psikologi',
            ]
        );

        $this->addPost(
            '/psikologi',
            [
                'action' => 'postpsikologi',
            ]
        );

        $this->addGet(
            '/psikologi/daftar',
            [
                'action' => 'daftarpsikologi',
            ]
        );

        $this->addGet(
            '/hukum',
            [
                'action' => 'hukum',
            ]
        );

        $this->addPost(
            '/hukum',
            [
                'action' => 'posthukum',
            ]
        );

        $this->addGet(
            '/hukum/daftar',
            [
                'action' => 'daftarhukum',
            ]
        );

        $this->addGet(
            '/jadwal/{id}',
            [
                'action' => 'listjadwal',
            ]
        );
    }
}