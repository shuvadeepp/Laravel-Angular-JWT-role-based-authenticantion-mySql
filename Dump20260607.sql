-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: student_teacher_db
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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

--
-- Table structure for table `tbl_students`
--

DROP TABLE IF EXISTS `tbl_students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_students` (
  `student_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `student_code` varchar(50) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `semester` varchar(20) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_students`
--

LOCK TABLES `tbl_students` WRITE;
/*!40000 ALTER TABLE `tbl_students` DISABLE KEYS */;
INSERT INTO `tbl_students` VALUES (1,4,NULL,NULL,NULL,NULL,NULL,'2026-06-06 12:48:06'),(2,6,NULL,NULL,NULL,NULL,NULL,'2026-06-07 05:48:54'),(3,7,NULL,NULL,NULL,NULL,NULL,'2026-06-07 05:52:57');
/*!40000 ALTER TABLE `tbl_students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_teachers`
--

DROP TABLE IF EXISTS `tbl_teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_teachers` (
  `teacher_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `teacher_code` varchar(50) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `designation` varchar(100) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_teachers`
--

LOCK TABLES `tbl_teachers` WRITE;
/*!40000 ALTER TABLE `tbl_teachers` DISABLE KEYS */;
INSERT INTO `tbl_teachers` VALUES (1,3,NULL,NULL,NULL,NULL,NULL,'2026-06-06 12:47:17'),(2,5,NULL,NULL,NULL,NULL,NULL,'2026-06-07 03:39:58'),(3,8,NULL,NULL,NULL,NULL,NULL,'2026-06-07 12:23:03');
/*!40000 ALTER TABLE `tbl_teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_users`
--

DROP TABLE IF EXISTS `tbl_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_users` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vch_name` varchar(100) DEFAULT NULL,
  `vch_email` varchar(150) DEFAULT NULL,
  `vch_password` varchar(255) DEFAULT NULL,
  `int_role` smallint(6) NOT NULL DEFAULT 2,
  `is_active` tinyint(4) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `vch_email` (`vch_email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_users`
--

LOCK TABLES `tbl_users` WRITE;
/*!40000 ALTER TABLE `tbl_users` DISABLE KEYS */;
INSERT INTO `tbl_users` VALUES (3,'shuvadeep','teacher@gmail.com','$2y$12$KT2Q79ljYOHXi9qZ./PxtuixOIF1Wx6pYaP0ZtxJu3zbq4YGovVJe',1,1,'2026-06-06 07:17:17','2026-06-06 12:47:17'),(4,'rita','student@gmail.com','$2y$12$ueFP68kGtZf0QqgLGhQB0eX5GC2Vz3AYZQTA2tLck7uqEvGh345za',2,1,'2026-06-06 07:18:06','2026-06-06 12:48:06'),(5,'test','test@gmail.com','$2y$12$CnDOt5w13tZVassTvVvgKe5nvf2KcNwwJT98OSav9NM.fg1LHG7uK',1,1,'2026-06-06 22:09:58','2026-06-07 03:39:58'),(6,'debesh','debesh@gmail.com','$2y$12$S5L1YsVa/E85shpQgwRQ8.nfkF98V2lI3lzOsVw8T8xwhnfMQ6Av.',2,1,'2026-06-07 00:18:54','2026-06-07 05:48:54'),(7,'rit','ritu@gail.com','$2y$12$afG3As9VkiQarUUqWdR6.OHidDLrsDE/lIZIDPS5IkpgKg0WdST9.',2,1,'2026-06-07 00:22:57','2026-06-07 05:52:57'),(8,'karisma','karisma@gmail.com','$2y$12$0Idnd3gYsCWol2AyKV6KQeBCMmjvYTlIIGri5vrMMBMLQhQ.NrXmy',1,1,'2026-06-07 06:53:03','2026-06-07 12:23:03');
/*!40000 ALTER TABLE `tbl_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-07 22:49:51
