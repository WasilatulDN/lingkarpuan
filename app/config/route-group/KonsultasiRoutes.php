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

        
    }
}