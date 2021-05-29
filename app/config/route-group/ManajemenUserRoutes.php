<?php

use Phalcon\Mvc\Router\Group as RouterGroup;

class ManajemenUserRoutes extends RouterGroup
{
    public function initialize()
    {
        $this->setPaths([
            'controller' => 'manajemenuser',
        ]);

        $this->setPrefix('/manajemenuser');

        $this->addGet(
            '/',
            [
                'action' => 'index',
            ]
        );

        $this->addGet(
            '/buat',
            [
                'action' => 'buat',
            ]
        );

        $this->addPost(
            '/postbuat',
            [
                'action' => 'postbuat',
            ]
        );
    }
}