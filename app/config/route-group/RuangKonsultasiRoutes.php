<?php

use Phalcon\Mvc\Router\Group as RouterGroup;

class RuangKonsultasiRoutes extends RouterGroup
{
    public function initialize()
    {
        $this->setPaths([
            'controller' => 'ruangKonsultasi',
        ]);

        $this->setPrefix('/ruang_konsultasi');

        
    }
}