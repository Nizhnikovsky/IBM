<?php
/**
 * Created by PhpStorm.
 * User: Nizhn
 * Date: 12.04.2018
 * Time: 20:47
 */

class MainController
{
    public static function actionView()
    {
        $products = array();
        $products = Price::getProductsList();
        if(isset($_POST['date']))
        {
            $date = (string)$_POST['date'];
            $products = Price::getProductsByDate($date);
        }
        require_once(ROOT . '/views/view.php');
        return true;
    }
}