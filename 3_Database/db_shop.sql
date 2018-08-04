-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 04, 2018 at 02:01 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `id_bill` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `date_order` datetime DEFAULT NULL,
  `total` float DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`id_bill`, `id`, `date_order`, `total`, `note`) VALUES
(1, 1, '2018-07-14 21:57:13', 2490000, 'Nhanh chóng'),
(2, 4, '2018-08-01 00:00:00', 9000000, 'Ghi chú ở đây'),
(4, NULL, '2018-08-04 07:55:21', 0, NULL),
(5, 4, '2018-08-04 10:52:25', 11672000, NULL),
(6, 4, '2018-08-04 11:10:28', 11672000, NULL),
(7, 4, '2018-08-04 11:11:48', 17162000, NULL),
(8, 4, '2018-08-04 11:40:32', 21760000, NULL),
(9, 4, '2018-08-04 03:41:50', 15090000, NULL),
(10, 25, '2018-08-04 04:00:46', 60676000, NULL),
(11, 25, '2018-08-04 04:01:51', 60676000, NULL),
(12, 25, '2018-08-04 04:02:51', 3929000, NULL),
(13, 25, '2018-08-04 04:02:51', 3929000, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bill_detail`
--

CREATE TABLE `bill_detail` (
  `id_bill_detail` int(11) NOT NULL,
  `id_bill` int(11) DEFAULT NULL,
  `id_product` int(11) DEFAULT NULL,
  `quantity` float DEFAULT NULL,
  `price` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `bill_detail`
--

INSERT INTO `bill_detail` (`id_bill_detail`, `id_bill`, `id_product`, `quantity`, `price`) VALUES
(1, 2, 11, 3, 76680000),
(28, 5, 8, 2, 5649000),
(29, 5, 9, 1, 6023000),
(30, 6, 8, 2, 5649000),
(31, 6, 9, 1, 6023000),
(32, 7, 8, 2, 5649000),
(33, 7, 9, 1, 6023000),
(34, 7, 1, 3, 5490000),
(35, 8, 8, 2, 5649000),
(36, 8, 9, 2, 6023000),
(37, 8, 1, 3, 5490000),
(38, 8, 15, 1, 4598000),
(39, 9, 10, 3, 3929000),
(40, 9, 14, 4, 11161000),
(41, 10, 10, 3, 3929000),
(42, 10, 14, 4, 11161000),
(43, 10, 21, 1, 45586000),
(44, 11, 10, 3, 3929000),
(45, 11, 14, 4, 11161000),
(46, 11, 21, 1, 45586000),
(47, 12, 10, 1, 3929000),
(48, 13, 10, 1, 3929000);

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `id_image` int(11) NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_product` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`id_image`, `link`, `id_product`) VALUES
(5, 'bongtai1_1.png', 5),
(9, 'bongtai1_2.png', 5),
(10, 'bongtai2_1.png', 6),
(11, 'bongtai2_2.png', 6),
(12, 'bongtai3_1.png', 7),
(13, 'bongtai5_1.png', 9),
(14, 'bongtai5_2.png', 9),
(15, 'bongtai4_1.png', 8),
(16, 'dongho1_1.jpg', 1),
(17, 'dongho1_2.jpg', 1),
(18, 'dongho2_1.png', 2),
(19, 'dongho2_2.png', 2),
(20, 'dongho3_1.jpg', 3),
(21, 'dongho3_2.jpg', 3),
(22, 'dongho4_1.jpg', 4),
(23, 'dongho4_2.jpg', 4),
(24, 'daychuyen1_1.jpg', 10),
(25, 'daychuyen1_2.jpg', 10),
(26, 'daychuyen2_1.png', 11),
(27, 'daychuyen2_2.png', 11),
(28, 'daychuyen3_1.png', 12),
(29, 'daychuyen3_2.png', 12),
(30, 'daychuyen4_1.jpg', 13),
(31, 'daychuyen5_1.jpg', 14),
(32, 'nhan1_1.png', 15),
(33, 'nhan1_2.png', 15),
(34, 'nhan2_1.jpg', 16),
(35, 'nhan3_1.jpg', 17),
(36, 'nhan4_1.png', 18),
(37, 'nhan4_2.png', 18),
(38, 'nhan5_1.png', 19),
(39, 'nhan5_2.png', 19),
(40, 'vongtay1_1.jpg', 20),
(41, 'vongtay1_2.jpg', 20),
(42, 'vongtay2_1.png', 21),
(43, 'vongtay3_1.png', 22),
(44, 'vongtay3_2.png', 22),
(45, 'vongtay4_1.png', 23),
(46, 'vongtay4_2.png', 23),
(47, 'vongtay5_1.png', 24),
(48, 'vongtay5_2.png', 24),
(49, 'bongtai3_2.png', 7),
(50, 'bongtai4_2.jpg', 8),
(51, 'daychuyen4_2.jpg', 13),
(52, 'daychuyen5_2.jpg', 14),
(53, 'nhan2_2.jpg', 16),
(54, 'nhan3_2.jpg', 17),
(55, 'vongtay2_2.png', 21);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id_product` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_type` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id_product`, `name`, `id_type`, `price`, `description`) VALUES
(1, 'ĐỒNG HỒ NAM DÂY DA CHỐNG NƯỚC TISSOT', 4, 5490000, 'Các dòng đồng hồ của Tissot nổi tiếng luôn chú trọng đến thiết kế và chất lượng trong từng sản phẩm. Không quá cầu kì, không quá đặc sắc, đồng hồ Tissot T033.410.16.053.01 là sự lựa chọn hàng đầu cho phái mạnh, được chế tác từ chất liệu và linh kiện cao cấp cùng thiết kế tinh tế mang đến cho phái mạnh phong cách thời lịch lãm và cá tính.'),
(2, 'ĐỒNG HỒ NỮ DÂY THÉP KHÔNG GỈ CHỐNG NƯỚC SKAGEN', 4, 3650000, 'Đồng hồ nữ Skagen 358SSSD với mặt hình tròn phù hợp với nhiều độ tuổi mang lại cảm giác trẻ trung năng động. Đồng thời dây đeo có thiết kế dạng lưới cùng với màu bạc đặc trưng Skagen tạo nên sự khác biệt rõ nét tuy đơn giản nhưng không hề đơn điệu. Đây sẽ là món phụ kiện không thể thiếu trong tủ đồ của bạn.'),
(3, 'ĐỒNG HỒ NỮ DÂY THÉP KHÔNG GỈ CHỐNG NƯỚC CITIZEN FE1081.59E', 4, 5880000, 'Citizen là một thương hiệu đồng hồ nổi tiếng tại Nhật Bản. Cùng với công nghệ Eco-Drive tiên tiến, Citizen đã càng ngày càng được người tiêu dùng lựa chọn và tin tưởng. Điển hình trong bộ sản phẩm của thương hiệu này chính là chiếc đồng hồ nữ dây thép không gỉ chống nước. Citizen FE1081.59E với một thiết kế cổ điển, cùng những chi tiết được chăm chút tỉ mỉ, thể hiện nét quý phái nhưng không kém phần mạnh mẽ dành cho phái đẹp.'),
(4, 'ĐỒNG HỒ NAM DÂY THÉP KHÔNG GỈ CHỐNG NƯỚC TISSOT T086.407.11.061.10', 4, 26710000, 'Tissot là thương hiệu đồng hồ sang trọng nổi tiếng tại Thụy Sỹ, doanh số bán hàng của đồng hồ Tissot đạt đến con số “khổng lồ” và luôn đứng top đầu của tập đoàn Swatch Group. Tại Việt Nam, đồng hồ Tissot chính hãng là niềm mơ ước của rất nhiều khách hàng, nét đặc trưng của đồng hồ Tissot đó là thiết kế có sự pha lẫn giữa cổ điển và hiện đại, đã tạo nên những mẫu đồng hồ Tissot nam và đồng hồ Tissot nữ luôn cuốn hút bởi vẻ đẹp sang trọng, lịch lãm và tao nhã nhất.....” Bộ máy Automatic (tự động) của đồng hồ sử dụng công nghệ Powermatic 80. Khi đồng hồ được nạp đầy năng lượng, công nghệ Powermatic 80 giúp cho đồng hồ có khả năng dự trữ năng lượng và hoạt động bình thường trong suốt 80 giờ khi người sử dụng không đeo. Đồng hồ này được chứng nhận CHRONOMETER \"Đồng hồ chạy chính xác\" bởi hiệp hội COSC (Contrôle official Suisse des Chronomètres) cơ quan kiểm định chất lượng chính thức của Thụy Sĩ.'),
(5, 'BÔNG TAI KIM CƯƠNG PNJ VÀNG TRẮNG 14K 57853.5A0', 1, 20924000, 'Bông tai, chất liệu vàng trắng 14K\r\nGiá bán sản phẩm mang tính chất tham khảo.\r\nGiá bán sẽ thay đổi tương ứng khi trọng lượng vàng và Kim Cương thay đổi.\r\nKhi Đơn Hàng thành công, SHOP sẽ xác nhận và báo giá chính xác tương ứng trọng lượng vàng thực tế của sản phẩm hiện có.\r\nSHOP Shopping Online sẽ lấy sản phẩm với giá bán thực tế tại cửa hàng tương ứng trọng lượng vàng cụ thể báo lại cho khách hàng và hưởng chính sách ưu đãi trên online.'),
(6, 'BÔNG TAI PNJ VÀNG TRẮNG 10K ĐÍNH ĐÁ ECZ 46980.106', 1, 2490000, 'Bông tai PNJ vàng trắng thuộc dòng trang sức ECZ - Excellent Cubic Zirconia của PNJ được làm từ vàng trắng 10K (41,6% vàng nguyên chất) và đá Swarovski Zirconia nhập khẩu chính từ SWAROVSKI GEM. Những viên đá Swarovski Zirconia có độ trong suốt, cắt mài hoàn hảo và tán sắc rực rỡ như kim cương sẽ mang đến một vẻ đẹp cuốn hút, hiện đại và sang trọng. Bông tai vàng trắng 10K được xem là mảnh ghép tuyệt vời dành cho các quý cô.'),
(7, 'BÔNG TAI PNJ VÀNG TRẮNG 10K ĐÍNH ĐÁ ECZ 77194.106', 1, 2752000, 'Dòng trang sức ECZ - Excellent Cubic Zirconia của PNJ được làm từ vàng 10K (41,6% vàng nguyên chất) và đá Swarovski Zirconia nhập khẩu chính từ SWAROVSKI GEMTM .Những viên đá Swarovski Zirconia có độ trong suốt, cắt mài hoàn hảo và tán sắc rực rỡ như kim cương sẽ mang đến một vẻ đẹp cuốn hút, hiện đại và sang trọng.'),
(8, 'BÔNG TAI PNJ VÀNG TRẮNG 14K ĐÍNH ĐÁ TOPAZ 72642.600', 1, 5649000, 'Bông tai, chất liệu vàng trắng 14K, gắn 2 viên Topaz và đá CZ\r\nGiá bán sản phẩm chỉ mang tính chất tham khảo phụ thuộc vào trọng lượng vàng và thuộc tính của đá. \r\nKhi Đơn Hàng thành công, SHOP sẽ xác nhận và lấy sản phẩm với giá bán thực tế tại cửa hàng tương ứng trọng lượng vàng cụ thể báo lại cho khách hàng và hưởng chính sách ưu đãi trên online.'),
(9, 'BÔNG TAI PNJ VÀNG 18K đính đá Citrine', 1, 6023000, 'Bông tai PNJ Vàng 18K đính đá Citrine. Thông số(Giới tính: Nữ, Màu đá chính: Vàng, Loại đá chính: Citrine, Màu chất liệu: Vàng + Trắng, Tuổi vàng: Vàng 18K, Chất liệu: Vàng, Chủng loại: Bông tai)'),
(10, 'DÂY CHUYỀN PNJ VÀNG TRẮNG 14K ĐÍNH ĐÁ TOPAZ 74852.600', 2, 3929000, 'Topaz từng được biết đến như một loại đá của tình yêu và sự thành công. Đằng sau viên đá này không chỉ là những câu chuyện được lưu truyền từ thời xa xưa mà nó còn mang nhiều ý nghĩa khác nhau. Vậy nên bạn có thể dành tặng cho bản thân mình một mặt dây chuyền PNJ Vàng Trắng 14K đính đá Topaz để thể hiện được phong cách thời trang kiêu sa của riêng mình.'),
(11, 'DÂY CHUYỀN PNJ VÀNG TRẮNG Ý 18K ĐÍNH ĐÁ CZ 77930.102', 2, 4238000, 'Vàng trắng Ý là xu hướng thời trang được ưa chuộng trên thế giới vài năm gần đây bởi tính hữu dụng, kinh tế và vẻ đẹp thuần khiết cao quý. Trong kỹ nghệ chế tác trang sức, vàng trắng được xem là một phát minh có giá trị cao về “gu” thẩm mỹ cho phái đẹp. Và mề đay PNJ vàng trắng Ý 18K được thiết kế trẻ trung với kiểu dáng nhỏ xinh thích hợp với mọi bạn gái, điểm tô nét đẹp nữ tính, thời thượng và đậm thời trang'),
(12, 'DÂY CHUYỀN PNJ VÀNG 18K ĐÍNH ĐÁ RUBY 71609.600', 2, 4098000, 'Mặt dây chuyền, chất liệu vàng 18K, gắn 1 viên Ruby\r\n(Giá bán mang tính chất tham khảo, giá sản phẩm sẽ thay đổi tương ứng khi trọng lượng vàng thay đổi).\r\nGiá bán không bao gồm sợi dây chuyền.\r\nKhi Đơn Hàng thành công, Shop sẽ xác nhận và lấy sản phẩm với giá bán thực tế tại cửa hàng tương ứng trọng lượng vàng cụ thể báo lại cho khách hàng và hưởng chính sách ưu đãi trên online'),
(13, 'DÂY CHUYỀN PNJ VÀNG TRẮNG 10K ĐÍNH ĐÁ ECZ 60413.106', 2, 2312000, 'Dòng trang sức ECZ - Excellent Cubic Zirconia của PNJ được làm từ vàng 10K (41,6% vàng nguyên chất) và đá Swarovski Zirconia nhập khẩu chính từ SWAROVSKI GEMTM .Những viên đá Swarovski Zirconia có độ trong suốt, cắt mài hoàn hảo và tán sắc rực rỡ như kim cương sẽ mang đến một vẻ đẹp cuốn hút, hiện đại và sang trọng.'),
(14, 'DÂY CHUYỀN PNJ VÀNG TRẮNG 14K ĐÍNH ĐÁ TOPAZ 78306.600', 2, 11161000, 'Kết hợp hoàn hảo giữa phong cách lãng mạn phương Đông với nét phóng khoáng, quyến rũ phương Tây. Dòng trang sức Happiness được làm từ vàng 18K, 14K đính kim cương, đá quý, ECZ,... với mỗi sắc màu là một thông điệp riêng, gắn liền với những khoảnh khắc Hạnh phúc thăng hoa trong cuộc đời người phụ nữ.'),
(15, 'NHẪN PNJ VÀNG TRẮNG 10K ĐÍNH ĐÁ ECZ 80824.106', 3, 4598000, 'Mỗi cô gái từ xưa đều được ví von như một bức tranh đa sắc. Họ thường không có một mẫu số chung nào trong những nét cá tính độc đáo của bản thân. Vẻ đẹp người con gái có không ít các tác phẩm sáng tác nghệ thuật coi nó như bông hoa rạng ngời. “Hoa” vừa xinh đẹp, vừa quý phái, tựa như một người con gái vậy. Vì thế PNJ cũng đã lấy cảm hứng từ “hoa” và cho ra mắt chiếc nhẫn vàng trắng 10K đính đá ECZ, để gửi gắm đến các cô nàng một thông điệp “hãy luôn rạng rỡ và đầy sức sống như hoa PNJ nhé”'),
(16, 'NHẪN KIM CƯƠNG PNJ VÀNG TRẮNG 14K 84433.501', 3, 46934000, 'ãi trường tồn cùng thời gian. Các tuyệt tác trang sức Kim Cương PNJ không chỉ tôn vinh vẻ đẹp mà còn khẳng định phong cách, đẳng cấp, niềm đam mê và mang lại thành công cho chủ nhân'),
(17, 'NHẪN KIM CƯƠNG PNJ VÀNG TRẮNG 14K 84363.500', 3, 76680000, 'Thương hiệu: PNJ. Loại đá chính: Kim cương. Màu đá chính: Trắng. Hình dạng đá: Tròn. Loại đá phụ (nếu có): Kim cương. Cut (Giác cắt/ Hình dạng kim cương): 57 Carat (Trọng lượng kim cương): 4.8 ly'),
(18, 'Nhẫn Cưới  Kim Cương nam PNJ Long Phụng Vàng 18K 77165.5A0Nhẫn Cưới  Kim Cương nam PNJ Long Phụng ', 3, 9835000, 'Nhẫn Cưới Long Phụng” Lấy cảm hứng từ hình ảnh Rồng – Phượng biểu trưng cho nghĩa phu thê, kết hợp nghệ thuật cách điệu hoàn hảo tạo nên nhẫn cưới'),
(19, '\r\nNhẫn cưới Kim cương PNJ Chung Đôi Vàng trắng 14K 20664.5A2Nhẫn cưới Kim cương PNJ Chung Đôi Vàng t', 3, 6677000, '\"Nhẫn Cưới Chung Đôi\" với kiểu dáng tinh xảo, hài hòa đến từng đường nét, nhẫn cưới với thiết kế nhẫn nam và nhẫn nữ đồng nhất nói lên sự đồng cảm sẻ '),
(20, 'VÒNG TAY CHARM PNJ TỲ HƯU THIÊN LỘC VÀNG 24K DÂY MÀU ĐỎ 05970.000', 5, 4920000, 'Ngày nay, việc mang trong mình món trang sức phụ kiện phong thuỷ rất là phổ biến, nó không chỉ mang đến niềm tin rằng khi mang chúng thì chủ nhân luôn đạt được nhiều điều may mắn, tránh tai ương và giúp cho họ đạt được nhiều thành công hơn trong cuộc sống. Với vòng tay charm Tỳ hưu phong thủy PNJ, với thiết kế là linh vật Tỳ Hưu mà chúng ta có thể bắt gặp ở khắp mọi nơi mang trong mình ý nghĩa tốt lành và nó cũng sẽ là món quà tặng hoàn hảo mang trong mình đầy ý nghĩa đặc biệt và tốt đẹp, đem đến điềm lành và may mắn cho chủ nhân.'),
(21, 'VÒNG TAY PNJ VÀNG TRẮNG 14K ĐÍNH ĐÁ TOPAZ 80254.600', 5, 45586000, 'Chiếc vòng đeo tay đính đá quý như Ruby, Topaz, Sapphire,Citrine,.. của PNJ mang trong mình các ý ... Vòng tay PNJ Vàng trắng 14K đính đá Topaz 80254.600.'),
(22, 'LẮC TAY PNJ VÀNG TRẮNG Ý 18K 81028.102', 5, 13935000, 'Vòng tay nữ, Chất liệu vàng trắng Italia, vàng 18K, gắn đá trắng: 48 viên 1.25 ly + 208 viên 1.0 ly.'),
(23, 'LẮC TAY PNJ VÀNG TRẮNG 14K ĐÍNH ĐÁ AMETHYST 53031.600', 5, 14135000, 'Lắc, chất liệu vàng 14K\r\nGiá sản phẩm chỉ mang tính chất tham khảo, phụ thuộc vào trọng lượng vàng và thuộc tính của đá.\r\nKhi Đơn Hàng thành công, PNJ sẽ xác nhận và lấy sản phẩm với giá bán thực tế tại cửa hàng tương ứng trọng lượng vàng cụ thể báo lại cho khách hàng và hưởng chính sách ưu đãi trên online.'),
(24, '\r\nVòng tay PNJ vàng trắng 14K đính đá TopazVòng tay PNJ vàng trắng 14K đính đá TopazVòng tay PNJ vàn', 5, 12882000, 'Vòng tay, chất liệu vàng 14K, gắn đá Topaz.\r\nGiá bán sản phẩm mang tính chất tham khảo, phụ thuộc trọng lượng vàng và thuộc tính của đá.\r\nKhi Đơn Hàng thành công, PNJ sẽ xác nhận và báo giá chính xác tương ứng trọng lượng vàng thực tế của sản phẩm hiện có.\r\nPNJ Shopping Online sẽ lấy sản phẩm với giá bán thực tế tại cửa hàng tương ứng trọng lượng vàng cụ thể báo lại cho khách hàng và hưởng chính sách ưu đãi trên online.');

-- --------------------------------------------------------

--
-- Table structure for table `product_type`
--

CREATE TABLE `product_type` (
  `id_type` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_type`
--

INSERT INTO `product_type` (`id_type`, `name`, `image`) VALUES
(1, 'Bông tai', 'bongtai.png'),
(2, 'Dây chuyền', 'daychuyen.png'),
(3, 'Nhẫn', 'nhan.png'),
(4, 'Đồng hồ', 'dongho.png'),
(5, 'Vòng tay', 'vongtay.png');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `phone` char(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `address`, `phone`, `password`) VALUES
(1, 'BÙI THỊ TÀI', 'taibuiqn@gmail.com', '2/7C Đường 106, Tăng Nhơn Phú A, Quận 9, HCM', '0967439321', 'taibui'),
(2, 'LÊ THỊ THẢO', 'thaole#gmail.com', '56/7 Trường Chinh, Gò Vấp, HCM', '0987454567', 'thaole'),
(3, 'Vo Thanh Tien', 'thanhtien@gmail.com', NULL, NULL, 'e10adc3949ba59abbe56e057f20f883e'),
(4, 'Bui Thị Tai', 'tientai@gmail.com', ' 25 Trường Văn Thành, Hiệp Phú, Quận 9, HCM\Z', '0967439321', '202cb962ac59075b964b07152d234b70'),
(5, 'thanhthu', 'thanhthu@gmail.com', NULL, NULL, '202cb962ac59075b964b07152d234b70'),
(6, 'thanhthuy', 'thanhthuy@gmail.com', '12 đường 106, HP, Q9, HCM', '0967439321', '202cb962ac59075b964b07152d234b70'),
(16, 'a', 'a', 'a', 'a', '0cc175b9c0f1b6a831c399e269772661'),
(21, 'b', 'b', 'b', 'b', '92eb5ffee6ae2fec3ad71c777531578f'),
(23, 'b', 'gf', 'b', 'b', '92eb5ffee6ae2fec3ad71c777531578f'),
(24, 'Vo Thanh Tien', 'thanhtien91@gmail.com', '2/7C 106, Tang Nhon Phu A, Quan 9, HCM', '0932134194', '202cb962ac59075b964b07152d234b70'),
(25, 'Bui Thi Tai', 'taibui@gmail.com', '25/25A Truong Van Thanh, Hiep Phu, Quan 9, HCM', '0967439321', '202cb962ac59075b964b07152d234b70');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id_bill`),
  ADD KEY `FK_bill_user` (`id`);

--
-- Indexes for table `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD PRIMARY KEY (`id_bill_detail`),
  ADD KEY `FK_billdetail_product` (`id_product`),
  ADD KEY `FK_billdetail_bill` (`id_bill`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id_image`),
  ADD KEY `FK_image_product` (`id_product`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `FK_product_producttype` (`id_type`);

--
-- Indexes for table `product_type`
--
ALTER TABLE `product_type`
  ADD PRIMARY KEY (`id_type`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `id_bill` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `bill_detail`
--
ALTER TABLE `bill_detail`
  MODIFY `id_bill_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `id_image` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `FK_bill_user` FOREIGN KEY (`id`) REFERENCES `user` (`id`);

--
-- Constraints for table `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD CONSTRAINT `FK_billdetail_bill` FOREIGN KEY (`id_bill`) REFERENCES `bill` (`id_bill`),
  ADD CONSTRAINT `FK_billdetail_product` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`);

--
-- Constraints for table `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `FK_image_product` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_product_producttype` FOREIGN KEY (`id_type`) REFERENCES `product_type` (`id_type`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
