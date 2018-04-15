<?php
/**
 * Created by PhpStorm.
 * User: Nizhn
 * Date: 12.01.2018
 * Time: 15:30
 */

class Router
{
    private $routes;
    
    public function __construct()
    {
        $routesPath = ROOT . '/config/routes.php';
        $this->routes = include($routesPath);
        
    }
    
    /**
     * Return request string
     * @return string
     */
    private function getURI()
    {
        if (!empty($_SERVER['REQUEST_URI'])) {
            return trim($_SERVER['REQUEST_URI'], '/');
        }
    }
    
    public function run()
    {
        //получить строку запроса
        
        $uri = $this->getURI();
        
        // проверить наличие такого запроса в routes.php
        foreach ($this->routes as $uriPattern => $path)
        {
           
            //Сравниваем $uriPattern и $uri
            if (preg_match("~$uriPattern~", $uri))
            {
                /*echo $uri."-URI";
                echo '<br>';
                echo $uriPattern."-PATTERN";
                echo '<br>';*/
                //получаем внутренний путь из внешнего согласно правилу
                $internalRoute=preg_replace("~$uriPattern~",$path,$uri);
                //echo $internalRoute;
                //если есть совпадение, определить какой контроллер
                //и action обрабатывают запрос
                $segments = explode('/', $internalRoute);
                /*echo '<pre>';
                print_r($segments);
                echo '<br>';*/
                $controllerName = ucfirst(array_shift($segments) . 'Controller');
                $actionName = 'action' . ucfirst(array_shift($segments));
                $parameters=$segments;
                //Подключить файл класса контроллера
                $controllerFile = ROOT.'/controllers/'.
                    $controllerName.'.php';
                /*echo $controllerName;
                echo '<br>';
                echo $actionName;*/
                
                if (file_exists($controllerFile))
                {
                    include_once($controllerFile);
        
                }
    
                //Создать объект, вызвать метод (т.е action)
    
                $controllerObject = new $controllerName;
                $result = call_user_func_array(array($controllerObject,$actionName),$parameters);
                if ($result != null)
                {
                    break;
                }
            }
        }
    }
}
  
