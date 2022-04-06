CREATE DATABASE  IF NOT EXISTS `bocxsfyiiez9fiwitohe` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bocxsfyiiez9fiwitohe`;
-- MySQL dump 10.13  Distrib 8.0.28, for macos11 (x86_64)
--
-- Host: bocxsfyiiez9fiwitohe-mysql.services.clever-cloud.com    Database: bocxsfyiiez9fiwitohe
-- ------------------------------------------------------
-- Server version	8.0.22-13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'a05a675a-1414-11e9-9c82-cecd01b08c7e:1-491550428,
a38a16d0-767a-11eb-abe2-cecd029e558e:1-128593779';

--
-- Table structure for table `found`
--

DROP TABLE IF EXISTS `found`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `found` (
  `Pokemon` varchar(45) NOT NULL,
  `Location` varchar(45) NOT NULL,
  `Terrain` varchar(45) DEFAULT NULL,
  `Rate` varchar(45) DEFAULT NULL,
  `Lvl` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `found`
--

LOCK TABLES `found` WRITE;
/*!40000 ALTER TABLE `found` DISABLE KEYS */;
INSERT INTO `found` VALUES ('Bulbasaur','Pallet Town','Gift','Only 1','5'),('Ivysaur','Unknown','','',''),('Venasaur','Unknown','','',''),('Charmander','Pallet Town','Gift','Only 1','5'),('Charmeleon','Unknown','','',''),('Charizard','Unknown','','',''),('Squirtle','Pallet Town','Gift','Only 1','5'),('Wartortle','Unknown','','',''),('Blastoise','Unknown','','',''),('Caterpie','Pattern Bush','Grass','10','6'),('Caterpie','Viridian Forest','Grass','40',' 3-4'),('Caterpie','Route 2','Grass','5',' 4-5'),('Caterpie','Route 24','Grass','20','7'),('Caterpie','Route 25','Grass','20','8'),('Metapod','Pattern Bush','Grass',' 5-20','9'),('Metapod','Viridian Forest','Grass',' 5-10',' 4-6'),('Metapod','Route 24','Grass',' 1-4','8'),('Metapod','Route 25','Grass',' 1-4','9'),('Butterfree','Unknown','','','');
/*!40000 ALTER TABLE `found` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `immunity`
--

DROP TABLE IF EXISTS `immunity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `immunity` (
  `Type` varchar(45) NOT NULL,
  `Immunity` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `immunity`
--

LOCK TABLES `immunity` WRITE;
/*!40000 ALTER TABLE `immunity` DISABLE KEYS */;
INSERT INTO `immunity` VALUES ('Normal','Ghost'),('Ghost','Normal'),('Ghost','Fighting'),('Flying','Ground');
/*!40000 ALTER TABLE `immunity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learns`
--

DROP TABLE IF EXISTS `learns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `learns` (
  `Name` varchar(45) NOT NULL,
  `Move` varchar(45) NOT NULL,
  `Lvl` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learns`
--

LOCK TABLES `learns` WRITE;
/*!40000 ALTER TABLE `learns` DISABLE KEYS */;
INSERT INTO `learns` VALUES ('Caterpie','Tackle',1),('Caterpie','String Shot',1),('Metapod','Harden',1),('Metapod','Harden',7),('Bulbasaur','Tackle',1),('Bulbasaur','Growl',4),('Charmander','Growl',1),('Charmander','Ember',7),('Charmander','Metal Claw',13),('Squirtle','Tackle',1),('Squirtle','Water Gun',13),('Squirtle','Rain Dance',33),('Wartortle','Tackle',1),('Wartortle','Water Gun',13),('Wartortle','Rain Dance',37),('Blastoise','Tackle',1),('Blastoise','Water Gun',13),('Blastoise','Rain Dance',42),('Ivysaur','Tackle',1),('Ivysaur','Growl',4),('Venasaur','Tackle',1),('Venasaur','Growl',4),('Charmeleon','Ember',1),('Charmeleon','Growl',1),('Charmeleon','Metal Claw',13),('Charizard','Ember',1),('Charizard','Growl',1),('Charizard','Metal Claw',1),('Butterfree','Stun Spore',14),('Butterfree','Whirlwind',23),('Butterfree','Psybeam',34);
/*!40000 ALTER TABLE `learns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `Name` varchar(45) NOT NULL,
  `Region` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES ('Pallet Town','Kanto'),('Route 2','Kanto'),('Route 3','Kanto'),('Route 4','Kanto'),('Pewter City','Kanto'),('Viridian Forest','Kanto');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moves`
--

DROP TABLE IF EXISTS `moves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `moves` (
  `Name` varchar(45) NOT NULL,
  `Category` varchar(45) NOT NULL,
  `Type` varchar(45) NOT NULL,
  `Power` varchar(45) NOT NULL,
  `Accuracy` varchar(45) NOT NULL,
  `PP` int NOT NULL,
  `Priority` int DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moves`
--

LOCK TABLES `moves` WRITE;
/*!40000 ALTER TABLE `moves` DISABLE KEYS */;
INSERT INTO `moves` VALUES ('Absorb','Special','Grass','20','100',25,NULL),('Acid','Special','Poison','40','100',30,NULL),('Acid Armor','Status','Poison','','',20,NULL),('Aeroblast','Special','Flying','100','95',5,NULL),('Agility','Status','Psychic','','',30,NULL),('Amnesia','Status','Psychic','','',20,NULL),('Attract','Status','Normal','','100',15,NULL),('Aurora Beam','Special','Ice','65','100',20,NULL),('Barrage','Physical','Normal','15','85',20,NULL),('Barrier','Status','Psychic','','',20,NULL),('Baton Pass','Status','Normal','','',40,NULL),('Belly Drum','Status','Normal','','',10,NULL),('Bide','Physical','Normal','','',10,NULL),('Bind','Physical','Normal','15','85',20,NULL),('Bite','Physical','Dark','60','100',25,NULL),('Blizzard','Special','Ice','110','70',5,NULL),('Body Slam','Physical','Normal','85','100',15,NULL),('Bone Club','Physical','Ground','65','85',20,NULL),('Bone Rush','Physical','Ground','25','90',10,NULL),('Bonemerang','Physical','Ground','50','90',10,NULL),('Bubble','Special','Water','40','100',30,NULL),('Bubble Beam','Special','Water','65','100',20,NULL),('Charm','Status','Fairy','','100',20,NULL),('Clamp','Physical','Water','35','85',15,NULL),('Comet Punch','Physical','Normal','18','85',15,NULL),('Confuse Ray','Status','Ghost','','100',10,NULL),('Confusion','Special','Psychic','50','100',25,NULL),('Constrict','Physical','Normal','10','100',35,NULL),('Conversion','Status','Normal','','',30,NULL),('Conversion 2','Status','Normal','','',30,NULL),('Cotton Spore','Status','Grass','','100',40,NULL),('Counter','Physical','Fighting','','100',20,NULL),('Crabhammer','Physical','Water','100','90',10,NULL),('Curse','Status','Ghost','','',10,NULL),('Cut','Physical','Normal','50','95',30,NULL),('Defense Curl','Status','Normal','','',40,NULL),('Destiny Bond','Status','Ghost','','',5,NULL),('Detect','Status','Fighting','','',5,NULL),('Dig','Physical','Ground','80','100',10,NULL),('Disable','Status','Normal','','100',20,NULL),('Dizzy Punch','Physical','Normal','70','100',10,NULL),('Double Kick','Physical','Fighting','30','100',30,NULL),('Double Slap','Physical','Normal','15','85',10,NULL),('Double Team','Status','Normal','','',15,NULL),('Double-Edge','Physical','Normal','120','100',15,NULL),('Dragon Breath','Special','Dragon','60','100',20,NULL),('Dragon Rage','Special','Dragon','','100',10,NULL),('Dream Eater','Special','Psychic','100','100',15,NULL),('Drill Peck','Physical','Flying','80','100',20,NULL),('Dynamic Punch','Physical','Fighting','100','50',5,NULL),('Earthquake','Physical','Ground','100','100',10,NULL),('Egg Bomb','Physical','Normal','100','75',10,NULL),('Ember','Special','Fire','40','100',25,NULL),('Encore','Status','Normal','','100',5,NULL),('Endure','Status','Normal','','',10,NULL),('Explosion','Physical','Normal','250','100',5,NULL),('False Swipe','Physical','Normal','40','100',40,NULL),('Feint Attack','Physical','Dark','60','',20,NULL),('Fire Blast','Special','Fire','110','85',5,NULL),('Fire Punch','Physical','Fire','75','100',15,NULL),('Fire Spin','Special','Fire','35','85',15,NULL),('Fissure','Physical','Ground','','30',5,NULL),('Flail','Physical','Normal','','100',15,NULL),('Flame Wheel','Physical','Fire','60','100',25,NULL),('Flamethrower','Special','Fire','90','100',15,NULL),('Flash','Status','Normal','','100',20,NULL),('Fly','Physical','Flying','90','95',15,NULL),('Focus Energy','Status','Normal','','',30,NULL),('Foresight','Status','Normal','','',40,NULL),('Frustration','Physical','Normal','','100',20,NULL),('Fury Attack','Physical','Normal','15','85',20,NULL),('Fury Cutter','Physical','Bug','40','95',20,NULL),('Fury Swipes','Physical','Normal','18','80',15,NULL),('Giga Drain','Special','Grass','75','100',10,NULL),('Glare','Status','Normal','','100',30,NULL),('Growl','Status','Normal','','100',40,NULL),('Growth','Status','Normal','','',20,NULL),('Guillotine','Physical','Normal','','30',5,NULL),('Gust','Special','Flying','40','100',35,NULL),('Harden','Status','Normal','','',30,NULL),('Haze','Status','Ice','','',30,NULL),('Headbutt','Physical','Normal','70','100',15,NULL),('Heal Bell','Status','Normal','','',5,NULL),('High Jump Kick','Physical','Fighting','130','90',10,NULL),('Horn Attack','Physical','Normal','65','100',25,NULL),('Horn Drill','Physical','Normal','','30',5,NULL),('Hydro Pump','Special','Water','110','80',5,NULL),('Hyper Beam','Special','Normal','150','90',5,NULL),('Hyper Fang','Physical','Normal','80','90',15,NULL),('Hypnosis','Status','Psychic','','60',20,NULL),('Ice Beam','Special','Ice','90','100',10,NULL),('Ice Punch','Physical','Ice','75','100',15,NULL),('Icy Wind','Special','Ice','55','95',15,NULL),('Iron Tail','Physical','Steel','100','75',15,NULL),('Jump Kick','Physical','Fighting','100','95',10,NULL),('Karate Chop','Physical','Fighting','50','100',25,NULL),('Kinesis','Status','Psychic','','80',15,NULL),('Leech Life','Physical','Bug','80','100',10,NULL),('Leech Seed','Status','Grass','','90',10,NULL),('Leer','Status','Normal','','100',30,NULL),('Lick','Physical','Ghost','30','100',30,NULL),('Light Screen','Status','Psychic','','',30,NULL),('Lock-On','Status','Normal','','',5,NULL),('Lovely Kiss','Status','Normal','','75',10,NULL),('Low Kick','Physical','Fighting','','100',20,NULL),('Mach Punch','Physical','Fighting','40','100',30,NULL),('Magnitude','Physical','Ground','','100',30,NULL),('Mean Look','Status','Normal','','',5,NULL),('Meditate','Status','Psychic','','',40,NULL),('Mega Drain','Special','Grass','40','100',15,NULL),('Mega Kick','Physical','Normal','120','75',5,NULL),('Mega Punch','Physical','Normal','80','85',20,NULL),('Megahorn','Physical','Bug','120','85',10,NULL),('Metal Claw','Physical','Steel','50','95',35,NULL),('Metronome','Status','Normal','','',10,NULL),('Milk Drink','Status','Normal','','',10,NULL),('Mimic','Status','Normal','','',10,NULL),('Mind Reader','Status','Normal','','',5,NULL),('Minimize','Status','Normal','','',10,NULL),('Mirror Move','Status','Flying','','',20,NULL),('Mist','Status','Ice','','',30,NULL),('Morning Sun','Status','Normal','','',5,NULL),('Mud-Slap','Special','Ground','20','100',10,NULL),('Night Shade','Special','Ghost','','100',15,NULL),('Nightmare','Status','Ghost','','100',15,NULL),('Octazooka','Special','Water','65','85',10,NULL),('Outrage','Physical','Dragon','120','100',10,NULL),('Pain Split','Status','Normal','','',20,NULL),('Pay Day','Physical','Normal','40','100',20,NULL),('Peck','Physical','Flying','35','100',35,NULL),('Perish Song','Status','Normal','','',5,NULL),('Petal Dance','Special','Grass','120','100',10,NULL),('Pin Missile','Physical','Bug','25','95',20,NULL),('Poison Gas','Status','Poison','','90',40,NULL),('Poison Powder','Status','Poison','','75',35,NULL),('Poison Sting','Physical','Poison','15','100',35,NULL),('Pound','Physical','Normal','40','100',35,NULL),('Powder Snow','Special','Ice','40','100',25,NULL),('Present','Physical','Normal','','90',15,NULL),('Protect','Status','Normal','','',10,NULL),('Psybeam','Special','Psychic','65','100',20,NULL),('Psychic','Special','Psychic','90','100',10,NULL),('Psywave','Special','Psychic','','100',15,NULL),('Pursuit','Physical','Dark','40','100',20,NULL),('Quick Attack','Physical','Normal','40','100',30,NULL),('Rage','Physical','Normal','20','100',20,NULL),('Rapid Spin','Physical','Normal','50','100',40,NULL),('Razor Leaf','Physical','Grass','55','95',25,NULL),('Razor Wind','Special','Normal','80','100',10,NULL),('Recover','Status','Normal','','',10,NULL),('Reflect','Status','Psychic','','',20,NULL),('Rest','Status','Psychic','','',10,NULL),('Return','Physical','Normal','','100',20,NULL),('Reversal','Physical','Fighting','','100',15,NULL),('Roar','Status','Normal','','',20,NULL),('Rock Slide','Physical','Rock','75','90',10,NULL),('Rock Throw','Physical','Rock','50','90',15,NULL),('Rolling Kick','Physical','Fighting','60','85',15,NULL),('Rollout','Physical','Rock','30','90',20,NULL),('Sacred Fire','Physical','Fire','100','95',5,NULL),('Safeguard','Status','Normal','','',25,NULL),('Sand Attack','Status','Ground','','100',15,NULL),('Sandstorm','Status','Rock','','',10,NULL),('Scary Face','Status','Normal','','100',10,NULL),('Scratch','Physical','Normal','40','100',35,NULL),('Screech','Status','Normal','','85',40,NULL),('Seismic Toss','Physical','Fighting','','100',20,NULL),('Self-Destruct','Physical','Normal','200','100',5,NULL),('Sharpen','Status','Normal','','',30,NULL),('Sing','Status','Normal','','55',15,NULL),('Sketch','Status','Normal','','',1,NULL),('Skull Bash','Physical','Normal','130','100',10,NULL),('Sky Attack','Physical','Flying','140','90',5,NULL),('Slam','Physical','Normal','80','75',20,NULL),('Slash','Physical','Normal','70','100',20,NULL),('Sleep Powder','Status','Grass','','75',15,NULL),('Sleep Talk','Status','Normal','','',10,NULL),('Sludge','Special','Poison','65','100',20,NULL),('Sludge Bomb','Special','Poison','90','100',10,NULL),('Smog','Special','Poison','30','70',20,NULL),('Smokescreen','Status','Normal','','100',20,NULL),('Snore','Special','Normal','50','100',15,NULL),('Soft-Boiled','Status','Normal','','',10,NULL),('Solar Beam','Special','Grass','120','100',10,NULL),('Sonic Boom','Special','Normal','','90',20,NULL),('Spark','Physical','Electric','65','100',20,NULL),('Spider Web','Status','Bug','','',10,NULL),('Spike Cannon','Physical','Normal','20','100',15,NULL),('Spikes','Status','Ground','','',20,NULL),('Spite','Status','Ghost','','100',10,NULL),('Splash','Status','Normal','','',40,NULL),('Spore','Status','Grass','','100',15,NULL),('Steel Wing','Physical','Steel','70','90',25,NULL),('Stomp','Physical','Normal','65','100',20,NULL),('Strength','Physical','Normal','80','100',15,NULL),('String Shot','Status','Bug','','95',40,NULL),('Struggle','Physical','Normal','50','',1,NULL),('Stun Spore','Status','Grass','','75',30,NULL),('Submission','Physical','Fighting','80','80',20,NULL),('Substitute','Status','Normal','','',10,NULL),('Super Fang','Physical','Normal','','90',10,NULL),('Supersonic','Status','Normal','','55',20,NULL),('Surf','Special','Water','90','100',15,NULL),('Swagger','Status','Normal','','85',15,NULL),('Sweet Kiss','Status','Fairy','','75',10,NULL),('Sweet Scent','Status','Normal','','100',20,NULL),('Swift','Special','Normal','60','',20,NULL),('Swords Dance','Status','Normal','','',20,NULL),('Synthesis','Status','Grass','','',5,NULL),('Tackle','Physical','Normal','40','100',35,NULL),('Tail Whip','Status','Normal','','100',30,NULL),('Take Down','Physical','Normal','90','85',20,NULL),('Teleport','Status','Psychic','','',20,NULL),('Thief','Physical','Dark','60','100',25,NULL),('Thrash','Physical','Normal','120','100',10,NULL),('Thunder','Special','Electric','110','70',10,NULL),('Thunder Punch','Physical','Electric','75','100',15,NULL),('Thunder Shock','Special','Electric','40','100',30,NULL),('Thunder Wave','Status','Electric','','90',20,NULL),('Thunderbolt','Special','Electric','90','100',15,NULL),('Toxic','Status','Poison','','90',10,NULL),('Transform','Status','Normal','','',10,NULL),('Tri Attack','Special','Normal','80','100',10,NULL),('Triple Kick','Physical','Fighting','10','90',10,NULL),('Twineedle','Physical','Bug','25','100',20,NULL),('Vine Whip','Physical','Grass','45','100',25,NULL),('Vise Grip','Physical','Normal','55','100',30,NULL),('Vital Throw','Physical','Fighting','70','',10,NULL),('Water Gun','Special','Water','40','100',25,NULL),('Waterfall','Physical','Water','80','100',15,NULL),('Whirlwind','Status','Normal','','',20,NULL),('Wing Attack','Physical','Flying','60','100',35,NULL),('Withdraw','Status','Water','','',40,NULL),('Wrap','Physical','Normal','15','90',20,NULL),('Zap Cannon','Special','Electric','120','50',5,NULL);
/*!40000 ALTER TABLE `moves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokemon`
--

DROP TABLE IF EXISTS `pokemon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pokemon` (
  `DexNum` int NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Category` varchar(45) NOT NULL,
  `Stage` varchar(45) NOT NULL,
  `Height` double NOT NULL,
  `Weight` double NOT NULL,
  `Ability` varchar(45) NOT NULL,
  `Type1` varchar(45) NOT NULL,
  `Type2` varchar(45) DEFAULT NULL,
  `Evolution` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemon`
--

LOCK TABLES `pokemon` WRITE;
/*!40000 ALTER TABLE `pokemon` DISABLE KEYS */;
INSERT INTO `pokemon` VALUES (9,'Blastoise','Shellfish Pokemon','Third',1.6,85.5,'Torrent','Water','',''),(1,'Bulbasaur','Seed Pokemon','First',0.7,6.9,'Overgrow','Grass','Poison','Ivysaur'),(12,'Butterfree','Butterfly Pokemon','Third',1.1,32,'Compound Eyes','Bug','Flying',''),(10,'Caterpie','Worm Pokemon','First',0.3,2.9,'Shield Dust','Bug','','Metapod'),(6,'Charizard','Flame Pokemon','Third',1.7,90.5,'Blaze','Fire','Flying',''),(4,'Charmander','Lizard Pokemon','First',0.6,8.5,'Blaze','Fire','','Charmeleon'),(5,'Charmeleon','Flame Pokemon','Second',1.1,19,'Blaze','Fire','','Charizard'),(2,'Ivysaur','Seed Pokemon','Second',1,13,'Overgrow','Grass','Poison','Venasaur'),(11,'Metapod','Cocoon Pokemon','Second',0.7,9.9,'Shed Skin','Bug','','Butterfree'),(7,'Squirtle','Tiny Turtle Pokemon','First',0.5,9,'Torrent','Water','','Wartortle'),(3,'Venasaur','Seed Pokemon','Third',2,100,'Overgrow','Grass','Poison',''),(8,'Wartortle','Turtle Pokemon','Second',1,22.5,'Torrent','Water','','Blastoise');
/*!40000 ALTER TABLE `pokemon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regions`
--

DROP TABLE IF EXISTS `regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `regions` (
  `Name` text NOT NULL,
  `Climate` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regions`
--

LOCK TABLES `regions` WRITE;
/*!40000 ALTER TABLE `regions` DISABLE KEYS */;
INSERT INTO `regions` VALUES ('Kanto','Temperate');
/*!40000 ALTER TABLE `regions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resists`
--

DROP TABLE IF EXISTS `resists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resists` (
  `Type` varchar(45) NOT NULL,
  `Resistance` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resists`
--

LOCK TABLES `resists` WRITE;
/*!40000 ALTER TABLE `resists` DISABLE KEYS */;
INSERT INTO `resists` VALUES ('Grass','Water'),('Grass','Grass'),('Grass','Electric'),('Grass','Ground'),('Fire','Fire'),('Fire','Grass'),('Fire','Bug'),('Fire','Ice'),('Fire','Steel'),('Fire','Fairy'),('Water','Fire'),('Water','Water'),('Water','Ice'),('Water','Steel'),('Ghost','Poison'),('Ghost','Bug');
/*!40000 ALTER TABLE `resists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weakness`
--

DROP TABLE IF EXISTS `weakness`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weakness` (
  `Type` varchar(45) NOT NULL,
  `Weakness` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weakness`
--

LOCK TABLES `weakness` WRITE;
/*!40000 ALTER TABLE `weakness` DISABLE KEYS */;
INSERT INTO `weakness` VALUES ('Grass','Fire'),('Grass','Poison'),('Grass','Bug'),('Grass','Flying'),('Grass','Ice'),('Fire','Water'),('Fire','Rock'),('Fire','Ground'),('Water','Grass'),('Water','Electric'),('Normal','Fighting'),('Ghost','Ghost'),('Ghost','Dark');
/*!40000 ALTER TABLE `weakness` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-06 17:00:11
