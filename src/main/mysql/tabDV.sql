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
(1,1,'开发人员',1,1);

/*Table structure for table `tb_power` */

DROP TABLE IF EXISTS `tb_power`;

CREATE TABLE `tb_power` (
  `pow_id` int(11) DEFAULT NULL,
  `is_show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示，1：显示，0：隐藏',
  `id` int(11) NOT NULL COMMENT '一级菜单ID',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '一级菜单名称',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '请求地址',
  `o_id` int(11) DEFAULT NULL COMMENT '二级菜单ID',
  `o_name` varchar(100) DEFAULT NULL COMMENT '二级菜单名称',
  `o_url` varchar(200) DEFAULT NULL COMMENT '请求地址',
  `t_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '三级菜单ID',
  `t_id` int(11) DEFAULT NULL COMMENT '三级菜单名称',
  `t_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '请求地址'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_power` */

insert  into `tb_power`(`pow_id`,`is_show`,`id`,`name`,`url`,`o_id`,`o_name`,`o_url`,`t_name`,`t_id`,`t_url`) values 
(1,1,1,'系统管理','#',11,'参数管理','#','角色控制',110,'/Param/changePower'),
(1,1,1,'系统管理','#',10,'用户管理','#','添加用户',100,'/User/addUser'),
(1,1,1,'系统管理','#',11,'参数管理','#','人员管理',111,'/Param/changePower'),
(1,1,1,'系统管理','#',10,'用户管理','#','删除用户',101,'/User/deleteUser'),
(1,1,2,'数据可视化','#',22,'echarts演示','#','折线图',221,'/DataGraph/demo'),
(1,1,2,'数据可视化','#',22,'echarts演示','#','柱形图',220,'/DataGraph/demo');

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
