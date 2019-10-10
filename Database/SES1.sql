-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: SES
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.18.10.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `assignment`
--

DROP TABLE IF EXISTS `assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignment` (
  `assign_id` int(11) NOT NULL AUTO_INCREMENT,
  `assign_name` varchar(1000) DEFAULT NULL,
  `sid` int(11) NOT NULL,
  `scheduled_performance_date` date DEFAULT NULL,
  `scheduled_submission_date` date DEFAULT NULL,
  PRIMARY KEY (`assign_id`),
  KEY `fk3` (`sid`),
  CONSTRAINT `fk3` FOREIGN KEY (`sid`) REFERENCES `subject` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment`
--

LOCK TABLES `assignment` WRITE;
/*!40000 ALTER TABLE `assignment` DISABLE KEYS */;
INSERT INTO `assignment` VALUES (1,'Study and design a database with suitable example using followingdatabase systems:? Relational: SQL / PostgreSQL / MySQL? Key-value: Riak / Redis? Columnar: Hbase? Document: MongoDB / CouchDB? Graph: Neo4JCompare the different database systems based on p',6,NULL,'2019-06-22'),(2,'Install and configure client and server for MySQL and MongoDB(Show all commands and necessary steps for installation andconfiguration).',6,NULL,'2019-06-29'),(3,'Study the SQLite database and its uses. Also elaborate on buildingand installing of SQLite.',6,NULL,'2019-06-29'),(4,'Using HTML5 layout tags develop informative page with sections which include various images, links to other pages for navigation, make use of all possible formatting (for example font, color etc.).',8,NULL,'2019-09-11'),(5,'Apply CSS properties Border, margins, Padding, Navigation,dropdown list to page created in first assignment.',8,NULL,'2019-10-02'),(6,'Create form in HTML with all form elements apply form validations  (e.g. Email, mobile, Pin code, Password).',8,NULL,'2019-10-30'),(7,'Create JS',8,NULL,'2019-10-10');
/*!40000 ALTER TABLE `assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendance` (
  `roll_no` int(11) NOT NULL,
  `attendance` smallint(6) NOT NULL DEFAULT '0',
  KEY `roll_no` (`roll_no`),
  CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`roll_no`) REFERENCES `student` (`roll_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES (33308,88),(33319,88),(33336,88),(33364,88),(33367,88),(33370,88);
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authenticate`
--

DROP TABLE IF EXISTS `authenticate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authenticate` (
  `tid` varchar(20) NOT NULL,
  `uname` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  KEY `authenticate_fk` (`tid`),
  CONSTRAINT `authenticate_fk` FOREIGN KEY (`tid`) REFERENCES `teacher` (`tid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authenticate`
--

LOCK TABLES `authenticate` WRITE;
/*!40000 ALTER TABLE `authenticate` DISABLE KEYS */;
INSERT INTO `authenticate` VALUES ('emp01','Manish','Manny@123');
/*!40000 ALTER TABLE `authenticate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batch`
--

DROP TABLE IF EXISTS `batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batch` (
  `bid` varchar(20) NOT NULL,
  `strength` smallint(6) NOT NULL,
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batch`
--

LOCK TABLES `batch` WRITE;
/*!40000 ALTER TABLE `batch` DISABLE KEYS */;
INSERT INTO `batch` VALUES ('K-09',19),('K-10',19),('K-11',19),('L-09',19),('L-10',19),('L-11',19),('M-11',19),('N-11',19);
/*!40000 ALTER TABLE `batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batch_has_students`
--

DROP TABLE IF EXISTS `batch_has_students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batch_has_students` (
  `roll_no` int(11) NOT NULL,
  `bid` varchar(20) NOT NULL,
  KEY `roll_no` (`roll_no`),
  KEY `bid` (`bid`),
  CONSTRAINT `batch_has_students_ibfk_1` FOREIGN KEY (`roll_no`) REFERENCES `student` (`roll_no`) ON DELETE CASCADE,
  CONSTRAINT `batch_has_students_ibfk_2` FOREIGN KEY (`bid`) REFERENCES `batch` (`bid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batch_has_students`
--

LOCK TABLES `batch_has_students` WRITE;
/*!40000 ALTER TABLE `batch_has_students` DISABLE KEYS */;
INSERT INTO `batch_has_students` VALUES (33101,'K-09'),(33102,'K-09'),(33103,'L-09'),(33104,'L-09'),(33201,'K-10'),(33202,'K-10'),(33203,'L-10'),(33301,'K-11'),(33202,'K-11'),(33303,'L-11'),(33301,'K-11'),(33202,'K-11'),(33303,'L-11');
/*!40000 ALTER TABLE `batch_has_students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class` (
  `cid` varchar(20) NOT NULL,
  `strength` smallint(6) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES ('BE-10',77),('BE-11',68),('TE-09',74),('TE-10',74),('TE-11',74);
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_coordinator`
--

DROP TABLE IF EXISTS `class_coordinator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_coordinator` (
  `tid` varchar(20) NOT NULL,
  `cid` varchar(20) NOT NULL,
  KEY `cc_teacher` (`tid`),
  KEY `cc_class` (`cid`),
  CONSTRAINT `cc_class` FOREIGN KEY (`cid`) REFERENCES `class` (`cid`),
  CONSTRAINT `cc_teacher` FOREIGN KEY (`tid`) REFERENCES `teacher` (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_coordinator`
--

LOCK TABLES `class_coordinator` WRITE;
/*!40000 ALTER TABLE `class_coordinator` DISABLE KEYS */;
/*!40000 ALTER TABLE `class_coordinator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_has_batch`
--

DROP TABLE IF EXISTS `class_has_batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_has_batch` (
  `cid` varchar(20) DEFAULT NULL,
  `bid` varchar(20) DEFAULT NULL,
  KEY `fk_cb` (`cid`),
  KEY `fk_cbb` (`bid`),
  CONSTRAINT `fk_cb` FOREIGN KEY (`cid`) REFERENCES `class` (`cid`),
  CONSTRAINT `fk_cbb` FOREIGN KEY (`bid`) REFERENCES `batch` (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_has_batch`
--

LOCK TABLES `class_has_batch` WRITE;
/*!40000 ALTER TABLE `class_has_batch` DISABLE KEYS */;
INSERT INTO `class_has_batch` VALUES ('TE-11','K-11'),('TE-11','L-11'),('TE-11','M-11'),('TE-11','N-11'),('TE-09','K-09'),('TE-09','L-09'),('TE-10','K-10'),('TE-10','L-10');
/*!40000 ALTER TABLE `class_has_batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_has_students`
--

DROP TABLE IF EXISTS `class_has_students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_has_students` (
  `roll_no` int(11) NOT NULL,
  `cid` varchar(20) NOT NULL,
  KEY `roll_no` (`roll_no`),
  KEY `cid` (`cid`),
  CONSTRAINT `class_has_students_ibfk_1` FOREIGN KEY (`roll_no`) REFERENCES `student` (`roll_no`) ON DELETE CASCADE,
  CONSTRAINT `class_has_students_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `class` (`cid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_has_students`
--

LOCK TABLES `class_has_students` WRITE;
/*!40000 ALTER TABLE `class_has_students` DISABLE KEYS */;
INSERT INTO `class_has_students` VALUES (33308,'TE-11'),(33319,'TE-11'),(33336,'TE-11'),(33364,'TE-11'),(33367,'TE-11'),(33370,'TE-11');
/*!40000 ALTER TABLE `class_has_students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `roll_no` int(11) NOT NULL,
  `student_name` varchar(50) NOT NULL,
  PRIMARY KEY (`roll_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (33101,'Tanvi'),(33102,'Sahil'),(33103,'Manish'),(33104,'Sagrika'),(33201,'Deva'),(33202,'Kshitij'),(33203,'Ayan'),(33301,'soham'),(33302,'Sameer'),(33303,'Pooja'),(33304,'Shraddha');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_gives_UT`
--

DROP TABLE IF EXISTS `student_gives_UT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_gives_UT` (
  `roll_no` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `ut1` int(11) NOT NULL DEFAULT '0',
  `ut2` int(11) DEFAULT '0',
  KEY `roll_no` (`roll_no`),
  KEY `sid` (`sid`),
  CONSTRAINT `student_gives_UT_ibfk_1` FOREIGN KEY (`roll_no`) REFERENCES `student` (`roll_no`) ON DELETE CASCADE,
  CONSTRAINT `student_gives_UT_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `subject` (`sid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_gives_UT`
--

LOCK TABLES `student_gives_UT` WRITE;
/*!40000 ALTER TABLE `student_gives_UT` DISABLE KEYS */;
INSERT INTO `student_gives_UT` VALUES (33308,1,21,22),(33319,1,21,22),(33336,1,21,22),(33364,1,2,22),(33367,1,1,22),(33370,1,1,22);
/*!40000 ALTER TABLE `student_gives_UT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_performs_assignment`
--

DROP TABLE IF EXISTS `student_performs_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_performs_assignment` (
  `roll_no` int(11) NOT NULL,
  `assign_id` int(11) NOT NULL,
  `actual_performance_date` date NOT NULL,
  `actual_submission_date` date NOT NULL,
  `rpp` int(11) NOT NULL DEFAULT '0',
  `spo` int(11) NOT NULL DEFAULT '0',
  `total` int(11) NOT NULL DEFAULT '0',
  KEY `roll_no` (`roll_no`),
  KEY `fk6` (`assign_id`),
  CONSTRAINT `fk6` FOREIGN KEY (`assign_id`) REFERENCES `assignment` (`assign_id`),
  CONSTRAINT `student_performs_assignment_ibfk_1` FOREIGN KEY (`roll_no`) REFERENCES `student` (`roll_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_performs_assignment`
--

LOCK TABLES `student_performs_assignment` WRITE;
/*!40000 ALTER TABLE `student_performs_assignment` DISABLE KEYS */;
INSERT INTO `student_performs_assignment` VALUES (33101,1,'2019-10-02','2019-10-03',4,3,7),(33101,2,'2019-10-08','2019-10-08',0,0,0),(33101,3,'2019-10-08','2019-10-08',0,0,0),(33102,1,'2019-10-08','2019-10-08',0,0,0),(33102,2,'2019-10-08','2019-10-08',0,0,0),(33102,3,'2019-10-08','2019-10-08',0,0,0),(33103,1,'2019-10-08','2019-10-08',0,0,0),(33103,2,'2019-10-08','2019-10-08',0,0,0),(33103,3,'2019-10-08','2019-10-08',0,0,0),(33104,1,'2019-10-08','2019-10-08',0,0,0),(33104,2,'2019-10-08','2019-10-08',0,0,0),(33104,3,'2019-10-08','2019-10-08',0,0,0),(33201,1,'2019-10-08','2019-10-08',0,0,0),(33201,2,'2019-10-08','2019-10-08',0,0,0),(33201,3,'2019-10-08','2019-10-08',0,0,0),(33202,1,'2019-10-08','2019-10-08',0,0,0),(33202,2,'2019-10-08','2019-10-08',0,0,0),(33202,3,'2019-10-08','2019-10-08',0,0,0),(33203,1,'2019-10-08','2019-10-08',0,0,0),(33203,2,'2019-10-08','2019-10-08',0,0,0),(33203,3,'2019-10-08','2019-10-08',0,0,0),(33301,1,'2019-10-08','2019-10-08',0,0,0),(33301,2,'2019-10-08','2019-10-08',0,0,0),(33301,3,'2019-10-08','2019-10-08',0,0,0),(33302,1,'2019-10-08','2019-10-08',0,0,0),(33302,2,'2019-10-08','2019-10-08',0,0,0),(33302,3,'2019-10-08','2019-10-08',0,0,0),(33303,1,'2019-10-08','2019-10-08',0,0,0),(33303,2,'2019-10-08','2019-10-08',0,0,0),(33303,3,'2019-10-08','2019-10-08',0,0,0),(33304,1,'2019-10-08','2019-10-08',0,0,0),(33304,2,'2019-10-08','2019-10-08',0,0,0),(33304,3,'2019-10-08','2019-10-08',0,0,0),(33101,4,'2019-10-08','2019-10-08',0,0,0),(33101,5,'2019-10-08','2019-10-08',0,0,0),(33101,6,'2019-10-08','2019-10-08',0,0,0),(33101,7,'2019-10-08','2019-10-08',0,0,0),(33102,4,'2019-10-08','2019-10-08',0,0,0),(33102,5,'2019-10-08','2019-10-08',0,0,0),(33102,6,'2019-10-08','2019-10-08',0,0,0),(33102,7,'2019-10-08','2019-10-08',0,0,0),(33103,4,'2019-10-08','2019-10-08',0,0,0),(33103,5,'2019-10-08','2019-10-08',0,0,0),(33103,6,'2019-10-08','2019-10-08',0,0,0),(33103,7,'2019-10-08','2019-10-08',0,0,0),(33104,4,'2019-10-08','2019-10-08',0,0,0),(33104,5,'2019-10-08','2019-10-08',0,0,0),(33104,6,'2019-10-08','2019-10-08',0,0,0),(33104,7,'2019-10-08','2019-10-08',0,0,0),(33201,4,'2019-10-08','2019-10-08',0,0,0),(33201,5,'2019-10-08','2019-10-08',0,0,0),(33201,6,'2019-10-08','2019-10-08',0,0,0),(33201,7,'2019-10-08','2019-10-08',0,0,0),(33202,4,'2019-10-08','2019-10-08',0,0,0),(33202,5,'2019-10-08','2019-10-08',0,0,0),(33202,6,'2019-10-08','2019-10-08',0,0,0),(33202,7,'2019-10-08','2019-10-08',0,0,0),(33203,4,'2019-10-08','2019-10-08',0,0,0),(33203,5,'2019-10-08','2019-10-08',0,0,0),(33203,6,'2019-10-08','2019-10-08',0,0,0),(33203,7,'2019-10-08','2019-10-08',0,0,0),(33301,4,'2019-10-08','2019-10-08',0,0,0),(33301,5,'2019-10-08','2019-10-08',0,0,0),(33301,6,'2019-10-08','2019-10-08',0,0,0),(33301,7,'2019-10-08','2019-10-08',0,0,0),(33302,4,'2019-10-08','2019-10-08',0,0,0),(33302,5,'2019-10-08','2019-10-08',0,0,0),(33302,6,'2019-10-08','2019-10-08',0,0,0),(33302,7,'2019-10-08','2019-10-08',0,0,0),(33303,4,'2019-10-08','2019-10-08',0,0,0),(33303,5,'2019-10-08','2019-10-08',0,0,0),(33303,6,'2019-10-08','2019-10-08',0,0,0),(33303,7,'2019-10-08','2019-10-08',0,0,0),(33304,4,'2019-10-08','2019-10-08',0,0,0),(33304,5,'2019-10-08','2019-10-08',0,0,0),(33304,6,'2019-10-08','2019-10-08',0,0,0),(33304,7,'2019-10-08','2019-10-08',0,0,0);
/*!40000 ALTER TABLE `student_performs_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject` (
  `sid` int(11) NOT NULL,
  `year` varchar(10) NOT NULL,
  `semester` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `abbrevation` varchar(10) NOT NULL,
  `theory` tinyint(1) NOT NULL,
  PRIMARY KEY (`sid`),
  UNIQUE KEY `name_2` (`name`),
  UNIQUE KEY `name` (`name`,`abbrevation`),
  UNIQUE KEY `abbrevation` (`abbrevation`),
  UNIQUE KEY `name_3` (`name`),
  UNIQUE KEY `abbrevation_2` (`abbrevation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (1,'TE',1,'Theory of Computation','TOC',1),(2,'TE',1,'Human Computer Interaction','HCI',1),(3,'TE',1,'Operating System','OS',1),(4,'TE',1,'Database Management System','DBMS',1),(5,'TE',1,'Software Engineering And Project Management','SEPM',1),(6,'TE',1,'Software Lab - I','SL-I',0),(7,'TE',1,'Software Lab - II','SL-II',0),(8,'TE',1,'Software Lab - III','SL-III',0),(546,'BE',1,'Mock_Subject','Mock_abb',1);
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher` (
  `tid` varchar(20) NOT NULL,
  `tname` varchar(30) NOT NULL,
  `abbrevation` varchar(5) DEFAULT 'emp',
  `email` varchar(50) DEFAULT 'gmail',
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES ('1','Dr. Anant Bagade','emp','gmail'),('10','Mr. Vishal Jaiswal','emp','gmail'),('11','Mrs. Seema Chandak ','emp','gmail'),('12','Mrs. Sumitra Jakhete','emp','gmail'),('13','Mrs. Nisha Sodha','emp','gmail'),('14','Mr. Abhinay Dhamankar','emp','gmail'),('15','Mr. Jagdish Kamble','emp','gmail'),('16','Mr. Hrushhikesh Joshi','emp','gmail'),('17','Mrs. U. Jogalekar','emp','gmail'),('18','Ms. Priyanka Makkar','emp','gmail'),('2','Dr. Emmanuel M.','emp','gmail'),('3','Dr. Shweta Dharmadhikari','emp','gmail'),('4','Mr. Shyam Deshmukh','emp','gmail'),('5','Mr. Sachin Pande','emp','gmail'),('6','Mr. Tushar Rane','emp','gmail'),('7','Ms. Deepali Londhe','emp','gmail'),('8','Mr. Manish Khodaskar','emp','gmail'),('9','Mrs. Kirti Digholkar','emp','gmail');
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_teaches_batch`
--

DROP TABLE IF EXISTS `teacher_teaches_batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher_teaches_batch` (
  `bid` varchar(20) NOT NULL,
  `tid` varchar(20) NOT NULL,
  `sid` int(11) NOT NULL,
  KEY `bid` (`bid`),
  KEY `tid` (`tid`),
  KEY `sid` (`sid`),
  CONSTRAINT `teacher_teaches_batch_ibfk_1` FOREIGN KEY (`bid`) REFERENCES `batch` (`bid`),
  CONSTRAINT `teacher_teaches_batch_ibfk_2` FOREIGN KEY (`tid`) REFERENCES `teacher` (`tid`) ON DELETE CASCADE,
  CONSTRAINT `teacher_teaches_batch_ibfk_3` FOREIGN KEY (`sid`) REFERENCES `subject` (`sid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_teaches_batch`
--

LOCK TABLES `teacher_teaches_batch` WRITE;
/*!40000 ALTER TABLE `teacher_teaches_batch` DISABLE KEYS */;
INSERT INTO `teacher_teaches_batch` VALUES ('N-11','emp01',7),('K-11','12',8);
/*!40000 ALTER TABLE `teacher_teaches_batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_teaches_class`
--

DROP TABLE IF EXISTS `teacher_teaches_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher_teaches_class` (
  `cid` varchar(20) NOT NULL,
  `tid` varchar(20) NOT NULL,
  `sid` int(11) NOT NULL,
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
INSERT INTO `teacher_teaches_class` VALUES ('TE-10','11',4),('TE-11','15',1);
/*!40000 ALTER TABLE `teacher_teaches_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `termwork`
--

DROP TABLE IF EXISTS `termwork`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `termwork` (
  `roll_no` int(11) DEFAULT NULL,
  `sid` int(11) DEFAULT NULL,
  `out_of_25` int(11) NOT NULL DEFAULT '0',
  `out_of_50` int(11) NOT NULL DEFAULT '0',
  KEY `roll_no` (`roll_no`),
  KEY `sid_fk` (`sid`),
  CONSTRAINT `sid_fk` FOREIGN KEY (`sid`) REFERENCES `subject` (`sid`),
  CONSTRAINT `termwork_ibfk_1` FOREIGN KEY (`roll_no`) REFERENCES `student` (`roll_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `termwork`
--

LOCK TABLES `termwork` WRITE;
/*!40000 ALTER TABLE `termwork` DISABLE KEYS */;
/*!40000 ALTER TABLE `termwork` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-08 15:27:35
