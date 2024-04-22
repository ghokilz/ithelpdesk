-- phpMyAdmin SQL Dump
-- version 4.9.11
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 02, 2023 at 09:26 AM
-- Server version: 5.7.41
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kemakm01_helpdeskdb`
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
  `merk` varchar(50) DEFAULT NULL,
  `no_seri` varchar(50) DEFAULT NULL,
  `kondisi_barang` varchar(25) DEFAULT NULL,
  `unit` int(11) NOT NULL,
  `tgl_daftar` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tgl_pinjam` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `storage` varchar(50) DEFAULT NULL,
  `user_id` int(10) NOT NULL,
  `status_barang` int(2) NOT NULL,
  `gambar_barang` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `no_barang`, `kode_barang`, `nama_barang`, `merk`, `no_seri`, `kondisi_barang`, `unit`, `tgl_daftar`, `tgl_pinjam`, `storage`, `user_id`, `status_barang`, `gambar_barang`) VALUES
(1, '1', '123456', 'speaker', 'sony', '1234567890', 'good', 1, '2023-02-18 02:24:36', '2023-02-18 02:24:36', 'lemari 1', 22, 0, NULL);

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
(12, 26, 'oke', '', '2023-03-01');

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
(28, '0103230005', 'tes keterangan 4', 'tes keterangan 4', NULL, 24, 0, '2023-02-28 17:00:00');

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

INSERT INTO `user` (`id_user`, `username`, `nama`, `email`, `password`, `jabatan_id`, `divisi_id`, `created`, `modified`, `image_user`, `level_user`, `status_user`, `darkmode`) VALUES
(22, 'admin', 'admin', 'admin@gmail.com', '$2y$10$hkicQuFqGnWt/PJ.goIodO4dvYo657yCjdpfBUFZnj9BupHrseqM2', NULL, NULL, '2023-02-27 23:33:44', '2023-02-27 23:33:44', '', 1, 1, ''),
(24, 'userrifqi', 'Rifqi', 'userrifqi@gmail.com', '$2y$10$geCyrUIqTHY.VMUj/EZYk.NotfdkN/xfnc.Rpvz3nQE4y.h4UjcJC', 2, '13', '2023-03-01 08:10:27', '2023-03-01 08:10:27', '', 2, 1, '0'),
(28, 'Irwan', 'Muhammad Irwan', 'irwan@kemakmuran.com', '$2y$10$4Jz6xQ4POIbf2gQBp.WhbelUU2vio1uBo7I6S0DySYApZrGL2cy1O', 2, '13', '2023-02-22 10:48:49', '2023-02-22 10:48:49', '', 1, 1, '0'),
(30, 'usertest', 'usertest', 'usertest@gmail.com', '$2y$10$LGQe0vlqkdEi63vQRBC1VOvgBotJSb2K/tZ7DFsJ6FGhsF4npasie', 2, '12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 2, 1, '0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

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
-- Indexes for table `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`id_jabatan`);

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `detail_tiket`
--
ALTER TABLE `detail_tiket`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `divisi`
--
ALTER TABLE `divisi`
  MODIFY `id_divisi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `jabatan`
--
ALTER TABLE `jabatan`
  MODIFY `id_jabatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tiket`
--
ALTER TABLE `tiket`
  MODIFY `id_tiket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
