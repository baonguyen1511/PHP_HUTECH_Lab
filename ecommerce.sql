-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 15, 2020 lúc 05:52 AM
-- Phiên bản máy phục vụ: 10.4.11-MariaDB
-- Phiên bản PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `ecommerce`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `CateID` int(11) NOT NULL,
  `CategoryName` varchar(150) NOT NULL,
  `Descrip` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`CateID`, `CategoryName`, `Descrip`) VALUES
(1, 'Điện thoại', 'ĐT'),
(2, 'Máy tính bảng', 'MTB'),
(3, 'Laptop', 'LT');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orderdetail`
--

CREATE TABLE `orderdetail` (
  `OrderID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orderproduct`
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
-- Cấu trúc bảng cho bảng `product`
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
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`ProductID`, `ProductName`, `CateID`, `Price`, `Quantity`, `Description`, `Picture`) VALUES
(64, 'Laptop Lenovo IdeaPad S340 14IIL i3 1005G1/8GB/512GB/Win10 (81VV003VVN)', 3, 13690000, 68, ' CPU:	Intel Core i3 Ice Lake, 1005G1, 1.20 GHz\r\nRAM:	8 GB, DDR4 (On board 4GB +1 khe 4GB), 2666 MHz\r\nỔ cứng:	SSD 512 GB M.2 PCIe, Hỗ trợ khe cắm HDD SATA\r\nMàn hình:	14 inch, Full HD (1920 x 1080)\r\nCard màn hình:	Card đồ họa tích hợp, Intel UHD Graphics\r\nCổng kết nối:	2 x USB 3.1, HDMI, USB Type-C\r\nHệ điều hành:	Windows 10 Home SL\r\nThiết kế:	Vỏ nhựa - nắp lưng bằng kim loại, PIN liền\r\nKích thước:	Dày 17.9 mm, 1.6 kg\r\nThời điểm ra mắt:	2019', 'uploads/20200608050355lenovo-ideapad-s340-14iil-i3-1005g1-8gb-512gb-win1-18-600x600.jpg'),
(65, 'Laptop Asus VivoBook A412F i5 10210U/8GB/32GB+512GB/Win10 (EK739T)', 3, 17490000, 121, ' CPU:	Intel Core i5 Comet Lake, 10210U, 1.60 GHz\r\nRAM:	8 GB, DDR4 (On board 4GB +1 khe 4GB), 2666 MHz\r\nỔ cứng:	Intel Optane 32GB (H10), SSD 512 GB M.2 PCIe, Hỗ trợ khe cắm HDD SATA\r\nMàn hình:	14 inch, Full HD (1920 x 1080)\r\nCard màn hình:	Card đồ họa tích hợp, Intel UHD Graphics\r\nCổng kết nối:	USB 3.1, HDMI, USB 2.0, USB Type-C\r\nHệ điều hành:	Windows 10 Home SL\r\nThiết kế:	Vỏ nhựa, PIN liền\r\nKích thước:	Dày 19.5 mm, 1.406 kg\r\nThời điểm ra mắt:	2019', 'uploads/20200608050618asus-vivobook-a412f-i510210u-8gb-32gb-512gb-win10-218865-600x600.jpg'),
(66, 'Laptop Apple MacBook Air 2017 i5 1.8GHz/8GB/128GB (MQD32SA/A)', 3, 19990000, 59, ' CPU:	Intel Core i5 Broadwell, 1.80 GHz\r\nRAM:	8 GB, DDR3L(On board), 1600 MHz\r\nỔ cứng:	SSD: 128 GB\r\nMàn hình:	13.3 inch, WXGA+(1440 x 900)\r\nCard màn hình:	Card đồ họa tích hợp, Intel HD Graphics 6000\r\nCổng kết nối:	MagSafe 2, 2 x USB 3.0, Thunderbolt 2\r\nHệ điều hành:	Mac OS\r\nThiết kế:	Vỏ kim loại nguyên khối, PIN liền\r\nKích thước:	Dày 17 mm, 1.35 Kg\r\nThời điểm ra mắt:	2017', 'uploads/20200608050758apple-macbook-air-mqd32sa-a-i5-5350u-600x600.jpg'),
(78, 'Laptop Apple MacBook Air 2020 i3 1.1GHz/8GB/256GB (MWTL2SA/A)', 3, 28990000, 1212, ' CPU:	Intel Core i3 Thế hệ 10, 1.10 GHz\r\nRAM:	8 GB, LPDDR4X (On board), 3733 MHz\r\nỔ cứng:	SSD: 256 GB\r\nMàn hình:	13.3 inch, Retina (2560 x 1600)\r\nCard màn hình:	Card đồ họa tích hợp, Intel Iris Plus Graphics\r\nCổng kết nối:	2 x Thunderbolt 3 (USB-C)\r\nHệ điều hành:	Mac OS\r\nThiết kế:	Vỏ kim loại nguyên khối, PIN liền\r\nKích thước:	Dày 4.1 mm đến 16.1 mm, 1.29 kg\r\nThời điểm ra mắt:	2020', 'uploads/20200614073057apple-macbook-air-2020-i3-220174-600x600.jpg'),
(79, 'Laptop Acer Nitro AN515 43 R9FD R5 3550H/8GB/512GB/4GB GTX1650/Win10 (NH.Q6ZSV.003)', 3, 19490000, 2124, ' CPU:	AMD Ryzen 5, 3550H, 2.10 GHz\r\nRAM:	8 GB, DDR4 (2 khe), 2400 MHz\r\nỔ cứng:	SSD 512 GB M.2 PCIe, Hỗ trợ khe cắm HDD SATA\r\nMàn hình:	15.6 inch, Full HD (1920 x 1080)\r\nCard màn hình:	Card đồ họa rời, NVIDIA GeForce GTX 1650 4GB\r\nCổng kết nối:	2 x USB 3.1, HDMI, LAN (RJ45), USB 2.0, USB Type-C\r\nHệ điều hành:	Windows 10 Home SL\r\nThiết kế:	Vỏ nhựa, PIN liền\r\nKích thước:	Dày 25.9 mm, 2.3 kg\r\nThời điểm ra mắt:	2019', 'uploads/20200614073437acer-nitro-an515-43-r5-nhq6zsv003-600x600.jpg'),
(80, ' Laptop HP Envy x360 ar0072AU R7 3700U/8GB/256GB/Touch/Win10', 3, 25890000, 1213, ' CPU:	AMD Ryzen 7, 3700U, 2.30 GHz\r\nRAM:	8 GB, DDR4 (On board), 2400 MHz\r\nỔ cứng:	SSD 256GB NVMe PCIe\r\nMàn hình:	13.3 inch, Full HD (1920 x 1080)\r\nCard màn hình:	Card đồ họa tích hợp, AMD Radeon Vega 10 Graphics\r\nCổng kết nối:	2 x USB 3.1, USB Type-C\r\nHệ điều hành:	Windows 10 Home SL\r\nThiết kế:	Vỏ kim loại nguyên khối, PIN liền\r\nKích thước:	Dày 14.7 mm, 1.31 kg\r\nThời điểm ra mắt:	2019', 'uploads/20200614073644hp-envy-x360-ar0072au-r7-3700u-8gb-256gb-touch-win2-600x600.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `UserID` int(5) NOT NULL,
  `UserName` varchar(30) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`CateID`);

--
-- Chỉ mục cho bảng `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Chỉ mục cho bảng `orderproduct`
--
ALTER TABLE `orderproduct`
  ADD PRIMARY KEY (`OrderID`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ProductID`),
  ADD KEY `CateID` (`CateID`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `CateID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `orderdetail`
--
ALTER TABLE `orderdetail`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `orderproduct`
--
ALTER TABLE `orderproduct`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(5) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD CONSTRAINT `orderdetail_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`),
  ADD CONSTRAINT `orderdetail_ibfk_2` FOREIGN KEY (`OrderID`) REFERENCES `orderproduct` (`OrderID`);

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`CateID`) REFERENCES `category` (`CateID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
