-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  mer. 22 mai 2019 à 19:17
-- Version du serveur :  10.1.36-MariaDB
-- Version de PHP :  7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `gsb`
--

-- --------------------------------------------------------

--
-- Structure de la table `administrateur`
--

CREATE TABLE `administrateur` (
  `idAdministrateur` char(3) NOT NULL,
  `nom` char(32) NOT NULL,
  `mdp` char(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `administrateur`
--

INSERT INTO `administrateur` (`idAdministrateur`, `nom`, `mdp`) VALUES
('1', 'baptiste', 'b123'),
('2', 'manon', 'm123');

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `idCategorie` char(32) NOT NULL,
  `libelle` char(32) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`idCategorie`, `libelle`) VALUES
('Amino', 'Aminoglycosides'),
('Antif', 'AntiFongiques'),
('Antiv', 'AntiViraux'),
('Carba', 'Carbapenemes'),
('Cepha', 'Cephalosporines'),
('Macro', 'Macrolides'),
('Penic', 'Penicillines'),
('Quino', 'Quinolones'),
('Sulfa', 'Sulfamides'),
('Autre', 'Autres');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `idCommande` char(32) NOT NULL,
  `dateCommande` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`idCommande`, `dateCommande`) VALUES
('1', '2019-04-12'),
('2', '2018-03-15');

-- --------------------------------------------------------

--
-- Structure de la table `contenir`
--

CREATE TABLE `contenir` (
  `idCommande` char(32) NOT NULL,
  `idProduit` char(32) NOT NULL,
  `quantite` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `contenir`
--

INSERT INTO `contenir` (`idCommande`, `idProduit`, `quantite`) VALUES
('1', '01', 3),
('1', '03', 6),
('1', '02', 3);

-- --------------------------------------------------------

--
-- Structure de la table `medicament`
--

CREATE TABLE `medicament` (
  `idMedicament` char(32) NOT NULL,
  `libelle` char(50) NOT NULL,
  `prix` decimal(10,2) DEFAULT NULL,
  `image` char(50) DEFAULT NULL,
  `idCategorie` char(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `medicament`
--

INSERT INTO `medicament` (`idMedicament`, `libelle`, `prix`, `image`, `idCategorie`) VALUES
('01', 'Amikacine', '8.00', 'https://zupimages.net/up/19/20/dyd7.jpg', 'Amino'),
('02', 'Gentamicine', '5.00', 'https://zupimages.net/up/19/20/lz3b.jpg', 'Amino'),
('03', 'Netilmicine', '3.50', 'https://zupimages.net/up/19/20/kzrr.jpg', 'Amino'),
('04', 'Tobramycine', '4.00', 'https://zupimages.net/up/19/20/54wj.jpg', 'Amino'),
('05', 'Amphotericine', '5.00', 'https://zupimages.net/up/19/20/r44y.jpg', 'Antif'),
('06', 'Fluconazole', '6.00', 'https://zupimages.net/up/19/20/6l9u.jpg', 'Antif'),
('07', 'Itraconazole', '5.50', 'https://zupimages.net/up/19/20/kqbg.jpg', 'Antif');

-- --------------------------------------------------------

--
-- Structure de la table `pharmacien`
--

CREATE TABLE `pharmacien` (
  `idClient` int(4) NOT NULL,
  `nomClient` varchar(20) NOT NULL,
  `cpClient` varchar(5) NOT NULL,
  `villeClient` varchar(30) NOT NULL,
  `mailClient` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `pharmacien`
--

INSERT INTO `pharmacien` (`idClient`, `nomClient`, `cpClient`, `villeClient`, `mailClient`) VALUES
(0, 'Hurel', '78000', 'Versailles', 'baptistehurel@gmail.com'),
(0, 'Hurel', '78000', 'Versailles', 'bhurel@mail.com');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `administrateur`
--
ALTER TABLE `administrateur`
  ADD PRIMARY KEY (`idAdministrateur`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`idCategorie`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`idCommande`);

--
-- Index pour la table `contenir`
--
ALTER TABLE `contenir`
  ADD PRIMARY KEY (`idCommande`,`idProduit`),
  ADD KEY `I_FK_CONTENIR_COMMANDE` (`idCommande`),
  ADD KEY `I_FK_CONTENIR_Produit` (`idProduit`);

--
-- Index pour la table `medicament`
--
ALTER TABLE `medicament`
  ADD PRIMARY KEY (`idMedicament`),
  ADD KEY `I_FK_Produit_CATEGORIE` (`idCategorie`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
