<?php

$loader = new \Phalcon\Loader();

$loader->registerDirs(
    [
        APP_PATH . '/controllers/',
        APP_PATH . '/models/',
        APP_PATH . '/config/route-group/',
        APP_PATH . '/validations/',
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
        'App\Validation' => APP_PATH . '/Validation/',
		'App\Events' => APP_PATH . '/Events/',
        'PHPMailer\PHPMailer' => APP_PATH . '/library/PHPMailer/'
	]
);

$loader->register();