<?php

use Phalcon\Mvc\Router\Group as RouterGroup;

class ProfilRoutes extends RouterGroup
{
    public function initialize()
    {
        $this->setPaths([
            'controller' => 'profil',
        ]);

        $this->setPrefix('/profil');

        $this->addGet(
            '/detail/{id}',
            [
                'action' => 'detail',
            ]
        );
    }
}