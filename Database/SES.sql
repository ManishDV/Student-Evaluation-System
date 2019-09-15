-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 13, 2019 at 07:47 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `SES`
--

-- --------------------------------------------------------

--
-- Table structure for table `assignment`
--

CREATE TABLE `assignment` (
  `assign_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `scheduled_performance_date` date NOT NULL,
  `scheduled_submission_date` date NOT NULL,
  `tot_marks` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `roll_no` int(11) NOT NULL,
  `attendance` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `batch`
--

CREATE TABLE `batch` (
  `bid` varchar(20) NOT NULL,
  `strength` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `batch_has_students`
--

CREATE TABLE `batch_has_students` (
  `roll_no` int(11) NOT NULL,
  `bid` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `cid` varchar(20) NOT NULL,
  `strength` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `class_has_students`
--

CREATE TABLE `class_has_students` (
  `roll_no` int(11) NOT NULL,
  `cid` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `CTL`
--

CREATE TABLE `CTL` (
  `sid` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `abbrevation` varchar(5) NOT NULL,
  `tot_marks` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `LTL`
--

CREATE TABLE `LTL` (
  `sid` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `abbrevation` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `LTL_has`
--

CREATE TABLE `LTL_has` (
  `roll_no` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `assign_id` int(11) NOT NULL,
  `actual_performance_date` date NOT NULL,
  `actual_submission_date` date NOT NULL,
  `obtained_marks` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `roll_no` int(11) NOT NULL,
  `cid` varchar(20) NOT NULL,
  `bid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `student_gives_UT`
--

CREATE TABLE `student_gives_UT` (
  `roll_no` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `ut1` int(11) NOT NULL,
  `ut2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `student_performs_assignments`
--

CREATE TABLE `student_performs_assignments` (
  `assign_id` int(11) NOT NULL,
  `roll_no` int(11) NOT NULL,
  `actual_performance_date` date NOT NULL,
  `actual_submission_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `sid` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `abbrevation` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `tid` varchar(20) NOT NULL,
  `tname` varchar(30) NOT NULL,
  `abbrevation` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `teacher_teaches_batch`
--

CREATE TABLE `teacher_teaches_batch` (
  `bid` varchar(20) NOT NULL,
  `tid` varchar(20) NOT NULL,
  `sid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `teacher_teaches_class`
--

CREATE TABLE `teacher_teaches_class` (
  `cid` varchar(20) NOT NULL,
  `tid` varchar(20) NOT NULL,
  `sid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assignment`
--
ALTER TABLE `assignment`
  ADD PRIMARY KEY (`assign_id`),
  ADD KEY `fk3` (`sid`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD KEY `roll_no` (`roll_no`);

--
-- Indexes for table `batch`
--
ALTER TABLE `batch`
  ADD PRIMARY KEY (`bid`);

--
-- Indexes for table `batch_has_students`
--
ALTER TABLE `batch_has_students`
  ADD KEY `roll_no` (`roll_no`),
  ADD KEY `bid` (`bid`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `class_has_students`
--
ALTER TABLE `class_has_students`
  ADD KEY `roll_no` (`roll_no`),
  ADD KEY `cid` (`cid`);

--
-- Indexes for table `CTL`
--
ALTER TABLE `CTL`
  ADD KEY `sid` (`sid`),
  ADD KEY `name` (`name`),
  ADD KEY `abbrevation` (`abbrevation`);

--
-- Indexes for table `LTL`
--
ALTER TABLE `LTL`
  ADD KEY `sid` (`sid`),
  ADD KEY `name` (`name`),
  ADD KEY `abbrevation` (`abbrevation`);

--
-- Indexes for table `LTL_has`
--
ALTER TABLE `LTL_has`
  ADD KEY `roll_no` (`roll_no`),
  ADD KEY `sid` (`sid`),
  ADD KEY `fk6` (`assign_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`roll_no`),
  ADD KEY `cid` (`cid`),
  ADD KEY `bid` (`bid`);

--
-- Indexes for table `student_gives_UT`
--
ALTER TABLE `student_gives_UT`
  ADD KEY `roll_no` (`roll_no`),
  ADD KEY `sid` (`sid`);

--
-- Indexes for table `student_performs_assignments`
--
ALTER TABLE `student_performs_assignments`
  ADD KEY `assign_id` (`assign_id`),
  ADD KEY `fk5` (`roll_no`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`sid`),
  ADD UNIQUE KEY `name_2` (`name`),
  ADD UNIQUE KEY `name` (`name`,`abbrevation`),
  ADD UNIQUE KEY `abbrevation` (`abbrevation`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`tid`);

--
-- Indexes for table `teacher_teaches_batch`
--
ALTER TABLE `teacher_teaches_batch`
  ADD KEY `bid` (`bid`),
  ADD KEY `tid` (`tid`),
  ADD KEY `sid` (`sid`);

--
-- Indexes for table `teacher_teaches_class`
--
ALTER TABLE `teacher_teaches_class`
  ADD KEY `cid` (`cid`),
  ADD KEY `tid` (`tid`),
  ADD KEY `sid` (`sid`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assignment`
--
ALTER TABLE `assignment`
  ADD CONSTRAINT `fk3` FOREIGN KEY (`sid`) REFERENCES `LTL` (`sid`);

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`roll_no`) REFERENCES `student` (`roll_no`);

--
-- Constraints for table `batch_has_students`
--
ALTER TABLE `batch_has_students`
  ADD CONSTRAINT `batch_has_students_ibfk_1` FOREIGN KEY (`roll_no`) REFERENCES `student` (`roll_no`) ON DELETE CASCADE,
  ADD CONSTRAINT `batch_has_students_ibfk_2` FOREIGN KEY (`bid`) REFERENCES `batch` (`bid`) ON DELETE CASCADE;

--
-- Constraints for table `class_has_students`
--
ALTER TABLE `class_has_students`
  ADD CONSTRAINT `class_has_students_ibfk_1` FOREIGN KEY (`roll_no`) REFERENCES `student` (`roll_no`) ON DELETE CASCADE,
  ADD CONSTRAINT `class_has_students_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `class` (`cid`) ON DELETE CASCADE;

--
-- Constraints for table `CTL`
--
ALTER TABLE `CTL`
  ADD CONSTRAINT `CTL_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `subject` (`sid`) ON DELETE CASCADE,
  ADD CONSTRAINT `CTL_ibfk_2` FOREIGN KEY (`name`) REFERENCES `subject` (`name`) ON DELETE CASCADE,
  ADD CONSTRAINT `CTL_ibfk_3` FOREIGN KEY (`abbrevation`) REFERENCES `subject` (`abbrevation`) ON DELETE CASCADE;

--
-- Constraints for table `LTL`
--
ALTER TABLE `LTL`
  ADD CONSTRAINT `LTL_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `subject` (`sid`) ON DELETE CASCADE,
  ADD CONSTRAINT `LTL_ibfk_2` FOREIGN KEY (`name`) REFERENCES `subject` (`name`) ON DELETE CASCADE,
  ADD CONSTRAINT `LTL_ibfk_3` FOREIGN KEY (`abbrevation`) REFERENCES `subject` (`abbrevation`) ON DELETE CASCADE;

--
-- Constraints for table `LTL_has`
--
ALTER TABLE `LTL_has`
  ADD CONSTRAINT `LTL_has_ibfk_1` FOREIGN KEY (`roll_no`) REFERENCES `student` (`roll_no`) ON DELETE CASCADE,
  ADD CONSTRAINT `LTL_has_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `LTL` (`sid`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk6` FOREIGN KEY (`assign_id`) REFERENCES `assignment` (`assign_id`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `class` (`cid`) ON DELETE CASCADE;

--
-- Constraints for table `student_gives_UT`
--
ALTER TABLE `student_gives_UT`
  ADD CONSTRAINT `student_gives_UT_ibfk_1` FOREIGN KEY (`roll_no`) REFERENCES `student` (`roll_no`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_gives_UT_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `CTL` (`sid`) ON DELETE CASCADE;

--
-- Constraints for table `student_performs_assignments`
--
ALTER TABLE `student_performs_assignments`
  ADD CONSTRAINT `fk5` FOREIGN KEY (`roll_no`) REFERENCES `student` (`roll_no`),
  ADD CONSTRAINT `student_performs_assignments_ibfk_1` FOREIGN KEY (`assign_id`) REFERENCES `assignment` (`assign_id`);

--
-- Constraints for table `teacher_teaches_batch`
--
ALTER TABLE `teacher_teaches_batch`
  ADD CONSTRAINT `teacher_teaches_batch_ibfk_1` FOREIGN KEY (`bid`) REFERENCES `batch` (`bid`),
  ADD CONSTRAINT `teacher_teaches_batch_ibfk_2` FOREIGN KEY (`tid`) REFERENCES `teacher` (`tid`) ON DELETE CASCADE,
  ADD CONSTRAINT `teacher_teaches_batch_ibfk_3` FOREIGN KEY (`sid`) REFERENCES `subject` (`sid`) ON DELETE CASCADE;

--
-- Constraints for table `teacher_teaches_class`
--
ALTER TABLE `teacher_teaches_class`
  ADD CONSTRAINT `teacher_teaches_class_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `class` (`cid`) ON DELETE CASCADE,
  ADD CONSTRAINT `teacher_teaches_class_ibfk_2` FOREIGN KEY (`tid`) REFERENCES `teacher` (`tid`) ON DELETE CASCADE,
  ADD CONSTRAINT `teacher_teaches_class_ibfk_3` FOREIGN KEY (`sid`) REFERENCES `subject` (`sid`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
