<?php

use Phalcon\Mvc\Controller;

class IndexController extends Controller
{

    public function show404Action()
    {
        $this->view->pick('base/show404');
    }
    
    public function indexAction()
    {
        
    }

}