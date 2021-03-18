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

        
    }
}