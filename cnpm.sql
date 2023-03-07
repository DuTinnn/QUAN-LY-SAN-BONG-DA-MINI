

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `cnpm`
--
CREATE DATABASE IF NOT EXISTS `cnpm` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `cnpm`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietdatsan`
--

CREATE TABLE `chitietdatsan` (
  `IdUser` int(10) NOT NULL,
  `MaSan` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `chitietdatsan`:
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `datsan`
--

CREATE TABLE `datsan` (
  `idHoaDon` int(10) NOT NULL,
  `IdUser` int(10) NOT NULL,
  `HoTen` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Sdt` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `NgayDat` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `MaSan` int(10) NOT NULL,
  `TongTien` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `datsan`:
--   `MaSan`
--       `san` -> `MaSan`
--   `IdUser`
--       `user` -> `IdUser`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `san`
--

CREATE TABLE `san` (
  `MaSan` int(10) NOT NULL,
  `TenSan` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ChiNhanh` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `GiaThue` int(100) NOT NULL,
  `DiaChi` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `MoTa` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `AnhSan` char(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `san`:
--

--
-- Đang đổ dữ liệu cho bảng `san`
--

INSERT INTO `san` (`MaSan`, `TenSan`, `ChiNhanh`, `GiaThue`, `DiaChi`, `MoTa`, `AnhSan`) VALUES
(9, 'Sân 1', 'Quận 7', 230000, 'Lê Văn Lương, Quận 7', 'Sân cỏ tự nhiên mini', 'images/sanbong3.jpg'),
(10, 'Sân 2', 'Quận 7', 200000, '580 Lê Văn Lương, Tân Phong, Quận 7', 'Sân cỏ tự nhiên mini', 'images/sanbong6.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `trangthai`
--

CREATE TABLE `trangthai` (
  `idTT` int(10) NOT NULL,
  `MaSan` int(10) NOT NULL,
  `TrangThai` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `NgayDat` char(12) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `trangthai`:
--   `MaSan`
--       `san` -> `MaSan`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `IdUser` int(10) NOT NULL,
  `UserName` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `FirstName` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `LastName` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Email` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Sdt` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `Address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Pass` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Role` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Avt` char(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `user`:
--

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`IdUser`, `UserName`, `FirstName`, `LastName`, `Email`, `Sdt`, `Address`, `Pass`, `Role`, `Avt`) VALUES
(13, 'tanhoang', 'Hoàng Thủy', 'Tần', 'tanthuyhoang@gmail.com', '0873268673', 'Quận 2', '$2y$10$SnVd0gsQrMCPkOTj4KCXg.PHK4imh7qKTRGEHRL4gq949Js90Syv.', 'Customer', 'img/nắng cf.jpg'),
(14, 'tanhoang', 'Hoàng', 'Tần', 'tanhoang@gmail.com', '0873268673', 'Quận 2', '$2y$10$ywsM21eQ7pPpwnrJJfeeZue9dwfr0T4bjl6.FslxtWR4xyjpNpuHm', 'Customer', 'img/đồi chè.jpg'),
(15, 'hoangmung', 'Hoàng', 'Mừng', 'mung@gmail.com', '0873268673', 'Quận 4', '$2y$10$7a3zptqhZrTIlXukVd9EtudFql3FkD.hETK57BXQfmyLWp3/4ANmq', 'Customer', 'img/đvc.jpg');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `datsan`
--
ALTER TABLE `datsan`
  ADD PRIMARY KEY (`idHoaDon`),
  ADD KEY `MaSan` (`MaSan`),
  ADD KEY `IdUser` (`IdUser`);

--
-- Chỉ mục cho bảng `san`
--
ALTER TABLE `san`
  ADD PRIMARY KEY (`MaSan`);

--
-- Chỉ mục cho bảng `trangthai`
--
ALTER TABLE `trangthai`
  ADD PRIMARY KEY (`idTT`),
  ADD KEY `MaSan` (`MaSan`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`IdUser`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `datsan`
--
ALTER TABLE `datsan`
  MODIFY `idHoaDon` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `san`
--
ALTER TABLE `san`
  MODIFY `MaSan` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `trangthai`
--
ALTER TABLE `trangthai`
  MODIFY `idTT` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `IdUser` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `datsan`
--
ALTER TABLE `datsan`
  ADD CONSTRAINT `datsan_ibfk_2` FOREIGN KEY (`MaSan`) REFERENCES `san` (`MaSan`),
  ADD CONSTRAINT `datsan_ibfk_3` FOREIGN KEY (`IdUser`) REFERENCES `user` (`IdUser`);

--
-- Các ràng buộc cho bảng `trangthai`
--
ALTER TABLE `trangthai`
  ADD CONSTRAINT `trangthai_ibfk_1` FOREIGN KEY (`MaSan`) REFERENCES `san` (`MaSan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
