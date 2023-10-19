-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 19, 2023 at 05:53 AM
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

-- --------------------------------------------------------

--
-- Table structure for table `acompaniamiento_distribuidor`
--

CREATE TABLE `acompaniamiento_distribuidor` (
  `id` int(11) NOT NULL,
  `idCli` int(11) NOT NULL,
  `idDis` int(11) NOT NULL,
  `idEve` int(11) NOT NULL,
  `isExh` tinyint(1) DEFAULT 0,
  `isPop` tinyint(1) DEFAULT 0,
  `totPreVen` decimal(8,2) DEFAULT NULL,
  `fecCreAcomDis` datetime DEFAULT current_timestamp(),
  `fecActAcomDis` datetime DEFAULT current_timestamp(),
  `obsAcomDis` text DEFAULT NULL,
  `estReg` char(1) DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `acompaniamiento_distribuidor_detalle`
--

CREATE TABLE `acompaniamiento_distribuidor_detalle` (
  `id` int(11) NOT NULL,
  `idAcomDis` int(11) NOT NULL,
  `idProd` int(11) NOT NULL,
  `precUniNowProd` decimal(5,2) DEFAULT NULL,
  `preUniProd` decimal(5,2) DEFAULT 0.00,
  `canProd` int(5) DEFAULT 0,
  `totPreProd` decimal(7,2) DEFAULT 0.00,
  `estReg` char(1) DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `acompaniamiento_distribuidor_quiz`
--

CREATE TABLE `acompaniamiento_distribuidor_quiz` (
  `id` int(11) NOT NULL,
  `idRepDis` int(11) NOT NULL,
  `idQuizPreg` int(11) NOT NULL,
  `nomQuizPreg` char(255) DEFAULT NULL,
  `respQuizPreg` char(255) DEFAULT NULL,
  `estReg` char(1) DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `asistencia`
--

CREATE TABLE `asistencia` (
  `id` int(11) NOT NULL,
  `idUsu` int(11) NOT NULL,
  `okIni` tinyint(1) DEFAULT 0,
  `okBrake1` tinyint(1) DEFAULT 0,
  `okBrake2` tinyint(1) DEFAULT 0,
  `okFin` tinyint(1) DEFAULT 0,
  `fecIniAsis` datetime DEFAULT current_timestamp(),
  `fecFinAsis` datetime DEFAULT current_timestamp(),
  `estReg` char(1) DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `asistencia_marcacion`
--

CREATE TABLE `asistencia_marcacion` (
  `id` int(11) NOT NULL,
  `idAsis` int(11) NOT NULL,
  `ubiLonAsisMar` double DEFAULT NULL,
  `ubiLatAsisMar` double DEFAULT NULL,
  `porBatAsisMar` int(3) DEFAULT NULL,
  `ipAsisMar` char(15) DEFAULT NULL,
  `urlImgAsisMar` char(255) DEFAULT NULL,
  `fecAsisMar` datetime DEFAULT current_timestamp(),
  `estReg` char(1) DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `idCliCat` int(11) DEFAULT NULL,
  `codCli` char(20) DEFAULT NULL,
  `nomComCli` char(100) DEFAULT NULL,
  `nomCli` char(100) DEFAULT NULL,
  `apeCli` char(100) DEFAULT NULL,
  `docCli` char(20) DEFAULT NULL,
  `ubiLonCli` double DEFAULT NULL,
  `ubiLatCli` double DEFAULT NULL,
  `direCli` char(255) DEFAULT NULL,
  `fecCreCli` datetime DEFAULT current_timestamp(),
  `fecActCli` datetime DEFAULT current_timestamp(),
  `estReg` char(1) DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cliente_categoria`
--

CREATE TABLE `cliente_categoria` (
  `id` int(11) NOT NULL,
  `nomCliCat` char(100) NOT NULL,
  `estReg` char(1) DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cobranza`
--

CREATE TABLE `cobranza` (
  `id` int(11) NOT NULL,
  `idEve` int(11) NOT NULL,
  `idSupMer` int(11) NOT NULL,
  `canCob` decimal(8,2) DEFAULT NULL,
  `esFin` tinyint(1) DEFAULT 0,
  `fecCreCob` datetime DEFAULT current_timestamp(),
  `fecActActCob` datetime DEFAULT current_timestamp(),
  `estReg` char(1) DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deposito`
--

CREATE TABLE `deposito` (
  `id` int(11) NOT NULL,
  `idEve` int(11) NOT NULL,
  `idCob` int(11) DEFAULT NULL,
  `esFin` tinyint(1) DEFAULT 0,
  `fecCreDep` datetime DEFAULT current_timestamp(),
  `fecActDep` datetime DEFAULT current_timestamp(),
  `estReg` char(1) DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `distribuidor`
--

CREATE TABLE `distribuidor` (
  `id` int(11) NOT NULL,
  `razSocDis` char(255) DEFAULT NULL,
  `docDis` char(20) DEFAULT NULL,
  `fecCreDis` datetime DEFAULT current_timestamp(),
  `fecActDis` datetime DEFAULT current_timestamp(),
  `estReg` char(1) DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `distribuidor_producto_precios`
--

CREATE TABLE `distribuidor_producto_precios` (
  `id` int(11) NOT NULL,
  `idDis` int(11) NOT NULL,
  `idProd` int(11) NOT NULL,
  `preProdDis` decimal(5,2) DEFAULT 0.00,
  `fecCreDisProd` datetime DEFAULT current_timestamp(),
  `fecActDisProd` datetime DEFAULT current_timestamp(),
  `estReg` char(1) DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `distribuidor_producto_precios_historico`
--

CREATE TABLE `distribuidor_producto_precios_historico` (
  `id` int(11) NOT NULL,
  `idDis` int(11) NOT NULL,
  `idProd` int(11) NOT NULL,
  `prePrevProd` decimal(5,2) DEFAULT 0.00,
  `preNowProd` decimal(5,2) DEFAULT 0.00,
  `fecCreDisProdHis` datetime DEFAULT current_timestamp(),
  `estReg` char(1) DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `distribuidor_vendedor`
--

CREATE TABLE `distribuidor_vendedor` (
  `id` int(11) NOT NULL,
  `idDis` int(11) DEFAULT NULL,
  `nomDisVen` char(100) DEFAULT NULL,
  `apeDisVen` char(100) DEFAULT NULL,
  `telDisVen` char(9) DEFAULT NULL,
  `docDisVen` char(20) DEFAULT NULL,
  `fecCreDisVen` datetime DEFAULT current_timestamp(),
  `fecActDisVen` datetime DEFAULT current_timestamp(),
  `estReg` char(1) DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `evento`
--

CREATE TABLE `evento` (
  `id` int(11) NOT NULL,
  `idUsu` int(11) NOT NULL,
  `idEveMot` int(11) NOT NULL,
  `esIniEve` tinyint(1) DEFAULT 0,
  `esFinEve` tinyint(1) DEFAULT 0,
  `timeIniEve` datetime DEFAULT current_timestamp(),
  `lonIniEve` double DEFAULT NULL,
  `latIniEve` double DEFAULT NULL,
  `timeFinEve` datetime DEFAULT current_timestamp(),
  `lonFinEve` double DEFAULT NULL,
  `latFinEve` double DEFAULT NULL,
  `ipEve` char(15) DEFAULT NULL,
  `durEve` int(11) DEFAULT 0,
  `disEve` double DEFAULT NULL,
  `desEve` char(255) DEFAULT NULL,
  `estReg` char(1) DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `evento_motivo`
--

CREATE TABLE `evento_motivo` (
  `id` int(11) NOT NULL,
  `codEveMot` char(2) NOT NULL,
  `nomEveMot` char(100) DEFAULT NULL,
  `estReg` char(1) DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventariado`
--

CREATE TABLE `inventariado` (
  `id` int(11) NOT NULL,
  `idEve` int(11) NOT NULL,
  `idSupMer` int(11) NOT NULL,
  `fecCreInv` datetime DEFAULT current_timestamp(),
  `fecActInv` datetime DEFAULT current_timestamp(),
  `estReg` char(1) DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventariado_detalle`
--

CREATE TABLE `inventariado_detalle` (
  `id` int(11) NOT NULL,
  `idInv` int(11) NOT NULL,
  `idProd` int(11) NOT NULL,
  `canTotProdInvDet` int(6) DEFAULT 0,
  `canStockProdInvDet` int(6) DEFAULT 0,
  `canRotProdInvDet` int(6) DEFAULT 0,
  `estReg` char(1) DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `marca`
--

CREATE TABLE `marca` (
  `id` int(11) NOT NULL,
  `nomMar` char(100) DEFAULT NULL,
  `rucMar` char(13) DEFAULT NULL,
  `razSocMar` char(255) DEFAULT NULL,
  `urlImgMar` char(255) DEFAULT NULL,
  `base64ImgMar` text DEFAULT NULL,
  `obsMar` char(255) DEFAULT NULL,
  `fecCreMar` datetime DEFAULT current_timestamp(),
  `fecActMar` datetime DEFAULT current_timestamp(),
  `estReg` char(1) DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modulo`
--

CREATE TABLE `modulo` (
  `id` int(11) NOT NULL,
  `codMod` char(3) NOT NULL,
  `nomMod` char(100) NOT NULL,
  `desMod` char(255) DEFAULT NULL,
  `urlImgMod` varchar(255) DEFAULT NULL,
  `icoNomMod` char(50) DEFAULT NULL,
  `typIcoMod` varchar(20) DEFAULT NULL,
  `refTabMod` char(50) DEFAULT NULL,
  `estReg` char(1) DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `modulo`
--

INSERT INTO `modulo` (`id`, `codMod`, `nomMod`, `desMod`, `urlImgMod`, `icoNomMod`, `typIcoMod`, `refTabMod`, `estReg`) VALUES
(1, '001', 'Inventariado supermercado', 'Inventariado supermercadado', NULL, 'warehouse', 'FontAwesome6', 'inventariado', 'A'),
(2, '002', 'Pedido supermercado', 'Pedido supermercado', NULL, 'cart-shopping', 'FontAwesome6', 'pedido_supermercado', 'A'),
(3, '003', 'Cobranza', 'Cobranza', NULL, 'cash', 'Ionicons', 'cobranza', 'A'),
(4, '004', 'Asistencia', 'Asistencia', NULL, 'user-check', 'FontAwesome5', 'asistencia', 'A'),
(5, '005', 'Reporte precios', 'Reporte precios', NULL, 'price-change', 'MaterialIcons', 'reporte_precios', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `pedido_estado`
--

CREATE TABLE `pedido_estado` (
  `id` int(11) NOT NULL,
  `nomPedEst` char(20) DEFAULT NULL,
  `estReg` char(1) DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pedido_supermercado`
--

CREATE TABLE `pedido_supermercado` (
  `id` int(11) NOT NULL,
  `idSupMer` int(11) NOT NULL,
  `idPedEst` int(11) NOT NULL,
  `idEve` int(11) NOT NULL,
  `codPedSup` char(100) DEFAULT NULL,
  `urlImgChe` char(255) DEFAULT NULL,
  `invoiceSeriePedSupMer` char(5) DEFAULT NULL,
  `invoiceNumberPedSupMer` char(10) DEFAULT NULL,
  `fecCrePedSupMer` datetime DEFAULT current_timestamp(),
  `fecActPedSupMer` datetime DEFAULT current_timestamp(),
  `estReg` char(1) DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pedido_supermercado_detalle`
--

CREATE TABLE `pedido_supermercado_detalle` (
  `id` int(11) NOT NULL,
  `idPedSupMer` int(11) NOT NULL,
  `idProd` int(11) NOT NULL,
  `canPedProd` int(6) DEFAULT 0,
  `canEntProd` char(20) DEFAULT NULL,
  `esProdProg` tinyint(1) DEFAULT 1,
  `esCheck` tinyint(1) DEFAULT 0,
  `estReg` char(1) DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permisos`
--

CREATE TABLE `permisos` (
  `id` int(11) NOT NULL,
  `idRol` int(11) NOT NULL,
  `idMod` int(11) NOT NULL,
  `canView` tinyint(1) DEFAULT 0,
  `canEdit` tinyint(1) DEFAULT 0,
  `canDel` tinyint(1) DEFAULT 0,
  `canCre` tinyint(1) DEFAULT 0,
  `estReg` char(1) DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `permisos`
--

INSERT INTO `permisos` (`id`, `idRol`, `idMod`, `canView`, `canEdit`, `canDel`, `canCre`, `estReg`) VALUES
(1, 1, 1, 1, 1, 1, 1, 'A'),
(2, 1, 4, 1, 1, 1, 1, 'A'),
(3, 1, 2, 1, 1, 1, 1, 'A'),
(4, 2, 5, 1, 1, 1, 1, 'A'),
(5, 2, 4, 1, 1, 1, 1, 'A');

-- --------------------------------------------------------

--
-- Table structure for table `producto`
--

CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
  `idMar` int(11) NOT NULL,
  `idProdTip` int(11) DEFAULT NULL,
  `idProdCat` int(11) DEFAULT NULL,
  `idProdTipSob` int(11) DEFAULT NULL,
  `idProdTipEn` int(11) DEFAULT NULL,
  `codProd` char(15) DEFAULT NULL,
  `codProd2` char(15) DEFAULT NULL,
  `codProd3` char(15) DEFAULT NULL,
  `codEanProd` char(13) NOT NULL,
  `nomProd` char(255) NOT NULL,
  `desProd` char(255) DEFAULT NULL,
  `onlImngProd` char(255) DEFAULT NULL,
  `urlImgProd` char(255) DEFAULT NULL,
  `fecCreProd` datetime DEFAULT current_timestamp(),
  `fecActProd` datetime DEFAULT current_timestamp(),
  `graProd` decimal(5,2) DEFAULT NULL,
  `precProd` decimal(5,2) DEFAULT NULL,
  `estReg` char(1) DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `producto_clasificacion`
--

CREATE TABLE `producto_clasificacion` (
  `id` int(11) NOT NULL,
  `nomProdCla` char(100) DEFAULT NULL,
  `estReg` char(1) DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `producto_supermercado_sucursal`
--

CREATE TABLE `producto_supermercado_sucursal` (
  `id` int(11) NOT NULL,
  `idProd` int(11) NOT NULL,
  `idSupMerSuc` int(11) NOT NULL,
  `stockProd` int(6) DEFAULT 0,
  `stockMin` int(6) DEFAULT 0,
  `fecCreProdSupMerSuc` datetime DEFAULT current_timestamp(),
  `fecActProdSupMerSuc` datetime DEFAULT current_timestamp(),
  `estReg` char(1) DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `producto_tipo`
--

CREATE TABLE `producto_tipo` (
  `id` int(11) NOT NULL,
  `nomProdTip` char(100) NOT NULL,
  `estReg` char(1) DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `producto_tipo_envase`
--

CREATE TABLE `producto_tipo_envase` (
  `id` int(11) NOT NULL,
  `nomProdTipEnv` char(100) DEFAULT NULL,
  `estReg` char(1) DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `producto_tipo_sobre`
--

CREATE TABLE `producto_tipo_sobre` (
  `id` int(11) NOT NULL,
  `nomProdTipSob` char(100) NOT NULL,
  `estReg` char(1) DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE `quiz` (
  `desPlanQuiz` char(255) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `idMod` int(11) DEFAULT NULL,
  `nomPlanQuiz` char(100) DEFAULT NULL,
  `estReg` char(1) DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quiz_pregunta`
--

CREATE TABLE `quiz_pregunta` (
  `id` int(11) NOT NULL,
  `idQuiz` int(11) NOT NULL,
  `nomQuizPreg` char(255) DEFAULT NULL,
  `esAbi` tinyint(1) DEFAULT 0,
  `esYesNo` tinyint(1) DEFAULT 0,
  `esOpcUni` tinyint(1) DEFAULT 0,
  `esOpcMul` tinyint(1) DEFAULT 0,
  `estReg` char(1) DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quiz_respuesta`
--

CREATE TABLE `quiz_respuesta` (
  `id` int(11) NOT NULL,
  `idQuizPreg` int(11) NOT NULL,
  `nomQuizResp` char(255) DEFAULT NULL,
  `estReg` char(1) DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reporte_precios`
--

CREATE TABLE `reporte_precios` (
  `id` int(11) NOT NULL,
  `idCli` int(11) DEFAULT NULL,
  `idEve` int(11) DEFAULT NULL,
  `obsRepPre` char(255) DEFAULT NULL,
  `fecCreRepPrec` datetime DEFAULT current_timestamp(),
  `fecActRepPrec` char(20) DEFAULT NULL,
  `estReg` char(1) DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reporte_precios_detalle`
--

CREATE TABLE `reporte_precios_detalle` (
  `id` int(11) NOT NULL,
  `idRepPre` int(11) NOT NULL,
  `idProd` int(11) NOT NULL,
  `precRepPrec` decimal(5,2) DEFAULT NULL,
  `estReg` char(1) DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rol`
--

CREATE TABLE `rol` (
  `id` int(11) NOT NULL,
  `codRol` char(2) NOT NULL,
  `nomRol` char(100) NOT NULL,
  `desRol` char(255) DEFAULT NULL,
  `estReg` char(1) DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rol`
--

INSERT INTO `rol` (`id`, `codRol`, `nomRol`, `desRol`, `estReg`) VALUES
(1, '01', 'Mercaderista', 'Mercaderista', 'A'),
(2, '02', 'Promotor', 'Promotor', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `supermercados`
--

CREATE TABLE `supermercados` (
  `id` int(11) NOT NULL,
  `codSupMer` char(2) NOT NULL,
  `nomSupMer` char(100) NOT NULL,
  `desSupMer` char(255) DEFAULT NULL,
  `estReg` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supermercado_sucursales`
--

CREATE TABLE `supermercado_sucursales` (
  `id` int(11) NOT NULL,
  `idSupMer` int(11) NOT NULL,
  `codSupMerSuc` char(3) NOT NULL,
  `nomSupMerSuc` char(100) DEFAULT NULL,
  `desSupMerSuc` char(255) DEFAULT NULL,
  `estReg` char(1) DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `idRol` int(11) NOT NULL,
  `useUsu` char(100) NOT NULL,
  `passUsu` char(100) NOT NULL,
  `nomUsu` char(100) DEFAULT NULL,
  `apeUsu` char(100) DEFAULT NULL,
  `estReg` char(1) DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`id`, `idRol`, `useUsu`, `passUsu`, `nomUsu`, `apeUsu`, `estReg`) VALUES
(1, 1, 'mercaderista', '@mercaderista', 'Solange Yashira', 'Calla Caceres', 'A'),
(2, 2, 'promotor', '@promotor', 'Andrew Pold', 'Jacobo Castillo', 'A');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acompaniamiento_distribuidor`
--
ALTER TABLE `acompaniamiento_distribuidor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `IX_Relationship25` (`idCli`),
  ADD KEY `IX_Relationship26` (`idDis`),
  ADD KEY `IX_Relationship28` (`idEve`);

--
-- Indexes for table `acompaniamiento_distribuidor_detalle`
--
ALTER TABLE `acompaniamiento_distribuidor_detalle`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `IX_Relationship27` (`idAcomDis`),
  ADD KEY `IX_Relationship29` (`idProd`);

--
-- Indexes for table `acompaniamiento_distribuidor_quiz`
--
ALTER TABLE `acompaniamiento_distribuidor_quiz`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `IX_Relationship44` (`idRepDis`),
  ADD KEY `IX_Relationship48` (`idQuizPreg`);

--
-- Indexes for table `asistencia`
--
ALTER TABLE `asistencia`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `IX_Relationship60` (`idUsu`);

--
-- Indexes for table `asistencia_marcacion`
--
ALTER TABLE `asistencia_marcacion`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `IX_Relationship59` (`idAsis`);

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `IX_Relationship31` (`idCliCat`);

--
-- Indexes for table `cliente_categoria`
--
ALTER TABLE `cliente_categoria`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `cobranza`
--
ALTER TABLE `cobranza`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `IX_Relationship21` (`idEve`),
  ADD KEY `IX_Relationship22` (`idSupMer`);

--
-- Indexes for table `deposito`
--
ALTER TABLE `deposito`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `IX_Relationship23` (`idEve`),
  ADD KEY `IX_Relationship24` (`idCob`);

--
-- Indexes for table `distribuidor`
--
ALTER TABLE `distribuidor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `distribuidor_producto_precios`
--
ALTER TABLE `distribuidor_producto_precios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `IX_Relationship32` (`idDis`),
  ADD KEY `IX_Relationship33` (`idProd`);

--
-- Indexes for table `distribuidor_producto_precios_historico`
--
ALTER TABLE `distribuidor_producto_precios_historico`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `IX_Relationship36` (`idDis`),
  ADD KEY `IX_Relationship37` (`idProd`);

--
-- Indexes for table `distribuidor_vendedor`
--
ALTER TABLE `distribuidor_vendedor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `IX_Relationship30` (`idDis`);

--
-- Indexes for table `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `IX_Relationship9` (`idUsu`),
  ADD KEY `IX_Relationship10` (`idEveMot`);

--
-- Indexes for table `evento_motivo`
--
ALTER TABLE `evento_motivo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `inventariado`
--
ALTER TABLE `inventariado`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `IX_Relationship11` (`idEve`),
  ADD KEY `IX_Relationship14` (`idSupMer`);

--
-- Indexes for table `inventariado_detalle`
--
ALTER TABLE `inventariado_detalle`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `IX_Relationship13` (`idInv`),
  ADD KEY `IX_Relationship61` (`idProd`);

--
-- Indexes for table `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `modulo`
--
ALTER TABLE `modulo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `pedido_estado`
--
ALTER TABLE `pedido_estado`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `pedido_supermercado`
--
ALTER TABLE `pedido_supermercado`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `IX_Relationship15` (`idSupMer`),
  ADD KEY `IX_Relationship16` (`idPedEst`),
  ADD KEY `IX_Relationship20` (`idEve`);

--
-- Indexes for table `pedido_supermercado_detalle`
--
ALTER TABLE `pedido_supermercado_detalle`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `IX_Relationship18` (`idProd`),
  ADD KEY `IX_Relationship19` (`idPedSupMer`);

--
-- Indexes for table `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `IX_Relationship3` (`idRol`),
  ADD KEY `IX_Relationship4` (`idMod`);

--
-- Indexes for table `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `IX_Relationship52` (`idMar`),
  ADD KEY `IX_Relationship53` (`idProdTip`),
  ADD KEY `IX_Relationship55` (`idProdCat`),
  ADD KEY `IX_Relationship56` (`idProdTipSob`),
  ADD KEY `IX_Relationship57` (`idProdTipEn`);

--
-- Indexes for table `producto_clasificacion`
--
ALTER TABLE `producto_clasificacion`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `producto_supermercado_sucursal`
--
ALTER TABLE `producto_supermercado_sucursal`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `IX_Relationship7` (`idProd`),
  ADD KEY `IX_Relationship8` (`idSupMerSuc`);

--
-- Indexes for table `producto_tipo`
--
ALTER TABLE `producto_tipo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `producto_tipo_envase`
--
ALTER TABLE `producto_tipo_envase`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `producto_tipo_sobre`
--
ALTER TABLE `producto_tipo_sobre`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `IX_Relationship47` (`idMod`);

--
-- Indexes for table `quiz_pregunta`
--
ALTER TABLE `quiz_pregunta`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `IX_Relationship45` (`idQuiz`);

--
-- Indexes for table `quiz_respuesta`
--
ALTER TABLE `quiz_respuesta`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `IX_Relationship46` (`idQuizPreg`);

--
-- Indexes for table `reporte_precios`
--
ALTER TABLE `reporte_precios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `IX_Relationship49` (`idCli`),
  ADD KEY `IX_Relationship50` (`idEve`);

--
-- Indexes for table `reporte_precios_detalle`
--
ALTER TABLE `reporte_precios_detalle`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `IX_Relationship51` (`idRepPre`),
  ADD KEY `IX_Relationship58` (`idProd`);

--
-- Indexes for table `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `codRol` (`codRol`);

--
-- Indexes for table `supermercados`
--
ALTER TABLE `supermercados`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `supermercado_sucursales`
--
ALTER TABLE `supermercado_sucursales`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `IX_Relationship6` (`idSupMer`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `IX_Relationship1` (`idRol`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acompaniamiento_distribuidor`
--
ALTER TABLE `acompaniamiento_distribuidor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `acompaniamiento_distribuidor_detalle`
--
ALTER TABLE `acompaniamiento_distribuidor_detalle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `acompaniamiento_distribuidor_quiz`
--
ALTER TABLE `acompaniamiento_distribuidor_quiz`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `asistencia`
--
ALTER TABLE `asistencia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `asistencia_marcacion`
--
ALTER TABLE `asistencia_marcacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cliente_categoria`
--
ALTER TABLE `cliente_categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cobranza`
--
ALTER TABLE `cobranza`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deposito`
--
ALTER TABLE `deposito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `distribuidor`
--
ALTER TABLE `distribuidor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `distribuidor_producto_precios`
--
ALTER TABLE `distribuidor_producto_precios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `distribuidor_producto_precios_historico`
--
ALTER TABLE `distribuidor_producto_precios_historico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `distribuidor_vendedor`
--
ALTER TABLE `distribuidor_vendedor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `evento`
--
ALTER TABLE `evento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `evento_motivo`
--
ALTER TABLE `evento_motivo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventariado`
--
ALTER TABLE `inventariado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventariado_detalle`
--
ALTER TABLE `inventariado_detalle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marca`
--
ALTER TABLE `marca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modulo`
--
ALTER TABLE `modulo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pedido_estado`
--
ALTER TABLE `pedido_estado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pedido_supermercado`
--
ALTER TABLE `pedido_supermercado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pedido_supermercado_detalle`
--
ALTER TABLE `pedido_supermercado_detalle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `producto_clasificacion`
--
ALTER TABLE `producto_clasificacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `producto_supermercado_sucursal`
--
ALTER TABLE `producto_supermercado_sucursal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `producto_tipo`
--
ALTER TABLE `producto_tipo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `producto_tipo_envase`
--
ALTER TABLE `producto_tipo_envase`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `producto_tipo_sobre`
--
ALTER TABLE `producto_tipo_sobre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quiz`
--
ALTER TABLE `quiz`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quiz_pregunta`
--
ALTER TABLE `quiz_pregunta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quiz_respuesta`
--
ALTER TABLE `quiz_respuesta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reporte_precios`
--
ALTER TABLE `reporte_precios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reporte_precios_detalle`
--
ALTER TABLE `reporte_precios_detalle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rol`
--
ALTER TABLE `rol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `supermercados`
--
ALTER TABLE `supermercados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supermercado_sucursales`
--
ALTER TABLE `supermercado_sucursales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `acompaniamiento_distribuidor`
--
ALTER TABLE `acompaniamiento_distribuidor`
  ADD CONSTRAINT `Relationship25` FOREIGN KEY (`idCli`) REFERENCES `cliente` (`id`),
  ADD CONSTRAINT `Relationship26` FOREIGN KEY (`idDis`) REFERENCES `distribuidor` (`id`),
  ADD CONSTRAINT `Relationship28` FOREIGN KEY (`idEve`) REFERENCES `evento` (`id`);

--
-- Constraints for table `acompaniamiento_distribuidor_detalle`
--
ALTER TABLE `acompaniamiento_distribuidor_detalle`
  ADD CONSTRAINT `Relationship27` FOREIGN KEY (`idAcomDis`) REFERENCES `acompaniamiento_distribuidor` (`id`),
  ADD CONSTRAINT `Relationship29` FOREIGN KEY (`idProd`) REFERENCES `producto` (`id`);

--
-- Constraints for table `acompaniamiento_distribuidor_quiz`
--
ALTER TABLE `acompaniamiento_distribuidor_quiz`
  ADD CONSTRAINT `Relationship44` FOREIGN KEY (`idRepDis`) REFERENCES `acompaniamiento_distribuidor` (`id`),
  ADD CONSTRAINT `Relationship48` FOREIGN KEY (`idQuizPreg`) REFERENCES `quiz_pregunta` (`id`);

--
-- Constraints for table `asistencia`
--
ALTER TABLE `asistencia`
  ADD CONSTRAINT `Relationship60` FOREIGN KEY (`idUsu`) REFERENCES `usuario` (`id`);

--
-- Constraints for table `asistencia_marcacion`
--
ALTER TABLE `asistencia_marcacion`
  ADD CONSTRAINT `Relationship59` FOREIGN KEY (`idAsis`) REFERENCES `asistencia` (`id`);

--
-- Constraints for table `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `Relationship31` FOREIGN KEY (`idCliCat`) REFERENCES `cliente_categoria` (`id`);

--
-- Constraints for table `cobranza`
--
ALTER TABLE `cobranza`
  ADD CONSTRAINT `Relationship21` FOREIGN KEY (`idEve`) REFERENCES `evento` (`id`),
  ADD CONSTRAINT `Relationship22` FOREIGN KEY (`idSupMer`) REFERENCES `supermercado_sucursales` (`id`);

--
-- Constraints for table `deposito`
--
ALTER TABLE `deposito`
  ADD CONSTRAINT `Relationship23` FOREIGN KEY (`idEve`) REFERENCES `evento` (`id`),
  ADD CONSTRAINT `Relationship24` FOREIGN KEY (`idCob`) REFERENCES `cobranza` (`id`);

--
-- Constraints for table `distribuidor_producto_precios`
--
ALTER TABLE `distribuidor_producto_precios`
  ADD CONSTRAINT `Relationship32` FOREIGN KEY (`idDis`) REFERENCES `distribuidor` (`id`),
  ADD CONSTRAINT `Relationship33` FOREIGN KEY (`idProd`) REFERENCES `producto` (`id`);

--
-- Constraints for table `distribuidor_producto_precios_historico`
--
ALTER TABLE `distribuidor_producto_precios_historico`
  ADD CONSTRAINT `Relationship36` FOREIGN KEY (`idDis`) REFERENCES `distribuidor` (`id`),
  ADD CONSTRAINT `Relationship37` FOREIGN KEY (`idProd`) REFERENCES `producto` (`id`);

--
-- Constraints for table `distribuidor_vendedor`
--
ALTER TABLE `distribuidor_vendedor`
  ADD CONSTRAINT `Relationship30` FOREIGN KEY (`idDis`) REFERENCES `distribuidor` (`id`);

--
-- Constraints for table `evento`
--
ALTER TABLE `evento`
  ADD CONSTRAINT `Relationship10` FOREIGN KEY (`idEveMot`) REFERENCES `evento_motivo` (`id`),
  ADD CONSTRAINT `Relationship9` FOREIGN KEY (`idUsu`) REFERENCES `usuario` (`id`);

--
-- Constraints for table `inventariado`
--
ALTER TABLE `inventariado`
  ADD CONSTRAINT `Relationship11` FOREIGN KEY (`idEve`) REFERENCES `evento` (`id`),
  ADD CONSTRAINT `Relationship14` FOREIGN KEY (`idSupMer`) REFERENCES `supermercado_sucursales` (`id`);

--
-- Constraints for table `inventariado_detalle`
--
ALTER TABLE `inventariado_detalle`
  ADD CONSTRAINT `Relationship13` FOREIGN KEY (`idInv`) REFERENCES `inventariado` (`id`),
  ADD CONSTRAINT `Relationship61` FOREIGN KEY (`idProd`) REFERENCES `producto` (`id`);

--
-- Constraints for table `pedido_supermercado`
--
ALTER TABLE `pedido_supermercado`
  ADD CONSTRAINT `Relationship15` FOREIGN KEY (`idSupMer`) REFERENCES `supermercado_sucursales` (`id`),
  ADD CONSTRAINT `Relationship16` FOREIGN KEY (`idPedEst`) REFERENCES `pedido_estado` (`id`),
  ADD CONSTRAINT `Relationship20` FOREIGN KEY (`idEve`) REFERENCES `evento` (`id`);

--
-- Constraints for table `pedido_supermercado_detalle`
--
ALTER TABLE `pedido_supermercado_detalle`
  ADD CONSTRAINT `Relationship18` FOREIGN KEY (`idProd`) REFERENCES `producto` (`id`),
  ADD CONSTRAINT `Relationship19` FOREIGN KEY (`idPedSupMer`) REFERENCES `pedido_supermercado` (`id`);

--
-- Constraints for table `permisos`
--
ALTER TABLE `permisos`
  ADD CONSTRAINT `Relationship3` FOREIGN KEY (`idRol`) REFERENCES `rol` (`id`),
  ADD CONSTRAINT `Relationship4` FOREIGN KEY (`idMod`) REFERENCES `modulo` (`id`);

--
-- Constraints for table `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `Relationship52` FOREIGN KEY (`idMar`) REFERENCES `marca` (`id`),
  ADD CONSTRAINT `Relationship53` FOREIGN KEY (`idProdTip`) REFERENCES `producto_tipo` (`id`),
  ADD CONSTRAINT `Relationship55` FOREIGN KEY (`idProdCat`) REFERENCES `producto_clasificacion` (`id`),
  ADD CONSTRAINT `Relationship56` FOREIGN KEY (`idProdTipSob`) REFERENCES `producto_tipo_sobre` (`id`),
  ADD CONSTRAINT `Relationship57` FOREIGN KEY (`idProdTipEn`) REFERENCES `producto_tipo_envase` (`id`);

--
-- Constraints for table `producto_supermercado_sucursal`
--
ALTER TABLE `producto_supermercado_sucursal`
  ADD CONSTRAINT `Relationship7` FOREIGN KEY (`idProd`) REFERENCES `producto` (`id`),
  ADD CONSTRAINT `Relationship8` FOREIGN KEY (`idSupMerSuc`) REFERENCES `supermercado_sucursales` (`id`);

--
-- Constraints for table `quiz`
--
ALTER TABLE `quiz`
  ADD CONSTRAINT `Relationship47` FOREIGN KEY (`idMod`) REFERENCES `modulo` (`id`);

--
-- Constraints for table `quiz_pregunta`
--
ALTER TABLE `quiz_pregunta`
  ADD CONSTRAINT `Relationship45` FOREIGN KEY (`idQuiz`) REFERENCES `quiz` (`id`);

--
-- Constraints for table `quiz_respuesta`
--
ALTER TABLE `quiz_respuesta`
  ADD CONSTRAINT `Relationship46` FOREIGN KEY (`idQuizPreg`) REFERENCES `quiz_pregunta` (`id`);

--
-- Constraints for table `reporte_precios`
--
ALTER TABLE `reporte_precios`
  ADD CONSTRAINT `Relationship49` FOREIGN KEY (`idCli`) REFERENCES `cliente` (`id`),
  ADD CONSTRAINT `Relationship50` FOREIGN KEY (`idEve`) REFERENCES `evento` (`id`);

--
-- Constraints for table `reporte_precios_detalle`
--
ALTER TABLE `reporte_precios_detalle`
  ADD CONSTRAINT `Relationship51` FOREIGN KEY (`idRepPre`) REFERENCES `reporte_precios` (`id`),
  ADD CONSTRAINT `Relationship58` FOREIGN KEY (`idProd`) REFERENCES `producto` (`id`);

--
-- Constraints for table `supermercado_sucursales`
--
ALTER TABLE `supermercado_sucursales`
  ADD CONSTRAINT `Relationship6` FOREIGN KEY (`idSupMer`) REFERENCES `supermercados` (`id`);

--
-- Constraints for table `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `Relationship1` FOREIGN KEY (`idRol`) REFERENCES `rol` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
