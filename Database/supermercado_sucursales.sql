-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 20, 2023 at 05:49 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mercapp`
--

--
-- Dumping data for table `supermercado_sucursales`
--

INSERT INTO `supermercado_sucursales` (`id`, `idSupMer`, `codSupMerSuc`, `nomSupMerSuc`, `desSupMerSuc`, `estReg`) VALUES
(1, 1, '011', 'Emmel', 'Emmel', 'A'),
(2, 1, '012', 'Lambrani', 'Lambrani', 'A'),
(3, 1, '013', 'Kosto Tritan', 'Kosto Tritan', 'A'),
(4, 1, '014', 'Kosto Mayorista', 'Kosto Mayorista', 'A'),
(5, 2, '021', 'Plaza Vea - Ejército', 'Plaza Vea - Ejército', 'A'),
(6, 2, '022', 'Plaza Vea - La Marina', 'Plaza Vea - La Marina', 'A'),
(7, 3, '031', 'Tottus - Ejército', 'Tottus - Ejército', 'A'),
(8, 3, '032', 'Tottus - Porongoche', 'Tottus - Porongoche', 'A'),
(9, 3, '033', 'Tottus - Parra', 'Tottus - Parra', 'A'),
(10, 4, '041', 'Metro - Aviación', 'Metro - Aviación', 'A'),
(11, 4, '042', 'Metro - Ejército', 'Metro - Ejército', 'A'),
(12, 4, '043', 'Metro - Lambrani', 'Metro - Lambrani', 'A'),
(13, 4, '044', 'Metro - Hunter', 'Metro - Hunter', 'A'),
(14, 5, '051', 'Super - Pierola', 'Super - Pierola', 'A'),
(15, 5, '052', 'Super - Portal', 'Super - Portal', 'A');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
