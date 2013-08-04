-- MySQL dump 10.13  Distrib 5.1.69, for redhat-linux-gnu (x86_64)
--
-- Host: 127.11.63.130    Database: vote
-- ------------------------------------------------------
-- Server version	5.1.69

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'Apprentices'),(2,'Contributors'),(3,'Admins');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `permission_id_refs_id_6ba0f519` (`permission_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (17,2,29),(16,2,26),(18,3,21);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can change config',1,'change_config'),(2,'Can add permission',2,'add_permission'),(3,'Can change permission',2,'change_permission'),(4,'Can delete permission',2,'delete_permission'),(5,'Can add group',3,'add_group'),(6,'Can change group',3,'change_group'),(7,'Can delete group',3,'delete_group'),(8,'Can add content type',4,'add_contenttype'),(9,'Can change content type',4,'change_contenttype'),(10,'Can delete content type',4,'delete_contenttype'),(11,'Can add session',5,'add_session'),(12,'Can change session',5,'change_session'),(13,'Can delete session',5,'delete_session'),(14,'Can add site',6,'add_site'),(15,'Can change site',6,'change_site'),(16,'Can delete site',6,'delete_site'),(17,'Can add constance',7,'add_constance'),(18,'Can change constance',7,'change_constance'),(19,'Can delete constance',7,'delete_constance'),(20,'Can add user',8,'add_user'),(21,'Can change user',8,'change_user'),(22,'Can delete user',8,'delete_user'),(23,'Can add tag',9,'add_tag'),(24,'Can change tag',9,'change_tag'),(25,'Can delete tag',9,'delete_tag'),(26,'Can add issue',10,'add_issue'),(27,'Can change issue',10,'change_issue'),(28,'Can delete issue',10,'delete_issue'),(29,'Can add vote',11,'add_vote'),(30,'Can change vote',11,'change_vote'),(31,'Can delete vote',11,'delete_vote');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `constance_config`
--

DROP TABLE IF EXISTS `constance_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `constance_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `constance_config`
--

LOCK TABLES `constance_config` WRITE;
/*!40000 ALTER TABLE `constance_config` DISABLE KEYS */;
INSERT INTO `constance_config` VALUES (1,'VOTE_TIME','gAJLBy4=');
/*!40000 ALTER TABLE `constance_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'config','constance','config'),(2,'permission','auth','permission'),(3,'group','auth','group'),(4,'content type','contenttypes','contenttype'),(5,'session','sessions','session'),(6,'site','sites','site'),(7,'constance','database','constance'),(8,'user','votes','user'),(9,'tag','votes','tag'),(10,'issue','votes','issue'),(11,'vote','votes','vote');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('l59pu9f0cfknjnltbjlwohf9e2yhngh4','NzQ3MTIwM2JhYTlkMzk3MjM4YjUzNjM0NGEwN2YwZmE1M2NiMDFhMzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZFUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmRVDV9hdXRoX3VzZXJfaWSKAQF1Lg==','2013-08-10 19:59:10'),('p6tejuk2d6pap48qk63csuwrw9mws8ad','MTIzNjE4NWYzNzI3NWJkOGVhMzI5N2VjNThlMGRlNDQ0OWU1NTdmZTqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZFUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmRVDV9hdXRoX3VzZXJfaWSKAQJ1Lg==','2013-08-10 21:04:00'),('u03hs79fvompkzsyhzt5hu64z3ypzj3o','MmJhZGY5MGUxYjBiYWRmMWYwNzhhYWVjYWUxNWUxNWYyZjc2MjE1ZjqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQSKAQN1Lg==','2013-08-10 19:50:38'),('1mfgwffmzpn98txjjalkku08yy43fjur','MzY4YzY0ZjUxMjNlZTdjYmY5MDRiYjFjMGUxYzQxMmI4N2IwMDkzZjqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZFUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmRVDV9hdXRoX3VzZXJfaWSKAQR1Lg==','2013-08-12 00:31:55'),('8vxfzm78fxd1rxwm1w1pz29dxymxyw42','MjU2Y2VkNzE4MWU5MWI2OTQxMWFmYjA2MGRkNjBmMmFiYTVlMzAwNjqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQSKAQh1Lg==','2013-08-11 02:49:43'),('25a8a8d8atpghtwqc2xzcwencm45vxy7','Y2FkOGMyY2MzOTcwOTZjZDc5NjI4OTY4Y2UyMzY0Y2IwOGM4NjU0ZjqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZFUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmRVDV9hdXRoX3VzZXJfaWSKAQZ1Lg==','2013-08-10 20:52:32'),('gbrupbsxkonyr07u559roi3f6ri1g1ic','NDRiMTM4ODcwMWFhNTFlMmE5ODY4ODdiNTFlMWMyODkxOGUwZjljNTqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZFUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmRVDV9hdXRoX3VzZXJfaWSKAQh1Lg==','2013-08-12 00:34:48'),('78geyqpnhddjc6x1fqx5in557ccujf7l','ZjIyNDcyMjdkYzkzMGQ3Y2IyOWU4MjVjN2ZhYWY0MTc1YzkwNjBlYzqAAn1xAVUJX21lc3NhZ2VzcQJdcQNjZGphbmdvLmNvbnRyaWIubWVzc2FnZXMuc3RvcmFnZS5iYXNlCk1lc3NhZ2UKcQQpgXEFfXEGKFUKZXh0cmFfdGFnc3EHWAAAAABVB21lc3NhZ2VxCFgSAAAASXNzdWUgIzIgbm90IGZvdW5kVQVsZXZlbHEJSyh1YmFzLg==','2013-08-12 08:21:56');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `votes_issue`
--

DROP TABLE IF EXISTS `votes_issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `votes_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `tldr` varchar(512) DEFAULT NULL,
  `submitted` datetime NOT NULL,
  `ends` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_refs_id_7df5b7c0` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `votes_issue`
--

LOCK TABLES `votes_issue` WRITE;
/*!40000 ALTER TABLE `votes_issue` DISABLE KEYS */;
INSERT INTO `votes_issue` VALUES (1,'World Core','<blockquote><p>The unifying aspect of this setting is the general method of intergalactic transportation: either sound-based tech or magic opens portals that enable someone to travel to an entirely new planet. The method of opening a new portal to a new world is dependent on how exactly the sound is made and executed. (Preventing most, if not all, accidental openings of these portals.) Hence they are, in a manner of speaking, &ldquo;worldsingers&rdquo;.</p><p><br />And rarely will you find two planets that are exactly the same. Some worlds have abandoned magic in favor of technology, others vice versa, and yet others combine the two in entirely new ways.</p><p>&mdash;From WB&#39;s Submission</p></blockquote><p>&nbsp;</p><p><em>You may vote either &quot;Yes&quot;&nbsp;for the proposal or &quot;No&quot; against the proposal. Four &quot;Yes&quot; votes will be enough to ratify this proposition into canon. Only the cited text will be considered </em>definitive&nbsp;<em>&quot;canon&quot;.&nbsp;</em></p>','Sound-based technology connects a universe of disparate parts.','2013-07-27 20:49:05','2013-08-03 20:49:05',4);
/*!40000 ALTER TABLE `votes_issue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `votes_issue_tags`
--

DROP TABLE IF EXISTS `votes_issue_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `votes_issue_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `issue_id` (`issue_id`,`tag_id`),
  KEY `tag_id_refs_id_5805ca66` (`tag_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `votes_issue_tags`
--

LOCK TABLES `votes_issue_tags` WRITE;
/*!40000 ALTER TABLE `votes_issue_tags` DISABLE KEYS */;
INSERT INTO `votes_issue_tags` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5);
/*!40000 ALTER TABLE `votes_issue_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `votes_tag`
--

DROP TABLE IF EXISTS `votes_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `votes_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(125) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `votes_tag`
--

LOCK TABLES `votes_tag` WRITE;
/*!40000 ALTER TABLE `votes_tag` DISABLE KEYS */;
INSERT INTO `votes_tag` VALUES (1,'Open'),(2,'core'),(3,'canon'),(4,'fantasy'),(5,'sci-fi');
/*!40000 ALTER TABLE `votes_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `votes_user`
--

DROP TABLE IF EXISTS `votes_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `votes_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(52) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `votes_user`
--

LOCK TABLES `votes_user` WRITE;
/*!40000 ALTER TABLE `votes_user` DISABLE KEYS */;
INSERT INTO `votes_user` VALUES (1,'pbkdf2_sha256$10000$m03tVrzPVH4b$stAXcqroXD79srukmAdH31CIBt5X7i9KCNliGS6rCmA=','2013-07-27 19:57:34',1,'Kazune',1),(2,'pbkdf2_sha256$10000$6uJ5Y4vkuK8c$09Hmsa45xT22ljyID5LqSBaORIPukMCWRxU3p4TiWo4=','2013-07-27 19:49:29',0,'Figments',1),(3,'pbkdf2_sha256$10000$QHa1jECbipYy$dmEq3IrOWjk8nW+KbqrWMJW94JYD50ezPPt2hvOnxWk=','2013-07-27 19:50:38',0,'Ether_Echoes',1),(4,'pbkdf2_sha256$10000$oLWk7wBmNCeX$hJFVlAfHRwx/Gampj2MHsEQxRBL7g7ozfiPztk2hjKQ=','2013-07-27 19:51:58',0,'Doseux',1),(5,'pbkdf2_sha256$10000$MpkoYeXGtjBg$IUC7V3TXB9ngo70S7dF8WlRXA932zbTbX5pXEkJKP6Q=','2013-07-27 19:54:48',0,'Golden Vision',0),(6,'pbkdf2_sha256$10000$TTkezfoz6guC$yWnM611VKYgh5Rw1Tv6YB16UPwVbXpcVKhdEo0LpphQ=','2013-07-27 19:58:59',0,'Golden_Vision',1),(7,'pbkdf2_sha256$10000$BEdNIUWuWm4L$CZPHlDHpYX1SWBTgWTUYsiIsXLSO1nbVB4TwXs3C7IQ=','2013-07-27 19:57:05',0,'GoldenVision',0),(8,'pbkdf2_sha256$10000$aKLCn1khA14I$j4q3XTMbvLJxdBCI71VYHISiMBJonpyToC2KrecsLN0=','2013-07-29 00:26:04',0,'WB',1);
/*!40000 ALTER TABLE `votes_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `votes_user_groups`
--

DROP TABLE IF EXISTS `votes_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `votes_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `group_id_refs_id_4ed09dfa` (`group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `votes_user_groups`
--

LOCK TABLES `votes_user_groups` WRITE;
/*!40000 ALTER TABLE `votes_user_groups` DISABLE KEYS */;
INSERT INTO `votes_user_groups` VALUES (6,1,3),(7,2,1),(8,2,2),(9,3,1),(10,3,2),(11,7,1),(12,6,1),(13,6,2),(14,5,1),(15,4,1),(16,4,2),(17,4,3),(18,8,1),(19,8,2);
/*!40000 ALTER TABLE `votes_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `votes_user_user_permissions`
--

DROP TABLE IF EXISTS `votes_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `votes_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `permission_id_refs_id_8f6e4ad1` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `votes_user_user_permissions`
--

LOCK TABLES `votes_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `votes_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `votes_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `votes_vote`
--

DROP TABLE IF EXISTS `votes_vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `votes_vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vote` tinyint(1) NOT NULL,
  `issue_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_refs_id_399e986a` (`user_id`),
  KEY `issue_id_refs_id_b714f134` (`issue_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `votes_vote`
--

LOCK TABLES `votes_vote` WRITE;
/*!40000 ALTER TABLE `votes_vote` DISABLE KEYS */;
INSERT INTO `votes_vote` VALUES (1,1,1,6),(2,1,1,4),(3,1,1,2),(4,1,1,8);
/*!40000 ALTER TABLE `votes_vote` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-08-04  7:29:06
