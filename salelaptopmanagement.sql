-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 12, 2020 at 12:10 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `salelaptopmanagement`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `Customer_ID` varchar(10) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Phone_Number` varchar(50) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Identification_Number` varchar(20) NOT NULL,
  `Date_Of_Birth` date DEFAULT NULL,
  `Profile_Picture` varchar(100) DEFAULT NULL,
  `UserName` varchar(50) NOT NULL,
  `PASSWORD` varchar(50) NOT NULL,
  `Admin_Permission` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`Customer_ID`, `Name`, `Phone_Number`, `Address`, `Email`, `Identification_Number`, `Date_Of_Birth`, `Profile_Picture`, `UserName`, `PASSWORD`, `Admin_Permission`) VALUES
('1', '1', '1234', '1', 'a@gmail.com', '1', '1998-01-01', NULL, 'a', '123', b'0'),
('C0001', 'KHOA DANG', '0449441134', 'Peltolankaari 6b 13/2 Oulu', 't9dang00@students.oamk.fi', '011196-315E', '1996-11-01', 'IMGC0001.JPG', 't9dang00', 'admin@123', b'1'),
('C0002', 'hieu', '0905223820', 'abc', 'hieulapd01977@fpt.edu.vn', '231267653', '1998-04-08', 'avatar.jpg', 'hieu', 'KANRUDXP33', b'1'),
('C0003', 'jenny', '0365637428', 'a', 'jenny@gmail.com', '123456777', '1998-03-30', 'customer.png', 'jenny', '123', b'0'),
('C0004', 's', '1232232', 'as', 's@gmail.com', '12312321', '2020-03-29', 'customer.png', 'ssdsd', 'admin@123', b'0'),
('CT5', 'long', '11111', '1111', 'hieulapd01977@fpt.edu.vn', '11111', NULL, 'customer.png', 'long', '3OM5833ZMP', b'0'),
('CT7', 'tam', '1', '1', 'tam@gmail.com', '1', '1998-04-08', 'customer.png', 'tam', '123', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `Product_ID` varchar(10) NOT NULL,
  `Supplier_ID` varchar(10) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Brand` varchar(50) NOT NULL,
  `Image` varchar(100) DEFAULT NULL,
  `Price` int(11) DEFAULT NULL,
  `Model_Code` varchar(50) DEFAULT NULL,
  `Size` varchar(50) DEFAULT NULL,
  `Weight` int(11) DEFAULT NULL,
  `Color` varchar(10) DEFAULT NULL,
  `Network_Communication` varchar(50) DEFAULT NULL,
  `Processor` varchar(50) DEFAULT NULL,
  `Processor_Speed` varchar(50) DEFAULT NULL,
  `Operating_System` varchar(50) DEFAULT NULL,
  `Screen_Size` varchar(50) DEFAULT NULL,
  `Resolution` varchar(50) DEFAULT NULL,
  `Screen_Type` varchar(50) DEFAULT NULL,
  `VGA` varchar(50) DEFAULT NULL,
  `VGA_Memory` varchar(50) DEFAULT NULL,
  `Hard_Drive_Capacity` varchar(50) DEFAULT NULL,
  `Disc` varchar(50) DEFAULT NULL,
  `Ram_Memory` varchar(50) DEFAULT NULL,
  `Ram_Gen` varchar(50) DEFAULT NULL,
  `BUS` varchar(50) DEFAULT NULL,
  `Camera` varchar(50) DEFAULT NULL,
  `Port` varchar(100) DEFAULT NULL,
  `Battery` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`Product_ID`, `Supplier_ID`, `Name`, `Brand`, `Image`, `Price`, `Model_Code`, `Size`, `Weight`, `Color`, `Network_Communication`, `Processor`, `Processor_Speed`, `Operating_System`, `Screen_Size`, `Resolution`, `Screen_Type`, `VGA`, `VGA_Memory`, `Hard_Drive_Capacity`, `Disc`, `Ram_Memory`, `Ram_Gen`, `BUS`, `Camera`, `Port`, `Battery`) VALUES
('P0001', 'S001', 'Lenovo Legion Y540 15IRH', 'Lenovo', 'P0001customer.png', 1, '81SY00FAVN', '25,56mm X 35,21mm', 1, 'Black', '802.11ac + Bluetooth 5.0', '9th Generation Intel? Core? i7 _ 9750H', '2.60 GHz, 12M Cache, up to 4.50 GHz', 'Windows 10 Home SL 64bit', '15.6 inch Full HD ', '(1920 x 1080)', 'IPS Anti Glare 60Hz, 250 nits', 'NVIDIA? GeForce? GTX1650', '4GB GDDR5 / Integrated Intel? UHD Graphics', '128GB PCIe? NVMe? M.2 SSD + 1TB (1000GB) 5400rpm H', 'None', '8GB', 'DDr4 (2 Slot, Max 32GB Ram)', '2666Mhz', '3 Mega pixel', 'USB 3.0, USB 3.1 Type C?, HDMI, Mini DisplayPort', '3 Cells 52.5 Whrs Battery'),
('P004', 'S001', 's', '12323', 'customer.png', 1, 's', '2', 1, 'a', 'a', 'a', 'aa', 'a', 'a', 'a', 'aa', 'a', 'a', 'aa', 'a', 'a', 'aa', 'a', 'a', 'aa', 'a'),
('P0040', 'S001', '1', '1', 'P0040customer.png', 1, '1', '1', 1, '11', '1', '1', '1', '1', '1', '1', '1', '1', '1', '11', '1', '1', '1', '1', '1', '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `receipts`
--

CREATE TABLE `receipts` (
  `Receipt_ID` varchar(10) NOT NULL,
  `Customer_ID` varchar(10) NOT NULL,
  `Transaction_Day` date NOT NULL,
  `Total` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `receipts`
--

INSERT INTO `receipts` (`Receipt_ID`, `Customer_ID`, `Transaction_Day`, `Total`) VALUES
('R0001', 'C0001', '2020-04-02', 1000),
('R1', 'CT7', '2020-04-10', 5),
('R2', 'CT7', '2020-04-10', 2),
('R3', 'CT7', '2020-04-10', 2);

-- --------------------------------------------------------

--
-- Table structure for table `receipt_details`
--

CREATE TABLE `receipt_details` (
  `Receipt_Detail_ID` varchar(10) NOT NULL,
  `Receipt_ID` varchar(10) NOT NULL,
  `Product_ID` varchar(10) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `receipt_details`
--

INSERT INTO `receipt_details` (`Receipt_Detail_ID`, `Receipt_ID`, `Product_ID`, `Quantity`) VALUES
('R1P004', 'R1', 'P004', 1),
('R1P0040', 'R1', 'P0040', 4),
('R2P0001', 'R2', 'P0001', 1),
('R2P004', 'R2', 'P004', 1),
('R3P0040', 'R3', 'P0040', 2),
('RD0001', 'R0001', 'P0001', 1);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `Supplier_ID` varchar(10) NOT NULL,
  `Supplier_Name` varchar(50) NOT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `Phone_Number` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`Supplier_ID`, `Supplier_Name`, `Address`, `Phone_Number`) VALUES
('S001', 'DNA kauppa', 'Torikatu 18, 90100 Oulu', '0440338001');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`Customer_ID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`Product_ID`),
  ADD KEY `Supplier_ID` (`Supplier_ID`);

--
-- Indexes for table `receipts`
--
ALTER TABLE `receipts`
  ADD PRIMARY KEY (`Receipt_ID`),
  ADD KEY `Custumer_ID` (`Customer_ID`);

--
-- Indexes for table `receipt_details`
--
ALTER TABLE `receipt_details`
  ADD PRIMARY KEY (`Receipt_Detail_ID`),
  ADD KEY `Receipt_ID` (`Receipt_ID`),
  ADD KEY `Product_ID` (`Product_ID`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`Supplier_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`Supplier_ID`) REFERENCES `suppliers` (`Supplier_ID`);

--
-- Constraints for table `receipts`
--
ALTER TABLE `receipts`
  ADD CONSTRAINT `receipts_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customers` (`Customer_ID`);

--
-- Constraints for table `receipt_details`
--
ALTER TABLE `receipt_details`
  ADD CONSTRAINT `receipt_details_ibfk_1` FOREIGN KEY (`Receipt_ID`) REFERENCES `receipts` (`Receipt_ID`),
  ADD CONSTRAINT `receipt_details_ibfk_2` FOREIGN KEY (`Product_ID`) REFERENCES `products` (`Product_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
