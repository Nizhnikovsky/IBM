-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Апр 15 2018 г., 10:49
-- Версия сервера: 10.1.29-MariaDB
-- Версия PHP: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `pricelist`
--

-- --------------------------------------------------------

--
-- Структура таблицы `docprice`
--

CREATE TABLE `docprice` (
  `id` int(20) UNSIGNED NOT NULL,
  `date_time` date NOT NULL,
  `status` int(2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `docprice`
--

INSERT INTO `docprice` (`id`, `date_time`, `status`) VALUES
(1, '2018-04-12', 1),
(2, '2018-04-04', 0),
(3, '2018-04-22', 1),
(4, '2018-03-05', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `doc_price_body`
--

CREATE TABLE `doc_price_body` (
  `id` int(20) UNSIGNED NOT NULL,
  `doc_id` int(20) UNSIGNED NOT NULL,
  `product_id` int(20) UNSIGNED NOT NULL,
  `price` decimal(10,2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `doc_price_body`
--

INSERT INTO `doc_price_body` (`id`, `doc_id`, `product_id`, `price`) VALUES
(1, 1, 1, '12.00'),
(2, 2, 3, '2558.00');

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `id` int(20) UNSIGNED NOT NULL,
  `title` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `status` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id`, `title`, `description`, `status`) VALUES
(1, 'Носки', 'Теплые носки', 1),
(2, 'Шарф', 'Зимний шарф', 0),
(3, 'Штаны', 'Спортивные штаны', 1),
(4, 'Свитер', 'Теплый вязаный свитер', 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `docprice`
--
ALTER TABLE `docprice`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `doc_price_body`
--
ALTER TABLE `doc_price_body`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_id` (`product_id`),
  ADD KEY `doc_id_in_doc_price` (`doc_id`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `docprice`
--
ALTER TABLE `docprice`
  MODIFY `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `doc_price_body`
--
ALTER TABLE `doc_price_body`
  MODIFY `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `doc_price_body`
--
ALTER TABLE `doc_price_body`
  ADD CONSTRAINT `doc_id_in_doc_price` FOREIGN KEY (`doc_id`) REFERENCES `docprice` (`id`),
  ADD CONSTRAINT `product_id_in_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
