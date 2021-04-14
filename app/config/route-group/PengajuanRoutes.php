<?php

use Phalcon\Mvc\Router\Group as RouterGroup;

class PengajuanRoutes extends RouterGroup
{
    public function initialize()
    {
        $this->setPaths([
            'controller' => 'pengajuan',
        ]);

        $this->setPrefix('/pengajuan');

        $this->addGet(
            '/daftar',
            [
                'action' => 'daftar',
            ]
        );

        $this->addGet(
            '/diterima',
            [
                'action' => 'diterima',
            ]
        );

        $this->addGet(
            '/terima/{id}',
            [
                'action' => 'terima',
            ]
        );

        $this->addGet(
            '/tolak/{id}',
            [
                'action' => 'tolak',
            ]
        );
        
    }
}