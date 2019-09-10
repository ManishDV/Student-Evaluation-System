-- MySQL dump 10.17  Distrib 10.3.15-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: SES
-- ------------------------------------------------------
-- Server version	10.3.15-MariaDB-1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `CTL`
--

DROP TABLE IF EXISTS `CTL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CTL` (
  `sid` int(11) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `abbrevation` varchar(5) DEFAULT NULL,
  `tot_marks` int(11) DEFAULT NULL,
  KEY `sid` (`sid`),
  KEY `name` (`name`),
  KEY `abbrevation` (`abbrevation`),
  CONSTRAINT `CTL_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `subject` (`sid`) ON DELETE CASCADE,
  CONSTRAINT `CTL_ibfk_2` FOREIGN KEY (`name`) REFERENCES `subject` (`name`) ON DELETE CASCADE,
  CONSTRAINT `CTL_ibfk_3` FOREIGN KEY (`abbrevation`) REFERENCES `subject` (`abbrevation`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CTL`
--

LOCK TABLES `CTL` WRITE;
/*!40000 ALTER TABLE `CTL` DISABLE KEYS */;
/*!40000 ALTER TABLE `CTL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LTL`
--

DROP TABLE IF EXISTS `LTL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LTL` (
  `sid` int(11) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `abbrevation` varchar(5) DEFAULT NULL,
  KEY `sid` (`sid`),
  KEY `name` (`name`),
  KEY `abbrevation` (`abbrevation`),
  CONSTRAINT `LTL_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `subject` (`sid`) ON DELETE CASCADE,
  CONSTRAINT `LTL_ibfk_2` FOREIGN KEY (`name`) REFERENCES `subject` (`name`) ON DELETE CASCADE,
  CONSTRAINT `LTL_ibfk_3` FOREIGN KEY (`abbrevation`) REFERENCES `subject` (`abbrevation`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LTL`
--

LOCK TABLES `LTL` WRITE;
/*!40000 ALTER TABLE `LTL` DISABLE KEYS */;
/*!40000 ALTER TABLE `LTL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LTL_has`
--

DROP TABLE IF EXISTS `LTL_has`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LTL_has` (
  `roll_no` int(11) DEFAULT NULL,
  `sid` int(11) DEFAULT NULL,
  `assign_id` int(11) DEFAULT NULL,
  `actual_performance_date` date DEFAULT NULL,
  `actual_submission_date` date DEFAULT NULL,
  `obtained_marks` int(11) DEFAULT NULL,
  KEY `roll_no` (`roll_no`),
  KEY `sid` (`sid`),
  KEY `fk6` (`assign_id`),
  CONSTRAINT `LTL_has_ibfk_1` FOREIGN KEY (`roll_no`) REFERENCES `student` (`roll_no`) ON DELETE CASCADE,
  CONSTRAINT `LTL_has_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `LTL` (`sid`) ON DELETE CASCADE,
  CONSTRAINT `fk6` FOREIGN KEY (`assign_id`) REFERENCES `assignment` (`assign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LTL_has`
--

LOCK TABLES `LTL_has` WRITE;
/*!40000 ALTER TABLE `LTL_has` DISABLE KEYS */;
/*!40000 ALTER TABLE `LTL_has` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignment`
--

DROP TABLE IF EXISTS `assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignment` (
  `assign_id` int(11) NOT NULL,
  `sid` int(11) DEFAULT NULL,
  `scheduled_performance_date` date DEFAULT NULL,
  `scheduled_performace_date` date DEFAULT NULL,
  `tot_marks` int(11) DEFAULT NULL,
  PRIMARY KEY (`assign_id`),
  KEY `fk3` (`sid`),
  CONSTRAINT `fk3` FOREIGN KEY (`sid`) REFERENCES `LTL` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment`
--

LOCK TABLES `assignment` WRITE;
/*!40000 ALTER TABLE `assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendance` (
  `roll_no` int(11) DEFAULT NULL,
  `attendance` smallint(6) DEFAULT NULL,
  KEY `roll_no` (`roll_no`),
  CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`roll_no`) REFERENCES `student` (`roll_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batch`
--

DROP TABLE IF EXISTS `batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batch` (
  `bid` int(11) NOT NULL,
  `strength` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batch`
--

LOCK TABLES `batch` WRITE;
/*!40000 ALTER TABLE `batch` DISABLE KEYS */;
/*!40000 ALTER TABLE `batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class` (
  `cid` int(11) NOT NULL,
  `strength` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `roll_no` int(11) NOT NULL,
  `cid` int(11) DEFAULT NULL,
  `bid` int(11) DEFAULT NULL,
  PRIMARY KEY (`roll_no`),
  KEY `cid` (`cid`),
  KEY `bid` (`bid`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `class` (`cid`) ON DELETE CASCADE,
  CONSTRAINT `student_ibfk_2` FOREIGN KEY (`bid`) REFERENCES `batch` (`bid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_gives_UT`
--

DROP TABLE IF EXISTS `student_gives_UT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_gives_UT` (
  `roll_no` int(11) DEFAULT NULL,
  `sid` int(11) DEFAULT NULL,
  `ut1` int(11) DEFAULT NULL,
  `ut2` int(11) DEFAULT NULL,
  KEY `roll_no` (`roll_no`),
  KEY `sid` (`sid`),
  CONSTRAINT `student_gives_UT_ibfk_1` FOREIGN KEY (`roll_no`) REFERENCES `student` (`roll_no`) ON DELETE CASCADE,
  CONSTRAINT `student_gives_UT_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `CTL` (`sid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_gives_UT`
--

LOCK TABLES `student_gives_UT` WRITE;
/*!40000 ALTER TABLE `student_gives_UT` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_gives_UT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_performs_assignments`
--

DROP TABLE IF EXISTS `student_performs_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_performs_assignments` (
  `assign_id` int(11) DEFAULT NULL,
  `roll_no` int(11) DEFAULT NULL,
  `actual_performance_date` date DEFAULT NULL,
  `actual_submission_date` date DEFAULT NULL,
  KEY `assign_id` (`assign_id`),
  KEY `fk5` (`roll_no`),
  CONSTRAINT `fk5` FOREIGN KEY (`roll_no`) REFERENCES `student` (`roll_no`),
  CONSTRAINT `student_performs_assignments_ibfk_1` FOREIGN KEY (`assign_id`) REFERENCES `assignment` (`assign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_performs_assignments`
--

LOCK TABLES `student_performs_assignments` WRITE;
/*!40000 ALTER TABLE `student_performs_assignments` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_performs_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject` (
  `sid` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `abbrevation` varchar(5) NOT NULL,
  PRIMARY KEY (`sid`),
  UNIQUE KEY `name_2` (`name`),
  UNIQUE KEY `name` (`name`,`abbrevation`),
  UNIQUE KEY `abbrevation` (`abbrevation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher` (
  `tid` int(11) NOT NULL,
  `tname` varchar(30) DEFAULT NULL,
  `abbrevation` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_teaches_batch`
--

DROP TABLE IF EXISTS `teacher_teaches_batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher_teaches_batch` (
  `bid` int(11) DEFAULT NULL,
  `tid` int(11) DEFAULT NULL,
  `sid` int(11) DEFAULT NULL,
  KEY `bid` (`bid`),
  KEY `tid` (`tid`),
  KEY `sid` (`sid`),
  CONSTRAINT `teacher_teaches_batch_ibfk_1` FOREIGN KEY (`bid`) REFERENCES `batch` (`bid`) ON DELETE CASCADE,
  CONSTRAINT `teacher_teaches_batch_ibfk_2` FOREIGN KEY (`tid`) REFERENCES `teacher` (`tid`) ON DELETE CASCADE,
  CONSTRAINT `teacher_teaches_batch_ibfk_3` FOREIGN KEY (`sid`) REFERENCES `subject` (`sid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_teaches_batch`
--

LOCK TABLES `teacher_teaches_batch` WRITE;
/*!40000 ALTER TABLE `teacher_teaches_batch` DISABLE KEYS */;
/*!40000 ALTER TABLE `teacher_teaches_batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_teaches_class`
--

DROP TABLE IF EXISTS `teacher_teaches_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher_teaches_class` (
  `cid` int(11) DEFAULT NULL,
  `tid` int(11) DEFAULT NULL,
  `sid` int(11) DEFAULT NULL,
  KEY `cid` (`cid`),
  KEY `tid` (`tid`),
  KEY `sid` (`sid`),
  CONSTRAINT `teacher_teaches_class_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `class` (`cid`) ON DELETE CASCADE,
  CONSTRAINT `teacher_teaches_class_ibfk_2` FOREIGN KEY (`tid`) REFERENCES `teacher` (`tid`) ON DELETE CASCADE,
  CONSTRAINT `teacher_teaches_class_ibfk_3` FOREIGN KEY (`sid`) REFERENCES `subject` (`sid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_teaches_class`
--

LOCK TABLES `teacher_teaches_class` WRITE;
/*!40000 ALTER TABLE `teacher_teaches_class` DISABLE KEYS */;
/*!40000 ALTER TABLE `teacher_teaches_class` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-10 23:37:00
