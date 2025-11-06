/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.7.2-MariaDB, for Win64 (AMD64)
--
-- Host: 192.168.56.56    Database: bibliotheque
-- ------------------------------------------------------
-- Server version	12.0.2-MariaDB-ubu2204

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `auteur`
--

DROP TABLE IF EXISTS `auteur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auteur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  `date_naissance` date DEFAULT NULL,
  `nationalite` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auteur`
--

LOCK TABLES `auteur` WRITE;
/*!40000 ALTER TABLE `auteur` DISABLE KEYS */;
INSERT INTO `auteur` VALUES
(1,'Victor Hugo','1802-02-26','Française'),
(2,'Albert Camus','1913-11-07','Française'),
(3,'William Shakespeare','1564-04-23','Anglaise'),
(4,'Jane Austen','1775-12-16','Anglaise'),
(5,'Franz Kafka','1883-07-03','Tchèque'),
(6,'Gabriel García Márquez','1927-03-06','Colombienne'),
(7,'Virginia Woolf','1882-01-25','Anglaise'),
(8,'Fyodor Dostoevsky','1821-11-11','Russe'),
(9,'Ernest Hemingway','1899-07-21','Américaine'),
(10,'Jorge Luis Borges','1899-08-24','Argentine');
/*!40000 ALTER TABLE `auteur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES
(1,'Jean Dupont','jean.dupont@email.com','0123456789'),
(2,'Marie Martin','marie.martin@email.com','0234567890'),
(3,'Pierre Durant','pierre.durant@email.com','0345678901'),
(4,'Sophie Bernard','sophie.bernard@email.com','0456789012'),
(5,'Lucas Petit','lucas.petit@email.com','0567890123'),
(6,'Emma Leroy','emma.leroy@email.com','0678901234'),
(7,'Thomas Moreau','thomas.moreau@email.com','0789012345'),
(8,'Julie Dubois','julie.dubois@email.com','0890123456'),
(9,'Nicolas Roux','nicolas.roux@email.com','0901234567'),
(10,'Laura Simon','laura.simon@email.com','0012345678');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES
(1,'Roman'),
(2,'Science-fiction'),
(3,'Policier'),
(4,'Fantasy'),
(5,'Biographie'),
(6,'Histoire'),
(7,'Poésie'),
(8,'Théâtre'),
(9,'Philosophie'),
(10,'Aventure');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livres`
--

DROP TABLE IF EXISTS `livres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `livres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) DEFAULT NULL,
  `resume` text DEFAULT NULL,
  `code_barre` varchar(255) DEFAULT NULL,
  `id_auteur` int(11) DEFAULT NULL,
  `id_genre` int(11) DEFAULT NULL,
  `couverture` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id_auteur` (`id_auteur`),
  KEY `id_genre` (`id_genre`)
) ENGINE=MyISAM AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livres`
--

LOCK TABLES `livres` WRITE;
/*!40000 ALTER TABLE `livres` DISABLE KEYS */;
INSERT INTO `livres` VALUES
(1,'Les Misérables','L\'histoire de Jean Valjean dans le Paris du XIXe siècle.','LIV001',1,1,'images/LIV001.jpg'),
(2,'Notre-Dame de Paris','L\'histoire de Quasimodo et Esmeralda dans le Paris médiéval.','LIV002',1,1,'images/LIV002.jpg'),
(3,'Les Travailleurs de la mer','Un pêcheur lutte contre la mer pour sauver un navire.','LIV003',1,1,'images/LIV003.jpg'),
(4,'L\'Homme qui rit','Un enfant défiguré devient saltimbanque dans l\'Angleterre du XVIIe siècle.','LIV004',1,1,'images/LIV004.jpg'),
(5,'Quatrevingt-treize','Roman historique sur la Révolution française.','LIV005',1,1,'images/LIV005.jpg'),
(6,'Les Contemplations','Recueil de poèmes personnels et philosophiques.','LIV006',1,7,'images/LIV006.jpg'),
(7,'Les Châtiments','Poèmes satiriques contre Napoléon III.','LIV007',1,7,'images/LIV007.jpg'),
(8,'Les Orientales','Poèmes inspirés par la guerre d\'indépendance grecque.','LIV008',1,7,'images/LIV008.jpg'),
(9,'Hernani','Drame romantique sur l\'honneur et l\'amour.','LIV009',1,8,'images/LIV009.jpg'),
(10,'Ruy Blas','Un valet amoureux d\'une reine d\'Espagne.','LIV010',1,8,'images/LIV010.jpg'),
(11,'Le Roi s\'amuse','Drame sur un bouffon de cour et sa fille.','LIV011',1,8,'images/LIV011.jpg'),
(12,'Les Burgraves','Tragédie médiévale allemande.','LIV012',1,8,'images/LIV012.jpg'),
(13,'Bug-Jargal','Roman sur la révolte des esclaves à Saint-Domingue.','LIV013',1,1,'images/LIV013.jpg'),
(14,'Le Dernier Jour d\'un condamné','Journal intime d\'un condamné à mort.','LIV014',1,1,'images/LIV014.jpg'),
(15,'Claude Gueux','Histoire d\'un ouvrier poussé au crime par la misère.','LIV015',1,1,'images/LIV015.jpg'),
(16,'L\'Étranger','Meursault face à l\'absurdité de l\'existence.','LIV016',2,1,'images/LIV016.jpg'),
(17,'La Peste','Une épidémie ravage la ville d\'Oran.','LIV017',2,1,'images/LIV017.jpg'),
(18,'Le Mythe de Sisyphe','Essai philosophique sur l\'absurde.','LIV018',2,9,'images/LIV018.jpg'),
(19,'L\'Homme révolté','Réflexion sur la notion de révolte.','LIV019',2,9,'images/LIV019.jpg'),
(20,'La Chute','Confessions d\'un avocat parisien à Amsterdam.','LIV020',2,1,'images/LIV020.jpg'),
(21,'Caligula','Pièce sur la démence du pouvoir absolu.','LIV021',2,8,'images/LIV021.jpg'),
(22,'Le Malentendu','Drame sur un retour tragique.','LIV022',2,8,'images/LIV022.jpg'),
(23,'Les Justes','Des terroristes face à leurs contradictions.','LIV023',2,8,'images/LIV023.jpg'),
(24,'L\'Été','Recueil d\'essais sur la Méditerranée.','LIV024',2,9,'images/LIV024.jpg'),
(25,'Noces','Célébration de la vie et de la nature.','LIV025',2,9,'images/LIV025.jpg'),
(26,'Hamlet','La vengeance du prince du Danemark.','LIV026',3,8,'images/LIV026.jpg'),
(27,'Macbeth','L\'ambition meurtrière d\'un général écossais.','LIV027',3,8,'images/LIV027.jpg'),
(28,'Le Roi Lear','Un roi partage son royaume entre ses filles.','LIV028',3,8,'images/LIV028.jpg'),
(29,'Othello','La jalousie destructrice d\'un général maure.','LIV029',3,8,'images/LIV029.jpg'),
(30,'Roméo et Juliette','L\'amour impossible de deux jeunes amants.','LIV030',3,8,'images/LIV030.jpg'),
(31,'Le Songe d\'une nuit d\'été','Féerie dans une forêt enchantée.','LIV031',3,8,'images/LIV031.jpg'),
(32,'La Tempête','Un magicien exilé sur une île mystérieuse.','LIV032',3,8,'images/LIV032.jpg'),
(33,'Richard III','L\'ascension d\'un roi machiavélique.','LIV033',3,8,'images/LIV033.jpg'),
(34,'Jules César','Conspiration et trahison dans la Rome antique.','LIV034',3,8,'images/LIV034.jpg'),
(35,'Le Marchand de Venise','Dette et justice dans la Venise médiévale.','LIV035',3,8,'images/LIV035.jpg'),
(36,'Antoine et Cléopâtre','L\'amour et le pouvoir dans l\'Égypte antique.','LIV036',3,8,'images/LIV036.jpg'),
(37,'Beaucoup de bruit pour rien','Comédie romantique et quiproquos.','LIV037',3,8,'images/LIV037.jpg'),
(38,'Orgueil et Préjugés','Elizabeth Bennet et Mr. Darcy.','LIV038',4,1,'images/LIV038.jpg'),
(39,'Emma','Une jeune femme joue les entremetteuses.','LIV039',4,1,'images/LIV039.jpg'),
(40,'Raison et Sentiments','Les sœurs Dashwood face à l\'amour.','LIV040',4,1,'images/LIV040.jpg'),
(41,'Mansfield Park','Fanny Price et les conventions sociales.','LIV041',4,1,'images/LIV041.jpg'),
(42,'Northanger Abbey','Une jeune lectrice de romans gothiques.','LIV042',4,1,'images/LIV042.jpg'),
(43,'Persuasion','Une seconde chance pour l\'amour.','LIV043',4,1,'images/LIV043.jpg'),
(44,'Lady Susan','Une veuve manipulatrice.','LIV044',4,1,'images/LIV044.jpg'),
(45,'Les Watson','Fragment d\'un roman inachevé.','LIV045',4,1,'images/LIV045.jpg'),
(46,'La Métamorphose','Un homme transformé en insecte.','LIV046',5,2,'images/LIV046.jpg'),
(47,'Le Procès','Joseph K. face à une justice absurde.','LIV047',5,1,'images/LIV047.jpg'),
(48,'Le Château','K. tente d\'accéder à une administration mystérieuse.','LIV048',5,1,'images/LIV048.jpg'),
(49,'Amerika','Un jeune émigrant en Amérique.','LIV049',5,1,'images/LIV049.jpg'),
(50,'Dans la colonie pénitentiaire','Une machine de torture bureaucratique.','LIV050',5,1,'images/LIV050.jpg'),
(51,'Un artiste de la faim','Un jeûneur professionnel.','LIV051',5,1,'images/LIV051.jpg'),
(52,'La Muraille de Chine','Nouvelles posthumes.','LIV052',5,1,'images/LIV052.jpg'),
(53,'Lettre au père','Correspondance personnelle.','LIV053',5,5,'images/LIV053.jpg'),
(54,'Journal','Notes personnelles de l\'auteur.','LIV054',5,5,'images/LIV054.jpg'),
(55,'Méditations','Réflexions philosophiques.','LIV055',5,9,'images/LIV055.jpg'),
(56,'Cent ans de solitude','La saga des Buendía à Macondo.','LIV056',6,1,'images/LIV056.jpg'),
(57,'L\'Amour aux temps du choléra','Une histoire d\'amour sur cinquante ans.','LIV057',6,1,'images/LIV057.jpg'),
(58,'Chronique d\'une mort annoncée','Un meurtre prévisible dans un village.','LIV058',6,1,'images/LIV058.jpg'),
(59,'Le Général dans son labyrinthe','Les derniers jours de Simón Bolívar.','LIV059',6,1,'images/LIV059.jpg'),
(60,'De l\'amour et autres démons','Une jeune fille possédée au XVIIIe siècle.','LIV060',6,1,'images/LIV060.jpg'),
(61,'Pas de lettre pour le colonel','Un vieux colonel attend sa pension.','LIV061',6,1,'images/LIV061.jpg'),
(62,'L\'Automne du patriarche','La solitude du pouvoir absolu.','LIV062',6,1,'images/LIV062.jpg'),
(63,'Récit d\'un naufragé','Histoire vraie d\'un marin colombien.','LIV063',6,1,'images/LIV063.jpg'),
(64,'Vivre pour la raconter','Mémoires de l\'auteur.','LIV064',6,5,'images/LIV064.jpg'),
(65,'Douze contes vagabonds','Nouvelles sur des Latino-américains en Europe.','LIV065',6,1,'images/LIV065.jpg'),
(66,'Mrs Dalloway','Une journée dans la vie de Clarissa Dalloway.','LIV066',7,1,'images/LIV066.jpg'),
(67,'La Promenade au phare','Une famille sur l\'île de Skye.','LIV067',7,1,'images/LIV067.jpg'),
(68,'Orlando','Un noble traversant les siècles.','LIV068',7,1,'images/LIV068.jpg'),
(69,'Les Vagues','Six voix intérieures entrelacées.','LIV069',7,1,'images/LIV069.jpg'),
(70,'Une chambre à soi','Essai sur les femmes et la littérature.','LIV070',7,9,'images/LIV070.jpg'),
(71,'Nuit et jour','Quatre jeunes gens dans le Londres édouardien.','LIV071',7,1,'images/LIV071.jpg'),
(72,'Les Années','Chronique d\'une famille anglaise.','LIV072',7,1,'images/LIV072.jpg'),
(73,'Entre les actes','Un pageant villageois avant la guerre.','LIV073',7,1,'images/LIV073.jpg'),
(74,'La Traversée des apparences','Une jeune femme dans l\'Angleterre victorienne.','LIV074',7,1,'images/LIV074.jpg'),
(75,'Journal d\'un écrivain','Journal personnel de Virginia Woolf.','LIV075',7,5,'images/LIV075.jpg'),
(76,'Crime et Châtiment','Un étudiant commet un meurtre philosophique.','LIV076',8,1,'images/LIV076.jpg'),
(77,'Les Frères Karamazov','Drame familial et questionnements spirituels.','LIV077',8,1,'images/LIV077.jpg'),
(78,'L\'Idiot','Un prince naïf dans la société pétersbourgeoise.','LIV078',8,1,'images/LIV078.jpg'),
(79,'Les Démons','Révolutionnaires dans une ville de province.','LIV079',8,1,'images/LIV079.jpg'),
(80,'Notes d\'un souterrain','Monologue d\'un homme aigri.','LIV080',8,1,'images/LIV080.jpg'),
(81,'Le Joueur','La passion du jeu et de l\'amour.','LIV081',8,1,'images/LIV081.jpg'),
(82,'L\'Adolescent','Un jeune homme à la recherche de son père.','LIV082',8,1,'images/LIV082.jpg'),
(83,'Les Nuits blanches','Rêveries d\'un promeneur solitaire.','LIV083',8,1,'images/LIV083.jpg'),
(84,'Humiliés et offensés','La vie des pauvres à Saint-Pétersbourg.','LIV084',8,1,'images/LIV084.jpg'),
(85,'Les Pauvres Gens','Correspondance entre deux voisins pauvres.','LIV085',8,1,'images/LIV085.jpg'),
(86,'Le Vieil Homme et la Mer','Un pêcheur cubain et un grand poisson.','LIV086',9,1,'images/LIV086.jpg'),
(87,'Pour qui sonne le glas','La guerre civile espagnole.','LIV087',9,1,'images/LIV087.jpg'),
(88,'L\'Adieu aux armes','Une histoire d\'amour pendant la Grande Guerre.','LIV088',9,1,'images/LIV088.jpg'),
(89,'Le soleil se lève aussi','Des expatriés à Paris et en Espagne.','LIV089',9,1,'images/LIV089.jpg'),
(90,'Les Neiges du Kilimandjaro','Un écrivain face à la mort en Afrique.','LIV090',9,1,'images/LIV090.jpg'),
(91,'En avoir ou pas','Contrebande entre Cuba et la Floride.','LIV091',9,1,'images/LIV091.jpg'),
(92,'Paris est une fête','Mémoires des années parisiennes.','LIV092',9,5,'images/LIV092.jpg'),
(93,'Les Vertes Collines d\'Afrique','Safari en Afrique de l\'Est.','LIV093',9,5,'images/LIV093.jpg'),
(94,'Fictions','Nouvelles métaphysiques et fantastiques.','LIV094',10,2,'images/LIV094.jpg'),
(95,'L\'Aleph','Contes sur l\'infini et le temps.','LIV095',10,2,'images/LIV095.jpg'),
(96,'Le Livre de sable','Nouvelles sur les livres et l\'éternité.','LIV096',10,2,'images/LIV096.jpg'),
(97,'L\'Auteur et autres textes','Essais littéraires.','LIV097',10,9,'images/LIV097.jpg'),
(98,'Histoire universelle de l\'infamie','Biographies de criminels imaginaires.','LIV098',10,1,'images/LIV098.jpg'),
(99,'Le Rapport de Brodie','Nouvelles sur la violence et l\'honneur.','LIV099',10,1,'images/LIV099.jpg'),
(100,'L\'Art de la poésie','Conférences sur la littérature.','LIV100',10,9,'images/LIV100.jpg');
/*!40000 ALTER TABLE `livres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_livre` int(11) DEFAULT NULL,
  `id_client` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `date_retour` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id_livre` (`id_livre`),
  KEY `id_client` (`id_client`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservations`
--

LOCK TABLES `reservations` WRITE;
/*!40000 ALTER TABLE `reservations` DISABLE KEYS */;
INSERT INTO `reservations` VALUES
(1,1,1,'2025-10-05','2025-10-22','jean.dupont@email.com'),
(2,2,2,'2025-10-06',NULL,'marie.martin@email.com'),
(3,3,3,'2025-10-07','2025-10-10','pierre.durant@email.com'),
(4,4,4,'2025-10-08','2025-11-02','sophie.bernard@email.com'),
(5,5,5,'2025-10-09',NULL,'lucas.petit@email.com'),
(6,6,6,'2025-10-10','2025-10-23','emma.leroy@email.com'),
(7,7,7,'2025-10-11',NULL,'thomas.moreau@email.com'),
(8,8,8,'2025-10-12','2025-10-30','julie.dubois@email.com'),
(9,9,9,'2025-10-13',NULL,'nicolas.roux@email.com'),
(10,10,10,'2025-10-14',NULL,'laura.simon@email.com');
/*!40000 ALTER TABLE `reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'bibliotheque'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-11-06 16:16:28
