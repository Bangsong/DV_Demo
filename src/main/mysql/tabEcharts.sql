/*
SQLyog Ultimate v12.3.1 (64 bit)
MySQL - 8.0.11 : Database - echarts
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`echarts` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `echarts`;

/*Table structure for table `e_grid` */

DROP TABLE IF EXISTS `e_grid`;

CREATE TABLE `e_grid` (
  `id` int(11) NOT NULL,
  `left` varchar(50) NOT NULL DEFAULT 'auto',
  `top` varchar(50) NOT NULL DEFAULT 'auto',
  `right` varchar(50) NOT NULL DEFAULT 'auto',
  `bottom` varchar(50) NOT NULL DEFAULT 'auto',
  `width` varchar(50) NOT NULL DEFAULT 'auto',
  `height` varchar(50) NOT NULL DEFAULT 'auto',
  `containLabel` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `e_grid` */

insert  into `e_grid`(`id`,`left`,`top`,`right`,`bottom`,`width`,`height`,`containLabel`) values 
(1,'10%','4%','0%','3%','auto','auto',1);

/*Table structure for table `e_legend` */

DROP TABLE IF EXISTS `e_legend`;

CREATE TABLE `e_legend` (
  `id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL DEFAULT 'plain',
  `left` varchar(50) NOT NULL DEFAULT 'auto',
  `top` varchar(50) NOT NULL DEFAULT 'auto',
  `right` varchar(50) NOT NULL DEFAULT 'auto',
  `bottom` varchar(50) NOT NULL DEFAULT 'auto',
  `width` varchar(50) NOT NULL DEFAULT 'auto',
  `height` varchar(50) NOT NULL DEFAULT 'auto',
  `formatter` varchar(1000) NOT NULL DEFAULT 'null'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `e_legend` */

insert  into `e_legend`(`id`,`type`,`left`,`top`,`right`,`bottom`,`width`,`height`,`formatter`) values 
(1,'scroll','20%','auto','auto','auto','auto','auto','null');

/*Table structure for table `e_title` */

DROP TABLE IF EXISTS `e_title`;

CREATE TABLE `e_title` (
  `id` int(11) NOT NULL,
  `text` varchar(1000) DEFAULT NULL,
  `subtext` varchar(1000) DEFAULT NULL,
  `left` varchar(100) NOT NULL DEFAULT 'auto',
  `top` varchar(100) NOT NULL DEFAULT 'auto',
  `right` varchar(100) NOT NULL DEFAULT 'auto',
  `bottom` varchar(100) NOT NULL DEFAULT 'auto',
  `show` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `e_title` */

insert  into `e_title`(`id`,`text`,`subtext`,`left`,`top`,`right`,`bottom`,`show`) values 
(1,'测试主标题','测试副标题','auto','auto','auto','auto',1);

/*Table structure for table `e_xaxis` */

DROP TABLE IF EXISTS `e_xaxis`;

CREATE TABLE `e_xaxis` (
  `id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL DEFAULT 'category',
  `boundaryGap` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `e_xaxis` */

insert  into `e_xaxis`(`id`,`type`,`boundaryGap`) values 
(1,'category',0),
(2,'category',1);

/*Table structure for table `e_yaxis` */

DROP TABLE IF EXISTS `e_yaxis`;

CREATE TABLE `e_yaxis` (
  `id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL DEFAULT 'value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `e_yaxis` */

insert  into `e_yaxis`(`id`,`type`) values 
(1,'value');

/*Table structure for table `echarts` */

DROP TABLE IF EXISTS `echarts`;

CREATE TABLE `echarts` (
  `corp_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `backgroundColor` varchar(50) NOT NULL DEFAULT '#fff',
  `title_id` int(11) NOT NULL,
  `legend_id` int(11) NOT NULL,
  `grid_id` int(11) NOT NULL,
  `xAxis_id` int(11) NOT NULL,
  `yAxis_id` int(11) NOT NULL,
  `tooltip_id` int(11) NOT NULL,
  `toolbox_id` int(11) NOT NULL,
  `is_use` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `echarts` */

insert  into `echarts`(`corp_id`,`id`,`type`,`backgroundColor`,`title_id`,`legend_id`,`grid_id`,`xAxis_id`,`yAxis_id`,`tooltip_id`,`toolbox_id`,`is_use`) values 
(1,1,'line','#fff',1,1,1,1,1,1,1,1),
(1,2,'bar','#fff',1,1,1,2,1,1,1,0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
