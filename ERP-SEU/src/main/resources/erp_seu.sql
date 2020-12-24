/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.5.62 : Database - erp_seu
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`erp_seu` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `erp_seu`;

/*Table structure for table `client` */

DROP TABLE IF EXISTS `client`;

CREATE TABLE `client` (
  `clientId` int(5) NOT NULL AUTO_INCREMENT,
  `clientName` varchar(15) DEFAULT NULL,
  `address` varchar(20) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `clientManager` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`clientId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `client` */

insert  into `client`(`clientId`,`clientName`,`address`,`phone`,`email`,`clientManager`) values (1,'阿里巴巴','浙江省杭州市','13812345678','alibaba@ali.com','马云'),(2,'腾讯','广东省深圳市','13912345678','tecent@qq.com','马化腾');

/*Table structure for table `department` */

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `deptId` int(5) NOT NULL,
  `deptName` varchar(15) DEFAULT NULL,
  `deptDuty` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`deptId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `department` */

insert  into `department`(`deptId`,`deptName`,`deptDuty`) values (1,'生产部','负责制定生产计划，并组织生产'),(2,'设计部','负责产品设计'),(3,'项目部','负责接洽项目，并负责项目进度控制、人员配置调度与风险管控'),(4,'财务部','负责公司财务运作'),(5,'人力部','负责公司人事'),(6,'物流部','负责公司物流调配'),(7,'礼仪部','负责前台接待及会务礼仪');

/*Table structure for table `employee` */

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `employeeId` int(5) NOT NULL AUTO_INCREMENT,
  `empName` varchar(15) DEFAULT NULL,
  `gender` varchar(5) DEFAULT NULL,
  `deptId` int(5) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `empDate` date DEFAULT NULL,
  `state` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`employeeId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `employee` */

insert  into `employee`(`employeeId`,`empName`,`gender`,`deptId`,`phone`,`empDate`,`state`) values (1,'张三','男',3,'13800000000','2020-12-12','在职'),(2,'李四','女',2,'13612345678','2020-12-12','在职'),(3,'王五','女',1,'123456','2020-12-17','在职'),(4,'刘晓军','男',2,'18612345678','2020-12-19','请假');

/*Table structure for table `equipment_account` */

DROP TABLE IF EXISTS `equipment_account`;

CREATE TABLE `equipment_account` (
  `equipmentId` int(5) NOT NULL AUTO_INCREMENT,
  `equipmentName` varchar(15) DEFAULT NULL,
  `equipmentState` varchar(15) DEFAULT NULL,
  `purchaseDate` date DEFAULT NULL,
  `manufacturer` varchar(30) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`equipmentId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `equipment_account` */

insert  into `equipment_account`(`equipmentId`,`equipmentName`,`equipmentState`,`purchaseDate`,`manufacturer`,`remark`) values (1,'焊接设备','正常','2020-12-12','东南大学机械工程学院',NULL);

/*Table structure for table `equipment_fault` */

DROP TABLE IF EXISTS `equipment_fault`;

CREATE TABLE `equipment_fault` (
  `equipmentId` int(5) DEFAULT NULL,
  `equipmentName` varchar(15) DEFAULT NULL,
  `faultDate` date DEFAULT NULL,
  `faultReason` varchar(30) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `equipment_fault` */

insert  into `equipment_fault`(`equipmentId`,`equipmentName`,`faultDate`,`faultReason`,`remark`) values (1,'焊接设备','2020-12-12','磨损',NULL),(1,'焊接设备','2020-12-19','磨损',''),(NULL,'',NULL,'',''),(NULL,'',NULL,'','');

/*Table structure for table `equipment_inspect` */

DROP TABLE IF EXISTS `equipment_inspect`;

CREATE TABLE `equipment_inspect` (
  `equipmentId` int(5) DEFAULT NULL,
  `equipmentName` varchar(15) DEFAULT NULL,
  `inspectDate` date DEFAULT NULL,
  `result` varchar(30) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `equipment_inspect` */

insert  into `equipment_inspect`(`equipmentId`,`equipmentName`,`inspectDate`,`result`,`remark`) values (1,'焊接设备','2020-12-13','正常',NULL),(2,'焊接设备','2020-12-19','正常','');

/*Table structure for table `equipment_mt` */

DROP TABLE IF EXISTS `equipment_mt`;

CREATE TABLE `equipment_mt` (
  `equipmentId` int(5) DEFAULT NULL,
  `equipmentName` varchar(15) DEFAULT NULL,
  `mtWay` varchar(20) DEFAULT NULL,
  `mtResult` varchar(30) DEFAULT NULL,
  `cost` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `equipment_mt` */

insert  into `equipment_mt`(`equipmentId`,`equipmentName`,`mtWay`,`mtResult`,`cost`) values (1,'焊接设备','小修','正常',100),(1,'焊接设备','小修','正常',300);

/*Table structure for table `material_enter` */

DROP TABLE IF EXISTS `material_enter`;

CREATE TABLE `material_enter` (
  `materialId` varchar(15) DEFAULT NULL,
  `materialName` varchar(15) DEFAULT NULL,
  `enterNum` int(15) DEFAULT NULL,
  `enterDate` date DEFAULT NULL,
  `supplier` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `material_enter` */

insert  into `material_enter`(`materialId`,`materialName`,`enterNum`,`enterDate`,`supplier`) values ('DDR4&2666','内存条',200,'2020-12-12','KINGSTON'),('MX450','显卡',200,'2020-12-16','NVIDIA'),('R74800H','CPU',200,'2020-12-17','NVIDIA'),('R74800H','CPU',300,'2020-12-19','AMD'),('MX450','显卡',200,'2020-12-21','NVIDIA');

/*Table structure for table `material_inventory` */

DROP TABLE IF EXISTS `material_inventory`;

CREATE TABLE `material_inventory` (
  `materialId` varchar(15) DEFAULT NULL,
  `materialName` varchar(15) DEFAULT NULL,
  `materialNum` int(15) DEFAULT NULL,
  `supplier` varchar(20) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `material_inventory` */

insert  into `material_inventory`(`materialId`,`materialName`,`materialNum`,`supplier`,`remark`) values ('R74800H','CPU',5500,'AMD','AMD,YES!'),('MX450','显卡',3100,'NVIDIA',NULL),('DDR4&2666','内存条',2000,'KINGSTON',NULL);

/*Table structure for table `material_out` */

DROP TABLE IF EXISTS `material_out`;

CREATE TABLE `material_out` (
  `materialId` varchar(15) DEFAULT NULL,
  `materialName` varchar(15) DEFAULT NULL,
  `outNum` int(15) DEFAULT NULL,
  `outDate` date DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `material_out` */

insert  into `material_out`(`materialId`,`materialName`,`outNum`,`outDate`,`remark`) values ('MX450','显卡',130,'2020-12-12',''),('R74800H','CPU',100,'2020-12-16','正常'),('MX450','显卡',100,'2020-12-17','正常');

/*Table structure for table `order` */

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `orderId` int(5) NOT NULL AUTO_INCREMENT,
  `clientName` varchar(15) DEFAULT NULL,
  `product` varchar(20) DEFAULT NULL,
  `orderNum` int(5) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `orderDate` date DEFAULT NULL,
  `productId` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

/*Data for the table `order` */

insert  into `order`(`orderId`,`clientName`,`product`,`orderNum`,`price`,`orderDate`,`productId`) values (1,'阿里巴巴','笔记本',200,5000,'2020-12-16','X600'),(2,'阿里巴巴','笔记本',100,3000,'2020-11-06','X600'),(3,'腾讯','笔记本',100,6000,'2020-11-06','X7000'),(4,'腾讯','笔记本',100,8000,'2020-11-08','X7000'),(5,'腾讯','笔记本',50,6000,'2020-11-08','Y800'),(6,'腾讯','笔记本',300,6999,'2020-11-11','X7000'),(7,'百度','笔记本',100,5000,'2020-11-12','X600'),(8,'百度','笔记本',100,3000,'2020-12-12','X7000'),(9,'阿里巴巴','笔记本',100,5000,'2020-11-15','X600'),(10,'百度','笔记本',300,9000,'2020-12-19','X7000'),(11,'阿里巴巴','笔记本',100,5000,'2020-12-20','X600'),(12,'网易','笔记本',100,6000,'2020-12-20','X7000'),(13,'腾讯','笔记本',100,6000,'2020-12-19','X7000'),(14,'腾讯','笔记本',100,6000,'2020-12-19','X7000'),(15,'腾讯','笔记本',100,6000,'2020-12-19','X7000'),(16,'腾讯','笔记本',100,6000,'2020-12-19','X7000'),(17,'腾讯','笔记本',100,6000,'2020-12-19','X7000'),(18,'腾讯','笔记本',100,6000,'2020-12-19','X7000'),(19,'腾讯','笔记本',100,6000,'2020-12-19','X7000'),(20,'腾讯','笔记本',100,6000,'2020-12-19','X7000'),(21,'腾讯','笔记本',100,6000,'2020-12-19','X7000'),(22,'阿里','笔记本',100,6000,'2020-12-19','X7000'),(23,'阿里','笔记本',100,6000,'2020-12-19','X7000'),(24,'阿里','笔记本',100,6000,'2020-12-19','X7000'),(25,'阿里','笔记本',100,6000,'2020-12-19','X7000'),(26,'阿里','笔记本',100,6000,'2020-12-19','X7000'),(27,'阿里','笔记本',100,6000,'2020-12-19','X7000'),(28,'阿里','笔记本',100,6000,'2020-12-19','X7000'),(29,'阿里','笔记本',100,6000,'2020-12-19','X7000'),(30,'阿里','笔记本',100,6000,'2020-12-19','X7000'),(31,'阿里','笔记本',100,6000,'2020-12-19','X7000'),(32,'阿里','笔记本',100,6000,'2020-12-19','X7000'),(33,'阿里','笔记本',100,6000,'2020-12-19','X7000'),(34,'阿里','笔记本',100,6000,'2020-12-19','X7000'),(35,'阿里','笔记本',100,6000,'2020-12-19','X7000'),(36,'阿里','笔记本',100,6000,'2020-12-19','X7000'),(37,'腾讯','笔记本',100,6000,'2020-12-19','X7000'),(38,'腾讯','笔记本',100,6000,'2020-12-19','X7000'),(39,'腾讯','笔记本',100,6000,'2020-12-19','X7000'),(40,'腾讯','笔记本',100,6000,'2020-12-19','X7000'),(41,'腾讯','笔记本',100,6000,'2020-12-19','X7000'),(42,'腾讯','笔记本',100,6000,'2020-12-19','X7000'),(43,'腾讯','笔记本',100,6000,'2020-12-19','X7000'),(44,'腾讯','笔记本',100,6000,'2020-12-19','X7000'),(45,'腾讯','笔记本',100,6000,'2020-12-19','X7000'),(46,'腾讯','笔记本',100,6000,'2020-12-19','X7000'),(47,'腾讯','笔记本',100,6000,'2020-12-19','X7000'),(48,'腾讯','笔记本',100,6000,'2020-12-19','X7000'),(49,'腾讯','笔记本',100,6000,'2020-12-19','X7000'),(50,'腾讯','笔记本',100,6000,'2020-12-19','X7000'),(51,'腾讯','笔记本',100,6000,'2020-12-19','X7000'),(52,'阿里','笔记本',100,6000,'2020-12-19','X7000'),(53,'阿里','笔记本',100,6000,'2020-12-19','X7000'),(54,'阿里','笔记本',100,6000,'2020-12-19','X7000'),(55,'阿里','笔记本',100,6000,'2020-12-19','X7000'),(56,'阿里','笔记本',100,6000,'2020-12-19','X7000'),(57,'阿里','笔记本',100,6000,'2020-12-19','X7000'),(58,'阿里','笔记本',100,6000,'2020-12-19','X7000'),(59,'阿里','笔记本',100,6000,'2020-12-19','X7000'),(60,'阿里','笔记本',100,6000,'2020-12-19','X7000'),(61,'阿里','笔记本',100,6000,'2020-12-19','X7000'),(62,'阿里','笔记本',100,6000,'2020-12-19','X7000'),(63,'阿里','笔记本',100,6000,'2020-12-19','X7000'),(64,'阿里','笔记本',100,6000,'2020-12-19','X7000'),(65,'阿里','笔记本',100,6000,'2020-12-19','X7000'),(66,'阿里','笔记本',100,6000,'2020-12-19','X7000'),(67,'阿里','笔记本',100,6000,'2020-12-19','X7000'),(68,'阿里','笔记本',100,6000,'2020-12-19','X7000'),(69,'阿里','笔记本',100,6000,'2020-12-19','X7000'),(70,'腾讯','笔记本',100,6000,'2020-12-19','X7000'),(71,'腾讯','笔记本',100,6000,'2020-12-19','X7000'),(72,'腾讯','笔记本',100,6000,'2020-12-19','X7000'),(73,'腾讯','笔记本',100,6000,'2020-12-19','X7000'),(74,'阿里','笔记本',100,6000,'2020-12-19','X7000'),(75,'阿里','笔记本',100,6000,'2020-12-19','X7000'),(76,'阿里','笔记本',100,6000,'2020-12-19','X7000'),(77,'腾讯','笔记本',100,6000,'2020-12-19','X7000'),(78,'阿里','笔记本',100,6000,'2020-12-19','X7000'),(79,'阿里','笔记本',100,6000,'2020-12-19','X7000'),(80,'阿里','笔记本',100,6000,'2020-12-19','X7000'),(81,'腾讯','笔记本',100,6000,'2020-12-19','X7000'),(82,'腾讯','笔记本',100,6000,'2020-12-19','X7000'),(83,'阿里','笔记本',100,6000,'2020-12-19','X7000'),(84,'腾讯','笔记本',100,6000,'2020-12-19','X7000'),(85,'阿里','笔记本',100,6000,'2020-12-19','X7000'),(86,'阿里','笔记本',100,6000,'2020-12-19','X7000'),(87,'字节跳动','笔记本',200,5000,'2020-12-19','X7000');

/*Table structure for table `schedule` */

DROP TABLE IF EXISTS `schedule`;

CREATE TABLE `schedule` (
  `productDate` date DEFAULT NULL,
  `product` varchar(20) DEFAULT NULL,
  `productId` varchar(20) DEFAULT NULL,
  `productNum` varchar(5) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `schedule` */

insert  into `schedule`(`productDate`,`product`,`productId`,`productNum`,`remark`) values ('2020-12-12','笔记本','X600','300','正常'),('2020-12-18','笔记本','X600','300','正常'),('2020-12-13','笔记本','X7000','350','正常'),('2020-12-14','笔记本','X7000','300','正常'),('2020-12-14','笔记本','X600','380','正常'),('2020-12-15','笔记本','X7000','350','正常'),('2020-12-15','笔记本','X600','300','正常'),('2020-12-19','笔记本','X600','300','正常'),('2020-12-21','笔记本','X600','300','正常'),('2020-12-21','笔记本','X7000','300','正常');

/*Table structure for table `system_user` */

DROP TABLE IF EXISTS `system_user`;

CREATE TABLE `system_user` (
  `username` varchar(15) DEFAULT NULL,
  `password` varchar(15) DEFAULT NULL,
  `isAdmin` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `system_user` */

insert  into `system_user`(`username`,`password`,`isAdmin`) values ('root','root',1),('张三','123456',1),('李四','666666',0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
