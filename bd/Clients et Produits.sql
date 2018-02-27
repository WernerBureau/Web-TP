-- phpMyAdmin SQL Dump
-- version 4.4.15.9
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 21, 2018 at 09:20 PM
-- Server version: 5.6.37
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Clients et Produits`
--

-- --------------------------------------------------------

--
-- Table structure for table `Adresse`
--

CREATE TABLE IF NOT EXISTS `Adresse` (
  `adresse_id` int(11) NOT NULL,
  `ligne_1_numero_appartement` int(11) DEFAULT NULL,
  `ligne_2_numero_civique` int(11) NOT NULL,
  `ligne_3_rue` varchar(255) NOT NULL,
  `ville` varchar(255) NOT NULL,
  `codepostal` varchar(255) NOT NULL,
  `etat_province` varchar(255) NOT NULL,
  `pays` varchar(255) NOT NULL,
  `adresse_autre_details` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Adresse`
--

INSERT INTO `Adresse` (`adresse_id`, `ligne_1_numero_appartement`, `ligne_2_numero_civique`, `ligne_3_rue`, `ville`, `codepostal`, `etat_province`, `pays`, `adresse_autre_details`) VALUES
(1, NULL, 291, 'rue Gaston', 'Repentigny', 'J6A 4H4', 'Québec', 'Canada', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Client`
--

CREATE TABLE IF NOT EXISTS `Client` (
  `client_id` int(11) NOT NULL,
  `methode_paiement_code` int(11) NOT NULL,
  `client_telephone` varchar(255) NOT NULL,
  `client_email` varchar(255) NOT NULL,
  `client_autre_details` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Client`
--

INSERT INTO `Client` (`client_id`, `methode_paiement_code`, `client_telephone`, `client_email`, `client_autre_details`) VALUES
(1, 1, '438-882-1597', 'werner.burat@gmail.com', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Client_Adresse_Historique`
--

CREATE TABLE IF NOT EXISTS `Client_Adresse_Historique` (
  `client_id` int(11) NOT NULL,
  `adresse_id` int(11) NOT NULL,
  `date_de` date NOT NULL,
  `adresse_type_code` int(11) NOT NULL,
  `date_a` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Client_Adresse_Historique`
--

INSERT INTO `Client_Adresse_Historique` (`client_id`, `adresse_id`, `date_de`, `adresse_type_code`, `date_a`) VALUES
(1, 1, '2018-01-30', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Commande_Client`
--

CREATE TABLE IF NOT EXISTS `Commande_Client` (
  `commande_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `commande_status_code` int(11) NOT NULL,
  `commande_date` date NOT NULL,
  `commande_autre_details` varchar(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Commande_Client`
--

INSERT INTO `Commande_Client` (`commande_id`, `client_id`, `commande_status_code`, `commande_date`, `commande_autre_details`) VALUES
(3, 1, 1, '2018-01-30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Commande_Item`
--

CREATE TABLE IF NOT EXISTS `Commande_Item` (
  `commande_item_id` int(11) NOT NULL,
  `commande_id` int(11) NOT NULL,
  `produit_id` int(11) NOT NULL,
  `commande_quantite` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Commande_Item`
--

INSERT INTO `Commande_Item` (`commande_item_id`, `commande_id`, `produit_id`, `commande_quantite`) VALUES
(1, 3, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Produit`
--

CREATE TABLE IF NOT EXISTS `Produit` (
  `produit_id` int(11) NOT NULL,
  `produit_type_code` int(11) NOT NULL,
  `produit_nom` varchar(255) NOT NULL,
  `produit_prix` decimal(10,2) NOT NULL,
  `produit_autre_details` varchar(255) NOT NULL,
  `produit_disponible` tinyint(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Produit`
--

INSERT INTO `Produit` (`produit_id`, `produit_type_code`, `produit_nom`, `produit_prix`, `produit_autre_details`, `produit_disponible`) VALUES
(1, 3, 'T-shirt en coton', '19.99', 'T-shirt en jersey de coton de première qualité.', 1),
(2, 4, 'Jeans bleu', '21.98', 'Jeans bleu régulier', 0),
(13, 4, 'Jeans noir', '19.99', 'Jeans noir sont vraiment beaux', 1),
(25, 4, 'Jeans jaune', '19.18', 'Jeans jaunes vraiment moins beaux', 0);

-- --------------------------------------------------------

--
-- Table structure for table `Ref_Adresse_Type`
--

CREATE TABLE IF NOT EXISTS `Ref_Adresse_Type` (
  `type_adresse_code` int(11) NOT NULL,
  `type_adresse_description` varchar(255) NOT NULL COMMENT '-eg Adresse paiement, residentielle'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Ref_Adresse_Type`
--

INSERT INTO `Ref_Adresse_Type` (`type_adresse_code`, `type_adresse_description`) VALUES
(1, 'Facturation'),
(2, 'Résidentiel');

-- --------------------------------------------------------

--
-- Table structure for table `Ref_Commande_Status_Code`
--

CREATE TABLE IF NOT EXISTS `Ref_Commande_Status_Code` (
  `commande_status_code` int(11) NOT NULL,
  `commande_status_description` varchar(255) NOT NULL COMMENT '-eg Completee, En cours'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Ref_Commande_Status_Code`
--

INSERT INTO `Ref_Commande_Status_Code` (`commande_status_code`, `commande_status_description`) VALUES
(1, 'En cours'),
(2, 'Livré');

-- --------------------------------------------------------

--
-- Table structure for table `Ref_Methode_Paiement`
--

CREATE TABLE IF NOT EXISTS `Ref_Methode_Paiement` (
  `methode_paiement_code` int(11) NOT NULL,
  `methode_paiement_description` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Ref_Methode_Paiement`
--

INSERT INTO `Ref_Methode_Paiement` (`methode_paiement_code`, `methode_paiement_description`) VALUES
(1, 'Carte de credit'),
(2, 'Carte de debit'),
(3, 'Paypal');

-- --------------------------------------------------------

--
-- Table structure for table `Ref_Produit_Type`
--

CREATE TABLE IF NOT EXISTS `Ref_Produit_Type` (
  `type_produit_code` int(11) NOT NULL,
  `type_produit_description` varchar(255) NOT NULL COMMENT '-eg Vetements, Bijoux'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Ref_Produit_Type`
--

INSERT INTO `Ref_Produit_Type` (`type_produit_code`, `type_produit_description`) VALUES
(3, 'Chandail'),
(4, 'Pantalon');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Adresse`
--
ALTER TABLE `Adresse`
  ADD PRIMARY KEY (`adresse_id`);

--
-- Indexes for table `Client`
--
ALTER TABLE `Client`
  ADD PRIMARY KEY (`client_id`),
  ADD UNIQUE KEY `methode_paiement_code` (`methode_paiement_code`);

--
-- Indexes for table `Client_Adresse_Historique`
--
ALTER TABLE `Client_Adresse_Historique`
  ADD PRIMARY KEY (`date_de`,`adresse_id`,`client_id`),
  ADD UNIQUE KEY `client_id` (`client_id`),
  ADD UNIQUE KEY `adresse_id` (`adresse_id`),
  ADD UNIQUE KEY `adresse_type_code` (`adresse_type_code`);

--
-- Indexes for table `Commande_Client`
--
ALTER TABLE `Commande_Client`
  ADD PRIMARY KEY (`commande_id`),
  ADD UNIQUE KEY `id_client` (`client_id`),
  ADD UNIQUE KEY `commande_status_code` (`commande_status_code`);

--
-- Indexes for table `Commande_Item`
--
ALTER TABLE `Commande_Item`
  ADD PRIMARY KEY (`commande_item_id`),
  ADD UNIQUE KEY `commande_id` (`commande_id`),
  ADD UNIQUE KEY `produit_id` (`produit_id`);

--
-- Indexes for table `Produit`
--
ALTER TABLE `Produit`
  ADD PRIMARY KEY (`produit_id`),
  ADD KEY `produit_type_code` (`produit_type_code`) USING BTREE;

--
-- Indexes for table `Ref_Adresse_Type`
--
ALTER TABLE `Ref_Adresse_Type`
  ADD PRIMARY KEY (`type_adresse_code`);

--
-- Indexes for table `Ref_Commande_Status_Code`
--
ALTER TABLE `Ref_Commande_Status_Code`
  ADD PRIMARY KEY (`commande_status_code`);

--
-- Indexes for table `Ref_Methode_Paiement`
--
ALTER TABLE `Ref_Methode_Paiement`
  ADD PRIMARY KEY (`methode_paiement_code`);

--
-- Indexes for table `Ref_Produit_Type`
--
ALTER TABLE `Ref_Produit_Type`
  ADD PRIMARY KEY (`type_produit_code`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Adresse`
--
ALTER TABLE `Adresse`
  MODIFY `adresse_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `Client`
--
ALTER TABLE `Client`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `Commande_Client`
--
ALTER TABLE `Commande_Client`
  MODIFY `commande_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `Commande_Item`
--
ALTER TABLE `Commande_Item`
  MODIFY `commande_item_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `Produit`
--
ALTER TABLE `Produit`
  MODIFY `produit_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `Ref_Adresse_Type`
--
ALTER TABLE `Ref_Adresse_Type`
  MODIFY `type_adresse_code` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `Ref_Commande_Status_Code`
--
ALTER TABLE `Ref_Commande_Status_Code`
  MODIFY `commande_status_code` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `Ref_Methode_Paiement`
--
ALTER TABLE `Ref_Methode_Paiement`
  MODIFY `methode_paiement_code` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `Ref_Produit_Type`
--
ALTER TABLE `Ref_Produit_Type`
  MODIFY `type_produit_code` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Client`
--
ALTER TABLE `Client`
  ADD CONSTRAINT `fk_client_codepaiement` FOREIGN KEY (`methode_paiement_code`) REFERENCES `Ref_Methode_Paiement` (`methode_paiement_code`);

--
-- Constraints for table `Client_Adresse_Historique`
--
ALTER TABLE `Client_Adresse_Historique`
  ADD CONSTRAINT `fk_adresse_type_code` FOREIGN KEY (`adresse_type_code`) REFERENCES `Ref_Adresse_Type` (`type_adresse_code`),
  ADD CONSTRAINT `pf_adresseid` FOREIGN KEY (`adresse_id`) REFERENCES `Adresse` (`adresse_id`),
  ADD CONSTRAINT `pf_clientid` FOREIGN KEY (`client_id`) REFERENCES `Client` (`client_id`);

--
-- Constraints for table `Commande_Client`
--
ALTER TABLE `Commande_Client`
  ADD CONSTRAINT `fk_commande_client` FOREIGN KEY (`client_id`) REFERENCES `Client` (`client_id`),
  ADD CONSTRAINT `fk_commande_codestatus` FOREIGN KEY (`commande_status_code`) REFERENCES `Ref_Commande_Status_Code` (`commande_status_code`);

--
-- Constraints for table `Commande_Item`
--
ALTER TABLE `Commande_Item`
  ADD CONSTRAINT `fk_commandeitem_commandeclient` FOREIGN KEY (`commande_id`) REFERENCES `Commande_Client` (`commande_id`),
  ADD CONSTRAINT `fk_commandeitem_produit` FOREIGN KEY (`produit_id`) REFERENCES `Produit` (`produit_id`);

--
-- Constraints for table `Produit`
--
ALTER TABLE `Produit`
  ADD CONSTRAINT `fk_produit_typeproduit` FOREIGN KEY (`produit_type_code`) REFERENCES `Ref_Produit_Type` (`type_produit_code`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
