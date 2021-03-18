<?php
namespace App\Events;

use Phalcon\Mvc\Controller;

class AdminProtectController extends Controller
{
    public function beforeExecuteRoute()
    {
        if(!$this->session->has('admin')){
            $this->flashSession->error('Anda bukan admin, Anda tidak berhak akses');
            return $this->response->redirect('user/login');
        }
    }
    protected function back() {
        return $this->response->redirect($_SERVER['HTTP_REFERER']);
    }
}