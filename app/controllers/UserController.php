<?php

use Phalcon\Mvc\Controller;
use Phalcon\Http\Response;
use Phalcon\Mvc\Dispatcher;
use App\Validation\UserValidation;
use App\Events\UserProtectController;

class UserController extends Controller
{
    
    public function registerAction()
    {
		
    }


    public function postregisterAction()
    {
        $random = new \Phalcon\Security\Random();
        $user = new User();
        $user->id_user = $random->uuid();
        $user->id_role = 1;
        $user->email = $this->request->getPost('email');        
        $user->nama = $this->request->getPost('nama');
        $password = $this->request->getPost('password');
        $user->password = $this->security->hash($password);
        // var_dump($user);
        $user->save();
    }

    public function loginAction()
    {

    }

    public function storeloginAction()
    {
        $email = $this->request->getPost('email');
        $password = $this->request->getPost('password');

        $user = User::findFirst("email='$email'");

        if ($user) {
            if ($this->security->checkHash($password, $user->password)) {
                $this->session->set(
                    'user',
                    [
                        'id' => $user->id_user,
                        'nama' => $user->nama,
                        'role' => $user->id_role,
                    ]
                );
                (new Response())->redirect()->send();
            }
            else{
                $this->response->redirect('user/login');
            }
        }
        else{
            $this->response->redirect('user/login');
        }

    }

    public function logoutAction()
    {
        $this->session->destroy();
        $this->response->redirect();
    }

}