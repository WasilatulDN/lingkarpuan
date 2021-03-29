<?php

use Phalcon\Mvc\Controller;
use Phalcon\Http\Response;
use App\Events\UserProtectController;
use Phalcon\Security\Random;

class VerifikasiController extends Controller
{
	public function hapusAction($id)
	{
		$artikel = artikel::findFirst("id_artikel='$id'");
		$artikel->delete();
		$this->response->redirect('artikel/');
	}

}