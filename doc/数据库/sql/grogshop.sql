/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 6.0.10-alpha-community : Database - grogshop
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`grogshop` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `grogshop`;

/*Table structure for table `attribute` */

DROP TABLE IF EXISTS `attribute`;

CREATE TABLE `attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '属性ID',
  `attributeName` varchar(30) DEFAULT NULL COMMENT '属性名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `attribute` */

insert  into `attribute`(`id`,`attributeName`) values (1,'房态'),(2,'客房等级'),(3,'商品类别'),(4,'支付方式'),(5,'出租方式'),(6,'结账单位'),(7,'旅客类别'),(8,'性别'),(9,'民族'),(10,'证件'),(11,'文化程度'),(12,'事由'),(13,'旅客级别'),(14,'对象类别'),(15,'计量单位'),(16,'预定状态'),(17,'结账');

/*Table structure for table `attributedetails` */

DROP TABLE IF EXISTS `attributedetails`;

CREATE TABLE `attributedetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '属性明细ID',
  `attributeID` int(11) DEFAULT NULL COMMENT '属性ID',
  `attributeDetailsName` varchar(30) DEFAULT NULL COMMENT '属性明细名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

/*Data for the table `attributedetails` */

insert  into `attributedetails`(`id`,`attributeID`,`attributeDetailsName`) values (1,1,'空房'),(2,1,'自用房'),(4,1,'预定'),(5,1,'待清洁'),(6,1,'待维修'),(7,1,'不可用'),(8,2,'单人普通房'),(9,2,'单人标准间'),(10,2,'二人普通房'),(11,2,'二人标准间'),(12,2,'豪华间'),(13,2,'会议室'),(14,2,'总统套房'),(15,3,'餐饮类'),(16,3,'饮料类'),(17,3,'食品类'),(18,3,'烟酒类'),(19,3,'人为损坏类'),(20,3,'其他'),(21,4,'现金'),(22,4,'转账'),(23,4,'信用卡'),(24,999,'其他'),(25,5,'钟点'),(26,5,'全日'),(27,6,'旅客自付'),(28,6,'团队付款'),(29,7,'国内旅客'),(30,7,'国外旅客'),(31,8,'男'),(32,8,'女'),(33,9,'汉'),(34,9,'苗'),(35,9,'壮'),(36,9,'其他'),(37,10,'二代身份证'),(38,10,'护照'),(39,10,'其他'),(40,11,'无'),(41,11,'小学'),(42,11,'初中'),(43,11,'高中'),(44,11,'大专'),(45,11,'本科'),(46,11,'研究生'),(47,11,'硕士'),(48,11,'博士'),(49,11,'其他'),(50,12,'公务出差'),(51,12,'个人旅行'),(52,13,'首次'),(53,13,'熟客'),(54,13,'VIP'),(55,14,'散客'),(56,14,'团队'),(57,15,'瓶'),(58,15,'台'),(59,15,'条'),(60,15,'支'),(61,15,'个'),(62,15,'只'),(63,15,'包'),(65,1,'满'),(66,16,'未安排'),(67,16,'已安排'),(68,17,'未结账'),(69,17,'已结账'),(70,15,'份'),(71,15,'碟');

/*Table structure for table `commodity` */

DROP TABLE IF EXISTS `commodity`;

CREATE TABLE `commodity` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `commodityTypeID` int(11) DEFAULT NULL COMMENT '商品类别ID',
  `uOMID` int(11) DEFAULT NULL COMMENT '计量单位ID',
  `commodityName` varchar(50) DEFAULT NULL COMMENT '商品名称',
  `salePrice` decimal(8,2) DEFAULT NULL COMMENT '销售价格',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `commodity` */

insert  into `commodity`(`id`,`commodityTypeID`,`uOMID`,`commodityName`,`salePrice`) values (1,15,62,'北京烤鸭','500.00'),(2,16,57,'雪碧','7.00'),(3,16,57,'可乐','7.00'),(4,19,58,'空调','3000.00'),(5,17,63,'薯片王','21.00'),(6,15,62,'红烧猪蹄','201.00'),(7,21,NULL,'',NULL),(8,16,57,'哇哈哈','5.00'),(9,18,63,'经典双喜','20.00'),(10,15,70,'红色排骨','129.00'),(12,73,57,'666','888.00');

/*Table structure for table `consumptiondetails` */

DROP TABLE IF EXISTS `consumptiondetails`;

CREATE TABLE `consumptiondetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '消费明细ID',
  `stayRegisterID` int(11) DEFAULT NULL COMMENT '住宿登记ID',
  `commodityID` int(11) DEFAULT NULL COMMENT '商品ID',
  `consumptionNumber` varchar(10) DEFAULT NULL COMMENT '消费数量',
  `consumptionMoney` decimal(8,2) DEFAULT NULL COMMENT '消费金额',
  `consumptionTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '消费时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

/*Data for the table `consumptiondetails` */

insert  into `consumptiondetails`(`id`,`stayRegisterID`,`commodityID`,`consumptionNumber`,`consumptionMoney`,`consumptionTime`) values (6,1,3,'3','21.00','2016-12-05 11:38:21'),(8,6,1,'2','1000.00','2016-12-06 17:02:37'),(9,18,2,'2','14.00','2017-01-10 11:24:40'),(10,18,3,'1','7.00','2017-01-10 11:25:12'),(11,18,8,'1','5.00','2017-01-10 21:22:23'),(12,16,2,'1','7.00','2017-01-10 21:22:50'),(13,16,3,'1','7.00','2017-01-10 21:22:50'),(14,16,8,'1','5.00','2017-01-10 21:22:50'),(15,17,2,'2','14.00','2017-01-11 08:40:36'),(16,17,3,'1','7.00','2017-01-11 08:40:36'),(17,22,2,'2','14.00','2017-01-11 21:08:57'),(18,25,2,'2','14.00','2017-02-21 09:12:05'),(20,26,2,'1','7.00','2017-02-21 15:04:26'),(21,26,8,'1','5.00','2017-02-21 15:04:26'),(22,27,2,'1','7.00','2017-02-21 15:08:36'),(23,28,5,'2','42.00','2017-02-21 16:01:09'),(24,31,2,'1','7.00','2017-02-21 16:12:48'),(25,33,2,'1','7.00','2017-02-22 11:23:40'),(26,32,5,'1','21.00','2017-02-22 11:24:02'),(27,34,1,'1','500.00','2017-02-23 11:15:28'),(29,35,2,'1','7.00','2017-02-23 11:21:37'),(30,36,4,'1','3000.00','2017-02-23 11:22:06'),(31,37,5,'1','21.00','2017-02-23 11:30:19'),(32,42,2,'1','7.00','2017-02-27 09:27:38'),(33,42,8,'2','10.00','2017-02-27 09:27:38'),(34,43,2,'1','7.00','2017-02-28 09:44:46'),(35,41,8,'2','10.00','2017-02-28 09:45:00'),(36,40,3,'1','7.00','2017-02-28 09:45:18');

/*Table structure for table `depoit` */

DROP TABLE IF EXISTS `depoit`;

CREATE TABLE `depoit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stayRegisterID` int(11) DEFAULT NULL COMMENT '住宿登记ID',
  `payWayID` int(11) DEFAULT NULL COMMENT '支付方式ID',
  `registerTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '登记时间',
  `deposit` decimal(8,2) DEFAULT NULL COMMENT '押金',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

/*Data for the table `depoit` */

insert  into `depoit`(`id`,`stayRegisterID`,`payWayID`,`registerTime`,`deposit`) values (1,1,21,'2016-12-02 16:44:48','300.00'),(3,3,21,'2016-12-03 20:12:56','200.00'),(4,NULL,NULL,'2016-12-04 11:16:59','0.00'),(5,1,21,'2016-12-04 11:20:59','145.00'),(6,3,21,'2016-12-04 11:20:59','2.00'),(7,1,21,'2016-12-04 11:24:36','22.00'),(8,3,21,'2016-12-04 11:35:33','2.00'),(9,1,21,'2016-12-04 14:41:02','32.00'),(10,1,21,'2016-12-04 14:41:21','2.00'),(11,1,21,'2016-12-04 14:48:38','33.00'),(12,1,21,'2016-12-04 15:06:07','99.00'),(13,1,21,'2016-12-04 15:07:55','88.00'),(14,4,21,'2016-12-05 15:34:33','200.00'),(15,4,21,'2016-12-05 16:48:58','100.00'),(16,5,21,'2016-12-06 16:30:45','2.00'),(17,6,21,'2016-12-06 16:59:53','200.00'),(18,6,21,'2016-12-06 17:01:42','10.00'),(19,6,21,'2016-12-06 17:01:49','200.00'),(20,1,21,'2017-01-09 16:37:03','100.00'),(21,1,21,'2017-01-09 16:37:03','100.00'),(22,1,21,'2017-01-09 16:37:03','100.00'),(23,10,21,'2017-01-09 16:41:38','100.00'),(24,11,21,'2017-01-09 16:41:38','100.00'),(25,12,21,'2017-01-09 16:46:54','100.00'),(26,13,21,'2017-01-09 16:49:16','100.00'),(27,14,21,'2017-01-09 20:04:47','100.00'),(28,15,21,'2017-01-09 20:04:47','100.00'),(29,16,21,'2017-01-09 20:15:12','20.00'),(30,17,21,'2017-01-10 10:12:44','200.00'),(31,18,21,'2017-01-10 11:23:03','100.00'),(32,19,21,'2017-01-10 11:23:03','100.00'),(33,19,21,'2017-01-10 11:23:49','50.00'),(34,18,21,'2017-01-10 11:27:52','1.00'),(35,18,21,'2017-01-10 21:12:13','1.00'),(36,20,21,'2017-01-11 09:17:52','1.00'),(37,21,21,'2017-01-11 09:17:52','1.00'),(38,22,21,'2017-01-11 15:33:59','100.00'),(39,22,21,'2017-01-11 21:08:33','2.00'),(40,23,21,'2017-02-21 08:26:14','100.00'),(41,24,21,'2017-02-21 08:26:14','100.00'),(42,25,21,'2017-02-21 09:11:16','200.00'),(43,26,21,'2017-02-21 15:01:03','200.00'),(44,26,21,'2017-02-21 15:03:42','100.00'),(45,27,21,'2017-02-21 15:07:54','1.00'),(46,27,21,'2017-02-21 15:08:24','1.00'),(47,28,21,'2017-02-21 15:58:29','33.33'),(48,29,21,'2017-02-21 15:58:29','33.33'),(49,30,21,'2017-02-21 15:58:29','33.33'),(50,31,21,'2017-02-21 16:12:08','200.00'),(51,32,21,'2017-02-22 11:22:36','100.00'),(52,33,21,'2017-02-22 11:22:36','100.00'),(53,33,21,'2017-02-22 11:23:13','1.00'),(54,32,21,'2017-02-22 11:23:20','2.00'),(55,34,21,'2017-02-23 11:12:16','100.00'),(56,34,21,'2017-02-23 11:14:57','1.00'),(57,35,21,'2017-02-23 11:19:38','100.00'),(58,36,21,'2017-02-23 11:19:38','100.00'),(59,35,21,'2017-02-23 11:20:52','1.00'),(60,36,21,'2017-02-23 11:21:11','2.00'),(61,37,21,'2017-02-23 11:28:56','100.00'),(62,38,21,'2017-02-23 11:29:08','100.00'),(63,39,21,'2017-02-23 11:29:08','100.00'),(64,37,21,'2017-02-23 11:30:05','10.00'),(65,40,21,'2017-02-24 15:39:57','100.00'),(66,41,21,'2017-02-24 15:39:57','100.00'),(67,42,21,'2017-02-26 21:23:51','100.00'),(68,42,21,'2017-02-27 11:14:27','2.00'),(69,43,21,'2017-02-27 20:22:31','100.00'),(70,41,21,'2017-02-28 09:44:02','2.00'),(71,43,21,'2017-02-28 09:44:19','2.00'),(72,40,21,'2017-02-28 09:44:31','3.00'),(73,44,21,'2017-03-01 08:53:35','200.00');

/*Table structure for table `passenger` */

DROP TABLE IF EXISTS `passenger`;

CREATE TABLE `passenger` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '旅客ID',
  `papersID` int(11) DEFAULT NULL COMMENT '证件ID',
  `educationDegreeID` int(11) DEFAULT NULL COMMENT '文化程度ID',
  `genderID` int(11) DEFAULT NULL COMMENT '性别ID',
  `passengerLevelID` int(11) DEFAULT NULL COMMENT '旅客级别ID',
  `nationID` int(11) DEFAULT NULL COMMENT '民族ID',
  `thingReasonID` int(11) DEFAULT NULL COMMENT '事由',
  `name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `papersNumber` varchar(30) DEFAULT NULL COMMENT '证件号码',
  `birthDate` varchar(30) DEFAULT NULL COMMENT '出生日期',
  `licenceIssuingAuthorty` varchar(50) DEFAULT NULL COMMENT '发证机关',
  `unitsOrAddress` varchar(50) DEFAULT NULL COMMENT '单位或住址',
  `papersValidity` varchar(50) DEFAULT NULL COMMENT '证件有效期',
  `profession` varchar(20) DEFAULT NULL COMMENT '职业',
  `whereAreFrom` varchar(100) DEFAULT NULL COMMENT '从何处来',
  `whereToGo` varchar(100) DEFAULT NULL COMMENT '到哪里去',
  `contactPhoneNumber` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `remarks` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

/*Data for the table `passenger` */

insert  into `passenger`(`id`,`papersID`,`educationDegreeID`,`genderID`,`passengerLevelID`,`nationID`,`thingReasonID`,`name`,`papersNumber`,`birthDate`,`licenceIssuingAuthorty`,`unitsOrAddress`,`papersValidity`,`profession`,`whereAreFrom`,`whereToGo`,`contactPhoneNumber`,`remarks`) values (1,37,44,31,52,33,51,'黄旭林','310103198202080411','1994-05-21','广东省高州市','广东省高州市荷花镇','2010-01-01 至 2020-01-01','学生','广东省高州市荷花镇','海南省三亚市大东海','13800138001','哈啊哈'),(2,37,44,31,52,33,51,'黄大海','440981198807214211','1988-07-21','广东省高州市','广东省高州市荷花镇','2010-01-01 至 2020-01-01','学生','广东省高州市荷花镇','海南省三亚市大东海','18312636707','哈啊哈'),(3,39,40,32,53,36,51,'刘朝武','310103199202080412','1992-02-08','上海徐汇区','天桥下','1921-02-29 至 2921-02-29','流浪者','屎坑','尿坑','13800138002','666'),(4,37,47,31,52,33,51,'范伟','440981198809094211','1988-09-09','广东省高州市','广东省高州市荷花镇','2010-01-01 至 2020-01-01','学生','广东省高州市荷花镇','海南省三亚市大东海','13800138003','哈啊哈'),(5,37,44,31,52,33,51,'程小伟','440981199212213211','1992-12-21','广东省高州市','广东省高州市荷花镇','2010-01-01 至 2020-01-01','学生','广东省高州市荷花镇','海南省三亚市大东海','13800138007','哈啊哈'),(6,37,44,31,52,33,51,'孙阳','440981199405214211','1994-05-21','广东省高州市','广东省高州市荷花镇','2010-01-01 至 2020-01-01','学生','广东省高州市荷花镇','海南省三亚市大东海','13800138005','哈啊哈'),(7,37,45,32,52,33,51,'李小萌','440981199506083218','1995-06-08','广东省高州市','广东省广州市','2010-01-01 至 2020-01-01','学生','广东省高州市','广东省广州市','13800138000','美女一枚'),(12,39,42,32,53,36,51,'周海风','210103196202080411','1962-02-08','哈连','天桥下','1921-02-29 至 2921-02-29','工人','哈连','杭州','13800138009','三无市民'),(15,37,44,31,52,33,51,'黄海涛','440981199509113211','1995-09-11','广东省高州市','广东省高州市荷花镇','2010-01-01 至 2020-01-01','学生','广东省高州市荷花镇','海南省三亚市大东海','13800138010','哈啊哈'),(16,37,43,31,52,33,51,'黄海量','440981198803014218','1988-03-01','广东省高州市','广东省高州市荷花镇','2010-01-01 至 2020-01-01','摄影师','广东省高州市荷花镇','海南省三亚市大东海','13800138011','哈啊哈'),(17,37,44,32,52,33,51,'白爱美','440981199505054205','1995-05-05','广东省高州市','广东省高州市荷花镇','2010-01-01 至 2020-01-01','学生','广东省高州市荷花镇','海南省三亚市大东海','13800138013','哈啊哈'),(18,39,41,31,53,36,51,'何海林','110103196202080411','1962-02-08','哈连','天桥下','1921-02-29 至 2921-02-29','流浪者','哈连','不知道','13800138018','好牛'),(19,37,44,32,52,33,51,'黄旭玲','440981199405214211','1994-05-21','广东省高州市','广东省高州市荷花镇','2010-01-01 至 2020-01-01','化妆师','广东省高州市荷花镇','海南省三亚市大东海','13800138015','哈啊哈'),(20,37,43,32,52,33,51,'刘爱爱','440981199202204213','1992-02-20','上海市徐汇区','广东省广州市','2010-01-01 至 2020-01-01','公务员','上海市徐汇区','广东省广州市南沙区','13800138016','美女'),(21,37,44,31,52,33,51,'周鸿弟','310103196202080411','1962-02-08','上海市徐汇区','上海市徐汇区桂林西街15巷72号204室','2010-01-01 至 2020-01-01','老师','上海市徐汇区桂林西街15巷72号204室','广东省广州市南沙区北大技工学校','13800138019','好老师'),(22,37,43,31,52,33,51,'小美','440981199206080020','1992-06-08','','','','','','',NULL,''),(23,37,43,31,52,33,51,'胡杰友','440981198809094218','1988-09-09','','','','','','',NULL,''),(25,37,43,32,52,33,51,'杨思雯','440981199606053214','1996-06-05','高州','','','学生','高州','广州',NULL,'美女'),(26,37,43,32,52,33,51,'胖妞','440981198807214202','1988-07-21','','','','','','',NULL,''),(28,37,43,31,52,33,51,'顾伟','440981198307214202','1983-07-21','','','','','','',NULL,'');

/*Table structure for table `predetermine` */

DROP TABLE IF EXISTS `predetermine`;

CREATE TABLE `predetermine` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '预定ID',
  `roomID` int(11) DEFAULT NULL COMMENT '房间ID',
  `predetermineTargetID` int(11) DEFAULT NULL COMMENT '预定对象ID',
  `passengerID` int(11) DEFAULT NULL COMMENT '旅客ID',
  `payWayID` int(11) DEFAULT NULL COMMENT '支付方式 ID',
  `predetermineStateID` int(11) DEFAULT NULL COMMENT '预定状态ID',
  `arriveTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '抵达时间',
  `deposit` decimal(8,2) DEFAULT NULL COMMENT '押金',
  `predetermineDay` varchar(10) DEFAULT NULL COMMENT '预定天数',
  `remind` int(11) DEFAULT '0' COMMENT '到时提示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

/*Data for the table `predetermine` */

insert  into `predetermine`(`id`,`roomID`,`predetermineTargetID`,`passengerID`,`payWayID`,`predetermineStateID`,`arriveTime`,`deposit`,`predetermineDay`,`remind`) values (1,13,11,0,21,67,'2017-01-09 16:41:12','100.00','2',1),(2,14,11,0,21,67,'2017-01-09 16:41:12','100.00','2',1),(3,16,11,0,21,67,'2017-01-09 16:41:12','100.00','2',1),(4,17,11,0,21,67,'2017-01-09 16:45:05','100.00','2',1),(5,18,11,0,21,67,'2017-01-09 16:45:05','100.00','2',1),(6,13,2,3,21,67,'2017-01-09 16:46:54','100.00','1',1),(7,13,2,3,21,67,'2017-01-09 16:49:16','100.00','1',1),(9,19,2,3,21,67,'2017-01-10 11:21:50','200.00','2',1),(10,13,12,0,21,67,'2017-01-10 21:32:53','100.00','2',1),(11,27,12,0,21,67,'2017-01-10 21:32:53','100.00','2',1),(12,18,2,2,21,67,'2017-03-01 08:53:35','200.00','2',1),(13,16,3,0,21,67,'2017-02-21 08:26:14','100.00','1',1),(14,17,3,0,21,67,'2017-02-21 08:26:14','100.00','1',1),(15,13,2,1,21,67,'2017-02-21 09:14:16','200.00','2',1),(18,17,13,0,21,67,'2017-02-23 08:06:53','200.00','1',1),(21,13,5,0,21,67,'2017-02-23 11:41:59','100.00','1',1),(22,14,5,0,21,67,'2017-02-23 11:41:59','100.00','1',1),(23,3,2,1,21,67,'2017-02-23 11:28:56','100.00','1',1),(25,13,3,0,21,67,'2017-02-24 16:29:39','100.00','1',1),(26,27,3,0,21,67,'2017-02-24 16:29:39','100.00','1',1);

/*Table structure for table `receivetarget` */

DROP TABLE IF EXISTS `receivetarget`;

CREATE TABLE `receivetarget` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '接待对象ID',
  `targetTypeID` int(11) DEFAULT NULL COMMENT '对象类别ID',
  `principal` varchar(20) DEFAULT NULL COMMENT '负责人',
  `teamName` varchar(30) DEFAULT NULL COMMENT '团队名称',
  `teamCode` varchar(30) DEFAULT NULL COMMENT '团队编号',
  `registerTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '登记时间',
  `contactPhoneNUmber` varchar(20) DEFAULT NULL COMMENT '联系电话',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `receivetarget` */

insert  into `receivetarget`(`id`,`targetTypeID`,`principal`,`teamName`,`teamCode`,`registerTime`,`contactPhoneNUmber`) values (1,56,'李亚伟','深圳市蓝途畅游旅行社有限公司','LTC82952','2016-11-20 20:26:12','13800138111'),(2,55,NULL,NULL,NULL,'2016-12-04 08:26:47','122'),(3,56,'丽丽','丽人旅游团','LiRen001','2016-11-20 20:26:18','13800138112'),(4,56,'罗斯福','光大国际旅行社','GDGZ001','2016-11-20 20:33:24','13800138222'),(5,56,'周海媚','北京青年旅行社','BJQN005','2016-11-20 20:33:50','13800138223'),(9,56,'周冬梅','香港天宝旅行社有限公司','XGTB0892','2016-11-27 16:58:09','13800138225'),(11,56,'王大卫','深圳美之程旅游服务有限公司','SZM8248','2016-11-27 16:58:59','13800138226'),(12,56,'黄晓敏','丽江旅游团','LJ2088','2017-01-10 10:08:52','13800138000'),(13,56,'海滔','爱海滔滔有限公司','AHTT0058','2017-02-21 14:59:42','18312952952');

/*Table structure for table `room` */

DROP TABLE IF EXISTS `room`;

CREATE TABLE `room` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '房间id',
  `guestRoomLevelID` int(11) DEFAULT NULL COMMENT '客房等级ID',
  `roomStateID` int(11) DEFAULT NULL COMMENT '房态ID',
  `roomNumber` varchar(10) DEFAULT NULL COMMENT '房间号',
  `roomAmount` varchar(10) DEFAULT NULL COMMENT '床位数',
  `standardPriceDay` decimal(8,2) DEFAULT NULL COMMENT '标准房价/天',
  `standardPrice` decimal(8,2) DEFAULT NULL COMMENT '标准房价/小时',
  `maxDuration` varchar(10) DEFAULT NULL COMMENT '时长限制（小时）',
  `firstDuration` varchar(10) DEFAULT NULL COMMENT '首段时长（小时）',
  `firstPrice` decimal(8,2) DEFAULT NULL COMMENT '首段价格',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

/*Data for the table `room` */

insert  into `room`(`id`,`guestRoomLevelID`,`roomStateID`,`roomNumber`,`roomAmount`,`standardPriceDay`,`standardPrice`,`maxDuration`,`firstDuration`,`firstPrice`) values (3,8,1,'101','1','100.00','20.00','5','3','50.00'),(4,14,2,'501','3','10000.00','1800.00','5','3','5000.00'),(5,8,3,'404','1','1.00','1.00','1','1','1.00'),(9,8,4,'102','1','100.00','20.00','5','3','50.00'),(10,8,5,'103','1','100.00','20.00','5','3','50.00'),(11,8,6,'104','1','100.00','20.00','5','3','50.00'),(12,9,7,'105','1','150.00','30.00','5','3','80.00'),(13,8,1,'106','1','150.00','30.00','5','3','80.00'),(14,10,4,'107','2','200.00','40.00','5','3','100.00'),(16,10,1,'201','2','180.00','35.00','5','3','100.00'),(17,10,1,'202','2','180.00','35.00','5','3','100.00'),(18,11,65,'203','2','300.00','50.00','5','3','130.00'),(19,11,1,'204','3','300.00','50.00','5','3','130.00'),(20,13,1,'301','1','800.00','200.00','4','3','500.00'),(21,8,1,'3','23','2.00','2.00','2','2','2.00'),(22,13,1,'302','1','1200.00','99.00','5','3','500.00'),(23,12,1,'401','2','1000.00','88.00','5','3','700.00'),(24,14,1,'502','2','8000.00','1500.00','5','3','5000.00'),(25,8,1,'808','2','800000.00','80000.00','5','3','50000.00'),(26,8,1,'9999','99','999.00','999.00','9','5','99.00'),(27,10,1,'108','2','200.00','35.00','5','3','100.00'),(28,8,65,'109','2','200.00','35.00','5','3','100.00'),(29,11,1,'205','2','500.00','100.00','5','3','300.00'),(30,11,1,'206','2','600.00','99.00','5','3','300.00'),(31,11,1,'207','2','800.00','99.00','5','3','500.00'),(32,8,1,'208','2','800.00','100.00','5','3','500.00'),(34,11,1,'307','2','2000.00','2.00','05','03','888.80');

/*Table structure for table `stayregister` */

DROP TABLE IF EXISTS `stayregister`;

CREATE TABLE `stayregister` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '住宿登记ID',
  `predetermineID` int(11) DEFAULT NULL COMMENT '预定ID',
  `rentOutTypeID` int(11) DEFAULT NULL COMMENT '出租方式ID',
  `roomID` int(11) DEFAULT NULL COMMENT '房间ID',
  `payWayID` int(11) DEFAULT NULL COMMENT '结账方式ID',
  `billUnitID` int(11) DEFAULT NULL COMMENT '结账单位ID',
  `passengerTypeID` int(11) DEFAULT NULL COMMENT '旅客类别ID',
  `receiveTargetID` int(11) DEFAULT NULL COMMENT '接待对象ID',
  `deputyID` int(11) DEFAULT NULL COMMENT '副ID',
  `isBillID` int(11) DEFAULT NULL COMMENT '结账否',
  `registerTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登记时间',
  `stayNumber` varchar(20) DEFAULT NULL COMMENT '住店天数/小时',
  `sumConst` decimal(8,2) DEFAULT NULL COMMENT '总费用',
  `ChangingRoomNumber` varchar(10) DEFAULT NULL COMMENT '换房次数',
  `changRoomMoney` decimal(8,2) DEFAULT NULL COMMENT '换房费',
  `remarks` varchar(200) DEFAULT NULL COMMENT '备注',
  `payTime` timestamp NULL DEFAULT NULL COMMENT '结账时间',
  `changRoomTime` timestamp NULL DEFAULT NULL COMMENT '换房时间',
  `remind` int(11) DEFAULT '0' COMMENT '提醒结账',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

/*Data for the table `stayregister` */

insert  into `stayregister`(`id`,`predetermineID`,`rentOutTypeID`,`roomID`,`payWayID`,`billUnitID`,`passengerTypeID`,`receiveTargetID`,`deputyID`,`isBillID`,`registerTime`,`stayNumber`,`sumConst`,`ChangingRoomNumber`,`changRoomMoney`,`remarks`,`payTime`,`changRoomTime`,`remind`) values (1,1,26,13,21,27,29,2,NULL,69,'2016-11-29 15:06:52','5','3291.00','1','15120.00','','2017-02-21 09:23:36','2017-02-21 09:19:00',1),(3,1,26,17,21,27,29,2,NULL,69,'2016-12-03 20:12:56','2','360.00',NULL,NULL,'你好','2017-01-11 20:55:51',NULL,1),(4,10,26,3,21,27,29,2,NULL,69,'2016-12-05 15:34:33','5','500.00',NULL,NULL,'','2017-01-11 20:55:45',NULL,1),(5,11,26,18,21,27,29,2,NULL,69,'2016-12-06 16:30:45','1','300.00',NULL,NULL,'','2017-01-11 20:55:41',NULL,1),(6,12,26,20,21,27,29,2,NULL,69,'2016-12-06 16:59:53','5','5000.00',NULL,NULL,'','2017-01-11 20:55:36',NULL,1),(7,NULL,26,13,22,28,29,11,NULL,69,'2017-01-09 16:37:03','2','300.00',NULL,NULL,'','2017-01-09 16:42:23',NULL,0),(8,NULL,26,14,22,28,29,11,NULL,69,'2017-01-09 16:37:03','2','400.00',NULL,NULL,'','2017-01-09 16:42:23',NULL,0),(9,NULL,26,16,22,28,29,11,NULL,69,'2017-01-09 16:37:03','2','360.00',NULL,NULL,'','2017-01-09 16:42:23',NULL,0),(10,NULL,26,17,22,28,29,11,NULL,69,'2017-01-09 16:41:38','2','360.00',NULL,NULL,'','2017-01-09 16:42:23',NULL,0),(11,NULL,26,18,22,28,29,11,NULL,69,'2017-01-09 16:41:38','2','600.00',NULL,NULL,'','2017-01-09 16:42:23',NULL,0),(12,NULL,26,13,21,27,29,2,NULL,69,'2017-01-09 16:46:54','1','150.00',NULL,NULL,'','2017-01-09 16:47:06',NULL,0),(13,7,26,13,21,27,29,2,NULL,69,'2017-01-09 16:49:16','1','150.00',NULL,NULL,'','2017-01-09 16:49:28',NULL,0),(14,NULL,26,13,22,28,29,9,NULL,69,'2017-01-09 20:04:47','1','150.00',NULL,NULL,'','2017-01-09 20:43:43',NULL,0),(15,NULL,26,14,22,28,29,9,NULL,69,'2017-01-09 20:04:47','1','200.00',NULL,NULL,'','2017-02-21 16:09:55',NULL,1),(16,NULL,25,27,22,27,29,11,NULL,69,'2017-01-09 20:15:12','4','154.00','1','0.00','','2017-02-22 17:03:48','2017-02-20 20:42:33',1),(17,9,26,19,22,27,29,13,NULL,69,'2017-01-10 10:12:44','2','621.00',NULL,NULL,'','2017-03-01 10:08:05',NULL,1),(18,10,26,13,22,28,29,12,NULL,69,'2017-01-10 11:23:03','2','326.00',NULL,NULL,'','2017-01-11 10:16:27',NULL,0),(19,11,26,28,22,28,29,12,NULL,69,'2017-01-10 11:23:03','2','400.00','1','0.00','','2017-01-11 10:16:27','2017-01-10 11:23:34',0),(20,NULL,26,27,22,28,29,12,NULL,69,'2017-01-11 09:17:52','2','400.00',NULL,NULL,'','2017-01-11 10:16:27',NULL,0),(21,NULL,26,17,22,28,29,5,NULL,69,'2017-01-11 09:17:52','2','360.00',NULL,NULL,'','2017-01-11 10:16:27',NULL,0),(22,NULL,26,3,21,27,29,2,NULL,69,'2017-01-11 15:33:59','1','114.00','1','0.00','','2017-02-21 08:29:07','2017-01-11 21:08:40',1),(23,13,26,16,22,28,29,3,NULL,69,'2017-02-21 08:26:14','1','180.00',NULL,NULL,'','2017-02-21 08:28:37',NULL,0),(24,14,26,17,22,28,29,3,NULL,69,'2017-02-21 08:26:14','1','180.00',NULL,NULL,'','2017-02-21 08:28:37',NULL,0),(25,15,26,13,22,27,29,4,NULL,69,'2017-02-21 09:11:16','2','314.00',NULL,NULL,'','2017-02-21 09:13:53',NULL,0),(26,NULL,26,32,21,27,29,2,NULL,69,'2017-02-21 15:01:03','2','1612.00','1','0.00','','2017-02-21 15:57:34','2017-02-21 15:05:14',0),(27,NULL,26,13,22,27,29,12,NULL,69,'2017-02-21 15:07:54','1','157.00','1','0.00','','2017-02-23 11:24:51','2017-02-21 15:08:14',1),(28,NULL,26,20,22,28,29,3,NULL,69,'2017-02-21 15:58:29','1','842.00','1','0.00','','2017-02-21 16:01:57','2017-02-21 16:01:26',0),(29,NULL,26,29,22,28,29,3,NULL,69,'2017-02-21 15:58:29','1','500.00',NULL,NULL,'','2017-02-21 16:01:57',NULL,0),(30,NULL,26,30,22,28,29,3,NULL,69,'2017-02-21 15:58:29','1','600.00',NULL,NULL,'','2017-02-21 16:01:57',NULL,0),(31,18,26,17,21,28,29,13,NULL,69,'2017-02-21 16:12:08','1','187.00',NULL,NULL,'','2017-02-21 16:13:12',NULL,0),(32,NULL,26,28,NULL,28,29,2,NULL,68,'2017-02-22 11:22:36','1','221.00',NULL,NULL,NULL,NULL,NULL,1),(33,NULL,26,16,22,28,29,11,NULL,69,'2017-02-22 11:22:36','1','187.00',NULL,NULL,'','2017-02-22 16:35:46',NULL,0),(34,NULL,26,14,23,27,29,2,NULL,69,'2017-02-23 11:12:16','1','700.00','1','0.00','可填可不填','2017-02-23 11:17:31','2017-02-23 11:16:01',0),(35,NULL,26,16,22,28,29,12,NULL,69,'2017-02-23 11:19:38','1','187.00',NULL,NULL,'','2017-02-23 11:23:30',NULL,0),(36,NULL,26,14,22,28,29,12,NULL,69,'2017-02-23 11:19:38','1','3200.00','1','0.00','','2017-02-23 11:24:51','2017-02-23 11:22:19',0),(37,23,26,27,21,27,29,2,NULL,69,'2017-02-23 11:28:56','1','221.00','1','0.00','','2017-02-23 11:30:46','2017-02-23 11:30:25',0),(38,21,26,13,22,28,29,5,NULL,69,'2017-02-23 11:29:08','1','150.00',NULL,NULL,'','2017-02-23 11:32:03',NULL,0),(39,22,26,14,22,28,29,5,NULL,69,'2017-02-23 11:29:08','1','200.00',NULL,NULL,'','2017-02-23 11:32:03',NULL,0),(40,25,26,13,22,28,29,3,NULL,69,'2017-02-24 15:39:57','5','757.00',NULL,NULL,'','2017-03-01 08:07:00',NULL,0),(41,26,26,17,22,28,29,3,NULL,69,'2017-02-24 15:39:57','5','990.00','1','800.00','','2017-03-01 08:07:00','2017-02-28 14:46:20',0),(42,NULL,26,17,21,27,29,2,NULL,69,'2017-02-26 21:23:51','1','197.00','1','180.00','','2017-02-27 16:36:56','2017-02-27 15:36:17',0),(43,NULL,26,3,22,27,29,3,NULL,69,'2017-02-27 20:22:31','3','307.00',NULL,NULL,'','2017-03-01 08:07:00',NULL,0),(44,12,26,18,NULL,27,29,2,NULL,68,'2017-03-01 08:53:35','2','600.00',NULL,NULL,NULL,NULL,NULL,0);

/*Table structure for table `stayregisterdetails` */

DROP TABLE IF EXISTS `stayregisterdetails`;

CREATE TABLE `stayregisterdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '住宿登记明细id',
  `stayRegisterID` int(11) DEFAULT NULL COMMENT '住宿登记id',
  `passengerID` int(11) DEFAULT NULL COMMENT '旅客id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

/*Data for the table `stayregisterdetails` */

insert  into `stayregisterdetails`(`id`,`stayRegisterID`,`passengerID`) values (1,1,2),(2,3,3),(3,3,18),(4,4,2),(5,5,2),(6,6,2),(7,6,19),(8,10,1),(9,11,3),(10,12,3),(11,13,3),(12,15,1),(13,14,12),(14,16,5),(15,17,3),(16,19,1),(17,18,3),(18,20,3),(19,20,19),(20,21,19),(21,17,1),(22,22,4),(23,23,4),(24,24,22),(25,25,1),(26,1,23),(27,26,1),(28,26,25),(29,27,7),(30,30,2),(31,28,26),(32,29,5),(33,28,12),(34,31,1),(35,33,1),(36,32,3),(37,34,19),(38,34,28),(39,35,5),(40,36,7),(41,37,1),(42,38,17),(43,39,12),(44,42,1),(45,41,16),(46,40,18),(47,43,1),(48,41,6);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`id`,`userName`,`password`) values (1,'sa','123');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
