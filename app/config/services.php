<?php

use Phalcon\Security as Security;
use Phalcon\Session\Adapter\Files as AdapterFiles;
use Phalcon\Mvc\Dispatcher as MvcDispatcher;
use Phalcon\Mvc\View as MvcView;
use Phalcon\Mvc\Url as MvcUrl;
use Phalcon\Mvc\View\Engine\Volt as EngineVolt;
use Phalcon\Events\Event as Event;
use Phalcon\Events\Manager as EventsManager;
use Phalcon\Flash\Session as FlashSession;
/*
 * Fungsi pemanggilan Volt service
 */
$di->set(
    'voltService',
    function ($view, $di) {
        $volt = new EngineVolt($view, $di);

        $volt->setOptions([
            "compiledPath" => APP_PATH . "/cache/",
            "compiledExtension" => ".compiled",
            "compileAlways" => true,
        ]);

        return $volt;
    }
);

/*
 * Fungsi pemanggilan view
 */
$di->set(
    'view',
    function () {
        $view = new MvcView();
        $view->setViewsDir(APP_PATH . "/views");
        // echo APP_PATH."\\views";

        $view->registerEngines([
            ".volt" => "voltService",
        ]);

        return $view;

    }
);

/*
 * Fungsi koneksi database
 */
$di->set(
    'db',
    function () use ($config) {
        $dbAdapter = 'Phalcon\Db\Adapter\Pdo\\' . $config->database->adapter;
        return new $dbAdapter([
            "host" => $config->database->host,
            "username" => $config->database->username,
            "password" => $config->database->password,
            "dbname" => $config->database->dbname
        ]);
    }
);

/*
 * Fungsi URL service
 */
$di->set(
    'url',
    function () use ($config, $di) {
        $url = new MvcUrl();
        $url->setBaseUri($config->path('url.baseUrl'));

        return $url;
    }
);

/*
 * Fungsi session service
 */
$di->set(
    'session',
    function () {
        $session = new AdapterFiles();

        $session->start();

        return $session;
    }
);

/*
 * Fungsi security service
 */
$di->set(
    'security',
    function () {
        $security = new Security();

        $security->setWorkFactor(12);

        return $security;
    },
    true
);

/*
 * Fungsi flash messages service
 */
$di->set(
    'flashSession',
    function () {
        $flashSession = new FlashSession(
            [
                'error'   => 'alert alert-danger',
                'success' => 'alert alert-success',
                'notice'  => 'alert alert-info',
                'warning' => 'alert alert-warning',
            ]
        );

        return $flashSession;
    }
);

/*
 * Fungsi dispatcher service
 */
$di->set(
    'dispatcher',
    function () {
        // Create an event manager
        $eventsManager = new EventsManager();
        // Attach a listener for type 'dispatch'
        $eventsManager->attach(
            'dispatch',
            function (Event $event, $dispatcher) {
            }
        );
        $dispatcher = new MvcDispatcher();
        // Bind the eventsManager to the view component
        $dispatcher->setEventsManager($eventsManager);
        return $dispatcher;
    },
    true
);