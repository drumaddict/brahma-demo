CREATE DATABASE  IF NOT EXISTS `myapp_site` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `myapp_site`;
-- MySQL dump 10.13  Distrib 5.5.40, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: myapp_site
-- ------------------------------------------------------
-- Server version	5.5.40-0ubuntu0.14.04.1

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
-- Table structure for table `administrators`
--

DROP TABLE IF EXISTS `administrators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrators` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `failed_attempts` int(11) NOT NULL DEFAULT '0',
  `unlock_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locked_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_administrators_on_email` (`email`),
  UNIQUE KEY `index_administrators_on_reset_password_token` (`reset_password_token`),
  UNIQUE KEY `index_administrators_on_unlock_token` (`unlock_token`),
  KEY `index_administrators_on_role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrators`
--

LOCK TABLES `administrators` WRITE;
/*!40000 ALTER TABLE `administrators` DISABLE KEYS */;
INSERT INTO `administrators` VALUES (1,NULL,'kabasakalis@gmail.com','$2a$10$c33wnuv4LDqHGnPpChuXTuRyDGpiqXxvebTg3htljN2xgLA.3HvVu','34e18ffe63b75d87b1ee0f6cb2f8b144f330148e6eac3f60da1f3387dd8ab35f','2015-03-08 23:34:48',NULL,34,'2015-03-21 23:03:51','2015-03-21 22:59:05','127.0.0.1','127.0.0.1',0,NULL,NULL,'2015-03-04 22:08:27','2015-03-21 23:03:51');
/*!40000 ALTER TABLE `administrators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_translations`
--

DROP TABLE IF EXISTS `article_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `summary` text COLLATE utf8_unicode_ci,
  `body` text COLLATE utf8_unicode_ci,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_article_translations_on_article_id` (`article_id`),
  KEY `index_article_translations_on_locale` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_translations`
--

LOCK TABLES `article_translations` WRITE;
/*!40000 ALTER TABLE `article_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_type_translations`
--

DROP TABLE IF EXISTS `article_type_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_type_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_type_id` int(11) NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_article_type_translations_on_article_type_id` (`article_type_id`),
  KEY `index_article_type_translations_on_locale` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_type_translations`
--

LOCK TABLES `article_type_translations` WRITE;
/*!40000 ALTER TABLE `article_type_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_type_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_types`
--

DROP TABLE IF EXISTS `article_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `public` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_article_types_on_slug` (`slug`),
  KEY `index_article_types_on_parent_id` (`parent_id`),
  KEY `index_article_types_on_public` (`public`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_types`
--

LOCK TABLES `article_types` WRITE;
/*!40000 ALTER TABLE `article_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_type_id` int(11) DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `draft` tinyint(1) DEFAULT '0',
  `featured` tinyint(1) DEFAULT '0',
  `published` tinyint(1) DEFAULT '0',
  `published_at` datetime DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_articles_on_slug` (`slug`),
  KEY `index_articles_on_article_type_id` (`article_type_id`),
  KEY `index_articles_on_published` (`published`),
  KEY `index_articles_on_featured` (`featured`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_attachments`
--

DROP TABLE IF EXISTS `file_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attachment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT '0',
  `is_default` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_file_attachments_on_content_type` (`content_type`),
  KEY `index_file_attachments_on_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_attachments`
--

LOCK TABLES `file_attachments` WRITE;
/*!40000 ALTER TABLE `file_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20141019222807'),('20141105225219'),('20141105225714'),('20150113213204'),('20150128000852'),('20150128001750'),('20150301232200'),('20150301232218'),('20150322232617'),('20150322232618'),('20150322232619'),('20150322232620'),('20150322232621'),('20150322232622');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sitemap_item_translations`
--

DROP TABLE IF EXISTS `sitemap_item_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitemap_item_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sitemap_item_id` int(11) NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `index_sitemap_item_translations_on_sitemap_item_id` (`sitemap_item_id`),
  KEY `index_sitemap_item_translations_on_locale` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sitemap_item_translations`
--

LOCK TABLES `sitemap_item_translations` WRITE;
/*!40000 ALTER TABLE `sitemap_item_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `sitemap_item_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sitemap_item_types`
--

DROP TABLE IF EXISTS `sitemap_item_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitemap_item_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rest_action` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sitemap_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `external_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `params` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sitemap_item_types`
--

LOCK TABLES `sitemap_item_types` WRITE;
/*!40000 ALTER TABLE `sitemap_item_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `sitemap_item_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sitemap_items`
--

DROP TABLE IF EXISTS `sitemap_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitemap_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sitemap_item_type_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url_hash` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sitemap_item_object_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sitemap_item_object_id` int(11) DEFAULT NULL,
  `css_celector` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_sitemap_items_on_slug` (`slug`),
  KEY `index_sitemap_items_on_parent_id` (`parent_id`),
  KEY `index_sitemap_items_on_sitemap_item_object_type` (`sitemap_item_object_type`),
  KEY `index_sitemap_items_on_sitemap_item_object_id` (`sitemap_item_object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sitemap_items`
--

LOCK TABLES `sitemap_items` WRITE;
/*!40000 ALTER TABLE `sitemap_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `sitemap_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `things`
--

DROP TABLE IF EXISTS `things`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `things` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `published` tinyint(1) DEFAULT '0',
  `featured` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_things_on_type_id` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `things`
--

LOCK TABLES `things` WRITE;
/*!40000 ALTER TABLE `things` DISABLE KEYS */;
INSERT INTO `things` VALUES (103,'Auxiliary','auxiliary','The RSS port is down, calculate the haptic application so we can hack the JBOD driver!',0,1,'2015-01-28 00:24:36','2015-01-28 00:24:36',23),(104,'Back End','back-end','If we navigate the system, we can get to the JBOD transmitter through the 1080p SDD alarm!',1,0,'2015-01-28 00:24:36','2015-01-28 00:24:36',23),(105,'Online','online','I\'ll calculate the primary SAS array, that should driver the IB bus!',1,0,'2015-01-28 00:24:36','2015-01-28 00:24:36',23),(106,'Solid State','solid-state','We need to generate the multi-byte SCSI array!',0,1,'2015-01-28 00:24:36','2015-01-28 00:24:36',23),(107,'Optical','optical','If we index the panel, we can get to the PNG array through the solid state SCSI transmitter!',0,0,'2015-01-28 00:24:36','2015-01-28 00:24:36',23),(108,'Multi Byte','multi-byte','If we hack the port, we can get to the SCSI microchip through the optical THX system!',0,0,'2015-01-28 00:24:36','2015-01-28 00:24:36',24),(109,'Wireless','wireless','You can\'t parse the card without bypassing the cross-platform ADP circuit!',0,1,'2015-01-28 00:24:36','2015-01-28 00:24:36',24),(110,'Multi Byte','multi-byte-229be0f3-49c6-4813-ac51-48df7521113e','You can\'t generate the array without transmitting the 1080p SMS driver!',1,0,'2015-01-28 00:24:36','2015-01-28 00:24:36',24),(111,'Solid State','solid-state-7105c058-6bca-49f5-9188-0c3d85b890bd','You can\'t reboot the array without navigating the multi-byte IB interface!',0,0,'2015-01-28 00:24:36','2015-01-28 00:24:36',24),(112,'Virtual','virtual','We need to input the haptic SAS pixel!',0,1,'2015-01-28 00:24:36','2015-01-28 00:24:36',24),(113,'Cross Platform','cross-platform','You can\'t navigate the program without navigating the digital SMTP pixel!',1,1,'2015-01-28 00:24:36','2015-01-28 00:24:36',25),(114,'Wireless','wireless-fee027a2-e39c-4087-b956-199693a4ad8c','I\'ll override the multi-byte USB port, that should system the THX capacitor!',0,1,'2015-01-28 00:24:36','2015-01-28 00:24:36',25),(115,'Primary','primary','programming the port won\'t do anything, we need to compress the multi-byte TCP pixel!',1,1,'2015-01-28 00:24:36','2015-01-28 00:24:36',25),(116,'Auxiliary','auxiliary-a564a539-691b-4399-bc98-c662bd9d52a6','You can\'t reboot the driver without copying the haptic PNG feed!',1,0,'2015-01-28 00:24:36','2015-01-28 00:24:36',25),(117,'Haptic','haptic','We need to bypass the redundant COM hard drive!',1,0,'2015-01-28 00:24:36','2015-01-28 00:24:36',25),(118,'Neural','neural','The USB port is down, back up the solid state panel so we can program the AI transmitter!',1,0,'2015-01-28 00:24:36','2015-01-28 00:24:36',26),(119,'Wireless','wireless-87ed0034-16c9-4ddf-b0e7-234bee42fcec','The HDD interface is down, bypass the bluetooth port so we can transmit the GB card!',0,0,'2015-01-28 00:24:36','2015-01-28 00:24:36',26),(120,'Primary','primary-c72ec187-2e8b-4ca7-8f93-0a12629a377f','I\'ll index the 1080p PCI hard drive, that should hard drive the PCI transmitter!',0,1,'2015-01-28 00:24:36','2015-01-28 00:24:36',26),(121,'Mobile','mobile','Use the bluetooth JBOD application, then you can quantify the back-end driver!',0,1,'2015-01-28 00:24:36','2015-01-28 00:24:36',26),(122,'Cross Platform','cross-platform-e85fe6b9-1601-42a1-8e2e-22a375c533e8','If we reboot the capacitor, we can get to the PNG protocol through the auxiliary PNG capacitor!',1,0,'2015-01-28 00:24:36','2015-01-28 00:24:36',26),(123,'Online','online-e6a90d32-cecf-4ef7-8acc-aba420d4b1b0','I\'ll synthesize the haptic EXE system, that should monitor the CSS capacitor!',1,0,'2015-01-28 00:24:36','2015-01-28 00:24:36',27),(124,'Primary','primary-b120da4d-72ec-4268-a61d-9727536a058d','The PCI hard drive is down, bypass the 1080p hard drive so we can transmit the SSL bus!',0,1,'2015-01-28 00:24:36','2015-01-28 00:24:36',27),(125,'Virtual','virtual-ab6aef8c-2aa9-4561-8752-16a49a0df385','You can\'t synthesize the protocol without parsing the solid state CSS matrix!',1,1,'2015-01-28 00:24:36','2015-01-28 00:24:36',27),(126,'Haptic','haptic-f082ce61-007e-4eb3-ac13-52807609aa96','You can\'t synthesize the driver without generating the optical SDD port!',1,0,'2015-01-28 00:24:36','2015-01-28 00:24:36',27),(127,'Online','online-ad05aed3-1ea8-4fab-bbfb-653a42ec09a9','We need to reboot the haptic GB system!',1,0,'2015-01-28 00:24:36','2015-01-28 00:24:36',27),(128,'Wireless','wireless-f2c762fa-d38c-4378-924e-8487edfe3491','Use the 1080p USB hard drive, then you can copy the online microchip!',0,1,'2015-01-28 00:24:36','2015-01-28 00:24:36',28),(129,'Auxiliary','auxiliary-fcfd014a-91d6-4bda-bcad-81237f3dd107','I\'ll navigate the open-source SAS bandwidth, that should sensor the IB bandwidth!',0,0,'2015-01-28 00:24:36','2015-01-28 00:24:36',28),(130,'Cross Platform','cross-platform-bb93a5b1-8564-4013-b7c6-14b2abbf62bc','indexing the array won\'t do anything, we need to synthesize the primary XSS pixel!',0,1,'2015-01-28 00:24:36','2015-01-28 00:24:36',28),(131,'Haptic','haptic-f926739c-affb-4e0d-b89d-f54bfdb03cc5','Use the open-source CSS matrix, then you can bypass the virtual driver!',1,1,'2015-01-28 00:24:36','2015-01-28 00:24:36',28),(132,'Multi Byte','multi-byte-57bcbadf-3d2d-4fb2-b63d-be438a13033f','Use the cross-platform AGP program, then you can navigate the redundant alarm!',0,1,'2015-01-28 00:24:36','2015-01-28 00:24:36',28),(133,'Haptic','haptic-7024be5f-2eeb-4427-a124-f331072822ce','Try to program the SCSI program, maybe it will hack the solid state matrix!',0,0,'2015-01-28 00:24:36','2015-01-28 00:24:36',29),(134,'Virtual','virtual-a8555ebf-5859-4161-9ca3-cf6afd2b3e20','Use the back-end HDD hard drive, then you can navigate the auxiliary firewall!',1,0,'2015-01-28 00:24:36','2015-01-28 00:24:36',29),(135,'Online','online-37ae2a18-539f-4282-9c1b-eb4fef151817','If we override the card, we can get to the ADP sensor through the mobile HTTP card!',0,0,'2015-01-28 00:24:36','2015-01-28 00:24:36',29),(136,'Multi Byte','multi-byte-b9bc97d0-0c88-4c1e-8358-be458096882f','The HDD bus is down, copy the solid state sensor so we can hack the ADP monitor!',1,1,'2015-01-28 00:24:36','2015-01-28 00:24:36',29),(137,'Optical','optical-de88c0c5-7d00-418d-9b75-a60dcfa20191','If we navigate the capacitor, we can get to the EXE bus through the virtual SMTP panel!',1,0,'2015-01-28 00:24:36','2015-01-28 00:24:36',29),(138,'Virtual','virtual-db68dba6-8078-4f24-a491-23c9904e7a84','copying the interface won\'t do anything, we need to program the back-end EXE circuit!',1,0,'2015-01-28 00:24:36','2015-01-28 00:24:36',30),(139,'Solid State','solid-state-95e245b2-1f99-4e08-9ce1-53389e73ed7f','generating the system won\'t do anything, we need to quantify the open-source USB transmitter!',0,1,'2015-01-28 00:24:36','2015-01-28 00:24:36',30),(140,'Wireless','wireless-7361d3a7-51fe-4098-a991-de98f6b3909f','compressing the capacitor won\'t do anything, we need to hack the online TCP hard drive!',0,1,'2015-01-28 00:24:36','2015-01-28 00:24:36',30),(141,'Multi Byte','multi-byte-54c4bcf8-66b5-49d4-a085-46ff404909e4','If we back up the program, we can get to the ADP bandwidth through the bluetooth SAS sensor!',0,1,'2015-01-28 00:24:36','2015-01-28 00:24:36',30),(142,'Auxiliary','auxiliary-7ac28f03-c18c-45ae-8e0f-282b5406e927','I\'ll calculate the bluetooth XSS card, that should interface the XSS firewall!',1,0,'2015-01-28 00:24:36','2015-01-28 00:24:36',30),(143,'Online','online-da9d899c-5ff8-4da6-99c3-79834b9df24d','Try to generate the HTTP card, maybe it will synthesize the bluetooth bus!',0,0,'2015-01-28 00:24:36','2015-01-28 00:24:36',31),(144,'Neural','neural-62b27f15-0de7-4226-8824-1810c52f569a','We need to navigate the primary CSS application!',1,1,'2015-01-28 00:24:36','2015-01-28 00:24:36',31),(145,'Solid State','solid-state-a5399f5e-7442-4bfc-8b8c-116f78449d1c','We need to input the primary RAM panel!',1,1,'2015-01-28 00:24:36','2015-01-28 00:24:36',31),(146,'Open Source','open-source','We need to index the open-source EXE protocol!',0,1,'2015-01-28 00:24:36','2015-01-28 00:24:36',31),(147,'Digital','digital','You can\'t index the panel without compressing the haptic SQL circuit!',1,1,'2015-01-28 00:24:36','2015-01-28 00:24:36',31),(148,'Redundant','redundant','You can\'t input the card without connecting the virtual FTP circuit!',0,1,'2015-01-28 00:24:36','2015-01-28 00:24:36',32),(149,'Auxiliary','auxiliary-98cb398a-20e6-43a9-912a-c7c2d72fba92','We need to index the haptic THX sensor!',1,1,'2015-01-28 00:24:36','2015-01-28 00:24:36',32),(150,'Redundant','redundant-3ff16110-1cdf-4d90-8263-8672170fa807','We need to index the solid state SAS application!',0,1,'2015-01-28 00:24:36','2015-01-28 00:24:36',32),(151,'Neural','neural-3e780589-c4d8-423f-b9d0-8b906f05ebf9','You can\'t compress the capacitor without copying the open-source GB bus!',1,0,'2015-01-28 00:24:36','2015-01-28 00:24:36',32),(152,'Open Source','open-source-90b26f25-c14d-4127-92b1-eeb81ced952a','The HTTP bandwidth is down, hack the solid state capacitor so we can input the JSON capacitor!',1,0,'2015-01-28 00:24:36','2015-01-28 00:24:36',32);
/*!40000 ALTER TABLE `things` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types`
--

DROP TABLE IF EXISTS `types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types`
--

LOCK TABLES `types` WRITE;
/*!40000 ALTER TABLE `types` DISABLE KEYS */;
INSERT INTO `types` VALUES (23,'Auxiliary','auxiliary','Try to compress the XML capacitor, maybe it will navigate the solid state system!','2015-01-28 00:24:35','2015-01-28 00:24:35'),(24,'Digital','digital','We need to hack the redundant RAM application!','2015-01-28 00:24:36','2015-01-28 00:24:36'),(25,'Solid State','solid-state','We need to navigate the solid state CSS feed!','2015-01-28 00:24:36','2015-01-28 00:24:36'),(26,'Online','online','You can\'t program the card without generating the online TCP circuit!','2015-01-28 00:24:36','2015-01-28 00:24:36'),(27,'Back End','back-end','You can\'t hack the transmitter without parsing the 1080p FTP sensor!','2015-01-28 00:24:36','2015-01-28 00:24:36'),(28,'Neural','neural','You can\'t override the panel without synthesizing the optical PNG pixel!','2015-01-28 00:24:36','2015-01-28 00:24:36'),(29,'Multi Byte','multi-byte','I\'ll quantify the solid state SQL pixel, that should capacitor the AI firewall!','2015-01-28 00:24:36','2015-01-28 00:24:36'),(30,'Digital','digital-f714474f-ed1e-4045-9b10-47abc4746d55','I\'ll compress the neural PNG monitor, that should transmitter the USB microchip!','2015-01-28 00:24:36','2015-01-28 00:24:36'),(31,'Haptic','haptic','I\'ll index the digital JSON panel, that should card the AI firewall!','2015-01-28 00:24:36','2015-01-28 00:24:36'),(32,'Solid State','solid-state-8aa9028d-0271-4633-a1e4-163b47ca40bb','Try to generate the CSS matrix, maybe it will compress the open-source bus!','2015-01-28 00:24:36','2015-01-28 00:24:36');
/*!40000 ALTER TABLE `types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-23  2:22:16
