-- MySQL dump 10.13  Distrib 8.0.30, for macos12 (arm64)
--
-- Host: localhost    Database: awesomeweb
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ACT_ID_GROUP`
--

DROP TABLE IF EXISTS `ACT_ID_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_ID_GROUP` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_ID_GROUP`
--

LOCK TABLES `ACT_ID_GROUP` WRITE;
/*!40000 ALTER TABLE `ACT_ID_GROUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_ID_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_ID_INFO`
--

DROP TABLE IF EXISTS `ACT_ID_INFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_ID_INFO` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_ID_INFO`
--

LOCK TABLES `ACT_ID_INFO` WRITE;
/*!40000 ALTER TABLE `ACT_ID_INFO` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_ID_INFO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_ID_MEMBERSHIP`
--

DROP TABLE IF EXISTS `ACT_ID_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_ID_MEMBERSHIP` (
  `USER_ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `GROUP_ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `ACT_ID_GROUP` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `ACT_ID_USER` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_ID_MEMBERSHIP`
--

LOCK TABLES `ACT_ID_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `ACT_ID_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_ID_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_ID_TENANT`
--

DROP TABLE IF EXISTS `ACT_ID_TENANT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_ID_TENANT` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_ID_TENANT`
--

LOCK TABLES `ACT_ID_TENANT` WRITE;
/*!40000 ALTER TABLE `ACT_ID_TENANT` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_ID_TENANT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_ID_TENANT_MEMBER`
--

DROP TABLE IF EXISTS `ACT_ID_TENANT_MEMBER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_ID_TENANT_MEMBER` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `TENANT_ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `USER_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `GROUP_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_TENANT_MEMB_USER` (`TENANT_ID_`,`USER_ID_`),
  UNIQUE KEY `ACT_UNIQ_TENANT_MEMB_GROUP` (`TENANT_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_TENANT_MEMB_USER` (`USER_ID_`),
  KEY `ACT_FK_TENANT_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_TENANT_MEMB` FOREIGN KEY (`TENANT_ID_`) REFERENCES `ACT_ID_TENANT` (`ID_`),
  CONSTRAINT `ACT_FK_TENANT_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `ACT_ID_GROUP` (`ID_`),
  CONSTRAINT `ACT_FK_TENANT_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `ACT_ID_USER` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_ID_TENANT_MEMBER`
--

LOCK TABLES `ACT_ID_TENANT_MEMBER` WRITE;
/*!40000 ALTER TABLE `ACT_ID_TENANT_MEMBER` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_ID_TENANT_MEMBER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_ID_USER`
--

DROP TABLE IF EXISTS `ACT_ID_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_ID_USER` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SALT_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `LOCK_EXP_TIME_` datetime DEFAULT NULL,
  `ATTEMPTS_` int DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_ID_USER`
--

LOCK TABLES `ACT_ID_USER` WRITE;
/*!40000 ALTER TABLE `ACT_ID_USER` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_ID_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RE_CASE_DEF`
--

DROP TABLE IF EXISTS `ACT_RE_CASE_DEF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_RE_CASE_DEF` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8mb3_bin NOT NULL,
  `VERSION_` int NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `TENANT_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `HISTORY_TTL_` int DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_CASE_DEF_TENANT_ID` (`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RE_CASE_DEF`
--

LOCK TABLES `ACT_RE_CASE_DEF` WRITE;
/*!40000 ALTER TABLE `ACT_RE_CASE_DEF` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RE_CASE_DEF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_CASE_EXECUTION`
--

DROP TABLE IF EXISTS `ACT_RU_CASE_EXECUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_RU_CASE_EXECUTION` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `CASE_INST_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `SUPER_CASE_EXEC_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `CASE_DEF_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `PREV_STATE_` int DEFAULT NULL,
  `CURRENT_STATE_` int DEFAULT NULL,
  `REQUIRED_` tinyint(1) DEFAULT NULL,
  `TENANT_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_CASE_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_IDX_CASE_EXE_CASE_INST` (`CASE_INST_ID_`),
  KEY `ACT_FK_CASE_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_CASE_EXE_CASE_DEF` (`CASE_DEF_ID_`),
  KEY `ACT_IDX_CASE_EXEC_TENANT_ID` (`TENANT_ID_`),
  CONSTRAINT `ACT_FK_CASE_EXE_CASE_DEF` FOREIGN KEY (`CASE_DEF_ID_`) REFERENCES `ACT_RE_CASE_DEF` (`ID_`),
  CONSTRAINT `ACT_FK_CASE_EXE_CASE_INST` FOREIGN KEY (`CASE_INST_ID_`) REFERENCES `ACT_RU_CASE_EXECUTION` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_CASE_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `ACT_RU_CASE_EXECUTION` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_CASE_EXECUTION`
--

LOCK TABLES `ACT_RU_CASE_EXECUTION` WRITE;
/*!40000 ALTER TABLE `ACT_RU_CASE_EXECUTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_CASE_EXECUTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_CASE_SENTRY_PART`
--

DROP TABLE IF EXISTS `ACT_RU_CASE_SENTRY_PART`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_RU_CASE_SENTRY_PART` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `CASE_INST_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `CASE_EXEC_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `SENTRY_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SOURCE_CASE_EXEC_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `STANDARD_EVENT_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SOURCE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `VARIABLE_EVENT_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `VARIABLE_NAME_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SATISFIED_` tinyint(1) DEFAULT NULL,
  `TENANT_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_CASE_SENTRY_CASE_INST` (`CASE_INST_ID_`),
  KEY `ACT_FK_CASE_SENTRY_CASE_EXEC` (`CASE_EXEC_ID_`),
  CONSTRAINT `ACT_FK_CASE_SENTRY_CASE_EXEC` FOREIGN KEY (`CASE_EXEC_ID_`) REFERENCES `ACT_RU_CASE_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_CASE_SENTRY_CASE_INST` FOREIGN KEY (`CASE_INST_ID_`) REFERENCES `ACT_RU_CASE_EXECUTION` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_CASE_SENTRY_PART`
--

LOCK TABLES `ACT_RU_CASE_SENTRY_PART` WRITE;
/*!40000 ALTER TABLE `ACT_RU_CASE_SENTRY_PART` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_CASE_SENTRY_PART` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dict`
--

DROP TABLE IF EXISTS `dict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dict` (
  `dict_id` int NOT NULL AUTO_INCREMENT,
  `dict_name` varchar(100) DEFAULT NULL,
  `dict_type` varchar(100) DEFAULT NULL,
  `dict_value` int DEFAULT NULL,
  PRIMARY KEY (`dict_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dict`
--

LOCK TABLES `dict` WRITE;
/*!40000 ALTER TABLE `dict` DISABLE KEYS */;
INSERT INTO `dict` VALUES (1,'目录','menu_type',1),(2,'页面菜单','menu_type',2),(3,'按钮','menu_type',3);
/*!40000 ALTER TABLE `dict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(100) DEFAULT NULL,
  `menu_path` varchar(100) DEFAULT NULL,
  `menu_permission` varchar(100) DEFAULT NULL,
  `menu_pid` bigint DEFAULT '0',
  `menu_order` int DEFAULT NULL,
  `menu_type` varchar(10) DEFAULT NULL,
  `component_path` varchar(100) DEFAULT NULL,
  `menu_type_value` int DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1568871171393364007 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'用户管理','/system/user',NULL,0,1,'menu_type',NULL,1),(2,'菜单管理','/system/menu',NULL,0,1,'menu_type',NULL,1),(3,'测试一级菜单','/system/template','',0,NULL,'menu_type',NULL,1),(1568871171393364006,'系统设置','/system/setting','',0,0,'menu_type','',1);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL,
  `role_value` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'管理员','admin'),(2,'用户','user');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `expire_time` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES (1,1,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ0MSIsImNyZWF0ZWQiOjE2NjQ5NjE2MzE5NTIsImV4cCI6MTY2NDk2MTY0MX0.oUXMDf2qAlkcc15ZQR8Vyv43PMk_U_Zv--smzgvurVgchIzGQVQ5B0_M9VYF0ASskAU53b9nd1URjYJ4ohMoDQ',1664961718511);
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','admin'),(4,'t1','$2a$10$oF77f1o//eE92myuQXvNAeSaaujT/N16znB7W4Z6vQAt7zgjo/a.C');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `user_id` int DEFAULT NULL,
  `role_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,1),(4,1);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'awesomeweb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-15 22:18:45
