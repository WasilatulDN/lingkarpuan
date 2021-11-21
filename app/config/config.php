<?php

use Phalcon\Config;

$url = parse_url(getenv("CLEARDB_DATABASE_URL"));

return new Config([    

    'database' => [
        'adapter' => 'Mysql',
        'host' => $url["host"],
        'username' => $url["user"],
        'password' => $url["pass"],
        'dbname' => substr($url["path"], 1)
    ],
    'url' => [
        'baseUrl' => 'http://localhost/lingkarpuan/'
    ]
]);