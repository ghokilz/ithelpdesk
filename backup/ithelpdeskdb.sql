-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 22, 2023 at 03:27 AM
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
(7, 12, 'oke', '', '2023-02-22');

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
(8, '0902230001', 'user tes tiket (keluhan 1) with gambar', 'user tes tiket (keterangan 1) with gambar', '090223000120230209141312.PNG', 23, 0, '2023-02-08 17:00:00'),
(9, '0902230002', 'user tes tiket (keluhan 2) no gambar', 'user tes tiket (keluhan 2) no gambar', NULL, 23, 1, '2023-02-09 07:22:28'),
(10, '0902230003', 'user tes tiket (keluhan 3) with gambar', 'user tes tiket (keterangan 3) with gambar', '090223000320230209141716.PNG', 23, 2, '2023-02-09 07:22:23'),
(11, '0902230004', 'user tes tiket (keluhan 4) no gambar', 'user tes tiket (keluhan 4) no gambar', '090223000420230209141750.PNG', 23, 3, '2023-02-09 07:22:00'),
(12, '1002230001', 'user tes2 tiket (keluhan 1) no gambar', 'user tes2 tiket (keterangan 1) no gambar', NULL, 24, 3, '2023-02-22 02:25:33'),
(13, '1002230002', 'user tes2 tiket (keluhan 2) with gambar', 'user tes2 tiket (keterangan 2) with gambar', '100223000220230210053408.PNG', 24, 0, '2023-02-09 17:00:00'),
(14, '1002230003', 'user tes2 tiket (keluhan 3) no gambar', 'user tes2 tiket (keterangan 3) no gambar', NULL, 24, 0, '2023-02-09 17:00:00'),
(15, '1002230004', 'user tes2 tiket (keluhan 4) with gambar', 'user tes2 tiket (keterangan 4) with gambar', '100223000420230210053923.PNG', 24, 0, '2023-02-09 17:00:00'),
(16, '1002230005', 'user tes2 tiket (keluhan 5) with gambar', 'user tes2 tiket (keterangan 5) with gambar', '100223000520230210054411.PNG', 24, 0, '2023-02-09 17:00:00'),
(17, '1002230006', 'user tes2 tiket (keluhan 6) no gambar', 'user tes2 tiket (keterangan 6) no gambar', NULL, 24, 0, '2023-02-09 17:00:00');

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
(22, 'admin', '', 'admin@gmail.com', '$2y$10$hkicQuFqGnWt/PJ.goIodO4dvYo657yCjdpfBUFZnj9BupHrseqM2', NULL, NULL, '2023-02-11 23:57:24', '2023-02-11 23:57:24', '', 1, 1, ''),
(24, 'user2', 'user 2', 'user2@gmail.com', '$2y$10$RdsQ0cv4bAckF/zYdU06Fe2FrHsrHr7PL7U.nCFpI6OEATcyK107.', 2, '12', '2023-02-22 09:22:32', '2023-02-22 09:22:32', '', 2, 1, '0'),
(25, 'testable', 'testable', 'testable@gmail.com', '$2y$10$lWLy8Y3f3lOsmnkXJt/5TuBRXHXilcDEohey9z0/X3lwC6IcA8S1q', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 2, 1, '0'),
(26, 'tes', 'tes', 'tes@gmail.com', '$2y$10$43XXmJ0D8raX5G6SC5Y1DOYojF6kmzFHG4VeMruOYHrJOnfQ36kG.', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 2, 1, '0'),
(27, 'aaaaaa', 'aaaaaa', 'aaaaaa@gmail.com', '$2y$10$ui/LATCZTIfYRdU8O7uYMuo7ejs03DmKqNP3BlP0B0ISlCNk/s1X6', 1, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 2, 1, '0');

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
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `divisi`
--
ALTER TABLE `divisi`
  MODIFY `id_divisi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `jabatan`
--
ALTER TABLE `jabatan`
  MODIFY `id_jabatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tiket`
--
ALTER TABLE `tiket`
  MODIFY `id_tiket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
