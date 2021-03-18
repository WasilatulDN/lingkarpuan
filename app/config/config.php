<?php

use Phalcon\Config;

return new Config([

    'database' => [
        'adapter' => 'Mysql',
        'host' => '127.0.0.1',
        'username' => 'root',
        'password' => '',
        'dbname' => 'lingkar_puan'
    ],
    'url' => [
        'baseUrl' => 'http://localhost/lingkarpuan/'
    ]
]);