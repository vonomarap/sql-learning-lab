-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 11, 2022 at 10:27 PM
-- Server version: 10.3.13-MariaDB-log
-- PHP Version: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `department_programmers`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `7_1`
-- (See below for the actual view)
--
CREATE TABLE `7_1` (
`specialization` varchar(30)
,`Количество работников` bigint(22)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `7_2`
-- (See below for the actual view)
--
CREATE TABLE `7_2` (
`customer_id` int(8)
,`fio_contact_person` varchar(50)
,`employee_id` int(8)
,`first_name` varchar(45)
,`last_name` varchar(45)
,`surname` varchar(45)
,`order_id` int(8)
,`order_name` varchar(45)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `7_3`
-- (See below for the actual view)
--
CREATE TABLE `7_3` (
`category` varchar(45)
,`Количество заказов` bigint(21)
,`start_date` date
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `7_4`
-- (See below for the actual view)
--
CREATE TABLE `7_4` (
`employee_id` int(8)
,`first_name` varchar(45)
,`last_name` varchar(45)
,`surname` varchar(45)
,`order_id` int(8)
,`order_name` varchar(45)
,`max_work_time` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `7_5`
-- (See below for the actual view)
--
CREATE TABLE `7_5` (
`specialization` varchar(30)
,`num_order` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Категория заказа';

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category`) VALUES
('бизнес-калькулятор'),
('Мобильное приложение'),
('Сайт');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(8) NOT NULL COMMENT 'Уникальный идентификатор заказчика',
  `customer_name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Название заказчика',
  `fio_contact_person` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT ' ФИО контактного лица заказчика',
  `phone_contact_person` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Телефон контактного лица заказчика'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_name`, `fio_contact_person`, `phone_contact_person`) VALUES
(30202, 'Allianz', 'Winterhalter Mick ', '+3892983'),
(30615, 'Michelin', 'Corinne Maël', '+33582987'),
(30893, 'DHL', 'Harkleroad Alvin', '+45928310'),
(31921, 'Oracle', 'Courtland Allston', '+44298319'),
(31935, 'Porshe', 'Winterhalter Benjamen Bertolts', '+4958298');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `employee_id` int(8) NOT NULL COMMENT 'Уникальный идентификатор сотрудника',
  `first_name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Имя сотрудника',
  `last_name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Фамилия сотрудника',
  `surname` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Отчество сотрудника',
  `specialization` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Специализация сотрудника',
  `rank` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Категория сотрудника',
  `supplement_specialization` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Дополнительная специализация сотрудника'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `surname`, `specialization`, `rank`, `supplement_specialization`) VALUES
(10102, 'Alexander', 'Hoffman', NULL, 'Developer C/C++', 'B', NULL),
(10239, 'Charles', 'Lecler', 'Jules', 'Mobile Developer', 'B', NULL),
(10290, 'Torger', 'Wolf', 'Christian', 'Mobile Developer', 'B', 'Web Developer'),
(10421, 'Bertolt', 'Winterhalter', NULL, 'Developer C/C++', '1', 'Mobile Developer'),
(10789, 'Maria', 'Weber', 'Kleins', 'Web Developer', '1', NULL),
(11002, 'Rihanna', 'Schwarz', 'Köhler', 'Developer C/C++', '1', NULL),
(11093, 'Isabelle', 'Moreua', 'Gabriels', 'Developer C/C++', 'B', 'Web Developer');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(8) NOT NULL COMMENT 'Уникальный идентификатор заказа',
  `order_name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Название заказа',
  `customer_id` int(8) NOT NULL COMMENT 'Уникальный идентификатор заказчика',
  `start_date` date NOT NULL COMMENT 'Дата поступления заказа',
  `end_date` date NOT NULL COMMENT 'Контрольная дата выполнения заказа',
  `work_time` int(11) NOT NULL COMMENT 'Длительность выполнения заказа в часах',
  `category` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Категория заказа'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Заказы';

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `order_name`, `customer_id`, `start_date`, `end_date`, `work_time`, `category`) VALUES
(20102, 'Backend для сайта', 30202, '2020-12-19', '2021-11-16', 500, 'Сайт'),
(20182, 'Устранение ошибок', 31935, '2020-11-26', '2021-02-18', 142, 'Сайт'),
(20489, 'Автоматизация учёта товара', 30893, '2022-04-12', '2022-12-17', 470, 'бизнес-калькулятор'),
(20789, 'Добавление новых функциональных возможностей', 31935, '2018-01-18', '2019-06-13', 189, 'Мобильное приложение'),
(20920, 'Исправление недостатков', 31921, '2017-08-18', '2018-01-20', 137, 'бизнес-калькулятор'),
(21226, 'Frontend для сайта', 30893, '2020-09-17', '2020-12-20', 107, 'Сайт'),
(21283, 'Исправление недостатков', 30615, '2020-06-18', '2021-02-09', 214, 'Мобильное приложение'),
(21820, 'Исправление графического интерфейса', 30615, '2012-06-18', '2012-12-21', 162, 'Сайт'),
(22901, 'Автоматизация процессов на складе', 30893, '2022-02-17', '2022-09-29', 340, 'Мобильное приложение');

-- --------------------------------------------------------

--
-- Table structure for table `ranks`
--

CREATE TABLE `ranks` (
  `rank` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Категория сотрудника'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ranks`
--

INSERT INTO `ranks` (`rank`) VALUES
('1'),
('B');

-- --------------------------------------------------------

--
-- Table structure for table `specializations`
--

CREATE TABLE `specializations` (
  `specialization` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Список специализаций'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Специализация сотрудника';

--
-- Dumping data for table `specializations`
--

INSERT INTO `specializations` (`specialization`) VALUES
('Developer C/C++'),
('Mobile Developer'),
('Web Developer');

-- --------------------------------------------------------

--
-- Table structure for table `works_on`
--

CREATE TABLE `works_on` (
  `employee_id` int(8) NOT NULL COMMENT 'Сотрудник который работает над заказом',
  `order_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `works_on`
--

INSERT INTO `works_on` (`employee_id`, `order_id`) VALUES
(10290, 20102),
(11002, 20102),
(11093, 21226),
(10789, 21226),
(10290, 22901),
(10102, 22901),
(10239, 20789),
(10421, 20789),
(10789, 20789),
(10290, 20489),
(11002, 20489),
(11093, 21820),
(10789, 21820),
(10239, 20920),
(10102, 21283),
(10421, 21283),
(10789, 20182);

-- --------------------------------------------------------

--
-- Structure for view `7_1`
--
DROP TABLE IF EXISTS `7_1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `7_1`  AS  with count_supplement_specialalization as (select `employees`.`supplement_specialization` AS `supplement_specialization`,count(`employees`.`employee_id`) AS `number_supplement_specialization` from `employees` where `employees`.`supplement_specialization` is not null group by `employees`.`supplement_specialization`), count_specialization as (select `employees`.`specialization` AS `specialization`,count(`employees`.`employee_id`) AS `number_specialization` from `employees` where `employees`.`specialization` is not null group by `employees`.`specialization`), joined_queries as (select distinct `s`.`specialization` AS `specialization`,ifnull(`cp`.`number_specialization`,0) AS `num_specialization`,ifnull(`css`.`number_supplement_specialization`,0) AS `num_supplement_specialization` from ((`specializations` `s` left join `count_supplement_specialalization` `css` on(`css`.`supplement_specialization` = `s`.`specialization`)) left join `count_specialization` `cp` on(`cp`.`specialization` = `s`.`specialization`)))select `joined_queries`.`specialization` AS `specialization`,`joined_queries`.`num_supplement_specialization` + `joined_queries`.`num_specialization` AS `Количество работников` from `joined_queries` group by `joined_queries`.`specialization` ;

-- --------------------------------------------------------

--
-- Structure for view `7_2`
--
DROP TABLE IF EXISTS `7_2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `7_2`  AS  select `c`.`customer_id` AS `customer_id`,`c`.`fio_contact_person` AS `fio_contact_person`,`e`.`employee_id` AS `employee_id`,`e`.`first_name` AS `first_name`,`e`.`last_name` AS `last_name`,`e`.`surname` AS `surname`,`o`.`order_id` AS `order_id`,`o`.`order_name` AS `order_name` from (((`employees` `e` left join `works_on` `w` on(`e`.`employee_id` = `w`.`employee_id`)) left join `orders` `o` on(`o`.`order_id` = `w`.`order_id`)) left join `customers` `c` on(`o`.`customer_id` = `c`.`customer_id`)) order by `o`.`order_id`,`c`.`customer_id`,`e`.`employee_id` ;

-- --------------------------------------------------------

--
-- Structure for view `7_3`
--
DROP TABLE IF EXISTS `7_3`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `7_3`  AS  select `o`.`category` AS `category`,max(`o`.`count_order`) AS `Количество заказов`,`o`.`start_date` AS `start_date` from (select `orders`.`category` AS `category`,count(`orders`.`order_id`) AS `count_order`,`orders`.`start_date` AS `start_date` from `orders` where `orders`.`start_date` like '____-12-__' or `orders`.`start_date` like '____-01-__' or `orders`.`start_date` like '____-02-__' group by `orders`.`category`) `o` ;

-- --------------------------------------------------------

--
-- Structure for view `7_4`
--
DROP TABLE IF EXISTS `7_4`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `7_4`  AS  select `e`.`employee_id` AS `employee_id`,`e`.`first_name` AS `first_name`,`e`.`last_name` AS `last_name`,`e`.`surname` AS `surname`,`o`.`order_id` AS `order_id`,`o`.`order_name` AS `order_name`,`o`.`max_work_time` AS `max_work_time` from ((`employees` `e` left join `works_on` `w` on(`e`.`employee_id` = `w`.`employee_id`)) left join (select `orders`.`order_id` AS `order_id`,`orders`.`order_name` AS `order_name`,max(`orders`.`work_time`) AS `max_work_time` from `orders`) `o` on(`o`.`order_id` = `w`.`order_id`)) where `o`.`max_work_time` is not null ;

-- --------------------------------------------------------

--
-- Structure for view `7_5`
--
DROP TABLE IF EXISTS `7_5`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `7_5`  AS  with mobile_developers as (select `specializations`.`specialization` AS `specialization`,`categories`.`category` AS `category` from (`specializations` join `categories`) where `specializations`.`specialization` = 'Mobile Developer' and `categories`.`category` = 'Мобильная разработка'), web_developers as (select `specializations`.`specialization` AS `specialization`,`categories`.`category` AS `category` from (`specializations` join `categories`) where `specializations`.`specialization` = 'Web Developer' and `categories`.`category` = 'Сайт'), c_cpp_developers as (select `specializations`.`specialization` AS `specialization`,`categories`.`category` AS `category` from (`specializations` join `categories`) where `specializations`.`specialization` = 'Developer C/C++' and `categories`.`category` = 'бизнес-калькулятор'), all_developers as (select `specializations`.`specialization` AS `specialization`,`categories`.`category` AS `category` from (`specializations` join `categories`) where `specializations`.`specialization` = 'Mobile Developer' and `categories`.`category` = 'Мобильное приложение' or `specializations`.`specialization` = 'Web Developer' and `categories`.`category` = 'Сайт' or `specializations`.`specialization` = 'Developer C/C++' and `categories`.`category` = 'бизнес-калькулятор')select `al`.`specialization` AS `specialization`,count(`o`.`order_id`) AS `num_order` from (`all_developers` `al` join `orders` `o`) where `al`.`category` = `o`.`category` group by `al`.`specialization` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `specialization` (`specialization`),
  ADD KEY `rank` (`rank`),
  ADD KEY `supplement_specialization` (`supplement_specialization`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `category_id` (`category`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `ranks`
--
ALTER TABLE `ranks`
  ADD PRIMARY KEY (`rank`);

--
-- Indexes for table `specializations`
--
ALTER TABLE `specializations`
  ADD PRIMARY KEY (`specialization`);

--
-- Indexes for table `works_on`
--
ALTER TABLE `works_on`
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `orders_id` (`order_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(8) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор заказчика', AUTO_INCREMENT=31936;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `employee_id` int(8) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор сотрудника', AUTO_INCREMENT=11094;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(8) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор заказа', AUTO_INCREMENT=22902;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`specialization`) REFERENCES `specializations` (`specialization`),
  ADD CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`supplement_specialization`) REFERENCES `specializations` (`specialization`),
  ADD CONSTRAINT `employees_ibfk_3` FOREIGN KEY (`rank`) REFERENCES `ranks` (`rank`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`category`) REFERENCES `categories` (`category`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

--
-- Constraints for table `works_on`
--
ALTER TABLE `works_on`
  ADD CONSTRAINT `works_on_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`),
  ADD CONSTRAINT `works_on_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
