<?php

use Phalcon\Mvc\Controller;
use Phalcon\Http\Response;
use App\Events\UserProtectController;
use Phalcon\Security\Random;

class IndexController extends UserProtectController
{

    public function show404Action()
    {
        $this->view->pick('base/show404');
    }
    
    public function indexAction()
    {
        
    }

}