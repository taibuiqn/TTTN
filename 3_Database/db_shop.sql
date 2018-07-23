/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 10.1.32-MariaDB : Database - db_shop
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_shop` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `db_shop`;

/*Table structure for table `bill` */

DROP TABLE IF EXISTS `bill`;

CREATE TABLE `bill` (
  `id_bill` int(11) NOT NULL AUTO_INCREMENT,
  `id_customer` int(11) DEFAULT NULL,
  `date_order` datetime DEFAULT NULL,
  `total` float DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id_bill`),
  KEY `FK_bill_customer` (`id_customer`),
  CONSTRAINT `FK_bill_customer` FOREIGN KEY (`id_customer`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `bill` */

insert  into `bill`(`id_bill`,`id_customer`,`date_order`,`total`,`note`) values (1,1,'2018-07-14 21:57:13',2490000,'Nhanh chóng');

/*Table structure for table `bill_detail` */

DROP TABLE IF EXISTS `bill_detail`;

CREATE TABLE `bill_detail` (
  `id_bill_detail` int(11) NOT NULL AUTO_INCREMENT,
  `id_bill` int(11) DEFAULT NULL,
  `id_product` int(11) DEFAULT NULL,
  `quantity` float DEFAULT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`id_bill_detail`),
  KEY `FK_billdetail_product` (`id_product`),
  KEY `FK_billdetail_bill` (`id_bill`),
  CONSTRAINT `FK_billdetail_bill` FOREIGN KEY (`id_bill`) REFERENCES `bill` (`id_bill`),
  CONSTRAINT `FK_billdetail_product` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `bill_detail` */

/*Table structure for table `image` */

DROP TABLE IF EXISTS `image`;

CREATE TABLE `image` (
  `id_image` int(11) NOT NULL AUTO_INCREMENT,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_product` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_image`),
  KEY `FK_image_product` (`id_product`),
  CONSTRAINT `FK_image_product` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `image` */

insert  into `image`(`id_image`,`link`,`id_product`) values (1,'https://www.pnj.com.vn/images/detailed/26/T033.410.16.053.01-dong-ho-tissot-pnj.jpg',1),(2,'https://www.pnj.com.vn/images/detailed/26/WKF11T01653.000.jpg',2),(3,'https://www.pnj.com.vn/images/detailed/27/WBE11D02403.000.jpg',3),(4,'https://www.pnj.com.vn/images/detailed/28/WDP11K03111.000.jpg',4),(5,'https://www.pnj.com.vn/images/detailed/41/gbdrwa57853.5a0-bong-tai-kim-cuong-pnj-vang-trang-14k.jpg',5),(6,'https://www.pnj.com.vn/images/content/trang-suc-vang/bong-tai/gbdrwb46980.106-bong-tai-pnj-vang-trang-10k-dinh-da-ecz-001.jpg?1530438978822',6),(7,'https://www.pnj.com.vn/images/detailed/27/GBDRWB77194.106.jpg',7),(8,'https://www.pnj.com.vn/images/detailed/27/GBDRWA72642.600.jpg',8);

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id_product` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_type` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id_product`),
  KEY `FK_product_producttype` (`id_type`),
  CONSTRAINT `FK_product_producttype` FOREIGN KEY (`id_type`) REFERENCES `product_type` (`id_type`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `product` */

insert  into `product`(`id_product`,`name`,`id_type`,`price`,`description`) values (1,'ĐỒNG HỒ NAM DÂY DA CHỐNG NƯỚC TISSOT',4,5490000,'Các dòng đồng hồ của Tissot nổi tiếng luôn chú trọng đến thiết kế và chất lượng trong từng sản phẩm. Không quá cầu kì, không quá đặc sắc, đồng hồ Tissot T033.410.16.053.01 là sự lựa chọn hàng đầu cho phái mạnh, được chế tác từ chất liệu và linh kiện cao cấp cùng thiết kế tinh tế mang đến cho phái mạnh phong cách thời lịch lãm và cá tính.'),(2,'ĐỒNG HỒ NỮ DÂY THÉP KHÔNG GỈ CHỐNG NƯỚC SKAGEN',4,3650000,'Đồng hồ nữ Skagen 358SSSD với mặt hình tròn phù hợp với nhiều độ tuổi mang lại cảm giác trẻ trung năng động. Đồng thời dây đeo có thiết kế dạng lưới cùng với màu bạc đặc trưng Skagen tạo nên sự khác biệt rõ nét tuy đơn giản nhưng không hề đơn điệu. Đây sẽ là món phụ kiện không thể thiếu trong tủ đồ của bạn.'),(3,'ĐỒNG HỒ NỮ DÂY THÉP KHÔNG GỈ CHỐNG NƯỚC CITIZEN FE1081.59E',4,5880000,'Citizen là một thương hiệu đồng hồ nổi tiếng tại Nhật Bản. Cùng với công nghệ Eco-Drive tiên tiến, Citizen đã càng ngày càng được người tiêu dùng lựa chọn và tin tưởng. Điển hình trong bộ sản phẩm của thương hiệu này chính là chiếc đồng hồ nữ dây thép không gỉ chống nước. Citizen FE1081.59E với một thiết kế cổ điển, cùng những chi tiết được chăm chút tỉ mỉ, thể hiện nét quý phái nhưng không kém phần mạnh mẽ dành cho phái đẹp.'),(4,'ĐỒNG HỒ NAM DÂY THÉP KHÔNG GỈ CHỐNG NƯỚC TISSOT T086.407.11.061.10',4,26710000,'Tissot là thương hiệu đồng hồ sang trọng nổi tiếng tại Thụy Sỹ, doanh số bán hàng của đồng hồ Tissot đạt đến con số “khổng lồ” và luôn đứng top đầu của tập đoàn Swatch Group. Tại Việt Nam, đồng hồ Tissot chính hãng là niềm mơ ước của rất nhiều khách hàng, nét đặc trưng của đồng hồ Tissot đó là thiết kế có sự pha lẫn giữa cổ điển và hiện đại, đã tạo nên những mẫu đồng hồ Tissot nam và đồng hồ Tissot nữ luôn cuốn hút bởi vẻ đẹp sang trọng, lịch lãm và tao nhã nhất.....” Bộ máy Automatic (tự động) của đồng hồ sử dụng công nghệ Powermatic 80. Khi đồng hồ được nạp đầy năng lượng, công nghệ Powermatic 80 giúp cho đồng hồ có khả năng dự trữ năng lượng và hoạt động bình thường trong suốt 80 giờ khi người sử dụng không đeo. Đồng hồ này được chứng nhận CHRONOMETER \"Đồng hồ chạy chính xác\" bởi hiệp hội COSC (Contrôle official Suisse des Chronomètres) cơ quan kiểm định chất lượng chính thức của Thụy Sĩ.'),(5,'BÔNG TAI KIM CƯƠNG PNJ VÀNG TRẮNG 14K 57853.5A0',1,20924000,'Bông tai, chất liệu vàng trắng 14K\r\nGiá bán sản phẩm mang tính chất tham khảo.\r\nGiá bán sẽ thay đổi tương ứng khi trọng lượng vàng và Kim Cương thay đổi.\r\nKhi Đơn Hàng thành công, SHOP sẽ xác nhận và báo giá chính xác tương ứng trọng lượng vàng thực tế của sản phẩm hiện có.\r\nSHOP Shopping Online sẽ lấy sản phẩm với giá bán thực tế tại cửa hàng tương ứng trọng lượng vàng cụ thể báo lại cho khách hàng và hưởng chính sách ưu đãi trên online.'),(6,'BÔNG TAI PNJ VÀNG TRẮNG 10K ĐÍNH ĐÁ ECZ 46980.106',1,2490000,'Bông tai PNJ vàng trắng thuộc dòng trang sức ECZ - Excellent Cubic Zirconia của PNJ được làm từ vàng trắng 10K (41,6% vàng nguyên chất) và đá Swarovski Zirconia nhập khẩu chính từ SWAROVSKI GEM. Những viên đá Swarovski Zirconia có độ trong suốt, cắt mài hoàn hảo và tán sắc rực rỡ như kim cương sẽ mang đến một vẻ đẹp cuốn hút, hiện đại và sang trọng. Bông tai vàng trắng 10K được xem là mảnh ghép tuyệt vời dành cho các quý cô.'),(7,'BÔNG TAI PNJ VÀNG TRẮNG 10K ĐÍNH ĐÁ ECZ 77194.106',1,2752000,'Dòng trang sức ECZ - Excellent Cubic Zirconia của PNJ được làm từ vàng 10K (41,6% vàng nguyên chất) và đá Swarovski Zirconia nhập khẩu chính từ SWAROVSKI GEMTM .Những viên đá Swarovski Zirconia có độ trong suốt, cắt mài hoàn hảo và tán sắc rực rỡ như kim cương sẽ mang đến một vẻ đẹp cuốn hút, hiện đại và sang trọng.'),(8,'BÔNG TAI PNJ VÀNG TRẮNG 14K ĐÍNH ĐÁ TOPAZ 72642.600',1,5649000,'Bông tai, chất liệu vàng trắng 14K, gắn 2 viên Topaz và đá CZ\r\nGiá bán sản phẩm chỉ mang tính chất tham khảo phụ thuộc vào trọng lượng vàng và thuộc tính của đá. \r\nKhi Đơn Hàng thành công, SHOP sẽ xác nhận và lấy sản phẩm với giá bán thực tế tại cửa hàng tương ứng trọng lượng vàng cụ thể báo lại cho khách hàng và hưởng chính sách ưu đãi trên online.');

/*Table structure for table `product_type` */

DROP TABLE IF EXISTS `product_type`;

CREATE TABLE `product_type` (
  `id_type` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `product_type` */

insert  into `product_type`(`id_type`,`name`,`image`) values (1,'BONG TAI','bongtai.jpg'),(2,'Dây chuyền','daychuyen.jpg'),(3,'Nhẫn','nhan.jpg'),(4,'Đồng hồ','dongho.jpg'),(5,'Vòng tay','vongtay.jpg');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `phone` char(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user` */

insert  into `user`(`id`,`name`,`email`,`address`,`phone`,`password`) values (1,'BÙI THỊ TÀI','taibuiqn@gmail.com','2/7C Đường 106, Tăng Nhơn Phú A, Quận 9, HCM','0967439321','taibui'),(2,'LÊ THỊ THẢO','thaole#gmail.com','56/7 Trường Chinh, Gò Vấp, HCM','0987454567','thaole');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
