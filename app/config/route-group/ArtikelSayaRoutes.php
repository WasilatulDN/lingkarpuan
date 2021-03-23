<?php

use Phalcon\Mvc\Router\Group as RouterGroup;

class ArtikelSayaRoutes extends RouterGroup
{
    public function initialize()
    {
        $this->setPaths([
            'controller' => 'artikelSaya',
        ]);

        $this->setPrefix('/artikelsaya');

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

        
    }
}