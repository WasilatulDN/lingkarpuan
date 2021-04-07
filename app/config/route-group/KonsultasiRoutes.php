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

        $this->addGet(
            '/psikologi',
            [
                'action' => 'psikologi',
            ]
        );

        $this->addPost(
            '/psikologi',
            [
                'action' => 'postpsikologi',
            ]
        );

        $this->addGet(
            '/hukum',
            [
                'action' => 'hukum',
            ]
        );

        $this->addPost(
            '/hukum',
            [
                'action' => 'posthukum',
            ]
        );
    }
}