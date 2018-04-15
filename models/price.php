<?php
/**
 * Created by PhpStorm.
 * User: Nizhn
 * Date: 12.04.2018
 * Time: 20:54
 */
class Price
{
    public static function getProductsList()
    {
        $db = Db::getConnection();
        // Получение и возврат результатов
        $sql = "SELECT product.id, product.title, product.description, doc_price_body.price, docprice.date_time
FROM product LEFT JOIN doc_price_body ON doc_price_body.product_id=product.id
LEFT JOIN docprice ON doc_price_body.doc_id=docprice.id";
        $result = $db->query($sql);
        $productsList = array();
        $i = 0;
        while ($row = $result->fetch()) {
            $productsList[$i]['id'] = $row['id'];
            $productsList[$i]['title'] = $row['title'];
            $productsList[$i]['description'] = $row['description'];
            $productsList[$i]['price'] = $row['price'];
            $productsList[$i]['date_time'] = $row['date_time'];
            $i++;
        }
        return $productsList;
    }
    
   public static function getProductsByDate($date)
    {
        $db = Db::getConnection();
        // Получение и возврат результатов
        $sql = "SELECT product.id, product.title, product.description, doc_price_body.price, docprice.date_time
FROM product LEFT JOIN doc_price_body ON doc_price_body.product_id=product.id
LEFT JOIN docprice ON doc_price_body.doc_id=docprice.id WHERE DATE(docprice.date_time)>='{$date}'";
        $result = $db->query($sql);
        $productsList = array();
        $i = 0;
        while ($row = $result->fetch()) {
            $productsList[$i]['id'] = $row['id'];
            $productsList[$i]['title'] = $row['title'];
            $productsList[$i]['description'] = $row['description'];
            $productsList[$i]['price'] = $row['price'];
            $productsList[$i]['date_time'] = $row['date_time'];
            $i++;
        }
        return $productsList;
    }
}