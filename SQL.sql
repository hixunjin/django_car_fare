-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: driver_fare
-- ------------------------------------------------------
-- Server version	8.0.13

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
-- Table structure for table `admin_interface_theme`
--

DROP TABLE IF EXISTS `admin_interface_theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_interface_theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `title` varchar(50) NOT NULL,
  `title_visible` tinyint(1) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `logo_visible` tinyint(1) NOT NULL,
  `css_header_background_color` varchar(10) NOT NULL,
  `title_color` varchar(10) NOT NULL,
  `css_header_text_color` varchar(10) NOT NULL,
  `css_header_link_color` varchar(10) NOT NULL,
  `css_header_link_hover_color` varchar(10) NOT NULL,
  `css_module_background_color` varchar(10) NOT NULL,
  `css_module_text_color` varchar(10) NOT NULL,
  `css_module_link_color` varchar(10) NOT NULL,
  `css_module_link_hover_color` varchar(10) NOT NULL,
  `css_module_rounded_corners` tinyint(1) NOT NULL,
  `css_generic_link_color` varchar(10) NOT NULL,
  `css_generic_link_hover_color` varchar(10) NOT NULL,
  `css_save_button_background_color` varchar(10) NOT NULL,
  `css_save_button_background_hover_color` varchar(10) NOT NULL,
  `css_save_button_text_color` varchar(10) NOT NULL,
  `css_delete_button_background_color` varchar(10) NOT NULL,
  `css_delete_button_background_hover_color` varchar(10) NOT NULL,
  `css_delete_button_text_color` varchar(10) NOT NULL,
  `list_filter_dropdown` tinyint(1) NOT NULL,
  `related_modal_active` tinyint(1) NOT NULL,
  `related_modal_background_color` varchar(10) NOT NULL,
  `related_modal_rounded_corners` tinyint(1) NOT NULL,
  `logo_color` varchar(10) NOT NULL,
  `recent_actions_visible` tinyint(1) NOT NULL,
  `favicon` varchar(100) NOT NULL,
  `related_modal_background_opacity` varchar(5) NOT NULL,
  `env_name` varchar(50) NOT NULL,
  `env_visible_in_header` tinyint(1) NOT NULL,
  `env_color` varchar(10) NOT NULL,
  `env_visible_in_favicon` tinyint(1) NOT NULL,
  `related_modal_close_button_visible` tinyint(1) NOT NULL,
  `language_chooser_active` tinyint(1) NOT NULL,
  `language_chooser_display` varchar(10) NOT NULL,
  `list_filter_sticky` tinyint(1) NOT NULL,
  `form_pagination_sticky` tinyint(1) NOT NULL,
  `form_submit_sticky` tinyint(1) NOT NULL,
  `css_module_background_selected_color` varchar(10) NOT NULL,
  `css_module_link_selected_color` varchar(10) NOT NULL,
  `logo_max_height` smallint(5) unsigned NOT NULL,
  `logo_max_width` smallint(5) unsigned NOT NULL,
  `foldable_apps` tinyint(1) NOT NULL,
  `language_chooser_control` varchar(20) NOT NULL,
  `list_filter_highlight` tinyint(1) NOT NULL,
  `list_filter_removal_links` tinyint(1) NOT NULL,
  `show_fieldsets_as_tabs` tinyint(1) NOT NULL,
  `show_inlines_as_tabs` tinyint(1) NOT NULL,
  `css_generic_link_active_color` varchar(10) NOT NULL,
  `collapsible_stacked_inlines` tinyint(1) NOT NULL,
  `collapsible_stacked_inlines_collapsed` tinyint(1) NOT NULL,
  `collapsible_tabular_inlines` tinyint(1) NOT NULL,
  `collapsible_tabular_inlines_collapsed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_interface_theme_name_30bda70f_uniq` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_interface_theme`
--

LOCK TABLES `admin_interface_theme` WRITE;
/*!40000 ALTER TABLE `admin_interface_theme` DISABLE KEYS */;
INSERT INTO `admin_interface_theme` VALUES (1,'Django',1,'Django 管理',1,'',1,'#0C4B33','#F5DD5D','#44B78B','#FFFFFF','#C9F0DD','#44B78B','#FFFFFF','#FFFFFF','#C9F0DD',1,'#0C3C26','#156641','#0C4B33','#0C3C26','#FFFFFF','#BA2121','#A41515','#FFFFFF',1,1,'#000000',1,'#FFFFFF',1,'','0.3','',1,'#E74C3C',1,1,1,'code',1,0,0,'#FFFFCC','#FFFFFF',100,400,1,'default-select',1,0,0,0,'#29B864',0,1,0,1);
/*!40000 ALTER TABLE `admin_interface_theme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add carinfo',7,'add_carinfo'),(26,'Can change carinfo',7,'change_carinfo'),(27,'Can delete carinfo',7,'delete_carinfo'),(28,'Can view carinfo',7,'view_carinfo'),(29,'Can add department',8,'add_department'),(30,'Can change department',8,'change_department'),(31,'Can delete department',8,'delete_department'),(32,'Can view department',8,'view_department'),(33,'Can add loguser',9,'add_loguser'),(34,'Can change loguser',9,'change_loguser'),(35,'Can delete loguser',9,'delete_loguser'),(36,'Can view loguser',9,'view_loguser'),(37,'Can add fare',10,'add_fare'),(38,'Can change fare',10,'change_fare'),(39,'Can delete fare',10,'delete_fare'),(40,'Can view fare',10,'view_fare'),(41,'Can add menu',11,'add_menu'),(42,'Can change menu',11,'change_menu'),(43,'Can delete menu',11,'delete_menu'),(44,'Can view menu',11,'view_menu'),(45,'Can add perm group',12,'add_permgroup'),(46,'Can change perm group',12,'change_permgroup'),(47,'Can delete perm group',12,'delete_permgroup'),(48,'Can view perm group',12,'view_permgroup'),(49,'Can add permission',13,'add_permission'),(50,'Can change permission',13,'change_permission'),(51,'Can delete permission',13,'delete_permission'),(52,'Can view permission',13,'view_permission'),(53,'Can add role',14,'add_role'),(54,'Can change role',14,'change_role'),(55,'Can delete role',14,'delete_role'),(56,'Can view role',14,'view_role'),(57,'Can add user info',15,'add_userinfo'),(58,'Can change user info',15,'change_userinfo'),(59,'Can delete user info',15,'delete_userinfo'),(60,'Can view user info',15,'view_userinfo'),(61,'Can add Theme',16,'add_theme'),(62,'Can change Theme',16,'change_theme'),(63,'Can delete Theme',16,'delete_theme'),(64,'Can view Theme',16,'view_theme');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$A3njp07ivFpWVogkKCO8jo$HruAFreiN8vY5WtRctO4yBChjQGevbFa/YsG/rOtxBE=','2025-04-27 14:28:22.016224',1,'admin','','','2429803436@qq.com',1,1,'2025-04-11 02:23:26.460577'),(2,'pbkdf2_sha256$600000$5CNg5xKMvTBxFGpRIf5aY9$/RuMMXunDEBOHgKTzpi0jq7R3d71ohfiqh38X9/8hLw=',NULL,0,'pyhtontest','','','',0,1,'2025-04-13 06:40:15.592792');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-04-11 02:46:42.373466','1','车辆信息菜单',1,'[{\"added\": {}}]',11,1),(2,'2025-04-11 02:46:59.293997','2','部门信息菜单',1,'[{\"added\": {}}]',11,1),(3,'2025-04-11 02:47:17.881001','3','车费信息菜单',1,'[{\"added\": {}}]',11,1),(4,'2025-04-11 02:47:51.768288','1','carinfo组',1,'[{\"added\": {}}]',12,1),(5,'2025-04-11 02:48:14.046917','1','车费信息管理',1,'[{\"added\": {}}]',13,1),(6,'2025-04-11 02:48:35.087242','1','车费信息管理',2,'[]',13,1),(7,'2025-04-11 02:49:42.253770','2','车辆信息增加',1,'[{\"added\": {}}]',13,1),(8,'2025-04-11 02:49:50.134272','1','车辆信息管理',2,'[{\"changed\": {\"fields\": [\"\\u6743\\u9650\\u540d\\u79f0\"]}}]',13,1),(9,'2025-04-11 02:50:45.041204','3','车辆信息修改',1,'[{\"added\": {}}]',13,1),(10,'2025-04-11 02:51:12.016808','4','车辆信息删除',1,'[{\"added\": {}}]',13,1),(11,'2025-04-11 02:51:45.944732','2','department组',1,'[{\"added\": {}}]',12,1),(12,'2025-04-11 02:52:42.447253','5','部门信息管理',1,'[{\"added\": {}}]',13,1),(13,'2025-04-11 02:56:55.300853','6','部门信息增加',1,'[{\"added\": {}}]',13,1),(14,'2025-04-11 02:57:38.674440','7','部门信息修改',1,'[{\"added\": {}}]',13,1),(15,'2025-04-11 02:58:12.593607','8','部门信息删除',1,'[{\"added\": {}}]',13,1),(16,'2025-04-11 02:59:19.629645','4','用户分配到部门菜单',1,'[{\"added\": {}}]',11,1),(17,'2025-04-11 02:59:50.896928','3','loguser组',1,'[{\"added\": {}}]',12,1),(18,'2025-04-11 03:00:43.707439','9','用户的部门管理列表',1,'[{\"added\": {}}]',13,1),(19,'2025-04-11 03:01:06.056510','4','用户的部门管理菜单',2,'[{\"changed\": {\"fields\": [\"\\u4e00\\u7ea7\\u83dc\\u5355\"]}}]',11,1),(20,'2025-04-11 03:02:26.759045','10','用户分配到部门',1,'[{\"added\": {}}]',13,1),(21,'2025-04-11 03:02:51.423086','4','fare组',1,'[{\"added\": {}}]',12,1),(22,'2025-04-11 03:07:53.046021','11','车费信息管理',1,'[{\"added\": {}}]',13,1),(23,'2025-04-11 03:08:20.195194','12','车费信息增加',1,'[{\"added\": {}}]',13,1),(24,'2025-04-11 03:09:00.790745','13','车费信息修改',1,'[{\"added\": {}}]',13,1),(25,'2025-04-11 03:09:38.270780','14','车费信息删除',1,'[{\"added\": {}}]',13,1),(26,'2025-04-11 03:10:23.646135','5','车费审批菜单',1,'[{\"added\": {}}]',11,1),(27,'2025-04-11 03:10:49.169013','5','fare车费审批组',1,'[{\"added\": {}}]',12,1),(28,'2025-04-11 03:11:45.089909','15','待审批车费信息',1,'[{\"added\": {}}]',13,1),(29,'2025-04-11 03:13:22.691881','16','车费信息审批',1,'[{\"added\": {}}]',13,1),(30,'2025-04-11 03:14:27.698292','17','待取消车费信息',1,'[{\"added\": {}}]',13,1),(31,'2025-04-11 03:15:11.128234','18','取消车费审批',1,'[{\"added\": {}}]',13,1),(32,'2025-04-11 03:15:31.791358','6','车费统计',1,'[{\"added\": {}}]',11,1),(33,'2025-04-11 03:15:48.000236','6','车费统计组',1,'[{\"added\": {}}]',12,1),(34,'2025-04-11 03:15:53.758906','6','车费统计菜单',2,'[{\"changed\": {\"fields\": [\"\\u4e00\\u7ea7\\u83dc\\u5355\"]}}]',11,1),(35,'2025-04-11 03:16:34.351292','19','车费统计',1,'[{\"added\": {}}]',13,1),(36,'2025-04-11 03:18:56.434709','1','超级管理员',1,'[{\"added\": {}}]',14,1),(37,'2025-04-11 03:19:56.691651','1','刘',1,'[{\"added\": {}}]',15,1),(38,'2025-04-11 07:20:26.083321','2','刘',1,'[{\"added\": {}}]',15,1),(39,'2025-04-12 08:56:51.698862','2','刘',2,'[]',15,1),(40,'2025-04-13 06:36:12.527891','2','普通用户',1,'[{\"added\": {}}]',14,1),(41,'2025-04-13 06:37:31.773736','3','刘',1,'[{\"added\": {}}]',15,1),(42,'2025-04-13 06:40:15.772135','2','pyhtontest',1,'[{\"added\": {}}]',4,1),(43,'2025-04-13 06:41:18.874109','2','刘',2,'[{\"changed\": {\"fields\": [\"Roles\"]}}]',15,1),(44,'2025-04-13 06:56:01.752474','2','刘',2,'[{\"changed\": {\"fields\": [\"Roles\"]}}]',15,1),(45,'2025-04-13 08:23:57.538498','4','xuan',1,'[{\"added\": {}}]',15,1),(46,'2025-04-13 08:25:31.877502','4','loguser object (4)',1,'[{\"added\": {}}]',9,1),(47,'2025-04-14 06:29:36.953069','4','xuan',2,'[{\"changed\": {\"fields\": [\"Roles\"]}}]',15,1),(48,'2025-04-14 06:59:00.601456','4','xuan',2,'[{\"changed\": {\"fields\": [\"Roles\"]}}]',15,1),(49,'2025-04-14 07:05:16.035758','4','xuan',2,'[{\"changed\": {\"fields\": [\"Roles\"]}}]',15,1),(50,'2025-04-14 07:07:04.906341','2','普通用户',2,'[{\"changed\": {\"fields\": [\"\\u62e5\\u6709\\u7684\\u6743\\u9650\"]}}]',14,1),(51,'2025-04-14 07:07:14.656122','4','xuan',2,'[{\"changed\": {\"fields\": [\"Roles\"]}}]',15,1),(52,'2025-04-14 07:11:38.114391','2','普通用户',2,'[{\"changed\": {\"fields\": [\"\\u62e5\\u6709\\u7684\\u6743\\u9650\"]}}]',14,1),(53,'2025-04-14 07:21:48.142924','2','普通用户',2,'[]',14,1),(54,'2025-04-14 07:21:55.778803','4','xuan',2,'[{\"changed\": {\"fields\": [\"Roles\"]}}]',15,1),(55,'2025-04-14 07:25:08.664543','3','刘',2,'[{\"changed\": {\"fields\": [\"Roles\"]}}]',15,1),(56,'2025-04-14 07:25:23.342519','5','刘',1,'[{\"added\": {}}]',15,1),(57,'2025-04-14 07:26:08.531665','2','普通用户',2,'[{\"changed\": {\"fields\": [\"\\u62e5\\u6709\\u7684\\u6743\\u9650\"]}}]',14,1),(58,'2025-04-14 07:26:56.587431','5','刘',2,'[]',15,1),(59,'2025-04-14 07:27:37.973068','5','张',2,'[{\"changed\": {\"fields\": [\"\\u59d3\\u540d\"]}}]',15,1),(60,'2025-04-14 07:27:56.557008','6','QQQQQ',1,'[{\"added\": {}}]',9,1),(61,'2025-04-14 07:28:45.679779','2','普通用户',2,'[{\"changed\": {\"fields\": [\"\\u62e5\\u6709\\u7684\\u6743\\u9650\"]}}]',14,1),(62,'2025-04-14 07:35:38.589266','1','fare object (1)',1,'[{\"added\": {}}]',10,1),(63,'2025-04-14 07:36:43.971503','3','刘',2,'[]',15,1),(64,'2025-04-26 13:17:01.183914','6','L',1,'[{\"added\": {}}]',15,1),(65,'2025-04-26 13:17:13.112479','6','L',2,'[{\"changed\": {\"fields\": [\"\\u7528\\u6237\\u540d\"]}}]',15,1),(66,'2025-04-26 13:18:04.239403','7','xuan',1,'[{\"added\": {}}]',9,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(16,'admin_interface','theme'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'fare','carinfo'),(8,'fare','department'),(10,'fare','fare'),(9,'fare','loguser'),(11,'rbac','menu'),(12,'rbac','permgroup'),(13,'rbac','permission'),(14,'rbac','role'),(15,'rbac','userinfo'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-03-27 08:56:59.711033'),(2,'auth','0001_initial','2025-03-27 08:57:01.125438'),(3,'admin','0001_initial','2025-03-27 08:57:01.448381'),(4,'admin','0002_logentry_remove_auto_add','2025-03-27 08:57:01.463996'),(5,'admin','0003_logentry_add_action_flag_choices','2025-03-27 08:57:01.479621'),(6,'contenttypes','0002_remove_content_type_name','2025-03-27 08:57:01.733187'),(7,'auth','0002_alter_permission_name_max_length','2025-03-27 08:57:01.864314'),(8,'auth','0003_alter_user_email_max_length','2025-03-27 08:57:01.895562'),(9,'auth','0004_alter_user_username_opts','2025-03-27 08:57:01.911301'),(10,'auth','0005_alter_user_last_login_null','2025-03-27 08:57:02.033165'),(11,'auth','0006_require_contenttypes_0002','2025-03-27 08:57:02.048910'),(12,'auth','0007_alter_validators_add_error_messages','2025-03-27 08:57:02.048910'),(13,'auth','0008_alter_user_username_max_length','2025-03-27 08:57:02.180144'),(14,'auth','0009_alter_user_last_name_max_length','2025-03-27 08:57:02.349380'),(15,'auth','0010_alter_group_name_max_length','2025-03-27 08:57:02.380620'),(16,'auth','0011_update_proxy_permissions','2025-03-27 08:57:02.380620'),(17,'auth','0012_alter_user_first_name_max_length','2025-03-27 08:57:02.480495'),(18,'rbac','0001_initial','2025-03-27 08:57:03.753221'),(19,'rbac','0002_alter_permission_options_permission_pid_and_more','2025-03-27 08:57:04.334349'),(20,'fare','0001_initial','2025-03-27 08:57:05.114213'),(21,'sessions','0001_initial','2025-03-27 08:57:05.183512'),(22,'admin_interface','0001_initial','2025-04-15 09:48:36.695093'),(23,'admin_interface','0002_add_related_modal','2025-04-15 09:48:36.997450'),(24,'admin_interface','0003_add_logo_color','2025-04-15 09:48:37.037979'),(25,'admin_interface','0004_rename_title_color','2025-04-15 09:48:37.061820'),(26,'admin_interface','0005_add_recent_actions_visible','2025-04-15 09:48:37.123096'),(27,'admin_interface','0006_bytes_to_str','2025-04-15 09:48:37.190870'),(28,'admin_interface','0007_add_favicon','2025-04-15 09:48:37.294470'),(29,'admin_interface','0008_change_related_modal_background_opacity_type','2025-04-15 09:48:37.435290'),(30,'admin_interface','0009_add_enviroment','2025-04-15 09:48:37.538406'),(31,'admin_interface','0010_add_localization','2025-04-15 09:48:37.567178'),(32,'admin_interface','0011_add_environment_options','2025-04-15 09:48:37.746985'),(33,'admin_interface','0012_update_verbose_names','2025-04-15 09:48:37.754037'),(34,'admin_interface','0013_add_related_modal_close_button','2025-04-15 09:48:37.810484'),(35,'admin_interface','0014_name_unique','2025-04-15 09:48:37.833408'),(36,'admin_interface','0015_add_language_chooser_active','2025-04-15 09:48:37.890300'),(37,'admin_interface','0016_add_language_chooser_display','2025-04-15 09:48:37.934239'),(38,'admin_interface','0017_change_list_filter_dropdown','2025-04-15 09:48:37.942215'),(39,'admin_interface','0018_theme_list_filter_sticky','2025-04-15 09:48:37.995276'),(40,'admin_interface','0019_add_form_sticky','2025-04-15 09:48:38.121298'),(41,'admin_interface','0020_module_selected_colors','2025-04-15 09:48:38.256617'),(42,'admin_interface','0021_file_extension_validator','2025-04-15 09:48:38.277540'),(43,'admin_interface','0022_add_logo_max_width_and_height','2025-04-15 09:48:38.387007'),(44,'admin_interface','0023_theme_foldable_apps','2025-04-15 09:48:38.446166'),(45,'admin_interface','0024_remove_theme_css','2025-04-15 09:48:38.520066'),(46,'admin_interface','0025_theme_language_chooser_control','2025-04-15 09:48:38.572865'),(47,'admin_interface','0026_theme_list_filter_highlight','2025-04-15 09:48:38.631958'),(48,'admin_interface','0027_theme_list_filter_removal_links','2025-04-15 09:48:38.673863'),(49,'admin_interface','0028_theme_show_fieldsets_as_tabs_and_more','2025-04-15 09:48:38.787332'),(50,'admin_interface','0029_theme_css_generic_link_active_color','2025-04-15 09:48:38.834093'),(51,'admin_interface','0030_theme_collapsible_stacked_inlines_and_more','2025-04-15 09:48:39.056488');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('37xj09g6foyl9y5alw9ia924qe7bb6ou','.eJzFWVtvqzgQ_isVz2kBg22ojvZh38_LkfapqSoHm4YtgYjLSqsq_31nIA03O6EtnH0x4LFnvvk89ozFu_Ui6mr_UpeqeEmk9Wi51qbftxPRm8pQIP8W2Wv-EOVZVSS7BxzycJaWDz9zqdI_z2MHCvai3MNsEcVuGHFCuc-pE_mCMuIyriRlXDjCl5TvuORKKMYDIZ2YBERy6ilKwzhiPio9qKwuQdfT-9bKxEFtrce7rfULQGytDbwlgK3ti0VxF4v7KCmiVLXCAyIsUTycvt3WvnIceIBxDo_AkxE8qEcpfgUsmKG9LtJWZgt5SDK7AFA24rVbuZDyL-MQEJ6H7QolZFTUh50G6QxHT5u7hZ07PaNYJRKlruMQjQnGfQ8eIaOtpcj_KmNHVRxei7w-3qCtG7cqd592bMyWd1Ppd-ILWUjKMsmzGXSdB_5Gvr4QXb5GKackQN3E49_kC8-jJIvzG2xdhq3K1afdGnNFNUqDUBJ8EE6-yVWRp-oGT82QVTn6tDtjjti4w9VZ2Qm_eUQuHo1-gCck84LgI6InNku0We4Tlcp7kVY3E0x_rfUOYMzpVwMzaROS5tXohsxcjWWcvhHU1xwdL0ug06U9bssPJeV9lL9eoexGGumN-d9Jm-XomLJw3MFPz1AkARcvb-pf6_EdKjloIohKqJmerDQpK5CDs9AqmeAHBKz13MxphtiwRsqORIFjbZBfOpCi_jfOt38kWfWYyD_6AtDY9T-fNhb5GgipjkMQ0DEAAd8DEANJH4XdwPB0MBoAE9PI-dA29nTGmvRw9s7_mnfYDE1gM_APm84mfg2cxObi5UWKkKjR0811v7GJ9ip6G6E6Hov8H2X_KKsC-CxHIJoZRNvXm4HA2BTYBIPIsrwSlcIZMAWr4zaan94tvJ24G6tKqlTBJQC2YcwYtgG0fqxc2IMOi2E_7QS8c99h7X6AwZPIPiayue5kdZqe7Zz1N--3jTSFdFNHw5ZuwZE54GgQKmiJcKbgzgHwgc1dCpg3Bxi8AzBGvXAKbLzdF0foz6KOEAeLy-YyOEI4OHdWAEj7AENHBdBSbGcFXu80MwQemYAzGdGAY3PAGQOvO1k_sNGlgPE5wIyBpzviF4cYzOLOFHmTXLMCwrCPsCmw2vqq5izwh5q6AETMLm9r5hHmfn4zRKM_wTvfrsYD1zG5QAlOCV1f4rvn9NVqYE-TcOdCuCJ-XdqRXjhz9_ezvYFwz3Q2Tazo4OkSz2Sicf_3So_Lsekuhk2XeyYTjUeAsQpaAakuB01ZNJ0E-oJsFaCDXETjgELbxB4jPDSp0sC9FHuGoKRXUQ5MalCyWXRelOiCUld5XvikiyHlGj49CdOZhJvdJ_kkqxE6yFQmgFcJndblPT75YkBD08pzJePmEu2OwHVlv5E7dhVSp3kICS8Y-BMiS6I3vHO33BG3SS4ogAQO6fn0HzJ7yFA:1u3XKr:sYIxE_pBQBZj1pEmtCsAUywABJ3zazJIg6XIoYr35lU','2025-04-26 09:39:37.651487'),('3v8vzabwoaf48w9j8j2ns7ld615ykkuy','.eJy9l92umzAMgN8lt-sEBBJCdbQXabuKkVRDbWlVYNJUnXefzeEvJOnYEezGStLY_mycOH2S-nE5ntVvsn2SAEV2k6ok2x255GVFNiSVEqSSOU6kupDDBnWaLd4pfSgvSx-414Pf-wXQ0uao7-38r8nhy3gZ7HWrh_cNoZ8DkOquA8CCBgDzEYC2PhB4DUJoQ2icG27rUk0Cx5VxpGgw-lxMKHTjKLSoUFjDQjGNiznj2ryOEkX2U2XnCcn9_rj9Ut7uuzd13eym1rV2NwJxE8jwnRbFrUorhRqgclePa16W-a04TiPBHPbxYHbB1lUV9Udp754kl2QbbEiVVxdFtmRfixPnKAXI6KSCfc19ftrX8Y8UxnHkc9LgwGajzO-5PKLBor5cWj-t_Wb8dycilNm-ZiFj5H3zAUfnwDGRKJA09U24tjY6tmApsHAOGIwBjLMwMcGaGn3Li2qby29rEEazUkepv68TziOTEA_LmoBsDJj4SoBkKGcV3uh6cxQeNeBcTixwfA6cs_CGq7ZjY0uBxXPAnIXX3fndd10FUczKnavy2vazKmEyJowZBQ1OwxjGXES6paEAkTmAPUJwMWEeNz1HNUYG73y_lggC3xUCo6iSBJHEceiPzVqwh3LAmX7UkxX5bW1HhsnM0z9-CDgSHrruJsOLDc_WeAxF5_kfvUr6azNYjM3WewxF5xXQP5Caj46zySlbkNTWg8wsum6C7sX2H0C1XsROgoFsao_TOHGZsuD2b0JHUbKXlJpLCyWflc7eiK0o2wfqW1k94HYt9XyyxUhjSz5DCepcCvGv-aSrJVTrVC7AlwltAe35jBcDTVxfPlYSSxrUJ3DDvwRn7vhLpMGyjoT_R6BTHIs8Oxfptc0dDZrmgj9AA4fj-P4H5kG9dw:1u8E4M:hzu3D_aSkJgP1X15ItvtHWJ4wnRttFIPh27fWHFRUWE','2025-05-09 08:05:58.033207'),('4ar56m9ldz9t1y2ohducjk5vp501xd4s','.eJzFWE2PszYQ_isrX5vdgME2RK96aKue2kulnpZt5GBnly6BiI9K1Wr_ez1AAhhD2CS8vThgz8czj4cZOx-ozOLtu_wXbT6QDUOYCpmjzTOKo7xAK8SFUKMUEbwIGaOXFehUIus9z-Q65BnIrtX6eUJp9d5Bf_1sPfovP3Snlb3T7MvnCuHrAAh57ANQEz0A6r0DoDffIlhXEBwThMr5wG2ZSy1wmOlGCgbd62KCoW8chl5UMBjDgkGPi4zGtZqOEobwTYbvGpLjMUv_kevnv9a660oaG-caaQBEh4AGvnmSpAUvJGgolaPMDlGeR2myPSs2IdSEApOrs62DTMo6tZ8_UCTQxl6hIipiiTYoKL09pTB6anT30g5KatF9ULIdV8_MtSiq4CjhQZofI7EFg0kZx42fxn71fNmJ54gwKIlDCPpc1eDwHHDE86UaMbeG4JrcOGGz7wXMmQNMPStglDj-EFiVo9-ipNhE4sclELqzqMPYCkqfUneIED6WJQGSLkDfkp4aCYyzEq9T3kYSDw_AjTkxgKNzwI0mXltqT9jIvYCxOcBGE-9U80_7ughEbxZ3Y5nXtJ9FEfpdhIxgpUGxw9Qz9dy-pTYBAbOtZDyPehrmbtMbyUZ3gHe-X0MEtjUWAsGg4tuugGfH6po1wG7TAd76n7q_IH5T2xGOP_Pr7x4ERgh3xmrTwIsJnqnxDBRHv__OqeRcNu27YTP1noHiaAk4H5CqTYc37Su7I1JTDxqyOFYJTie27wC014vI3iNqrHKPYuaPmTLAPZ8JR5KSTKLsuTSgpLPoPBsxJWVzQP2WF5mqrnmfT3I3pMzApyOUOhWe91U-8WKE9jrVGMBJQhuAZj7Z3YD6YzvPpICUVuoauPaWMModnYTUWu5DgvuI6hTbJArfE35ouMN21VxgQTXw6nPc8rJ421ZT4A0Bws7cjofvMoEF8TdPXtOnME2KLNo9gchTs5o__a7uNPFPjWzPwBvP35Q2D_e2HzJMmMuIFbqcUGxThZ5Qxi3uCsJ2TDDJJWUeF9Yee1gw4khC_H1YFZ0t0KAuTuj5I0AQU4A2DwH6VfEYoJV6ihS2ek5x-7Dnj2GUhXGzeACEOSz31X_mWZTs03yGCbVx9dqai0OUnI_goL-uRVQ7-XNKCtpNLbmD3hNm5WFnADUjps_VwzVxqMRQk6pGw6ptWVi384s6FGeForq4mhJxNnGBlY7gcsTMD0jnxtFNgferWamGaT7qkrAYE3Pg6xy4upHf0lf4rq-mIa71LzBxklqOjJlx6HwQfcLWDf-hiuIN9ShQvVZaVgClnbOgqep1WQ_qa80V1GcK1Brq5zjvrchM0mcEqnNze3A6_czggjLXCeCsSmpPoXstY_Cv3WuWlscLtLVyi3L35cB0tryLRm_Jr_Y_zhl0NYLfka8rsss3GK0u1M2N-ja-qqv85NmhL7YoV18OS-PKtgxGPV9g-MEM38hVlsYT3bMVWZSjL4ejc2TrCUZNXnbcrX5CG0qj60GFpI7nnTJ64DMHn_lbJGPxyOPiYoPp7rU5AMg5827AyX493cFbkZm7cZ-gLyT1VKD6Pg1OfqPlNj8ZyR_D9HWCsgttpCPzv5M2K1CdMlefwJ8v6PM_Fww06g:1u8cVO:1bOGWEV0dG66WciMS6P8RMZ4TN3WkaMGZBfYJlxAElw','2025-05-10 10:11:30.319592'),('4jpv2ko6ytqi7p18o5ieie4ci6yobpc5','.eJxVjEEOgjAQRe_StWlo7XTApXvOQIaZqUVNSSisjHdXEha6_e-9_zIDbWsetqrLMIm5GGdOv9tI_NCyA7lTuc2W57Iu02h3xR602n4WfV4P9-8gU83fmji5jtEDBoSGA0H0LqIKRKSGggCOKKikEVuSJvnWC8JZAbrEMZj3B9o7N7Y:1u34wI:pQTdurFsCMikjElvZBSjwMf1OxgV-YkWHSUDueOvD_A','2025-04-25 03:20:22.620533'),('4mzg7dxopvgcb062ntc8qx7cwk2qym9m','.eJzFWVtvqzgQ_isVz2kBg22ojvZh38_LkfapqSoHm4YtgYjLSqsq_31nIA03O6EtnH0x4LFnvvk89ozFu_Ui6mr_UpeqeEmk9Wi51qbftxPRm8pQIP8W2Wv-EOVZVSS7BxzycJaWDz9zqdI_z2MHCvai3MNsEcVuGHFCuc-pE_mCMuIyriRlXDjCl5TvuORKKMYDIZ2YBERy6ilKwzhiPio9qKwuQdfT-9bKxEFtrce7rfULQGytDbwlgK3ti0VxF4v7KCmiVLXCAyIsUTycvt3WvnIceIBxDo_AkxE8qEcpfgUsmKG9LtJWZgt5SDK7AFA24rVbuZDyL-MQEJ6H7QolZFTUh50G6QxHT5u7hZ07PaNYJRKlruMQjQnGfQ8eIaOtpcj_KmNHVRxei7w-3qCtG7cqd592bMyWd1Ppd-ILWUjKMsmzGXSdB_5Gvr4QXb5GKackQN3E49_kC8-jJIvzG2xdhq3K1afdGnNFNUqDUBJ8EE6-yVWRp-oGT82QVTn6tDtjjti4w9VZ2Qm_eUQuHo1-gCck84LgI6InNku0We4Tlcp7kVY3E0x_rfUOYMzpVwMzaROS5tXohsxcjWWcvhHU1xwdL0ug06U9bssPJeV9lL9eoexGGumN-d9Jm-XomLJw3MFPz1AkARcvb-pf6_EdKjloIohKqJmerDQpK5CDs9AqmeAHBKz13MxphtiwRsqORIFjbZBfOpCi_jfOt38kWfWYyD_6AtDY9T-fNhb5GgipjkMQ0DEAAd8DEANJH4XdwPB0MBoAE9PI-dA29nTGmvRw9s7_mnfYDE1gM_APm84mfg2cxObi5UWKkKjR0811v7GJ9ip6G6E6Hov8H2X_KKsC-CxHIJoZRNvXm4HA2BTYBIPIsrwSlcIZMAWr4zaan94tvJ24G6tKqlTBJQC2YcwYtgG0fqxc2IMOi2E_7QS8c99h7X6AwZPIPiayue5kdZqe7Zz1N--3jTSFdFNHw5ZuwZE54GgQKmiJcKbgzgHwgc1dCpg3Bxi8AzBGvXAKbLzdF0foz6KOEAeLy-YyOEI4OHdWAEj7AENHBdBSbGcFXu80MwQemYAzGdGAY3PAGQOvO1k_sNGlgPE5wIyBpzviF4cYzOLOFHmTXLMCwrCPsCmw2vqq5izwh5q6AETMLm9r5hHmfn4zRKM_wTvfrsYD1zG5QAlOCV1f4rvn9NVqYE-TcOdCuCJ-XdqRXjhz9_ezvYFwz3Q2Tazo4OkSz2Sicf_3So_Lsekuhk2XeyYTjUeAsQpaAakuB01ZNJ0E-oJsFaCDXETjgELbxB4jPDSp0sC9FHuGoKRXUQ5MalCyWXRelOiCUld5XvikiyHlGj49CdOZhJvdJ_kkqxE6yFQmgFcJndblPT75YkBD08pzJePmEu2OwHVlv5E7dhVSp3kICS8Y-BMiS6I3vHO33BG3SS4ogAQO6fn0HzJ7yFA:1u3rGT:auA6sjSs4bjDcZa4kg8N6wCeicwzULC17nN6o-sZtzE','2025-04-27 06:56:25.055401'),('83j56tuhnjmhe21rcepno0oxs1o6gp0m','.eJzFWVtvqzgQ_isVz2kBg22ojvZh38_LkfapqSoHm4YtgYjLSqsq_31nIA03O6EtnH0x4LFnvvk89ozFu_Ui6mr_UpeqeEmk9Wi51qbftxPRm8pQIP8W2Wv-EOVZVSS7BxzycJaWDz9zqdI_z2MHCvai3MNsEcVuGHFCuc-pE_mCMuIyriRlXDjCl5TvuORKKMYDIZ2YBERy6ilKwzhiPio9qKwuQdfT-9bKxEFtrce7rfULQGytDbwlgK3ti0VxF4v7KCmiVLXCAyIsUTycvt3WvnIceIBxDo_AkxE8qEcpfgUsmKG9LtJWZgt5SDK7AFA24rVbuZDyL-MQEJ6H7QolZFTUh50G6QxHT5u7hZ07PaNYJRKlruMQjQnGfQ8eIaOtpcj_KmNHVRxei7w-3qCtG7cqd592bMyWd1Ppd-ILWUjKMsmzGXSdB_5Gvr4QXb5GKackQN3E49_kC8-jJIvzG2xdhq3K1afdGnNFNUqDUBJ8EE6-yVWRp-oGT82QVTn6tDtjjti4w9VZ2Qm_eUQuHo1-gCck84LgI6InNku0We4Tlcp7kVY3E0x_rfUOYMzpVwMzaROS5tXohsxcjWWcvhHU1xwdL0ug06U9bssPJeV9lL9eoexGGumN-d9Jm-XomLJw3MFPz1AkARcvb-pf6_EdKjloIohKqJmerDQpK5CDs9AqmeAHBKz13MxphtiwRsqORIFjbZBfOpCi_jfOt38kWfWYyD_6AtDY9T-fNhb5GgipjkMQ0DEAAd8DEANJH4XdwPB0MBoAE9PI-dA29nTGmvRw9s7_mnfYDE1gM_APm84mfg2cxObi5UWKkKjR0811v7GJ9ip6G6E6Hov8H2X_KKsC-CxHIJoZRNvXm4HA2BTYBIPIsrwSlcIZMAWr4zaan94tvJ24G6tKqlTBJQC2YcwYtgG0fqxc2IMOi2E_7QS8c99h7X6AwZPIPiayue5kdZqe7Zz1N--3jTSFdFNHw5ZuwZE54GgQKmiJcKbgzgHwgc1dCpg3Bxi8AzBGvXAKbLzdF0foz6KOEAeLy-YyOEI4OHdWAEj7AENHBdBSbGcFXu80MwQemYAzGdGAY3PAGQOvO1k_sNGlgPE5wIyBpzviF4cYzOLOFHmTXLMCwrCPsCmw2vqq5izwh5q6AETMLm9r5hHmfn4zRKM_wTvfrsYD1zG5QAlOCV1f4rvn9NVqYE-TcOdCuCJ-XdqRXjhz9_ezvYFwz3Q2Tazo4OkSz2Sicf_3So_Lsekuhk2XeyYTjUeAsQpaAakuB01ZNJ0E-oJsFaCDXETjgELbxB4jPDSp0sC9FHuGoKRXUQ5MalCyWXRelOiCUld5XvikiyHlGj49CdOZhJvdJ_kkqxE6yFQmgFcJndblPT75YkBD08pzJePmEu2OwHVlv5E7dhVSp3kICS8Y-BMiS6I3vHO33BG3SS4ogAQO6fn0HzJ7yFA:1u3rON:3YOoFoXy50efJYdpeh1rClCahQaWkdB8jNA9DQ3SLdY','2025-04-27 07:04:35.594988'),('aqh3rgs4ljkwyhaz0et44882cgxtbo1t','.eJzFV0tv4zYQ_isBr3WiJx8yij20RU_bS4GeIq9Bk1SsRpYMPQoUgf97h7ISWTQlK_a6eyElch7ffDMcSm-oKbP1q_oXLd-QpwdRSFWh5TPK0qpGq4UWaN-dhJfKEbzUGw5aHRbIn6Eg1b5XCGYoNJU6cRHO0NBDr4HPNRZIyVRPp29WM2KrxKsDIv0S3-_L4h_lPH9zVj8Nt1pp37rWSa8OgGivyl1aVWmRr624AMlO5c0xDc9vKJVo6S1QndaZQksUNywhRI8MxjBRXtwQlyRxQzccnmnoEtQGA8JGlsB5KtfaYN5kWeens98-X3bCAiniBgcYo8PiCA6fgotcxWDEepwF7qMiRsH5Z-DGnFjARafgKPZBg_gBhWfCwqGlHiLY8D2QYYwwA25fj6N4wzO88_1aIvBsyZdBNJPf_jiMAg7Gsn_mxQZvkH6cMAxjC4b4NBozZQH5cdhGUOJJlAOXFpRkDom9EQu-95P_c1WXy1RWX06xevi7IaUWPgMJ6kQy9lk-_bsRygYwRwBOEtoBtPNJbwaqOzoc1nWeitec77TiV9StQdNpy37Nm3q7bpe0I7jzBmsbLl5Vrjfk3zx_KZ5EkddlunnSIk_dbvX0B7Tx7JdOdmBgy6staHOReJGgPqYhxa4IOSa-R6iSmFDu8lBiuqGSKq4IZVy6ic98SXGgMI4SQUJtVDMAdwV6fouRDidGy4cY_Q48xmgBTylgO64Btw8JfxRpKbJuc6cRVnp7qP4rL9M8KaoZJiB7xz2Hy12af9wsWt85inAp_5qSgv1OcgPHSYqy2W0soGbEdFg8XBMH1AQsqlTqXc91fdPOb2rPyxqorq-mRH6YuMDKieD9iJkfkMlNYJrS3q9mpR2m-WiH-zExB77JQWga-Vq86HN9NQ3ZUf8CE-9S9yNjZhwmH9hc8EzDf0JTvKEfxXCnKdeFCZohjbuGfuzo8fF77ArqSwDl6P45znsvMpP0GYGa3NwenEk_tbggNAxgigg-ehLhtYzpH5WXsmj2F2jr5e7K3acDM9liF43eUl_9b90MujrB_5GvK6orshht_2S6X5nb-NL9Z_rbYSh2V64-HZbBledajLJI-nryqX8jV2WRTdyevchdOfp0OCZHnllgxOZlw8N2Ep5ujSHTHZIEjL1X9JnPSvustqnK5CPP6osXzGmu7QHomrNnQ3_ZO9M3eC8yMxvfJ-gLRT0VqJmnsy-_0XZbvRupHkXxMkHZhWvkROaHkzYrUJOy0FzwDyt0-A_PoKTN:1u8wjH:Xo0BE2LwBRgvaAA6fTGr28SHFIdTA5pm63XOdP2lkiA','2025-05-11 07:47:11.120718'),('gbuh6yaz19wf2fgj95c10g6qfbqatlf6','.eJy1l--OmzAMwN8ln5GAQEJAp73I9VQxkmqoHK1amDRVfffZXAsJSTp2gi9W_tn-2TVxeiP9pdkf1R9S3EiMojpJdSXFO2nqa0cCUkoJUskaJ1I15CNAneFIeCgvKqzKC54NYX9cAC1jjvrhW912RS1_6BtgcVr_uAeEfg9CqrMJAQsGBMwNCGNHpwgHjMSFMQBYrvurmiUAVyZnOHtGl34vOhSmCxRGfCgmnzgzgkQxRjnuIhLzRhq8jhtF9UtVxxnV-Xw5_Vbh27W7QD6vM4hBgzrXNA0E4zaYxVC27akrO4UaoPKp2v6rmt9vpJakiAPS1V2jSEF2vThwjlKATA8q3vU84oddn_0sYZylESeDfThsVfa5lns02PZN8_DzsD-M_-1EJLLa9SxhjNyDLzi6BI6JXIGkZWTDPQrgyRavBZYsAYMxgHGW5DbY_HNfnTBdlDpKo12fc57ahMa9swEg0wHzSAmQDOWiwtNuM0_hUQvO58QBx5fAeQtvulmfbGwtsGwJmLfwXFf86ohiUe58lWf1mg0Ic50wYxQ0OE0yGHORmpamAkTmGM4IwcWMWe9vnmpMLd7lfh0RxJEvBEZRJY9TieMk0s06sO0mPIWQb8jvajsyyRd-_Xq39yQ88d1NlhcXnqvxWIre7197eozXZrwam6v3WIreK8D7CtqA1NWD7Cz6bgL3g2wTUKMXsYNgIIfa4zTLfaYcuONjz1OU7CWl4dJByRelczTiKkrXy3PMJ1uNNHPkM5GgzqUQ_5tPullCjU7lA3yZUPtdruUzWw009_3ymZJY0qA-g5ue_d7c8ZdIk2UTCf9gQKfYt3V1bMvPR-5oPDQX3IAGDu35_he1DsAE:1u3B2l:2l-JJBc4VoC8nDG_4qHKLzMgftSnDnMXUE4NGw2GsLE','2025-04-25 09:51:27.175952'),('i7vyz8nrwekeazcscniw4243cdpzcr5a','.eJzFWUFvrDYQ_isR124CGGxD9NRDW_XUXir1lKSRF5uEhoUVsJWqKP-9M8AuYAxLNsvrxYA9nvnm83g83n23nsWhen0-lKp4TqR1b7nWpt-3FdGbynBA_i2yl_wuyrOqSLZ3KHLXjpZ3v-dSpT-1sgMFr6J8hdkiit0w4oRyn1Mn8gVlxGVcScq4cIQvKd9yyZVQjAdCOjEJiOTUU5SGccR8VLpT2aEEXQ_vj1YmdurRur95tH4VBbxt4C0BbE1fLIqbWNxGSRGl7eAOEZY4PJz-syiSLM7LBSoORdqM2ULukswGEWVHzXy7ERFS_jknBeOt5LZQQkbFYbc1gFrg08fm5hI_Pp5wWCUSR13HIbqeX9ReFBVQXV1MiTypOMNKT3A9YpY7pHPj6arQ-sWs1M08H3WzHhNL4Osc-LqS3_IX3NcX05A2888wcZRaj4yFfuh8UL3D1RX_AUnxC_no8fHgK8eBByRDDo_AkxE8qEcpfgUsuID6AkDZmD-nee9EFpK-wFGdm687p9PPDSYY9z14hIw2liL_Usb2qti9FPlhf4a2Tm5V7j7tmM5WcFbpV-ILWUjKMsmzBXS1gt-RrwuiKzQo5ZQEqJt4_It8Yf6Zrx2GYqty9Wm3NK5cx6A0CCXBB-Hki1wVeTpzenYiq3L0aXd0jlw9wJjJylb49SNyMTX6AWZI5gXBMaJHNku0Wb4mKpW3Iq3OHjD9tTY7gDFnXg2s7O35E7wTWbga13H6TFDPOaqv06jym0y35VFJeRvlLzOUnTlGejL_O2mLHNUp8_UO8vEElzbg4vlN_Wvdv8PNEpoIohLucA9WmpQVjIOz0CqZ4AcErPVUz6lFTlcnlLVh_NSBFPW_cb794NyGTz_0u0HfsffpY2ORywDALWUIAK8tfQDw3QMw6O8Q2DUEzwShNj4yi1wP7WJP31NU6F_mEzZD5dgMvMLG6BY2ul900q_NvJfYRK8qetOQ7PdF_o-yH_6yddO1NDH2tdIIiI0BjWyLLMsrUSmcAVO6quRZ9wQ5PPmD7IIuLJWb0H54t_CnE3djVUmVKuvegj0ZM4ZtAK0fKxc2pMNi2FxbAe_cd1izOUB4FOb7RNa_xWSHNG3ttPrr9_NG6qq6LqphfzfgyBJwNAgVtEQ4Y3BtbByxudcC5i0BBu8AjFEvHAOrY_RbklX3ifxxDYT-IuoIcbDSrH-p0hDiZlkTIO0DDB0VQEuxXRR4vfQ2EXhkBG7KiAEcWwJuMvC6VHvERq8FjC8BNhl4x5x_XNdVIAaLuJuKvPb4WRVh2EdYV1tNsXXgLPCHmroARMwubwpoDXP_0JuIRn-Ed7ldgweuM-UCJTgldH2J757TV2uA3YVDfWEbbPVwRfymY0d64cLd3y8EJgj3pnLTyIoJnungGU2c3P-9quSUNt2rYTOdPaOJkyngVCDVi45f2i67IlLTGTRmcSoTHCu27wB0cBbROKDQ1rHHCA-nVBngnmrCiaCksygHJg0o2SI6T0pMQdkWqN_KqoDsWg75pFdDyg18ehKmMwnXvE_ySVYjdHBSTQGcJbQFaOaTXw1oOLXyXMm4vlG7GrjuljDJHZuF1GkeQsL7CP5DmiXRG17AG-6IWx8uOAAHOGzHj_8AKa406g:1u92yE:yB7WOMFDkr3JSP3U5VcIXfLdd6NP-kqQifpL2Q0BKe4','2025-05-11 14:27:02.959534'),('lddnm0phryiebuk5fxu2grgz0fzurmty','.eJzFWUFvrDYQ_isR124CGGxD9NRDW_XUXir1lKSRF5uEhoUVsJWqKP-9M8AuYAxLNsvrxYA9nvnm83g83n23nsWhen0-lKp4TqR1b7nWpt-3FdGbynBA_i2yl_wuyrOqSLZ3KHLXjpZ3v-dSpT-1sgMFr6J8hdkiit0w4oRyn1Mn8gVlxGVcScq4cIQvKd9yyZVQjAdCOjEJiOTUU5SGccR8VLpT2aEEXQ_vj1YmdurRur95tH4VBbxt4C0BbE1fLIqbWNxGSRGl7eAOEZY4PJz-syiSLM7LBSoORdqM2ULukswGEWVHzXy7ERFS_jknBeOt5LZQQkbFYbc1gFrg08fm5hI_Pp5wWCUSR13HIbqeX9ReFBVQXV1MiTypOMNKT3A9YpY7pHPj6arQ-sWs1M08H3WzHhNL4Osc-LqS3_IX3NcX05A2888wcZRaj4yFfuh8UL3D1RX_AUnxC_no8fHgK8eBByRDDo_AkxE8qEcpfgUsuID6AkDZmD-nee9EFpK-wFGdm687p9PPDSYY9z14hIw2liL_Usb2qti9FPlhf4a2Tm5V7j7tmM5WcFbpV-ILWUjKMsmzBXS1gt-RrwuiKzQo5ZQEqJt4_It8Yf6Zrx2GYqty9Wm3NK5cx6A0CCXBB-Hki1wVeTpzenYiq3L0aXd0jlw9wJjJylb49SNyMTX6AWZI5gXBMaJHNku0Wb4mKpW3Iq3OHjD9tTY7gDFnXg2s7O35E7wTWbga13H6TFDPOaqv06jym0y35VFJeRvlLzOUnTlGejL_O2mLHNUp8_UO8vEElzbg4vlN_Wvdv8PNEpoIohLucA9WmpQVjIOz0CqZ4AcErPVUz6lFTlcnlLVh_NSBFPW_cb794NyGTz_0u0HfsffpY2ORywDALWUIAK8tfQDw3QMw6O8Q2DUEzwShNj4yi1wP7WJP31NU6F_mEzZD5dgMvMLG6BY2ul900q_NvJfYRK8qetOQ7PdF_o-yH_6yddO1NDH2tdIIiI0BjWyLLMsrUSmcAVO6quR5whOksmEXdGGp3IT2w7uFP524G6tKqlRZ9xbsyZgxbANo_Vi5sCEdFsPm2gp4577Dms0BwqMw3yey_i0mO6Rpa6fVX7-fN1JX1XVRDfu7AUeWgKNBqKAlwhmDa2PjiM29FjBvCTB4B2CMeuEYWB2j35Ksuk_kj2sg9BdRR4iDlWb9S5WGEDfLmgBpH2DoqABaiu2iwOult4nAIyNwU0YM4NgScJOB16XaIzZ6LWB8CbDJwDvm_OO6rgIxWMTdVOS1x8-qCMM-wrraaoqtA2eBP9TUBSBidnlTQGuY-4feRDT6I7zL7Ro8cJ0pFyjBKaHrS3z3nL5aA-wuHOoL22CrhyviNx070gsX7v5-ITBBuDeVm0ZWTPBMB89o4uT-71Ulp7TpXg2b6ewZTZxMAacCqV50_NJ22RWRms6gMYtTmeBYsX0HoIOziMYBhbaOPUZ4OKXKAPdUE04EJZ1FOTBpQMkW0XlSYgrKtkD9VlYFZNdyyCe9GlJu4NOTMJ1JuOZ9kk-yGqGDk2oK4CyhLUAzn_xqQMOpledKxvWN2tXAdbeESe7YLKRO8xAS3kfwH9Isid7wAt5wR9z6cMEBOMBhO378ByqvNOo:1u930O:NLQwLd2NGtlvDQgqMzQ8sXF8k5jl4tKmd-ERydd6zTg','2025-05-11 14:29:16.951438'),('lqyyf7blrpvh6304pghsoc5ztm6ff10u','.eJzFWU1zszYQ_isZzk4MAkngeaeHt52e2ktnekoyGRmJhDcYPIA77WTy37sLjgEhYeKY9iI-tNp99mG1u7LfnCdxqF-eDpUqn1LpbBzPWfXfbUX8qnKckD9E_lzcxUVel-n2DkXujrPV3e-FVNn3o-xAwYuoXmC1iBMvijmhPODUjQNBGfEYV5IyLlwRSMq3XHIlFOOhkG5CQiI59RWlURKzAJXuVH6oQNf924OTi516cDY3D86vooS7FdylgK19l4jyJhG3cVrG2XFyhwgrnB4u_1mUaZ4U1QwVhzJr59ZC7tJ8DSJqHbfr162IkPLPKSmYP0puSyVkXB52WwOoGT69r24u8eP9EadVKnHWc12i6_lF7UVZA9X1xZTIk4ozrPQElyNmvkM6N76uCq1fzEozTPPRDMsxMQe-zkGgK_mteMZ9fTENWbv-DBMfUsuRMdMPnQ-qv_B0xX9AUvxCPnp4OATKdeECyZDDJfRlDBfqU4pPIQsvoL4EUGvMn3beO5GZpM9wVOfm687p9HODCcYDHy4Ro62lOLiUsb0qd89lcdifoa2TW5S7TzumsxWeVfqV-EIW0qpKi3wGXUfB_5CvC6IrMijllISom_j8i3xh_pnuHYZii3L1abc0rjzXoDSMJMEL4eSLXJVFNlE9O5FFOfq0OzpHnh5gzGRlK4LmEnuYGoMQMyTzw_Ajokc2K7RZvaQqk7ciq88WmP63NjuAMWf-GtjZr6creCcy82tcx-kzQT3lqP6dRp2fNd1WH0qq27h4nqDsTBnpyfzvpM1yVKcs0F-Q90c4tAEXT6_qH2fzBidLGGKISjjD3TtZWtUwD87CqGSKDxCwzmOzphE5HZ1Qdg3zpxdIUf8Z16-_pXm9SeVP_QnQ2L1_fF855DIQcFIZgsCjSx8EPA9ADGb6KNYNDN8EowEwMo2cD23jm85YUx6O3gWXeYfD0AQOA_9w6Gzi08BJHE5enmYRErV6upr2G4f4RcWvGqr9viz-UutvVV0Cn5UGollBjO96KxAYGwMbYRB5XtSiVrgClmB33Ebz_ZuDv5Z4K6dO60w5Gwe2YcIYjiGMQaI82IMuS2A_bQXc88Bl7X4A4VFk71PZ_PySH7LsaOeov7k_b6RppJs-GrZ0C47MAUfDSMFIhDsGdwyAD2zetYD5c4DBPQBj1I_GwPTtfnWEwSzqCHGxuWx-nNIQDvLOAgBpH2DkqhBGiuOswOtlM0vgkRE4mxEDODYHnDXwusz6gY1eCxifA8waeKYUf3WI4SzubJE3qjULIIz6CJsGq-2vDpyFwVBTF4CI2eNtz6xh7tc3SzQGI7zz7Ro88FybC5TgksgLJN77bl-tAfa4CHcuRAviN5Ud6Uczd3-_2lsI9225aWTFBM9UeEYLrfu_13qc0qZ3NWym2jNaaE0B1i5oAaSmGjRm0ZYJzA3ZIkAHtYgmIYWxiT1GeGRTZYB7avYsQUknUQ5MGlCyWXSelJiC0tR5nvikV0PKDXz6EpYzCSe7T_JJFiN0UKlsACcJHfflPT751YBGti_PlUyaQ7Sngevafit3bBJSp3kICQ8Y-KdonsaveOaGhX8fRO4cX0P5huL8_i-FhTeS:1u4DKH:zg8AwZqO133aM_GzKliHX7So4lsr9OOjAovkW0wOJsA','2025-04-28 06:29:49.060937'),('qd0vcu99wz4qayu4anb7z4enlyc8s47w','.eJy9l-GOmzAMgN8lf8cEBBJCddqLtF3FSKqhtrQqMGmq7t1nc1AISTp2gv2xkjS2PxsnTh-kuZ8PJ_WbbB4kRJFfparIZkvORVUTj2RSglSywIlUZ7L3UKfd4h-zu_Lz7I57ffj9uQBa2hz1_W3wNd1_GS-DvX51_-4R-jkAqW46ACxoADAfAWjrA4HfIkQ2hNa54bap1CRwXBlHigbjz8WEQjeOQosKhTUsFNO4mDMu73WUKPKfKj9NSG63-_WX8rff_anrdje1rnW7EYibQIbvrCyvdVYr1ACVm7pfiqoqruVhTkIvqmw-Snv7IIUkm9AjdVGfFdmQXSOOnKMUIOOjCncND_hx1yQ_MhgnccBJiwObjTK_FfKABsvmfO78dPbb8d-diEjmu4ZFjJF37wOOzoFjIlUgaRaYcF1t9GzhUmDRHDAYAxhnUWqCtTX6VpT1ppDf1iCMZ6WO0mDXpJzHJiEeljUB2RgwDZQAyVDOKrzR9eYoPGrAuZxY4PgcOGfhDVdtz8aWAkvmgDkLr7_z---6CqKYlTtX5XXtZ1XCdEyYMAoanEYJjLmIdUtDASJzCHuE4GLCPG56jmqMDd75fi0RhIErBEZRJQ1jieMoGJu1YA_lgDP9qKcr8tvajozSmad__BBwJDxy3U2GFxuerfEYis7zP3qVPK_NcDE2W-8xFJ1XwPOB1H50nE1O2YKkth5kZtF1E_Qvtv8AqvUidhQMZFt7nCapy5QF9_kmdBQle0mpubRQ8lnpfBqxFWX3QH2r6jvcrpWeT7YYaWLJZyRBnUsh_jWfdLWEap3KBfgyoR2gPZ_JYqCp68snSmJJg_oEbviX4Mwdf4k0WNaR8P8IdIpDWeSnMrt0uaNh21zwB2jgcBzf_wDlpb13:1u8ZW9:SL-tWKcAeLjxeHf_XTJq0PYULoFa4S8zEXFRhs2rG5c','2025-05-10 07:00:05.305628'),('x78fte7nxykutgv90f637rx864iakfy8','.eJzFVUtzmzAQ_isZnYkBgR54Oj303ktnegoZj5CErQaDh8eh4_F_rxZwHGMSSOw0Fz12V7vffruS9qgps9WT_ouWe-TDIAulK7R8QJmpauQgoZQdtTKwUTpDjw6caU3cVJTalaIEW9fqnwX21NkezrvfTF4vjfr-UmE9nuSPh4ODtjpvOkQPe2QUWvoOqk2dabREccNTSmHkdgxT7ccN9WgaNywRds1Cj6IWnzW-QLczagUO8ybL-ji9_3Y9HYQHSsYNCQhBB6cDh-eAIzzSdsTCuwTXM3XE5t8KWDAHmF1bYJQE0SWwYclujjCcRR3GXtxElIaXCM9655YAocUrXa5yI59yse0OEuxz1CuU3rWlX4mm3qxaEUSzN-hMlgj5pHNQqD8iXxcLWeR1aZIFmCx6bbX4aa9c9qO3PXOwEdXGnhYy9SPJMGEhI54MBaHYp0wrQpnwRKgIS5hiWmjKuFBeijlWjASakCiVLXUroMFeWvSwjxHkFKPlXYx-WRAxcuzKWGydzNJ7l4p7aUqZ6U65BYQVqM-Px5ZD7Xl2ssFZ3LPY0Qg7TvkM77asnc4Vamtyt7SgXMDrdnp7RX6_agL3pzNLSi2ULJttMoJ0RqIH5-7GydlGskJtFGh9z8MjISgLgxg6nHSRZPhRxna63K7LotlN0Hay-1Tu3p3YkK1g0uk1_QUsmKoyRT6Drt7wP_L1ge4KR5wygjn4xgG7ki94j0yeFhNsPZt9KlfvTmvIFRlxyiOFYcIMX8lVWWR6gqfW5FM5enc6Q47oUOCPRUlE2E7Sh6cx5PBC0oDzY0dfxKwgZrUxOlP3IqsnP5iXtR5PAHpuvBrwk7Yt-Xo1TiYzq3GbpCea-q1Eh2XhY75Gn9vq6KS6l8X6DcomvpEXNl9O2qxEh5RFQwE7PKLDP_3ZDHE:1u3r47:8twcDsR9gknxhd4P-xW8jF0U616DygGysgHyFxajGMA','2025-04-27 06:43:39.157616'),('xkryxr0p2z5e6qfrnjby5rhq5q41w872','e30:1uHC9w:NhjEJs2uA_NfT-4-9fYKbwINBSWmmcNUMXm914rcUoM','2025-06-03 01:52:48.539796');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fare_carinfo`
--

DROP TABLE IF EXISTS `fare_carinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fare_carinfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `plate_number` varchar(7) NOT NULL,
  `driver` varchar(10) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `remarks` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `plate_number` (`plate_number`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fare_carinfo`
--

LOCK TABLES `fare_carinfo` WRITE;
/*!40000 ALTER TABLE `fare_carinfo` DISABLE KEYS */;
INSERT INTO `fare_carinfo` VALUES (3,'豫G9996','白娘子',10.00,'测试数据'),(5,'豫G9999·','张三丰',5.00,'测试数据'),(6,'豫G123','孙悟空',5.00,'测试数据');
/*!40000 ALTER TABLE `fare_carinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fare_department`
--

DROP TABLE IF EXISTS `fare_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fare_department` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dep_name` varchar(32) NOT NULL,
  `dep_script` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dep_name` (`dep_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fare_department`
--

LOCK TABLES `fare_department` WRITE;
/*!40000 ALTER TABLE `fare_department` DISABLE KEYS */;
INSERT INTO `fare_department` VALUES (2,'宣传部---测试','测试数据'),(3,'开发部','测试数据');
/*!40000 ALTER TABLE `fare_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fare_fare`
--

DROP TABLE IF EXISTS `fare_fare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fare_fare` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `passenger` varchar(32) NOT NULL,
  `driver` varchar(10) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `distance` int(11) NOT NULL,
  `fare` decimal(8,2) NOT NULL,
  `derve_date` date DEFAULT NULL,
  `remarks` varchar(100) NOT NULL,
  `operator` varchar(32) NOT NULL,
  `approve_date` date DEFAULT NULL,
  `approve_status` varchar(1) DEFAULT NULL,
  `car_id` bigint(20) NOT NULL,
  `dep_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fare_fare_car_id_90f9a793_fk_fare_carinfo_id` (`car_id`),
  KEY `fare_fare_dep_id_c6754c84_fk_fare_department_id` (`dep_id`),
  CONSTRAINT `fare_fare_car_id_90f9a793_fk_fare_carinfo_id` FOREIGN KEY (`car_id`) REFERENCES `fare_carinfo` (`id`),
  CONSTRAINT `fare_fare_dep_id_c6754c84_fk_fare_department_id` FOREIGN KEY (`dep_id`) REFERENCES `fare_department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fare_fare`
--

LOCK TABLES `fare_fare` WRITE;
/*!40000 ALTER TABLE `fare_fare` DISABLE KEYS */;
INSERT INTO `fare_fare` VALUES (1,'C','张无忌',3.00,6,18.00,'2025-04-14','测试数据','刘','2025-04-26','0',3,2),(2,'A','张无忌',300.00,6,1800.00,'2025-04-14','测试数据','刘','2025-04-17','1',3,2),(3,'A','张无忌',300.00,6,1800.00,'2025-04-14','测试数据','刘','2025-04-17','1',3,2),(7,'C','张无忌',300.00,6,1800.00,'2025-04-14','测试数据','刘','2025-04-15','1',3,3),(8,'小明','张三丰',5.00,10,50.00,'2025-04-14','测试数据','刘','2025-04-17','1',5,3),(9,'张飞','孙悟空',5.00,10,50.00,'2025-04-15','测试数据','刘','2025-04-17','1',6,3),(10,'许仙','白娘子',10.00,10,100.00,'2025-04-15','测试数据','张','2025-04-17','1',3,2);
/*!40000 ALTER TABLE `fare_fare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fare_loguser`
--

DROP TABLE IF EXISTS `fare_loguser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fare_loguser` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `head_img` varchar(100) DEFAULT NULL,
  `dep_id` bigint(20) DEFAULT NULL,
  `user_obj_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_obj_id` (`user_obj_id`),
  KEY `fare_loguser_dep_id_32d464ca_fk_fare_department_id` (`dep_id`),
  CONSTRAINT `fare_loguser_dep_id_32d464ca_fk_fare_department_id` FOREIGN KEY (`dep_id`) REFERENCES `fare_department` (`id`),
  CONSTRAINT `fare_loguser_user_obj_id_efca87a7_fk_rbac_userinfo_id` FOREIGN KEY (`user_obj_id`) REFERENCES `rbac_userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fare_loguser`
--

LOCK TABLES `fare_loguser` WRITE;
/*!40000 ALTER TABLE `fare_loguser` DISABLE KEYS */;
INSERT INTO `fare_loguser` VALUES (3,'',3,2),(5,'',3,3),(6,'',2,5),(7,'headimgage/30.jpg',3,6);
/*!40000 ALTER TABLE `fare_loguser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_menu`
--

DROP TABLE IF EXISTS `rbac_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rbac_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_menu`
--

LOCK TABLES `rbac_menu` WRITE;
/*!40000 ALTER TABLE `rbac_menu` DISABLE KEYS */;
INSERT INTO `rbac_menu` VALUES (4,'用户的部门管理菜单'),(3,'车费信息菜单'),(5,'车费审批菜单'),(6,'车费统计菜单'),(1,'车辆信息菜单'),(2,'部门信息菜单');
/*!40000 ALTER TABLE `rbac_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_permgroup`
--

DROP TABLE IF EXISTS `rbac_permgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rbac_permgroup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rbac_permgroup_menu_id_1483037e` (`menu_id`),
  CONSTRAINT `rbac_permgroup_menu_id_1483037e_fk_rbac_menu_id` FOREIGN KEY (`menu_id`) REFERENCES `rbac_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_permgroup`
--

LOCK TABLES `rbac_permgroup` WRITE;
/*!40000 ALTER TABLE `rbac_permgroup` DISABLE KEYS */;
INSERT INTO `rbac_permgroup` VALUES (1,'carinfo组',1),(2,'department组',2),(3,'loguser组',4),(4,'fare组',3),(5,'fare车费审批组',5),(6,'车费统计组',6);
/*!40000 ALTER TABLE `rbac_permgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_permission`
--

DROP TABLE IF EXISTS `rbac_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rbac_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `url` varchar(32) NOT NULL,
  `perm_code` varchar(32) NOT NULL,
  `perm_group_id` bigint(20) NOT NULL,
  `pid_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  UNIQUE KEY `url` (`url`),
  KEY `rbac_permission_perm_group_id_4b19e4a0_fk_rbac_permgroup_id` (`perm_group_id`),
  KEY `rbac_permission_pid_id_6939354d_fk_rbac_permission_id` (`pid_id`),
  CONSTRAINT `rbac_permission_perm_group_id_4b19e4a0_fk_rbac_permgroup_id` FOREIGN KEY (`perm_group_id`) REFERENCES `rbac_permgroup` (`id`),
  CONSTRAINT `rbac_permission_pid_id_6939354d_fk_rbac_permission_id` FOREIGN KEY (`pid_id`) REFERENCES `rbac_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_permission`
--

LOCK TABLES `rbac_permission` WRITE;
/*!40000 ALTER TABLE `rbac_permission` DISABLE KEYS */;
INSERT INTO `rbac_permission` VALUES (1,'车辆信息管理','/fare/carlist/','list',1,NULL),(2,'车辆信息增加','/fare/caradd/','add',1,1),(3,'车辆信息修改','/fare/caredit/<int:id>','edit',1,1),(4,'车辆信息删除','/fare/cardel/<int:id>','del',1,1),(5,'部门信息管理','/fare/deplist/','list',2,NULL),(6,'部门信息增加','/fare/depadd/','add',2,5),(7,'部门信息修改','/fare/depedit/<int:id>/','edit',2,5),(8,'部门信息删除','/fare/depdel/<int:id>/','del',2,5),(9,'用户的部门管理列表','/fare/userlist/','list',3,NULL),(10,'用户分配到部门','/fare/useredit/<int:userid>','edit',3,9),(11,'车费信息管理','/fare/farelist/','list',4,NULL),(12,'车费信息增加','/fare/fareadd/','add',4,11),(13,'车费信息修改','/fare/fareedit/<int:fareid>/','edit',4,11),(14,'车费信息删除','/fare/faredel/<int:fareid>/','del',4,11),(15,'待审批车费信息','/fare/farecheck/','list',5,NULL),(16,'车费信息审批','/fare/fareapprove/<str:ids>/','edit',5,15),(17,'待取消车费信息','/fare/farecheck2/','list',5,NULL),(18,'取消车费审批','/fare/farecheck2/<str:ids>/','edit',5,17),(19,'车费统计','/fare/annotate/','list',6,NULL);
/*!40000 ALTER TABLE `rbac_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_role`
--

DROP TABLE IF EXISTS `rbac_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rbac_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(300) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_role`
--

LOCK TABLES `rbac_role` WRITE;
/*!40000 ALTER TABLE `rbac_role` DISABLE KEYS */;
INSERT INTO `rbac_role` VALUES (2,'普通用户'),(1,'超级管理员');
/*!40000 ALTER TABLE `rbac_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_role_permissions`
--

DROP TABLE IF EXISTS `rbac_role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rbac_role_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rbac_role_permissions_role_id_permission_id_d01303da_uniq` (`role_id`,`permission_id`),
  KEY `rbac_role_permission_permission_id_f5e1e866_fk_rbac_perm` (`permission_id`),
  CONSTRAINT `rbac_role_permission_permission_id_f5e1e866_fk_rbac_perm` FOREIGN KEY (`permission_id`) REFERENCES `rbac_permission` (`id`),
  CONSTRAINT `rbac_role_permissions_role_id_d10416cb_fk_rbac_role_id` FOREIGN KEY (`role_id`) REFERENCES `rbac_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_role_permissions`
--

LOCK TABLES `rbac_role_permissions` WRITE;
/*!40000 ALTER TABLE `rbac_role_permissions` DISABLE KEYS */;
INSERT INTO `rbac_role_permissions` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15),(16,1,16),(17,1,17),(18,1,18),(19,1,19),(20,2,1),(25,2,5),(26,2,9),(27,2,11),(29,2,15),(30,2,16),(28,2,17),(31,2,18);
/*!40000 ALTER TABLE `rbac_role_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_userinfo`
--

DROP TABLE IF EXISTS `rbac_userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rbac_userinfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(300) NOT NULL,
  `password` varchar(64) NOT NULL,
  `nickname` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_userinfo`
--

LOCK TABLES `rbac_userinfo` WRITE;
/*!40000 ALTER TABLE `rbac_userinfo` DISABLE KEYS */;
INSERT INTO `rbac_userinfo` VALUES (2,'admin','admin','刘','2429803436@qq.com'),(3,'pythontest','pythontest','刘','123@qq.com'),(5,'QQQQQ','QQQQQ','张','5666631@qq.com'),(6,'xuan','As20010504','L','123@qq.com');
/*!40000 ALTER TABLE `rbac_userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_userinfo_roles`
--

DROP TABLE IF EXISTS `rbac_userinfo_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rbac_userinfo_roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userinfo_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rbac_userinfo_roles_userinfo_id_role_id_aeda2126_uniq` (`userinfo_id`,`role_id`),
  KEY `rbac_userinfo_roles_role_id_7554e792_fk_rbac_role_id` (`role_id`),
  CONSTRAINT `rbac_userinfo_roles_role_id_7554e792_fk_rbac_role_id` FOREIGN KEY (`role_id`) REFERENCES `rbac_role` (`id`),
  CONSTRAINT `rbac_userinfo_roles_userinfo_id_2da02bea_fk_rbac_userinfo_id` FOREIGN KEY (`userinfo_id`) REFERENCES `rbac_userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_userinfo_roles`
--

LOCK TABLES `rbac_userinfo_roles` WRITE;
/*!40000 ALTER TABLE `rbac_userinfo_roles` DISABLE KEYS */;
INSERT INTO `rbac_userinfo_roles` VALUES (5,2,1),(12,3,1),(13,5,2),(14,6,2);
/*!40000 ALTER TABLE `rbac_userinfo_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-28 15:35:00
