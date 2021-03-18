<?php

use Phalcon\Mvc\Router\Group as RouterGroup;

class ArtikelRoutes extends RouterGroup
{
    public function initialize()
    {
        $this->setPaths([
            'controller' => 'artikel',
        ]);

        $this->setPrefix('/artikel');

        
    }
}