-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 09, 2023 at 02:33 AM
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
-- Database: `mskhelpdesk`
--

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
(1, 5, 'tanggapan 5 di tanggapi pertama', '20230208081209.PNG', '2023-02-08'),
(2, 4, 'tanggapan 5 di tanggapi pertama', '20230208081219.PNG', '2023-02-08'),
(3, 3, 'ok', '', '2023-02-08'),
(4, 7, '11111', '20230208184710.PNG', '2023-02-08');

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
(1, 'Divisi IT'),
(2, 'Divisi HRGA'),
(3, 'Divisi HC3');

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
(1, 'Staff'),
(2, 'Manager'),
(3, 'Supervisor');

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
(1, '0802230001', 'tes keluhan 1', 'tes keterangan 1', '080223000120230208080837.PNG', 15, 0, '2023-02-07 17:00:00'),
(2, '0802230002', 'tes keluhan 2', 'tes Keterangan 2', '080223000220230208080859.PNG', 15, 1, '2023-02-08 03:31:56'),
(3, '0802230003', 'tes keluhan 3', 'tes keterangan 3', '080223000320230208080925.PNG', 15, 3, '2023-02-08 11:44:56'),
(4, '0802230004', 'tes keluhan 4', 'tes keterangan 4', '080223000420230208080949.PNG', 15, 3, '2023-02-08 11:44:23'),
(5, '0802230005', 'tes keluhan 5', 'tes keterangan 5', '080223000520230208081118.PNG', 15, 3, '2023-02-08 01:15:26'),
(6, '0802230006', 'tiket user12345', 'tiket user12345', '080223000620230208141823.PNG', 21, 0, '2023-02-07 17:00:00'),
(7, '0802230007', '1111111111111', '1111111111111', '080223000720230208184647.PNG', 21, 2, '2023-02-08 11:47:10');

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
  `darkmode` enum('0','1','2','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `nama`, `email`, `password`, `jabatan_id`, `divisi_id`, `created`, `modified`, `image_user`, `level_user`, `status_user`, `darkmode`) VALUES
(14, 'rifqi', 'Rifqi Rohmatullah', 'rifqi@gmail.com', '$2y$10$Jkwj6VU0sQdyeDui4CNmUOI0UZk9YiG1wIlVPgz1Z0t.tAK0e7oZ2', 1, '1', '2023-02-08 22:44:39', '2023-02-08 22:44:39', 'jokowi.jpeg', 1, 1, '0'),
(15, 'user', 'user', 'user@gmail.com', '$2y$10$gOzEZyfH1vMaansTF.xWHujFk1Z0O/uTR70gJwJ7.e18PE5Iyq5Ue', 1, '3', '2023-02-08 22:37:20', '2023-02-08 22:37:20', '', 2, 1, '0'),
(16, 'abc123', 'abc123', 'abc123@gmail.com', '$2y$10$XvCCrwiEhlp43lRxFqiNH.tnVFEhH0CUVr1CXRc.QYLNc8vr4tFqq', 1, '3', '2023-02-08 22:44:13', '2023-02-08 22:44:13', '', 2, 1, '0'),
(17, 'tester', 'tester', 'tester@gmail.com', 'tester', NULL, NULL, '2023-02-08 00:00:00', '2023-02-08 11:56:48', '', 2, 1, '0'),
(18, 'abcde', '', 'abcde@gmail.com', 'abcde', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 2, 1, '0'),
(19, 'admin123', '', 'admin123@gmail.com', '$2y$10$AydA.5j8JiVjxVMJawHdAuT4Fz.54.8sVM4eK40Oz1zcnXg01qGSu', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 1, 1, '0'),
(20, 'user1234', '', 'user1234@gmail.com', '$2y$10$JcgyGvWqQ6SgLD7/MYLibuKd1NwsH0uyykx3MpdVszbjrDWkEfPru', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 1, 1, '0'),
(21, 'user12345', 'user12345', 'user12345@gmail.com', '', 1, '3', '2023-02-08 22:03:46', '2023-02-08 22:03:46', '', 2, 1, '0');

--
-- Indexes for dumped tables
--

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
-- AUTO_INCREMENT for table `detail_tiket`
--
ALTER TABLE `detail_tiket`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `divisi`
--
ALTER TABLE `divisi`
  MODIFY `id_divisi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jabatan`
--
ALTER TABLE `jabatan`
  MODIFY `id_jabatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tiket`
--
ALTER TABLE `tiket`
  MODIFY `id_tiket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tiket`
--
ALTER TABLE `tiket`
  ADD CONSTRAINT `tiket` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
