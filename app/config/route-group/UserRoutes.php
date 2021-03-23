<?php

use Phalcon\Mvc\Router\Group as RouterGroup;

class UserRoutes extends RouterGroup
{
    public function initialize()
    {
        $this->setPaths([
            'controller' => 'user',
        ]);

        $this->setPrefix('/user');

        $this->addGet(
            '/register',
            [
                'action' => 'register',
            ]
        );

        $this->addPost(
            '/register',
            [
                'action' => 'postregister',
            ]
        );

        $this->addGet(
            '/login',
            [
                'action' => 'login',
            ]
        );

        $this->addPost(
            '/login',
            [
                'action' => 'storelogin',
            ]
        );

        $this->addGet(
            '/logout',
            [
                'action' => 'logout',
            ]
        );
        
    }
}