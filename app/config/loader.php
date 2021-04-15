<?php

$loader = new \Phalcon\Loader();

$loader->registerDirs(
    [
        APP_PATH . '/controllers/',
        APP_PATH . '/models/',
        APP_PATH . '/config/route-group/',
        APP_PATH . '/migrations/',
    ]
);

$loader->registerClasses(
    [
        'PHPMailer'         => '/library/PHPMailer/PHPMailer.php',
    ]
);

$loader->registerNamespaces(
	[
        'App\Validation' => APP_PATH . '/validation/',
		'App\Events' => APP_PATH . '/events/',
        'PHPMailer\PHPMailer' => APP_PATH . '/library/PHPMailer/'
	]
);

$loader->register();