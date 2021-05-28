<?php
namespace App\Events;

use Phalcon\Mvc\Controller;

class JadwalProtectController extends Controller
{
    public function beforeExecuteRoute()
    {
        if($this->session->get('user')['role'] != 2 && $this->session->get('user')['role'] != 3){
            return $this->response->redirect();
        }
    }
    protected function back() {
        return $this->response->redirect($_SERVER['HTTP_REFERER']);
    }
}