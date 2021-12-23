-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 24, 2020 at 05:02 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 5.6.37

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apotik`
--

-- --------------------------------------------------------

--
-- Table structure for table `amprah`
--

CREATE TABLE `amprah` (
  `id_amprah` varchar(30) NOT NULL,
  `id_ruangan` varchar(20) NOT NULL,
  `tgl` date NOT NULL,
  `keterangan` longtext NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `amprah_detail`
--

CREATE TABLE `amprah_detail` (
  `kd_amprah_detail` int(20) NOT NULL,
  `id_amprah` varchar(20) NOT NULL,
  `id_obat` varchar(40) NOT NULL,
  `qty` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kategori_obat`
--

CREATE TABLE `kategori_obat` (
  `id_kategori_obat` int(20) NOT NULL,
  `nama_kategori` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori_obat`
--

INSERT INTO `kategori_obat` (`id_kategori_obat`, `nama_kategori`) VALUES
(1, 'Generik'),
(2, 'Non Generik'),
(4, 'Askes'),
(5, 'Alkes BHP'),
(6, 'BHP BLUD'),
(7, 'Jamkesmas BLUD'),
(9, 'Apotek BLUD'),
(10, 'Bahan Laboratorium');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_pasien`
--

CREATE TABLE `kategori_pasien` (
  `id_kategori_pasien` int(10) NOT NULL,
  `nama_kategori` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori_pasien`
--

INSERT INTO `kategori_pasien` (`id_kategori_pasien`, `nama_kategori`) VALUES
(1, 'IGD'),
(2, 'UMUM'),
(3, 'BPJS'),
(4, 'JAMKESDA'),
(5, 'dll');

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `id_obat` int(20) NOT NULL,
  `nama_obat` varchar(80) NOT NULL,
  `id_kategori_obat` varchar(20) NOT NULL,
  `id_satuan_obat` varchar(20) NOT NULL,
  `keterangan` longtext NOT NULL,
  `tipe_apotik` varchar(20) NOT NULL,
  `stok_awal` decimal(20,0) NOT NULL DEFAULT '0',
  `stok_beli` decimal(20,0) NOT NULL DEFAULT '0',
  `stok_jual` decimal(20,0) NOT NULL DEFAULT '0',
  `stok_akhir` decimal(20,0) NOT NULL DEFAULT '0',
  `harga_beli` decimal(10,0) NOT NULL DEFAULT '0',
  `harga_jual` decimal(20,0) NOT NULL DEFAULT '0',
  `stok_rs` decimal(20,0) NOT NULL DEFAULT '0',
  `stok_pelengkap` decimal(20,0) NOT NULL DEFAULT '0',
  `min_order` decimal(20,0) NOT NULL DEFAULT '0',
  `kadaluarsa` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `obat`
--

INSERT INTO `obat` (`id_obat`, `nama_obat`, `id_kategori_obat`, `id_satuan_obat`, `keterangan`, `tipe_apotik`, `stok_awal`, `stok_beli`, `stok_jual`, `stok_akhir`, `harga_beli`, `harga_jual`, `stok_rs`, `stok_pelengkap`, `min_order`, `kadaluarsa`) VALUES
(2, 'Bodrex (A)', '1', '2', '', '', '100', '23', '7', '116', '600', '600', '93', '95', '200', '2019-10-31'),
(4, 'Paramex (A)', '1', '9', '', '', '100', '0', '7', '99', '3308', '3308', '-1', '0', '25', '2019-10-31'),
(5, 'Bodrex (B)', '1', '5', '', '', '0', '0', '0', '0', '427', '427', '0', '0', '100', '2019-10-24'),
(6, 'Paramex (B)', '1', '5', '', '', '3700', '0', '13', '3687', '139', '139', '-2', '0', '500', '2019-11-30'),
(7, 'bodrex C', '1', '2', '', '', '3', '1', '0', '4', '3000', '4000', '0', '0', '1', '2019-10-30'),
(8, 'Bodrex D', '1', '2', '', '', '10', '18', '0', '28', '3500', '5000', '0', '0', '2', '2019-10-30'),
(9, 'diapet A', '1', '2', '', '', '30', '80', '10', '100', '300', '300', '-10', '0', '2', '2019-10-31'),
(10, 'Panadol', '1', '2', '', '', '10', '50', '0', '60', '6000', '7000', '0', '0', '1', '2019-11-09');

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `option_id` int(20) NOT NULL,
  `option_key` varchar(50) NOT NULL,
  `option_value` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`option_id`, `option_key`, `option_value`) VALUES
(1, 'site_name', 'Klinik Apotik Griya Husada'),
(3, 'site_app', 'Sistem Informasi Apotik');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `id_transaksi` varchar(40) NOT NULL,
  `tanggal` date NOT NULL,
  `id_supplier` varchar(20) NOT NULL,
  `nomorPO` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`id_transaksi`, `tanggal`, `id_supplier`, `nomorPO`) VALUES
('BL-00000001', '2019-10-28', '5', '001'),
('BL-00000002', '2019-10-31', '3', '009'),
('BL-00000003', '2019-10-31', '3', '009'),
('BL-00000004', '2019-10-28', '4', '008'),
('BL-00000005', '2019-10-29', '4', '003');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian_detail`
--

CREATE TABLE `pembelian_detail` (
  `kode_pembelian_detail` int(20) NOT NULL,
  `id_transaksi` varchar(20) NOT NULL,
  `tanggal` date NOT NULL,
  `id_obat` int(20) NOT NULL,
  `qty` int(20) NOT NULL,
  `harga_beli` int(40) NOT NULL,
  `harga_jual` int(20) NOT NULL,
  `id_supplier` varchar(40) NOT NULL,
  `nomorPO` varchar(40) NOT NULL,
  `kadaluarsa` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembelian_detail`
--

INSERT INTO `pembelian_detail` (`kode_pembelian_detail`, `id_transaksi`, `tanggal`, `id_obat`, `qty`, `harga_beli`, `harga_jual`, `id_supplier`, `nomorPO`, `kadaluarsa`) VALUES
(1, 'BL-00000001', '2019-10-28', 7, 1, 3000, 4000, '5', '001', '2019-10-30'),
(2, 'BL-00000002', '2019-10-31', 8, 9, 3500, 5000, '3', '009', '2019-10-30'),
(3, 'BL-00000003', '2019-10-31', 8, 9, 3500, 5000, '3', '009', '2019-10-30'),
(4, 'BL-00000004', '2019-10-28', 9, 30, 300, 5000, '4', '008', '2019-11-03'),
(5, 'BL-00000005', '2019-10-29', 10, 50, 6000, 7000, '4', '003', '2019-11-09'),
(6, 'BL-00000005', '2019-10-29', 9, 50, 300, 300, '4', '003', '2019-10-31');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan_apotik_pelengkap`
--

CREATE TABLE `penjualan_apotik_pelengkap` (
  `id_penjualan_apotik_pelengkap` varchar(40) NOT NULL,
  `tanggal` date NOT NULL,
  `Nama` varchar(60) NOT NULL,
  `keterangan` varchar(40) NOT NULL,
  `qty_racikan` int(10) NOT NULL,
  `biayajasa` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `penjualan_apotik_pelengkap_detail`
--

CREATE TABLE `penjualan_apotik_pelengkap_detail` (
  `id_penjualan_apotik_pelengkap` varchar(40) NOT NULL,
  `tanggal` date NOT NULL,
  `id_obat` varchar(80) NOT NULL,
  `qty` int(20) NOT NULL,
  `harga_jual` int(20) NOT NULL,
  `tipe` varchar(20) NOT NULL,
  `jasatipe` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `penjualan_apotik_rs`
--

CREATE TABLE `penjualan_apotik_rs` (
  `id_penjualan_apotik_rs` varchar(40) NOT NULL,
  `tanggal` date NOT NULL,
  `NoMR` varchar(40) NOT NULL,
  `Nama` varchar(60) NOT NULL,
  `id_kategori_pasien` varchar(40) NOT NULL,
  `jenisrawat` varchar(40) NOT NULL,
  `status` varchar(20) NOT NULL,
  `qty_racikan` int(10) NOT NULL,
  `biayajasa` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penjualan_apotik_rs`
--

INSERT INTO `penjualan_apotik_rs` (`id_penjualan_apotik_rs`, `tanggal`, `NoMR`, `Nama`, `id_kategori_pasien`, `jenisrawat`, `status`, `qty_racikan`, `biayajasa`) VALUES
('APRS-00000001', '2019-10-28', 'bn', 'na', '1', 'inap', '', 10, 1000),
('APRS-00000002', '2019-10-29', 'b01', 'agu', '1', 'inap', '', 11, 2000);

-- --------------------------------------------------------

--
-- Table structure for table `penjualan_apotik_rs_detail`
--

CREATE TABLE `penjualan_apotik_rs_detail` (
  `rs_jual_id` int(20) NOT NULL,
  `id_penjualan_apotik_rs` varchar(40) NOT NULL,
  `tanggal` date NOT NULL,
  `id_obat` varchar(80) NOT NULL,
  `qty` varchar(20) NOT NULL DEFAULT '0',
  `harga_jual` int(20) NOT NULL,
  `NoMR` varchar(40) NOT NULL,
  `tipe` varchar(20) NOT NULL,
  `jasatipe` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penjualan_apotik_rs_detail`
--

INSERT INTO `penjualan_apotik_rs_detail` (`rs_jual_id`, `id_penjualan_apotik_rs`, `tanggal`, `id_obat`, `qty`, `harga_jual`, `NoMR`, `tipe`, `jasatipe`) VALUES
(1, 'APRS-00000001', '2019-10-28', '9', '10.00', 300, 'bn', 'Non Racikan', 300),
(2, 'APRS-00000002', '2019-10-29', '6', '2.00', 139, 'b01', 'Non Racikan', 300);

-- --------------------------------------------------------

--
-- Table structure for table `returns`
--

CREATE TABLE `returns` (
  `id_return` varchar(30) NOT NULL,
  `id_penjualan_apotik_rs` varchar(40) NOT NULL,
  `NoMR` varchar(40) NOT NULL,
  `tgl` date NOT NULL,
  `keterangan` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `return_detail`
--

CREATE TABLE `return_detail` (
  `id_unik` int(40) NOT NULL,
  `id_return` varchar(20) NOT NULL,
  `id_obat` varchar(40) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ruangan`
--

CREATE TABLE `ruangan` (
  `id_ruangan` int(20) NOT NULL,
  `nama_ruangan` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ruangan`
--

INSERT INTO `ruangan` (`id_ruangan`, `nama_ruangan`) VALUES
(1, 'OK Central'),
(2, 'Zaal Bedah'),
(3, 'Zaal Interne'),
(4, 'Zaal IKA'),
(5, 'Zaal Mata'),
(6, 'VIP'),
(7, 'Zaal Perinatologi'),
(8, 'Zaal Kebidanan'),
(9, 'Zaal Kamar Bersalin'),
(10, 'ICU'),
(11, 'IPSRS'),
(12, 'CSSD & Loundry'),
(13, 'Poli Akupuntur'),
(14, 'Fisioterapi'),
(15, 'Poli Kulit & Kelamin'),
(16, 'Poli Bedah'),
(17, 'Poli Penyakit Dalam'),
(18, 'Poli Jantung'),
(19, 'Poli Anak'),
(20, 'Poli Gigi'),
(21, 'Poli Kebidanan'),
(22, 'Poli Mata'),
(23, 'Laboratorium'),
(24, 'Zaal Paru'),
(25, 'IGD'),
(26, 'Radiologi'),
(27, 'Zaal Neurologi');

-- --------------------------------------------------------

--
-- Table structure for table `satuan_obat`
--

CREATE TABLE `satuan_obat` (
  `id_satuan_obat` int(10) NOT NULL,
  `nama_satuan` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `satuan_obat`
--

INSERT INTO `satuan_obat` (`id_satuan_obat`, `nama_satuan`) VALUES
(2, 'Pcs'),
(4, 'Botol'),
(5, 'Tablet'),
(6, 'Liter'),
(7, 'Vial'),
(8, 'Ampul'),
(9, 'Tube'),
(10, 'Suppositoria'),
(11, 'Btl/150'),
(12, 'Kapsul'),
(13, 'Kolf'),
(14, 'Sachet'),
(15, 'Zack'),
(16, 'Soft Bag'),
(17, 'Rectal'),
(18, 'Box/10'),
(19, 'mililiter'),
(20, 'Flexpen'),
(21, 'Btl/100'),
(22, 'Kilogram'),
(23, 'Box/5'),
(24, 'Roll'),
(25, 'Box/36'),
(26, 'Box/24'),
(27, 'Box/12'),
(28, 'Box'),
(29, 'Pasang'),
(30, 'Box/100'),
(31, 'Lusin'),
(32, 'Mini Dose'),
(33, 'Eye drop'),
(34, 'Tabung'),
(35, 'Fls'),
(36, 'Buah'),
(37, 'KIt'),
(38, 'Jerigen/20L'),
(39, 'Set'),
(40, 'Box/25'),
(41, 'Box/10L'),
(42, 'Pack/1000');

-- --------------------------------------------------------

--
-- Table structure for table `session_apotik`
--

CREATE TABLE `session_apotik` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `user_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `session_apotik`
--

INSERT INTO `session_apotik` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('94a4ea7aec6407d9bee428f0fc6db942', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:70.0) Gecko/20100101 Firefox/70.0', 1575132173, 'a:4:{s:9:\"user_data\";s:0:\"\";s:7:\"islogin\";b:1;s:6:\"isUser\";s:6:\"apotik\";s:4:\"role\";s:6:\"apotik\";}'),
('98550d886307961105e11c49cd049c6f', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:72.0) Gecko/20100101 Firefox/72.0', 1579880338, '');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` int(20) NOT NULL,
  `nama_supplier` varchar(80) NOT NULL,
  `alamat` longtext NOT NULL,
  `telepon` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id_supplier`, `nama_supplier`, `alamat`, `telepon`) VALUES
(2, 'PT. APM', 'Jl. Prof. Dr. Hamka, No. 78 C Padang', '(0751)447657'),
(3, 'PT. MBS', 'Jl. Raya By Pass KM 9 Taratak. Korong Gadang Kec. Kuranji Padang', '000000000000000'),
(4, 'PT. AAM', 'Jl. Jati VII, No. 13, Padang Timur', '(0751)20677'),
(5, 'PT. Parit Padang', 'Jl. Raya By Pass KM 9 Taratak Paneh Kec. Kuranji Padang', '0000'),
(6, 'PT. APL', 'Jl. By Pass BAru KM 10 Gunung Sarik, Kuranji Padang', '00000000'),
(8, 'PT. Enseval', 'Jl. By Pass KM 10 Kec. Kuranji Padang', '00000'),
(9, 'PT. Kimia Farma', 'JL. Teknologi No. 1 Siteba Padang', '000000'),
(10, 'PT. Parazelsus', 'Jl. Batang Antokan No. 21 Kel. Padang Baru Barat, Padang', '(0751)447625'),
(11, 'PT. Tempo', 'Jl. Khatib Sulaiman No. 73 Padang', '000000'),
(12, 'PT. Rajawali Nusindo', 'Jl. Andalas Baru No. 9 Padang', '00000'),
(13, 'PT Dos Ni Roha', 'Jl. MT Haryono Kav 10 Tebet Jakarta', '00000'),
(14, 'PT. Indofarma Global Medika', 'Jl. Bagindo Aziz Chan No. 6 Padang', '00000000'),
(15, 'PT. Penta Valent', 'Jl. Beringin Ujung No. 64 Padang', '000000'),
(16, 'PT. Merapi', 'Jl.  Cilosari 23, Cikini-Menteng Jakarta', '(021)3141906'),
(17, 'PT. Bina San Prima', 'Jl. Purus I No. 12 Padang', '(0751)30122'),
(18, 'PT. Kebayoran', 'Jl. Koto Marapak 10A Padang', '00000'),
(19, 'PT. Millenium Pharmacon International', 'Jl. Perak III No. 10 Padang', '(0751)39396'),
(20, 'PT. Antar Mitra Sembada', 'Jl. By Pass KM 13.5 Padang', '(0751)463700'),
(21, 'PT. Sawah Besar Farma', 'Jl. Situjuh No. 18 Padang', '00000'),
(22, 'PT. United Dico Citas', 'Jl. Pasar Mudik Kel. Pasar Gadang  Kec. Padang Selatan', '(0751)892292'),
(23, 'PT. Talang Gugun', 'Jl. Alai Timur No. 41 Padang', '00000'),
(24, 'PT. Medisia Sainsindo', 'Jl. S. Parman 206 Padang', '(0751)7052141'),
(25, 'PT. Lima Jaya Farmatama', 'Jl. Ir. Juanda No. 3A Padang', '(0751)444771'),
(26, 'PT. Panay farmalab', 'Jl. Sawahan dalam IV No. 18-20 Padang', '(0751)27925'),
(27, 'CV. Madina Scientific', 'Jl. Sutan Syahrir No. 61 Padang', '0751 7733350'),
(28, 'PT. Brataco', 'Jl. Agus Salim 7A Padang', '00000'),
(29, 'Pt. Lain-lain', 'Pariaman', '000');

-- --------------------------------------------------------

--
-- Table structure for table `transfer_obat`
--

CREATE TABLE `transfer_obat` (
  `id_transfer_obat` int(40) NOT NULL,
  `apotik` varchar(40) NOT NULL,
  `tanggal` date NOT NULL,
  `id_obat` varchar(40) NOT NULL,
  `qty` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(20) NOT NULL,
  `username_special` varchar(50) NOT NULL,
  `password_special` longtext NOT NULL,
  `role_special` varchar(20) NOT NULL,
  `nama` varchar(60) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `username_special`, `password_special`, `role_special`, `nama`, `status`) VALUES
(16, 'gudang', '7852238da63778356045268cdd7dc59541533722', 'gudang', 'Gudang', 'active'),
(17, 'apotik', '77f30704324872175828269a6dff518e453ab555', 'apotik', 'Apotik Rumah Sakit', 'active'),
(18, 'pelengkap', 'e8f99ac70f3397d838d526f9d70ee7e809b3c7af', 'apotikext', 'Apotik Pelengkap', 'active'),
(20, 'pimpinan', '121da6a6d443bbef7edc8b4e0d354d0bb60747ba', 'pimpinan', 'Pimpinan Rumah Sakit', 'active'),
(21, 'Hari', 'ce2e67b1b8e96329183f32f68b4c97d4968324bc', 'admin', 'Hari Avrianto', 'active'),
(22, 'admin', '9bba7401038712502eff9de19149eb32d2b5af31', 'admin', 'Administrator', 'active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `amprah`
--
ALTER TABLE `amprah`
  ADD PRIMARY KEY (`id_amprah`);

--
-- Indexes for table `amprah_detail`
--
ALTER TABLE `amprah_detail`
  ADD PRIMARY KEY (`kd_amprah_detail`);

--
-- Indexes for table `kategori_obat`
--
ALTER TABLE `kategori_obat`
  ADD PRIMARY KEY (`id_kategori_obat`);

--
-- Indexes for table `kategori_pasien`
--
ALTER TABLE `kategori_pasien`
  ADD PRIMARY KEY (`id_kategori_pasien`);

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id_obat`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`option_id`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indexes for table `pembelian_detail`
--
ALTER TABLE `pembelian_detail`
  ADD PRIMARY KEY (`kode_pembelian_detail`);

--
-- Indexes for table `penjualan_apotik_pelengkap`
--
ALTER TABLE `penjualan_apotik_pelengkap`
  ADD PRIMARY KEY (`id_penjualan_apotik_pelengkap`);

--
-- Indexes for table `penjualan_apotik_rs`
--
ALTER TABLE `penjualan_apotik_rs`
  ADD PRIMARY KEY (`id_penjualan_apotik_rs`);

--
-- Indexes for table `penjualan_apotik_rs_detail`
--
ALTER TABLE `penjualan_apotik_rs_detail`
  ADD PRIMARY KEY (`rs_jual_id`);

--
-- Indexes for table `returns`
--
ALTER TABLE `returns`
  ADD PRIMARY KEY (`id_return`);

--
-- Indexes for table `return_detail`
--
ALTER TABLE `return_detail`
  ADD PRIMARY KEY (`id_unik`);

--
-- Indexes for table `ruangan`
--
ALTER TABLE `ruangan`
  ADD PRIMARY KEY (`id_ruangan`);

--
-- Indexes for table `satuan_obat`
--
ALTER TABLE `satuan_obat`
  ADD PRIMARY KEY (`id_satuan_obat`);

--
-- Indexes for table `session_apotik`
--
ALTER TABLE `session_apotik`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `last_activity_idx` (`last_activity`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Indexes for table `transfer_obat`
--
ALTER TABLE `transfer_obat`
  ADD PRIMARY KEY (`id_transfer_obat`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `amprah_detail`
--
ALTER TABLE `amprah_detail`
  MODIFY `kd_amprah_detail` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategori_obat`
--
ALTER TABLE `kategori_obat`
  MODIFY `id_kategori_obat` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `kategori_pasien`
--
ALTER TABLE `kategori_pasien`
  MODIFY `id_kategori_pasien` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `obat`
--
ALTER TABLE `obat`
  MODIFY `id_obat` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `option_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pembelian_detail`
--
ALTER TABLE `pembelian_detail`
  MODIFY `kode_pembelian_detail` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `penjualan_apotik_rs_detail`
--
ALTER TABLE `penjualan_apotik_rs_detail`
  MODIFY `rs_jual_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `return_detail`
--
ALTER TABLE `return_detail`
  MODIFY `id_unik` int(40) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ruangan`
--
ALTER TABLE `ruangan`
  MODIFY `id_ruangan` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `satuan_obat`
--
ALTER TABLE `satuan_obat`
  MODIFY `id_satuan_obat` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id_supplier` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `transfer_obat`
--
ALTER TABLE `transfer_obat`
  MODIFY `id_transfer_obat` int(40) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
