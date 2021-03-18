<?php
namespace App\Events;

use Phalcon\Mvc\Controller;

class UserProtectController extends Controller
{
    public function beforeExecuteRoute()
    {
        if($this->session->has('dokter')){
            $this->flashSession->warning('Anda sudah login sebagai dokter');
            return $this->response->redirect('dokter/home');
        }
        elseif($this->session->has('admin')){
            $this->flashSession->warning('Anda sudah login sebagai admin');
            return $this->response->redirect('admin/home');
        }
        elseif($this->session->has('apoteker')){
            $this->flashSession->warning('Anda sudah login sebagai apoteker');
            return $this->response->redirect('apoteker/home');
        }
    }
    protected function back() {
        return $this->response->redirect($_SERVER['HTTP_REFERER']);
    }
}