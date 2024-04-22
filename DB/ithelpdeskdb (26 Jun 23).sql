-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 26, 2023 at 05:02 AM
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
-- Database: `ithelpdeskdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` int(11) NOT NULL,
  `no_barang` varchar(25) NOT NULL,
  `kode_barang` varchar(25) DEFAULT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `nama_peminjam` varchar(50) NOT NULL,
  `merk` varchar(50) DEFAULT NULL,
  `no_seri` varchar(50) DEFAULT NULL,
  `kondisi_barang` varchar(25) DEFAULT NULL,
  `unit` int(11) NOT NULL,
  `tgl_daftar` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tgl_pinjam` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tgl_kembali` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `storage` varchar(50) DEFAULT NULL,
  `user_id` int(10) NOT NULL,
  `status_barang` int(2) NOT NULL,
  `tujuan_pinjaman` varchar(100) NOT NULL,
  `gambar_barang` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `no_barang`, `kode_barang`, `nama_barang`, `nama_peminjam`, `merk`, `no_seri`, `kondisi_barang`, `unit`, `tgl_daftar`, `tgl_pinjam`, `tgl_kembali`, `storage`, `user_id`, `status_barang`, `tujuan_pinjaman`, `gambar_barang`) VALUES
(1, '1', '123456', 'speaker', 'tes pinjam', 'sony', '1234567890', 'baik', 1, '2023-04-20 06:24:02', '2023-04-19 02:45:57', '2023-03-13 08:55:10', 'lemari 1', 22, 1, 'tes doang', NULL),
(3, '0703230001', 'IT001', 'Infokus', 'mas iwan', 'Epson', '1122334455', 'baik', 1, '2023-03-13 08:43:02', '2023-03-13 08:43:02', '2023-03-12 17:00:00', 'lemari 3', 22, 0, 'iseng', NULL),
(4, '3005230001', 'kode barang 1', 'nama barang 1', '', 'merkbarang1', '11111', 'baik', 0, '2023-05-29 17:00:00', '2023-05-30 03:57:32', '2023-05-30 03:57:32', 'lemari 1', 22, 0, '', NULL),
(5, '3005230002', 'kode barang 2', 'nama barang 2', '', 'merek barang 2', '22222', 'baik', 0, '2023-05-29 17:00:00', '2023-05-30 03:57:55', '2023-05-30 03:57:55', 'lemari 2', 22, 0, '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dealer`
--

CREATE TABLE `dealer` (
  `id_dealer` int(11) NOT NULL,
  `dealer_code` varchar(11) NOT NULL,
  `dealer` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `jenis` enum('wing','regular','main_dealer','ahass') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dealer`
--

INSERT INTO `dealer` (`id_dealer`, `dealer_code`, `dealer`, `alamat`, `jenis`) VALUES
(1, 'J20', 'PT. Mitra Sendang Kemakmuran', 'Jl. Raya Pandeglang Km. 3 Kelurahan Karundang Kec.Cipocok Jaya Kota Serang Prop. Banten Indonesia 42', 'main_dealer'),
(2, '15010', ' PT. Kemakmuran Jaya Mandiri Sempu', 'Jl.Raya Pandeglang Km 3, Kota Serang', 'wing'),
(3, '09201', 'PT. Fajar Mandiri', 'Jl.Raya Pandeglang Baros, Kab. Serang', 'regular'),
(4, '07000', 'PT. Kemakmuraan Jaya Mandiri A Yani', 'Jl.Jend. Ahmad Yani No.128, Kota Serang', 'wing'),
(5, '00300', 'PT. Kemakmuran Jaya Mandiri Ciceri', 'Jl.Jend. Sudirman No. 11, Kota Serang', 'regular'),
(6, '07339', 'PT. Sendang Bersama', 'Jl.Raya Jakarta - Serang Kuaron Ciruas, Kab. Serang', 'regular'),
(7, '09590', 'CV. Anugerah Hasta Mandiri', 'Jl.Raya Serang Km.15, Kab. Serang', 'regular'),
(8, '01686', 'PT. Cikande Motor', 'Jl.Raya Jakarta – Serang Ruko Modern Cikande, Kab. Serang', 'wing'),
(9, '02090', 'UD. Pontang Perkasa', 'Jl. Ciptayasa No.16,Kubang Puji,Pontang,Kab. Serang', 'regular'),
(10, '00552', 'PT. Mandiri Sumber Kemakmuran PCI', 'Jl.Raya Cilegon - Ruko PCI KK.II/1.2.3, Kota Cilegon', 'regular'),
(11, '02565', 'PT. Mandiri Sumber Kemakmuran Simpang', 'Jl.SA.Tirtayasa Cilegon, Kota Cilegon', 'regular'),
(12, '07499', 'PT. Astra Motor Cilegon', 'Jl. Jend. Ahmad Yani No.1 A Sukmajaya Cilegon, Kota Cilegon', 'wing'),
(13, '10130', 'PT. Citra Megah Sentosa', 'Jl.Raya Anyer Kp. Kepuh Kec. Anyer Kab.Serang', 'regular'),
(14, '17915', 'PT. Kemakmuran Jaya Mandiri Legok', '', 'ahass'),
(15, '00188', 'PT. Mitra Panglima Sejahtera Pandeglang', 'Jl.Jend. Ahmad Yani No.188 , Kab. Pandeglang', 'wing'),
(16, '01314', 'PT. Mitra Panglima Sejahtera Labuan', 'Jl.Jend. Ahmad Yani - Ruko Ciateul, Kab. Pandeglang', 'regular'),
(17, '09885', 'PT. Mitra Panglima Sejahtera Panimbang', 'Jl. Nasional III, Sidamukti, Sukaresmi, Kab. Pandeglang', 'regular'),
(18, '12228', 'PT. Selaras Maju Sentosa Pandeglang', 'Jl. Raya Pandeglang - Kadu Merak, Kab. Pandeglang', 'regular'),
(19, '08306', 'PT. Banten Bakti Motor Pandeglang', 'Jl.Raya Labuan – Cipacung, Kab. Pandeglang', 'regular'),
(20, '00421', 'PT. Primadelta Starlestari Rangkasbitung', 'Jl. Jend. Ahmad Yani No.421, Kab. Lebak', 'regular'),
(21, '00866', 'PT. Primadelta Starlestari Malingping', 'Jl. Raya Ps. Malingping No.51, Malingping Sel., Malingping, Kabupaten Lebak +622525605028', 'regular'),
(22, '17641', 'PT. Astra Motor Bayah', 'Jl.Raya Bayah Km.2, Kab. Lebak', 'regular'),
(23, '07912', 'PT. Sentra Surya Abadi', 'Jl.Sunan Kalijaga Rangkas - Kab. Lebak', 'regular'),
(24, '12656', 'PT. Selaras Maju Sentosa Rangkasbitung', 'Jl.Patih Derus, Kab. Lebak', 'wing'),
(25, '10093', 'PT. Banten Bakti Motor Cipanas', 'Jl. Raya Pasar Gajrug Km. 35 Cipanas, Kab. Lebak', 'regular'),
(26, '16401', 'KJM Warung Jaud', 'Kp No.RT 23/05, Wr. Jaud, Kec. Kasemen, Kota Serang', 'ahass'),
(27, '02013', 'Nusantara Motor', 'Jl.S.A.Tirtayasa No.19', 'ahass'),
(28, '02648', 'Banten Pratama Motor', 'Jl KH.Fatah Hasan No.3', 'ahass'),
(29, '02695', 'Petir Jaya Motor', 'Jl.Raya Ciruas - Pasar Petir', 'ahass'),
(30, '06635', 'Sentul Indah Motor', 'Jl. Raya Serang Jakarta Sentul Kragilan Km 1', 'ahass'),
(31, '06696', 'Mitra Abadi Motor Kramatwatu', 'Jl.Raya Serang Cilegon Km.4', 'ahass'),
(32, '06697', 'Parakan Motor', 'Jl.Raya Cikande Rangkas - Parakan', 'ahass'),
(33, '07673', 'Pamarayan Motor', 'Jl.Raya Pasar Pamarayan', 'ahass'),
(34, '09202', 'Nyapah Motor', 'Jl.Raya Ciruas - Nyapah', 'ahass'),
(35, '11571', 'Mitra Abadi Motor Cipocok', 'Jl.Raya Petir - Cipocok Jaya', 'ahass'),
(36, '17169', 'MSK Harjatani', 'Jl.Raya Waringin Kurung Ds.Harjatani Kr.Watu', 'ahass'),
(37, '16636', 'Selikur Motor', 'Sukamaju, Kec. Kibin, Serang, Banten 42185', 'ahass'),
(38, '02813', 'Merak Motor', 'Jl.Raya Merak No.9 Gerem Raya Cilegon', 'ahass'),
(39, '07230', 'Pagebangan Motor', 'Jl.Pagebangan I No.5', 'ahass'),
(40, '18315', 'PT. Citra Megah Sentosa Ciwandan', '', 'regular'),
(41, '07913', 'Sejahtera Motor', 'Jl.Bukit Baja Sejahtera - Ciwaduk Cilegon', 'ahass'),
(42, '08756', 'Mitra Utama Motor', 'Jl.Raya Bojonegara - Panggung Rawi', 'ahass'),
(43, '00787', 'MPS Ciekek', 'Jl.Raya Ciekek Karaton Pandeglang', 'ahass'),
(44, '09594', 'Menes Motor', 'Jl.Raya Labuan Menes', 'ahass'),
(45, '09917', 'Picung Motor', 'Jl.Raya Malingping – Picung', 'ahass'),
(46, '16603', 'Cibaliung Motor', 'Labuan Suwajadi Cibaliung, Sukajadi, Cibaliung,Pandeglang', 'ahass'),
(52, '00783', 'PSL Ranca Sema', 'Jl.Raya Pandeglang No.84', 'ahass'),
(53, '07454', 'Japas Motor', 'Jl.Raya Malingping', 'ahass'),
(54, '08095', 'Mustika Motor', 'Jl.Raya Pasar Maja', 'ahass'),
(55, '09850', 'Putra Prima Motor', 'Jl.Sunan Kalijaga Rangkas', 'ahass');

-- --------------------------------------------------------

--
-- Table structure for table `detail_h1premises`
--

CREATE TABLE `detail_h1premises` (
  `id` int(11) NOT NULL,
  `h1premises_id` int(11) NOT NULL,
  `dealer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `tgl_input` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `stat_prem1` int(20) NOT NULL,
  `ket_prem1` varchar(200) NOT NULL,
  `gambar_prem1` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_h1premises`
--

INSERT INTO `detail_h1premises` (`id`, `h1premises_id`, `dealer_id`, `user_id`, `tgl_input`, `stat_prem1`, `ket_prem1`, `gambar_prem1`) VALUES
(1, 0, 0, 22, '2023-06-07 03:50:14', 0, 'Tes Ket 1', ''),
(2, 0, 0, 22, '2023-06-07 04:01:01', 0, 'Keterangan 1', '');

-- --------------------------------------------------------

--
-- Table structure for table `detail_tiket`
--

CREATE TABLE `detail_tiket` (
  `id_detail` int(11) NOT NULL,
  `tiket_id` int(11) DEFAULT NULL,
  `tanggapan` text NOT NULL,
  `gambar_tanggapan` text NOT NULL,
  `waktu_tanggapan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_tiket`
--

INSERT INTO `detail_tiket` (`id_detail`, `tiket_id`, `tanggapan`, `gambar_tanggapan`, `waktu_tanggapan`) VALUES
(5, 11, 'balas user tes tiket (keluhan 4) no gambar', '', '2023-02-09'),
(6, 10, 'balas user tes tiket (keterangan 3) with gambar', '20230209142223.jpg', '2023-02-09'),
(7, 12, 'oke', '', '2023-02-22'),
(8, 18, 'mau ganti ijo?', '20230222104439.jpeg', '2023-02-22'),
(9, 17, 'oke', '20230227091434.jpeg', '2023-02-27'),
(10, 24, 'it\'s done ya', '', '2023-03-01'),
(11, 25, 'baik', '20230301114321.png', '2023-03-01'),
(12, 26, 'oke', '', '2023-03-01'),
(13, 31, 'asdasdasdasd', '', '2023-03-15'),
(14, 28, 'okeeee', '', '2023-04-14'),
(15, 0, 'asdasd', '', '2023-04-19'),
(16, 0, 'thanks', '', '2023-04-28'),
(17, 33, 'sssdasdasd', '20230619160447.png', '2023-06-19');

-- --------------------------------------------------------

--
-- Table structure for table `divisi`
--

CREATE TABLE `divisi` (
  `id_divisi` int(11) NOT NULL,
  `divisi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `divisi`
--

INSERT INTO `divisi` (`id_divisi`, `divisi`) VALUES
(1, 'GM Operational'),
(2, 'GM Support'),
(3, 'Dept. Devlopment'),
(4, 'Dept. Marketing'),
(5, 'Dept. HC3'),
(6, 'Dept. TSD'),
(7, 'Dept. Promosi'),
(8, 'Dept. Sparepart'),
(9, 'Dept. Finance'),
(10, 'Dept. HRGA'),
(11, 'Deputi Finance'),
(12, 'Deputi HRGA'),
(13, 'Departemen IT');

-- --------------------------------------------------------

--
-- Table structure for table `h1people`
--

CREATE TABLE `h1people` (
  `id_h1peop` int(11) NOT NULL,
  `no_h1peop` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `dealer_id` int(11) NOT NULL,
  `status_h1peop` int(11) NOT NULL,
  `tgl_daftar` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tgl_input` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ket_peop1` varchar(200) NOT NULL,
  `mark2` varchar(30) NOT NULL,
  `ket_peop2` varchar(200) NOT NULL,
  `mark3` varchar(30) NOT NULL,
  `ket_peop3` varchar(200) NOT NULL,
  `mark4` varchar(30) NOT NULL,
  `ket_peop4` varchar(200) NOT NULL,
  `mark5` varchar(30) NOT NULL,
  `ket_peop5` varchar(200) NOT NULL,
  `mark6` varchar(30) NOT NULL,
  `ket_peop6` varchar(200) NOT NULL,
  `mark7` varchar(30) NOT NULL,
  `ket_peop7` varchar(200) NOT NULL,
  `mark8` varchar(30) NOT NULL,
  `ket_peop8` varchar(200) NOT NULL,
  `mark9` varchar(30) NOT NULL,
  `ket_peop9` varchar(200) NOT NULL,
  `mark10` varchar(30) NOT NULL,
  `ket_peop10` varchar(200) NOT NULL,
  `mark11` varchar(30) NOT NULL,
  `ket_peop11` varchar(200) NOT NULL,
  `mark12` varchar(30) NOT NULL,
  `ket_peop12` varchar(200) NOT NULL,
  `mark13` varchar(30) NOT NULL,
  `ket_peop13` varchar(200) NOT NULL,
  `mark14` varchar(30) NOT NULL,
  `ket_peop14` varchar(200) NOT NULL,
  `mark15` varchar(30) NOT NULL,
  `ket_peop15` varchar(200) NOT NULL,
  `mark16` varchar(30) NOT NULL,
  `ket_peop16` varchar(200) NOT NULL,
  `mark17` varchar(30) NOT NULL,
  `ket_peop17` varchar(200) NOT NULL,
  `mark18` varchar(30) NOT NULL,
  `ket_peop18` varchar(200) NOT NULL,
  `mark19` varchar(30) NOT NULL,
  `ket_peop19` varchar(200) NOT NULL,
  `mark20` varchar(30) NOT NULL,
  `ket_peop20` varchar(200) NOT NULL,
  `mark21` varchar(30) NOT NULL,
  `ket_peop21` varchar(200) NOT NULL,
  `mark22` varchar(30) NOT NULL,
  `ket_peop22` varchar(200) NOT NULL,
  `mark23` varchar(30) NOT NULL,
  `ket_peop23` varchar(200) NOT NULL,
  `mark24` varchar(30) NOT NULL,
  `ket_peop24` varchar(200) NOT NULL,
  `mark25` varchar(30) NOT NULL,
  `ket_peop25` varchar(200) NOT NULL,
  `mark26` varchar(30) NOT NULL,
  `ket_peop26` varchar(200) NOT NULL,
  `mark27` varchar(30) NOT NULL,
  `ket_peop27` varchar(200) NOT NULL,
  `mark28` varchar(30) NOT NULL,
  `ket_peop28` varchar(200) NOT NULL,
  `mark29` varchar(30) NOT NULL,
  `ket_peop29` varchar(200) NOT NULL,
  `mark30` varchar(30) NOT NULL,
  `ket_peop30` varchar(200) NOT NULL,
  `mark31` varchar(30) NOT NULL,
  `ket_peop31` varchar(200) NOT NULL,
  `mark32` varchar(30) NOT NULL,
  `ket_peop32` varchar(200) NOT NULL,
  `mark33` varchar(30) NOT NULL,
  `ket_peop33` varchar(200) NOT NULL,
  `mark34` varchar(30) NOT NULL,
  `ket_peop34` varchar(200) NOT NULL,
  `mark35` varchar(30) NOT NULL,
  `ket_peop35` varchar(200) NOT NULL,
  `mark36` varchar(30) NOT NULL,
  `ket_peop36` varchar(200) NOT NULL,
  `mark37` varchar(30) NOT NULL,
  `ket_peop37` varchar(200) NOT NULL,
  `mark38` varchar(30) NOT NULL,
  `ket_peop38` varchar(200) NOT NULL,
  `mark39` varchar(30) NOT NULL,
  `ket_peop39` varchar(200) NOT NULL,
  `mark40` varchar(30) NOT NULL,
  `ket_peop40` varchar(200) NOT NULL,
  `mark41` varchar(30) NOT NULL,
  `ket_peop41` varchar(200) NOT NULL,
  `mark42` varchar(30) NOT NULL,
  `ket_peop42` varchar(200) NOT NULL,
  `mark43` varchar(30) NOT NULL,
  `ket_peop43` varchar(200) NOT NULL,
  `mark44` varchar(30) NOT NULL,
  `ket_peop44` varchar(200) NOT NULL,
  `mark45` varchar(30) NOT NULL,
  `ket_peop45` varchar(200) NOT NULL,
  `mark46` varchar(30) NOT NULL,
  `ket_peop46` varchar(200) NOT NULL,
  `mark47` varchar(30) NOT NULL,
  `ket_peop47` varchar(200) NOT NULL,
  `mark48` varchar(30) NOT NULL,
  `ket_peop48` varchar(200) NOT NULL,
  `mark49` varchar(30) NOT NULL,
  `ket_peop49` varchar(200) NOT NULL,
  `mark50` varchar(30) NOT NULL,
  `ket_peop50` varchar(200) NOT NULL,
  `mark51` varchar(30) NOT NULL,
  `ket_peop51` varchar(200) NOT NULL,
  `mark52` varchar(30) NOT NULL,
  `ket_peop52` varchar(200) NOT NULL,
  `mark53` varchar(30) NOT NULL,
  `ket_peop53` varchar(200) NOT NULL,
  `mark54` varchar(30) NOT NULL,
  `ket_peop54` varchar(200) NOT NULL,
  `mark55` varchar(30) NOT NULL,
  `ket_peop55` varchar(200) NOT NULL,
  `mark56` varchar(30) NOT NULL,
  `ket_peop56` varchar(200) NOT NULL,
  `mark57` varchar(30) NOT NULL,
  `ket_peop57` varchar(200) NOT NULL,
  `mark58` varchar(30) NOT NULL,
  `ket_peop58` varchar(200) NOT NULL,
  `mark59` varchar(30) NOT NULL,
  `ket_peop59` varchar(200) NOT NULL,
  `mark60` varchar(30) NOT NULL,
  `ket_peop60` varchar(200) NOT NULL,
  `mark61` varchar(30) NOT NULL,
  `ket_peop61` varchar(200) NOT NULL,
  `mark62` varchar(30) NOT NULL,
  `ket_peop62` varchar(200) NOT NULL,
  `mark63` varchar(30) NOT NULL,
  `ket_peop63` varchar(200) NOT NULL,
  `mark64` varchar(30) NOT NULL,
  `ket_peop64` varchar(200) NOT NULL,
  `mark65` varchar(30) NOT NULL,
  `ket_peop65` varchar(200) NOT NULL,
  `mark66` varchar(30) NOT NULL,
  `ket_peop66` varchar(200) NOT NULL,
  `mark67` varchar(30) NOT NULL,
  `ket_peop67` varchar(200) NOT NULL,
  `mark68` varchar(30) NOT NULL,
  `ket_peop68` varchar(200) NOT NULL,
  `mark69` varchar(30) NOT NULL,
  `ket_peop69` varchar(200) NOT NULL,
  `mark70` varchar(30) NOT NULL,
  `ket_peop70` varchar(200) NOT NULL,
  `mark71` varchar(30) NOT NULL,
  `ket_peop71` varchar(200) NOT NULL,
  `mark72` varchar(30) NOT NULL,
  `ket_peop72` varchar(200) NOT NULL,
  `mark73` varchar(30) NOT NULL,
  `ket_peop73` varchar(200) NOT NULL,
  `mark74` varchar(30) NOT NULL,
  `ket_peop74` varchar(200) NOT NULL,
  `mark75` varchar(30) NOT NULL,
  `ket_peop75` varchar(200) NOT NULL,
  `mark76` varchar(30) NOT NULL,
  `ket_peop76` varchar(200) NOT NULL,
  `mark77` varchar(30) NOT NULL,
  `ket_peop77` varchar(200) NOT NULL,
  `mark78` varchar(30) NOT NULL,
  `ket_peop78` varchar(200) NOT NULL,
  `mark79` varchar(30) NOT NULL,
  `ket_peop79` varchar(200) NOT NULL,
  `mark80` varchar(30) NOT NULL,
  `ket_peop80` varchar(200) NOT NULL,
  `mark81` varchar(30) NOT NULL,
  `ket_peop81` varchar(200) NOT NULL,
  `mark82` varchar(30) NOT NULL,
  `ket_peop82` varchar(200) NOT NULL,
  `mark83` varchar(30) NOT NULL,
  `ket_peop83` varchar(200) NOT NULL,
  `mark84` varchar(30) NOT NULL,
  `ket_peop84` varchar(200) NOT NULL,
  `mark85` varchar(30) NOT NULL,
  `ket_peop85` varchar(200) NOT NULL,
  `mark86` varchar(30) NOT NULL,
  `ket_peop86` varchar(200) NOT NULL,
  `mark87` varchar(30) NOT NULL,
  `ket_peop87` varchar(200) NOT NULL,
  `mark88` varchar(30) NOT NULL,
  `ket_peop88` varchar(200) NOT NULL,
  `mark89` varchar(30) NOT NULL,
  `ket_peop89` varchar(200) NOT NULL,
  `mark90` varchar(30) NOT NULL,
  `ket_peop90` varchar(200) NOT NULL,
  `mark91` varchar(30) NOT NULL,
  `ket_peop91` varchar(200) NOT NULL,
  `mark92` varchar(30) NOT NULL,
  `ket_peop92` varchar(200) NOT NULL,
  `mark93` varchar(30) NOT NULL,
  `ket_peop93` varchar(200) NOT NULL,
  `mark94` varchar(30) NOT NULL,
  `ket_peop94` varchar(200) NOT NULL,
  `mark95` varchar(30) NOT NULL,
  `ket_peop95` varchar(200) NOT NULL,
  `mark96` varchar(30) NOT NULL,
  `ket_peop96` varchar(200) NOT NULL,
  `mark97` varchar(30) NOT NULL,
  `ket_peop97` varchar(200) NOT NULL,
  `mark98` varchar(30) NOT NULL,
  `ket_peop98` varchar(200) NOT NULL,
  `mark99` varchar(30) NOT NULL,
  `ket_peop99` varchar(200) NOT NULL,
  `mark100` varchar(30) NOT NULL,
  `ket_peop100` varchar(200) NOT NULL,
  `mark101` varchar(30) NOT NULL,
  `ket_peop101` varchar(200) NOT NULL,
  `mark102` varchar(30) NOT NULL,
  `ket_peop102` varchar(200) NOT NULL,
  `mark103` varchar(30) NOT NULL,
  `ket_peop103` varchar(200) NOT NULL,
  `mark104` varchar(30) NOT NULL,
  `ket_peop104` varchar(200) NOT NULL,
  `mark105` varchar(30) NOT NULL,
  `ket_peop105` varchar(200) NOT NULL,
  `mark106` varchar(30) NOT NULL,
  `ket_peop106` varchar(200) NOT NULL,
  `mark107` varchar(30) NOT NULL,
  `ket_peop107` varchar(200) NOT NULL,
  `mark108` varchar(30) NOT NULL,
  `ket_peop108` varchar(200) NOT NULL,
  `mark109` varchar(30) NOT NULL,
  `ket_peop109` varchar(200) NOT NULL,
  `mark110` varchar(30) NOT NULL,
  `ket_peop110` varchar(200) NOT NULL,
  `mark111` varchar(30) NOT NULL,
  `ket_peop111` varchar(200) NOT NULL,
  `mark112` varchar(30) NOT NULL,
  `ket_peop112` varchar(200) NOT NULL,
  `mark113` varchar(30) NOT NULL,
  `ket_peop113` varchar(200) NOT NULL,
  `mark114` varchar(30) NOT NULL,
  `ket_peop114` varchar(200) NOT NULL,
  `mark115` varchar(30) NOT NULL,
  `ket_peop115` varchar(200) NOT NULL,
  `mark116` varchar(30) NOT NULL,
  `ket_peop116` varchar(200) NOT NULL,
  `mark117` varchar(30) NOT NULL,
  `ket_peop117` varchar(200) NOT NULL,
  `mark118` varchar(30) NOT NULL,
  `ket_peop118` varchar(200) NOT NULL,
  `mark119` varchar(30) NOT NULL,
  `ket_peop119` varchar(200) NOT NULL,
  `mark120` varchar(30) NOT NULL,
  `ket_peop120` varchar(200) NOT NULL,
  `mark121` varchar(30) NOT NULL,
  `ket_peop121` varchar(200) NOT NULL,
  `mark122` varchar(30) NOT NULL,
  `ket_peop122` varchar(200) NOT NULL,
  `mark123` varchar(30) NOT NULL,
  `ket_peop123` varchar(200) NOT NULL,
  `mark124` varchar(30) NOT NULL,
  `ket_peop124` varchar(200) NOT NULL,
  `mark125` varchar(30) NOT NULL,
  `ket_peop125` varchar(200) NOT NULL,
  `mark126` varchar(30) NOT NULL,
  `ket_peop126` varchar(200) NOT NULL,
  `mark127` varchar(30) NOT NULL,
  `ket_peop127` varchar(200) NOT NULL,
  `mark128` varchar(30) NOT NULL,
  `ket_peop128` varchar(200) NOT NULL,
  `mark1` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `h1people`
--

INSERT INTO `h1people` (`id_h1peop`, `no_h1peop`, `user_id`, `dealer_id`, `status_h1peop`, `tgl_daftar`, `tgl_input`, `ket_peop1`, `mark2`, `ket_peop2`, `mark3`, `ket_peop3`, `mark4`, `ket_peop4`, `mark5`, `ket_peop5`, `mark6`, `ket_peop6`, `mark7`, `ket_peop7`, `mark8`, `ket_peop8`, `mark9`, `ket_peop9`, `mark10`, `ket_peop10`, `mark11`, `ket_peop11`, `mark12`, `ket_peop12`, `mark13`, `ket_peop13`, `mark14`, `ket_peop14`, `mark15`, `ket_peop15`, `mark16`, `ket_peop16`, `mark17`, `ket_peop17`, `mark18`, `ket_peop18`, `mark19`, `ket_peop19`, `mark20`, `ket_peop20`, `mark21`, `ket_peop21`, `mark22`, `ket_peop22`, `mark23`, `ket_peop23`, `mark24`, `ket_peop24`, `mark25`, `ket_peop25`, `mark26`, `ket_peop26`, `mark27`, `ket_peop27`, `mark28`, `ket_peop28`, `mark29`, `ket_peop29`, `mark30`, `ket_peop30`, `mark31`, `ket_peop31`, `mark32`, `ket_peop32`, `mark33`, `ket_peop33`, `mark34`, `ket_peop34`, `mark35`, `ket_peop35`, `mark36`, `ket_peop36`, `mark37`, `ket_peop37`, `mark38`, `ket_peop38`, `mark39`, `ket_peop39`, `mark40`, `ket_peop40`, `mark41`, `ket_peop41`, `mark42`, `ket_peop42`, `mark43`, `ket_peop43`, `mark44`, `ket_peop44`, `mark45`, `ket_peop45`, `mark46`, `ket_peop46`, `mark47`, `ket_peop47`, `mark48`, `ket_peop48`, `mark49`, `ket_peop49`, `mark50`, `ket_peop50`, `mark51`, `ket_peop51`, `mark52`, `ket_peop52`, `mark53`, `ket_peop53`, `mark54`, `ket_peop54`, `mark55`, `ket_peop55`, `mark56`, `ket_peop56`, `mark57`, `ket_peop57`, `mark58`, `ket_peop58`, `mark59`, `ket_peop59`, `mark60`, `ket_peop60`, `mark61`, `ket_peop61`, `mark62`, `ket_peop62`, `mark63`, `ket_peop63`, `mark64`, `ket_peop64`, `mark65`, `ket_peop65`, `mark66`, `ket_peop66`, `mark67`, `ket_peop67`, `mark68`, `ket_peop68`, `mark69`, `ket_peop69`, `mark70`, `ket_peop70`, `mark71`, `ket_peop71`, `mark72`, `ket_peop72`, `mark73`, `ket_peop73`, `mark74`, `ket_peop74`, `mark75`, `ket_peop75`, `mark76`, `ket_peop76`, `mark77`, `ket_peop77`, `mark78`, `ket_peop78`, `mark79`, `ket_peop79`, `mark80`, `ket_peop80`, `mark81`, `ket_peop81`, `mark82`, `ket_peop82`, `mark83`, `ket_peop83`, `mark84`, `ket_peop84`, `mark85`, `ket_peop85`, `mark86`, `ket_peop86`, `mark87`, `ket_peop87`, `mark88`, `ket_peop88`, `mark89`, `ket_peop89`, `mark90`, `ket_peop90`, `mark91`, `ket_peop91`, `mark92`, `ket_peop92`, `mark93`, `ket_peop93`, `mark94`, `ket_peop94`, `mark95`, `ket_peop95`, `mark96`, `ket_peop96`, `mark97`, `ket_peop97`, `mark98`, `ket_peop98`, `mark99`, `ket_peop99`, `mark100`, `ket_peop100`, `mark101`, `ket_peop101`, `mark102`, `ket_peop102`, `mark103`, `ket_peop103`, `mark104`, `ket_peop104`, `mark105`, `ket_peop105`, `mark106`, `ket_peop106`, `mark107`, `ket_peop107`, `mark108`, `ket_peop108`, `mark109`, `ket_peop109`, `mark110`, `ket_peop110`, `mark111`, `ket_peop111`, `mark112`, `ket_peop112`, `mark113`, `ket_peop113`, `mark114`, `ket_peop114`, `mark115`, `ket_peop115`, `mark116`, `ket_peop116`, `mark117`, `ket_peop117`, `mark118`, `ket_peop118`, `mark119`, `ket_peop119`, `mark120`, `ket_peop120`, `mark121`, `ket_peop121`, `mark122`, `ket_peop122`, `mark123`, `ket_peop123`, `mark124`, `ket_peop124`, `mark125`, `ket_peop125`, `mark126`, `ket_peop126`, `mark127`, `ket_peop127`, `mark128`, `ket_peop128`, `mark1`) VALUES
(5, 906230001, 22, 1, 0, '2023-06-23 07:12:06', '2023-06-23 07:12:06', 'Data People 1', 'existgood', '', 'existgood', 'Data 3', '', '', 'existgood', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'existgood'),
(6, 906230002, 22, 2, 0, '2023-06-20 06:49:42', '2023-06-20 06:49:42', 'Data ket 1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'existgood'),
(7, 1006230001, 22, 3, 0, '2023-06-10 01:51:03', '0000-00-00 00:00:00', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0'),
(8, 2147483647, 22, 1, 0, '2023-06-23 07:47:04', '0000-00-00 00:00:00', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0'),
(9, 2147483647, 22, 2, 0, '2023-06-24 02:17:58', '0000-00-00 00:00:00', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0');

-- --------------------------------------------------------

--
-- Table structure for table `h1premises`
--

CREATE TABLE `h1premises` (
  `id_h1premises` int(11) NOT NULL,
  `no_h1premises` bigint(11) NOT NULL,
  `tgl_daftar` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tgl_input` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tgl_audit` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dealer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `statush1premises` int(4) NOT NULL,
  `stat_prem` int(2) NOT NULL,
  `stat_prem1` varchar(20) NOT NULL,
  `stat_prem2` varchar(20) NOT NULL,
  `stat_prem3` varchar(20) NOT NULL,
  `stat_prem4` varchar(20) NOT NULL,
  `stat_prem5` varchar(20) NOT NULL,
  `stat_prem6` varchar(20) NOT NULL,
  `stat_prem7` varchar(20) NOT NULL,
  `stat_prem8` varchar(20) NOT NULL,
  `stat_prem9` varchar(20) NOT NULL,
  `stat_prem10` varchar(20) NOT NULL,
  `stat_prem11` varchar(20) NOT NULL,
  `stat_prem12` varchar(20) NOT NULL,
  `stat_prem13` varchar(20) NOT NULL,
  `stat_prem14` varchar(20) NOT NULL,
  `stat_prem15` varchar(20) NOT NULL,
  `stat_prem16` varchar(20) NOT NULL,
  `stat_prem17` varchar(20) NOT NULL,
  `stat_prem18` varchar(20) NOT NULL,
  `stat_prem19` varchar(20) NOT NULL,
  `stat_prem20` varchar(20) NOT NULL,
  `stat_prem21` varchar(20) NOT NULL,
  `stat_prem22` varchar(20) NOT NULL,
  `stat_prem23` varchar(20) NOT NULL,
  `stat_prem24` varchar(20) NOT NULL,
  `stat_prem25` varchar(20) NOT NULL,
  `prem1` varchar(20) NOT NULL,
  `prem2` varchar(20) NOT NULL,
  `prem3` varchar(20) NOT NULL,
  `prem4` varchar(20) NOT NULL,
  `prem5` varchar(20) NOT NULL,
  `prem6` varchar(20) NOT NULL,
  `prem7` varchar(20) NOT NULL,
  `prem8` varchar(20) NOT NULL,
  `prem9` varchar(20) NOT NULL,
  `prem10` varchar(20) NOT NULL,
  `prem11` varchar(20) NOT NULL,
  `prem12` varchar(20) NOT NULL,
  `prem13` varchar(20) NOT NULL,
  `prem14` varchar(20) NOT NULL,
  `prem15` varchar(20) NOT NULL,
  `prem16` varchar(20) NOT NULL,
  `prem17` varchar(20) NOT NULL,
  `prem18` varchar(20) NOT NULL,
  `prem19` varchar(20) NOT NULL,
  `prem20` varchar(20) NOT NULL,
  `prem21` varchar(20) NOT NULL,
  `prem22` varchar(20) NOT NULL,
  `prem23` varchar(20) NOT NULL,
  `prem24` varchar(20) NOT NULL,
  `prem25` varchar(20) NOT NULL,
  `prem26` varchar(20) NOT NULL,
  `prem27` varchar(20) NOT NULL,
  `prem28` varchar(20) NOT NULL,
  `prem29` varchar(20) NOT NULL,
  `prem30` varchar(20) NOT NULL,
  `prem31` varchar(20) NOT NULL,
  `prem32` varchar(20) NOT NULL,
  `prem33` varchar(20) NOT NULL,
  `prem34` varchar(20) NOT NULL,
  `prem35` varchar(20) NOT NULL,
  `prem36` varchar(20) NOT NULL,
  `prem37` varchar(20) NOT NULL,
  `prem38` varchar(20) NOT NULL,
  `prem39` varchar(20) NOT NULL,
  `prem40` varchar(20) NOT NULL,
  `prem41` varchar(20) NOT NULL,
  `prem42` varchar(20) NOT NULL,
  `prem43` varchar(20) NOT NULL,
  `prem44` varchar(20) NOT NULL,
  `prem45` varchar(20) NOT NULL,
  `prem46` varchar(20) NOT NULL,
  `prem47` varchar(20) NOT NULL,
  `prem48` varchar(20) NOT NULL,
  `prem49` varchar(20) NOT NULL,
  `prem50` varchar(20) NOT NULL,
  `prem51` varchar(20) NOT NULL,
  `prem52` varchar(20) NOT NULL,
  `prem53` varchar(20) NOT NULL,
  `prem54` varchar(20) NOT NULL,
  `prem55` varchar(20) NOT NULL,
  `prem56` varchar(20) NOT NULL,
  `prem57` varchar(20) NOT NULL,
  `prem58` varchar(20) NOT NULL,
  `prem59` varchar(20) NOT NULL,
  `prem60` varchar(20) NOT NULL,
  `prem61` varchar(20) NOT NULL,
  `prem62` varchar(20) NOT NULL,
  `prem63` varchar(20) NOT NULL,
  `prem64` varchar(20) NOT NULL,
  `prem65` varchar(20) NOT NULL,
  `prem66` varchar(20) NOT NULL,
  `prem67` varchar(20) NOT NULL,
  `prem68` varchar(20) NOT NULL,
  `prem69` varchar(20) NOT NULL,
  `prem70` varchar(20) NOT NULL,
  `prem71` varchar(20) NOT NULL,
  `prem72` varchar(20) NOT NULL,
  `prem73` varchar(20) NOT NULL,
  `prem74` varchar(20) NOT NULL,
  `prem75` varchar(20) NOT NULL,
  `prem76` varchar(20) NOT NULL,
  `prem77` varchar(20) NOT NULL,
  `prem78` varchar(20) NOT NULL,
  `prem79` varchar(20) NOT NULL,
  `prem80` varchar(20) NOT NULL,
  `prem81` varchar(20) NOT NULL,
  `prem82` varchar(20) NOT NULL,
  `prem83` varchar(20) NOT NULL,
  `prem84` varchar(20) NOT NULL,
  `prem85` varchar(20) NOT NULL,
  `prem86` varchar(20) NOT NULL,
  `prem87` varchar(20) NOT NULL,
  `prem88` varchar(20) NOT NULL,
  `prem89` varchar(20) NOT NULL,
  `prem90` varchar(20) NOT NULL,
  `prem91` varchar(20) NOT NULL,
  `prem92` varchar(20) NOT NULL,
  `prem93` varchar(20) NOT NULL,
  `prem94` varchar(20) NOT NULL,
  `prem95` varchar(20) NOT NULL,
  `prem96` varchar(20) NOT NULL,
  `prem97` varchar(20) NOT NULL,
  `prem98` varchar(20) NOT NULL,
  `prem99` varchar(20) NOT NULL,
  `prem100` varchar(20) NOT NULL,
  `prem101` varchar(20) NOT NULL,
  `prem102` varchar(20) NOT NULL,
  `prem103` varchar(20) NOT NULL,
  `prem104` varchar(20) NOT NULL,
  `prem105` varchar(20) NOT NULL,
  `prem106` varchar(20) NOT NULL,
  `prem107` varchar(20) NOT NULL,
  `prem108` varchar(20) NOT NULL,
  `ket_prem1` varchar(20) NOT NULL,
  `ket_prem2` varchar(20) NOT NULL,
  `ket_prem3` varchar(20) NOT NULL,
  `ket_prem4` varchar(20) NOT NULL,
  `ket_prem5` varchar(20) NOT NULL,
  `ket_prem6` varchar(20) NOT NULL,
  `ket_prem7` varchar(20) NOT NULL,
  `ket_prem8` varchar(20) NOT NULL,
  `ket_prem9` varchar(20) NOT NULL,
  `ket_prem10` varchar(20) NOT NULL,
  `ket_prem11` varchar(20) NOT NULL,
  `ket_prem12` varchar(20) NOT NULL,
  `ket_prem13` varchar(20) NOT NULL,
  `ket_prem14` varchar(20) NOT NULL,
  `ket_prem15` varchar(20) NOT NULL,
  `ket_prem16` varchar(20) NOT NULL,
  `ket_prem17` varchar(20) NOT NULL,
  `ket_prem18` varchar(20) NOT NULL,
  `ket_prem19` varchar(20) NOT NULL,
  `ket_prem20` varchar(20) NOT NULL,
  `ket_prem21` varchar(20) NOT NULL,
  `ket_prem22` varchar(20) NOT NULL,
  `ket_prem23` varchar(20) NOT NULL,
  `ket_prem24` varchar(20) NOT NULL,
  `ket_prem25` varchar(20) NOT NULL,
  `ket_prem26` varchar(20) NOT NULL,
  `ket_prem27` varchar(20) NOT NULL,
  `ket_prem28` varchar(20) NOT NULL,
  `ket_prem29` varchar(20) NOT NULL,
  `ket_prem30` varchar(20) NOT NULL,
  `ket_prem31` varchar(20) NOT NULL,
  `ket_prem32` varchar(20) NOT NULL,
  `ket_prem33` varchar(20) NOT NULL,
  `ket_prem34` varchar(20) NOT NULL,
  `ket_prem35` varchar(20) NOT NULL,
  `ket_prem36` varchar(20) NOT NULL,
  `ket_prem37` varchar(20) NOT NULL,
  `ket_prem38` varchar(20) NOT NULL,
  `ket_prem39` varchar(20) NOT NULL,
  `ket_prem40` varchar(20) NOT NULL,
  `ket_prem41` varchar(20) NOT NULL,
  `ket_prem42` varchar(20) NOT NULL,
  `ket_prem43` varchar(20) NOT NULL,
  `ket_prem44` varchar(20) NOT NULL,
  `ket_prem45` varchar(20) NOT NULL,
  `ket_prem46` varchar(20) NOT NULL,
  `ket_prem47` varchar(20) NOT NULL,
  `ket_prem48` varchar(20) NOT NULL,
  `ket_prem49` varchar(20) NOT NULL,
  `ket_prem50` varchar(20) NOT NULL,
  `ket_prem51` varchar(20) NOT NULL,
  `ket_prem52` varchar(20) NOT NULL,
  `ket_prem53` varchar(20) NOT NULL,
  `ket_prem54` varchar(20) NOT NULL,
  `ket_prem55` varchar(20) NOT NULL,
  `ket_prem56` varchar(20) NOT NULL,
  `ket_prem57` varchar(20) NOT NULL,
  `ket_prem58` varchar(20) NOT NULL,
  `ket_prem59` varchar(20) NOT NULL,
  `ket_prem60` varchar(20) NOT NULL,
  `ket_prem61` varchar(20) NOT NULL,
  `ket_prem62` varchar(20) NOT NULL,
  `ket_prem63` varchar(20) NOT NULL,
  `ket_prem64` varchar(20) NOT NULL,
  `ket_prem65` varchar(20) NOT NULL,
  `ket_prem66` varchar(20) NOT NULL,
  `ket_prem67` varchar(20) NOT NULL,
  `ket_prem68` varchar(20) NOT NULL,
  `ket_prem69` varchar(20) NOT NULL,
  `ket_prem70` varchar(20) NOT NULL,
  `ket_prem71` varchar(20) NOT NULL,
  `ket_prem72` varchar(20) NOT NULL,
  `ket_prem73` varchar(20) NOT NULL,
  `ket_prem74` varchar(20) NOT NULL,
  `ket_prem75` varchar(20) NOT NULL,
  `ket_prem76` varchar(20) NOT NULL,
  `ket_prem77` varchar(20) NOT NULL,
  `ket_prem78` varchar(20) NOT NULL,
  `ket_prem79` varchar(20) NOT NULL,
  `ket_prem80` varchar(20) NOT NULL,
  `ket_prem81` varchar(20) NOT NULL,
  `ket_prem82` varchar(20) NOT NULL,
  `ket_prem83` varchar(20) NOT NULL,
  `ket_prem84` varchar(20) NOT NULL,
  `ket_prem85` varchar(20) NOT NULL,
  `ket_prem86` varchar(20) NOT NULL,
  `ket_prem87` varchar(20) NOT NULL,
  `ket_prem88` varchar(20) NOT NULL,
  `ket_prem89` varchar(20) NOT NULL,
  `ket_prem90` varchar(20) NOT NULL,
  `ket_prem91` varchar(20) NOT NULL,
  `ket_prem92` varchar(20) NOT NULL,
  `ket_prem93` varchar(20) NOT NULL,
  `ket_prem94` varchar(20) NOT NULL,
  `ket_prem95` varchar(20) NOT NULL,
  `ket_prem96` varchar(20) NOT NULL,
  `ket_prem97` varchar(20) NOT NULL,
  `ket_prem98` varchar(20) NOT NULL,
  `ket_prem99` varchar(20) NOT NULL,
  `ket_prem100` varchar(20) NOT NULL,
  `ket_prem101` varchar(20) NOT NULL,
  `ket_prem102` varchar(20) NOT NULL,
  `ket_prem103` varchar(20) NOT NULL,
  `ket_prem104` varchar(20) NOT NULL,
  `ket_prem105` varchar(20) NOT NULL,
  `ket_prem106` varchar(20) NOT NULL,
  `ket_prem107` varchar(20) NOT NULL,
  `ket_prem108` varchar(20) NOT NULL,
  `gambar_prem1` varchar(50) NOT NULL,
  `gambar_prem2` varchar(50) NOT NULL,
  `gambar_prem3` varchar(50) NOT NULL,
  `gambar_prem4` varchar(50) NOT NULL,
  `gambar_prem5` varchar(50) NOT NULL,
  `gambar_prem6` varchar(50) NOT NULL,
  `gambar_prem7` varchar(50) NOT NULL,
  `gambar_prem8` varchar(50) NOT NULL,
  `gambar_prem9` varchar(50) NOT NULL,
  `gambar_prem10` varchar(50) NOT NULL,
  `gambar_prem11` varchar(50) NOT NULL,
  `gambar_prem12` varchar(50) NOT NULL,
  `gambar_prem13` varchar(50) NOT NULL,
  `gambar_prem14` varchar(50) NOT NULL,
  `gambar_prem15` varchar(50) NOT NULL,
  `gambar_prem16` varchar(50) NOT NULL,
  `gambar_prem17` varchar(50) NOT NULL,
  `gambar_prem18` varchar(50) NOT NULL,
  `gambar_prem19` varchar(50) NOT NULL,
  `gambar_prem20` varchar(50) NOT NULL,
  `gambar_prem21` varchar(50) NOT NULL,
  `gambar_prem22` varchar(50) NOT NULL,
  `gambar_prem23` varchar(50) NOT NULL,
  `gambar_prem24` varchar(50) NOT NULL,
  `gambar_prem25` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `h1premises`
--

INSERT INTO `h1premises` (`id_h1premises`, `no_h1premises`, `tgl_daftar`, `tgl_input`, `tgl_audit`, `dealer_id`, `user_id`, `statush1premises`, `stat_prem`, `stat_prem1`, `stat_prem2`, `stat_prem3`, `stat_prem4`, `stat_prem5`, `stat_prem6`, `stat_prem7`, `stat_prem8`, `stat_prem9`, `stat_prem10`, `stat_prem11`, `stat_prem12`, `stat_prem13`, `stat_prem14`, `stat_prem15`, `stat_prem16`, `stat_prem17`, `stat_prem18`, `stat_prem19`, `stat_prem20`, `stat_prem21`, `stat_prem22`, `stat_prem23`, `stat_prem24`, `stat_prem25`, `prem1`, `prem2`, `prem3`, `prem4`, `prem5`, `prem6`, `prem7`, `prem8`, `prem9`, `prem10`, `prem11`, `prem12`, `prem13`, `prem14`, `prem15`, `prem16`, `prem17`, `prem18`, `prem19`, `prem20`, `prem21`, `prem22`, `prem23`, `prem24`, `prem25`, `prem26`, `prem27`, `prem28`, `prem29`, `prem30`, `prem31`, `prem32`, `prem33`, `prem34`, `prem35`, `prem36`, `prem37`, `prem38`, `prem39`, `prem40`, `prem41`, `prem42`, `prem43`, `prem44`, `prem45`, `prem46`, `prem47`, `prem48`, `prem49`, `prem50`, `prem51`, `prem52`, `prem53`, `prem54`, `prem55`, `prem56`, `prem57`, `prem58`, `prem59`, `prem60`, `prem61`, `prem62`, `prem63`, `prem64`, `prem65`, `prem66`, `prem67`, `prem68`, `prem69`, `prem70`, `prem71`, `prem72`, `prem73`, `prem74`, `prem75`, `prem76`, `prem77`, `prem78`, `prem79`, `prem80`, `prem81`, `prem82`, `prem83`, `prem84`, `prem85`, `prem86`, `prem87`, `prem88`, `prem89`, `prem90`, `prem91`, `prem92`, `prem93`, `prem94`, `prem95`, `prem96`, `prem97`, `prem98`, `prem99`, `prem100`, `prem101`, `prem102`, `prem103`, `prem104`, `prem105`, `prem106`, `prem107`, `prem108`, `ket_prem1`, `ket_prem2`, `ket_prem3`, `ket_prem4`, `ket_prem5`, `ket_prem6`, `ket_prem7`, `ket_prem8`, `ket_prem9`, `ket_prem10`, `ket_prem11`, `ket_prem12`, `ket_prem13`, `ket_prem14`, `ket_prem15`, `ket_prem16`, `ket_prem17`, `ket_prem18`, `ket_prem19`, `ket_prem20`, `ket_prem21`, `ket_prem22`, `ket_prem23`, `ket_prem24`, `ket_prem25`, `ket_prem26`, `ket_prem27`, `ket_prem28`, `ket_prem29`, `ket_prem30`, `ket_prem31`, `ket_prem32`, `ket_prem33`, `ket_prem34`, `ket_prem35`, `ket_prem36`, `ket_prem37`, `ket_prem38`, `ket_prem39`, `ket_prem40`, `ket_prem41`, `ket_prem42`, `ket_prem43`, `ket_prem44`, `ket_prem45`, `ket_prem46`, `ket_prem47`, `ket_prem48`, `ket_prem49`, `ket_prem50`, `ket_prem51`, `ket_prem52`, `ket_prem53`, `ket_prem54`, `ket_prem55`, `ket_prem56`, `ket_prem57`, `ket_prem58`, `ket_prem59`, `ket_prem60`, `ket_prem61`, `ket_prem62`, `ket_prem63`, `ket_prem64`, `ket_prem65`, `ket_prem66`, `ket_prem67`, `ket_prem68`, `ket_prem69`, `ket_prem70`, `ket_prem71`, `ket_prem72`, `ket_prem73`, `ket_prem74`, `ket_prem75`, `ket_prem76`, `ket_prem77`, `ket_prem78`, `ket_prem79`, `ket_prem80`, `ket_prem81`, `ket_prem82`, `ket_prem83`, `ket_prem84`, `ket_prem85`, `ket_prem86`, `ket_prem87`, `ket_prem88`, `ket_prem89`, `ket_prem90`, `ket_prem91`, `ket_prem92`, `ket_prem93`, `ket_prem94`, `ket_prem95`, `ket_prem96`, `ket_prem97`, `ket_prem98`, `ket_prem99`, `ket_prem100`, `ket_prem101`, `ket_prem102`, `ket_prem103`, `ket_prem104`, `ket_prem105`, `ket_prem106`, `ket_prem107`, `ket_prem108`, `gambar_prem1`, `gambar_prem2`, `gambar_prem3`, `gambar_prem4`, `gambar_prem5`, `gambar_prem6`, `gambar_prem7`, `gambar_prem8`, `gambar_prem9`, `gambar_prem10`, `gambar_prem11`, `gambar_prem12`, `gambar_prem13`, `gambar_prem14`, `gambar_prem15`, `gambar_prem16`, `gambar_prem17`, `gambar_prem18`, `gambar_prem19`, `gambar_prem20`, `gambar_prem21`, `gambar_prem22`, `gambar_prem23`, `gambar_prem24`, `gambar_prem25`) VALUES
(37, 3005230001, '2023-05-30 08:35:51', '0000-00-00 00:00:00', '2023-05-30 08:35:51', 1, 0, 0, 0, '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(38, 3005230002, '2023-05-30 08:35:56', '0000-00-00 00:00:00', '2023-05-30 08:35:56', 2, 0, 0, 0, '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(43, 606230001, '2023-06-06 03:29:18', '0000-00-00 00:00:00', '2023-06-06 03:29:18', 53, 0, 0, 0, '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `h1process`
--

CREATE TABLE `h1process` (
  `id_h1proc1` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `dealer_id` int(11) NOT NULL,
  `status_h1proc` int(11) NOT NULL,
  `no_h1proc` int(20) NOT NULL,
  `tgl_daftar` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tgl_input` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `mark1` varchar(30) NOT NULL,
  `ket_proc1` varchar(200) NOT NULL,
  `gmbr_proc1` text NOT NULL,
  `mark2` varchar(30) NOT NULL,
  `ket_proc2` varchar(200) NOT NULL,
  `mark3` varchar(30) NOT NULL,
  `ket_proc3` varchar(200) NOT NULL,
  `mark4` varchar(30) NOT NULL,
  `ket_proc4` varchar(200) NOT NULL,
  `mark5` varchar(30) NOT NULL,
  `ket_proc5` varchar(200) NOT NULL,
  `mark6` varchar(30) NOT NULL,
  `ket_proc6` varchar(200) NOT NULL,
  `mark7` varchar(30) NOT NULL,
  `ket_proc7` varchar(200) NOT NULL,
  `mark8` varchar(30) NOT NULL,
  `ket_proc8` varchar(200) NOT NULL,
  `mark9` varchar(30) NOT NULL,
  `ket_proc9` varchar(200) NOT NULL,
  `mark10` varchar(30) NOT NULL,
  `ket_proc10` varchar(200) NOT NULL,
  `mark11` varchar(30) NOT NULL,
  `ket_proc11` varchar(200) NOT NULL,
  `mark12` varchar(30) NOT NULL,
  `ket_proc12` varchar(200) NOT NULL,
  `mark13` varchar(30) NOT NULL,
  `ket_proc13` varchar(200) NOT NULL,
  `mark14` varchar(30) NOT NULL,
  `ket_proc14` varchar(200) NOT NULL,
  `mark15` varchar(30) NOT NULL,
  `ket_proc15` varchar(200) NOT NULL,
  `mark16` varchar(30) NOT NULL,
  `ket_proc16` varchar(200) NOT NULL,
  `mark17` varchar(30) NOT NULL,
  `ket_proc17` varchar(200) NOT NULL,
  `mark18` varchar(30) NOT NULL,
  `ket_proc18` varchar(200) NOT NULL,
  `mark19` varchar(30) NOT NULL,
  `ket_proc19` varchar(200) NOT NULL,
  `mark20` varchar(30) NOT NULL,
  `ket_proc20` varchar(200) NOT NULL,
  `mark21` varchar(30) NOT NULL,
  `ket_proc21` varchar(200) NOT NULL,
  `mark22` varchar(30) NOT NULL,
  `ket_proc22` varchar(200) NOT NULL,
  `mark23` varchar(30) NOT NULL,
  `ket_proc23` varchar(200) NOT NULL,
  `mark24` varchar(30) NOT NULL,
  `ket_proc24` varchar(200) NOT NULL,
  `mark25` varchar(30) NOT NULL,
  `ket_proc25` varchar(200) NOT NULL,
  `mark26` varchar(30) NOT NULL,
  `ket_proc26` varchar(200) NOT NULL,
  `mark27` varchar(30) NOT NULL,
  `ket_proc27` varchar(200) NOT NULL,
  `mark28` varchar(30) NOT NULL,
  `ket_proc28` varchar(200) NOT NULL,
  `mark29` varchar(30) NOT NULL,
  `ket_proc29` varchar(200) NOT NULL,
  `mark30` varchar(30) NOT NULL,
  `ket_proc30` varchar(200) NOT NULL,
  `mark31` varchar(30) NOT NULL,
  `ket_proc31` varchar(200) NOT NULL,
  `mark32` varchar(30) NOT NULL,
  `ket_proc32` varchar(200) NOT NULL,
  `mark33` varchar(30) NOT NULL,
  `ket_proc33` varchar(200) NOT NULL,
  `mark34` varchar(30) NOT NULL,
  `ket_proc34` varchar(200) NOT NULL,
  `mark35` varchar(30) NOT NULL,
  `ket_proc35` varchar(200) NOT NULL,
  `mark36` varchar(30) NOT NULL,
  `ket_proc36` varchar(200) NOT NULL,
  `mark37` varchar(30) NOT NULL,
  `ket_proc37` varchar(200) NOT NULL,
  `mark38` varchar(30) NOT NULL,
  `ket_proc38` varchar(200) NOT NULL,
  `mark39` varchar(30) NOT NULL,
  `ket_proc39` varchar(200) NOT NULL,
  `mark40` varchar(30) NOT NULL,
  `ket_proc40` varchar(200) NOT NULL,
  `mark41` varchar(30) NOT NULL,
  `ket_proc41` varchar(200) NOT NULL,
  `mark42` varchar(30) NOT NULL,
  `ket_proc42` varchar(200) NOT NULL,
  `mark43` varchar(30) NOT NULL,
  `ket_proc43` varchar(200) NOT NULL,
  `mark44` varchar(30) NOT NULL,
  `ket_proc44` varchar(200) NOT NULL,
  `mark45` varchar(30) NOT NULL,
  `ket_proc45` varchar(200) NOT NULL,
  `mark46` varchar(30) NOT NULL,
  `ket_proc46` varchar(200) NOT NULL,
  `mark47` varchar(30) NOT NULL,
  `ket_proc47` varchar(200) NOT NULL,
  `mark48` varchar(30) NOT NULL,
  `ket_proc48` varchar(200) NOT NULL,
  `mark49` varchar(30) NOT NULL,
  `ket_proc49` varchar(200) NOT NULL,
  `mark50` varchar(30) NOT NULL,
  `ket_proc50` varchar(200) NOT NULL,
  `mark51` varchar(30) NOT NULL,
  `ket_proc51` varchar(200) NOT NULL,
  `mark52` varchar(30) NOT NULL,
  `ket_proc52` varchar(200) NOT NULL,
  `mark53` varchar(30) NOT NULL,
  `ket_proc53` varchar(200) NOT NULL,
  `mark54` varchar(30) NOT NULL,
  `ket_proc54` varchar(200) NOT NULL,
  `mark55` varchar(30) NOT NULL,
  `ket_proc55` varchar(200) NOT NULL,
  `mark56` varchar(30) NOT NULL,
  `ket_proc56` varchar(200) NOT NULL,
  `mark57` varchar(30) NOT NULL,
  `ket_proc57` varchar(200) NOT NULL,
  `mark58` varchar(30) NOT NULL,
  `ket_proc58` varchar(200) NOT NULL,
  `mark59` varchar(30) NOT NULL,
  `ket_proc59` varchar(200) NOT NULL,
  `mark60` varchar(30) NOT NULL,
  `ket_proc60` varchar(200) NOT NULL,
  `mark61` varchar(30) NOT NULL,
  `ket_proc61` varchar(200) NOT NULL,
  `mark62` varchar(30) NOT NULL,
  `ket_proc62` varchar(200) NOT NULL,
  `mark63` varchar(30) NOT NULL,
  `ket_proc63` varchar(200) NOT NULL,
  `mark64` varchar(30) NOT NULL,
  `ket_proc64` varchar(200) NOT NULL,
  `mark65` varchar(30) NOT NULL,
  `ket_proc65` varchar(200) NOT NULL,
  `mark66` varchar(30) NOT NULL,
  `ket_proc66` varchar(200) NOT NULL,
  `mark67` varchar(30) NOT NULL,
  `ket_proc67` varchar(200) NOT NULL,
  `mark68` varchar(30) NOT NULL,
  `ket_proc68` varchar(200) NOT NULL,
  `mark69` varchar(30) NOT NULL,
  `ket_proc69` varchar(200) NOT NULL,
  `mark70` varchar(30) NOT NULL,
  `ket_proc70` varchar(200) NOT NULL,
  `mark71` varchar(30) NOT NULL,
  `ket_proc71` varchar(200) NOT NULL,
  `mark72` varchar(30) NOT NULL,
  `ket_proc72` varchar(200) NOT NULL,
  `mark73` varchar(30) NOT NULL,
  `ket_proc73` varchar(200) NOT NULL,
  `mark74` varchar(30) NOT NULL,
  `ket_proc74` varchar(200) NOT NULL,
  `mark75` varchar(30) NOT NULL,
  `ket_proc75` varchar(200) NOT NULL,
  `mark76` varchar(30) NOT NULL,
  `ket_proc76` varchar(200) NOT NULL,
  `mark77` varchar(30) NOT NULL,
  `ket_proc77` varchar(200) NOT NULL,
  `mark78` varchar(30) NOT NULL,
  `ket_proc78` varchar(200) NOT NULL,
  `mark79` varchar(30) NOT NULL,
  `ket_proc79` varchar(200) NOT NULL,
  `mark80` varchar(30) NOT NULL,
  `ket_proc80` varchar(200) NOT NULL,
  `mark81` varchar(30) NOT NULL,
  `ket_proc81` varchar(200) NOT NULL,
  `mark82` varchar(30) NOT NULL,
  `ket_proc82` varchar(200) NOT NULL,
  `mark83` varchar(30) NOT NULL,
  `ket_proc83` varchar(200) NOT NULL,
  `mark84` varchar(30) NOT NULL,
  `ket_proc84` varchar(200) NOT NULL,
  `mark85` varchar(30) NOT NULL,
  `ket_proc85` varchar(200) NOT NULL,
  `mark86` varchar(30) NOT NULL,
  `ket_proc86` varchar(200) NOT NULL,
  `mark87` varchar(30) NOT NULL,
  `ket_proc87` varchar(200) NOT NULL,
  `mark88` varchar(30) NOT NULL,
  `ket_proc88` varchar(200) NOT NULL,
  `mark89` varchar(30) NOT NULL,
  `ket_proc89` varchar(200) NOT NULL,
  `mark90` varchar(30) NOT NULL,
  `ket_proc90` varchar(200) NOT NULL,
  `mark91` varchar(30) NOT NULL,
  `ket_proc91` varchar(200) NOT NULL,
  `mark92` varchar(30) NOT NULL,
  `ket_proc92` varchar(200) NOT NULL,
  `mark93` varchar(30) NOT NULL,
  `ket_proc93` varchar(200) NOT NULL,
  `mark94` varchar(30) NOT NULL,
  `ket_proc94` varchar(200) NOT NULL,
  `mark95` varchar(30) NOT NULL,
  `ket_proc95` varchar(200) NOT NULL,
  `mark96` varchar(30) NOT NULL,
  `ket_proc96` varchar(200) NOT NULL,
  `mark97` varchar(30) NOT NULL,
  `ket_proc97` varchar(200) NOT NULL,
  `mark98` varchar(30) NOT NULL,
  `ket_proc98` varchar(200) NOT NULL,
  `mark99` varchar(30) NOT NULL,
  `ket_proc99` varchar(200) NOT NULL,
  `mark100` varchar(30) NOT NULL,
  `ket_proc100` varchar(200) NOT NULL,
  `mark101` varchar(30) NOT NULL,
  `ket_proc101` varchar(200) NOT NULL,
  `mark102` varchar(30) NOT NULL,
  `ket_proc102` varchar(200) NOT NULL,
  `mark103` varchar(30) NOT NULL,
  `ket_proc103` varchar(200) NOT NULL,
  `mark104` varchar(30) NOT NULL,
  `ket_proc104` varchar(200) NOT NULL,
  `mark105` varchar(30) NOT NULL,
  `ket_proc105` varchar(200) NOT NULL,
  `mark106` varchar(30) NOT NULL,
  `ket_proc106` varchar(200) NOT NULL,
  `mark107` varchar(30) NOT NULL,
  `ket_proc107` varchar(200) NOT NULL,
  `mark108` varchar(30) NOT NULL,
  `ket_proc108` varchar(200) NOT NULL,
  `mark109` varchar(30) NOT NULL,
  `ket_proc109` varchar(200) NOT NULL,
  `mark110` varchar(30) NOT NULL,
  `ket_proc110` varchar(200) NOT NULL,
  `mark111` varchar(30) NOT NULL,
  `ket_proc111` varchar(200) NOT NULL,
  `mark112` varchar(30) NOT NULL,
  `ket_proc112` varchar(200) NOT NULL,
  `mark113` varchar(30) NOT NULL,
  `ket_proc113` varchar(200) NOT NULL,
  `mark114` varchar(30) NOT NULL,
  `ket_proc114` varchar(200) NOT NULL,
  `mark115` varchar(30) NOT NULL,
  `ket_proc115` varchar(200) NOT NULL,
  `mark116` varchar(30) NOT NULL,
  `ket_proc116` varchar(200) NOT NULL,
  `mark117` varchar(30) NOT NULL,
  `ket_proc117` varchar(200) NOT NULL,
  `mark118` varchar(30) NOT NULL,
  `ket_proc118` varchar(200) NOT NULL,
  `mark119` varchar(30) NOT NULL,
  `ket_proc119` varchar(200) NOT NULL,
  `mark120` varchar(30) NOT NULL,
  `ket_proc120` varchar(200) NOT NULL,
  `mark121` varchar(30) NOT NULL,
  `ket_proc121` varchar(200) NOT NULL,
  `mark122` varchar(30) NOT NULL,
  `ket_proc122` varchar(200) NOT NULL,
  `mark123` varchar(30) NOT NULL,
  `ket_proc123` varchar(200) NOT NULL,
  `mark124` varchar(30) NOT NULL,
  `ket_proc124` varchar(200) NOT NULL,
  `mark125` varchar(30) NOT NULL,
  `ket_proc125` varchar(200) NOT NULL,
  `mark126` varchar(30) NOT NULL,
  `ket_proc126` varchar(200) NOT NULL,
  `mark127` varchar(30) NOT NULL,
  `ket_proc127` varchar(200) NOT NULL,
  `mark128` varchar(30) NOT NULL,
  `ket_proc128` varchar(200) NOT NULL,
  `gmbr_proc2` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `h1process`
--

INSERT INTO `h1process` (`id_h1proc1`, `user_id`, `dealer_id`, `status_h1proc`, `no_h1proc`, `tgl_daftar`, `tgl_input`, `mark1`, `ket_proc1`, `gmbr_proc1`, `mark2`, `ket_proc2`, `mark3`, `ket_proc3`, `mark4`, `ket_proc4`, `mark5`, `ket_proc5`, `mark6`, `ket_proc6`, `mark7`, `ket_proc7`, `mark8`, `ket_proc8`, `mark9`, `ket_proc9`, `mark10`, `ket_proc10`, `mark11`, `ket_proc11`, `mark12`, `ket_proc12`, `mark13`, `ket_proc13`, `mark14`, `ket_proc14`, `mark15`, `ket_proc15`, `mark16`, `ket_proc16`, `mark17`, `ket_proc17`, `mark18`, `ket_proc18`, `mark19`, `ket_proc19`, `mark20`, `ket_proc20`, `mark21`, `ket_proc21`, `mark22`, `ket_proc22`, `mark23`, `ket_proc23`, `mark24`, `ket_proc24`, `mark25`, `ket_proc25`, `mark26`, `ket_proc26`, `mark27`, `ket_proc27`, `mark28`, `ket_proc28`, `mark29`, `ket_proc29`, `mark30`, `ket_proc30`, `mark31`, `ket_proc31`, `mark32`, `ket_proc32`, `mark33`, `ket_proc33`, `mark34`, `ket_proc34`, `mark35`, `ket_proc35`, `mark36`, `ket_proc36`, `mark37`, `ket_proc37`, `mark38`, `ket_proc38`, `mark39`, `ket_proc39`, `mark40`, `ket_proc40`, `mark41`, `ket_proc41`, `mark42`, `ket_proc42`, `mark43`, `ket_proc43`, `mark44`, `ket_proc44`, `mark45`, `ket_proc45`, `mark46`, `ket_proc46`, `mark47`, `ket_proc47`, `mark48`, `ket_proc48`, `mark49`, `ket_proc49`, `mark50`, `ket_proc50`, `mark51`, `ket_proc51`, `mark52`, `ket_proc52`, `mark53`, `ket_proc53`, `mark54`, `ket_proc54`, `mark55`, `ket_proc55`, `mark56`, `ket_proc56`, `mark57`, `ket_proc57`, `mark58`, `ket_proc58`, `mark59`, `ket_proc59`, `mark60`, `ket_proc60`, `mark61`, `ket_proc61`, `mark62`, `ket_proc62`, `mark63`, `ket_proc63`, `mark64`, `ket_proc64`, `mark65`, `ket_proc65`, `mark66`, `ket_proc66`, `mark67`, `ket_proc67`, `mark68`, `ket_proc68`, `mark69`, `ket_proc69`, `mark70`, `ket_proc70`, `mark71`, `ket_proc71`, `mark72`, `ket_proc72`, `mark73`, `ket_proc73`, `mark74`, `ket_proc74`, `mark75`, `ket_proc75`, `mark76`, `ket_proc76`, `mark77`, `ket_proc77`, `mark78`, `ket_proc78`, `mark79`, `ket_proc79`, `mark80`, `ket_proc80`, `mark81`, `ket_proc81`, `mark82`, `ket_proc82`, `mark83`, `ket_proc83`, `mark84`, `ket_proc84`, `mark85`, `ket_proc85`, `mark86`, `ket_proc86`, `mark87`, `ket_proc87`, `mark88`, `ket_proc88`, `mark89`, `ket_proc89`, `mark90`, `ket_proc90`, `mark91`, `ket_proc91`, `mark92`, `ket_proc92`, `mark93`, `ket_proc93`, `mark94`, `ket_proc94`, `mark95`, `ket_proc95`, `mark96`, `ket_proc96`, `mark97`, `ket_proc97`, `mark98`, `ket_proc98`, `mark99`, `ket_proc99`, `mark100`, `ket_proc100`, `mark101`, `ket_proc101`, `mark102`, `ket_proc102`, `mark103`, `ket_proc103`, `mark104`, `ket_proc104`, `mark105`, `ket_proc105`, `mark106`, `ket_proc106`, `mark107`, `ket_proc107`, `mark108`, `ket_proc108`, `mark109`, `ket_proc109`, `mark110`, `ket_proc110`, `mark111`, `ket_proc111`, `mark112`, `ket_proc112`, `mark113`, `ket_proc113`, `mark114`, `ket_proc114`, `mark115`, `ket_proc115`, `mark116`, `ket_proc116`, `mark117`, `ket_proc117`, `mark118`, `ket_proc118`, `mark119`, `ket_proc119`, `mark120`, `ket_proc120`, `mark121`, `ket_proc121`, `mark122`, `ket_proc122`, `mark123`, `ket_proc123`, `mark124`, `ket_proc124`, `mark125`, `ket_proc125`, `mark126`, `ket_proc126`, `mark127`, `ket_proc127`, `mark128`, `ket_proc128`, `gmbr_proc2`) VALUES
(1, 22, 1, 0, 906230001, '2023-06-09 07:23:10', '0000-00-00 00:00:00', '0', '0', '', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(2, 22, 2, 0, 906230002, '2023-06-09 07:24:09', '0000-00-00 00:00:00', '0', '0', '', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(3, 22, 3, 0, 1006230001, '2023-06-10 07:17:16', '0000-00-00 00:00:00', '0', '0', '', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `h23people`
--

CREATE TABLE `h23people` (
  `id_h23peop` int(11) NOT NULL,
  `no_h23peop` int(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `dealer_id` int(11) NOT NULL,
  `status_h23peop` int(11) NOT NULL,
  `tgl_daftar` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tgl_input` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `mark1` varchar(30) NOT NULL,
  `ket_peop1` varchar(200) NOT NULL,
  `mark2` varchar(30) NOT NULL,
  `ket_peop2` varchar(200) NOT NULL,
  `mark3` varchar(30) NOT NULL,
  `ket_peop3` varchar(20) NOT NULL,
  `mark4` varchar(30) NOT NULL,
  `ket_peop4` varchar(200) NOT NULL,
  `mark5` varchar(30) NOT NULL,
  `ket_peop5` varchar(200) NOT NULL,
  `mark6` varchar(30) NOT NULL,
  `ket_peop6` varchar(200) NOT NULL,
  `mark7` varchar(30) NOT NULL,
  `ket_peop7` varchar(200) NOT NULL,
  `mark8` varchar(30) NOT NULL,
  `ket_peop8` varchar(200) NOT NULL,
  `mark9` varchar(30) NOT NULL,
  `ket_peop9` varchar(200) NOT NULL,
  `mark10` varchar(30) NOT NULL,
  `ket_peop10` varchar(200) NOT NULL,
  `mark11` varchar(30) NOT NULL,
  `ket_peop11` varchar(200) NOT NULL,
  `mark12` varchar(30) NOT NULL,
  `ket_peop12` varchar(200) NOT NULL,
  `mark13` varchar(30) NOT NULL,
  `ket_peop13` varchar(200) NOT NULL,
  `mark14` varchar(30) NOT NULL,
  `ket_peop14` varchar(200) NOT NULL,
  `mark15` varchar(30) NOT NULL,
  `ket_peop15` varchar(200) NOT NULL,
  `mark16` varchar(30) NOT NULL,
  `ket_peop16` varchar(200) NOT NULL,
  `mark17` varchar(30) NOT NULL,
  `ket_peop17` varchar(200) NOT NULL,
  `mark18` varchar(30) NOT NULL,
  `ket_peop18` varchar(200) NOT NULL,
  `mark19` varchar(30) NOT NULL,
  `ket_peop19` varchar(200) NOT NULL,
  `mark20` varchar(30) NOT NULL,
  `ket_peop20` varchar(200) NOT NULL,
  `mark21` varchar(30) NOT NULL,
  `ket_peop21` varchar(200) NOT NULL,
  `mark22` varchar(30) NOT NULL,
  `ket_peop22` varchar(200) NOT NULL,
  `mark23` varchar(30) NOT NULL,
  `ket_peop23` varchar(200) NOT NULL,
  `mark24` varchar(30) NOT NULL,
  `ket_peop24` varchar(200) NOT NULL,
  `mark25` varchar(30) NOT NULL,
  `ket_peop25` varchar(200) NOT NULL,
  `mark26` varchar(30) NOT NULL,
  `ket_peop26` varchar(200) NOT NULL,
  `mark27` varchar(30) NOT NULL,
  `ket_peop27` varchar(200) NOT NULL,
  `mark28` varchar(30) NOT NULL,
  `ket_peop28` varchar(200) NOT NULL,
  `mark29` varchar(30) NOT NULL,
  `ket_peop29` varchar(200) NOT NULL,
  `mark30` varchar(30) NOT NULL,
  `ket_peop30` varchar(200) NOT NULL,
  `mark31` varchar(30) NOT NULL,
  `ket_peop31` varchar(200) NOT NULL,
  `mark32` varchar(30) NOT NULL,
  `ket_peop32` varchar(200) NOT NULL,
  `mark33` varchar(30) NOT NULL,
  `ket_peop33` varchar(200) NOT NULL,
  `mark34` varchar(30) NOT NULL,
  `ket_peop34` varchar(200) NOT NULL,
  `mark35` varchar(30) NOT NULL,
  `ket_peop35` varchar(200) NOT NULL,
  `mark36` varchar(30) NOT NULL,
  `ket_peop36` varchar(200) NOT NULL,
  `mark37` varchar(30) NOT NULL,
  `ket_peop37` varchar(200) NOT NULL,
  `mark38` varchar(30) NOT NULL,
  `ket_peop38` varchar(200) NOT NULL,
  `mark39` varchar(30) NOT NULL,
  `ket_peop39` varchar(200) NOT NULL,
  `mark40` varchar(30) NOT NULL,
  `ket_peop40` varchar(200) NOT NULL,
  `mark41` varchar(30) NOT NULL,
  `ket_peop41` varchar(200) NOT NULL,
  `mark42` varchar(30) NOT NULL,
  `ket_peop42` varchar(200) NOT NULL,
  `mark43` varchar(30) NOT NULL,
  `ket_peop43` varchar(200) NOT NULL,
  `mark44` varchar(30) NOT NULL,
  `ket_peop44` varchar(200) NOT NULL,
  `mark45` varchar(30) NOT NULL,
  `ket_peop45` varchar(200) NOT NULL,
  `mark46` varchar(30) NOT NULL,
  `ket_peop46` varchar(200) NOT NULL,
  `mark47` varchar(30) NOT NULL,
  `ket_peop47` varchar(200) NOT NULL,
  `mark48` varchar(30) NOT NULL,
  `ket_peop48` varchar(200) NOT NULL,
  `mark49` varchar(30) NOT NULL,
  `ket_peop49` varchar(200) NOT NULL,
  `mark50` varchar(30) NOT NULL,
  `ket_peop50` varchar(200) NOT NULL,
  `mark51` varchar(30) NOT NULL,
  `ket_peop51` varchar(200) NOT NULL,
  `mark52` varchar(30) NOT NULL,
  `ket_peop52` varchar(200) NOT NULL,
  `mark53` varchar(30) NOT NULL,
  `ket_peop53` varchar(200) NOT NULL,
  `mark54` varchar(30) NOT NULL,
  `ket_peop54` varchar(200) NOT NULL,
  `mark55` varchar(30) NOT NULL,
  `ket_peop55` varchar(200) NOT NULL,
  `mark56` varchar(30) NOT NULL,
  `ket_peop56` varchar(200) NOT NULL,
  `mark57` varchar(30) NOT NULL,
  `ket_peop57` varchar(200) NOT NULL,
  `mark58` varchar(30) NOT NULL,
  `ket_peop58` varchar(200) NOT NULL,
  `mark59` varchar(30) NOT NULL,
  `ket_peop59` varchar(200) NOT NULL,
  `mark60` varchar(30) NOT NULL,
  `ket_peop60` varchar(200) NOT NULL,
  `mark61` varchar(30) NOT NULL,
  `ket_peop61` varchar(200) NOT NULL,
  `mark62` varchar(30) NOT NULL,
  `ket_peop62` varchar(200) NOT NULL,
  `mark63` varchar(30) NOT NULL,
  `ket_peop63` varchar(200) NOT NULL,
  `mark64` varchar(30) NOT NULL,
  `ket_peop64` varchar(200) NOT NULL,
  `mark65` varchar(30) NOT NULL,
  `ket_peop65` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `h23people`
--

INSERT INTO `h23people` (`id_h23peop`, `no_h23peop`, `user_id`, `dealer_id`, `status_h23peop`, `tgl_daftar`, `tgl_input`, `mark1`, `ket_peop1`, `mark2`, `ket_peop2`, `mark3`, `ket_peop3`, `mark4`, `ket_peop4`, `mark5`, `ket_peop5`, `mark6`, `ket_peop6`, `mark7`, `ket_peop7`, `mark8`, `ket_peop8`, `mark9`, `ket_peop9`, `mark10`, `ket_peop10`, `mark11`, `ket_peop11`, `mark12`, `ket_peop12`, `mark13`, `ket_peop13`, `mark14`, `ket_peop14`, `mark15`, `ket_peop15`, `mark16`, `ket_peop16`, `mark17`, `ket_peop17`, `mark18`, `ket_peop18`, `mark19`, `ket_peop19`, `mark20`, `ket_peop20`, `mark21`, `ket_peop21`, `mark22`, `ket_peop22`, `mark23`, `ket_peop23`, `mark24`, `ket_peop24`, `mark25`, `ket_peop25`, `mark26`, `ket_peop26`, `mark27`, `ket_peop27`, `mark28`, `ket_peop28`, `mark29`, `ket_peop29`, `mark30`, `ket_peop30`, `mark31`, `ket_peop31`, `mark32`, `ket_peop32`, `mark33`, `ket_peop33`, `mark34`, `ket_peop34`, `mark35`, `ket_peop35`, `mark36`, `ket_peop36`, `mark37`, `ket_peop37`, `mark38`, `ket_peop38`, `mark39`, `ket_peop39`, `mark40`, `ket_peop40`, `mark41`, `ket_peop41`, `mark42`, `ket_peop42`, `mark43`, `ket_peop43`, `mark44`, `ket_peop44`, `mark45`, `ket_peop45`, `mark46`, `ket_peop46`, `mark47`, `ket_peop47`, `mark48`, `ket_peop48`, `mark49`, `ket_peop49`, `mark50`, `ket_peop50`, `mark51`, `ket_peop51`, `mark52`, `ket_peop52`, `mark53`, `ket_peop53`, `mark54`, `ket_peop54`, `mark55`, `ket_peop55`, `mark56`, `ket_peop56`, `mark57`, `ket_peop57`, `mark58`, `ket_peop58`, `mark59`, `ket_peop59`, `mark60`, `ket_peop60`, `mark61`, `ket_peop61`, `mark62`, `ket_peop62`, `mark63`, `ket_peop63`, `mark64`, `ket_peop64`, `mark65`, `ket_peop65`) VALUES
(1, 1206230001, 22, 1, 0, '2023-06-23 01:44:20', '2023-06-23 01:44:20', 'existgood', 'Ket People 1', 'existgood', 'Ket People 2', 'existgood', 'Ket People 3', 'existgood', 'Ket People 4', 'existgood', 'Ket People 5', 'existgood', 'Ket People 6', 'existgood', 'Ket People 7', 'existgood', 'Ket People 8', 'existgood', 'Ket People 9', 'existgood', 'Ket People 10', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'existgood', 'Data 65'),
(2, 2147483647, 22, 1, 0, '2023-06-24 02:27:50', '0000-00-00 00:00:00', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(3, 2147483647, 22, 1, 0, '2023-06-24 02:28:18', '0000-00-00 00:00:00', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(4, 2147483647, 22, 2, 0, '2023-06-24 07:17:22', '2023-06-24 07:17:22', 'notexist', 'Tidak Ada', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `h23premises`
--

CREATE TABLE `h23premises` (
  `id_h23prem` int(11) NOT NULL,
  `no_h23prem` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `dealer_id` int(11) NOT NULL,
  `status_h23prem` int(11) NOT NULL,
  `rec_upload` text NOT NULL,
  `tgl_daftar` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tgl_input` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `mark1` varchar(30) NOT NULL,
  `ket_prem1` varchar(200) NOT NULL,
  `stat1` varchar(30) NOT NULL,
  `gmbr1` text NOT NULL,
  `mark2` varchar(30) NOT NULL,
  `ket_prem2` varchar(200) NOT NULL,
  `stat2` varchar(200) NOT NULL,
  `gmbr2` varchar(200) NOT NULL,
  `mark3` varchar(30) NOT NULL,
  `ket_prem3` varchar(200) NOT NULL,
  `stat3` varchar(30) NOT NULL,
  `gmbr3` varchar(30) NOT NULL,
  `mark4` varchar(30) NOT NULL,
  `ket_prem4` varchar(200) NOT NULL,
  `stat4` varchar(200) NOT NULL,
  `gmbr4` varchar(200) NOT NULL,
  `mark5` varchar(30) NOT NULL,
  `ket_prem5` varchar(200) NOT NULL,
  `stat5` varchar(30) NOT NULL,
  `gmbr5` varchar(30) NOT NULL,
  `mark6` varchar(30) NOT NULL,
  `ket_prem6` varchar(200) NOT NULL,
  `stat6` varchar(200) NOT NULL,
  `gmbr6` varchar(200) NOT NULL,
  `mark7` varchar(30) NOT NULL,
  `ket_prem7` varchar(200) NOT NULL,
  `stat7` varchar(30) NOT NULL,
  `gmbr7` varchar(30) NOT NULL,
  `mark8` varchar(30) NOT NULL,
  `ket_prem8` varchar(200) NOT NULL,
  `stat8` varchar(200) NOT NULL,
  `gmbr8` varchar(200) NOT NULL,
  `mark9` varchar(30) NOT NULL,
  `ket_prem9` varchar(200) NOT NULL,
  `stat9` varchar(30) NOT NULL,
  `gmbr9` varchar(30) NOT NULL,
  `mark10` varchar(30) NOT NULL,
  `ket_prem10` varchar(200) NOT NULL,
  `stat10` varchar(200) NOT NULL,
  `gmbr10` varchar(200) NOT NULL,
  `mark11` varchar(30) NOT NULL,
  `ket_prem11` varchar(200) NOT NULL,
  `stat11` varchar(30) NOT NULL,
  `gmbr11` varchar(30) NOT NULL,
  `mark12` varchar(30) NOT NULL,
  `ket_prem12` varchar(200) NOT NULL,
  `stat12` varchar(200) NOT NULL,
  `gmbr12` varchar(200) NOT NULL,
  `mark13` varchar(30) NOT NULL,
  `ket_prem13` varchar(200) NOT NULL,
  `stat13` varchar(30) NOT NULL,
  `gmbr13` varchar(30) NOT NULL,
  `mark14` varchar(30) NOT NULL,
  `ket_prem14` varchar(200) NOT NULL,
  `stat14` varchar(200) NOT NULL,
  `gmbr14` varchar(200) NOT NULL,
  `mark15` varchar(30) NOT NULL,
  `ket_prem15` varchar(200) NOT NULL,
  `stat15` varchar(30) NOT NULL,
  `gmbr15` varchar(30) NOT NULL,
  `mark16` varchar(30) NOT NULL,
  `ket_prem16` varchar(200) NOT NULL,
  `stat16` varchar(200) NOT NULL,
  `gmbr16` varchar(200) NOT NULL,
  `mark17` varchar(30) NOT NULL,
  `ket_prem17` varchar(200) NOT NULL,
  `stat17` varchar(30) NOT NULL,
  `gmbr17` varchar(30) NOT NULL,
  `mark18` varchar(30) NOT NULL,
  `ket_prem18` varchar(200) NOT NULL,
  `stat18` varchar(200) NOT NULL,
  `gmbr18` varchar(200) NOT NULL,
  `mark19` varchar(30) NOT NULL,
  `ket_prem19` varchar(200) NOT NULL,
  `stat19` varchar(30) NOT NULL,
  `gmbr19` varchar(30) NOT NULL,
  `mark20` varchar(30) NOT NULL,
  `ket_prem20` varchar(200) NOT NULL,
  `stat20` varchar(200) NOT NULL,
  `gmbr20` varchar(200) NOT NULL,
  `mark21` varchar(30) NOT NULL,
  `ket_prem21` varchar(200) NOT NULL,
  `stat21` varchar(30) NOT NULL,
  `gmbr21` varchar(30) NOT NULL,
  `mark22` varchar(30) NOT NULL,
  `ket_prem22` varchar(200) NOT NULL,
  `stat22` varchar(200) NOT NULL,
  `gmbr22` varchar(200) NOT NULL,
  `mark23` varchar(30) NOT NULL,
  `ket_prem23` varchar(200) NOT NULL,
  `stat23` varchar(30) NOT NULL,
  `gmbr23` varchar(30) NOT NULL,
  `mark24` varchar(30) NOT NULL,
  `ket_prem24` varchar(200) NOT NULL,
  `stat24` varchar(200) NOT NULL,
  `gmbr24` varchar(200) NOT NULL,
  `mark25` varchar(30) NOT NULL,
  `ket_prem25` varchar(200) NOT NULL,
  `stat25` varchar(30) NOT NULL,
  `gmbr25` varchar(30) NOT NULL,
  `mark26` varchar(30) NOT NULL,
  `ket_prem26` varchar(200) NOT NULL,
  `stat26` varchar(200) NOT NULL,
  `gmbr26` varchar(200) NOT NULL,
  `mark27` varchar(30) NOT NULL,
  `ket_prem27` varchar(200) NOT NULL,
  `stat27` varchar(30) NOT NULL,
  `gmbr27` varchar(30) NOT NULL,
  `mark28` varchar(30) NOT NULL,
  `ket_prem28` varchar(200) NOT NULL,
  `stat28` varchar(200) NOT NULL,
  `gmbr28` varchar(200) NOT NULL,
  `mark29` varchar(30) NOT NULL,
  `ket_prem29` varchar(200) NOT NULL,
  `stat29` varchar(30) NOT NULL,
  `gmbr29` varchar(30) NOT NULL,
  `mark30` varchar(30) NOT NULL,
  `ket_prem30` varchar(200) NOT NULL,
  `stat30` varchar(200) NOT NULL,
  `gmbr30` varchar(200) NOT NULL,
  `mark31` varchar(30) NOT NULL,
  `ket_prem31` varchar(200) NOT NULL,
  `stat31` varchar(30) NOT NULL,
  `gmbr31` varchar(30) NOT NULL,
  `mark32` varchar(30) NOT NULL,
  `ket_prem32` varchar(200) NOT NULL,
  `stat32` varchar(200) NOT NULL,
  `gmbr32` varchar(200) NOT NULL,
  `mark33` varchar(30) NOT NULL,
  `ket_prem33` varchar(200) NOT NULL,
  `stat33` varchar(30) NOT NULL,
  `gmbr33` varchar(30) NOT NULL,
  `mark34` varchar(30) NOT NULL,
  `ket_prem34` varchar(200) NOT NULL,
  `stat34` varchar(200) NOT NULL,
  `gmbr34` varchar(200) NOT NULL,
  `mark35` varchar(30) NOT NULL,
  `ket_prem35` varchar(200) NOT NULL,
  `stat35` varchar(30) NOT NULL,
  `gmbr35` varchar(30) NOT NULL,
  `mark36` varchar(30) NOT NULL,
  `ket_prem36` varchar(200) NOT NULL,
  `stat36` varchar(200) NOT NULL,
  `gmbr36` varchar(200) NOT NULL,
  `mark37` varchar(30) NOT NULL,
  `ket_prem37` varchar(200) NOT NULL,
  `stat37` varchar(30) NOT NULL,
  `gmbr37` varchar(30) NOT NULL,
  `mark38` varchar(30) NOT NULL,
  `ket_prem38` varchar(200) NOT NULL,
  `stat38` varchar(200) NOT NULL,
  `gmbr38` varchar(200) NOT NULL,
  `mark39` varchar(30) NOT NULL,
  `ket_prem39` varchar(200) NOT NULL,
  `stat39` varchar(30) NOT NULL,
  `gmbr39` varchar(30) NOT NULL,
  `mark40` varchar(30) NOT NULL,
  `ket_prem40` varchar(200) NOT NULL,
  `stat40` varchar(200) NOT NULL,
  `gmbr40` varchar(200) NOT NULL,
  `mark41` varchar(30) NOT NULL,
  `ket_prem41` varchar(200) NOT NULL,
  `stat41` varchar(30) NOT NULL,
  `gmbr41` varchar(30) NOT NULL,
  `mark42` varchar(30) NOT NULL,
  `ket_prem42` varchar(200) NOT NULL,
  `stat42` varchar(200) NOT NULL,
  `gmbr42` varchar(200) NOT NULL,
  `mark43` varchar(30) NOT NULL,
  `ket_prem43` varchar(200) NOT NULL,
  `stat43` varchar(30) NOT NULL,
  `gmbr43` varchar(30) NOT NULL,
  `mark44` varchar(30) NOT NULL,
  `ket_prem44` varchar(200) NOT NULL,
  `stat44` varchar(200) NOT NULL,
  `gmbr44` varchar(200) NOT NULL,
  `mark45` varchar(30) NOT NULL,
  `ket_prem45` varchar(200) NOT NULL,
  `stat45` varchar(30) NOT NULL,
  `gmbr45` varchar(30) NOT NULL,
  `mark46` varchar(30) NOT NULL,
  `ket_prem46` varchar(200) NOT NULL,
  `stat46` varchar(200) NOT NULL,
  `gmbr46` varchar(200) NOT NULL,
  `mark47` varchar(30) NOT NULL,
  `ket_prem47` varchar(200) NOT NULL,
  `stat47` varchar(30) NOT NULL,
  `gmbr47` varchar(30) NOT NULL,
  `mark48` varchar(30) NOT NULL,
  `ket_prem48` varchar(200) NOT NULL,
  `stat48` varchar(200) NOT NULL,
  `gmbr48` varchar(200) NOT NULL,
  `mark49` varchar(30) NOT NULL,
  `ket_prem49` varchar(200) NOT NULL,
  `stat49` varchar(30) NOT NULL,
  `gmbr49` varchar(30) NOT NULL,
  `mark50` varchar(30) NOT NULL,
  `ket_prem50` varchar(200) NOT NULL,
  `stat50` varchar(200) NOT NULL,
  `gmbr50` varchar(200) NOT NULL,
  `mark51` varchar(30) NOT NULL,
  `ket_prem51` varchar(200) NOT NULL,
  `stat51` varchar(30) NOT NULL,
  `gmbr51` varchar(30) NOT NULL,
  `mark52` varchar(30) NOT NULL,
  `ket_prem52` varchar(200) NOT NULL,
  `stat52` varchar(200) NOT NULL,
  `gmbr52` varchar(200) NOT NULL,
  `mark53` varchar(30) NOT NULL,
  `ket_prem53` varchar(200) NOT NULL,
  `stat53` varchar(30) NOT NULL,
  `gmbr53` varchar(30) NOT NULL,
  `mark54` varchar(30) NOT NULL,
  `ket_prem54` varchar(200) NOT NULL,
  `stat54` varchar(200) NOT NULL,
  `gmbr54` varchar(200) NOT NULL,
  `mark55` varchar(30) NOT NULL,
  `ket_prem55` varchar(200) NOT NULL,
  `stat55` varchar(30) NOT NULL,
  `gmbr55` varchar(30) NOT NULL,
  `mark56` varchar(30) NOT NULL,
  `ket_prem56` varchar(200) NOT NULL,
  `stat56` varchar(200) NOT NULL,
  `gmbr56` varchar(200) NOT NULL,
  `mark57` varchar(30) NOT NULL,
  `ket_prem57` varchar(200) NOT NULL,
  `stat57` varchar(30) NOT NULL,
  `gmbr57` varchar(30) NOT NULL,
  `mark58` varchar(30) NOT NULL,
  `ket_prem58` varchar(200) NOT NULL,
  `stat58` varchar(200) NOT NULL,
  `gmbr58` varchar(200) NOT NULL,
  `mark59` varchar(30) NOT NULL,
  `ket_prem59` varchar(200) NOT NULL,
  `stat59` varchar(30) NOT NULL,
  `gmbr59` varchar(30) NOT NULL,
  `mark60` varchar(30) NOT NULL,
  `ket_prem60` varchar(200) NOT NULL,
  `stat60` varchar(200) NOT NULL,
  `gmbr60` varchar(200) NOT NULL,
  `mark61` varchar(30) NOT NULL,
  `ket_prem61` varchar(200) NOT NULL,
  `stat61` varchar(30) NOT NULL,
  `gmbr61` varchar(30) NOT NULL,
  `mark62` varchar(30) NOT NULL,
  `ket_prem62` varchar(200) NOT NULL,
  `stat62` varchar(200) NOT NULL,
  `gmbr62` varchar(200) NOT NULL,
  `mark63` varchar(30) NOT NULL,
  `ket_prem63` varchar(200) NOT NULL,
  `stat63` varchar(30) NOT NULL,
  `gmbr63` varchar(30) NOT NULL,
  `mark64` varchar(30) NOT NULL,
  `ket_prem64` varchar(200) NOT NULL,
  `stat64` varchar(200) NOT NULL,
  `gmbr64` varchar(200) NOT NULL,
  `mark65` varchar(30) NOT NULL,
  `ket_prem65` varchar(200) NOT NULL,
  `stat65` varchar(30) NOT NULL,
  `gmbr65` varchar(30) NOT NULL,
  `mark66` varchar(30) NOT NULL,
  `ket_prem66` varchar(200) NOT NULL,
  `stat66` varchar(200) NOT NULL,
  `gmbr66` varchar(200) NOT NULL,
  `mark67` varchar(30) NOT NULL,
  `ket_prem67` varchar(200) NOT NULL,
  `stat67` varchar(30) NOT NULL,
  `gmbr67` varchar(30) NOT NULL,
  `mark68` varchar(30) NOT NULL,
  `ket_prem68` varchar(200) NOT NULL,
  `stat68` varchar(200) NOT NULL,
  `gmbr68` varchar(200) NOT NULL,
  `mark69` varchar(30) NOT NULL,
  `ket_prem69` varchar(200) NOT NULL,
  `stat69` varchar(30) NOT NULL,
  `gmbr69` varchar(30) NOT NULL,
  `mark70` varchar(30) NOT NULL,
  `ket_prem70` varchar(200) NOT NULL,
  `stat70` varchar(200) NOT NULL,
  `gmbr70` varchar(200) NOT NULL,
  `mark71` varchar(30) NOT NULL,
  `ket_prem71` varchar(200) NOT NULL,
  `stat71` varchar(30) NOT NULL,
  `gmbr71` varchar(30) NOT NULL,
  `mark72` varchar(30) NOT NULL,
  `ket_prem72` varchar(200) NOT NULL,
  `stat72` varchar(200) NOT NULL,
  `gmbr72` varchar(200) NOT NULL,
  `mark73` varchar(30) NOT NULL,
  `ket_prem73` varchar(200) NOT NULL,
  `stat73` varchar(30) NOT NULL,
  `gmbr73` varchar(30) NOT NULL,
  `mark74` varchar(30) NOT NULL,
  `ket_prem74` varchar(200) NOT NULL,
  `stat74` varchar(200) NOT NULL,
  `gmbr74` varchar(200) NOT NULL,
  `mark75` varchar(30) NOT NULL,
  `ket_prem75` varchar(200) NOT NULL,
  `stat75` varchar(30) NOT NULL,
  `gmbr75` varchar(30) NOT NULL,
  `mark76` varchar(30) NOT NULL,
  `ket_prem76` varchar(200) NOT NULL,
  `stat76` varchar(200) NOT NULL,
  `gmbr76` varchar(200) NOT NULL,
  `mark77` varchar(30) NOT NULL,
  `ket_prem77` varchar(200) NOT NULL,
  `stat77` varchar(30) NOT NULL,
  `gmbr77` varchar(30) NOT NULL,
  `mark78` varchar(30) NOT NULL,
  `ket_prem78` varchar(200) NOT NULL,
  `stat78` varchar(200) NOT NULL,
  `gmbr78` varchar(200) NOT NULL,
  `mark79` varchar(30) NOT NULL,
  `ket_prem79` varchar(200) NOT NULL,
  `stat79` varchar(30) NOT NULL,
  `gmbr79` varchar(30) NOT NULL,
  `mark80` varchar(30) NOT NULL,
  `ket_prem80` varchar(200) NOT NULL,
  `stat80` varchar(200) NOT NULL,
  `gmbr80` varchar(200) NOT NULL,
  `mark81` varchar(30) NOT NULL,
  `ket_prem81` varchar(200) NOT NULL,
  `stat81` varchar(30) NOT NULL,
  `gmbr81` varchar(30) NOT NULL,
  `mark82` varchar(30) NOT NULL,
  `ket_prem82` varchar(200) NOT NULL,
  `stat82` varchar(200) NOT NULL,
  `gmbr82` varchar(200) NOT NULL,
  `mark83` varchar(30) NOT NULL,
  `ket_prem83` varchar(200) NOT NULL,
  `stat83` varchar(30) NOT NULL,
  `gmbr83` varchar(30) NOT NULL,
  `mark84` varchar(30) NOT NULL,
  `ket_prem84` varchar(200) NOT NULL,
  `stat84` varchar(200) NOT NULL,
  `gmbr84` varchar(200) NOT NULL,
  `mark85` varchar(30) NOT NULL,
  `ket_prem85` varchar(200) NOT NULL,
  `stat85` varchar(30) NOT NULL,
  `gmbr85` varchar(30) NOT NULL,
  `mark86` varchar(30) NOT NULL,
  `ket_prem86` varchar(200) NOT NULL,
  `stat86` varchar(200) NOT NULL,
  `gmbr86` varchar(200) NOT NULL,
  `mark87` varchar(30) NOT NULL,
  `ket_prem87` varchar(200) NOT NULL,
  `stat87` varchar(30) NOT NULL,
  `gmbr87` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `h23premises`
--

INSERT INTO `h23premises` (`id_h23prem`, `no_h23prem`, `user_id`, `dealer_id`, `status_h23prem`, `rec_upload`, `tgl_daftar`, `tgl_input`, `mark1`, `ket_prem1`, `stat1`, `gmbr1`, `mark2`, `ket_prem2`, `stat2`, `gmbr2`, `mark3`, `ket_prem3`, `stat3`, `gmbr3`, `mark4`, `ket_prem4`, `stat4`, `gmbr4`, `mark5`, `ket_prem5`, `stat5`, `gmbr5`, `mark6`, `ket_prem6`, `stat6`, `gmbr6`, `mark7`, `ket_prem7`, `stat7`, `gmbr7`, `mark8`, `ket_prem8`, `stat8`, `gmbr8`, `mark9`, `ket_prem9`, `stat9`, `gmbr9`, `mark10`, `ket_prem10`, `stat10`, `gmbr10`, `mark11`, `ket_prem11`, `stat11`, `gmbr11`, `mark12`, `ket_prem12`, `stat12`, `gmbr12`, `mark13`, `ket_prem13`, `stat13`, `gmbr13`, `mark14`, `ket_prem14`, `stat14`, `gmbr14`, `mark15`, `ket_prem15`, `stat15`, `gmbr15`, `mark16`, `ket_prem16`, `stat16`, `gmbr16`, `mark17`, `ket_prem17`, `stat17`, `gmbr17`, `mark18`, `ket_prem18`, `stat18`, `gmbr18`, `mark19`, `ket_prem19`, `stat19`, `gmbr19`, `mark20`, `ket_prem20`, `stat20`, `gmbr20`, `mark21`, `ket_prem21`, `stat21`, `gmbr21`, `mark22`, `ket_prem22`, `stat22`, `gmbr22`, `mark23`, `ket_prem23`, `stat23`, `gmbr23`, `mark24`, `ket_prem24`, `stat24`, `gmbr24`, `mark25`, `ket_prem25`, `stat25`, `gmbr25`, `mark26`, `ket_prem26`, `stat26`, `gmbr26`, `mark27`, `ket_prem27`, `stat27`, `gmbr27`, `mark28`, `ket_prem28`, `stat28`, `gmbr28`, `mark29`, `ket_prem29`, `stat29`, `gmbr29`, `mark30`, `ket_prem30`, `stat30`, `gmbr30`, `mark31`, `ket_prem31`, `stat31`, `gmbr31`, `mark32`, `ket_prem32`, `stat32`, `gmbr32`, `mark33`, `ket_prem33`, `stat33`, `gmbr33`, `mark34`, `ket_prem34`, `stat34`, `gmbr34`, `mark35`, `ket_prem35`, `stat35`, `gmbr35`, `mark36`, `ket_prem36`, `stat36`, `gmbr36`, `mark37`, `ket_prem37`, `stat37`, `gmbr37`, `mark38`, `ket_prem38`, `stat38`, `gmbr38`, `mark39`, `ket_prem39`, `stat39`, `gmbr39`, `mark40`, `ket_prem40`, `stat40`, `gmbr40`, `mark41`, `ket_prem41`, `stat41`, `gmbr41`, `mark42`, `ket_prem42`, `stat42`, `gmbr42`, `mark43`, `ket_prem43`, `stat43`, `gmbr43`, `mark44`, `ket_prem44`, `stat44`, `gmbr44`, `mark45`, `ket_prem45`, `stat45`, `gmbr45`, `mark46`, `ket_prem46`, `stat46`, `gmbr46`, `mark47`, `ket_prem47`, `stat47`, `gmbr47`, `mark48`, `ket_prem48`, `stat48`, `gmbr48`, `mark49`, `ket_prem49`, `stat49`, `gmbr49`, `mark50`, `ket_prem50`, `stat50`, `gmbr50`, `mark51`, `ket_prem51`, `stat51`, `gmbr51`, `mark52`, `ket_prem52`, `stat52`, `gmbr52`, `mark53`, `ket_prem53`, `stat53`, `gmbr53`, `mark54`, `ket_prem54`, `stat54`, `gmbr54`, `mark55`, `ket_prem55`, `stat55`, `gmbr55`, `mark56`, `ket_prem56`, `stat56`, `gmbr56`, `mark57`, `ket_prem57`, `stat57`, `gmbr57`, `mark58`, `ket_prem58`, `stat58`, `gmbr58`, `mark59`, `ket_prem59`, `stat59`, `gmbr59`, `mark60`, `ket_prem60`, `stat60`, `gmbr60`, `mark61`, `ket_prem61`, `stat61`, `gmbr61`, `mark62`, `ket_prem62`, `stat62`, `gmbr62`, `mark63`, `ket_prem63`, `stat63`, `gmbr63`, `mark64`, `ket_prem64`, `stat64`, `gmbr64`, `mark65`, `ket_prem65`, `stat65`, `gmbr65`, `mark66`, `ket_prem66`, `stat66`, `gmbr66`, `mark67`, `ket_prem67`, `stat67`, `gmbr67`, `mark68`, `ket_prem68`, `stat68`, `gmbr68`, `mark69`, `ket_prem69`, `stat69`, `gmbr69`, `mark70`, `ket_prem70`, `stat70`, `gmbr70`, `mark71`, `ket_prem71`, `stat71`, `gmbr71`, `mark72`, `ket_prem72`, `stat72`, `gmbr72`, `mark73`, `ket_prem73`, `stat73`, `gmbr73`, `mark74`, `ket_prem74`, `stat74`, `gmbr74`, `mark75`, `ket_prem75`, `stat75`, `gmbr75`, `mark76`, `ket_prem76`, `stat76`, `gmbr76`, `mark77`, `ket_prem77`, `stat77`, `gmbr77`, `mark78`, `ket_prem78`, `stat78`, `gmbr78`, `mark79`, `ket_prem79`, `stat79`, `gmbr79`, `mark80`, `ket_prem80`, `stat80`, `gmbr80`, `mark81`, `ket_prem81`, `stat81`, `gmbr81`, `mark82`, `ket_prem82`, `stat82`, `gmbr82`, `mark83`, `ket_prem83`, `stat83`, `gmbr83`, `mark84`, `ket_prem84`, `stat84`, `gmbr84`, `mark85`, `ket_prem85`, `stat85`, `gmbr85`, `mark86`, `ket_prem86`, `stat86`, `gmbr86`, `mark87`, `ket_prem87`, `stat87`, `gmbr87`) VALUES
(1, 1706230001, 22, 1, 0, '', '2023-06-23 02:50:38', '2023-06-23 02:50:38', 'existgood', 'Data', '', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `h23process`
--

CREATE TABLE `h23process` (
  `id_h23proc` int(11) NOT NULL,
  `no_h23proc` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `dealer_id` int(11) NOT NULL,
  `status_h23proc` int(11) NOT NULL,
  `rec_upload` text NOT NULL,
  `tgl_daftar` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tgl_input` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `mark1` varchar(30) NOT NULL,
  `ket_proc1` varchar(200) NOT NULL,
  `mark2` varchar(30) NOT NULL,
  `ket_proc2` varchar(200) NOT NULL,
  `mark3` varchar(30) NOT NULL,
  `ket_proc3` varchar(200) NOT NULL,
  `mark4` varchar(30) NOT NULL,
  `ket_proc4` varchar(200) NOT NULL,
  `mark5` varchar(30) NOT NULL,
  `ket_proc5` varchar(200) NOT NULL,
  `mark6` varchar(30) NOT NULL,
  `ket_proc6` varchar(200) NOT NULL,
  `mark7` varchar(30) NOT NULL,
  `ket_proc7` varchar(200) NOT NULL,
  `mark8` varchar(30) NOT NULL,
  `ket_proc8` varchar(200) NOT NULL,
  `mark9` varchar(30) NOT NULL,
  `ket_proc9` varchar(200) NOT NULL,
  `mark10` varchar(30) NOT NULL,
  `ket_proc10` varchar(200) NOT NULL,
  `mark11` varchar(30) NOT NULL,
  `ket_proc11` varchar(200) NOT NULL,
  `mark12` varchar(30) NOT NULL,
  `ket_proc12` varchar(200) NOT NULL,
  `mark13` varchar(30) NOT NULL,
  `ket_proc13` varchar(200) NOT NULL,
  `mark14` varchar(30) NOT NULL,
  `ket_proc14` varchar(200) NOT NULL,
  `mark15` varchar(30) NOT NULL,
  `ket_proc15` varchar(200) NOT NULL,
  `mark16` varchar(30) NOT NULL,
  `ket_proc16` varchar(200) NOT NULL,
  `mark17` varchar(30) NOT NULL,
  `ket_proc17` varchar(200) NOT NULL,
  `mark18` varchar(30) NOT NULL,
  `ket_proc18` varchar(200) NOT NULL,
  `mark19` varchar(30) NOT NULL,
  `ket_proc19` varchar(200) NOT NULL,
  `mark20` varchar(30) NOT NULL,
  `ket_proc20` varchar(200) NOT NULL,
  `mark21` varchar(30) NOT NULL,
  `ket_proc21` varchar(200) NOT NULL,
  `mark22` varchar(30) NOT NULL,
  `ket_proc22` varchar(200) NOT NULL,
  `mark23` varchar(30) NOT NULL,
  `ket_proc23` varchar(200) NOT NULL,
  `mark24` varchar(30) NOT NULL,
  `ket_proc24` varchar(200) NOT NULL,
  `mark25` varchar(30) NOT NULL,
  `ket_proc25` varchar(200) NOT NULL,
  `mark26` varchar(30) NOT NULL,
  `ket_proc26` varchar(200) NOT NULL,
  `mark27` varchar(30) NOT NULL,
  `ket_proc27` varchar(200) NOT NULL,
  `mark28` varchar(30) NOT NULL,
  `ket_proc28` varchar(200) NOT NULL,
  `mark29` varchar(30) NOT NULL,
  `ket_proc29` varchar(200) NOT NULL,
  `mark30` varchar(30) NOT NULL,
  `ket_proc30` varchar(200) NOT NULL,
  `mark31` varchar(30) NOT NULL,
  `ket_proc31` varchar(200) NOT NULL,
  `mark32` varchar(30) NOT NULL,
  `ket_proc32` varchar(200) NOT NULL,
  `mark33` varchar(30) NOT NULL,
  `ket_proc33` varchar(200) NOT NULL,
  `mark34` varchar(30) NOT NULL,
  `ket_proc34` varchar(200) NOT NULL,
  `mark35` varchar(30) NOT NULL,
  `ket_proc35` varchar(200) NOT NULL,
  `mark36` varchar(30) NOT NULL,
  `ket_proc36` varchar(200) NOT NULL,
  `mark37` varchar(30) NOT NULL,
  `ket_proc37` varchar(200) NOT NULL,
  `mark38` varchar(30) NOT NULL,
  `ket_proc38` varchar(200) NOT NULL,
  `mark39` varchar(30) NOT NULL,
  `ket_proc39` varchar(200) NOT NULL,
  `mark40` varchar(30) NOT NULL,
  `ket_proc40` varchar(200) NOT NULL,
  `mark41` varchar(30) NOT NULL,
  `ket_proc41` varchar(200) NOT NULL,
  `mark42` varchar(30) NOT NULL,
  `ket_proc42` varchar(200) NOT NULL,
  `mark43` varchar(30) NOT NULL,
  `ket_proc43` varchar(200) NOT NULL,
  `mark44` varchar(30) NOT NULL,
  `ket_proc44` varchar(200) NOT NULL,
  `mark45` varchar(30) NOT NULL,
  `ket_proc45` varchar(200) NOT NULL,
  `mark46` varchar(30) NOT NULL,
  `ket_proc46` varchar(200) NOT NULL,
  `mark47` varchar(30) NOT NULL,
  `ket_proc47` varchar(200) NOT NULL,
  `mark48` varchar(30) NOT NULL,
  `ket_proc48` varchar(200) NOT NULL,
  `mark49` varchar(30) NOT NULL,
  `ket_proc49` varchar(200) NOT NULL,
  `mark50` varchar(30) NOT NULL,
  `ket_proc50` varchar(200) NOT NULL,
  `mark51` varchar(30) NOT NULL,
  `ket_proc51` varchar(200) NOT NULL,
  `mark52` varchar(30) NOT NULL,
  `ket_proc52` varchar(200) NOT NULL,
  `mark53` varchar(30) NOT NULL,
  `ket_proc53` varchar(200) NOT NULL,
  `mark54` varchar(30) NOT NULL,
  `ket_proc54` varchar(200) NOT NULL,
  `mark55` varchar(30) NOT NULL,
  `ket_proc55` varchar(200) NOT NULL,
  `mark56` varchar(30) NOT NULL,
  `ket_proc56` varchar(200) NOT NULL,
  `mark57` varchar(30) NOT NULL,
  `ket_proc57` varchar(200) NOT NULL,
  `mark58` varchar(30) NOT NULL,
  `ket_proc58` varchar(200) NOT NULL,
  `mark59` varchar(30) NOT NULL,
  `ket_proc59` varchar(200) NOT NULL,
  `mark60` varchar(30) NOT NULL,
  `ket_proc60` varchar(200) NOT NULL,
  `mark61` varchar(30) NOT NULL,
  `ket_proc61` varchar(200) NOT NULL,
  `mark62` varchar(30) NOT NULL,
  `ket_proc62` varchar(200) NOT NULL,
  `mark63` varchar(30) NOT NULL,
  `ket_proc63` varchar(200) NOT NULL,
  `mark64` varchar(30) NOT NULL,
  `ket_proc64` varchar(200) NOT NULL,
  `mark65` varchar(30) NOT NULL,
  `ket_proc65` varchar(200) NOT NULL,
  `mark66` varchar(30) NOT NULL,
  `ket_proc66` varchar(200) NOT NULL,
  `mark67` varchar(30) NOT NULL,
  `ket_proc67` varchar(200) NOT NULL,
  `mark68` varchar(30) NOT NULL,
  `ket_proc68` varchar(200) NOT NULL,
  `mark69` varchar(30) NOT NULL,
  `ket_proc69` varchar(200) NOT NULL,
  `mark70` varchar(30) NOT NULL,
  `ket_proc70` varchar(200) NOT NULL,
  `mark71` varchar(30) NOT NULL,
  `ket_proc71` varchar(200) NOT NULL,
  `mark72` varchar(30) NOT NULL,
  `ket_proc72` varchar(200) NOT NULL,
  `mark73` varchar(30) NOT NULL,
  `ket_proc73` varchar(200) NOT NULL,
  `mark74` varchar(30) NOT NULL,
  `ket_proc74` varchar(200) NOT NULL,
  `mark75` varchar(30) NOT NULL,
  `ket_proc75` varchar(200) NOT NULL,
  `mark76` varchar(30) NOT NULL,
  `ket_proc76` varchar(200) NOT NULL,
  `mark77` varchar(30) NOT NULL,
  `ket_proc77` varchar(200) NOT NULL,
  `mark78` varchar(30) NOT NULL,
  `ket_proc78` varchar(200) NOT NULL,
  `mark79` varchar(30) NOT NULL,
  `ket_proc79` varchar(200) NOT NULL,
  `mark80` varchar(30) NOT NULL,
  `ket_proc80` varchar(200) NOT NULL,
  `mark81` varchar(30) NOT NULL,
  `ket_proc81` varchar(200) NOT NULL,
  `mark82` varchar(30) NOT NULL,
  `ket_proc82` varchar(200) NOT NULL,
  `mark83` varchar(30) NOT NULL,
  `ket_proc83` varchar(200) NOT NULL,
  `mark84` varchar(30) NOT NULL,
  `ket_proc84` varchar(200) NOT NULL,
  `mark85` varchar(30) NOT NULL,
  `ket_proc85` varchar(200) NOT NULL,
  `mark86` varchar(30) NOT NULL,
  `ket_proc86` varchar(200) NOT NULL,
  `mark87` varchar(30) NOT NULL,
  `ket_proc87` varchar(200) NOT NULL,
  `mark88` varchar(30) NOT NULL,
  `ket_proc88` varchar(200) NOT NULL,
  `mark89` varchar(30) NOT NULL,
  `ket_proc89` varchar(200) NOT NULL,
  `mark90` varchar(30) NOT NULL,
  `ket_proc90` varchar(200) NOT NULL,
  `mark91` varchar(30) NOT NULL,
  `ket_proc91` varchar(200) NOT NULL,
  `mark92` varchar(30) NOT NULL,
  `ket_proc92` varchar(200) NOT NULL,
  `mark93` varchar(30) NOT NULL,
  `ket_proc93` varchar(200) NOT NULL,
  `mark94` varchar(30) NOT NULL,
  `ket_proc94` varchar(200) NOT NULL,
  `mark95` varchar(30) NOT NULL,
  `ket_proc95` varchar(200) NOT NULL,
  `mark96` varchar(30) NOT NULL,
  `ket_proc96` varchar(200) NOT NULL,
  `mark97` varchar(30) NOT NULL,
  `ket_proc97` varchar(200) NOT NULL,
  `mark98` varchar(30) NOT NULL,
  `ket_proc98` varchar(200) NOT NULL,
  `mark99` varchar(30) NOT NULL,
  `ket_proc99` varchar(200) NOT NULL,
  `mark100` varchar(30) NOT NULL,
  `ket_proc100` varchar(200) NOT NULL,
  `mark101` varchar(30) NOT NULL,
  `ket_proc101` varchar(200) NOT NULL,
  `mark102` varchar(30) NOT NULL,
  `ket_proc102` varchar(200) NOT NULL,
  `mark103` varchar(30) NOT NULL,
  `ket_proc103` varchar(200) NOT NULL,
  `mark104` varchar(30) NOT NULL,
  `ket_proc104` varchar(200) NOT NULL,
  `mark105` varchar(30) NOT NULL,
  `ket_proc105` varchar(200) NOT NULL,
  `mark106` varchar(30) NOT NULL,
  `ket_proc106` varchar(200) NOT NULL,
  `mark107` varchar(30) NOT NULL,
  `ket_proc107` varchar(200) NOT NULL,
  `mark108` varchar(30) NOT NULL,
  `ket_proc108` varchar(200) NOT NULL,
  `mark109` varchar(30) NOT NULL,
  `ket_proc109` varchar(200) NOT NULL,
  `mark110` varchar(30) NOT NULL,
  `ket_proc110` varchar(200) NOT NULL,
  `mark111` varchar(30) NOT NULL,
  `ket_proc111` varchar(200) NOT NULL,
  `mark112` varchar(30) NOT NULL,
  `ket_proc112` varchar(200) NOT NULL,
  `mark113` varchar(30) NOT NULL,
  `ket_proc113` varchar(200) NOT NULL,
  `mark114` varchar(30) NOT NULL,
  `ket_proc114` varchar(200) NOT NULL,
  `mark115` varchar(30) NOT NULL,
  `ket_proc115` varchar(200) NOT NULL,
  `mark116` varchar(30) NOT NULL,
  `ket_proc116` varchar(200) NOT NULL,
  `mark117` varchar(30) NOT NULL,
  `ket_proc117` varchar(200) NOT NULL,
  `mark118` varchar(30) NOT NULL,
  `ket_proc118` varchar(200) NOT NULL,
  `mark119` varchar(30) NOT NULL,
  `ket_proc119` varchar(200) NOT NULL,
  `mark120` varchar(30) NOT NULL,
  `ket_proc120` varchar(200) NOT NULL,
  `mark121` varchar(30) NOT NULL,
  `ket_proc121` varchar(200) NOT NULL,
  `mark122` varchar(30) NOT NULL,
  `ket_proc122` varchar(200) NOT NULL,
  `mark123` varchar(30) NOT NULL,
  `ket_proc123` varchar(200) NOT NULL,
  `mark124` varchar(30) NOT NULL,
  `ket_proc124` varchar(200) NOT NULL,
  `mark125` varchar(30) NOT NULL,
  `ket_proc125` varchar(200) NOT NULL,
  `mark126` varchar(30) NOT NULL,
  `ket_proc126` varchar(200) NOT NULL,
  `mark127` varchar(30) NOT NULL,
  `ket_proc127` varchar(200) NOT NULL,
  `mark128` varchar(30) NOT NULL,
  `ket_proc128` varchar(200) NOT NULL,
  `mark129` varchar(30) NOT NULL,
  `ket_proc129` varchar(200) NOT NULL,
  `mark130` varchar(30) NOT NULL,
  `ket_proc130` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `h23process`
--

INSERT INTO `h23process` (`id_h23proc`, `no_h23proc`, `user_id`, `dealer_id`, `status_h23proc`, `rec_upload`, `tgl_daftar`, `tgl_input`, `mark1`, `ket_proc1`, `mark2`, `ket_proc2`, `mark3`, `ket_proc3`, `mark4`, `ket_proc4`, `mark5`, `ket_proc5`, `mark6`, `ket_proc6`, `mark7`, `ket_proc7`, `mark8`, `ket_proc8`, `mark9`, `ket_proc9`, `mark10`, `ket_proc10`, `mark11`, `ket_proc11`, `mark12`, `ket_proc12`, `mark13`, `ket_proc13`, `mark14`, `ket_proc14`, `mark15`, `ket_proc15`, `mark16`, `ket_proc16`, `mark17`, `ket_proc17`, `mark18`, `ket_proc18`, `mark19`, `ket_proc19`, `mark20`, `ket_proc20`, `mark21`, `ket_proc21`, `mark22`, `ket_proc22`, `mark23`, `ket_proc23`, `mark24`, `ket_proc24`, `mark25`, `ket_proc25`, `mark26`, `ket_proc26`, `mark27`, `ket_proc27`, `mark28`, `ket_proc28`, `mark29`, `ket_proc29`, `mark30`, `ket_proc30`, `mark31`, `ket_proc31`, `mark32`, `ket_proc32`, `mark33`, `ket_proc33`, `mark34`, `ket_proc34`, `mark35`, `ket_proc35`, `mark36`, `ket_proc36`, `mark37`, `ket_proc37`, `mark38`, `ket_proc38`, `mark39`, `ket_proc39`, `mark40`, `ket_proc40`, `mark41`, `ket_proc41`, `mark42`, `ket_proc42`, `mark43`, `ket_proc43`, `mark44`, `ket_proc44`, `mark45`, `ket_proc45`, `mark46`, `ket_proc46`, `mark47`, `ket_proc47`, `mark48`, `ket_proc48`, `mark49`, `ket_proc49`, `mark50`, `ket_proc50`, `mark51`, `ket_proc51`, `mark52`, `ket_proc52`, `mark53`, `ket_proc53`, `mark54`, `ket_proc54`, `mark55`, `ket_proc55`, `mark56`, `ket_proc56`, `mark57`, `ket_proc57`, `mark58`, `ket_proc58`, `mark59`, `ket_proc59`, `mark60`, `ket_proc60`, `mark61`, `ket_proc61`, `mark62`, `ket_proc62`, `mark63`, `ket_proc63`, `mark64`, `ket_proc64`, `mark65`, `ket_proc65`, `mark66`, `ket_proc66`, `mark67`, `ket_proc67`, `mark68`, `ket_proc68`, `mark69`, `ket_proc69`, `mark70`, `ket_proc70`, `mark71`, `ket_proc71`, `mark72`, `ket_proc72`, `mark73`, `ket_proc73`, `mark74`, `ket_proc74`, `mark75`, `ket_proc75`, `mark76`, `ket_proc76`, `mark77`, `ket_proc77`, `mark78`, `ket_proc78`, `mark79`, `ket_proc79`, `mark80`, `ket_proc80`, `mark81`, `ket_proc81`, `mark82`, `ket_proc82`, `mark83`, `ket_proc83`, `mark84`, `ket_proc84`, `mark85`, `ket_proc85`, `mark86`, `ket_proc86`, `mark87`, `ket_proc87`, `mark88`, `ket_proc88`, `mark89`, `ket_proc89`, `mark90`, `ket_proc90`, `mark91`, `ket_proc91`, `mark92`, `ket_proc92`, `mark93`, `ket_proc93`, `mark94`, `ket_proc94`, `mark95`, `ket_proc95`, `mark96`, `ket_proc96`, `mark97`, `ket_proc97`, `mark98`, `ket_proc98`, `mark99`, `ket_proc99`, `mark100`, `ket_proc100`, `mark101`, `ket_proc101`, `mark102`, `ket_proc102`, `mark103`, `ket_proc103`, `mark104`, `ket_proc104`, `mark105`, `ket_proc105`, `mark106`, `ket_proc106`, `mark107`, `ket_proc107`, `mark108`, `ket_proc108`, `mark109`, `ket_proc109`, `mark110`, `ket_proc110`, `mark111`, `ket_proc111`, `mark112`, `ket_proc112`, `mark113`, `ket_proc113`, `mark114`, `ket_proc114`, `mark115`, `ket_proc115`, `mark116`, `ket_proc116`, `mark117`, `ket_proc117`, `mark118`, `ket_proc118`, `mark119`, `ket_proc119`, `mark120`, `ket_proc120`, `mark121`, `ket_proc121`, `mark122`, `ket_proc122`, `mark123`, `ket_proc123`, `mark124`, `ket_proc124`, `mark125`, `ket_proc125`, `mark126`, `ket_proc126`, `mark127`, `ket_proc127`, `mark128`, `ket_proc128`, `mark129`, `ket_proc129`, `mark130`, `ket_proc130`) VALUES
(1, 1206230001, 22, 1, 0, '', '2023-06-23 01:46:49', '2023-06-23 01:46:49', 'existgood', 'Ket 1', 'existgood', 'Ket 2', 'existgood', 'Ket 3', 'existgood', 'Ket 4', 'existgood', 'Ket 5', 'existgood', '', 'existgood', 'Ket 7', 'existgood', 'Ket 8', 'existgood', 'Ket 9', 'existgood', 'Ket 10', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'existgood', 'Data 26', 'existgood', 'Data 27', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'existgood', 'Data 130'),
(2, 1206230002, 22, 2, 0, '', '2023-06-14 08:58:45', '2023-06-14 08:58:45', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'existgood', 'KEt data 10', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `jabatan`
--

CREATE TABLE `jabatan` (
  `id_jabatan` int(11) NOT NULL,
  `jabatan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jabatan`
--

INSERT INTO `jabatan` (`id_jabatan`, `jabatan`) VALUES
(1, 'IT Staff'),
(2, 'Staff'),
(3, 'Manager');

-- --------------------------------------------------------

--
-- Table structure for table `pinjam_barang`
--

CREATE TABLE `pinjam_barang` (
  `pinjam_id` int(11) NOT NULL,
  `tujuan_pinjam` varchar(100) DEFAULT NULL,
  `peminjam` varchar(100) DEFAULT NULL,
  `tgl_pinjam` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tgl_kembali` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `premises`
--

CREATE TABLE `premises` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `alamat` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `premises`
--

INSERT INTO `premises` (`id`, `name`, `foto`, `alamat`) VALUES
(1, 'Thomas', 'doctor.png', 'Purwokerto timur'),
(6, 'Kukuh', 'gentleman.png', 'pwt'),
(7, 'Rizmeg', 'muslim.png', 'Purwokerto');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_barang`
--

CREATE TABLE `tbl_barang` (
  `id_barang` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `tempat_penyimpanan` varchar(100) NOT NULL,
  `desc` text NOT NULL,
  `stock` int(10) NOT NULL,
  `status` enum('tampilkan','sembunyikan','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_barang`
--

INSERT INTO `tbl_barang` (`id_barang`, `name`, `tempat_penyimpanan`, `desc`, `stock`, `status`) VALUES
(1, 'bola voli', 'Lemari 1', 'ini bola voli', 35, 'sembunyikan'),
(2, 'a', '', 'b', 7, 'tampilkan'),
(3, 'b', '', 'a', 5, 'tampilkan'),
(6, 'z', '', 'z', 10, 'sembunyikan'),
(7, 'q', '', 'q', 8, 'tampilkan');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_peminjam`
--

CREATE TABLE `tbl_peminjam` (
  `id_peminjam` int(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(225) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_peminjam`
--

INSERT INTO `tbl_peminjam` (`id_peminjam`, `username`, `password`, `name`, `email`) VALUES
(1, 'peminjam', 'bgmXGBBl0JYFWJSrPx6kxYzRQ8isw55EPkxzpAnjCMt/N2vnOUal7la/6Bp60M4fL1n4F6+a57U81pQWyxFemg==', 'peminjam', 'peminjam@email.com'),
(30, 'purwa', 'J6mqsm/D+ZPW/0/LsWHQQMT6EwSlp9O6ionun3F6DwSiUUt6670cDXsHzNW206+59GEemoljs93BWQ8KWAN78g==', 'Purwa Sabrang Ramadhan ', 'psr@a.com'),
(38, 'yuda', 'oVSXKtKcnClfbg2TI8pLJnxV8LlGsPCA3MZg6iuZ41efIDG06I59Q+1DGtQwuOsnLApsmbUAN0zePjqm3/QbMA==', 'Yuda Aduy', 'yda@ady.com'),
(39, 'wardah', '9H2YHywNRJMom3YesNU4gorGVRDDbfl6SLTP3UXCpR+fQ//Os+5zOBSoo5GxImCecYkEouP4ERGNKLgEq1u4zA==', 'wardah', 'wardah@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_petugas`
--

CREATE TABLE `tbl_petugas` (
  `id_petugas` int(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(225) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `photo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_petugas`
--

INSERT INTO `tbl_petugas` (`id_petugas`, `username`, `password`, `name`, `email`, `photo`) VALUES
(1, 'superadmin', 'KkR/ln1U0b8C79VfG3z3AG0Niddn6qhc2/3hc6DEabVdkmJNIwNx9ep2Vfs4a7yukDmm6RtG+b3rb6Jb1sCqlQ==', 'Purwa Sabrang', 'Psr@email.com', ''),
(2, 'petugas', 'BiYPYgV1Dn9XMQExB3g=', 'petugas', 'petugas@email.com', '\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pinjam`
--

CREATE TABLE `tbl_pinjam` (
  `id_pinjam` int(10) NOT NULL,
  `id_peminjam` int(10) NOT NULL,
  `id_barang` int(10) NOT NULL,
  `jml` int(20) NOT NULL,
  `tgl_pinjam` datetime NOT NULL,
  `tgl_kembali` datetime NOT NULL,
  `status` enum('0','1','2','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_pinjam`
--

INSERT INTO `tbl_pinjam` (`id_pinjam`, `id_peminjam`, `id_barang`, `jml`, `tgl_pinjam`, `tgl_kembali`, `status`) VALUES
(43, 38, 1, 5, '2018-11-02 21:32:43', '0000-00-00 00:00:00', '1'),
(45, 38, 2, 3, '2018-11-02 21:33:02', '0000-00-00 00:00:00', '0'),
(46, 38, 3, 5, '2018-11-02 23:32:16', '0000-00-00 00:00:00', '0'),
(47, 30, 1, 5, '2018-11-02 23:42:06', '0000-00-00 00:00:00', '0'),
(48, 1, 1, 5, '2021-11-14 13:01:42', '0000-00-00 00:00:00', '0');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_riwayat`
--

CREATE TABLE `tbl_riwayat` (
  `id_pinjam` int(10) NOT NULL,
  `id_peminjam` int(10) NOT NULL,
  `id_barang` int(10) NOT NULL,
  `jml` int(20) NOT NULL,
  `tgl_pinjam` datetime NOT NULL,
  `tgl_kembali` datetime NOT NULL,
  `status` enum('0','1','2','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_riwayat`
--

INSERT INTO `tbl_riwayat` (`id_pinjam`, `id_peminjam`, `id_barang`, `jml`, `tgl_pinjam`, `tgl_kembali`, `status`) VALUES
(29, 38, 1, 2, '2018-11-01 23:58:12', '0000-00-00 00:00:00', '0'),
(28, 38, 1, 1, '2018-11-01 23:58:08', '2018-11-01 23:58:44', '1'),
(30, 38, 1, 3, '2018-11-01 23:58:14', '2018-11-01 23:58:45', '1'),
(32, 30, 3, 2, '2018-11-01 23:59:44', '0000-00-00 00:00:00', '0'),
(34, 38, 1, 1, '2018-11-02 15:05:05', '0000-00-00 00:00:00', '0'),
(20, 30, 2, 1, '2018-11-01 22:54:54', '2018-11-02 00:05:44', '1'),
(31, 38, 2, 1, '2018-11-01 23:58:18', '2018-11-02 14:53:10', '1'),
(33, 38, 1, 1, '2018-11-02 15:02:45', '2018-11-02 15:04:39', '1'),
(35, 38, 1, 20, '2018-11-02 15:05:45', '2018-11-02 21:23:01', '1'),
(40, 38, 1, 5, '2018-11-02 21:29:11', '2018-11-02 21:31:53', '1'),
(41, 38, 2, 3, '2018-11-02 21:30:47', '2018-11-02 21:31:54', '1'),
(42, 38, 2, 2, '2018-11-02 21:30:54', '2018-11-02 21:31:55', '1'),
(44, 38, 2, 2, '2018-11-02 21:32:58', '0000-00-00 00:00:00', '0');

-- --------------------------------------------------------

--
-- Table structure for table `tiket`
--

CREATE TABLE `tiket` (
  `id_tiket` int(11) NOT NULL,
  `no_tiket` varchar(25) NOT NULL,
  `judul_tiket` text NOT NULL,
  `deskripsi` text NOT NULL,
  `gambar_tiket` text,
  `user_id` int(10) NOT NULL,
  `status_tiket` int(2) NOT NULL,
  `tgl_daftar` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tiket`
--

INSERT INTO `tiket` (`id_tiket`, `no_tiket`, `judul_tiket`, `deskripsi`, `gambar_tiket`, `user_id`, `status_tiket`, `tgl_daftar`) VALUES
(18, '2202230002', 'laptop bluescreen', 'test bluescreen', '220223000220230222104322.png', 28, 3, '2023-02-22 03:45:56'),
(25, '0103230002', 'user tes tiket (keluhan 1) with gambar', 'user tes tiket (keterangan 1) with gambar', '010323000220230301113722.PNG', 24, 3, '2023-03-01 04:45:14'),
(26, '0103230003', 'tes keluhan 2', 'tes keterangan 2', NULL, 24, 2, '2023-03-01 04:48:49'),
(27, '0103230004', 'tes keterangan 3', 'tes keterangan 3', NULL, 24, 1, '2023-03-01 04:48:42'),
(28, '0103230005', 'tes keterangan 4', 'tes keterangan 4', NULL, 24, 3, '2023-04-14 03:25:40'),
(31, '1503230002', 'tes chat', 'tes chat', NULL, 30, 3, '2023-04-14 03:14:19'),
(32, '1906230001', 'tes', 'ssss', '190623000120230619160415.png', 22, 1, '2023-06-19 09:04:30'),
(33, '1906230001', 'tes', 'ssss', '190623000120230619160420.png', 22, 2, '2023-06-19 09:04:47');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` text NOT NULL,
  `jabatan_id` int(11) DEFAULT NULL,
  `divisi_id` varchar(11) DEFAULT NULL,
  `dealer_id` varchar(100) NOT NULL,
  `pinjam_id` int(11) DEFAULT NULL,
  `h1premises_id` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `image_user` text NOT NULL,
  `level_user` int(2) NOT NULL,
  `status_user` int(2) NOT NULL,
  `darkmode` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `nama`, `email`, `password`, `jabatan_id`, `divisi_id`, `dealer_id`, `pinjam_id`, `h1premises_id`, `created`, `modified`, `image_user`, `level_user`, `status_user`, `darkmode`) VALUES
(22, 'admin', 'admin', 'admin@gmail.com', '$2y$10$OADSa3IQR/JWfS5AO72pA.sidkWOm771.3/2o584ED8tKBKLQkdcm', 1, '13', '1', NULL, 0, '2023-03-14 14:03:23', '2023-03-14 14:03:23', '', 1, 1, ''),
(24, 'userrifqi', 'Rifqi', 'userrifqi@gmail.com', '$2y$10$geCyrUIqTHY.VMUj/EZYk.NotfdkN/xfnc.Rpvz3nQE4y.h4UjcJC', 2, '13', '', NULL, 0, '2023-03-01 08:10:27', '2023-03-01 08:10:27', '', 2, 1, '0'),
(28, 'Irwan', 'Muhammad Irwan', 'irwan@kemakmuran.com', '$2y$10$FRxeRYrBRmdeXSbi38jIAurRWDSZjmERZwYFX/7yiDwwE53XrFmf2', 2, '13', '1', NULL, 0, '2023-03-14 11:15:59', '2023-03-14 11:15:59', '', 1, 1, '0'),
(30, 'usertest', 'usertest', 'usertest@gmail.com', '$2y$10$2HHUb0uOPn4g8wEuDo802eAAK1BIFlV/wt0g5CI2gIXZlHP61Ludq', 2, '13', '55', NULL, 0, '2023-03-15 14:57:44', '2023-03-15 14:57:44', '', 2, 1, '0');

-- --------------------------------------------------------

--
-- Table structure for table `wing`
--

CREATE TABLE `wing` (
  `id_wing` int(11) NOT NULL,
  `wing` varchar(50) NOT NULL,
  `h1premises_id` int(11) NOT NULL,
  `h1people_id` int(11) NOT NULL,
  `h1process_id` int(11) NOT NULL,
  `h23premises_id` int(11) NOT NULL,
  `h23people_id` int(11) NOT NULL,
  `h23process_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `dealer`
--
ALTER TABLE `dealer`
  ADD PRIMARY KEY (`id_dealer`);

--
-- Indexes for table `detail_h1premises`
--
ALTER TABLE `detail_h1premises`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detail_tiket`
--
ALTER TABLE `detail_tiket`
  ADD PRIMARY KEY (`id_detail`);

--
-- Indexes for table `divisi`
--
ALTER TABLE `divisi`
  ADD PRIMARY KEY (`id_divisi`);

--
-- Indexes for table `h1people`
--
ALTER TABLE `h1people`
  ADD PRIMARY KEY (`id_h1peop`);

--
-- Indexes for table `h1premises`
--
ALTER TABLE `h1premises`
  ADD PRIMARY KEY (`id_h1premises`);

--
-- Indexes for table `h1process`
--
ALTER TABLE `h1process`
  ADD PRIMARY KEY (`id_h1proc1`);

--
-- Indexes for table `h23people`
--
ALTER TABLE `h23people`
  ADD PRIMARY KEY (`id_h23peop`);

--
-- Indexes for table `h23premises`
--
ALTER TABLE `h23premises`
  ADD PRIMARY KEY (`id_h23prem`);

--
-- Indexes for table `h23process`
--
ALTER TABLE `h23process`
  ADD PRIMARY KEY (`id_h23proc`);

--
-- Indexes for table `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`id_jabatan`);

--
-- Indexes for table `premises`
--
ALTER TABLE `premises`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_barang`
--
ALTER TABLE `tbl_barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `tbl_peminjam`
--
ALTER TABLE `tbl_peminjam`
  ADD PRIMARY KEY (`id_peminjam`);

--
-- Indexes for table `tbl_petugas`
--
ALTER TABLE `tbl_petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Indexes for table `tbl_pinjam`
--
ALTER TABLE `tbl_pinjam`
  ADD PRIMARY KEY (`id_pinjam`);

--
-- Indexes for table `tiket`
--
ALTER TABLE `tiket`
  ADD PRIMARY KEY (`id_tiket`),
  ADD KEY `tiket` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `wing`
--
ALTER TABLE `wing`
  ADD PRIMARY KEY (`id_wing`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `dealer`
--
ALTER TABLE `dealer`
  MODIFY `id_dealer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `detail_h1premises`
--
ALTER TABLE `detail_h1premises`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `detail_tiket`
--
ALTER TABLE `detail_tiket`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `divisi`
--
ALTER TABLE `divisi`
  MODIFY `id_divisi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `h1people`
--
ALTER TABLE `h1people`
  MODIFY `id_h1peop` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `h1premises`
--
ALTER TABLE `h1premises`
  MODIFY `id_h1premises` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `h1process`
--
ALTER TABLE `h1process`
  MODIFY `id_h1proc1` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `h23people`
--
ALTER TABLE `h23people`
  MODIFY `id_h23peop` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `h23premises`
--
ALTER TABLE `h23premises`
  MODIFY `id_h23prem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `h23process`
--
ALTER TABLE `h23process`
  MODIFY `id_h23proc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jabatan`
--
ALTER TABLE `jabatan`
  MODIFY `id_jabatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `premises`
--
ALTER TABLE `premises`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_barang`
--
ALTER TABLE `tbl_barang`
  MODIFY `id_barang` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_peminjam`
--
ALTER TABLE `tbl_peminjam`
  MODIFY `id_peminjam` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `tbl_petugas`
--
ALTER TABLE `tbl_petugas`
  MODIFY `id_petugas` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_pinjam`
--
ALTER TABLE `tbl_pinjam`
  MODIFY `id_pinjam` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `tiket`
--
ALTER TABLE `tiket`
  MODIFY `id_tiket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `wing`
--
ALTER TABLE `wing`
  MODIFY `id_wing` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
