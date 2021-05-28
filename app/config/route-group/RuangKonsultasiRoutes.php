<?php

use Phalcon\Mvc\Router\Group as RouterGroup;

class RuangKonsultasiRoutes extends RouterGroup
{
    public function initialize()
    {
        $this->setPaths([
            'controller' => 'ruangkonsultasi',
        ]);

        $this->setPrefix('/ruang_konsultasi');

        $this->addGet(
            '/chat/{id}',
            [
                'action' => 'chat',
            ]
        );        
    }
}