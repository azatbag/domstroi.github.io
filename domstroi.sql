-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 09 2022 г., 13:53
-- Версия сервера: 8.0.24
-- Версия PHP: 8.0.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `domstroi`
--

-- --------------------------------------------------------

--
-- Структура таблицы `adverts`
--

CREATE TABLE `adverts` (
  `id` int NOT NULL,
  `name` varchar(32) NOT NULL,
  `address` varchar(64) NOT NULL,
  `price` int NOT NULL,
  `type` varchar(6) NOT NULL,
  `capacity` int NOT NULL DEFAULT '1',
  `description` varchar(512) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `adverts`
--

INSERT INTO `adverts` (`id`, `name`, `address`, `price`, `type`, `capacity`, `description`) VALUES
(19, 'Экспресс Офис', 'Ул. Офисная Дом 19', 520000, 'office', 0, 'Продается ПСН,помещение под Офис в новом современном доме уровня Комфорт.\r\n— 1 этаж\r\n— 86,9 кв м\r\n'),
(23, '3-к. квартира, 67,5 м², 7/9 эт.', ' ул. 40 лет Победы, 49', 4700000, 'second', 3, 'Республика Татарстан, Набережные Челны, ул. 40 лет Победы, 49\r\nр-н Автозаводский\r\n+79692822832\r\nАида'),
(24, 'ЖК Дом по проспекту Московский', 'Московский проспект, 59', 2300000, 'new', 3, 'Россия, Республика Татарстан, Набережные Челны, Московский проспект, 59     \r\nГК Евростиль     \r\nТелефон +7 843 567-34-14'),
(25, 'Жилой комплекс НОВЫЙ', 'Проспект Мира, 1', 3500000, 'new', 4, 'Россия, Республика Татарстан, Набережные Челны, проспект Мира, 17А     \r\nТелефон:+78435673516 ПРОФИТ     '),
(26, 'ЖК 64 комплекс', 'улица Виктора Полякова', 2000000, 'new', 1, 'Россия, Республика Татарстан, Набережные Челны, улица Виктора Полякова\r\nТелефон:+7 843 567-34-14\r\nПРОФИТ'),
(27, 'ЖК Мкрн. \"Дружный\"', 'Авангардная улица, 53А', 2500000, 'new', 1, 'Россия, Республика Татарстан, Набережные Челны, Авангардная улица, 53А\r\nТелефон:+78432080476 ДОМКОР'),
(28, 'Дом 122 м² на участке 8 сот.', 'д. Азьмушкино, Мирная ул., 69', 6200000, 'second', 4, 'Республика Татарстан, Тукаевский р-н, д. Азьмушкино, Мирная ул., 69\r\nТелефон +79054514186 КП Зелёный Парк'),
(29, 'ЖК Горизонт', ' улица Назыма Якупова, 14', 4900000, 'new', 4, 'Россия, Республика Татарстан, Набережные Челны, улица Назыма Якупова, 14\r\nТелефон:+78435673508 СТРОИТЕЛЬНОЕ АГЕНТСТВО ВОЛГА'),
(30, '1-к. квартира, 29,7 м², 2/2 эт.', 'посёлок Элеваторная Гора, Трактовая ул., 5', 1450000, 'second', 1, 'Республика Татарстан, Набережные Челны, посёлок Элеваторная Гора, Трактовая ул., 5\r\nТелефон +79047895657\r\nАнастасия Маркова');

-- --------------------------------------------------------

--
-- Структура таблицы `pictures`
--

CREATE TABLE `pictures` (
  `id` int NOT NULL,
  `idAdvert` int NOT NULL,
  `url` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `pictures`
--

INSERT INTO `pictures` (`id`, `idAdvert`, `url`) VALUES
(12, 14, '140'),
(13, 14, '141'),
(14, 15, '150'),
(15, 15, '151'),
(16, 15, '152'),
(17, 15, '150'),
(18, 15, '150'),
(19, 15, '150'),
(22, 19, '192'),
(24, 20, '200'),
(25, 20, '201'),
(26, 20, '202'),
(27, 21, '210'),
(28, 21, '211'),
(29, 21, '212'),
(30, 22, '220'),
(31, 22, '221'),
(32, 22, '222'),
(37, 24, '240'),
(38, 25, '250'),
(39, 26, '260'),
(40, 27, '270'),
(41, 28, '280'),
(42, 29, '290'),
(43, 30, '300'),
(44, 31, '310'),
(46, 23, '230');

-- --------------------------------------------------------

--
-- Структура таблицы `requests`
--

CREATE TABLE `requests` (
  `id` int NOT NULL,
  `name` varchar(20) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `idAdvert` int NOT NULL,
  `status` varchar(7) NOT NULL DEFAULT 'work'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `requests`
--

INSERT INTO `requests` (`id`, `name`, `phone`, `idAdvert`, `status`) VALUES
(1, 'Иван', '1919191135', 14, 'decided'),
(2, 'admin', '8005553535', 14, 'decided'),
(3, 'admin', '8005553535', 19, 'decided'),
(4, 'admin', '8005553535', 14, 'decided'),
(5, 'admin', '8005553535', 19, 'decided'),
(6, 'admin', '8005553535', 14, 'decided'),
(8, 'downeeto', '7960067449', 19, 'decided'),
(9, 'Иван', '1919191135', 19, 'work');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `login` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `phone` varchar(10) NOT NULL,
  `email` varchar(40) NOT NULL,
  `role` varchar(6) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `password`, `name`, `phone`, `email`, `role`) VALUES
(1, 'admin', '123', 'admin', '8005553535', 'admin@gmail.com', 'admin'),
(2, 'ivan123', '123', 'Иван', '1919191135', 'ivan@dad', 'user'),
(4, 'azatbag@mail.ru', '123', '21321', '1232131231', 'azatbag@mail.ru', 'user');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `adverts`
--
ALTER TABLE `adverts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `pictures`
--
ALTER TABLE `pictures`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `adverts`
--
ALTER TABLE `adverts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT для таблицы `pictures`
--
ALTER TABLE `pictures`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT для таблицы `requests`
--
ALTER TABLE `requests`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
