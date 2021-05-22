<?php

use Phalcon\Mvc\Controller;

class IndexController extends Controller
{

    public function show404Action()
    {
        
    }
    
    public function indexAction()
    {
        // echo date("Y-m-d h:i");
        // die();
        $id_role = $this->session->get('user')['role'];
        if($id_role)
        {
            $role = Role::findFirst("id_role='$id_role'");
            $this->view->role = $role->nama_role;
        }
        
    }

}