<?php
namespace App\Events;

use Phalcon\Mvc\Controller;

class ApotekerProtectController extends Controller
{
    public function beforeExecuteRoute()
    {
        if(!$this->session->has('apoteker')){
            $this->flashSession->error('Anda bukan apoteker, Anda tidak berhak akses');
            return $this->response->redirect('user/login');
        }
    }
    protected function back() {
        return $this->response->redirect($_SERVER['HTTP_REFERER']);
    }
}