<?php

use Phalcon\Mvc\Controller;
use Phalcon\Http\Response;
use Phalcon\Mvc\Dispatcher;
use App\Validation\UserValidation;
use App\Events\UserProtectController;

class UserController extends UserProtectController
{
    
    public function createAction()
    {
		$this->view->messages = $this->messages;
    }


    public function storeAction()
    {

        if($this->request->getPost('tipe') == "dokter")
        {
            $dokter = new Dokter();
            $dokter->username = $this->request->getPost('username');
            $dokter->email = $this->request->getPost('email');
            $dokter->nama = $this->request->getPost('nama');
            $dokter->str = $this->request->getPost('str');
            $password = $this->request->getPost('password');
            $dokter->password = $this->security->hash($password);

            $val = new UserValidation();
            $messages = $val->validate($_POST);

            if (count($messages)) {
                foreach ($messages as $m) {
                    $this->messages[$m->getField()] = $m;
                }
                $this->dispatcher->forward(['action'=>'create']);
            }
            else{
                $dokter->save();
                $this->response->redirect('user/login');
            }
        }
        elseif($this->request->getPost('tipe') == "apoteker")
        {
            $apoteker = new Apoteker();
            $apoteker->username = $this->request->getPost('username');
            $apoteker->email = $this->request->getPost('email');
            $apoteker->nama = $this->request->getPost('nama');
            $apoteker->str = $this->request->getPost('str');
            $password = $this->request->getPost('password');
            $apoteker->password = $this->security->hash($password);

            $val = new UserValidation();
            $msg = $val->validate($_POST);

            if(count($msg)){
                foreach ($msg as $m){
                    $this->messages[$m->getField()] = $m;
                }
                $this->dispatcher->forward(['action'=>'create']);
            }
            else{
                $apoteker->save();
                $this->response->redirect('user/login');
            }
        }
        elseif($this->request->getPost('tipe') == "admin")
        {
            $admin = new Admin();
            $admin->username = $this->request->getPost('username');
            $admin->email = $this->request->getPost('email');
            $admin->nama = $this->request->getPost('nama');
            $password = $this->request->getPost('password');
            $admin->password = $this->security->hash($password);

            $val = new UserValidation();
            $msg = $val->validate($_POST);

            if(count($msg)){
                foreach ($msg as $m){
                    $this->messages[$m->getField()] = $m;
                }
                $this->dispatcher->forward(['action'=>'create']);
            }
            else{
                $admin->save();
                $this->response->redirect('user/login');
            }
        }
        
    }

    public function loginAction()
    {

    }

    public function storeloginAction()
    {
        $username = $this->request->getPost('username');
        $password = $this->request->getPost('password');

        if($this->request->getPost('tipe') == "dokter")
        {
            $user = Dokter::findFirst("username='$username'");

            if ($user) {
                if ($this->security->checkHash($password, $user->password)) {
                    $this->session->set(
                        'dokter',
                        [
                            'id' => $user->idDokter,
                            'username' => $user->username,
                            'tipe' => '1',
                        ]
                    );
                    (new Response())->redirect('dokter/home')->send();
                }
                else{
                    $this->response->redirect('user/login');
                }
            }
            else{
                $this->response->redirect('user/login');
            }

        }
        elseif($this->request->getPost('tipe') == "apoteker")
        {
            $user = Apoteker::findFirst("username='$username'");

            if ($user) {
                if ($this->security->checkHash($password, $user->password)) {
                    $this->session->set(
                        'apoteker',
                        [
                            'id' => $user->idApoteker,
                            'username' => $user->username,
                            'tipe' => '2',
                        ]
                    );
                    (new Response())->redirect('apoteker/home')->send();
                }
                else{
                    $this->response->redirect('user/login');
                }
            }
            else{
                $this->response->redirect('user/login');
            }

        }
        elseif($this->request->getPost('tipe') == "admin")
        {
            $user = Admin::findFirst("username='$username'");

            if ($user) {
                if ($this->security->checkHash($password, $user->password)) {
                    $this->session->set(
                        'admin',
                        [
                            'id' => $user->idAdmin,
                            'username' => $user->username,
                            'tipe' => '3',
                        ]
                    );
                    (new Response())->redirect('admin/home')->send();
                }
                else{
                    $this->response->redirect('user/login');
                }
            }
            else{
                $this->response->redirect('user/login');
            }

        }

    }

    public function logoutAction()
    {
        $this->session->destroy();
        $this->response->redirect();
    }

}