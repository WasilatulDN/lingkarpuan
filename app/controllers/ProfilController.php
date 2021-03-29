<?php

use Phalcon\Mvc\Controller;
use Phalcon\Http\Response;
use App\Events\UserProtectController;
use Phalcon\Security\Random;

class ProfilController extends Controller
{
	public function profilAction($id)
	{
		$artikel = artikel::find("id_user='$id'");
		$user = user::findFirst("id_user='$id'");
		$this->view->artikels = $artikel;
    	$this->view->user = $user;
	}

}