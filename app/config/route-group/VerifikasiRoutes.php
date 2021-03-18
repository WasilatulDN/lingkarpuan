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

        
    }
}