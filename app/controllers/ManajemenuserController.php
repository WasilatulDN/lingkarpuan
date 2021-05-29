<?php

use App\Events\ManajemenUserProtectController;
use App\Validation\ManajemenUserValidation;
use App\Validation\UserValidation;
use Phalcon\Security\Random;

class ManajemenuserController extends ManajemenUserProtectController
{
    public function indexAction()
    {
        $users = User::find("id_role != 1");
        $data_user = array();
        foreach ($users as $user) {
            $role = Role::findFirst("id_role='$user->id_role'");
            $data_user[] = array (
                "email" => $user->email,
                "nama" => $user->nama,
                "role" => $role->nama_role,
            );
        }
        $this->view->data_user = $data_user;
    }

    public function buatAction()
    {
        $roles = Role::find("id_role != 1");
        $this->view->roles = $roles;

        $this->view->messages = $this->messages;
    }

    public function postbuatAction()
    {
        $val = new UserValidation();
        $messages = $val->validate($_POST);

        if (count($messages)) {
            $this->messages = array();
            foreach ($messages as $m) {
                $this->messages[$m->getField()] = $m;
            }
            $this->dispatcher->forward(['action' => 'buat']);
            return;
        }

        $random = new Random();
        $user = new User();

        $email = $this->request->getPost('email');
        $nama = $this->request->getPost('nama');
        $password = $this->request->getPost('password');
        $role = $this->request->getPost('role');
        $kode_verifikasi = $random->uuid();
        
        $user->id_user = $random->uuid();
        $user->id_role = $role;
        $user->email = $email;
        $user->nama = $nama;
        $user->password = $this->security->hash($password);
        $user->status_verifikasi = 1;
        $user->kode_verifikasi = $kode_verifikasi;
        
        $user->save();
        $this->flashSession->success("Akun berhasil dibuat");
        return $this->response->redirect('manajemenuser/');
    }
    
}
