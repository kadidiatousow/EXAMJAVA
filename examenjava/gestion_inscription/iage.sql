-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 03 juin 2024 à 19:43
-- Version du serveur : 5.7.36
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `iage`
--

-- --------------------------------------------------------

--
-- Structure de la table `classe`
--

DROP TABLE IF EXISTS `classe`;
CREATE TABLE IF NOT EXISTS `classe` (
  `Id_classe` int(11) NOT NULL AUTO_INCREMENT,
  `Libelle_classe` varchar(255) NOT NULL,
  PRIMARY KEY (`Id_classe`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `classe`
--

INSERT INTO `classe` (`Id_classe`, `Libelle_classe`) VALUES
(1, 'IAGE'),
(2, 'MOSIEF');

-- --------------------------------------------------------

--
-- Structure de la table `classes`
--

DROP TABLE IF EXISTS `classes`;
CREATE TABLE IF NOT EXISTS `classes` (
  `Id_classe` int(11) NOT NULL AUTO_INCREMENT,
  `Libelle_classe` varchar(255) NOT NULL,
  PRIMARY KEY (`Id_classe`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `classes`
--

INSERT INTO `classes` (`Id_classe`, `Libelle_classe`) VALUES
(1, 'IAGE'),
(2, 'MOSIEF'),
(3, 'GLRS'),
(4, 'MAIE');

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

DROP TABLE IF EXISTS `etudiant`;
CREATE TABLE IF NOT EXISTS `etudiant` (
  `id_etudiant` int(11) NOT NULL AUTO_INCREMENT,
  `mat_etudiant` varchar(25) NOT NULL,
  `nom_complet` varchar(25) NOT NULL,
  `tutor_etudiant` varchar(25) NOT NULL,
  PRIMARY KEY (`id_etudiant`),
  UNIQUE KEY `mat_etudiant` (`mat_etudiant`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`id_etudiant`, `mat_etudiant`, `nom_complet`, `tutor_etudiant`) VALUES
(17, 'MAT-001', 'Abdou', 'Mateo'),
(18, 'matri85', 'Carlos', 'Nanou'),
(19, '845', 'SOcio', 'GHOST');

-- --------------------------------------------------------

--
-- Structure de la table `etudiant_classe`
--

DROP TABLE IF EXISTS `etudiant_classe`;
CREATE TABLE IF NOT EXISTS `etudiant_classe` (
  `idEC` int(11) NOT NULL AUTO_INCREMENT,
  `nom_classe` varchar(255) NOT NULL,
  `etd_id` int(11) NOT NULL,
  PRIMARY KEY (`idEC`),
  KEY `etd_id` (`etd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `etudiant_classe`
--

INSERT INTO `etudiant_classe` (`idEC`, `nom_classe`, `etd_id`) VALUES
(2, 'GLRS', 18),
(3, 'GLRS', 17),
(4, 'IAGE', 19);

-- --------------------------------------------------------

--
-- Structure de la table `inscription`
--

DROP TABLE IF EXISTS `inscription`;
CREATE TABLE IF NOT EXISTS `inscription` (
  `Id_inscription` int(11) NOT NULL AUTO_INCREMENT,
  `date_inscription` varchar(255) NOT NULL,
  `nom_classe` varchar(255) NOT NULL,
  `etudiant_id` int(11) NOT NULL,
  PRIMARY KEY (`Id_inscription`),
  KEY `etudiant_id` (`etudiant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `inscription`
--

INSERT INTO `inscription` (`Id_inscription`, `date_inscription`, `nom_classe`, `etudiant_id`) VALUES
(1, '25-04-2025', '0', 18),
(2, '21-05-99', 'MOSIEF', 17),
(3, '', 'IAGE', 18),
(4, '25-04-2025', 'IAGE', 18);

-- --------------------------------------------------------

--
-- Structure de la table `professeur`
--

DROP TABLE IF EXISTS `professeur`;
CREATE TABLE IF NOT EXISTS `professeur` (
  `id_prof` int(11) NOT NULL AUTO_INCREMENT,
  `nci_prof` varchar(25) NOT NULL,
  `nom_completprof` varchar(25) NOT NULL,
  `Grade` varchar(25) NOT NULL,
  PRIMARY KEY (`id_prof`),
  UNIQUE KEY `nci_prof` (`nci_prof`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `professeur`
--

INSERT INTO `professeur` (`id_prof`, `nci_prof`, `nom_completprof`, `Grade`) VALUES
(1, '25', '', 'k'),
(2, '52', 'Birane', 'Dev'),
(3, '12', 'Birane', 'Dev'),
(4, 'Des-65', 'Olivier', 'Desineur'),
(5, 'Prof-652', 'PAscal', 'Marketting'),
(6, 'music-1', 'musical', 'Music'),
(7, 'art5', 'artiste', 'art'),
(8, '02', 'fgh', 'ghj'),
(9, 'diop1', 'diop', 'droit'),
(10, 'fall1', 'fall', 'management'),
(11, 'Prof-144', 'Samsom', 'Finances');

-- --------------------------------------------------------

--
-- Structure de la table `professeur_classe`
--

DROP TABLE IF EXISTS `professeur_classe`;
CREATE TABLE IF NOT EXISTS `professeur_classe` (
  `idPC` int(11) NOT NULL AUTO_INCREMENT,
  `nom_classe` varchar(255) NOT NULL,
  `id_prof` int(11) NOT NULL,
  PRIMARY KEY (`idPC`),
  KEY `professeur_id` (`id_prof`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `professeur_classe`
--

INSERT INTO `professeur_classe` (`idPC`, `nom_classe`, `id_prof`) VALUES
(1, 'IAGE', 11);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `etudiant_classe`
--
ALTER TABLE `etudiant_classe`
  ADD CONSTRAINT `etudiant_classe_ibfk_1` FOREIGN KEY (`etd_id`) REFERENCES `etudiant` (`id_etudiant`);

--
-- Contraintes pour la table `inscription`
--
ALTER TABLE `inscription`
  ADD CONSTRAINT `inscription_ibfk_1` FOREIGN KEY (`etudiant_id`) REFERENCES `etudiant` (`id_etudiant`);

--
-- Contraintes pour la table `professeur_classe`
--
ALTER TABLE `professeur_classe`
  ADD CONSTRAINT `professeur_classe_ibfk_1` FOREIGN KEY (`id_prof`) REFERENCES `professeur` (`id_prof`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
