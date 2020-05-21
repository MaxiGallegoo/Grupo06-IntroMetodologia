<?php
    require_once("php/controller.php");
    require_once("php/router.php");
    
    define("BASE_URL", 'http://'.$_SERVER["SERVER_NAME"].':'.$_SERVER["SERVER_PORT"].dirname($_SERVER["PHP_SELF"]));
	
    $router = new Router();

    $router->setDefaultRoute("controller","index");
	
    $router->route($_GET["action"], $_SERVER['REQUEST_METHOD']);
