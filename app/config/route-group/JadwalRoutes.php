<?php

use Phalcon\Mvc\Router\Group as RouterGroup;

class JadwalRoutes extends RouterGroup
{
    public function initialize()
    {
        $this->setPaths([
            'controller' => 'jadwal',
        ]);

        $this->setPrefix('/jadwal');

        $this->addGet(
            '/buat',
            [
                'action' => 'buat',
            ]
        );

        $this->addPost(
            '/buat',
            [
                'action' => 'postbuat',
            ]
        );

        $this->addGet(
            '/jadwalsaya/{id}',
            [
                'action' => 'jadwalsaya',
            ]
        );

        $this->addGet(
            '/hapus/{id}',
            [
                'action' => 'hapus',
            ]
        );
    }
}