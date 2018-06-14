/*
SQLyog Ultimate v12.3.1 (64 bit)
MySQL - 8.0.11 : Database - dv
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`dv` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `dv`;

/*Table structure for table `company` */

DROP TABLE IF EXISTS `company`;

CREATE TABLE `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公司ID',
  `name` varchar(100) NOT NULL COMMENT '公司全名',
  `alias` varchar(10) NOT NULL COMMENT '公司别名',
  `address` varchar(1000) NOT NULL COMMENT '公司地址',
  `Province` varchar(20) NOT NULL COMMENT '所属省',
  `City` varchar(20) NOT NULL COMMENT '所属市',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `company` */

insert  into `company`(`id`,`name`,`alias`,`address`,`Province`,`City`) values 
(1,'万能的小明工作室','XGame','河南省郑州市','河南','郑州');

/*Table structure for table `department` */

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `corp_id` int(11) NOT NULL COMMENT '公司ID',
  `id` int(11) NOT NULL COMMENT '部门ID',
  `name` varchar(100) NOT NULL COMMENT '部门名',
  `sub_depart_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属部门ID',
  `job_id` int(11) NOT NULL COMMENT '职位ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `department` */

insert  into `department`(`corp_id`,`id`,`name`,`sub_depart_id`,`job_id`) values 
(1,1,'技术部',0,1);

/*Table structure for table `e_legend` */

DROP TABLE IF EXISTS `e_legend`;

CREATE TABLE `e_legend` (
  `corp_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL DEFAULT 'plain',
  `show` tinyint(1) NOT NULL DEFAULT '0',
  `left` varchar(50) NOT NULL DEFAULT 'auto',
  `top` varchar(50) NOT NULL DEFAULT 'auto',
  `right` varchar(50) NOT NULL DEFAULT 'auto',
  `bottom` varchar(50) NOT NULL DEFAULT 'auto',
  `width` varchar(10) NOT NULL DEFAULT 'auto',
  `height` varchar(10) NOT NULL DEFAULT 'auto',
  `data` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `e_legend` */

insert  into `e_legend`(`corp_id`,`id`,`type`,`show`,`left`,`top`,`right`,`bottom`,`width`,`height`,`data`) values 
(1,1,'plain',1,'auto','auto','auto','auto','auto','auto','测试1,测试2');

/*Table structure for table `e_series` */

DROP TABLE IF EXISTS `e_series`;

CREATE TABLE `e_series` (
  `corp_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `data_id` int(11) NOT NULL,
  `areaStyle_id` int(11) DEFAULT NULL,
  `smooth` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `e_series` */

insert  into `e_series`(`corp_id`,`id`,`data_id`,`areaStyle_id`,`smooth`) values 
(1,1,1,1,1);

/*Table structure for table `e_series_areastyle` */

DROP TABLE IF EXISTS `e_series_areastyle`;

CREATE TABLE `e_series_areastyle` (
  `id` int(11) NOT NULL,
  `data_id` int(11) NOT NULL,
  `color` varchar(100) NOT NULL DEFAULT '#000',
  `origin` varchar(50) NOT NULL DEFAULT 'auto',
  `shadowBlur` int(11) NOT NULL DEFAULT '10',
  `shadowColor` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '#000',
  `shadowOffsetX` int(11) NOT NULL DEFAULT '0',
  `shadowOffsetY` int(11) NOT NULL DEFAULT '0',
  `opacity` float NOT NULL DEFAULT '1',
  `show` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `e_series_areastyle` */

insert  into `e_series_areastyle`(`id`,`data_id`,`color`,`origin`,`shadowBlur`,`shadowColor`,`shadowOffsetX`,`shadowOffsetY`,`opacity`,`show`) values 
(1,1,'#ff7f50','auto',10,'#000',0,0,1,1),
(1,2,'#6495ed','auto',10,'#000',0,0,1,1),
(2,1,'#555555','auto',10,'#000',0,0,1,0);

/*Table structure for table `e_series_data` */

DROP TABLE IF EXISTS `e_series_data`;

CREATE TABLE `e_series_data` (
  `id` int(11) NOT NULL,
  `data_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `value` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `e_series_data` */

insert  into `e_series_data`(`id`,`data_id`,`name`,`value`) values 
(1,1,'测试1','820, 932, 901, 934, 1290, 1330, 1320'),
(1,2,'测试2','720, 532, 651, 744, 1890, 1530, 1230');

/*Table structure for table `e_title` */

DROP TABLE IF EXISTS `e_title`;

CREATE TABLE `e_title` (
  `corp_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `show` tinyint(1) NOT NULL DEFAULT '1',
  `text` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `link` varchar(100) DEFAULT NULL,
  `target` varchar(50) NOT NULL DEFAULT 'blank',
  `subtext` varchar(500) DEFAULT NULL,
  `sublink` varchar(100) DEFAULT NULL,
  `subtarget` varchar(50) NOT NULL DEFAULT 'blank',
  `padding` varchar(80) DEFAULT NULL,
  `itemGap` int(11) DEFAULT NULL,
  `left` varchar(50) NOT NULL DEFAULT 'auto',
  `top` varchar(50) NOT NULL DEFAULT 'auto',
  `right` varchar(50) NOT NULL DEFAULT 'auto',
  `bottom` varchar(50) NOT NULL DEFAULT 'auto',
  `backgroundColor` varchar(100) NOT NULL DEFAULT 'transparent',
  KEY `corp_id` (`corp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `e_title` */

insert  into `e_title`(`corp_id`,`id`,`show`,`text`,`link`,`target`,`subtext`,`sublink`,`subtarget`,`padding`,`itemGap`,`left`,`top`,`right`,`bottom`,`backgroundColor`) values 
(1,1,1,'测试','https://www.baidu.com/','blank','测试副标题','http://echarts.baidu.com/','blank','0',10,'auto','auto','auto','auto','#000');

/*Table structure for table `e_tooltip` */

DROP TABLE IF EXISTS `e_tooltip`;

CREATE TABLE `e_tooltip` (
  `id` int(11) NOT NULL,
  `show` tinyint(1) NOT NULL DEFAULT '0',
  `trigger` varchar(50) NOT NULL DEFAULT 'item'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `e_tooltip` */

insert  into `e_tooltip`(`id`,`show`,`trigger`) values 
(1,1,'axis');

/*Table structure for table `e_xaxis` */

DROP TABLE IF EXISTS `e_xaxis`;

CREATE TABLE `e_xaxis` (
  `corp_id` int(11) NOT NULL COMMENT '公司ID',
  `id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `data` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `e_xaxis` */

insert  into `e_xaxis`(`corp_id`,`id`,`type`,`data`) values 
(1,1,'category','Mon,Tue,Wed,Thu,Fri,Sat,Sun');

/*Table structure for table `e_yaxis` */

DROP TABLE IF EXISTS `e_yaxis`;

CREATE TABLE `e_yaxis` (
  `CORP_ID` int(11) DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `e_yaxis` */

insert  into `e_yaxis`(`CORP_ID`,`id`,`type`) values 
(1,1,'value');

/*Table structure for table `echarts` */

DROP TABLE IF EXISTS `echarts`;

CREATE TABLE `echarts` (
  `corp_id` int(11) NOT NULL COMMENT '公司ID',
  `type` varchar(50) NOT NULL COMMENT '类型',
  `t_id` int(11) NOT NULL DEFAULT '0' COMMENT '标题ID',
  `l_id` int(11) NOT NULL DEFAULT '0' COMMENT 'legend ID',
  `tt_id` int(11) NOT NULL DEFAULT '0' COMMENT 'tooltip ID',
  `x_id` int(11) NOT NULL DEFAULT '0' COMMENT 'xAxis ID',
  `y_id` int(11) NOT NULL DEFAULT '0' COMMENT 'yAxis ID',
  `s_id` int(11) NOT NULL DEFAULT '0' COMMENT 'series ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `echarts` */

insert  into `echarts`(`corp_id`,`type`,`t_id`,`l_id`,`tt_id`,`x_id`,`y_id`,`s_id`) values 
(1,'line',1,1,1,1,1,1),
(1,'bar',1,1,1,1,1,1);

/*Table structure for table `jurisdicte` */

DROP TABLE IF EXISTS `jurisdicte`;

CREATE TABLE `jurisdicte` (
  `corp_id` int(11) NOT NULL COMMENT '公司ID',
  `id` int(11) NOT NULL COMMENT '职位ID',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职位名称',
  `power_id` int(11) NOT NULL COMMENT '功能ID',
  `is_show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否展示'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `jurisdicte` */

insert  into `jurisdicte`(`corp_id`,`id`,`name`,`power_id`,`is_show`) values 
(1,1,'开发人员',1,1),
(1,1,'开发人员',11,1),
(1,1,'开发人员',10,1),
(1,1,'开发人员',2,1),
(1,1,'开发人员',20,1),
(1,1,'开发人员',21,1),
(1,1,'开发人员',22,1);

/*Table structure for table `tb_power` */

DROP TABLE IF EXISTS `tb_power`;

CREATE TABLE `tb_power` (
  `id` int(11) NOT NULL COMMENT '功能ID',
  `name` varchar(100) NOT NULL COMMENT '功能名称',
  `p_id` int(11) NOT NULL DEFAULT '0' COMMENT '父功能，0：无',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '请求地址',
  `c_name` varchar(100) DEFAULT NULL COMMENT '子功能名称',
  `c_id` int(11) DEFAULT NULL COMMENT '子功能',
  `c_url` varchar(200) DEFAULT NULL COMMENT '子功能地址',
  `is_show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示，1：显示，0：隐藏'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_power` */

insert  into `tb_power`(`id`,`name`,`p_id`,`url`,`c_name`,`c_id`,`c_url`,`is_show`) values 
(1,'系统管理',0,'#',NULL,NULL,NULL,1),
(2,'数据可视化',0,'#',NULL,NULL,NULL,1),
(10,'用户管理',1,'#','添加用户',101,'/system/userSys/deleteUser',1),
(11,'参数管理',1,'#','角色控制',110,'/system/paramSys/changePower',1),
(11,'参数管理',1,'#','人员管理',111,'/system/paramSys/changePower',1),
(20,'柱形报表',2,'#',NULL,NULL,NULL,1),
(21,'折线报表',2,'#',NULL,NULL,NULL,1),
(22,'echarts演示',2,'#','柱形图',220,'/DataGraph/demo',1),
(10,'用户管理',1,'#','删除用户',101,'/system/userSys/deleteUser',1),
(22,'echarts演示',2,'#','折线图',221,'/DataGraph/demo',1);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` varchar(100) NOT NULL COMMENT '用户账号',
  `user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户姓名',
  `user_pwd` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码',
  `user_hp` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户头像',
  `sex` varchar(10) NOT NULL DEFAULT '男' COMMENT '性别',
  `age` int(11) NOT NULL COMMENT '年龄',
  `birthday` date NOT NULL COMMENT '生日',
  `tel` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系电话',
  `login_status` int(11) NOT NULL DEFAULT '0' COMMENT '登录状态：0：离线，1：在线',
  `corp_id` int(11) NOT NULL COMMENT '公司ID',
  `depa_id` int(11) NOT NULL COMMENT '部门ID',
  `lock_flag` int(11) NOT NULL DEFAULT '0' COMMENT '锁定标识：0：解锁，1：锁定，即不能登录',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`user_id`,`user_name`,`user_pwd`,`user_hp`,`sex`,`age`,`birthday`,`tel`,`login_status`,`corp_id`,`depa_id`,`lock_flag`) values 
('rzp','万能的小明','mima','/content/images/user.jpg','男',24,'1994-09-23','18237120593',1,1,1,0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
