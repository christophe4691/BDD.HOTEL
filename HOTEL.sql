-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:3306
-- Généré le :  Mar 05 Juin 2018 à 15:59
-- Version du serveur :  5.7.22-0ubuntu18.04.1
-- Version de PHP :  7.2.5-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `HOTEL`
--

-- --------------------------------------------------------

--
-- Structure de la table `Chambre`
--

CREATE TABLE `Chambre` (
  `id` int(11) NOT NULL,
  `Nom_de_la_Chambre` varchar(255) NOT NULL,
  `Etage` int(11) NOT NULL,
  `Superficie` int(100) NOT NULL,
  `Vue` varchar(255) NOT NULL,
  `Accessibilités_aux_personnes_àmobilité_réduite` varchar(10) NOT NULL,
  `Lit: simple/double` varchar(100) NOT NULL,
  `Lit: queen/king` varchar(100) NOT NULL,
  `Prix_de_la_chambre_àla_nuitée` decimal(10,0) NOT NULL,
  `fk_Client_oid` int(11) NOT NULL,
  `fk_Service_oid` int(11) NOT NULL,
  `fk_salle_de_Bain_oid` int(11) NOT NULL,
  `fk_Client` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Clients`
--

CREATE TABLE `Clients` (
  `id` int(11) NOT NULL,
  `Nom` varchar(12) NOT NULL,
  `Prénom` varchar(20) NOT NULL,
  `Téléphone` varchar(12) NOT NULL,
  `E-mail` text NOT NULL,
  `Adresse` varchar(100) NOT NULL,
  `Ville` varchar(100) NOT NULL,
  `Code_Postal` int(10) NOT NULL,
  `Mot_de_passe` int(100) NOT NULL,
  `fk_Facture` int(11) NOT NULL,
  `fk_gerant` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Facture`
--

CREATE TABLE `Facture` (
  `id` int(11) NOT NULL,
  `date_de_la_facture` date NOT NULL,
  `Prix_du_service` decimal(65,0) NOT NULL,
  `Paiment_en_cours` tinyint(1) NOT NULL,
  `Paiment_annulée` tinyint(1) NOT NULL,
  `Paiment_effectuer` tinyint(1) NOT NULL,
  `fk_Réglement` int(11) NOT NULL,
  `fk_service` int(11) NOT NULL,
  `fk_GERANT` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `gérant`
--

CREATE TABLE `gérant` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `hotele`
--

CREATE TABLE `hotele` (
  `id` int(50) NOT NULL,
  `Adresse` varchar(100) DEFAULT NULL,
  `Nbr de chambre` int(50) NOT NULL,
  `Nbr de suite` int(50) NOT NULL,
  `Calculer_chiffre` int(100) NOT NULL,
  `fk_Chambre_oid` int(50) NOT NULL,
  `fk_Suite_oid` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Réglement`
--

CREATE TABLE `Réglement` (
  `id` int(11) NOT NULL,
  `Mode_de_paiment` varchar(50) NOT NULL,
  `Montant` decimal(65,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Réservation`
--

CREATE TABLE `Réservation` (
  `id` int(11) NOT NULL,
  `Date_de_Réservation` date NOT NULL,
  `Date_de_début_de_la_réservation` date NOT NULL,
  `date_de_fin_de_la_réservation` date NOT NULL,
  `Nom_du_client` varchar(50) NOT NULL,
  `Prénom_du_client` varchar(50) NOT NULL,
  `Service_associés` varchar(255) NOT NULL,
  `fk_Gérant_oid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Salle_de_Bain`
--

CREATE TABLE `Salle_de_Bain` (
  `id` int(11) NOT NULL,
  `Douche_et_Baignoire` varchar(100) NOT NULL,
  `Douche` varchar(10) NOT NULL,
  `baignoire` varchar(10) NOT NULL,
  `fk_Client_oid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Services`
--

CREATE TABLE `Services` (
  `id` int(11) NOT NULL,
  `Nom` varchar(100) NOT NULL,
  `Déscription` varchar(255) NOT NULL,
  `Prix` decimal(65,0) NOT NULL,
  `catégorie` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Services_des_Chambres`
--

CREATE TABLE `Services_des_Chambres` (
  `id` int(11) NOT NULL,
  `Petit_déjeuner_en_chambre` varchar(255) NOT NULL,
  `Bouteille_de_champagne` varchar(255) NOT NULL,
  `Prix_du_service` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Servives_des_Suites`
--

CREATE TABLE `Servives_des_Suites` (
  `id` int(11) NOT NULL,
  `Petit_Déjeuner_en_chambre` varchar(255) NOT NULL,
  `Mini_bar` varchar(255) NOT NULL,
  `Bouteille_de_champagne` varchar(255) NOT NULL,
  `Prix_du_service` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Suites`
--

CREATE TABLE `Suites` (
  `id` int(11) NOT NULL,
  `Nom de la suite` varchar(100) NOT NULL,
  `Etage` int(11) NOT NULL,
  `Superficie` int(255) NOT NULL,
  `Vue` text NOT NULL,
  `Accessibilité_auxperssonnes à mobilité_réduite` varchar(100) NOT NULL,
  `Prix_de_la_suite` int(11) NOT NULL,
  `fk_Service_oid` int(50) NOT NULL,
  `fk_HOTEL_oid` int(10) NOT NULL,
  `fk_clients` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `Chambre`
--
ALTER TABLE `Chambre`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fk_Client_oid` (`fk_Client_oid`),
  ADD UNIQUE KEY `fk_Service_oid` (`fk_Service_oid`),
  ADD UNIQUE KEY `fk_salle_de_Bain_oid` (`fk_salle_de_Bain_oid`),
  ADD UNIQUE KEY `fk_Client` (`fk_Client`);

--
-- Index pour la table `Clients`
--
ALTER TABLE `Clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fk_Facture` (`fk_Facture`),
  ADD UNIQUE KEY `fk_gerant` (`fk_gerant`);

--
-- Index pour la table `Facture`
--
ALTER TABLE `Facture`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fk_réglement` (`fk_Réglement`),
  ADD UNIQUE KEY `fk_service` (`fk_service`),
  ADD UNIQUE KEY `fk_GERANT` (`fk_GERANT`);

--
-- Index pour la table `gérant`
--
ALTER TABLE `gérant`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `hotele`
--
ALTER TABLE `hotele`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Suite_oid` (`fk_Suite_oid`),
  ADD UNIQUE KEY `Chambre_oid` (`fk_Chambre_oid`),
  ADD UNIQUE KEY `fk_Suite_oid_2` (`fk_Suite_oid`),
  ADD UNIQUE KEY `fk_Suite_oid_3` (`fk_Suite_oid`),
  ADD KEY `fk_Suite_oid` (`fk_Suite_oid`);

--
-- Index pour la table `Réglement`
--
ALTER TABLE `Réglement`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Réservation`
--
ALTER TABLE `Réservation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fk_Gérant_oid` (`fk_Gérant_oid`);

--
-- Index pour la table `Salle_de_Bain`
--
ALTER TABLE `Salle_de_Bain`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fk_Client_oid` (`fk_Client_oid`);

--
-- Index pour la table `Services`
--
ALTER TABLE `Services`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Services_des_Chambres`
--
ALTER TABLE `Services_des_Chambres`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Servives_des_Suites`
--
ALTER TABLE `Servives_des_Suites`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Suites`
--
ALTER TABLE `Suites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Service_oid` (`fk_Service_oid`),
  ADD UNIQUE KEY `fk_HOTEL_oid` (`fk_HOTEL_oid`),
  ADD UNIQUE KEY `fk_clients` (`fk_clients`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `Chambre`
--
ALTER TABLE `Chambre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `Clients`
--
ALTER TABLE `Clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `Facture`
--
ALTER TABLE `Facture`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `gérant`
--
ALTER TABLE `gérant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `hotele`
--
ALTER TABLE `hotele`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `Réglement`
--
ALTER TABLE `Réglement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `Réservation`
--
ALTER TABLE `Réservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `Salle_de_Bain`
--
ALTER TABLE `Salle_de_Bain`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `Services`
--
ALTER TABLE `Services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `Services_des_Chambres`
--
ALTER TABLE `Services_des_Chambres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `Servives_des_Suites`
--
ALTER TABLE `Servives_des_Suites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `Suites`
--
ALTER TABLE `Suites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `Chambre`
--
ALTER TABLE `Chambre`
  ADD CONSTRAINT `Chambre_ibfk_1` FOREIGN KEY (`fk_Client_oid`) REFERENCES `hotele` (`id`),
  ADD CONSTRAINT `Chambre_ibfk_2` FOREIGN KEY (`fk_Service_oid`) REFERENCES `Services_des_Chambres` (`id`),
  ADD CONSTRAINT `Chambre_ibfk_3` FOREIGN KEY (`fk_salle_de_Bain_oid`) REFERENCES `Salle_de_Bain` (`id`),
  ADD CONSTRAINT `Chambre_ibfk_4` FOREIGN KEY (`fk_Client`) REFERENCES `Clients` (`id`);

--
-- Contraintes pour la table `Clients`
--
ALTER TABLE `Clients`
  ADD CONSTRAINT `Clients_ibfk_1` FOREIGN KEY (`fk_Facture`) REFERENCES `Facture` (`id`),
  ADD CONSTRAINT `Clients_ibfk_2` FOREIGN KEY (`fk_gerant`) REFERENCES `gérant` (`id`);

--
-- Contraintes pour la table `Facture`
--
ALTER TABLE `Facture`
  ADD CONSTRAINT `Facture_ibfk_1` FOREIGN KEY (`fk_service`) REFERENCES `Services` (`id`),
  ADD CONSTRAINT `Facture_ibfk_2` FOREIGN KEY (`fk_Réglement`) REFERENCES `Réglement` (`id`),
  ADD CONSTRAINT `Facture_ibfk_3` FOREIGN KEY (`fk_GERANT`) REFERENCES `gérant` (`id`);

--
-- Contraintes pour la table `hotele`
--
ALTER TABLE `hotele`
  ADD CONSTRAINT `hotele_ibfk_1` FOREIGN KEY (`fk_Suite_oid`) REFERENCES `Suites` (`id`);

--
-- Contraintes pour la table `Réservation`
--
ALTER TABLE `Réservation`
  ADD CONSTRAINT `Réservation_ibfk_1` FOREIGN KEY (`fk_Gérant_oid`) REFERENCES `gérant` (`id`);

--
-- Contraintes pour la table `Salle_de_Bain`
--
ALTER TABLE `Salle_de_Bain`
  ADD CONSTRAINT `Salle_de_Bain_ibfk_1` FOREIGN KEY (`fk_Client_oid`) REFERENCES `Clients` (`id`);

--
-- Contraintes pour la table `Suites`
--
ALTER TABLE `Suites`
  ADD CONSTRAINT `Suites_ibfk_1` FOREIGN KEY (`fk_Service_oid`) REFERENCES `Servives_des_Suites` (`id`),
  ADD CONSTRAINT `Suites_ibfk_2` FOREIGN KEY (`fk_HOTEL_oid`) REFERENCES `hotele` (`id`),
  ADD CONSTRAINT `Suites_ibfk_3` FOREIGN KEY (`fk_clients`) REFERENCES `Clients` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
