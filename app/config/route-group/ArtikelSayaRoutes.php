<?php

use Phalcon\Mvc\Router\Group as RouterGroup;

class ArtikelSayaRoutes extends RouterGroup
{
    public function initialize()
    {
        $this->setPaths([
            'controller' => 'artikelSaya',
        ]);

        $this->setPrefix('/artikelsaya');

        $this->addGet(
            '/',
            [
                'action' => 'artikelsaya',
            ]
        );

        $this->addGet(
            '/detail/{id}',
            [
                'action' => 'detail',
            ]
        );  

        $this->addGet(
            '/konfirmasi/{id}',
            [
                'action' => 'konfirmasi',
            ]
        );        

        $this->addPost(
            '/catatan_penulis',
            [
                'action' => 'catatanpenulis',
            ]
        );          

        $this->addGet(
            '/buat',
            [
                'action' => 'buat',
            ]
        );

        $this->addPost(
            '/buat',
            [
                'action' => 'postbuat',
            ]
        );

        
    }
}