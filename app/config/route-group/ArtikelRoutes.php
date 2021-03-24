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

        $this->addGet(
            '/',
            [
                'action' => 'artikel',
            ]
        );

        $this->addGet(
            '/detail/{id}',
            [
                'action' => 'detail',
            ]
        );

        $this->addPost(
            '/komentar',
            [
                'action' => 'postkomentar',
            ]
        );

        $this->addGet(
            '/hapuskomentar/{id}',
            [
                'action' => 'hapuskomentar',
            ]
        );
        
    }
}