-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2020 at 09:34 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `CateID` int(11) NOT NULL,
  `CategoryName` varchar(150) NOT NULL,
  `Descrip` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`CateID`, `CategoryName`, `Descrip`) VALUES
(1, 'Điện thoại', 'ĐT'),
(2, 'Máy tính bảng', 'MTB'),
(3, 'Laptop', 'LT');

-- --------------------------------------------------------

--
-- Table structure for table `orderdetail`
--

CREATE TABLE `orderdetail` (
  `OrderID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `orderproduct`
--

CREATE TABLE `orderproduct` (
  `OrderID` int(11) NOT NULL,
  `OrderDate` datetime NOT NULL,
  `ShipDate` datetime NOT NULL,
  `ShipName` varchar(150) NOT NULL,
  `ShipAddress` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ProductID` int(11) NOT NULL,
  `ProductName` varchar(150) DEFAULT NULL,
  `CateID` int(11) DEFAULT NULL,
  `Price` double DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Description` varchar(500) DEFAULT NULL,
  `Picture` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ProductID`, `ProductName`, `CateID`, `Price`, `Quantity`, `Description`, `Picture`) VALUES
(100, 'iPhone 11 64GB', 1, 19490000, 123, ' Màn hình:	IPS LCD, 6.1\", Liquid Retina\r\nHệ điều hành:	iOS 13\r\nCamera sau:	Chính 12 MP & Phụ 12 MP\r\nCamera trước:	12 MP\r\nCPU:	Apple A13 Bionic 6 nhân\r\nRAM:	4 GB\r\nBộ nhớ trong:	64 GB\r\nThẻ SIM:\r\n1 eSIM & 1 Nano SIM, Hỗ trợ 4G\r\nDung lượng pin:	3110 mAh, có sạc nhanh', 'uploads/20200621091245iphone-11-red-2-400x460-400x460.png'),
(101, 'iPhone 11 Pro Max 512GB', 1, 40490000, 123, ' Màn hình:	OLED, 6.5\", Super Retina XDR\r\nHệ điều hành:	iOS 13\r\nCamera sau:	3 camera 12 MP\r\nCamera trước:	12 MP\r\nCPU:	Apple A13 Bionic 6 nhân\r\nRAM:	4 GB\r\nBộ nhớ trong:	512 GB\r\nThẻ SIM:\r\n1 eSIM & 1 Nano SIM, Hỗ trợ 4G\r\nDung lượng pin:	3969 mAh, có sạc nhanh', 'uploads/20200621091343iphone-11-pro-max-512gb-gold-400x460.png'),
(102, 'iPhone Xs Max 256GB', 1, 25990000, 123, ' Màn hình:	OLED, 6.5\", Super Retina\r\nHệ điều hành:	iOS 12\r\nCamera sau:	Chính 12 MP & Phụ 12 MP\r\nCamera trước:	7 MP\r\nCPU:	Apple A12 Bionic 6 nhân\r\nRAM:	4 GB\r\nBộ nhớ trong:	256 GB\r\nThẻ SIM:\r\n1 eSIM & 1 Nano SIM, Hỗ trợ 4G\r\nDung lượng pin:	3174 mAh, có sạc nhanh', 'uploads/20200621091512iphone-xs-max-256gb-white-400x460.png'),
(105, 'Apple MacBook Air 2017 i5 1.8GHz/8GB/128GB', 3, 1990000, 13, 'Màn hình: 13.3 inch, WXGA+(1440 x 900)\r\nCPU: Intel Core i5 Broadwell, 1.80 GHz\r\nRAM: 8 GB, SSD: 128 GB\r\nĐồ họa: Intel HD Graphics 6000\r\nHĐH: Mac OS\r\nNặng: 1.35 Kg, Pin: Khoảng 12 giờ', 'uploads/20200621092454apple-macbook-air-mqd32sa-a-i5-5350u-600x600.jpg'),
(106, 'Apple MacBook Air 2020 i5 1.1GHz/8GB/256GB', 3, 30990000, 12, ' CPU:	Intel Core i5 Thế hệ 10, 1.10 GHz\r\nRAM:	8 GB, LPDDR4X (On board), 3733 MHz\r\nỔ cứng:	SSD: 256 GB\r\nMàn hình:	13.3 inch, Retina (2560 x 1600)\r\nCard màn hình:	Card đồ họa tích hợp, Intel Iris Plus Graphics\r\nCổng kết nối:	2 x Thunderbolt 3 (USB-C)\r\nHệ điều hành:	Mac OS\r\nThiết kế:	Vỏ kim loại nguyên khối, PIN liền\r\nKích thước:	Dày 4.1 mm đến 16.1 mm, 1.29 kg\r\nThời điểm ra mắt:	2020', 'uploads/20200621092658apple-macbook-air-2020-gold-1-600x600.jpg'),
(107, 'Apple MacBook Pro 20202.0GHz/16GB/512GB', 3, 47990000, 16, ' CPU:	Intel Core i5 Thế hệ 10, 2.00 GHz\r\nRAM:	16 GB, LPDDR4X (On board), 3733 MHz\r\nỔ cứng:	SSD 512GB\r\nMàn hình:	13.3 inch, Retina (2560 x 1600)\r\nCard màn hình:	Card đồ họa tích hợp, Intel Iris Plus Graphics\r\nCổng kết nối:	4 x Thunderbolt 3 (USB-C)\r\nHệ điều hành:	Mac OS\r\nThiết kế:	Vỏ kim loại nguyên khối, PIN liền\r\nKích thước:	Dày 15.6 mm, 1.4\r\nThời điểm ra mắt:	2020', 'uploads/20200621092753macbook-pro-touch-2020-i5-mwp42sa-a-600x600.jpg'),
(108, 'iPad 10.2 inch Wifi Cellular 32GB', 2, 11990000, 33, ' Màn hình	LED backlit LCD, 10.2\"\r\nHệ điều hành	iOS 13\r\nCPU	Apple A10 Fusion 4 nhân, 2.34 GHz\r\nRAM	3 GB\r\nBộ nhớ trong	32 GB\r\nCamera sau	8 MP\r\nCamera trước	1.2 MP\r\nKết nối mạng	WiFi, 3G, 4G LTE\r\nHỗ trợ SIM\r\n1 Nano SIM hoặc 1 eSIM\r\nĐàm thoại	FaceTime', 'uploads/20200621093011ipad-10-2-inch-wifi-cellular-32gb-2019-gold-400x460.png'),
(109, 'iPad Pro 12.9 inch Wifi Cellular 128GB', 2, 31990000, 12, ' Màn hình	Liquid Retina, 12.9\"\r\nHệ điều hành	iPadOS 13\r\nCPU	Apple A12Z Bionic, 4 nhân 2.5 GHz & 4 nhân 1.6 GHz\r\nRAM	6 GB\r\nBộ nhớ trong	128 GB\r\nCamera sau	Chính 12 MP & Phụ 10 MP, TOF 3D LiDAR\r\nCamera trước	7 MP\r\nKết nối mạng	WiFi, 3G, Hỗ trợ 4G\r\nHỗ trợ SIM\r\n1 Nano SIM hoặc 1 eSIM\r\nĐàm thoại	FaceTime', 'uploads/20200621093138ipad-pro-12-9-inch-wifi-cellular-128gb-2020-bac-400x460-400x460.png'),
(110, 'iPad Pro 12.9 inch Wifi 128GB', 2, 27490000, 19, ' Màn hình	Liquid Retina, 12.9\"\r\nHệ điều hành	iPadOS 13\r\nCPU	Apple A12Z Bionic, 4 nhân 2.5 GHz & 4 nhân 1.6 GHz\r\nRAM	6 GB\r\nBộ nhớ trong	128 GB\r\nCamera sau	Chính 12 MP & Phụ 10 MP, TOF 3D LiDAR\r\nCamera trước	7 MP\r\nKết nối mạng	WiFi, Không hỗ trợ 3G, Không hỗ trợ 4G\r\nĐàm thoại	FaceTime\r\nTrọng lượng	471 g', 'uploads/20200621093246ipad-pro-12-9-inch-wifi-128gb-2020-xam-400x460-1-400x460.png');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(5) NOT NULL,
  `UserName` varchar(30) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `UserName`, `Email`, `Password`) VALUES
(1, 'baonguyen', 'abc@gmail.com', '202cb962ac59075b964b07152d234b70');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`CateID`);

--
-- Indexes for table `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indexes for table `orderproduct`
--
ALTER TABLE `orderproduct`
  ADD PRIMARY KEY (`OrderID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ProductID`),
  ADD KEY `CateID` (`CateID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `CateID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orderdetail`
--
ALTER TABLE `orderdetail`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orderproduct`
--
ALTER TABLE `orderproduct`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD CONSTRAINT `orderdetail_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`),
  ADD CONSTRAINT `orderdetail_ibfk_2` FOREIGN KEY (`OrderID`) REFERENCES `orderproduct` (`OrderID`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`CateID`) REFERENCES `category` (`CateID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
