-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 16, 2022 at 01:10 AM
-- Server version: 8.0.22
-- PHP Version: 7.3.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pathtask`
--

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int NOT NULL,
  `order_code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_date` datetime NOT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `order_code`, `address`, `shipping_date`, `user_id`) VALUES
(1, 'askl5jdlkavq8', 'Keas 69 Str.\r\n15234, Chalandri\r\nAthens,\r\nGreece', '2022-04-22 17:15:30', 1),
(2, 'dsdfjmvyb54', 'Dummy Address\r\nLorem Ipsum Sit Amet\r\nDummy Pin\r\nDummy place\r\nTelephone : 1-800-123-4567\r\nEmail : info@dummy.com', '2022-04-29 23:50:26', 1),
(3, 'sdfkokcs5158', 'Yeni Adres55 Choriner Straße 4910435 BerlinE-Mail: moinsen2@blindtextgenerator.com', '2025-12-21 09:34:47', 1),
(4, 'sdfkokcs5158', 'DieSachbearbeiter Choriner Straße 4910435 BerlinE-Mail: moinsen2@blindtextgenerator.com', '2025-12-21 09:34:47', 1),
(5, 'sdfkokcs5158', 'DieSachbearbeiter Choriner Straße 4910435 BerlinE-Mail: moinsen2@blindtextgenerator.com', '2025-12-21 09:34:47', 1),
(6, 'sdfkokcs5158', 'DieSachbearbeiter Choriner Straße 4910435 BerlinE-Mail: moinsen2@blindtextgenerator.com', '2025-12-21 09:34:47', 1),
(7, 'sdfkokcs5158', 'DieSachbearbeiter Choriner Straße 4910435 BerlinE-Mail: moinsen2@blindtextgenerator.com', '2025-12-21 09:34:47', 1),
(8, 'sdfkokcs5158', 'DieSachbearbeiter Choriner Straße 4910435 BerlinE-Mail: moinsen2@blindtextgenerator.com', '2025-12-21 09:34:47', 1),
(9, 'sdfkokcs5158', 'DieSachbearbeiter Choriner Straße 4910435 BerlinE-Mail: moinsen2@blindtextgenerator.com', '2025-12-21 09:34:47', 1),
(10, 'sdfkokcs5158', 'DieSachbearbeiter Choriner Straße 4910435 BerlinE-Mail: moinsen2@blindtextgenerator.com', '2025-12-21 09:34:47', 1),
(11, 'sdfkokcs5158', 'DieSachbearbeiter Choriner Straße 4910435 BerlinE-Mail: moinsen2@blindtextgenerator.com', '2025-12-21 09:34:47', 1),
(12, 'sdfkokcs5158', 'DieSachbearbeiter Choriner Straße 4910435 BerlinE-Mail: moinsen2@blindtextgenerator.com', '2025-12-21 09:34:47', 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int NOT NULL,
  `quantity` int NOT NULL,
  `order_id` int DEFAULT NULL,
  `price` double NOT NULL,
  `product_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id`, `quantity`, `order_id`, `price`, `product_id`) VALUES
(1, 1, 1, 250, 1),
(7, 9, 3, 4189.5, 2),
(8, 8, 3, 11424, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `description`, `code`, `price`) VALUES
(1, 'Lenovo IdeaPad Gaming 3 AMD Ryzen 5 5600H 8GB 512GB SSD GTX1650 Freedos 15.6\" FHD Taşınabilir Bilgisayar 82K200K3TX', '10/100 Ethernet	Var\r\nBellek Hızı	3200 MHz\r\nBluetooth Özelliği	Var\r\nBoyutlar	359.6 x 251.9 x 24.2 mm\r\nCihaz Ağırlığı	2 - 4 kg\r\nDokunmatik Ekran	Yok\r\nEkran Boyut Aralığı	15 - 15,9 inç\r\nEkran Boyutu	15,6 inç\r\nEkran Kartı Bellek Tipi	GDDR6\r\nEkran Kartı Hafızası	4 GB\r\nEkran Kartı İşlemcisi	Nvidia GeForce GTX\r\nEkran Kartı Tipi	Yüksek Seviye Harici Ekran Kartı', '82K200K3TX', 11424),
(2, 'Huawei Matepad 11 128 GB', 'Huawei Matepad 11 128 GB versiyonlu tablet hem iş ve eğlence hem de gündelik kullanım avantajı ile geliyor. Matepad serisi ürünün ekran özellikleri, işlemci mimarisi, bellek ve depolama birimleri, bağlantı çeşitliliği kullanıcıları hayli memnun ediyor. Ön ve arka kameralı tablet, teknik özellikleri ile olduğu kadar, tasarımı ile de adından bahsettiriyor. İnce, hafif fakat sağlam olan dizayn uzun süre keyifli kullanım vadediyor. Yüksek yenileme hızı oyun oynarken ve film izlerken kaliteli seyir deneyimi sunuyor. Geniş ekranlı cihaz, ses nitelikleri ile de farkını ortaya koyuyor. Full ekran ve 3D ses etkisi sayesinde üst düzey sinematik etki elde ediliyor. Geniş renk skalası ve görüntü iyileştirme teknolojileri medya ve oyun içeriklerini çalıştırırken de görsel içerikler üzerinde düzenlemeler yaparken de işinizi kolaylaştırıyor. Markaya özgü teknolojiler ise mevcut teknik ve tasarımsal özelliklerin etkinlik alanını genişleterek tablet performansını ve kullanım konforunu artırıyor.\r\n\r\nGeniş Ekranlı Huawei Tablet\r\nHuawei tablet çeşitleri ekran özellikleri ve performansları ile dikkatleri üzerine çekmeyi başarıyor. Matepad serisi 10.95 inçlik ekranı ile sizlere geniş bir kullanılabilir alan sunuyor. Üstelik, ekran boyutuna ve grafik performansına yaraşır şekilde, 2560x1600 piksellik çözünürlük kalitesini de beraberinde getiriyor. Renk ve imaj netliğini artırmak adına ise IPS panel teknolojisi, DCI-P3 renk gamı, 120 Hertz ekran yenileme hızı ve 276 PPI piksel yoğunluğuna bünyesinde yer veriyor. 120 Hertz’lik sistem sayesinde ekran saniyede 120 kere güncelleniyor ve yüksek tazelenme hızı sayesinde hareketli görüntülerde bulanıklaşma ve renk kaybı türevi sorunlar yaşanmıyor. Bu teknoloji, aksiyon türü oyunlar oynarken, videolar izlerken ve hatta görsel içerikler üzerinde düzenlemeler yaparken işinizi kolaylaştırıyor. Geniş renk tayfı, imaj renklerini ideal tonları ile görmenizi mümkün kılıyor. Böylece oyun oynarken tematik ayrıntıları daha kolay fark ederek rakiplerinizin bir adım önüne geçme fırsatınız bulunuyor. Cihazda ikincil ekran desteğine de yer veriliyor. Bu şekilde tableti dizüstü bilgisayarına bağlamanız ya da bilgisayar ekranınızı tablete yansıtmanız seçenekleriniz arasına yerleşiyor. Böylece daha geniş bir görüntülenebilir ekrana ulaşmanız mümkün hale geliyor. Ürünü ayırt edici kılan önemli bir diğer faktör de dört hoparlörlü donanım oluyor. Yüksek bas, net duyulan yüksek ses vadeden sistem, sinematik etkiyi artırma amacına iyi derecede hizmet ediyor. 4 adet dahili mikrofon ise sesinizi karşı tarafa yüksek doğruluk süresinde ve net biçimde aktarıyor. Yapay zekâ destekli gürültü önleme teknolojisi ise ortam sesi ve arka plan konuşması gibi sesleri otomatik filtreleyerek iletişim kalitesini artırıyor.', 'HWTKLMN', 4189.5),
(3, 'Samsung 43AU7000 43\" 108 Ekran Uydu Alıcılı Crystal 4K Ultra HD Smart LED TV', 'Gerçek 4K UHD Çözünürlüğü hissedin\r\n4K ÇÖZÜNÜRLÜK\r\n4K UHD TV, sıradan bir FHD’den 4 kat daha fazla piksele sahiptir, bu sayede gözlerinizin hak ettiği keskin ve parlak görüntüyü sunar. Artık sahnedeki en küçük ayrıntıları bile görebilirsiniz.', 'KT43AU7000', 7050.93);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`) VALUES
(1, 'etemkeskin@yahoo.com', '[\"ROLE_ADMIN\"]', '$2y$13$IwTvERJAVCvmunNA2CbE1uU4lOEOr76ib0zbFYvVc9DIdQMdDns5O'),
(3, 'user1@deneme.com', '[\"ROLE_USER\"]', '$2y$13$IwTvERJAVCvmunNA2CbE1uU4lOEOr76ib0zbFYvVc9DIdQMdDns5O'),
(4, 'user2@deneme.com', '[\"ROLE_USER\"]', '$2y$13$IwTvERJAVCvmunNA2CbE1uU4lOEOr76ib0zbFYvVc9DIdQMdDns5O'),
(5, 'user3@deneme.com', '[\"ROLE_USER\"]', '$2y$13$IwTvERJAVCvmunNA2CbE1uU4lOEOr76ib0zbFYvVc9DIdQMdDns5O');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_F5299398A76ED395` (`user_id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_ED896F468D9F6D38` (`order_id`),
  ADD KEY `IDX_ED896F464584665A` (`product_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FK_F5299398A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `FK_ED896F464584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FK_ED896F468D9F6D38` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
