<?php
/**
 * Created by PhpStorm.
 * User: Nizhn
 * Date: 12.01.2018
 * Time: 15:02
 */

//FRONT CONTROLLER
//1.Общие настройки
ini_set('display_errors',1);
error_reporting(E_ALL);

session_start();

//2.Подключение файлов системы
define('ROOT',dirname(__FILE__));
require_once (ROOT.'/components/Autoload.php');

///3. Вызов Router
$router=new Router();
$router->run();




