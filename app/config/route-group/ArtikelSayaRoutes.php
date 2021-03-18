<?php

use Phalcon\Mvc\Router\Group as RouterGroup;

class ArtikelSayaRoutes extends RouterGroup
{
    public function initialize()
    {
        $this->setPaths([
            'controller' => 'artikelSaya',
        ]);

        $this->setPrefix('/artikel_saya');

        
    }
}