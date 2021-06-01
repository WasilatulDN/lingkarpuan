<?php
namespace App\Events;

use Phalcon\Mvc\Controller;

class ManajemenUserProtectController extends Controller
{
    public function beforeExecuteRoute()
    {
        if($this->session->get('user')['role'] != 5){
            return $this->response->redirect();
        }
    }
    protected function back() {
        return $this->response->redirect($_SERVER['HTTP_REFERER']);
    }
}