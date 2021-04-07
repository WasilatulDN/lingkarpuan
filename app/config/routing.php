<?php

$di->set(
    'router',
    function () {
        $router = new \Phalcon\Mvc\Router(false);

        $router->mount(
            new UserRoutes()
        );

        $router->mount(
            new ArtikelRoutes()
        );

        $router->mount(
            new ProfilRoutes()
        );

        $router->mount(
            new ArtikelSayaRoutes()
        );

        $router->mount(
            new VerifikasiRoutes()
        );

        $router->mount(
            new KonsultasiRoutes()
        );

        $router->mount(
            new JadwalRoutes()
        );

        // $router->mount(
        //     new PengajuanRoutes()
        // );

        // $router->mount(
        //     new RuangKonsultasiRoutes()
        // );

        $router->addGet(
            '/',
            [
                'controller' => 'index',
                'action' => 'index'
            ]
        );

        $router->notFound([
            'controller' => 'index',
            'action' => 'show404'
        ]);

        return $router;
    }
);