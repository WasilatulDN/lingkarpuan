-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 27, 2021 at 06:41 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.3.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lingkarpuan_contoh`
--

-- --------------------------------------------------------

--
-- Table structure for table `artikel`
--

CREATE TABLE `artikel` (
  `id_artikel` char(36) NOT NULL,
  `id_user` char(36) DEFAULT NULL,
  `id_status_artikel` int(11) DEFAULT NULL,
  `judul` varchar(100) DEFAULT NULL,
  `isi_artikel` longtext DEFAULT NULL,
  `gambar` varchar(100) DEFAULT NULL,
  `catatan_penilik` text DEFAULT NULL,
  `catatan_penulis` text DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `artikel`
--

INSERT INTO `artikel` (`id_artikel`, `id_user`, `id_status_artikel`, `judul`, `isi_artikel`, `gambar`, `catatan_penilik`, `catatan_penulis`, `updated_at`) VALUES
('8cbd3844-8bac-4ae5-9ff7-6cf7c1fd07f0', '4cfaad36-7afd-43e6-aa47-81ea22eb2c87', 4, 'Tentang Perjalanan Merangkul Masa Lalu dan Memaknai Kehidupan', '<p class=\"MsoNormal\" style=\"line-height: normal; background: white; text-align: justify;\"><span style=\"color: #424242; font-family: Helvetica, sans-serif;\">Pernahkah kita merasa tidak bisa menikmati suatu momen yang membahagiakan? Bisa jadi kita terbayang-bayang oleh kemungkinan bahwa momen yang akan datang selanjutnya adalah momen yang buruk dan tidak menyenangkan. Seperti sebuah siklus, manis dan pahit kehidupan selalu berselang menghampiri dan terkadang membuat kita tidak bisa menikmati kehidupan di masa kini, atau bahkan skenario terburuknya adalah kita tidak berani untuk sekadar membayangkan masa depan. Ketakutan ini muncul karena berkaca dari pengalaman di masa lalu, atau bisa juga melihat perjalanan hidup orang lain. Merujuk pada teori psikoanalisis, dijelaskan bahwa kehidupan kita di masa lalu dapat memengaruhi kehidupan kita di masa-masa yang selanjutnya. Akan tetapi, sebuah studi di tahun 2011 justru menemukan bahwa bagaimana kita memaknai suatu pengalaman di masa lalu adalah sesuatu yang berdampak lebih besar pada bagaimana kita menjalani kehidupan di masa sekarang.</span></p>\r\n<p class=\"MsoNormal\" style=\"line-height: normal; background: white; text-align: center;\"><span style=\"color: #424242; font-family: Helvetica, sans-serif;\">***</span></p>\r\n<p class=\"MsoNormal\" style=\"line-height: normal; background: white; text-align: justify;\"><span style=\"color: #424242; font-family: Helvetica, sans-serif;\">Tidak bisa dipungkiri memang bahwa pengalaman-pengalaman yang buruk memiliki efek yang lebih besar dan cenderung bertahan lama dibandingkan dengan pengalaman baik. Fakta ini membawa beberapa dari kita pada kesedihan, ketakutan, dan penyesalan yang berlebihan. Tidak hanya akan memengaruhi aktivitas sehari-hari, pikiran dan perasaan yang masih terjebak ini juga akan berdampak pada kesehatan mentalnya. Perlu diingat bahwa kesehatan mental manusia sama pentingnya dengan kesehatan fisik. Oleh karena itu, ada beberapa hal yang bisa dilakukan untuk bisa berdamai dengan masa lalu.</span></p>\r\n<p class=\"MsoNormal\" style=\"line-height: normal; background: white; text-align: justify;\"><strong><span style=\"color: #424242; font-family: Helvetica, sans-serif;\">1.<span style=\"white-space: pre;\"> </span>Berani Ambil Momennya</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"line-height: normal; background: white; text-align: justify;\"><span style=\"color: #424242; font-family: Helvetica, sans-serif;\">Selayaknya dengan luka pada kulit kita, luka pada perasaan kita juga akan cepat membaik jika kita menginginkannya. Luka pada kulit mungkin akan hilang seiring dengan berjalannya waktu, tetapi luka pada perasaan tidak mungkin hilang hanya dengan mengandalkan waktu. Niat yang kuat untuk menyembuhkan luka atau rasa sakit pada perasaan ini menjadi poin penting untuk diciptakan setiap individu. Akan ada fase di mana kita lari dari masalah dan mencoba untuk mengubur masalah tersebut. Tetapi, kedepannya juga pasti ada fase di mana kita dihadapkan kembali pada permasalahan tersebut. Ketika fase atau momen ini dirasa sudah datang, kita harus bijaksana untuk mengambil keputusan terkait dengan masa lalu ini. Apakah kita masih belum siap dan memilih untuk menghidar lagi, ataukah kita sudah berani untuk menerima permasalahan dan akan menjadikannya sebagai pelajaran hidup? Keputusannya berada di tangan kita. Keputusan ini kedepannya akan berpengaruh pada bagaimana kita melihat rasa sakit yang ditinggalkan oleh masa lalu, juga bagaimana runtutan cerita dan aktor dibaliknya dalam kepala kita. Untuk itu, jika memang sudah siap dan memiliki niat yang kuat untuk perubahan, beranikan lah dirimu untuk mengambil momen tersebut dengan menerima apa-apa yang menjadi luka di masa lalu. Jadikanlah momen ini sebagai pijakan untuk menata kehidupan di masa-masa selanjutnya yang lebih baik lagi.</span></p>\r\n<p class=\"MsoNormal\" style=\"line-height: normal; background: white; text-align: justify;\"><strong><span style=\"color: #424242; font-family: Helvetica, sans-serif;\">2.<span style=\"white-space: pre;\"> </span>Ekspresikan Perasaannya</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"line-height: normal; background: white; text-align: justify;\"><span style=\"color: #424242; font-family: Helvetica, sans-serif;\">Dalam proses untuk merangkul masa lalu, seringkali kita harus dealing dengan berbagai emosi. Sama seperti nilai, rasa sakit yang ada dalam diri manusia juga memiliki ambang batasnya sendiri. Ketika dirasa memang sudah tidak kuat untuk menanganinya sendiri, kita akan mencari teman untuk bercerita. Bisa dari teman, orang tua, ataupun tenaga professional. Ketika kita masih bisa menangani rasa sakit ini pun, akan lebih baik jika kita mengekspresikannya melalui tangisan, atau mungkin dengan self-talk dan menulis jurnal. Mengeskspresikan perasaan ini perlu untuk melepaskan beban yang membuat harimu menjadi lebih melelahkan. Jika beban ini tidak dikeluarkan, maka akan tertumpuk dan meledak sewaktu-waktu di hari selanjutnya.</span></p>\r\n<p class=\"MsoNormal\" style=\"line-height: normal; background: white; text-align: justify;\"><strong><span style=\"color: #424242; font-family: Helvetica, sans-serif;\">3.<span style=\"white-space: pre;\"> </span>Bertanggung Jawab Atas Kebahagiaan Diri</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"line-height: normal; background: white; text-align: justify;\"><span style=\"color: #424242; font-family: Helvetica, sans-serif;\">Setiap saat, kita selalu dihadapkan pada pilihan hidup. Entah itu untuk pilihan untuk menganggap bahwa kita adalah korban dari kehidupan, atau anggapan-anggapan lain yang kita percaya. Dengan kembali menyadari bahwa kita tidak hanya sekadar hidup untuk menyia-nyiakan waktu di dunia, kita juga akan terbuka pada responsibilities lain yang menyertai kehidupan kita. Jika kita bisa mulai berfokus pada potongan puzzle kebahagiaan dan mulai menata kehidupan kita ke arah yang lebih baik, maka kita telah berani untuk bertanggung jawab atas diri dan kesejahteraan kita.</span></p>\r\n<p class=\"MsoNormal\" style=\"line-height: normal; background: white; text-align: justify;\"><strong><span style=\"color: #424242; font-family: Helvetica, sans-serif;\">4.<span style=\"white-space: pre;\"> </span>Tantang Pemikiran dan Keyakinan yang Buruk</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"line-height: normal; background: white; text-align: justify;\"><span style=\"color: #424242; font-family: Helvetica, sans-serif;\">Kita tidak bisa memutar waktu kembali. Karena itu, apa yang terjadi di masa lalu tidak akan bisa diubah. Jika kita melihat masa lalu sebagai mimpi yang buruk, maka kita bisa melihat masa depan sebagai opportunity atau kesempatan untuk tidak terjerembab di sana lagi. Metode untuk melihat masa depan sebagai opportunity ini dikenalkan oleh Albert Ellis, psikolog rasional dan emotif. Hal pertama yang harus dilakukan adalah dengan mengenali emosi apa yang dirasakan. Misalnya sekarang kamu sangat kecewa. Kemudian, cari tahu apa yang menyebabkan kamu merasakan emosi ini. Semisal emosi ini kamu rasakan karena teman baikmu yang mengacuhkanmu dan memilih bermain dengan teman yang baru. Setelah itu, identifikasi pikiranmu. Misal kamu berpikir bahwa kamu memang yang terburuk, sampai temanmu seolah membuangmu. Apakah satu orang menolakmu berarti tidak ada sama sekali yang menyukai dirimu? Tantang pikiran dan keyakinanmu sendiri untuk dapat berfokus pada hal-hal yang logis dan lebih penting.</span></p>\r\n<p class=\"MsoNormal\" style=\"line-height: normal; background: white; text-align: justify;\"><strong><span style=\"color: #424242; font-family: Helvetica, sans-serif;\">5.<span style=\"white-space: pre;\"> </span>Maafkan Mereka dan Dirimu di Masa Lalu</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"line-height: normal; background: white; text-align: justify;\"><span style=\"color: #424242; font-family: Helvetica, sans-serif;\">Memaafkan, bahkan jika itu ditujukan pada diri sendiri memang tidak semudah yang dibayangkan. Namun sebenarnya, setiap individu pantas untuk mendapatkan pengampunan dari kita, meski cerita buruk dibaliknya susah untuk kita lupakan. Seringkali kita berusaha lari untuk melupakan cerita di masa lalu serta orang-orang di baliknya. Menghadapi suatu permasalahan dikatakan memang membuat kita bisa kuat. Akan tetapi yang dimaksudkan di sana adalah terima permasalahan itu dan belajar lah dari sana. Perlu diingat bahwa memaafkan buat pertanda kita kalah. Memaafkan adalah persoalan untuk menerima suatu keadaan sebagai bagian dari perjalanan hidup kita.</span></p>\r\n<p class=\"MsoNormal\" style=\"line-height: normal; background: white; text-align: center;\"><span style=\"color: #424242; font-family: Helvetica, sans-serif;\">***</span></p>\r\n<p class=\"MsoNormal\" style=\"line-height: normal; background: white; text-align: justify;\"><span style=\"color: #424242; font-family: Helvetica, sans-serif;\">Berurusan dengan masa lalu memang tidak pernah mudah. Keputusan kita untuk tetap berjalan menjalani hari di masa sekarang pun merupakan bagian dari proses untuk merangkul masa lalu. Tidak hanya waktu yang harus kita sediakan, tetapi juga tenaga untuk bisa berproses dalam penerimaan ini. Penerimaan atas masa lalu adalah pondasi utama untuk bisa melakukan perubahan. Meski jika dibandingkan dengan orang lain kita memerlukan waktu yang lebih lama untuk kesembuhan dan penerimaan ini, jangan pernah menyerah pada diri sendiri. Semua orang memiliki potensi untuk menjadi pribadi yang lebih baik dengan waktu dan ceritanya masing-masing. Perlahan-lahan tidak masalah, asalkan kita bisa memaknai setiap momen yang dilalui.</span></p>\r\n<p class=\"MsoNormal\" style=\"line-height: normal; background: white; text-align: justify;\">Sumber: www.pijarpsikologi.org</p>', '8cbd3844-8bac-4ae5-9ff7-6cf7c1fd07f0.jpg', NULL, NULL, '2021-05-26 16:18:34'),
('cf593189-bbfc-4b1f-9276-f62e2e0a527c', 'b4df4126-eece-4b4c-9fd9-2ec48115bf3a', 4, 'Kita Semua Butuh Resiliensi untuk Bisa Bangkit dari Keterpurukan', '<p style=\"text-align: center;\"><em>Jika hidup adalah sebuah perjalanan. Lalu, sejauh kita melangkahkan kaki hingga saat ini, berapa kali kita jatuh?</em></p>\r\n<p style=\"text-align: center;\"><em>Berapa kali kita gagal?</em></p>\r\n<p style=\"text-align: center;\"><em>Berapa kali kita merasa terpuruk dan seakan tak bisa melangkah lagi?</em></p>\r\n<p style=\"text-align: center;\">***</p>\r\n<p style=\"text-align: justify;\">Kegagalan, kesulitan, dan penderitaan adalah bagian dari pengalaman hidup manusia yang tidak dapat dihindari. Dari waktu ke waktu, kita akan berjumpa dengan peristiwa-peristiwa yang tidak terduga, dan mungkin saja membuat kita terjebak dalam keterpurukan. Begitulah roda kehidupan berjalan.</p>\r\n<p style=\"text-align: justify;\">Setiap orang mempunyai cara yang berbeda dalam menanggapi peristiwa kemalangan. Sebagian orang terjebak dalam keterpurukan, tapi sebagian yang lain memilih untuk berusaha bangkit dari keterpurukan dan belajar dari pengalaman sulit itu. Perbedaan cara dalam bereaksi terhadap kemalangan dipengaruhi oleh sumber daya psikologis yang dimiliki oleh seseorang. Dalam bahasa psikologi, sumber daya psikologis yang mendorong seseorang untuk bangkit kembali dari keterpurukan, akrab disebut sebagai resiliensi.</p>\r\n<p style=\"text-align: justify;\">&ldquo;Seperti bola bekel, seseorang yang resilien akan memantul dan naik kembali dengan cepat saat terjatuh.&rdquo;</p>\r\n<p style=\"text-align: justify;\">Resiliensi diartikan sebagai sebuah kapasitas dinamis pada seseorang untuk bisa bertahan dan pulih dari tantangan yang mengancam stabilitas dan kelangsungan hidup. Resiliensi dapat juga dilihat sebagai kemampuan yang memengaruhi keberhasilan seseorang dalam mengatasi stres. Seseorang yang resilien memiliki peluang lebih besar untuk bisa menyesuaikan diri, bangkit, dan tetap berkembang meskipun berhadapan dengan situasi sulit atau terpuruk.</p>\r\n<p style=\"text-align: justify;\">Seseorang yang resilien memiliki kecenderungan bahwa ia telah berdamai dengan emosi negatifnya sehingga ia merasa netral atau merasakan emosi positif meskipun berada dalam situasi stres. Emosi positif inilah yang membuat seseorang mampu bangkit dari situasi terpuruknya. Dampaknya, orang-orang dengan kemampuan resilien yang baik akan merasakan kesejahteraan dan kepuasan dalam hidup baik secara fisik, psikologi maupun spiritual. Hasil penelitian menunjukkan bahwa resiliensi dapat mencegah atau mengurangi tingkat keparahan kecemasan dan depresi saat seseorang berada dalam situasi penuh tekanan.</p>\r\n<p style=\"text-align: center;\">***</p>\r\n<p style=\"text-align: justify;\">Resiliensi terdiri dari lima aspek yang menandakan seseorang memiliki kemampuan untuk bangkit dari keterpurukan. Berikut ini adalah aspek-aspek resiliensi yang dijelaskan oleh Connor dan Davidson.</p>\r\n<p style=\"text-align: justify;\"><strong>1.<span style=\"white-space: pre;\"> </span>Kompetensi Personal, Standar yang Tinggi, dan Kegigihan</strong></p>\r\n<p style=\"text-align: justify;\">Saat berada dalam situasi sulit, seseorang yang resilien memiliki sikap optimis dan tidak putus asa dalam mencapai tujuan hidup yang telah direncanakan. Seseorang yang resilien juga senantiasa berusaha melakukan yang terbaik dalam menghadapi setiap tantangan dalam hidup.</p>\r\n<p style=\"text-align: justify;\"><strong>2.<span style=\"white-space: pre;\"> </span>Percaya terhadap Naluri, Toleransi terhadap Afek Negatif, dan Kuat Menghadapi Tekanan</strong></p>\r\n<p style=\"text-align: justify;\">Dalam situasi sulit, seseorang yang resilien memiliki keteguhan hati dan rasa percaya diri untuk mampu mengatasi tantangan hidup dengan kekuatan yang dimilikinya. Di sisi lain, resiliensi akan membantu seseorang untuk tenang, fokus, dan mampu membuat keputusan sulit saat berada di bawah tekanan.</p>\r\n<p style=\"text-align: justify;\"><strong>3.<span style=\"white-space: pre;\"> </span>Penerimaan Positif terhadap Perubahan dan Kemampuan Menjalin Hubungan yang Aman dengan Orang Lain</strong></p>\r\n<p style=\"text-align: justify;\">Seseorang yang memiliki resiliensi berusaha untuk menerima diri dan situasi hidup yang ada secara apa adanya. Hal ini membuat seseorang mudah menyesuaikan diri dengan setiap perubahan yang terjadi dalam hidup. Seseorang yang mudah menyesuaikan diri dengan perubahan akan mampu mengembangkan potensi positif dalam dirinya di berbagai situasi. Di sisi lain, seseorang yang resilien memiliki hubungan sosial yang hangat dengan orang-orang di sekitarnya. Ia juga tahu dengan pasti kapan waktu yang tepat untuk mencari pertolongan apabila dirasa ia tisak mampu mengatasi kesulitannya sendiri.</p>\r\n<p style=\"text-align: justify;\"><strong>4.<span style=\"white-space: pre;\"> </span>Kontrol diri</strong></p>\r\n<p style=\"text-align: justify;\">Seseorang yang resilien berusaha berpikir jernih dan mengatasi pikiran-pikiran buruk yang datang saat ditimpa kesulitan. Resiliensi yang dimiliki juga dapat membantu seseorang untuk pulih secara emosional dan tidak larut dalam suasana hati yang kelam. Selain itu, seseorang yang resilien berusaha bertindak secara hati-hati dalam situasi apa pun. Ia memastikan segala yang dilakukan dibawah kontrol dan kesadaran diri yang penuh.</p>\r\n<p style=\"text-align: justify;\"><strong>5.<span style=\"white-space: pre;\"> </span>Spiritualitas</strong></p>\r\n<p style=\"text-align: justify;\">Spiritualitas adalah aspek resiliensi yang berkaitan dengan nilai-nilai ketuhanan. Seseorang yang resilien berpegang teguh pada nilai-nilai spiritual, sehingga senantiasa meyakini bahwa Tuhan akan menyertai, menolong, dan memberikan yang terbaik bagi setiap makhluk-Nya. Dengan spiritualitas, seseorang juga akan menemukan makna dan pelajaran di balik pengalaman hidup yang pahit. Makna dan pelajaran ini adalah bekal yang menjadikan seseorang lebih tangguh dan kuat untuk menjalani setiap fase kehidupan.</p>\r\n<p style=\"text-align: center;\">***</p>\r\n<p style=\"text-align: justify;\">Jika kegagalan, kesulitan, dan penderitaan adalah kepastian dalam hidup, maka kita perlu mempersiapkan diri untuk menghadapi situasi-situasi di luar kendali diri kita. Karena, satu-satunya yang bisa kita kendalikan secara utuh hanyalah diri kita sendiri. Oleh karena itu, kita perlu belajar untuk menjadi tangguh dan kuat. Belajar menjadi pribadi yang memiliki kapasitas untuk menyesuaikan diri, pulih secara emosional, dan tetap berkembang secara sehat saat menghadapi situasi sulit. Belajar untuk tetap menegakkan kepala, walaupun badai silih berganti menerpa.</p>\r\n<p style=\"text-align: justify;\">Sumber: www.pijarpsikologi.org</p>', 'cf593189-bbfc-4b1f-9276-f62e2e0a527c.jpg', NULL, NULL, '2021-05-26 16:19:16');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

CREATE TABLE `jadwal` (
  `id_jadwal` char(36) NOT NULL,
  `id_user` char(36) DEFAULT NULL,
  `hari` varchar(10) DEFAULT NULL,
  `jam_mulai` time DEFAULT NULL,
  `jam_selesai` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jadwal`
--

INSERT INTO `jadwal` (`id_jadwal`, `id_user`, `hari`, `jam_mulai`, `jam_selesai`) VALUES
('16d5ea8f-0eb9-463f-986d-10f0e963801b', 'b4df4126-eece-4b4c-9fd9-2ec48115bf3a', 'Thursday', '07:00:00', '15:00:00'),
('20051654-2507-4e67-9848-f9fb4edc10ad', 'b4ba0ef8-b3e3-4d85-ae28-accb476874e1', 'Thursday', '19:30:00', '23:45:00'),
('c14140d0-3d1f-4e70-8c36-01398da460bf', 'b4df4126-eece-4b4c-9fd9-2ec48115bf3a', 'Friday', '08:00:00', '13:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `komentar`
--

CREATE TABLE `komentar` (
  `id_komentar` char(36) NOT NULL,
  `id_user` char(36) DEFAULT NULL,
  `id_artikel` char(36) DEFAULT NULL,
  `isi_komentar` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `permintaan_layanan`
--

CREATE TABLE `permintaan_layanan` (
  `id_layanan` char(36) NOT NULL,
  `id_user` char(36) DEFAULT NULL,
  `id_status_layanan` int(11) DEFAULT NULL,
  `id_konsultan` char(36) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `jam_mulai` time(1) DEFAULT NULL,
  `durasi` int(11) DEFAULT NULL,
  `jam_selesai` time(1) DEFAULT NULL,
  `jenis_layanan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id_role` int(11) NOT NULL,
  `nama_role` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id_role`, `nama_role`) VALUES
(1, 'puan'),
(2, 'rekan cerita'),
(3, 'rekan hukum'),
(4, 'penilik'),
(5, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `status_artikel`
--

CREATE TABLE `status_artikel` (
  `id_status_artikel` int(11) NOT NULL,
  `nama_status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `status_artikel`
--

INSERT INTO `status_artikel` (`id_status_artikel`, `nama_status`) VALUES
(1, 'menunggu verifikasi'),
(2, 'menunggu konfirmasi penulis'),
(3, 'dikonfirmasi penulis'),
(4, 'dipublikasikan'),
(5, 'ditolak');

-- --------------------------------------------------------

--
-- Table structure for table `status_layanan`
--

CREATE TABLE `status_layanan` (
  `id_status_layanan` int(11) NOT NULL,
  `nama_status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `status_layanan`
--

INSERT INTO `status_layanan` (`id_status_layanan`, `nama_status`) VALUES
(1, 'menunggu'),
(2, 'diterima'),
(3, 'ditolak');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` char(36) NOT NULL,
  `id_role` int(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `status_verifikasi` int(11) DEFAULT NULL,
  `kode_verifikasi` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `id_role`, `email`, `nama`, `password`, `status_verifikasi`, `kode_verifikasi`) VALUES
('27498a9e-c1ad-41fe-9d95-bf4678ac73e1', 4, 'penilik@gmail.com', 'penilik', '$2y$12$b2xLY2lWNU83blBwKzFzU.c.5MAqwMP.SXw6.XfGX0eY1ORvXJMbm', 1, 'e68c0c18-0b74-4bd1-a3c9-8a8a74695add'),
('4cfaad36-7afd-43e6-aa47-81ea22eb2c87', 1, 'puan@gmail.com', 'puan', '$2y$12$YXU5TmR2QjB5Tm44TlJNN.bY1H.jY.9KyqPemZvmhezL98QCfJAq.', 1, '174a7b32-c20d-4143-a99c-9c07fb9bdbd4'),
('b4ba0ef8-b3e3-4d85-ae28-accb476874e1', 3, 'rekanhukum@gmail.com', 'rekanhukum', '$2y$12$VzBhZ0o4K1ZuNm9vMzBIbuI1Okuh4k0iIgxt9F2vpsp0NHeRIV182', 1, 'eb4a9299-f7ac-4f29-aaa3-ebf9b0f26c51'),
('b4df4126-eece-4b4c-9fd9-2ec48115bf3a', 2, 'rekancerita@gmail.com', 'rekancerita', '$2y$12$RFBiclk1UnUyTnlkVHVzW.O0ptqDk640YOVPYWkJGkJAjLZjg74g.', 1, '0d47a26b-70f9-4cd6-854c-1021a1926eab'),
('eae583ea-5c6a-463b-8843-a7a3ae7b2e20', 5, 'admin@gmail.com', 'admin', '$2y$12$dk0rNE1FNTdWT0U3c1NVN.tN3lC/CNjP7gGV7BEWt10rDe3UG3xXi', 1, '602311fc-adb3-490f-a1fe-8e8949d633d0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artikel`
--
ALTER TABLE `artikel`
  ADD PRIMARY KEY (`id_artikel`),
  ADD KEY `fk_artikel_status` (`id_status_artikel`),
  ADD KEY `fk_artikel_user` (`id_user`);

--
-- Indexes for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`id_jadwal`),
  ADD KEY `fk_jadwal_user` (`id_user`);

--
-- Indexes for table `komentar`
--
ALTER TABLE `komentar`
  ADD PRIMARY KEY (`id_komentar`),
  ADD KEY `fk_komentar_artikel` (`id_artikel`),
  ADD KEY `fk_komentar_user` (`id_user`);

--
-- Indexes for table `permintaan_layanan`
--
ALTER TABLE `permintaan_layanan`
  ADD PRIMARY KEY (`id_layanan`),
  ADD KEY `fk_layanan_konsultan` (`id_konsultan`),
  ADD KEY `fk_layanan_status` (`id_status_layanan`),
  ADD KEY `fk_layanan_user` (`id_user`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id_role`);

--
-- Indexes for table `status_artikel`
--
ALTER TABLE `status_artikel`
  ADD PRIMARY KEY (`id_status_artikel`);

--
-- Indexes for table `status_layanan`
--
ALTER TABLE `status_layanan`
  ADD PRIMARY KEY (`id_status_layanan`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `fk_user_role` (`id_role`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `artikel`
--
ALTER TABLE `artikel`
  ADD CONSTRAINT `fk_artikel_status` FOREIGN KEY (`id_status_artikel`) REFERENCES `status_artikel` (`id_status_artikel`),
  ADD CONSTRAINT `fk_artikel_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `fk_jadwal_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `komentar`
--
ALTER TABLE `komentar`
  ADD CONSTRAINT `fk_komentar_artikel` FOREIGN KEY (`id_artikel`) REFERENCES `artikel` (`id_artikel`),
  ADD CONSTRAINT `fk_komentar_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `permintaan_layanan`
--
ALTER TABLE `permintaan_layanan`
  ADD CONSTRAINT `fk_layanan_konsultan` FOREIGN KEY (`id_konsultan`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `fk_layanan_status` FOREIGN KEY (`id_status_layanan`) REFERENCES `status_layanan` (`id_status_layanan`),
  ADD CONSTRAINT `fk_layanan_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_user_role` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
