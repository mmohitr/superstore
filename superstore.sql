-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 04, 2019 at 05:14 PM
-- Server version: 10.4.8-MariaDB
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
-- Database: `superstore`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ORDER_COUNT` ()  NO SQL
BEGIN
SELECT COUNT(ORDID) FROM strorders;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `ANAME` varchar(20) NOT NULL,
  `APASS` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`ANAME`, `APASS`) VALUES
('555', 'admin'),
('Pranav', '123'),
('Praneeth', '123'),
('Mohith', '123');

-- --------------------------------------------------------

--
-- Table structure for table `dstbr`
--

CREATE TABLE `dstbr` (
  `DID` int(11) NOT NULL,
  `DNAME` varchar(20) NOT NULL,
  `DPASS` varchar(20) NOT NULL DEFAULT 'admin',
  `DTYPE` varchar(20) NOT NULL,
  `DLOC` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dstbr`
--

INSERT INTO `dstbr` (`DID`, `DNAME`, `DPASS`, `DTYPE`, `DLOC`) VALUES
(1000, 'Fritolay', 'admin', 'Electrical', 'Delhi'),
(1001, 'Pepsico', 'admin', 'CoolDrinks', 'Hyd'),
(1003, 'Tropicana', 'admin', 'Drinks', 'Banglore'),
(1004, 'Hershey\'s', 'admin', 'Chocolates', 'Mumbai'),
(1005, 'Kellogg\'s', 'admin', 'Cereals', 'Noida'),
(1006, 'Amul', 'admin', 'Milk Products', 'Surat'),
(1007, 'Pears', 'admin', 'Health', 'Banglore');

--
-- Triggers `dstbr`
--
DELIMITER $$
CREATE TRIGGER `SalesT` AFTER INSERT ON `dstbr` FOR EACH ROW INSERT INTO stock VALUES ("Food","Complimentary Products","100","107")
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `SALESID` int(11) NOT NULL,
  `SDATE` varchar(20) NOT NULL,
  `SCOST` int(11) NOT NULL,
  `SID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`SALESID`, `SDATE`, `SCOST`, `SID`) VALUES
(111, '12/10/12', 20000, 102),
(112, '12/10/19', 20000, 100),
(113, '13/11/19', 2500, 100),
(114, '10/11/19', 5000, 100),
(115, '22/11/18', 40079, 100);

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `CRY` varchar(20) NOT NULL,
  `SCRY` varchar(20) NOT NULL,
  `QUANT` int(11) NOT NULL,
  `SID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`CRY`, `SCRY`, `QUANT`, `SID`) VALUES
('Electronics', 'TV', 10, 100),
('Health', 'Pears Soaps', 25, 103);

-- --------------------------------------------------------

--
-- Table structure for table `store`
--

CREATE TABLE `store` (
  `SID` int(11) NOT NULL,
  `SPASS` varchar(20) NOT NULL DEFAULT 'admin',
  `SBRANCHNAME` varchar(20) NOT NULL,
  `SCITY` varchar(20) NOT NULL,
  `SREGION` varchar(20) NOT NULL,
  `SSTATE` varchar(20) NOT NULL,
  `SPCODE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `store`
--

INSERT INTO `store` (`SID`, `SPASS`, `SBRANCHNAME`, `SCITY`, `SREGION`, `SSTATE`, `SPCODE`) VALUES
(100, 'admin', 'Indira Nagar', 'Banglore', 'South', 'Karnataka', 222),
(102, 'admin', 'Silk Board', 'Banglore', 'South', 'Karnataka', 560095),
(103, 'admin', 'Hi-Tech City', 'Hyderabad', 'South', 'Telanagana', 5000003),
(104, 'admin', 'SR Nagar', 'Hyderabad', 'South', 'Telanagana', 500102),
(105, 'admin', 'Kormanagala', 'Banglore', 'South', 'Karnataka', 512091),
(107, 'admin', 'Head Office', 'Banglore', 'South', 'Karnataka', 560102);

-- --------------------------------------------------------

--
-- Table structure for table `strorders`
--

CREATE TABLE `strorders` (
  `SID` int(11) NOT NULL,
  `ORDID` int(11) NOT NULL,
  `DID` int(11) NOT NULL,
  `ORDDATE` timestamp NOT NULL DEFAULT current_timestamp(),
  `PMYSTAT` varchar(20) NOT NULL DEFAULT 'PENDING',
  `SHPMODE` varchar(20) NOT NULL DEFAULT 'Normal',
  `SHPSTAT` varchar(20) NOT NULL DEFAULT 'PENDING'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `strorders`
--

INSERT INTO `strorders` (`SID`, `ORDID`, `DID`, `ORDDATE`, `PMYSTAT`, `SHPMODE`, `SHPSTAT`) VALUES
(100, 500, 1000, '2018-11-20 20:52:59', 'PAID', 'Premium', 'Delivered'),
(0, 501, 1000, '2018-11-20 21:14:45', 'PAID', 'Normal', 'PENDING'),
(100, 502, 1000, '2018-11-20 21:15:45', 'PAID', 'Premium', 'Delivered'),
(100, 503, 1000, '2018-11-20 21:20:11', 'PAID', 'Normal', 'PENDING'),
(100, 504, 1000, '2018-11-20 21:37:23', '', 'Normal', 'PENDING'),
(100, 505, 1000, '2018-11-20 21:39:46', '', 'Normal', 'PENDING'),
(100, 506, 1000, '2018-11-21 13:46:39', '', 'Normal', 'PENDING'),
(100, 507, 1000, '2018-11-22 09:47:29', '', 'Normal', 'PENDING'),
(100, 508, 1000, '2018-11-30 15:11:59', '', 'Normal', 'PENDING'),
(100, 509, 1001, '2019-10-18 05:51:27', 'PAID', 'Normal', 'Delivered'),
(100, 510, 1003, '2019-10-18 05:56:21', 'PENDING', 'Normal', 'PENDING'),
(100, 511, 1000, '2019-10-18 06:31:23', 'PENDING', 'Normal', 'PENDING'),
(100, 512, 1003, '2019-10-18 11:40:15', 'PENDING', 'Normal', 'PENDING'),
(0, 513, 1005, '2019-10-18 16:55:37', 'PENDING', 'Normal', 'PENDING'),
(100, 514, 1005, '2019-10-18 16:56:15', 'PENDING', 'Normal', 'PENDING'),
(100, 515, 1005, '2019-10-19 07:35:43', 'PENDING', 'Normal', 'PENDING'),
(100, 516, 1001, '2019-10-19 07:35:51', 'PENDING', 'Normal', 'PENDING'),
(103, 517, 1007, '2019-11-13 03:53:58', 'PAID', 'EKART', 'Delivered');

-- --------------------------------------------------------

--
-- Table structure for table `t`
--

CREATE TABLE `t` (
  `temp` varchar(20) NOT NULL,
  `tee` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t`
--

INSERT INTO `t` (`temp`, `tee`) VALUES
('', '2018-11-30 19:21:11'),
('', '2018-11-30 19:21:32'),
('501', '2018-11-30 19:22:00'),
('503', '2018-11-30 19:25:07'),
('501', '2018-11-30 19:25:20'),
('502', '2018-11-30 19:25:47'),
('501', '2018-11-30 19:31:55'),
('501', '2018-11-30 19:34:22'),
('501', '2018-11-30 19:34:27'),
('505', '2018-11-30 19:34:30'),
('502', '2018-11-30 19:35:50'),
('506', '2018-11-30 19:35:54'),
('503', '2018-11-30 19:36:36'),
('501', '2018-11-30 19:37:40'),
('501', '2018-11-30 19:38:26'),
('501', '2018-11-30 19:38:41'),
('501', '2018-11-30 19:39:42'),
('502', '2018-11-30 19:47:54'),
('503', '2018-11-30 19:47:56'),
('503', '2018-11-30 19:49:10'),
('505', '2018-11-30 19:49:13'),
('505', '2018-11-30 19:49:15'),
('501', '2018-11-30 19:49:17'),
('503', '2018-11-30 19:50:47'),
('501', '2018-11-30 19:50:53'),
('502', '2018-11-30 19:52:55'),
('502', '2018-11-30 19:53:10'),
('502', '2018-11-30 19:53:32'),
('SCITY', '2018-11-30 19:56:55'),
('SREGION', '2018-11-30 19:58:50'),
('SBRANCHNAME', '2018-11-30 19:59:08'),
('SBRANCHNAME', '2018-12-01 04:09:12'),
('501', '2018-12-01 04:15:09'),
('SCITY', '2019-10-15 17:36:29'),
('SSTATE', '2019-10-15 17:36:52'),
('SREGION', '2019-10-16 03:13:19'),
('SBRANCHNAME', '2019-10-18 05:17:50'),
('SBRANCHNAME', '2019-10-18 05:33:07'),
('SCITY', '2019-10-18 05:33:29'),
('SCITY', '2019-10-18 05:33:45'),
('SCITY', '2019-10-18 05:34:02'),
('SBRANCHNAME', '2019-10-18 05:34:35'),
('SREGION', '2019-10-18 05:34:51'),
('SSTATE', '2019-10-18 05:35:07'),
('SSTATE', '2019-10-18 05:35:27'),
('SBRANCHNAME', '2019-10-18 05:36:17'),
('SBRANCHNAME', '2019-10-18 05:37:10'),
('SCITY', '2019-10-18 05:37:25'),
('SBRANCHNAME', '2019-10-18 05:38:03'),
('SBRANCHNAME', '2019-10-18 05:41:07'),
('None', '2019-10-18 05:41:31'),
('SBRANCHNAME', '2019-10-18 05:41:39'),
('None', '2019-10-18 05:45:55'),
('SCITY', '2019-10-18 05:46:10'),
('SBRANCHNAME', '2019-10-18 05:49:46'),
('SBRANCHNAME', '2019-10-18 06:02:46'),
('509', '2019-10-18 06:28:25'),
('500', '2019-10-18 06:32:08'),
('SBRANCHNAME', '2019-10-18 07:41:47'),
('SREGION', '2019-10-18 11:39:35'),
('500', '2019-10-18 11:41:26'),
('SBRANCHNAME', '2019-10-18 11:49:14'),
('SBRANCHNAME', '2019-10-18 17:06:29'),
('SBRANCHNAME', '2019-10-18 17:06:55'),
('SCITY', '2019-10-18 17:09:14'),
('SCITY', '2019-10-18 17:09:29'),
('SCITY', '2019-10-19 05:05:09'),
('None', '2019-10-19 05:05:16'),
('None', '2019-10-19 05:06:00'),
('SCITY', '2019-10-19 05:06:41'),
('SBRANCHNAME', '2019-10-19 07:35:01'),
('SCITY', '2019-10-19 07:35:05'),
('509', '2019-10-19 07:37:19'),
('509', '2019-10-19 07:37:26'),
('SBRANCHNAME', '2019-11-10 04:49:44'),
('SCITY', '2019-11-11 12:12:04'),
('SBRANCHNAME', '2019-11-12 16:56:13'),
('SBRANCHNAME', '2019-11-13 03:49:44'),
('SCITY', '2019-11-13 03:50:22'),
('SCITY', '2019-11-13 03:50:32'),
('SSTATE', '2019-11-13 03:51:36'),
('SCITY', '2019-11-13 03:55:19'),
('517', '2019-11-13 03:56:39'),
('517', '2019-11-13 03:56:54'),
('SREGION', '2019-11-13 03:57:45'),
('SBRANCHNAME', '2019-11-13 03:58:05'),
('SBRANCHNAME', '2019-11-13 04:00:54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dstbr`
--
ALTER TABLE `dstbr`
  ADD PRIMARY KEY (`DID`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`SALESID`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD KEY `SID` (`SID`);

--
-- Indexes for table `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`SID`);

--
-- Indexes for table `strorders`
--
ALTER TABLE `strorders`
  ADD PRIMARY KEY (`ORDID`),
  ADD KEY `DID` (`DID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dstbr`
--
ALTER TABLE `dstbr`
  MODIFY `DID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1008;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `SALESID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=232;

--
-- AUTO_INCREMENT for table `store`
--
ALTER TABLE `store`
  MODIFY `SID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `strorders`
--
ALTER TABLE `strorders`
  MODIFY `ORDID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=518;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`SID`) REFERENCES `store` (`SID`) ON DELETE CASCADE;

--
-- Constraints for table `strorders`
--
ALTER TABLE `strorders`
  ADD CONSTRAINT `strorders_ibfk_1` FOREIGN KEY (`DID`) REFERENCES `dstbr` (`DID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
