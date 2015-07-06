# MySQL-Front 5.1  (Build 3.0)

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;


# Host: localhost    Database: yundaicms
# ------------------------------------------------------
# Server version 5.1.32-community

DROP DATABASE IF EXISTS `yundaicms`;
CREATE DATABASE `yundaicms` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `yundaicms`;

#
# Source for table cms_tb_classify
#

DROP TABLE IF EXISTS `cms_tb_classify`;
CREATE TABLE `cms_tb_classify` (
  `ID` bigint(1) NOT NULL AUTO_INCREMENT,
  `PARENT_ID` tinyint(1) NOT NULL DEFAULT '0',
  `PARENT_IDS` varchar(500) DEFAULT NULL,
  `NAME` varchar(100) NOT NULL,
  `TYPE` varchar(10) NOT NULL,
  `PATH_ID` varchar(512) DEFAULT NULL,
  `PATH_NAME` varchar(512) DEFAULT NULL,
  `KEYWORDS` varchar(50) DEFAULT NULL,
  `IS_SHOW` varchar(1) NOT NULL DEFAULT '1',
  `SORT` int(11) NOT NULL DEFAULT '10',
  `CREATE_DATE` date NOT NULL,
  `CREATE_BY` varchar(30) NOT NULL,
  `UPDATE_DATE` date DEFAULT NULL,
  `UPDATE_BY` varchar(30) DEFAULT NULL,
  `REMARKS` varchar(200) DEFAULT NULL,
  `DEL_FLAG` char(1) DEFAULT NULL,
  `CODE` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

#
# Dumping data for table cms_tb_classify
#
LOCK TABLES `cms_tb_classify` WRITE;
/*!40000 ALTER TABLE `cms_tb_classify` DISABLE KEYS */;

INSERT INTO `cms_tb_classify` VALUES (1,0,NULL,'资讯中心','1','1','','','1',1,'2015-07-01','1','2015-07-02','1','','0','ZXZX');
INSERT INTO `cms_tb_classify` VALUES (16,1,NULL,'公司新闻','1',NULL,NULL,'','1',2,'2015-07-02','1','2015-07-02','1','','0','GSXW');
INSERT INTO `cms_tb_classify` VALUES (17,1,NULL,'行业动态','1',NULL,NULL,'','1',3,'2015-07-02','1','2015-07-02','1','','0','HYDT');
/*!40000 ALTER TABLE `cms_tb_classify` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table cms_tb_content
#

DROP TABLE IF EXISTS `cms_tb_content`;
CREATE TABLE `cms_tb_content` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CHANNEL_ID` bigint(1) NOT NULL,
  `EXT_CHNL_ID` bigint(1) DEFAULT NULL,
  `TITLE` varchar(100) NOT NULL,
  `AUTHOR` varchar(50) DEFAULT NULL,
  `ORIGIN` varchar(100) DEFAULT NULL,
  `ORIGIN_URL` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(300) DEFAULT NULL,
  `RELEASE_DATE` date DEFAULT NULL,
  `TITLE_IMG` varchar(255) DEFAULT NULL,
  `STATUS` varchar(4) DEFAULT NULL,
  `TAGS` varchar(300) DEFAULT NULL,
  `KEYWORDS` varchar(300) DEFAULT NULL,
  `CREATE_DATE` timestamp NULL DEFAULT NULL,
  `CREATE_BY` varchar(30) NOT NULL,
  `UPDATE_DATE` timestamp NULL DEFAULT NULL,
  `UPDATE_BY` varchar(30) DEFAULT NULL,
  `REMARKS` varchar(200) DEFAULT NULL,
  `DEL_FLAG` char(1) DEFAULT '0',
  `TYPE` int(1) DEFAULT NULL,
  `IS_RECOMMAND` char(1) DEFAULT '0',
  `SHORT_TITLE` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

#
# Dumping data for table cms_tb_content
#
LOCK TABLES `cms_tb_content` WRITE;
/*!40000 ALTER TABLE `cms_tb_content` DISABLE KEYS */;

INSERT INTO `cms_tb_content` VALUES (5,16,NULL,'aa','aa','aa','','',NULL,'','1','',NULL,'2015-07-04','1','2015-07-04','1',NULL,'0',0,'0','');
INSERT INTO `cms_tb_content` VALUES (6,16,NULL,'bb','bb','bb','','',NULL,'','1','',NULL,'2015-07-04','1','2015-07-04','1',NULL,'0',0,'0','');
INSERT INTO `cms_tb_content` VALUES (7,16,NULL,'cc','cc','cc','','',NULL,'','1','',NULL,'2015-07-04','1','2015-07-04','1',NULL,'0',0,'0','');
INSERT INTO `cms_tb_content` VALUES (8,16,NULL,'dd','dd','dd','','',NULL,'','1','',NULL,'2015-07-04','1','2015-07-04','1',NULL,'0',0,'0','');
INSERT INTO `cms_tb_content` VALUES (9,16,NULL,'dd','dd','dd','','',NULL,'','1','',NULL,'2015-07-04','1','2015-07-04','1',NULL,'0',0,'0','');
INSERT INTO `cms_tb_content` VALUES (10,16,NULL,'ee','ee','ee','','',NULL,'','1','',NULL,'2015-07-04','1','2015-07-04','1',NULL,'0',0,'0','');
INSERT INTO `cms_tb_content` VALUES (11,16,NULL,'few','few','few','','',NULL,'','1','',NULL,'2015-07-04 15:52:19','1','2015-07-04 15:52:19','1',NULL,'0',0,'0','');
INSERT INTO `cms_tb_content` VALUES (12,17,NULL,'fwe','few','few','','',NULL,'','1','',NULL,'2015-07-04 15:54:04','1','2015-07-04 15:54:04','1',NULL,'0',0,'0','');
INSERT INTO `cms_tb_content` VALUES (13,16,NULL,'beb','be','be','','',NULL,'','1','',NULL,'2015-07-04 15:57:46','1','2015-07-04 15:57:46','1',NULL,'1',0,'0','');
INSERT INTO `cms_tb_content` VALUES (14,16,NULL,'yy','yy','yy','','',NULL,'','1','',NULL,'2015-07-04 15:57:54','1','2015-07-04 16:00:15','1',NULL,'1',0,'0','');
INSERT INTO `cms_tb_content` VALUES (15,17,NULL,'bes','ce','cq','','',NULL,'','1','',NULL,'2015-07-04 15:58:05','1','2015-07-04 15:58:05','1',NULL,'0',0,'0','');
INSERT INTO `cms_tb_content` VALUES (16,17,NULL,'测试内容','测试','测试','','',NULL,'','1','',NULL,'2015-07-04 15:58:37','1','2015-07-04 15:58:37','1',NULL,'0',0,'0','');
INSERT INTO `cms_tb_content` VALUES (17,16,NULL,'test','test','test','','',NULL,'','1','',NULL,'2015-07-04 16:57:29','1','2015-07-04 16:57:29','1',NULL,'0',0,'0','');
/*!40000 ALTER TABLE `cms_tb_content` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table cms_tb_content_tag
#

DROP TABLE IF EXISTS `cms_tb_content_tag`;
CREATE TABLE `cms_tb_content_tag` (
  `CONTENT_ID` bigint(1) NOT NULL,
  `TAG_ID` bigint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table cms_tb_content_tag
#
LOCK TABLES `cms_tb_content_tag` WRITE;
/*!40000 ALTER TABLE `cms_tb_content_tag` DISABLE KEYS */;

/*!40000 ALTER TABLE `cms_tb_content_tag` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table cms_tb_content_txt
#

DROP TABLE IF EXISTS `cms_tb_content_txt`;
CREATE TABLE `cms_tb_content_txt` (
  `CONTENT_ID` bigint(1) NOT NULL AUTO_INCREMENT,
  `CONTENT_TXT` text COMMENT '文章内容',
  `USER_DEF1` varchar(200) DEFAULT NULL COMMENT '扩展内容1',
  `USER_DEF2` varchar(200) DEFAULT NULL COMMENT '扩展内容2',
  `USER_DEF3` varchar(4000) DEFAULT NULL COMMENT '扩展内容3',
  PRIMARY KEY (`CONTENT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

#
# Dumping data for table cms_tb_content_txt
#
LOCK TABLES `cms_tb_content_txt` WRITE;
/*!40000 ALTER TABLE `cms_tb_content_txt` DISABLE KEYS */;

INSERT INTO `cms_tb_content_txt` VALUES (5,'<p>aa</p>',NULL,NULL,NULL);
INSERT INTO `cms_tb_content_txt` VALUES (6,'<p>bb</p>',NULL,NULL,NULL);
INSERT INTO `cms_tb_content_txt` VALUES (7,'<p>cc</p>',NULL,NULL,NULL);
INSERT INTO `cms_tb_content_txt` VALUES (8,'<p>dd</p>',NULL,NULL,NULL);
INSERT INTO `cms_tb_content_txt` VALUES (9,'<p>dd</p>',NULL,NULL,NULL);
INSERT INTO `cms_tb_content_txt` VALUES (10,'<p>ee</p>',NULL,NULL,NULL);
INSERT INTO `cms_tb_content_txt` VALUES (11,'<p>few</p>',NULL,NULL,NULL);
INSERT INTO `cms_tb_content_txt` VALUES (12,'<p>few</p>',NULL,NULL,NULL);
INSERT INTO `cms_tb_content_txt` VALUES (13,'<p>be</p>',NULL,NULL,NULL);
INSERT INTO `cms_tb_content_txt` VALUES (14,'<p>yy</p>',NULL,NULL,NULL);
INSERT INTO `cms_tb_content_txt` VALUES (15,'<p>cq</p>',NULL,NULL,NULL);
INSERT INTO `cms_tb_content_txt` VALUES (16,'<p>测试</p>',NULL,NULL,NULL);
INSERT INTO `cms_tb_content_txt` VALUES (17,'<p>test</p>',NULL,NULL,NULL);
/*!40000 ALTER TABLE `cms_tb_content_txt` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table gen_scheme
#

DROP TABLE IF EXISTS `gen_scheme`;
CREATE TABLE `gen_scheme` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `category` varchar(2000) DEFAULT NULL COMMENT '分类',
  `package_name` varchar(500) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `sub_module_name` varchar(30) DEFAULT NULL COMMENT '生成子模块名',
  `function_name` varchar(500) DEFAULT NULL COMMENT '生成功能名',
  `function_name_simple` varchar(100) DEFAULT NULL COMMENT '生成功能名（简写）',
  `function_author` varchar(100) DEFAULT NULL COMMENT '生成功能作者',
  `gen_table_id` varchar(200) DEFAULT NULL COMMENT '生成表编号',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_scheme_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='生成方案';

#
# Dumping data for table gen_scheme
#
LOCK TABLES `gen_scheme` WRITE;
/*!40000 ALTER TABLE `gen_scheme` DISABLE KEYS */;

INSERT INTO `gen_scheme` VALUES ('373c3c9166564f228867516327dcd2f8','测试分类','curd','com.klht.modules','testclassify','','测试分类','测试分类','test','b81ced186c64430381ec06822525309e','1','2015-07-04 16:12:21','1','2015-07-04 16:18:36','','0');
/*!40000 ALTER TABLE `gen_scheme` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table gen_table
#

DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `comments` varchar(500) DEFAULT NULL COMMENT '描述',
  `class_name` varchar(100) DEFAULT NULL COMMENT '实体类名称',
  `parent_table` varchar(200) DEFAULT NULL COMMENT '关联父表',
  `parent_table_fk` varchar(100) DEFAULT NULL COMMENT '关联父表外键',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_table_name` (`name`),
  KEY `gen_table_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务表';

#
# Dumping data for table gen_table
#
LOCK TABLES `gen_table` WRITE;
/*!40000 ALTER TABLE `gen_table` DISABLE KEYS */;

INSERT INTO `gen_table` VALUES ('b81ced186c64430381ec06822525309e','cms_tb_classify','cms_tb_classify','CmsTbClassify','','','1','2015-07-04 16:11:23','1','2015-07-04 16:11:23','','0');
/*!40000 ALTER TABLE `gen_table` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table gen_table_column
#

DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `gen_table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `comments` varchar(500) DEFAULT NULL COMMENT '描述',
  `jdbc_type` varchar(100) DEFAULT NULL COMMENT '列的数据类型的字节长度',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键',
  `is_null` char(1) DEFAULT NULL COMMENT '是否可为空',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段',
  `query_type` varchar(200) DEFAULT NULL COMMENT '查询方式（等于、不等于、大于、小于、范围、左LIKE、右LIKE、左右LIKE）',
  `show_type` varchar(200) DEFAULT NULL COMMENT '字段生成方案（文本框、文本域、下拉框、复选框、单选框、字典选择、人员选择、部门选择、区域选择）',
  `dict_type` varchar(200) DEFAULT NULL COMMENT '字典类型',
  `settings` varchar(2000) DEFAULT NULL COMMENT '其它设置（扩展字段JSON）',
  `sort` decimal(10,0) DEFAULT NULL COMMENT '排序（升序）',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_table_column_table_id` (`gen_table_id`),
  KEY `gen_table_column_name` (`name`),
  KEY `gen_table_column_sort` (`sort`),
  KEY `gen_table_column_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务表字段';

#
# Dumping data for table gen_table_column
#
LOCK TABLES `gen_table_column` WRITE;
/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;

INSERT INTO `gen_table_column` VALUES ('0f6d2f7b4f83453eb0ea9a3b9d661cdc','b81ced186c64430381ec06822525309e','create_by','create_by','varchar(30)','String','createBy.id','0','0','1','0','0','0','=','input','',NULL,120,'1','2015-07-04 16:11:23','1','2015-07-04 16:11:23',NULL,'0');
INSERT INTO `gen_table_column` VALUES ('1eeaead1282a498692a434b9007fdd41','b81ced186c64430381ec06822525309e','path_name','path_name','varchar(512)','String','pathName','0','1','1','1','0','0','=','input','',NULL,70,'1','2015-07-04 16:11:23','1','2015-07-04 16:11:23',NULL,'0');
INSERT INTO `gen_table_column` VALUES ('3636a2b18c334d549b2c951db068cc47','b81ced186c64430381ec06822525309e','sort','sort','int(11)','String','sort','0','0','1','1','0','0','=','input','',NULL,100,'1','2015-07-04 16:11:23','1','2015-07-04 16:11:23',NULL,'0');
INSERT INTO `gen_table_column` VALUES ('3a1836e6c94f4e498cd48f45c1f96cea','b81ced186c64430381ec06822525309e','code','code','varchar(20)','String','code','0','0','1','1','0','0','=','input','',NULL,170,'1','2015-07-04 16:11:23','1','2015-07-04 16:11:23',NULL,'0');
INSERT INTO `gen_table_column` VALUES ('4ada4870e0bf43a6b27275c16e527ff9','b81ced186c64430381ec06822525309e','keywords','keywords','varchar(50)','String','keywords','0','1','1','1','0','0','=','input','',NULL,80,'1','2015-07-04 16:11:23','1','2015-07-04 16:11:23',NULL,'0');
INSERT INTO `gen_table_column` VALUES ('59d848bc2b1d423786ff8ccf1fffc412','b81ced186c64430381ec06822525309e','create_date','create_date','date','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,110,'1','2015-07-04 16:11:23','1','2015-07-04 16:11:23',NULL,'0');
INSERT INTO `gen_table_column` VALUES ('6e767d573a6e4f65859cd67e3bef6815','b81ced186c64430381ec06822525309e','is_show','is_show','varchar(1)','String','isShow','0','0','1','1','0','0','=','input','',NULL,90,'1','2015-07-04 16:11:23','1','2015-07-04 16:11:23',NULL,'0');
INSERT INTO `gen_table_column` VALUES ('8be69a268f144b3fbfd614ca33868532','b81ced186c64430381ec06822525309e','name','name','varchar(100)','String','name','0','0','1','1','1','1','like','input','',NULL,40,'1','2015-07-04 16:11:23','1','2015-07-04 16:11:23',NULL,'0');
INSERT INTO `gen_table_column` VALUES ('a4218ca7536e487d806da150d2df0912','b81ced186c64430381ec06822525309e','path_id','path_id','varchar(512)','String','pathId','0','1','1','1','0','0','=','input','',NULL,60,'1','2015-07-04 16:11:23','1','2015-07-04 16:11:23',NULL,'0');
INSERT INTO `gen_table_column` VALUES ('a74dfa0db955419d8afd7aec832981e8','b81ced186c64430381ec06822525309e','del_flag','del_flag','char(1)','String','delFlag','0','1','1','0','0','0','=','radiobox','del_flag',NULL,160,'1','2015-07-04 16:11:23','1','2015-07-04 16:11:23',NULL,'0');
INSERT INTO `gen_table_column` VALUES ('a9f04dbfda6d426eb9b7e830b311722b','b81ced186c64430381ec06822525309e','remarks','remarks','varchar(200)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,150,'1','2015-07-04 16:11:23','1','2015-07-04 16:11:23',NULL,'0');
INSERT INTO `gen_table_column` VALUES ('ae042dde294149b0bb98102dafce3602','b81ced186c64430381ec06822525309e','update_date','update_date','date','java.util.Date','updateDate','0','1','1','1','1','0','=','dateselect','',NULL,130,'1','2015-07-04 16:11:23','1','2015-07-04 16:11:23',NULL,'0');
INSERT INTO `gen_table_column` VALUES ('cb1085d2ab4e40bc9b93aa822564d924','b81ced186c64430381ec06822525309e','update_by','update_by','varchar(30)','String','updateBy.id','0','1','1','1','0','0','=','input','',NULL,140,'1','2015-07-04 16:11:23','1','2015-07-04 16:11:23',NULL,'0');
INSERT INTO `gen_table_column` VALUES ('d18a7432ed3a49b1b86b980941567c13','b81ced186c64430381ec06822525309e','type','type','varchar(10)','String','type','0','0','1','1','0','0','=','input','',NULL,50,'1','2015-07-04 16:11:23','1','2015-07-04 16:11:23',NULL,'0');
INSERT INTO `gen_table_column` VALUES ('d27cb4c3d5fd4759b45131ee42cf351d','b81ced186c64430381ec06822525309e','parent_id','parent_id','tinyint(1)','This','parent.id|name','0','0','1','1','0','0','=','treeselect','',NULL,20,'1','2015-07-04 16:11:23','1','2015-07-04 16:11:23',NULL,'0');
INSERT INTO `gen_table_column` VALUES ('e6d19b9b0c2b4f15b50d4205c58292ab','b81ced186c64430381ec06822525309e','id','id','bigint(1)','Integer','id','1','0','1','0','0','0','=','input','',NULL,10,'1','2015-07-04 16:11:23','1','2015-07-04 16:11:23',NULL,'0');
INSERT INTO `gen_table_column` VALUES ('f8eb81fbb4f24d45b99442fcf602624e','b81ced186c64430381ec06822525309e','parent_ids','parent_ids','varchar(500)','String','parentIds','0','1','1','1','0','0','like','input','',NULL,30,'1','2015-07-04 16:11:23','1','2015-07-04 16:11:23',NULL,'0');
/*!40000 ALTER TABLE `gen_table_column` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table gen_template
#

DROP TABLE IF EXISTS `gen_template`;
CREATE TABLE `gen_template` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `category` varchar(2000) DEFAULT NULL COMMENT '分类',
  `file_path` varchar(500) DEFAULT NULL COMMENT '生成文件路径',
  `file_name` varchar(200) DEFAULT NULL COMMENT '生成文件名',
  `content` text COMMENT '内容',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_template_del_falg` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代码模板表';

#
# Dumping data for table gen_template
#
LOCK TABLES `gen_template` WRITE;
/*!40000 ALTER TABLE `gen_template` DISABLE KEYS */;

/*!40000 ALTER TABLE `gen_template` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table sys_area
#

DROP TABLE IF EXISTS `sys_area`;
CREATE TABLE `sys_area` (
  `id` varchar(32) DEFAULT NULL,
  `parent_id` varchar(32) DEFAULT NULL,
  `parent_ids` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sort` double(53,0) DEFAULT NULL,
  `code` double(53,0) DEFAULT NULL,
  `type` double(53,0) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `create_by` varchar(32) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(32) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `del_flag` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table sys_area
#
LOCK TABLES `sys_area` WRITE;
/*!40000 ALTER TABLE `sys_area` DISABLE KEYS */;

INSERT INTO `sys_area` VALUES ('1','0','0,','中国',10,100000,1,NULL,'1','2013-05-27','1','2013-05-27','0');
INSERT INTO `sys_area` VALUES ('2','1','0,1,','广东省',20,440000,2,'','1','2013-05-27','1','2015-07-01 21:57:17','0');
INSERT INTO `sys_area` VALUES ('3','2','0,1,2,','深圳市',30,440300,3,'','1','2013-05-27','1','2015-07-01 21:57:55','0');
/*!40000 ALTER TABLE `sys_area` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table sys_dict
#

DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` double(53,0) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `value` double(53,0) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `sort` double(53,0) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `create_by` double(53,0) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` double(53,0) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `del_flag` double(53,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table sys_dict
#
LOCK TABLES `sys_dict` WRITE;
/*!40000 ALTER TABLE `sys_dict` DISABLE KEYS */;

INSERT INTO `sys_dict` VALUES (1,'正常',0,'del_flag','删除标记',10,NULL,1,'2013-05-27',1,'2013-05-27',0);
INSERT INTO `sys_dict` VALUES (2,'删除',1,'del_flag','删除标记',20,NULL,1,'2013-05-27',1,'2013-05-27',0);
INSERT INTO `sys_dict` VALUES (3,'显示',1,'show_hide','显示/隐藏',10,NULL,1,'2013-05-27',1,'2013-05-27',0);
INSERT INTO `sys_dict` VALUES (4,'隐藏',0,'show_hide','显示/隐藏',20,NULL,1,'2013-05-27',1,'2013-05-27',0);
INSERT INTO `sys_dict` VALUES (5,'是',1,'yes_no','是/否',10,NULL,1,'2013-05-27',1,'2013-05-27',0);
INSERT INTO `sys_dict` VALUES (6,'否',0,'yes_no','是/否',20,NULL,1,'2013-05-27',1,'2013-05-27',0);
INSERT INTO `sys_dict` VALUES (7,'红色',NULL,'color','颜色值',10,NULL,1,'2013-05-27',1,'2013-05-27',0);
INSERT INTO `sys_dict` VALUES (8,'绿色',NULL,'color','颜色值',20,NULL,1,'2013-05-27',1,'2013-05-27',0);
INSERT INTO `sys_dict` VALUES (9,'蓝色',NULL,'color','颜色值',30,NULL,1,'2013-05-27',1,'2013-05-27',0);
INSERT INTO `sys_dict` VALUES (10,'黄色',NULL,'color','颜色值',40,NULL,1,'2013-05-27',1,'2013-05-27',0);
INSERT INTO `sys_dict` VALUES (11,'橙色',NULL,'color','颜色值',50,NULL,1,'2013-05-27',1,'2013-05-27',0);
INSERT INTO `sys_dict` VALUES (12,'默认主题',NULL,'theme','主题方案',10,NULL,1,'2013-05-27',1,'2013-05-27',0);
INSERT INTO `sys_dict` VALUES (13,'天蓝主题',NULL,'theme','主题方案',20,NULL,1,'2013-05-27',1,'2013-05-27',0);
INSERT INTO `sys_dict` VALUES (14,'橙色主题',NULL,'theme','主题方案',30,NULL,1,'2013-05-27',1,'2013-05-27',0);
INSERT INTO `sys_dict` VALUES (15,'红色主题',NULL,'theme','主题方案',40,NULL,1,'2013-05-27',1,'2013-05-27',0);
INSERT INTO `sys_dict` VALUES (16,'Flat主题',NULL,'theme','主题方案',60,NULL,1,'2013-05-27',1,'2013-05-27',0);
INSERT INTO `sys_dict` VALUES (17,'国家',1,'sys_area_type','区域类型',10,NULL,1,'2013-05-27',1,'2013-05-27',0);
INSERT INTO `sys_dict` VALUES (18,'省份、直辖市',2,'sys_area_type','区域类型',20,NULL,1,'2013-05-27',1,'2013-05-27',0);
INSERT INTO `sys_dict` VALUES (19,'地市',3,'sys_area_type','区域类型',30,NULL,1,'2013-05-27',1,'2013-05-27',0);
INSERT INTO `sys_dict` VALUES (20,'区县',4,'sys_area_type','区域类型',40,NULL,1,'2013-05-27',1,'2013-05-27',0);
INSERT INTO `sys_dict` VALUES (21,'公司',1,'sys_office_type','机构类型',60,NULL,1,'2013-05-27',1,'2013-05-27',0);
INSERT INTO `sys_dict` VALUES (22,'部门',2,'sys_office_type','机构类型',70,NULL,1,'2013-05-27',1,'2013-05-27',0);
INSERT INTO `sys_dict` VALUES (23,'小组',3,'sys_office_type','机构类型',80,NULL,1,'2013-05-27',1,'2013-05-27',0);
INSERT INTO `sys_dict` VALUES (24,'其它',4,'sys_office_type','机构类型',90,NULL,1,'2013-05-27',1,'2013-05-27',0);
INSERT INTO `sys_dict` VALUES (25,'综合部',1,'sys_office_common','快捷通用部门',30,NULL,1,'2013-05-27',1,'2013-05-27',0);
INSERT INTO `sys_dict` VALUES (26,'开发部',2,'sys_office_common','快捷通用部门',40,NULL,1,'2013-05-27',1,'2013-05-27',0);
INSERT INTO `sys_dict` VALUES (27,'人力部',3,'sys_office_common','快捷通用部门',50,NULL,1,'2013-05-27',1,'2013-05-27',0);
INSERT INTO `sys_dict` VALUES (28,'一级',1,'sys_office_grade','机构等级',10,NULL,1,'2013-05-27',1,'2013-05-27',0);
INSERT INTO `sys_dict` VALUES (29,'二级',2,'sys_office_grade','机构等级',20,NULL,1,'2013-05-27',1,'2013-05-27',0);
INSERT INTO `sys_dict` VALUES (30,'三级',3,'sys_office_grade','机构等级',30,NULL,1,'2013-05-27',1,'2013-05-27',0);
INSERT INTO `sys_dict` VALUES (31,'四级',4,'sys_office_grade','机构等级',40,NULL,1,'2013-05-27',1,'2013-05-27',0);
INSERT INTO `sys_dict` VALUES (32,'所有数据',1,'sys_data_scope','数据范围',10,NULL,1,'2013-05-27',1,'2013-05-27',0);
INSERT INTO `sys_dict` VALUES (33,'所在公司及以下数据',2,'sys_data_scope','数据范围',20,NULL,1,'2013-05-27',1,'2013-05-27',0);
INSERT INTO `sys_dict` VALUES (34,'所在公司数据',3,'sys_data_scope','数据范围',30,NULL,1,'2013-05-27',1,'2013-05-27',0);
INSERT INTO `sys_dict` VALUES (35,'所在部门及以下数据',4,'sys_data_scope','数据范围',40,NULL,1,'2013-05-27',1,'2013-05-27',0);
INSERT INTO `sys_dict` VALUES (36,'所在部门数据',5,'sys_data_scope','数据范围',50,NULL,1,'2013-05-27',1,'2013-05-27',0);
INSERT INTO `sys_dict` VALUES (37,'仅本人数据',8,'sys_data_scope','数据范围',90,NULL,1,'2013-05-27',1,'2013-05-27',0);
INSERT INTO `sys_dict` VALUES (38,'按明细设置',9,'sys_data_scope','数据范围',100,NULL,1,'2013-05-27',1,'2013-05-27',0);
INSERT INTO `sys_dict` VALUES (39,'系统管理',1,'sys_user_type','用户类型',10,NULL,1,'2013-05-27',1,'2013-05-27',0);
INSERT INTO `sys_dict` VALUES (40,'部门经理',2,'sys_user_type','用户类型',20,NULL,1,'2013-05-27',1,'2013-05-27',0);
INSERT INTO `sys_dict` VALUES (41,'普通用户',3,'sys_user_type','用户类型',30,NULL,1,'2013-05-27',1,'2013-05-27',0);
INSERT INTO `sys_dict` VALUES (42,'基础主题',NULL,'cms_theme','站点主题',10,NULL,1,'2013-05-27',1,'2013-05-27',0);
INSERT INTO `sys_dict` VALUES (43,'蓝色主题',NULL,'cms_theme','站点主题',20,NULL,1,'2013-05-27',1,'2013-05-27',1);
INSERT INTO `sys_dict` VALUES (44,'红色主题',NULL,'cms_theme','站点主题',30,NULL,1,'2013-05-27',1,'2013-05-27',1);
INSERT INTO `sys_dict` VALUES (45,'文章模型',NULL,'cms_module','栏目模型',10,NULL,1,'2013-05-27',1,'2013-05-27',0);
INSERT INTO `sys_dict` VALUES (46,'图片模型',NULL,'cms_module','栏目模型',20,NULL,1,'2013-05-27',1,'2013-05-27',1);
INSERT INTO `sys_dict` VALUES (47,'下载模型',NULL,'cms_module','栏目模型',30,NULL,1,'2013-05-27',1,'2013-05-27',1);
INSERT INTO `sys_dict` VALUES (48,'链接模型',NULL,'cms_module','栏目模型',40,NULL,1,'2013-05-27',1,'2013-05-27',0);
INSERT INTO `sys_dict` VALUES (49,'专题模型',NULL,'cms_module','栏目模型',50,NULL,1,'2013-05-27',1,'2013-05-27',1);
INSERT INTO `sys_dict` VALUES (50,'默认展现方式',0,'cms_show_modes','展现方式',10,NULL,1,'2013-05-27',1,'2013-05-27',0);
INSERT INTO `sys_dict` VALUES (51,'首栏目内容列表',1,'cms_show_modes','展现方式',20,NULL,1,'2013-05-27',1,'2013-05-27',0);
INSERT INTO `sys_dict` VALUES (52,'栏目第一条内容',2,'cms_show_modes','展现方式',30,NULL,1,'2013-05-27',1,'2013-05-27',0);
INSERT INTO `sys_dict` VALUES (53,'发布',0,'cms_del_flag','内容状态',10,NULL,1,'2013-05-27',1,'2013-05-27',0);
INSERT INTO `sys_dict` VALUES (54,'删除',1,'cms_del_flag','内容状态',20,NULL,1,'2013-05-27',1,'2013-05-27',0);
INSERT INTO `sys_dict` VALUES (55,'审核',2,'cms_del_flag','内容状态',15,NULL,1,'2013-05-27',1,'2013-05-27',0);
INSERT INTO `sys_dict` VALUES (56,'首页焦点图',1,'cms_posid','推荐位',10,NULL,1,'2013-05-27',1,'2013-05-27',0);
INSERT INTO `sys_dict` VALUES (57,'栏目页文章推荐',2,'cms_posid','推荐位',20,NULL,1,'2013-05-27',1,'2013-05-27',0);
INSERT INTO `sys_dict` VALUES (58,'咨询',1,'cms_guestbook','留言板分类',10,NULL,1,'2013-05-27',1,'2013-05-27',0);
INSERT INTO `sys_dict` VALUES (59,'建议',2,'cms_guestbook','留言板分类',20,NULL,1,'2013-05-27',1,'2013-05-27',0);
INSERT INTO `sys_dict` VALUES (60,'投诉',3,'cms_guestbook','留言板分类',30,NULL,1,'2013-05-27',1,'2013-05-27',0);
INSERT INTO `sys_dict` VALUES (61,'其它',4,'cms_guestbook','留言板分类',40,NULL,1,'2013-05-27',1,'2013-05-27',0);
INSERT INTO `sys_dict` VALUES (67,'接入日志',1,'sys_log_type','日志类型',30,NULL,1,'2013-06-03',1,'2013-06-03',0);
INSERT INTO `sys_dict` VALUES (68,'异常日志',2,'sys_log_type','日志类型',40,NULL,1,'2013-06-03',1,'2013-06-03',0);
INSERT INTO `sys_dict` VALUES (73,'增删改查',NULL,'gen_category','代码生成分类',10,NULL,1,'2013-10-28',1,'2013-10-28',1);
INSERT INTO `sys_dict` VALUES (74,'增删改查（包含从表）',NULL,'gen_category','代码生成分类',20,NULL,1,'2013-10-28',1,'2013-10-28',1);
INSERT INTO `sys_dict` VALUES (75,'树结构',NULL,'gen_category','代码生成分类',30,NULL,1,'2013-10-28',1,'2013-10-28',1);
INSERT INTO `sys_dict` VALUES (76,'=',NULL,'gen_query_type','查询方式',10,NULL,1,'2013-10-28',1,'2013-10-28',1);
INSERT INTO `sys_dict` VALUES (77,'!=',NULL,'gen_query_type','查询方式',20,NULL,1,'2013-10-28',1,'2013-10-28',1);
INSERT INTO `sys_dict` VALUES (78,'&gt;',NULL,'gen_query_type','查询方式',30,NULL,1,'2013-10-28',1,'2013-10-28',1);
INSERT INTO `sys_dict` VALUES (79,'&lt;',NULL,'gen_query_type','查询方式',40,NULL,1,'2013-10-28',1,'2013-10-28',1);
INSERT INTO `sys_dict` VALUES (80,'Between',NULL,'gen_query_type','查询方式',50,NULL,1,'2013-10-28',1,'2013-10-28',1);
INSERT INTO `sys_dict` VALUES (81,'Like',NULL,'gen_query_type','查询方式',60,NULL,1,'2013-10-28',1,'2013-10-28',1);
INSERT INTO `sys_dict` VALUES (82,'Left Like',NULL,'gen_query_type','查询方式',70,NULL,1,'2013-10-28',1,'2013-10-28',1);
INSERT INTO `sys_dict` VALUES (83,'Right Like',NULL,'gen_query_type','查询方式',80,NULL,1,'2013-10-28',1,'2013-10-28',1);
INSERT INTO `sys_dict` VALUES (84,'文本框',NULL,'gen_show_type','字段生成方案',10,NULL,1,'2013-10-28',1,'2013-10-28',1);
INSERT INTO `sys_dict` VALUES (85,'文本域',NULL,'gen_show_type','字段生成方案',20,NULL,1,'2013-10-28',1,'2013-10-28',1);
INSERT INTO `sys_dict` VALUES (86,'下拉框',NULL,'gen_show_type','字段生成方案',30,NULL,1,'2013-10-28',1,'2013-10-28',1);
INSERT INTO `sys_dict` VALUES (87,'复选框',NULL,'gen_show_type','字段生成方案',40,NULL,1,'2013-10-28',1,'2013-10-28',1);
INSERT INTO `sys_dict` VALUES (88,'单选框',NULL,'gen_show_type','字段生成方案',50,NULL,1,'2013-10-28',1,'2013-10-28',1);
INSERT INTO `sys_dict` VALUES (89,'日期选择',NULL,'gen_show_type','字段生成方案',60,NULL,1,'2013-10-28',1,'2013-10-28',1);
INSERT INTO `sys_dict` VALUES (90,'人员选择',NULL,'gen_show_type','字段生成方案',70,NULL,1,'2013-10-28',1,'2013-10-28',1);
INSERT INTO `sys_dict` VALUES (91,'部门选择',NULL,'gen_show_type','字段生成方案',80,NULL,1,'2013-10-28',1,'2013-10-28',1);
INSERT INTO `sys_dict` VALUES (92,'区域选择',NULL,'gen_show_type','字段生成方案',90,NULL,1,'2013-10-28',1,'2013-10-28',1);
INSERT INTO `sys_dict` VALUES (93,'String',NULL,'gen_java_type','Java类型',10,NULL,1,'2013-10-28',1,'2013-10-28',1);
INSERT INTO `sys_dict` VALUES (94,'Long',NULL,'gen_java_type','Java类型',20,NULL,1,'2013-10-28',1,'2013-10-28',1);
INSERT INTO `sys_dict` VALUES (95,'仅持久层',NULL,'gen_category','代码生成分类',40,NULL,1,'2013-10-28',1,'2013-10-28',1);
INSERT INTO `sys_dict` VALUES (96,'男',NULL,'sex','性别',10,NULL,1,'2013-10-28',1,'2013-10-28',0);
INSERT INTO `sys_dict` VALUES (97,'女',NULL,'sex','性别',20,NULL,1,'2013-10-28',1,'2013-10-28',0);
INSERT INTO `sys_dict` VALUES (98,'Integer',NULL,'gen_java_type','Java类型',30,NULL,1,'2013-10-28',1,'2013-10-28',1);
INSERT INTO `sys_dict` VALUES (99,'Double',NULL,'gen_java_type','Java类型',40,NULL,1,'2013-10-28',1,'2013-10-28',1);
INSERT INTO `sys_dict` VALUES (100,'Date',NULL,'gen_java_type','Java类型',50,NULL,1,'2013-10-28',1,'2013-10-28',1);
INSERT INTO `sys_dict` VALUES (101,'User',NULL,'gen_java_type','Java类型',60,NULL,1,'2013-10-28',1,'2013-10-28',1);
INSERT INTO `sys_dict` VALUES (102,'Office',NULL,'gen_java_type','Java类型',70,NULL,1,'2013-10-28',1,'2013-10-28',1);
INSERT INTO `sys_dict` VALUES (103,'Area',NULL,'gen_java_type','Java类型',80,NULL,1,'2013-10-28',1,'2013-10-28',1);
INSERT INTO `sys_dict` VALUES (104,'Custom',NULL,'gen_java_type','Java类型',90,NULL,1,'2013-10-28',1,'2013-10-28',1);
/*!40000 ALTER TABLE `sys_dict` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table sys_log
#

DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `type` char(1) DEFAULT '1' COMMENT '日志类型',
  `title` varchar(255) DEFAULT '' COMMENT '日志标题',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `remote_addr` varchar(255) DEFAULT NULL COMMENT '操作IP地址',
  `user_agent` varchar(255) DEFAULT NULL COMMENT '用户代理',
  `request_uri` varchar(255) DEFAULT NULL COMMENT '请求URI',
  `method` varchar(5) DEFAULT NULL COMMENT '操作方式',
  `params` text COMMENT '操作提交的数据',
  `exception` text COMMENT '异常信息',
  PRIMARY KEY (`id`),
  KEY `sys_log_create_by` (`create_by`),
  KEY `sys_log_request_uri` (`request_uri`),
  KEY `sys_log_type` (`type`),
  KEY `sys_log_create_date` (`create_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日志表';

#
# Dumping data for table sys_log
#
LOCK TABLES `sys_log` WRITE;
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;

INSERT INTO `sys_log` VALUES ('001ce414397948a6a195156e0a96e002','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:34:02','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/tree','GET','','');
INSERT INTO `sys_log` VALUES ('00ee7a31ba564c3bbd84b420be597bd2','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:46:19','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('0148ad7aba7b4fb7b8f6cf0f638f147e','1','内容管理-栏目设置-内容管理','1','2015-07-04 15:29:10','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_0','');
INSERT INTO `sys_log` VALUES ('016fad67b12a429b90aa0d2b93e5c0b1','1','系统设置-系统设置-角色管理','1','2015-07-04 16:35:34','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/role/','GET','repage=','');
INSERT INTO `sys_log` VALUES ('01c400d85d5a49c2b75af13dc5657fdb','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:46:55','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/tree','GET','','');
INSERT INTO `sys_log` VALUES ('01cbdf9e8f0a4613b2d905b7be7379e1','1','内容管理-内容管理-内容管理','1','2015-07-04 16:42:48','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_0','');
INSERT INTO `sys_log` VALUES ('020b2caa09e044fab29484aae41e14b6','1','系统设置-系统设置-菜单管理-查看','1','2015-07-04 16:33:08','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/menu/form','GET','','');
INSERT INTO `sys_log` VALUES ('02511fb9ce1b49888bddd426940b4e44','1','内容管理-内容管理-内容管理-查看','1','2015-07-04 16:38:27','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/tree','GET','','');
INSERT INTO `sys_log` VALUES ('02c2e331a3e348bfbaa49543347efb02','1','内容管理-栏目设置-内容管理','1','2015-07-04 15:33:06','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_0','');
INSERT INTO `sys_log` VALUES ('036ceb2f903349b9abca9987bede493e','1','系统登录','1','2015-07-04 16:05:55','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a','GET','login=','');
INSERT INTO `sys_log` VALUES ('03784aec08ed41519d220ae3041eaa30','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 16:00:42','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/view','POST','tags=&channelId=16&status=1&chanId=16&origin=few&audit=0&type=0&contentTxt=few\r\n&id=11&isRecommand=0&author=few&title=few&shortTitle=&description=&originUrl=&titleImg=','');
INSERT INTO `sys_log` VALUES ('03d253824df2402483f07cbd2f125bf1','1','系统设置-系统设置-角色管理-查看','1','2015-07-04 16:37:45','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/role/form','GET','id=6','');
INSERT INTO `sys_log` VALUES ('03dcb933ccd3479e87d6c9ba9e415f9f','1','系统设置-机构用户-用户管理-查看','1','2015-07-04 16:30:09','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/form','GET','','');
INSERT INTO `sys_log` VALUES ('0444605d5a46459083ecd8f216f08250','1','系统设置-系统设置-菜单管理','1','2015-07-04 16:38:32','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/menu/','GET','tabPageId=jerichotabiframe_2','');
INSERT INTO `sys_log` VALUES ('0496596d15ce46e981384563a943dead','1','内容管理-栏目设置-内容管理','1','2015-07-04 15:14:06','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_0','');
INSERT INTO `sys_log` VALUES ('04d1e596c23d4a579d6924df628610aa','1','系统设置-系统设置-角色管理-修改','1','2015-07-04 16:38:11','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/role/save','POST','dataScope=8&officeIds=&remarks=&office.id=2&oldName=普通用户&menuIds=1,31,32,36,37,38,33,34,35,27,28,29,30,71,56&id=6&useable=1&office.name=公司领导&name=普通用户&roleType=assignment&sysData=1&enname=d&oldEnname=d','');
INSERT INTO `sys_log` VALUES ('04e9a16dbb05481791cc9f07b61f34b3','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:38:23','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/form','GET','chanId=16','');
INSERT INTO `sys_log` VALUES ('067240b3ef9d4797b37d13d1f6d1a66d','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:45:38','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('06b955dcb02d43da89b0cb4d72c2be2f','1','内容管理-内容管理-内容管理-查看','1','2015-07-04 16:54:07','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/tree','GET','','');
INSERT INTO `sys_log` VALUES ('073027d0a4e7440fb587fe008167f7df','1','内容管理-栏目设置-内容管理','1','2015-07-04 15:39:27','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_0','');
INSERT INTO `sys_log` VALUES ('079c31f0f27640188363d90d569ba244','1','内容管理-内容管理-内容管理-查看','1','2015-07-04 16:43:54','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/tree','GET','','');
INSERT INTO `sys_log` VALUES ('079cc1812a9b463bb93c654fa9741e70','1','内容管理-栏目设置-内容管理','1','2015-07-04 15:53:02','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_0','');
INSERT INTO `sys_log` VALUES ('07ba69bb4b7b43bcb0ba6708d60597bf','1','系统设置-机构用户-用户管理-查看','1','2015-07-04 16:22:22','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/list','GET','office.id=1&office.name=科联汇通技术有限公司','');
INSERT INTO `sys_log` VALUES ('07ece338d99e41de874a2e4d50459ba0','1','系统设置-机构用户-用户管理-查看','1','2015-07-04 16:22:27','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/list','GET','office.id=2&office.name=公司领导','');
INSERT INTO `sys_log` VALUES ('08b9bf6faade45af8431a7de8bcab563','1','内容管理-栏目设置-内容管理','1','2015-07-04 16:05:55','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_0','');
INSERT INTO `sys_log` VALUES ('08f5e8e0d02d45bbbbacb9646a45b47c','1','系统设置-系统设置-角色管理-查看','1','2015-07-04 16:28:41','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/role/form','GET','','');
INSERT INTO `sys_log` VALUES ('0943af7cd7914bd78b7459da7ec321c0','1','系统设置-机构用户-用户管理-查看','1','2015-07-04 16:19:04','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/list','GET','','');
INSERT INTO `sys_log` VALUES ('096803e0980d42c087ac0b7e9afd2370','1','内容管理-栏目设置-内容管理','1','2015-07-04 15:35:02','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_0','');
INSERT INTO `sys_log` VALUES ('0a84de9d50794d30b615e2c080375ef6','1','系统设置-系统设置-角色管理-修改','1','2015-07-04 16:41:08','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/role/save','POST','dataScope=8&officeIds=&remarks=&office.id=2&oldName=系统开发人员&id=441cfed923064d59b6b9f4d447f9d72a&menuIds=1,31,32,36,37,38,33,34,35,27,28,29,30,71,56,2,13,20,21,22,17,18,19,14,15,16,3,4,5,6,7,8,9,10,11,1...&useable=1&office.name=公司领导&name=系统开发人员&roleType=assignment&oldEnname=system_dev&enname=dev&sysData=1','');
INSERT INTO `sys_log` VALUES ('0abe4fb89ba34ff48d088ce05e65474b','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:52:50','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','','');
INSERT INTO `sys_log` VALUES ('0ad044e0d23c41f0a70d1a774df6c08e','1','系统设置-机构用户-用户管理-查看','1','2015-07-04 16:22:11','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/list','POST','orderBy=&pageNo=1&office.name=&company.id=&name=&pageSize=30&office.id=&company.name=&loginName=','');
INSERT INTO `sys_log` VALUES ('0ad9bd59dd9f4d18aca473cb667b30f4','1','内容管理-栏目设置-内容管理-修改','1','2015-07-04 15:39:33','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/save','POST','tags=&status=&channelId=16&chanId=16&origin=bb&audit=0&type=0&contentTxt=bb\r\n&id=&isRecommand=0&author=b&parentId=&title=bb&shortTitle=&description=&originUrl=&titleImg=','');
INSERT INTO `sys_log` VALUES ('0c69d821d6e6433a8bbc5be36de987a4','1','内容管理-内容管理-内容管理','1','2015-07-04 16:55:21','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_0','');
INSERT INTO `sys_log` VALUES ('0d09f78bd8a942079d03f4fabd558585','1','内容管理-栏目设置-内容管理-修改','1','2015-07-04 15:41:30','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/save','POST','tags=&channelId=16&status=&chanId=16&origin=bb&audit=0&type=0&contentTxt=bb\r\n&id=&isRecommand=0&parentId=&author=bb&title=bb&shortTitle=&description=&originUrl=&titleImg=','');
INSERT INTO `sys_log` VALUES ('0d2a19fda8ef45f4804cd9f061c6c253','1','系统设置-机构用户-用户管理-修改','1','2015-07-04 16:27:43','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/checkLoginName','GET','oldLoginName=&loginName=devel','');
INSERT INTO `sys_log` VALUES ('0d38bfdb9a1c4d2291803f261604e9d7','1','系统设置-机构用户-用户管理','1','2015-07-04 16:34:32','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/index','GET','tabPageId=jerichotabiframe_1','');
INSERT INTO `sys_log` VALUES ('0d709d4746e4463bb54bb01f0d898f4c','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:33:17','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','POST','title=&pageNo=1&chanId=&pageSize=30&endDate=&beginDate=2015-07-22 00:00:00','');
INSERT INTO `sys_log` VALUES ('0e515e8149634cf0a181274ad2d8e9cd','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 16:22:14','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','','');
INSERT INTO `sys_log` VALUES ('0e803028923f4d5a8403063d288c7e2e','1','系统设置-机构用户-用户管理-查看','1','2015-07-04 16:22:40','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/form','GET','','');
INSERT INTO `sys_log` VALUES ('0e8164381f364b9b833a057e26eb8930','1','系统设置-机构用户-用户管理','1','2015-07-04 16:25:59','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/index','GET','tabPageId=jerichotabiframe_1','');
INSERT INTO `sys_log` VALUES ('0eb8e39945ac438f8250eae50cccf97d','1','内容管理-内容管理-内容管理-查看','1','2015-07-04 16:54:16','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=0&chanId=1','');
INSERT INTO `sys_log` VALUES ('0edc792f566641cc9b89014e8483b8bf','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:17:03','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','POST','title=t&status=-1&pageNo=1&chanId=&pageSize=30&endDate=&beginDate=','');
INSERT INTO `sys_log` VALUES ('0f08ac2c768646d7b8f6b8b4afe9b876','1','系统登录','1','2015-07-04 15:42:18','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('0f097aa6bd314fc5a6905444666f9420','1','系统设置-系统设置-角色管理','1','2015-07-04 16:37:43','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/role/','GET','','');
INSERT INTO `sys_log` VALUES ('0f47190016d84342b056e2f9d24bae08','1','内容管理-栏目设置-内容管理','1','2015-07-04 16:03:27','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_0','');
INSERT INTO `sys_log` VALUES ('0f97e9b52f2e4d99bfff0e68ca4a6cca','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 16:19:03','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/tree','GET','','');
INSERT INTO `sys_log` VALUES ('0fb224032ac541ce80f8b3305b02361f','1','内容管理-栏目设置-内容管理-修改','1','2015-07-04 16:03:23','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/delete','POST','parentId=1&type=0&ids=14&chanId=16','');
INSERT INTO `sys_log` VALUES ('10943c6167e84b38a15bba5a82de10a0','1','系统设置-系统设置-菜单管理-修改','1','2015-07-04 16:33:11','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/menu/save','POST','id=&icon=&sort=5030&parent.id=1&name=aa&target=&permission=&remarks=&href=&parent.name=功能菜单&isShow=1','');
INSERT INTO `sys_log` VALUES ('10c6aa6db0d24fe49b6fb357cf1931a8','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:53:01','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('115338e6f1fe42ceb9b138f422fae344','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:38:56','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/form','GET','chanId=16','');
INSERT INTO `sys_log` VALUES ('116f0cb57c7347d68e5398b8aa1a76b5','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:54:22','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=0&chanId=1','');
INSERT INTO `sys_log` VALUES ('1257452a3a0f4269bc2f0eba69ae54f1','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:53:02','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/tree','GET','','');
INSERT INTO `sys_log` VALUES ('12eb290b5d02477589714dab73b1519e','1','代码生成-代码生成-业务表配置','1','2015-07-04 16:39:49','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/gen/genTable','GET','tabPageId=jerichotabiframe_5','');
INSERT INTO `sys_log` VALUES ('13238285a6654a6cb789aaf9202a5a0b','1','内容管理-栏目设置-内容管理','1','2015-07-04 16:24:16','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_0','');
INSERT INTO `sys_log` VALUES ('1429c7ccf5bb4004997239d30973aad4','1','内容管理-栏目设置-内容管理','1','2015-07-04 15:34:02','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_0','');
INSERT INTO `sys_log` VALUES ('14694b338bee4902840fce02b3fc6e23','1','系统设置-系统设置-菜单管理','1','2015-07-04 16:34:57','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/menu/','GET','tabPageId=jerichotabiframe_3','');
INSERT INTO `sys_log` VALUES ('147b5e4e3b37451eacc560c945bad1aa','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 16:00:06','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('149c44a778744ac28dc67a8a2b01f87a','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:30:13','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','POST','title=&pageNo=1&chanId=&pageSize=30&endDate=&beginDate=2015-07-10 00:00:00','');
INSERT INTO `sys_log` VALUES ('15766478b19e4c94892a23f32b98a90d','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 16:02:48','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','','');
INSERT INTO `sys_log` VALUES ('15d2228db34e4db281b0cb54cfc69026','1','系统设置-机构用户-用户管理-查看','1','2015-07-04 16:26:36','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/form','GET','','');
INSERT INTO `sys_log` VALUES ('161257aa43824eceb2bfc28957625b5a','1','系统设置-机构用户-用户管理-修改','1','2015-07-04 16:35:12','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/checkLoginName','GET','oldLoginName=yfb_dev&loginName=yfb_dev','');
INSERT INTO `sys_log` VALUES ('16a39d5faa504886b807803cb0685d1d','1','内容管理-栏目设置-内容管理','1','2015-07-04 15:27:12','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_0','');
INSERT INTO `sys_log` VALUES ('1742b0f11c6a4186b3ccf02867a04520','1','内容管理-栏目设置-内容管理','1','2015-07-04 15:27:49','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_0','');
INSERT INTO `sys_log` VALUES ('17453338c20747cdba48f0ad380f2343','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:43:19','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('18372966810e417faffb1b0eb625af5b','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:53:18','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','','');
INSERT INTO `sys_log` VALUES ('18592a28616e4b459504f38e96ac9f41','1','代码生成-代码生成-代码模板管理','1','2015-07-04 16:12:23','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/gen/genTemplate','GET','tabPageId=jerichotabiframe_3','');
INSERT INTO `sys_log` VALUES ('190a478d44734093b93c794fb3760553','1','系统设置-系统设置-角色管理-查看','1','2015-07-04 16:38:17','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/role/form','GET','id=1','');
INSERT INTO `sys_log` VALUES ('192530b1c6804ba28d00c9f064fb1780','1','内容管理-栏目设置-内容管理','1','2015-07-04 15:46:55','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_0','');
INSERT INTO `sys_log` VALUES ('19266e82677049e9961ea7181c248a04','1','系统设置-机构用户-用户管理','1','2015-07-04 16:39:27','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/index','GET','tabPageId=jerichotabiframe_1','');
INSERT INTO `sys_log` VALUES ('193fca0bb7764a5e9d5e82995d41c37c','1','系统设置-机构用户-用户管理-查看','1','2015-07-04 16:22:26','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/list','GET','office.id=2&office.name=公司领导','');
INSERT INTO `sys_log` VALUES ('19632b5119e8426ea9afdb9ae72e0713','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:52:14','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/form','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('19a1e25f730c4ec9847e86b9f4b6c4a2','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:46:55','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','','');
INSERT INTO `sys_log` VALUES ('19bf7c7030864c509923d713df87d2f9','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:46:53','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('19c0fde4570f43988e7885524a219c73','1','内容管理-内容管理-内容管理-查看','1','2015-07-04 16:57:32','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','','');
INSERT INTO `sys_log` VALUES ('19d20b7a2a5c4a5280a78ef672879953','1','系统设置-系统设置-菜单管理-修改','1','2015-07-04 16:37:01','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/menu/save','POST','id=32&icon=&sort=450&parent.id=31&name=内容管理&target=&permission=&remarks=&href=&parent.name=内容管理&isShow=1','');
INSERT INTO `sys_log` VALUES ('19fa96651641491999ac6311f89aef1c','1','系统设置-机构用户-用户管理-修改','1','2015-07-04 16:28:12','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/checkLoginName','GET','oldLoginName=&loginName=yf','');
INSERT INTO `sys_log` VALUES ('1b7f23c8fa1046eba0681a97ebcc813a','1','系统设置-机构用户-用户管理-修改','1','2015-07-04 16:28:14','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/checkLoginName','GET','oldLoginName=&loginName=yfb_de','');
INSERT INTO `sys_log` VALUES ('1bd7a3a6d2c646178d3839c16799a2eb','1','系统设置-机构用户-用户管理','1','2015-07-04 16:43:56','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/index','GET','tabPageId=jerichotabiframe_1','');
INSERT INTO `sys_log` VALUES ('1c05f03d048344dc88db63269a97f889','1','内容管理-内容管理-内容管理-查看','1','2015-07-04 16:57:17','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('1c52ee940dae4bac91c073706818b706','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:38:21','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/tree','GET','','');
INSERT INTO `sys_log` VALUES ('1c738b14532844b0979b0a3db1b2addd','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:39:28','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('1c81a124aaaf47208b8bddee9783ab5a','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:30:26','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/tree','GET','','');
INSERT INTO `sys_log` VALUES ('1d3b537b211d490f99c2f6423429e16f','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:46:25','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/form','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('1d5a683a7df348e3bab44956915baba0','1','内容管理-栏目设置-内容管理-修改','1','2015-07-04 15:38:09','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/save','POST','tags=&channelId=16&status=&chanId=16&origin=bb&audit=0&type=0&contentTxt=bb\r\n&id=&isRecommand=0&parentId=&author=bb&title=bb&shortTitle=&description=&originUrl=&titleImg=','');
INSERT INTO `sys_log` VALUES ('1e01f4c005554e5a9cc1a302e7e5a45c','1','内容管理-栏目设置-内容管理-修改','1','2015-07-04 16:00:15','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/save','POST','tags=&status=1&channelId=16&chanId=16&origin=yy&audit=0&type=0&contentTxt=yy\r\n&id=14&isRecommand=0&author=yy&parentId=1&title=yy&shortTitle=&description=&originUrl=&titleImg=','');
INSERT INTO `sys_log` VALUES ('1e62eddc0b984155911a0c69205b2e4a','1','系统设置-系统设置-角色管理-修改','1','2015-07-04 16:37:25','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/role/assign','GET','id=1','');
INSERT INTO `sys_log` VALUES ('1e64f6544cbf4fd59dfcc5a3c2d665e9','1','系统登录','1','2015-07-04 16:19:01','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/menu/tree','GET','parentId=27','');
INSERT INTO `sys_log` VALUES ('1e87e4fa14d542efbf3ba1a0b3d4896b','1','内容管理-内容管理-内容管理-查看','1','2015-07-04 16:57:36','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','POST','parentId=&title=&pageNo=1&chanId=&pageSize=10&endDate=&beginDate=','');
INSERT INTO `sys_log` VALUES ('1f602be439db466db30309f3055fe1e0','1','内容管理-栏目设置-内容管理','1','2015-07-04 16:11:06','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_0','');
INSERT INTO `sys_log` VALUES ('1f72ea01dd2e48928f1117313f20e38e','1','系统设置-机构用户-用户管理-查看','1','2015-07-04 16:35:04','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/list','GET','office.name=研发部&office.id=6','');
INSERT INTO `sys_log` VALUES ('203222b6a3d645d697ccd8594e4fa810','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 16:03:25','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=17','');
INSERT INTO `sys_log` VALUES ('20e66ea3d00f4bdb8bff9bc57aa88286','1','系统设置-系统设置-角色管理-修改','1','2015-07-04 16:40:52','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/role/save','POST','dataScope=1&officeIds=&remarks=&office.id=2&oldName=系统管理员&id=1&menuIds=1,31,32,36,37,38,33,34,35,27,28,29,30,71,56,2,13,20,21,22,17,18,19,14,15,16,3,4,5,6,7,8,9,10,11,1...&useable=1&office.name=公司领导&name=系统管理员&roleType=assignment&oldEnname=dept&enname=dept&sysData=1','');
INSERT INTO `sys_log` VALUES ('214e6d49c3b34ef682736cf718e51069','1','内容管理-栏目设置-内容管理-修改','1','2015-07-04 15:38:28','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/save','POST','tags=&status=&channelId=16&chanId=16&origin=cc&audit=0&type=0&contentTxt=cc\r\n&id=&isRecommand=0&author=cc&parentId=&title=cc&shortTitle=&description=&originUrl=&titleImg=','');
INSERT INTO `sys_log` VALUES ('21d4f99c1ef8408fa41fb46c9c4149b8','1','内容管理-栏目设置-内容管理','1','2015-07-04 16:03:17','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_0','');
INSERT INTO `sys_log` VALUES ('240b79694ade487bbd7dcad944d5d4e7','1','我的面板-个人信息-修改密码','1','2015-07-04 16:05:00','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/modifyPwd','GET','tabPageId=jerichotabiframe_6','');
INSERT INTO `sys_log` VALUES ('24b8f8c9d8c64d00b74d3bd1cbe59661','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:52:59','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('24d526a34c3f48dcb546fd5d8a131bab','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:53:18','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/tree','GET','','');
INSERT INTO `sys_log` VALUES ('25491d562dc8416aab0940f6f1e31e41','1','内容管理-栏目设置-内容管理-修改','1','2015-07-04 15:57:46','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/save','POST','tags=&status=&channelId=16&chanId=16&origin=be&audit=0&type=0&contentTxt=be\r\n&id=&isRecommand=0&author=be&parentId=1&title=beb&shortTitle=&description=&originUrl=&titleImg=','');
INSERT INTO `sys_log` VALUES ('25701e29c8e541838a1b754655407584','1','系统登录','1','2015-07-04 16:16:50','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a','GET','login=','');
INSERT INTO `sys_log` VALUES ('2574685c5acf45848c78ac1d71476868','1','系统设置-机构用户-用户管理-修改','1','2015-07-04 16:28:11','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/checkLoginName','GET','oldLoginName=&loginName=y','');
INSERT INTO `sys_log` VALUES ('2616b68efd184af494d125f55eba96c3','1','内容管理-内容管理-内容管理-查看','1','2015-07-04 16:58:22','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','POST','parentId=&title=&pageNo=1&chanId=&pageSize=10&endDate=&beginDate=','');
INSERT INTO `sys_log` VALUES ('26216339d35e4e8ea07b51ab15d0500a','1','代码生成-代码生成-生成方案配置','1','2015-07-04 16:05:59','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/gen/genScheme','GET','tabPageId=jerichotabiframe_2','');
INSERT INTO `sys_log` VALUES ('2623e266b4354d3ca48810f0ec86a2df','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:34:38','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','POST','title=aa&pageNo=1&chanId=&pageSize=30&endDate=&beginDate=','');
INSERT INTO `sys_log` VALUES ('262899a425b948f1931e0e4b07cc114a','1','我的面板-个人信息-个人信息','1','2015-07-04 16:04:07','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/info','GET','tabPageId=jerichotabiframe_3','');
INSERT INTO `sys_log` VALUES ('26f4770e893c46afb94a4421d4c340d2','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:38:09','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=null&chanId=16','');
INSERT INTO `sys_log` VALUES ('273ee24cb1874a79bdfa53546c6e6d86','1','系统设置-系统设置-角色管理','1','2015-07-04 16:38:47','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/role/','GET','','');
INSERT INTO `sys_log` VALUES ('27881a4a06cd4b05b74d8dda9d5877d0','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:53:04','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=0&chanId=1','');
INSERT INTO `sys_log` VALUES ('279346d754394bb2814ac791d7b80401','1','内容管理-栏目设置-分类管理','1','2015-07-04 16:03:40','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/classify/','GET','tabPageId=jerichotabiframe_1','');
INSERT INTO `sys_log` VALUES ('279a3d4319ff43519e14a67933aa6968','1','内容管理-栏目设置-内容管理-修改','1','2015-07-04 15:18:31','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/save','POST','tags=&channelId=16&status=&chanId=16&origin=tt&audit=0&type=0&contentTxt=tt\r\n&id=&isRecommand=0&author=tt&title=tt&shortTitle=tt&description=&originUrl=&titleImg=','');
INSERT INTO `sys_log` VALUES ('283e86c856f64fab8e4d193dc26ffa96','1','内容管理-栏目设置-内容管理','1','2015-07-04 16:22:14','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_0','');
INSERT INTO `sys_log` VALUES ('28de6bad13364f2cb782fa9601d38744','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:18:52','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('2ab3ed0ed4964e6db8df1bc23e37e7a3','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:27:12','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/tree','GET','','');
INSERT INTO `sys_log` VALUES ('2b186e8056ca46afa78bd7731175a5c0','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:30:03','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/tree','GET','','');
INSERT INTO `sys_log` VALUES ('2b62bef5864448cf984fcceea60c9d15','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:54:15','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','','');
INSERT INTO `sys_log` VALUES ('2b7f1878ed1b450d9b9b29786354c72b','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:27:39','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','','');
INSERT INTO `sys_log` VALUES ('2bc348bc2f9d45588de59e5048aba2a3','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 16:00:11','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('2ce31e02dfb64e7e8a464837db5fb2cd','1','系统设置-系统设置-角色管理-修改','1','2015-07-04 16:29:05','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/role/save','POST','dataScope=8&officeIds=&remarks=&office.id=2&oldName=&menuIds=1,31,32,36,37,38,33,34,35,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,27,28,29,30,71,56,57,58...&id=&useable=1&office.name=公司领导&name=开发人员&roleType=assignment&sysData=1&enname=1&oldEnname=','');
INSERT INTO `sys_log` VALUES ('2d3ae00d39424ae7983758e2f0567901','1','系统设置-机构用户-用户管理-查看','1','2015-07-04 16:24:23','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/list','GET','office.id=2&office.name=公司领导','');
INSERT INTO `sys_log` VALUES ('2d459899c7b042ba92dffb61a0c1f6c8','1','内容管理-内容管理-内容管理-查看','1','2015-07-04 16:55:21','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/tree','GET','','');
INSERT INTO `sys_log` VALUES ('2d5c6871aff64d4799cc432f1398ce5a','1','内容管理-内容管理-内容管理','1','2015-07-04 16:39:20','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_0','');
INSERT INTO `sys_log` VALUES ('2e3f70c462cc4aafbb4a1adf2ba7ee20','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:36:44','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/form','GET','chanId=16','');
INSERT INTO `sys_log` VALUES ('2e444c04068642a4ae794a3676331b3d','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:30:59','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/tree','GET','','');
INSERT INTO `sys_log` VALUES ('2e7386f21c004ad18d20e40d1dfd769f','1','内容管理-栏目设置-内容管理','1','2015-07-04 15:38:21','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_0','');
INSERT INTO `sys_log` VALUES ('2ec40a45f4244f638bf72b0f66335b91','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 16:16:51','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/tree','GET','','');
INSERT INTO `sys_log` VALUES ('2eee41c981d14d989444de5edc454a79','1','系统设置-机构用户-用户管理-查看','1','2015-07-04 16:22:27','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/list','GET','office.id=1&office.name=科联汇通技术有限公司','');
INSERT INTO `sys_log` VALUES ('3006c74bd1f44d079118b8219a68ef9f','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:58:05','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=17','');
INSERT INTO `sys_log` VALUES ('306bed3d33044ed4b01a6df1778b409e','1','系统设置-机构用户-用户管理-查看','1','2015-07-04 16:24:19','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/list','GET','','');
INSERT INTO `sys_log` VALUES ('3182249058e540e090923205b0ee54b3','1','内容管理-栏目设置-内容管理','1','2015-07-04 16:00:04','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_0','');
INSERT INTO `sys_log` VALUES ('3249d806fb7844e98bb8e99c1055a403','1','系统设置-系统设置-菜单管理','1','2015-07-04 16:19:06','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/menu/','GET','tabPageId=jerichotabiframe_2','');
INSERT INTO `sys_log` VALUES ('32da86d432ec4402a5e2a96de2397781','1','系统设置-系统设置-角色管理','1','2015-07-04 16:43:13','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/role/','GET','tabPageId=jerichotabiframe_3','');
INSERT INTO `sys_log` VALUES ('337de20e37304f358eeb7df56c3eb818','1','内容管理-栏目设置-内容管理','1','2015-07-04 15:34:13','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_0','');
INSERT INTO `sys_log` VALUES ('33b5abd1fdda45e69dc91e932398119a','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 16:01:23','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('33d0ae4bd30348149be7f895041861f1','1','系统设置-机构用户-用户管理','1','2015-07-04 16:22:15','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/index','GET','tabPageId=jerichotabiframe_1','');
INSERT INTO `sys_log` VALUES ('345ff279a6c84a15aac4aee34a64d0df','1','内容管理-内容管理-内容管理-查看','1','2015-07-04 16:57:18','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/form','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('34bdd6b6ce1341429010b0fbc6e0daf9','1','系统设置-系统设置-角色管理-查看','1','2015-07-04 16:35:36','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/role/form','GET','id=6','');
INSERT INTO `sys_log` VALUES ('3703cc0700e0436d900958a2ad3ed952','1','系统设置-机构用户-用户管理','1','2015-07-04 16:36:37','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/index','GET','tabPageId=jerichotabiframe_1','');
INSERT INTO `sys_log` VALUES ('37514151effe49a2a22e9959e91b35a3','1','系统设置-系统设置-字典管理','1','2015-07-04 16:35:00','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/dict/','GET','tabPageId=jerichotabiframe_4','');
INSERT INTO `sys_log` VALUES ('38d5816dab8a4eb8b14f366918a99e5f','1','内容管理-内容管理-内容管理-查看','1','2015-07-04 16:38:27','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','','');
INSERT INTO `sys_log` VALUES ('38d63fe9e9ca4d0bbac270c4772399e8','1','系统设置-机构用户-用户管理-修改','1','2015-07-04 16:27:37','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/checkLoginName','GET','oldLoginName=&loginName=test','');
INSERT INTO `sys_log` VALUES ('394c79c416194f5f8a4396c54dbddae7','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 16:03:27','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/tree','GET','','');
INSERT INTO `sys_log` VALUES ('3a553811801442eabdd5218dd4fd9dd6','1','内容管理-栏目设置-内容管理-修改','1','2015-07-04 15:52:08','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/save','POST','tags=&status=&channelId=16&chanId=16&origin=ff&audit=0&type=0&contentTxt=ff\r\n&id=&isRecommand=0&author=ff&parentId=1&title=ff&shortTitle=&description=&originUrl=&titleImg=','');
INSERT INTO `sys_log` VALUES ('3b421c004df9423882d43a04f13a04b1','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 16:03:25','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('3bda26d481e64cf1873028fa391a01c8','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:57:48','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/form','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('3bdd35838b574eae9fd12d8c87c653be','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:54:12','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=17','');
INSERT INTO `sys_log` VALUES ('3bebb79142b64706bc2edcffef1c12ef','1','系统设置-系统设置-角色管理','1','2015-07-04 16:38:36','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/role/','GET','tabPageId=jerichotabiframe_4','');
INSERT INTO `sys_log` VALUES ('3d14e95f2cf146d5baf333b40bff7e62','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:29:28','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('3d7c28c385c14e4d92c9a9e05737eaeb','1','系统登录','1','2015-07-04 16:57:12','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a','GET','login=','');
INSERT INTO `sys_log` VALUES ('3d8cd5cd565c4e01b3c0a484d9c482f1','1','系统设置-机构用户-用户管理-查看','1','2015-07-04 16:26:01','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/form','GET','id=6','');
INSERT INTO `sys_log` VALUES ('3e43b5caf18940bf93c423c7ea241dfe','1','我的面板-个人信息-个人信息','1','2015-07-04 16:04:59','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/info','GET','','');
INSERT INTO `sys_log` VALUES ('3f3f1f810fbc4daeb403b68110be1645','1','系统设置-机构用户-用户管理','1','2015-07-04 16:24:19','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/index','GET','tabPageId=jerichotabiframe_1','');
INSERT INTO `sys_log` VALUES ('3fc4d1d91d1c40eca82b97bfcbb78bbc','1','系统设置-机构用户-机构管理','1','2015-07-04 16:45:30','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/office/','GET','tabPageId=jerichotabiframe_4','');
INSERT INTO `sys_log` VALUES ('3fd682a9859048fbbb16d7578aa111fe','1','系统设置-系统设置-角色管理-修改','1','2015-07-04 16:37:38','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/role/assign','GET','id=441cfed923064d59b6b9f4d447f9d72a','');
INSERT INTO `sys_log` VALUES ('3ff3de0215ce4c448ac524fd482e9098','1','系统登录','1','2015-07-04 15:14:02','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a;JSESSIONID=cb28a087390b47cfa508729fb41db74d','GET','','');
INSERT INTO `sys_log` VALUES ('40841d7c1c2a4f3b872c90b58232bdc2','1','内容管理-栏目设置-内容管理-修改','1','2015-07-04 15:46:19','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/save','POST','tags=&channelId=16&status=&chanId=16&origin=dd&audit=0&type=0&contentTxt=dd\r\n&id=&isRecommand=0&parentId=1&author=dd&title=dd&shortTitle=&description=&originUrl=&titleImg=','');
INSERT INTO `sys_log` VALUES ('40c88f042f324889abc0ce748babb79c','1','系统登录','1','2015-07-04 15:43:19','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('410bb830e6344a0299105bbe9c971e1a','1','内容管理-栏目设置-内容管理','1','2015-07-04 15:15:53','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_14','');
INSERT INTO `sys_log` VALUES ('41587b9c7d544deaae9b987912d15aeb','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:54:32','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('41c6ab175b884aa886a86c6a55c1960c','1','系统设置-日志查询-日志查询','1','2015-07-04 16:45:03','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/log','GET','tabPageId=jerichotabiframe_3','');
INSERT INTO `sys_log` VALUES ('41e464be0240492ab41890a2db8e5f46','1','内容管理-栏目设置-内容管理-修改','1','2015-07-04 15:58:05','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/save','POST','tags=&channelId=17&status=&chanId=17&origin=cq&audit=0&type=0&contentTxt=cq\r\n&id=&isRecommand=0&parentId=1&author=ce&title=bes&shortTitle=&description=&originUrl=&titleImg=','');
INSERT INTO `sys_log` VALUES ('42349b1f01b94cc59dd035150e07d69f','1','内容管理-内容管理-内容管理-查看','1','2015-07-04 16:58:19','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','POST','parentId=&title=&pageNo=2&chanId=&pageSize=10&endDate=&beginDate=','');
INSERT INTO `sys_log` VALUES ('427725bc507c45538d10a7ec9c666629','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:38:19','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('428989b72b1343929fc812c0a5772ffb','1','系统登录','1','2015-07-04 16:39:20','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a','GET','login=','');
INSERT INTO `sys_log` VALUES ('42a572d1fc8344059d83e08e6616a514','1','系统设置-机构用户-用户管理','1','2015-07-04 16:27:09','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/index','GET','tabPageId=jerichotabiframe_1','');
INSERT INTO `sys_log` VALUES ('42c04989a476463b9920ae43cbe7e9f5','1','系统设置-系统设置-角色管理','1','2015-07-04 16:40:52','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/role/','GET','repage=','');
INSERT INTO `sys_log` VALUES ('44523145b29745d89cb2387b739bca35','1','系统设置-系统设置-角色管理','1','2015-07-04 16:40:45','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/role/','GET','repage=','');
INSERT INTO `sys_log` VALUES ('4506839e893e46e9b8c121c80fd27abd','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 16:00:04','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/tree','GET','','');
INSERT INTO `sys_log` VALUES ('455b2cb4cb8043b0bd379574aaa97a04','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 16:00:15','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('46add55d95914631b05e571dda356684','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:29:33','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','POST','title=&status=-1&pageNo=1&chanId=16&pageSize=30&endDate=&beginDate=','');
INSERT INTO `sys_log` VALUES ('47081330b8424a92b05910a8489374ce','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:32:32','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/tree','GET','','');
INSERT INTO `sys_log` VALUES ('47450d958fbf4027bf88ce111124bb09','1','系统设置-系统设置-角色管理','1','2015-07-04 16:40:20','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/role/','GET','tabPageId=jerichotabiframe_11','');
INSERT INTO `sys_log` VALUES ('4828547ad78f4e56ae1e20e63c741cb7','1','系统设置-机构用户-用户管理-修改','1','2015-07-04 16:28:12','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/checkLoginName','GET','oldLoginName=&loginName=ys','');
INSERT INTO `sys_log` VALUES ('492e0a6989f64b59b09caa2d1035b81f','1','内容管理-内容管理-内容管理','1','2015-07-04 16:57:32','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_0','');
INSERT INTO `sys_log` VALUES ('4944ef3c0b904821983a7e4c03810b61','1','内容管理-栏目设置-内容管理','1','2015-07-04 16:05:21','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_0','');
INSERT INTO `sys_log` VALUES ('495994740acf44829b5144ecd76b5c98','1','系统设置-机构用户-用户管理-查看','1','2015-07-04 16:30:13','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/list','GET','office.name=研发部&office.id=6','');
INSERT INTO `sys_log` VALUES ('49906b372d8c4094bda38cec5696cb8c','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:57:55','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=17','');
INSERT INTO `sys_log` VALUES ('49cfba870794475585cd9ce13d74e845','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:32:54','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/tree','GET','','');
INSERT INTO `sys_log` VALUES ('49d904faf826425d9a01466e1a3de792','1','系统设置-机构用户-用户管理-查看','1','2015-07-04 16:36:37','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/list','GET','','');
INSERT INTO `sys_log` VALUES ('49f851d4aedf4417b7d2de2de18215f5','1','内容管理-内容管理-内容管理-查看','1','2015-07-04 16:54:25','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=0&chanId=1','');
INSERT INTO `sys_log` VALUES ('4a769b06065348019b6ca8d0e2085c44','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 16:20:10','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/tree','GET','','');
INSERT INTO `sys_log` VALUES ('4a8e6998d83c4b32a1f4ec774b8e7651','1','内容管理-内容管理-内容管理-修改','1','2015-07-04 16:57:29','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/save','POST','tags=&status=&channelId=16&chanId=16&origin=test&audit=0&type=0&contentTxt=test\r\n&id=&isRecommand=0&author=test&parentId=1&title=test&shortTitle=&description=&originUrl=&titleImg=','');
INSERT INTO `sys_log` VALUES ('4aab4825e38d4b7dacfbafa338fa0706','1','系统设置-机构用户-机构管理-查看','1','2015-07-04 16:45:35','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/office/form','GET','id=1','');
INSERT INTO `sys_log` VALUES ('4b2c6a7507534a2ea1b6093f1160b872','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:59:14','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/form','GET','id=14&parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('4ba02ab30558441b8bcfeebd736272f7','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 16:03:39','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/form','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('4bc39ebcb3274ddb9018b72489cb2f0f','1','内容管理-内容管理-内容管理-查看','1','2015-07-04 16:43:54','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','','');
INSERT INTO `sys_log` VALUES ('4bdd081c546a446d88cf2513f012a417','1','内容管理-栏目设置-内容管理-修改','1','2015-07-04 15:53:56','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/save','POST','tags=&channelId=17&status=&chanId=17&origin=few&audit=0&type=0&contentTxt=few\r\n&id=&isRecommand=0&parentId=1&author=few&title=few&shortTitle=&description=&originUrl=&titleImg=','');
INSERT INTO `sys_log` VALUES ('4c281bda24a44ff7bb9c2897c82588d1','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:26:04','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('4d42e1748b3d4c8f94d5579fe7c8ae36','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 16:00:30','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/form','GET','id=14&parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('4deae50c8a474376a6d0ec2f9c5d081e','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:16:55','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','','');
INSERT INTO `sys_log` VALUES ('4ebd3be401234b1d9f05067aa1cbe5c0','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:42:19','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('4fd8db2dd8974648967b5b2cffaa3e8f','1','系统设置-机构用户-用户管理-查看','1','2015-07-04 16:40:01','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/form','GET','id=1','');
INSERT INTO `sys_log` VALUES ('503706f7308e4bbcbe584e66d09ecf20','1','系统设置-机构用户-机构管理-修改','1','2015-07-04 16:45:43','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/office/save','POST','primaryPerson.id=&phone=&fax=&area.id=2&office.primaryPerson.name=&remarks=&code=100000&type=1&master=&id=1&area.name=广东省&useable=1&office.deputyPerson.name=&address=&email=&parent.id=&name=科联汇通科技有限公司&zipCode=&grade=1&parent.name=&deputyPerson.id=','');
INSERT INTO `sys_log` VALUES ('50489e1886104f23a3769b550e589887','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:41:36','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('50e18223474c40a0a13d4189296552a0','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 16:36:35','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','','');
INSERT INTO `sys_log` VALUES ('50e20a6f914148acaa4d9b6d1662158c','1','系统登录','1','2015-07-04 15:45:35','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('514e8e7a56ad4e6eb8fcfd3d62125df0','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:54:04','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=17','');
INSERT INTO `sys_log` VALUES ('515076a46eda4898bf24ff683c56967b','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 16:00:04','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','','');
INSERT INTO `sys_log` VALUES ('515d605f61f8476c8a52da13a0962f2c','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:52:40','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/tree','GET','','');
INSERT INTO `sys_log` VALUES ('52058510cf2047f0b9bbacbdfc658023','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:53:05','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('528f4d6830db4995bc5a64952198d46e','1','内容管理-栏目设置-内容管理-修改','1','2015-07-04 15:46:35','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/save','POST','tags=&channelId=16&status=&chanId=16&origin=ss&audit=0&type=0&contentTxt=ss\r\n&id=&isRecommand=0&parentId=1&author=ss&title=ss&shortTitle=&description=&originUrl=&titleImg=','');
INSERT INTO `sys_log` VALUES ('531f8db160ee4e1aa78312d636dd9a18','1','系统设置-机构用户-用户管理-修改','1','2015-07-04 16:27:27','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/checkLoginName','GET','oldLoginName=&loginName=dev','');
INSERT INTO `sys_log` VALUES ('534fac1bdad14f3eaa35f0d1a564b613','1','系统设置-机构用户-用户管理-查看','1','2015-07-04 16:22:19','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/list','GET','office.id=1&office.name=科联汇通技术有限公司','');
INSERT INTO `sys_log` VALUES ('5359a92a8af64a21b3046cb669df3bf1','1','系统登录','1','2015-07-04 16:11:04','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a','GET','login=','');
INSERT INTO `sys_log` VALUES ('53d0cd71647643e9891ba0d13da28cf2','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:54:22','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=17','');
INSERT INTO `sys_log` VALUES ('551f614d26664a55b2ee04c913a743f8','1','系统设置-系统设置-字典管理','1','2015-07-04 15:14:35','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/dict/','GET','tabPageId=jerichotabiframe_12','');
INSERT INTO `sys_log` VALUES ('5529fa5cdb6644b4bdf13d1cf58fb1cb','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:34:33','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','POST','title=&pageNo=1&chanId=&pageSize=30&endDate=&beginDate=','');
INSERT INTO `sys_log` VALUES ('553b206cee0f4a76a2f8c3eec41e8ca4','1','系统登录','1','2015-07-04 15:36:43','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','POST','parentId=1&title=a&pageNo=1&chanId=16&pageSize=30&endDate=&beginDate=','');
INSERT INTO `sys_log` VALUES ('554e35c990fa42cc8f309abed599cd7f','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:52:40','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','','');
INSERT INTO `sys_log` VALUES ('557f61283f5e400fb0ea75b8219bc7cb','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 16:02:48','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/tree','GET','','');
INSERT INTO `sys_log` VALUES ('56149497b4a44b9e9c22182d56d73843','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:32:55','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','','');
INSERT INTO `sys_log` VALUES ('562e42daae1d4db69283e91a7e0a9333','1','内容管理-内容管理-内容管理','1','2015-07-04 16:38:26','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_0','');
INSERT INTO `sys_log` VALUES ('5645e685c94b4e58a9e393cec9c3ed89','1','内容管理-栏目设置-内容管理','1','2015-07-04 15:52:50','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_0','');
INSERT INTO `sys_log` VALUES ('56c498deb0534acf8e81dea002ab09d3','1','系统设置-机构用户-用户管理-查看','1','2015-07-04 16:34:32','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/list','GET','','');
INSERT INTO `sys_log` VALUES ('57480225cc964387b42ea1a27ce654cb','1','系统设置-机构用户-用户管理-修改','1','2015-07-04 16:28:12','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/checkLoginName','GET','oldLoginName=&loginName=yfb','');
INSERT INTO `sys_log` VALUES ('5788f8f716064f069924cefed1da8147','1','系统设置-机构用户-用户管理-查看','1','2015-07-04 16:39:15','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/list','GET','repage=','');
INSERT INTO `sys_log` VALUES ('57cebc6edad54f0796bc3b4ac228c464','1','系统设置-机构用户-用户管理-修改','1','2015-07-04 16:26:59','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/checkLoginName','GET','oldLoginName=&loginName=dev','');
INSERT INTO `sys_log` VALUES ('57e56c080c4344cdb5912c4c2c90fb58','1','系统设置-系统设置-菜单管理','1','2015-07-04 16:33:07','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/menu/','GET','tabPageId=jerichotabiframe_4','');
INSERT INTO `sys_log` VALUES ('5976f253d9c44dc495c6659c6f6526bb','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 16:03:04','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/tree','GET','','');
INSERT INTO `sys_log` VALUES ('5a8ec2540a764ada832400837d4cd7de','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:53:59','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=17','');
INSERT INTO `sys_log` VALUES ('5abb6b1dc9e0422eb25901606e666c88','1','我的面板-个人信息-个人信息','1','2015-07-04 16:04:55','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/info','POST','phone=8675&email=&name=系统管理员&remarks=最高管理员&photo=/yundaicms/userfiles/1/images/content/2015/07/IMG_0465.JPG&mobile=8675','');
INSERT INTO `sys_log` VALUES ('5b1c86dc1bda46b089d1b59b2df4ded2','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:30:03','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','','');
INSERT INTO `sys_log` VALUES ('5b4246629fe7434fa0eb451cd245af2e','1','内容管理-栏目设置-内容管理','1','2015-07-04 15:30:26','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_0','');
INSERT INTO `sys_log` VALUES ('5c7e7d68beb94ff19676371fabf8f590','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:33:22','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','POST','title=&pageNo=1&chanId=&pageSize=30&endDate=&beginDate=2015-07-01 00:00:00','');
INSERT INTO `sys_log` VALUES ('5c91c826453040d7aa15fc0996bb3719','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:53:00','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=17','');
INSERT INTO `sys_log` VALUES ('5d3e7fa4419440bfaa91f61537be17ea','1','内容管理-栏目设置-内容管理','1','2015-07-04 16:34:31','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_0','');
INSERT INTO `sys_log` VALUES ('5d7ac3da81894fd489824569762a1344','1','系统设置-系统设置-角色管理','1','2015-07-04 16:37:23','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/role/','GET','','');
INSERT INTO `sys_log` VALUES ('5d9716780a64440f9385577dcfb2acc4','1','系统登录','1','2015-07-04 16:53:24','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/menu/tree','GET','parentId=27','');
INSERT INTO `sys_log` VALUES ('5dcb7a8d470d4cff9be13eab2c2d815b','1','系统设置-机构用户-用户管理-查看','1','2015-07-04 16:22:26','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/list','GET','office.id=3&office.name=综合部','');
INSERT INTO `sys_log` VALUES ('5dcf68237bc3489caf743d2e18a4cec8','1','系统设置-系统设置-菜单管理','1','2015-07-04 16:33:32','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/menu/','GET','tabPageId=jerichotabiframe_2','');
INSERT INTO `sys_log` VALUES ('5e198287eb314662be4b0b7e9feb951f','1','代码生成-代码生成-代码模板管理','1','2015-07-04 16:06:00','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/gen/genTemplate','GET','tabPageId=jerichotabiframe_3','');
INSERT INTO `sys_log` VALUES ('5e43e1e5ff1442f486ae1ff17aab4233','1','内容管理-内容管理-内容管理-查看','1','2015-07-04 16:54:11','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('5ee5b6208b28421e8d7383ce9bc4ddd3','1','我的面板-个人信息-修改密码','1','2015-07-04 16:05:48','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/modifyPwd','POST','id=1&confirmNewPassword=&oldPassword=&newPassword=','');
INSERT INTO `sys_log` VALUES ('5fc9a0081df24e3384bb97f6b0f35f6c','1','系统设置-系统设置-角色管理-查看','1','2015-07-04 16:30:21','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/role/form','GET','','');
INSERT INTO `sys_log` VALUES ('610b58f18b564e0ea21367cd9b8259f1','1','系统设置-机构用户-区域管理','1','2015-07-04 15:14:29','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/area/','GET','tabPageId=jerichotabiframe_8','');
INSERT INTO `sys_log` VALUES ('6117373d97644b77bbfef981c337612d','1','内容管理-栏目设置-内容管理-修改','1','2015-07-04 15:29:28','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/save','POST','tags=&status=1&channelId=16&chanId=16&origin=aa&audit=0&type=0&contentTxt=aa\r\n&id=2&isRecommand=0&author=aa&parentId=1&title=aa&shortTitle=&description=&originUrl=&titleImg=','');
INSERT INTO `sys_log` VALUES ('61c1244ffeef4e54b4900c3f56eb1019','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 16:27:07','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/tree','GET','','');
INSERT INTO `sys_log` VALUES ('61eaf4ad33874ff0ad43db890af37024','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 16:25:57','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','','');
INSERT INTO `sys_log` VALUES ('62c597eeaf5d4a6ab1c285b737ccb575','1','系统设置-机构用户-用户管理-查看','1','2015-07-04 16:39:27','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/list','GET','','');
INSERT INTO `sys_log` VALUES ('6317a63c6b4948d4981814ac20779915','1','内容管理-栏目设置-内容管理','1','2015-07-04 15:59:02','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_0','');
INSERT INTO `sys_log` VALUES ('63dbda8fdfac4f94a80423cb67ebd567','1','系统设置-机构用户-区域管理','1','2015-07-04 16:39:32','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/area/','GET','tabPageId=jerichotabiframe_3','');
INSERT INTO `sys_log` VALUES ('646b30a6b1fd428b9b11d510b3f3c1f2','1','系统设置-系统设置-菜单管理-修改','1','2015-07-04 16:43:48','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/menu/save','POST','id=79&icon=&sort=5000&parent.id=1&name=代码生成&target=&permission=&remarks=&href=&parent.name=功能菜单&isShow=0','');
INSERT INTO `sys_log` VALUES ('64a011078fe3409b8368c823133f34ef','1','系统设置-机构用户-用户管理-查看','1','2015-07-04 16:30:03','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/list','GET','repage=','');
INSERT INTO `sys_log` VALUES ('64ba8495b5b742179c2f8d3e1d0942dd','1','系统设置-机构用户-用户管理-查看','1','2015-07-04 16:27:09','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/list','GET','','');
INSERT INTO `sys_log` VALUES ('64ddc9fbd50f4219a42b0b724d797dcb','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:58:07','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/form','GET','parentId=1&chanId=17','');
INSERT INTO `sys_log` VALUES ('65913010c8e142e1bfe2ba2b2b6049f3','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:35:03','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','','');
INSERT INTO `sys_log` VALUES ('659585b0f951416a876387b7f8b69062','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:52:14','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('661df05fb3524a3995dbcb63a99325d0','1','系统设置-系统设置-角色管理-修改','1','2015-07-04 16:38:21','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/role/save','POST','dataScope=1&officeIds=&remarks=&office.id=2&oldName=系统管理员&id=1&menuIds=1,31,32,36,37,38,33,34,35,27,28,29,30,71,56,2,13,20,21,22,17,18,19,14,15,16,3,4,5,6,7,8,9,10,11,1...&useable=1&office.name=公司领导&name=系统管理员&roleType=assignment&oldEnname=dept&enname=dept&sysData=1','');
INSERT INTO `sys_log` VALUES ('667344b27c8240b49a154ca5d2e96a1e','1','内容管理-内容管理-内容管理-查看','1','2015-07-04 16:57:34','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','POST','parentId=&title=&pageNo=2&chanId=&pageSize=10&endDate=&beginDate=','');
INSERT INTO `sys_log` VALUES ('66af8876803a4b16b1133f813ccc8891','1','系统设置-机构用户-用户管理','1','2015-07-04 16:19:04','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/index','GET','tabPageId=jerichotabiframe_1','');
INSERT INTO `sys_log` VALUES ('67658ea58ef74f499bc8f0e8faa7ab5f','1','系统设置-机构用户-用户管理-查看','1','2015-07-04 16:22:21','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/list','GET','office.id=3&office.name=综合部','');
INSERT INTO `sys_log` VALUES ('6827282e257b404f983ec2271fa27c19','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:38:55','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('6838b1b106164f2e86821e3922edc5d3','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:40:11','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/form','GET','chanId=16','');
INSERT INTO `sys_log` VALUES ('68c6c45ed3c04aa1bec6ad0300240a55','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:46:47','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/form','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('68ce2a661f0b4f5e820c22b82f5b958d','1','内容管理-内容管理-内容管理-查看','1','2015-07-04 16:39:18','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','','');
INSERT INTO `sys_log` VALUES ('68f7c326062f4ac79394278037a77cdd','1','内容管理-栏目设置-内容管理','1','2015-07-04 15:32:54','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_0','');
INSERT INTO `sys_log` VALUES ('693bcf962a5844d4ba0c5666c7df6080','1','内容管理-栏目设置-内容管理','1','2015-07-04 15:52:40','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_0','');
INSERT INTO `sys_log` VALUES ('6976c47995864a30864d59f1d78ba23d','1','系统设置-机构用户-机构管理','1','2015-07-04 16:39:28','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/office/','GET','tabPageId=jerichotabiframe_2','');
INSERT INTO `sys_log` VALUES ('69914f76053a4f8c9a0583e1253a5355','1','系统设置-机构用户-用户管理-修改','1','2015-07-04 16:27:42','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/checkLoginName','GET','oldLoginName=&loginName=dev','');
INSERT INTO `sys_log` VALUES ('69f71d74a5814ebd9caf04d9f567a445','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:41:30','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','chanId=16','');
INSERT INTO `sys_log` VALUES ('69feaebbe28642aca27f72df702cb5cd','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:17:31','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/form','GET','chanId=16','');
INSERT INTO `sys_log` VALUES ('6a1b3c620c7e4782b171604f579dabd7','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:34:40','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('6a6f3dda94ab4f03a50f6cf9c94f1d00','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:59:04','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/form','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('6aabc6c8ea3e436eae87880596b8e076','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:54:21','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('6b4f24b7303a4b0ca946733f5398dd9e','1','内容管理-内容管理-内容管理','1','2015-07-04 16:57:13','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_0','');
INSERT INTO `sys_log` VALUES ('6c074358253f4edaa47c47a4bbfbe37e','1','内容管理-栏目设置-内容管理-修改','1','2015-07-04 15:47:01','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/save','POST','tags=&status=&channelId=16&chanId=16&origin=ee&audit=0&type=0&contentTxt=ee\r\n&id=&isRecommand=0&author=ee&parentId=1&title=ee&shortTitle=&description=&originUrl=&titleImg=','');
INSERT INTO `sys_log` VALUES ('6c099f7a21834334bad492555a0c46a2','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:17:05','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','POST','title=f&status=-1&pageNo=1&chanId=&pageSize=30&endDate=&beginDate=','');
INSERT INTO `sys_log` VALUES ('6c5a2e9c01ca40d9a078f2384de6f598','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 16:25:57','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/tree','GET','','');
INSERT INTO `sys_log` VALUES ('6c8166c665ae408f87ee4436c89cffea','1','系统设置-机构用户-用户管理','1','2015-07-04 16:21:38','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/index','GET','tabPageId=jerichotabiframe_1','');
INSERT INTO `sys_log` VALUES ('6cad91a5e1e246faa41bae2af1dc5e0b','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:36:43','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','POST','parentId=1&title=a&pageNo=1&chanId=16&pageSize=30&endDate=&beginDate=','');
INSERT INTO `sys_log` VALUES ('6d1092f2a0c84b2f8f9a14af8bf4e59c','1','系统设置-机构用户-用户管理-查看','1','2015-07-04 16:35:21','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/list','GET','repage=','');
INSERT INTO `sys_log` VALUES ('6d6b66c60d4249f98e4ec0c216869f07','1','内容管理-栏目设置-内容管理','1','2015-07-04 15:30:59','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_0','');
INSERT INTO `sys_log` VALUES ('6d7c227962394ac88d9ac63e7c65cda0','1','系统设置-机构用户-用户管理-修改','1','2015-07-04 16:39:15','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/save','POST','phone=8675&no=0001&oldLoginName=admin&newPassword=&roleIdList=2&remarks=最高管理员&loginFlag=1&photo=/yundaicms/userfiles/1/images/content/2015/07/IMG_0465.JPG&office.id=2&company.name=科联汇通技术有限公司&userType=&id=1&confirmNewPassword=&_roleIdList=on&email=&office.name=公司领导&company.id=1&name=系统管理员&loginName=admin&mobile=8675','');
INSERT INTO `sys_log` VALUES ('6d9eef8db52644139872cbbc9b4e833b','1','系统登录','1','2015-07-04 16:22:13','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a','GET','login=','');
INSERT INTO `sys_log` VALUES ('6da0ba8531e64c6b9c63eed45ed78a5f','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:53:58','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','','');
INSERT INTO `sys_log` VALUES ('6e0a6bff88f04e6fac975db04cf6613a','1','内容管理-栏目设置-内容管理-修改','1','2015-07-04 15:39:04','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/save','POST','tags=&channelId=16&status=&chanId=16&origin=bb&audit=0&type=0&contentTxt=bb\r\n&id=&isRecommand=0&parentId=&author=bb&title=bb&shortTitle=&description=&originUrl=&titleImg=','');
INSERT INTO `sys_log` VALUES ('6e349339c54540c898ef2cfcf0ebca0c','1','系统设置-系统设置-角色管理','1','2015-07-04 16:38:21','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/role/','GET','repage=','');
INSERT INTO `sys_log` VALUES ('6e4c5e0944e64c1da702d0ea6fe7c5eb','1','内容管理-内容管理-内容管理-查看','1','2015-07-04 16:39:18','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/tree','GET','','');
INSERT INTO `sys_log` VALUES ('6e7185154a5e490097d2831507aed33b','1','系统设置-系统设置-角色管理-查看','1','2015-07-04 16:38:49','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/role/form','GET','id=2','');
INSERT INTO `sys_log` VALUES ('6e7b4350eb1b4045b3c99d5e22ba7aa4','1','系统设置-系统设置-角色管理','1','2015-07-04 16:37:12','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/role/','GET','tabPageId=jerichotabiframe_3','');
INSERT INTO `sys_log` VALUES ('6ea064561d484ee6a1c50ba5e14bee3d','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:59:02','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/tree','GET','','');
INSERT INTO `sys_log` VALUES ('6ed5a6a2a9d5461e8105ed644b3aaf92','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:52:12','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','','');
INSERT INTO `sys_log` VALUES ('6edd72e3e60d45fd9ceff27dfabf32bc','1','系统设置-系统设置-菜单管理','1','2015-07-04 16:37:01','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/menu/','GET','','');
INSERT INTO `sys_log` VALUES ('6eed03824e36439b826326b8f8de39a1','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:59:02','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','','');
INSERT INTO `sys_log` VALUES ('7020547f568647068df510325d8e9284','1','内容管理-栏目设置-内容管理-修改','1','2015-07-04 15:52:19','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/save','POST','tags=&status=&channelId=16&chanId=16&origin=few&audit=0&type=0&contentTxt=few\r\n&id=&isRecommand=0&author=few&parentId=1&title=few&shortTitle=&description=&originUrl=&titleImg=','');
INSERT INTO `sys_log` VALUES ('705eb031aecc44399eca001523e7e054','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:28:53','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/tree','GET','','');
INSERT INTO `sys_log` VALUES ('707d232c135549078855dca83ee9fcaf','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:53:07','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=17','');
INSERT INTO `sys_log` VALUES ('7085390c41054ba89156e221710c7688','1','内容管理-内容管理-内容发布','1','2015-07-04 15:14:25','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/','GET','tabPageId=jerichotabiframe_5','');
INSERT INTO `sys_log` VALUES ('70c855f877bd4839a22a2c59ba34d414','1','内容管理-栏目设置-内容管理-修改','1','2015-07-04 15:58:37','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/save','POST','tags=&channelId=17&status=&chanId=17&origin=测试&audit=0&type=0&contentTxt=测试\r\n&id=&isRecommand=0&parentId=1&author=测试&title=测试内容&shortTitle=&description=&originUrl=&titleImg=','');
INSERT INTO `sys_log` VALUES ('70f9850a57114bc1b145d70d85e99d75','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:39:33','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=null&chanId=16','');
INSERT INTO `sys_log` VALUES ('710192db77ca4631923a2de0ddabf2b0','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:18:40','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','chanId=16','');
INSERT INTO `sys_log` VALUES ('712660f278784fddb3763d335c67ea6a','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 16:34:31','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/tree','GET','','');
INSERT INTO `sys_log` VALUES ('7205c64de2cb43f3a2b169ead2164dac','1','系统设置-机构用户-用户管理-查看','1','2015-07-04 16:38:30','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/list','GET','','');
INSERT INTO `sys_log` VALUES ('721324c739c7468daac0dde751d104f8','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 16:02:52','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('7244b989821f44e6b79fb31d2874cbff','1','系统设置-系统设置-角色管理','1','2015-07-04 16:28:37','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/role/','GET','tabPageId=jerichotabiframe_2','');
INSERT INTO `sys_log` VALUES ('734f827255ab43da9e0af36d43e3c818','1','我的面板-个人信息-个人信息','1','2015-07-04 16:05:24','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/info','GET','tabPageId=jerichotabiframe_1','');
INSERT INTO `sys_log` VALUES ('74229cd4fbc7433380b44a4074a27016','1','内容管理-内容管理-内容管理-查看','1','2015-07-04 16:57:53','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','POST','parentId=&title=&pageNo=2&chanId=&pageSize=10&endDate=&beginDate=','');
INSERT INTO `sys_log` VALUES ('751a455a68d64a92a8d8b425dc43a2e4','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 16:05:55','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/tree','GET','','');
INSERT INTO `sys_log` VALUES ('75ff9031b48240baa355dc02c35fa87e','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 16:34:31','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','','');
INSERT INTO `sys_log` VALUES ('7690146c305a41e2adb613feea4c9c05','1','代码生成-代码生成-业务表配置','1','2015-07-04 16:05:56','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/gen/genTable','GET','tabPageId=jerichotabiframe_1','');
INSERT INTO `sys_log` VALUES ('7758bc0ac36249f2800311516e5b207e','1','内容管理-栏目设置-内容管理','1','2015-07-04 15:32:32','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_0','');
INSERT INTO `sys_log` VALUES ('77d8471a68404ddf88fa581c3b85e81b','1','系统设置-机构用户-用户管理-查看','1','2015-07-04 16:43:06','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/list','GET','','');
INSERT INTO `sys_log` VALUES ('7829d021b62d4ccd97c47d96e8a95fbb','1','内容管理-内容管理-内容管理','1','2015-07-04 16:43:54','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_0','');
INSERT INTO `sys_log` VALUES ('792ab7c9783b4c549b556da3b7862862','1','内容管理-栏目设置-内容管理','1','2015-07-04 15:57:33','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_0','');
INSERT INTO `sys_log` VALUES ('7966a43ecd434c4fafde91728fdffc22','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:58:40','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/form','GET','id=16&parentId=1&chanId=17','');
INSERT INTO `sys_log` VALUES ('79ae0d76ddbc4d1ca5718e5ab14d54bd','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:29:25','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/form','GET','id=2&parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('7aa22aa3fd8a48e58db810b99321ff01','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:57:56','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/form','GET','parentId=1&chanId=17','');
INSERT INTO `sys_log` VALUES ('7abe869b0fdb4182942d1ed6af51cc03','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:26:39','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','chanId=16','');
INSERT INTO `sys_log` VALUES ('7ad6378c79d04bdf85002d84052b7428','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:35:02','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/tree','GET','','');
INSERT INTO `sys_log` VALUES ('7b1d17795906475b862049055f14c1bd','1','系统登录','1','2015-07-04 15:57:31','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a;JSESSIONID=cb28a087390b47cfa508729fb41db74d','GET','','');
INSERT INTO `sys_log` VALUES ('7b642dc0ca874977a53eb417036d84ad','1','系统设置-系统设置-角色管理','1','2015-07-04 16:34:34','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/role/','GET','tabPageId=jerichotabiframe_2','');
INSERT INTO `sys_log` VALUES ('7b7539388fa845e095ac4db10d6bec9d','1','系统设置-机构用户-用户管理-查看','1','2015-07-04 16:26:33','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/list','GET','','');
INSERT INTO `sys_log` VALUES ('7b82884004084ad9b94c4d4a5e54a1e7','1','内容管理-栏目设置-内容管理','1','2015-07-04 15:28:53','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_0','');
INSERT INTO `sys_log` VALUES ('7bb9914c7c994af0aebf36dadfd7bc8b','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 16:03:17','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','','');
INSERT INTO `sys_log` VALUES ('7c7f6a4d3074458cb4ef7b3b89c51982','1','系统登录','1','2015-07-04 15:41:24','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('7d26a9bd2b6845a7a5978dd95e901b36','1','系统设置-系统设置-角色管理','1','2015-07-04 16:30:20','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/role/','GET','tabPageId=jerichotabiframe_3','');
INSERT INTO `sys_log` VALUES ('7e8fb406a4fc44a8aa12c3c1aeca876f','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:32:32','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','','');
INSERT INTO `sys_log` VALUES ('7eeb8c77d3b746efaf81457ea737f404','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 16:11:06','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/tree','GET','','');
INSERT INTO `sys_log` VALUES ('7eece1fc625344d7ae93211fdf2c248b','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 16:03:04','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','','');
INSERT INTO `sys_log` VALUES ('7f14fdf3e9e647b0b9670a44fbf17d5f','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:39:27','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','','');
INSERT INTO `sys_log` VALUES ('7f1d65e09e084600b73433729ee92363','1','我的面板-个人信息-个人信息','1','2015-07-04 16:53:24','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/info','GET','tabPageId=jerichotabiframe_6','');
INSERT INTO `sys_log` VALUES ('7f56c7c5d3e545d28acf682ce144fba6','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:53:49','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=17','');
INSERT INTO `sys_log` VALUES ('7fc3a21502d64a1586bb52ac9aa13c6e','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 16:16:51','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','','');
INSERT INTO `sys_log` VALUES ('7fd0b5ce613e4c3e8911a21939abc662','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 16:00:40','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/form','GET','id=11&parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('7ff1b46360a14091a078e3128a1368c8','1','系统登录','6','2015-07-04 16:41:17','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a','GET','login=','');
INSERT INTO `sys_log` VALUES ('8009f7d685bb4138aabc04c3730f4f54','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:27:39','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/tree','GET','','');
INSERT INTO `sys_log` VALUES ('804d4e3a904a48a8afa2f22f5733f974','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 16:03:27','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','','');
INSERT INTO `sys_log` VALUES ('809dc74bb442404b9c0aeaa64a2484da','1','系统设置-机构用户-用户管理-修改','1','2015-07-04 16:27:45','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/checkLoginName','GET','oldLoginName=&loginName=develp','');
INSERT INTO `sys_log` VALUES ('80e4a61ac611417ba082e04c8ca700a2','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:29:10','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/tree','GET','','');
INSERT INTO `sys_log` VALUES ('80f56a0a347f4344b4ad85f71280100a','1','系统设置-系统设置-菜单管理','1','2015-07-04 16:39:34','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/menu/','GET','tabPageId=jerichotabiframe_4','');
INSERT INTO `sys_log` VALUES ('811bfb7721c147bca14c9d967c8bc98f','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:57:33','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/tree','GET','','');
INSERT INTO `sys_log` VALUES ('8132f71ade064538bc4273dd87aefd8b','1','内容管理-栏目设置-内容管理','1','2015-07-04 16:21:41','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_0','');
INSERT INTO `sys_log` VALUES ('81500356ad6644f498af4038d90adbc9','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 16:05:55','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','','');
INSERT INTO `sys_log` VALUES ('81f1858898c6437e8d8f02a86847d884','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:39:35','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('82287585ec404e48bea9f745515f54aa','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:17:30','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('82dc84cae43c4d9295185e2af06ba803','1','系统设置-系统设置-角色管理','1','2015-07-04 16:38:11','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/role/','GET','repage=','');
INSERT INTO `sys_log` VALUES ('83e7b13f477c44e4915b0f20db2e19eb','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:53:35','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/form','GET','parentId=1&chanId=17','');
INSERT INTO `sys_log` VALUES ('83e81c5813ea4de0ad29d0d3e994010b','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:53:33','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=17','');
INSERT INTO `sys_log` VALUES ('842211fb900f4ce787b49335ccc28d89','1','代码生成-代码生成-业务表配置','1','2015-07-04 16:16:52','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/gen/genTable','GET','tabPageId=jerichotabiframe_1','');
INSERT INTO `sys_log` VALUES ('85202025c9594ae4b8cfceb4446a7bb2','1','系统设置-机构用户-用户管理-查看','1','2015-07-04 16:23:17','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/list','POST','orderBy=&pageNo=1&office.name=&company.id=&name=&pageSize=30&office.id=&company.name=&loginName=','');
INSERT INTO `sys_log` VALUES ('853a7d9186954ff9bb579bafab9a040c','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:54:34','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','','');
INSERT INTO `sys_log` VALUES ('85b7ec9581854abea25520880b799d34','1','系统设置-系统设置-菜单管理','1','2015-07-04 16:44:01','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/menu/','GET','tabPageId=jerichotabiframe_2','');
INSERT INTO `sys_log` VALUES ('871badec7de54221bcda6a9cd98fc4dc','1','内容管理-栏目设置-内容管理-修改','1','2015-07-04 15:53:40','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/save','POST','tags=&status=&channelId=17&chanId=17&origin=few&audit=0&type=0&contentTxt=few\r\n&id=&isRecommand=0&author=few&parentId=1&title=sef&shortTitle=&description=&originUrl=&titleImg=','');
INSERT INTO `sys_log` VALUES ('872b3c06fbaa4c8486a83d6d750a33bc','1','我的面板-个人信息-修改密码','1','2015-07-04 16:05:39','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/modifyPwd','POST','id=1&confirmNewPassword=&oldPassword=&newPassword=','');
INSERT INTO `sys_log` VALUES ('875bd838cdad4ea39155cdaac78c3e08','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 16:05:21','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/tree','GET','','');
INSERT INTO `sys_log` VALUES ('87c28f108e2948fcb784fe62581a47f0','1','系统设置-系统设置-角色管理','1','2015-07-04 16:34:55','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/role/','GET','repage=','');
INSERT INTO `sys_log` VALUES ('884c085e146041b881df85a1e5c769e8','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:52:10','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('8915be92a87a464b9c9251769381cd27','1','内容管理-栏目设置-内容管理','1','2015-07-04 15:52:12','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_0','');
INSERT INTO `sys_log` VALUES ('89c5f8446a894106a843dab0bf30ab91','1','系统设置-系统设置-角色管理-修改','1','2015-07-04 16:35:34','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/role/save','POST','dataScope=2&officeIds=&remarks=&office.id=2&oldName=公司管理员&id=2&menuIds=1,31,32,36,37,38,33,34,35,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,27,28,29,30,71,56,57,58...&useable=1&office.name=公司领导&name=公司管理员&roleType=assignment&oldEnname=hr&enname=hr&sysData=1','');
INSERT INTO `sys_log` VALUES ('8a44231cfdb240ab8be007752965da7e','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:29:22','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/form','GET','id=2&parentId=&chanId=','');
INSERT INTO `sys_log` VALUES ('8ad0599af40a44ae870086f5c8f6c3f8','1','系统设置-系统设置-角色管理','1','2015-07-04 16:41:08','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/role/','GET','repage=','');
INSERT INTO `sys_log` VALUES ('8b1e514b8e2a4e04975fe435720bb99b','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:38:22','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('8b46fd85acb94e329cf49699490e760e','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 16:00:07','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/form','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('8b4eb09d871e4dbba64479befeddbfe3','1','我的面板-个人信息-个人信息','1','2015-07-04 16:19:02','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/info','GET','tabPageId=jerichotabiframe_5','');
INSERT INTO `sys_log` VALUES ('8ba1864437524865893391c6964f19a8','1','系统设置-系统设置-菜单管理-查看','1','2015-07-04 16:43:45','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/menu/form','GET','id=79','');
INSERT INTO `sys_log` VALUES ('8bbd0625c12447d4b32d7c4d8c04f5e9','1','系统设置-机构用户-用户管理','1','2015-07-04 16:33:30','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/index','GET','tabPageId=jerichotabiframe_1','');
INSERT INTO `sys_log` VALUES ('8c2fcb8485284a93948cfc551a364bbf','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:40:10','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('8ccca667b1944f5bb7da4dda26a215dc','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:46:46','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('8cd040c7054249e7b11952e741b0b7d5','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:54:00','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/form','GET','parentId=1&chanId=17','');
INSERT INTO `sys_log` VALUES ('8ce16aa19dc740e5a15945f81e936c88','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:54:20','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=0&chanId=1','');
INSERT INTO `sys_log` VALUES ('8cf985493fda43be9384ef0d61a39627','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:33:06','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','','');
INSERT INTO `sys_log` VALUES ('8d481a72c7a54635aaf0334123b9f60a','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 16:01:35','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('8e9a9759a59e4db4a0a29e35e74c0aae','1','系统设置-系统设置-菜单管理','1','2015-07-04 15:14:57','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/menu/','GET','tabPageId=jerichotabiframe_13','');
INSERT INTO `sys_log` VALUES ('8f4b9911cf714d778c425775e4d5c85b','1','系统设置-机构用户-用户管理-修改','1','2015-07-04 16:28:14','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/checkLoginName','GET','oldLoginName=&loginName=yfb_dev','');
INSERT INTO `sys_log` VALUES ('8f86a654455a419d8170f3b818fc0d32','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:34:13','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/tree','GET','','');
INSERT INTO `sys_log` VALUES ('8fe3afbe32c2437aa16b41428e4bfcc4','1','内容管理-栏目设置-内容管理','1','2015-07-04 15:33:48','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_0','');
INSERT INTO `sys_log` VALUES ('90e1cad9924244ce8d5ea01886e55e8f','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:39:26','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('9159c2bf0a0e426daecdc74006b0ab43','1','系统设置-机构用户-用户管理-查看','1','2015-07-04 16:25:59','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/list','GET','','');
INSERT INTO `sys_log` VALUES ('91ba016193654275b9f2ef236278d17a','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:47:44','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/form','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('91c297c9019f46d09f66fa0cb69bc4fc','1','系统设置-系统设置-菜单管理','1','2015-07-04 16:36:48','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/menu/','GET','','');
INSERT INTO `sys_log` VALUES ('9216cefa68594d4a9deb1f5d558f82b5','1','系统设置-系统设置-角色管理-修改','1','2015-07-04 16:34:55','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/role/save','POST','dataScope=8&officeIds=&remarks=&office.id=2&oldName=&menuIds=1,31,32,36,37,38,33,34,35,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,27,28,29,30,71,56,57,58...&id=&useable=1&office.name=公司领导&name=系统开发人员&roleType=assignment&sysData=1&enname=system_dev&oldEnname=','');
INSERT INTO `sys_log` VALUES ('921c7ed58e6c4c3cb2b6ace45e9fb8d2','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:30:26','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','','');
INSERT INTO `sys_log` VALUES ('935059e6db244dae8636066d4ac693af','1','系统设置-系统设置-字典管理','1','2015-07-04 16:19:19','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/dict/','GET','tabPageId=jerichotabiframe_4','');
INSERT INTO `sys_log` VALUES ('93c3ccbe746d4b528fedb94b4d8634f5','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:19:00','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','chanId=16','');
INSERT INTO `sys_log` VALUES ('93fb43eaffc64bf1803c3cc29f191757','1','内容管理-栏目设置-分类管理-查看','1','2015-07-04 16:03:42','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/classify/form','GET','type=1','');
INSERT INTO `sys_log` VALUES ('94720fd1232f4fcabe8c72ca2a30e259','1','系统设置-机构用户-用户管理-修改','1','2015-07-04 16:35:21','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/save','POST','phone=8675&no=0001&oldLoginName=admin&newPassword=&roleIdList=2&remarks=最高管理员&loginFlag=1&photo=/yundaicms/userfiles/1/images/content/2015/07/IMG_0465.JPG&office.id=2&company.name=科联汇通技术有限公司&userType=&id=1&confirmNewPassword=&_roleIdList=on&email=&office.name=公司领导&company.id=1&name=系统管理员&loginName=admin&mobile=8675','');
INSERT INTO `sys_log` VALUES ('951bddbc2d53470c82f010d1d40eb91e','1','系统设置-机构用户-用户管理','1','2015-07-04 16:21:43','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/index','GET','tabPageId=jerichotabiframe_1','');
INSERT INTO `sys_log` VALUES ('956e6cf6ba3a4007849131fcb98231d6','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:17:29','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=17','');
INSERT INTO `sys_log` VALUES ('959f671fd1474bfebca824307b5177e8','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:26:54','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/tree','GET','','');
INSERT INTO `sys_log` VALUES ('95e2a3402f7f42ce8a44b54a07dfaee2','1','系统设置-系统设置-角色管理','1','2015-07-04 16:37:40','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/role/','GET','','');
INSERT INTO `sys_log` VALUES ('96404b3b769f4e30b465a512d707c17e','1','系统设置-机构用户-用户管理-查看','1','2015-07-04 16:35:06','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/form','GET','id=20bb2128bb964f0f968ccfcff2d0917f','');
INSERT INTO `sys_log` VALUES ('966f7f153cb8454db80b20b43b753845','1','系统设置-系统设置-角色管理-查看','1','2015-07-04 16:37:41','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/role/form','GET','id=441cfed923064d59b6b9f4d447f9d72a','');
INSERT INTO `sys_log` VALUES ('96e5ab4665184b3e9a42afdcf021622c','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 16:24:16','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/tree','GET','','');
INSERT INTO `sys_log` VALUES ('97c715e3325c41d3a9d7f99c95d78f23','1','系统设置-机构用户-用户管理-修改','1','2015-07-04 16:39:15','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/checkLoginName','GET','oldLoginName=admin&loginName=admin','');
INSERT INTO `sys_log` VALUES ('98393f6927134671a90f52d549ab91a9','1','系统登录','1','2015-07-04 16:43:54','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a','GET','login=','');
INSERT INTO `sys_log` VALUES ('9894f1c8116f40fb8fb036784a140a80','1','系统设置-机构用户-用户管理-修改','1','2015-07-04 16:28:13','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/checkLoginName','GET','oldLoginName=&loginName=yfb_','');
INSERT INTO `sys_log` VALUES ('98a8e8f314e748dc982b9d073264f875','1','系统设置-系统设置-角色管理-查看','1','2015-07-04 16:40:31','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/role/form','GET','id=2','');
INSERT INTO `sys_log` VALUES ('992ee7b67fbd449d8cefafbb13acb6f8','1','系统设置-机构用户-用户管理-修改','1','2015-07-04 16:28:11','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/checkLoginName','GET','oldLoginName=&loginName=ysf','');
INSERT INTO `sys_log` VALUES ('9a5f50adb9b3457b96978549112967c0','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:54:24','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('9aa079d5518246fab4e83fc14f61d185','1','内容管理-内容管理-内容管理','1','2015-07-04 16:38:27','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_0','');
INSERT INTO `sys_log` VALUES ('9ad8b4c4b64a4c5cb7d76d7159bdccbd','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:54:23','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=17','');
INSERT INTO `sys_log` VALUES ('9c28f3b12c9f47ab81a1be858cb5267d','1','内容管理-内容管理-内容管理-查看','1','2015-07-04 16:58:28','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','POST','parentId=&title=&pageNo=3&chanId=&pageSize=5&endDate=&beginDate=','');
INSERT INTO `sys_log` VALUES ('9c2f6161f2544c05a9cc41aeaea2e5de','1','系统设置-机构用户-用户管理-查看','1','2015-07-04 16:27:11','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/list','GET','office.id=6&office.name=研发部','');
INSERT INTO `sys_log` VALUES ('9d736e0accb94fe18551962d5b8e5c31','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:54:08','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('9dc6ebd093984263a0e341c0d19002b9','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:16:55','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/tree','GET','','');
INSERT INTO `sys_log` VALUES ('9dced938e2164f7b94adde16e5541384','1','系统登录','1','2015-07-04 16:05:21','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a','GET','login=','');
INSERT INTO `sys_log` VALUES ('9dd03f96929143a0be91a6affa8acecb','1','内容管理-栏目设置-内容管理-修改','1','2015-07-04 15:19:00','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/save','POST','tags=&channelId=16&status=&chanId=16&origin=aa&audit=0&type=0&contentTxt=aa\r\n&id=&isRecommand=0&author=aa&title=aa&shortTitle=&description=&originUrl=&titleImg=','');
INSERT INTO `sys_log` VALUES ('9dd7403bffc24edc9d4f676f9b2d76cb','1','内容管理-内容管理-内容管理-查看','1','2015-07-04 16:57:14','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','','');
INSERT INTO `sys_log` VALUES ('9e2752327a264b52806ca4c958d52e9a','1','系统设置-系统设置-菜单管理','1','2015-07-04 16:33:11','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/menu/','GET','','');
INSERT INTO `sys_log` VALUES ('9ffc8df58c024cdfb632b5bd9e648aed','1','系统设置-机构用户-用户管理-修改','1','2015-07-04 16:30:03','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/save','POST','phone=&no=00000&oldLoginName=&newPassword=&roleIdList=4&remarks=&loginFlag=1&photo=&office.id=6&company.name=科联汇通技术有限公司&userType=3&id=&confirmNewPassword=&_roleIdList=on&email=&office.name=研发部&company.id=1&name=开发人员&loginName=yfb_dev&mobile=','');
INSERT INTO `sys_log` VALUES ('a023b63ba6204b0694e2651c96555623','1','系统设置-机构用户-用户管理-修改','1','2015-07-04 16:27:42','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/checkLoginName','GET','oldLoginName=&loginName=d','');
INSERT INTO `sys_log` VALUES ('a161ce9e8bf84d559a9a3162bf637eed','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:35:07','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','POST','parentId=1&title=b&pageNo=1&chanId=16&pageSize=30&endDate=&beginDate=','');
INSERT INTO `sys_log` VALUES ('a25800a1ac0640198b5f9b83512d2d23','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:54:31','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=17','');
INSERT INTO `sys_log` VALUES ('a3175e09b6154410965e4faff15f5084','1','内容管理-栏目设置-内容管理','1','2015-07-04 16:02:48','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_0','');
INSERT INTO `sys_log` VALUES ('a4bd06eaa4094412b0b0a49cf4cc1ac0','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:57:38','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/form','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('a506005f55db483c9bd7fdaf88fe986c','1','内容管理-栏目设置-内容管理','1','2015-07-04 15:54:15','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_1','');
INSERT INTO `sys_log` VALUES ('a50b6684ee18419fab01554c5a80cf5f','1','系统设置-机构用户-用户管理-修改','1','2015-07-04 16:27:46','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/checkLoginName','GET','oldLoginName=&loginName=develpo','');
INSERT INTO `sys_log` VALUES ('a5560c3a4d7844658259ce01b8462ebb','1','内容管理-栏目设置-内容管理-修改','1','2015-07-04 15:17:39','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/save','POST','tags=&status=&channelId=16&chanId=16&origin=tt&audit=0&type=0&contentTxt=tt\r\n&id=&isRecommand=0&author=tt&title=tt&shortTitle=tt&description=&originUrl=&titleImg=','');
INSERT INTO `sys_log` VALUES ('a5a56d5a77324928aa38ae86a404b24f','1','系统设置-系统设置-角色管理-修改','1','2015-07-04 16:31:28','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/role/save','POST','dataScope=8&officeIds=&remarks=&office.id=2&oldName=&id=&menuIds=1,31,32,36,37,38,33,34,35,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55&useable=1&office.name=公司领导&name=test&roleType=assignment&oldEnname=&enname=test&sysData=1','');
INSERT INTO `sys_log` VALUES ('a6acd019501c40fdb3e1bb127eff772d','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:39:29','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/form','GET','chanId=16','');
INSERT INTO `sys_log` VALUES ('a6bc02eab71847b9a039559ea8bd726b','1','系统设置-系统设置-角色管理-修改','1','2015-07-04 16:37:14','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/role/assign','GET','id=6','');
INSERT INTO `sys_log` VALUES ('a768e49397d0443d8a197ffa00c73bb8','1','内容管理-内容管理-内容管理-查看','1','2015-07-04 16:54:07','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','','');
INSERT INTO `sys_log` VALUES ('a777ab7a8e8d44c8b7ce276ce7ff03e4','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 16:03:19','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('a93d79393d9049668dd9997e011d6e01','1','系统设置-机构用户-用户管理-查看','1','2015-07-04 16:22:25','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/list','GET','office.id=1&office.name=科联汇通技术有限公司','');
INSERT INTO `sys_log` VALUES ('a94632a65cd5410c96bcc3d41fa6bb77','1','内容管理-内容管理-内容管理-查看','1','2015-07-04 16:39:21','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','','');
INSERT INTO `sys_log` VALUES ('a96e8759bc7e489f8e952419609300d1','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:43:22','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/form','GET','chanId=16','');
INSERT INTO `sys_log` VALUES ('a9bb4c22a79b483ebcceab46e1a0eb61','1','系统设置-系统设置-角色管理','1','2015-07-04 16:38:55','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/role/','GET','','');
INSERT INTO `sys_log` VALUES ('a9f47e388008481bb31ad3b683e4ff14','1','内容管理-内容管理-内容管理-查看','1','2015-07-04 16:39:21','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/tree','GET','','');
INSERT INTO `sys_log` VALUES ('aa7bd45983274a938b9ae0938af5e714','1','内容管理-栏目设置-内容管理-修改','1','2015-07-04 15:37:35','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/save','POST','tags=&channelId=16&status=&chanId=16&origin=bb&audit=0&type=0&contentTxt=bb\r\n&id=&isRecommand=0&parentId=&author=bb&title=bb&shortTitle=&description=&originUrl=&titleImg=','');
INSERT INTO `sys_log` VALUES ('ab3225a1e22b4669b0c09fdcb32f81cc','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 16:27:07','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','','');
INSERT INTO `sys_log` VALUES ('ab3be4d02b71477d9fc4a6cfe90a4fda','1','内容管理-栏目设置-内容管理','1','2015-07-04 15:27:39','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_0','');
INSERT INTO `sys_log` VALUES ('ab7fc6d2c3ba43b4b768ce9ee8953afd','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:53:08','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('ab86e9ae9b3d486b8ed0724b0c04690d','1','系统设置-机构用户-用户管理-查看','1','2015-07-04 16:27:13','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/form','GET','','');
INSERT INTO `sys_log` VALUES ('abd41c5249a84f439a280b27521269ce','1','内容管理-栏目设置-内容管理-修改','1','2015-07-04 15:54:04','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/save','POST','tags=&status=&channelId=17&chanId=17&origin=few&audit=0&type=0&contentTxt=few\r\n&id=&isRecommand=0&author=few&parentId=1&title=fwe&shortTitle=&description=&originUrl=&titleImg=','');
INSERT INTO `sys_log` VALUES ('ac67fd12c26042a391d6c2e26089e3f7','1','系统设置-系统设置-角色管理-查看','1','2015-07-04 16:38:42','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/role/form','GET','id=4','');
INSERT INTO `sys_log` VALUES ('ac995fc0b6c948ad8ffb119edcc5729d','1','系统设置-系统设置-菜单管理-查看','1','2015-07-04 16:36:52','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/menu/form','GET','id=32','');
INSERT INTO `sys_log` VALUES ('ada3a05ec2784d75b8115866b6c9bbb4','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:41:27','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/form','GET','chanId=16','');
INSERT INTO `sys_log` VALUES ('addd0d3a37dc40c68d5f91ef1c92f60d','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:40:16','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=null&chanId=16','');
INSERT INTO `sys_log` VALUES ('ae1099e92ea743f89d9c19663dc28a47','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:18:37','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('ae4e91232a6e4efe90cdfff50985bd25','1','内容管理-内容管理-内容管理-查看','1','2015-07-04 16:38:26','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/tree','GET','','');
INSERT INTO `sys_log` VALUES ('aecb4fbbcfda4a5085dd1fc96c769e23','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:39:37','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/form','GET','chanId=16','');
INSERT INTO `sys_log` VALUES ('afcb746f237546789d5d33d84a7214c4','1','内容管理-内容管理-内容管理-查看','1','2015-07-04 16:58:25','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','POST','parentId=&title=&pageNo=1&chanId=&pageSize=5&endDate=&beginDate=','');
INSERT INTO `sys_log` VALUES ('afd19e7964324bc1985abae8948ac3d8','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 16:21:42','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','','');
INSERT INTO `sys_log` VALUES ('b04276c335b547d5bd56b3f67a524236','1','系统设置-机构用户-用户管理-查看','1','2015-07-04 16:35:15','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/form','GET','id=1','');
INSERT INTO `sys_log` VALUES ('b06cab09690f4401bf96161694870630','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:35:05','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','POST','parentId=1&title=&pageNo=1&chanId=16&pageSize=30&endDate=&beginDate=','');
INSERT INTO `sys_log` VALUES ('b0d8393c070944d699b9462b7c38e1b4','1','内容管理-栏目设置-内容管理','1','2015-07-04 15:40:09','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_2','');
INSERT INTO `sys_log` VALUES ('b0f8fa47b9354a96a3da26e9ae8e4555','1','内容管理-栏目设置-内容管理-修改','1','2015-07-04 15:48:31','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/save','POST','tags=&channelId=16&status=&chanId=16&origin=ff&audit=0&type=0&contentTxt=ff\r\n&id=&isRecommand=0&parentId=1&author=ff&title=ff&shortTitle=&description=&originUrl=&titleImg=','');
INSERT INTO `sys_log` VALUES ('b10ee898e2e74941a4a7f950bd672027','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:30:59','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','','');
INSERT INTO `sys_log` VALUES ('b126019059674b279daa221cafd5c76d','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 16:21:42','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/tree','GET','','');
INSERT INTO `sys_log` VALUES ('b1a66a892a5b41579fdfdcb6134ed4b4','1','我的面板-个人信息-修改密码','1','2015-07-04 16:05:29','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/modifyPwd','GET','','');
INSERT INTO `sys_log` VALUES ('b26d0b4da8d54b1ea9a304ca9eafdfcc','1','系统设置-系统设置-角色管理-查看','1','2015-07-04 16:41:02','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/role/form','GET','id=441cfed923064d59b6b9f4d447f9d72a','');
INSERT INTO `sys_log` VALUES ('b27fc3487bd74f55a3717b681a29b01e','1','系统设置-系统设置-角色管理-查看','1','2015-07-04 16:34:38','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/role/form','GET','','');
INSERT INTO `sys_log` VALUES ('b385b3d8bbe044f2b28b978005a482d2','1','内容管理-内容管理-内容管理-查看','1','2015-07-04 16:57:14','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/tree','GET','','');
INSERT INTO `sys_log` VALUES ('b41794e0a8544d1ba019ced82cf33b91','1','内容管理-内容管理-内容管理-查看','1','2015-07-04 16:42:48','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/tree','GET','','');
INSERT INTO `sys_log` VALUES ('b47347e17237419fbcd7e5530918cefa','1','系统设置-系统设置-字典管理','1','2015-07-04 16:37:30','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/dict/','GET','tabPageId=jerichotabiframe_5','');
INSERT INTO `sys_log` VALUES ('b4c8c7e1a7514fe2ac2cb8ac3bff1c6e','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:33:48','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/tree','GET','','');
INSERT INTO `sys_log` VALUES ('b55623601ad44805931e9f18c60cea0f','1','系统设置-机构用户-用户管理-修改','1','2015-07-04 16:27:37','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/checkLoginName','GET','oldLoginName=&loginName=te','');
INSERT INTO `sys_log` VALUES ('b559e6d09d14401fb03d3a7f7ada7ada','1','内容管理-栏目设置-内容管理','1','2015-07-04 15:53:18','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_1','');
INSERT INTO `sys_log` VALUES ('b564486b875842e288b7fef562ee5fbc','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:29:35','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('b590f3debebc4434bbd5388fa055264b','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:27:49','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/tree','GET','','');
INSERT INTO `sys_log` VALUES ('b716826d67dc43aaa71c7f952b99ae35','1','系统设置-系统设置-角色管理-查看','1','2015-07-04 16:35:30','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/role/form','GET','id=2','');
INSERT INTO `sys_log` VALUES ('b735d2912df0455cbe4f0f145c1aa847','1','代码生成-代码生成-生成方案配置','1','2015-07-04 16:16:55','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/gen/genScheme','GET','tabPageId=jerichotabiframe_2','');
INSERT INTO `sys_log` VALUES ('b78410cf009540ce9bd3f8359d409173','1','系统设置-机构用户-机构管理-查看','1','2015-07-04 16:45:43','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/office/list','GET','id=&parentIds=0,','');
INSERT INTO `sys_log` VALUES ('b7a03d1ba3cf4f759ca8b50f3b1dec75','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:26:08','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/form','GET','id=2&parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('b8494139f9ee4ec0aa862a2cce4b135d','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:35:08','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','POST','parentId=1&title=a&pageNo=1&chanId=16&pageSize=30&endDate=&beginDate=','');
INSERT INTO `sys_log` VALUES ('b9633960521e45cf8964406d20d11710','1','系统设置-系统设置-菜单管理','1','2015-07-04 16:43:48','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/menu/','GET','','');
INSERT INTO `sys_log` VALUES ('ba4f96ef269b49d69dcf9c7ddb8eb3ae','1','内容管理-栏目设置-内容管理','1','2015-07-04 16:33:28','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_0','');
INSERT INTO `sys_log` VALUES ('ba5e363ede864bd09c969e5c5df845a0','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:27:12','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','','');
INSERT INTO `sys_log` VALUES ('ba81e5bb7734475d88a95c668a364086','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 16:03:23','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('bb01c2a70e5a432fa00c5b8b64b0731e','1','系统设置-机构用户-用户管理','1','2015-07-04 16:43:06','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/index','GET','tabPageId=jerichotabiframe_1','');
INSERT INTO `sys_log` VALUES ('bb56630f11f947829622d0aa936b805d','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:17:28','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('bbd4850050e24466a2df1f325b2bfe7d','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 16:03:14','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('bc146d45ccf141909227705df27821a6','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 16:19:03','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','','');
INSERT INTO `sys_log` VALUES ('bc3c943768234fb7b0364b2a4d2a773d','1','系统设置-机构用户-用户管理-修改','1','2015-07-04 16:27:45','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/checkLoginName','GET','oldLoginName=&loginName=deve','');
INSERT INTO `sys_log` VALUES ('bc691d7da4204943ace512f037ee5470','1','系统设置-机构用户-用户管理-查看','1','2015-07-04 16:33:30','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/list','GET','','');
INSERT INTO `sys_log` VALUES ('bd563c31f6f34600b0700b62e34002ec','1','内容管理-栏目设置-内容管理','1','2015-07-04 16:03:04','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_0','');
INSERT INTO `sys_log` VALUES ('bd57e06e3a124bc2a82988d7fe127f65','1','系统设置-机构用户-用户管理-修改','1','2015-07-04 16:27:45','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/checkLoginName','GET','oldLoginName=&loginName=devel','');
INSERT INTO `sys_log` VALUES ('bdf242afd95c4004ba644bc23ebff2f4','1','系统设置-机构用户-用户管理-查看','1','2015-07-04 16:22:50','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/list','GET','','');
INSERT INTO `sys_log` VALUES ('be6968bb8e0e4e49b1517bd61c8432d1','1','内容管理-栏目设置-内容管理','1','2015-07-04 16:16:51','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_0','');
INSERT INTO `sys_log` VALUES ('be9bd6477dae4d098e7e0e3ccbcba305','1','系统设置-机构用户-用户管理','1','2015-07-04 15:14:27','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/index','GET','tabPageId=jerichotabiframe_6','');
INSERT INTO `sys_log` VALUES ('bea612ea158642b8951b26f9573a94af','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 16:02:50','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('bf05716a01354aaa84cea82f934d3571','1','系统设置-机构用户-用户管理-修改','1','2015-07-04 16:35:21','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/checkLoginName','GET','oldLoginName=admin&loginName=admin','');
INSERT INTO `sys_log` VALUES ('bfa27a7b3ff94417b50b977355ac310b','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 16:01:34','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=17','');
INSERT INTO `sys_log` VALUES ('bfc35434a37a4aa5adccabade4e7e98b','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:53:02','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','','');
INSERT INTO `sys_log` VALUES ('bfe103ee481b453baeef7f31fe9c1915','1','系统设置-机构用户-用户管理-查看','1','2015-07-04 16:21:39','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/list','GET','','');
INSERT INTO `sys_log` VALUES ('c06a1ecebb6a4048a2559b51c842d6b3','1','内容管理-内容管理-内容管理-查看','1','2015-07-04 16:57:32','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/tree','GET','','');
INSERT INTO `sys_log` VALUES ('c07a38537b904324bce83b823ed1a4e5','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:33:06','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/tree','GET','','');
INSERT INTO `sys_log` VALUES ('c07e561ab787437db366e3a693b1caff','1','内容管理-内容管理-内容管理-查看','1','2015-07-04 16:54:13','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('c0e62ee277174e28a06a5c67f30c2418','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:53:50','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/form','GET','parentId=1&chanId=17','');
INSERT INTO `sys_log` VALUES ('c0e716c9e4014cc797ef03e2fde22e51','1','代码生成-代码生成-业务表配置','1','2015-07-04 16:11:07','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/gen/genTable','GET','tabPageId=jerichotabiframe_1','');
INSERT INTO `sys_log` VALUES ('c116377983ad42688a5032ebca0ff513','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:33:49','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','','');
INSERT INTO `sys_log` VALUES ('c1374007f9074ea9aef230ce57fab093','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 16:33:28','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','','');
INSERT INTO `sys_log` VALUES ('c1a6dea54e704edbacab75c013c66756','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:42:25','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=null&chanId=16','');
INSERT INTO `sys_log` VALUES ('c1d57c10693749f6ad9402f8cf5e3bde','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:43:32','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('c2a3f1b81d1748fc9868b10623b17e98','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:43:29','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=null&chanId=16','');
INSERT INTO `sys_log` VALUES ('c347740df1b94c5daa1b75e772582504','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:35:04','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('c3aeaaac6b104aa8aef30f7ea79bda1d','1','系统设置-机构用户-用户管理-修改','1','2015-07-04 16:35:12','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/save','POST','phone=&no=00000&oldLoginName=yfb_dev&newPassword=&roleIdList=441cfed923064d59b6b9f4d447f9d72a&remarks=&loginFlag=1&photo=&office.id=6&company.name=科联汇通技术有限公司&userType=3&id=20bb2128bb964f0f968ccfcff2d0917f&confirmNewPassword=&_roleIdList=on&email=&office.name=研发部&company.id=1&name=开发人员&loginName=yfb_dev&mobile=','');
INSERT INTO `sys_log` VALUES ('c43067ec1fcb4c3280a33d7546b1d1ac','1','系统登录','6','2015-07-04 16:25:50','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a','GET','login=','');
INSERT INTO `sys_log` VALUES ('c53f91428d56417ab07c73196215d7ab','1','代码生成-代码生成-代码模板管理','1','2015-07-04 16:17:05','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/gen/genTemplate','GET','tabPageId=jerichotabiframe_3','');
INSERT INTO `sys_log` VALUES ('c561f81ec66f4774945aa4dd0e5f6eef','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 16:24:17','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','','');
INSERT INTO `sys_log` VALUES ('c6314b7a0ebb4eb2b4d8bf0aef1f128f','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 16:11:06','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','','');
INSERT INTO `sys_log` VALUES ('c63fecaffe964096bf58c26a5f231225','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:54:34','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/tree','GET','','');
INSERT INTO `sys_log` VALUES ('c779a58a1f0444f3a9d137dafc5a9ee6','1','内容管理-内容管理-内容管理-查看','1','2015-07-04 16:58:27','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','POST','parentId=&title=&pageNo=2&chanId=&pageSize=5&endDate=&beginDate=','');
INSERT INTO `sys_log` VALUES ('c83bb863518d46e0bbbc750b994de801','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:26:54','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','','');
INSERT INTO `sys_log` VALUES ('c85ace207e7b4eaea389826074c2fa25','1','代码生成-代码生成-业务表配置','1','2015-07-04 16:06:12','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/gen/genTable','GET','tabPageId=jerichotabiframe_4','');
INSERT INTO `sys_log` VALUES ('ca0e4c0eb2f848718998eced76884090','1','内容管理-栏目设置-内容管理','1','2015-07-04 15:54:34','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_0','');
INSERT INTO `sys_log` VALUES ('ca78705f1897453bb64c462d8d50ead1','1','内容管理-栏目设置-内容管理','1','2015-07-04 15:53:58','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_0','');
INSERT INTO `sys_log` VALUES ('cbe9a1d8d0fb428d8644790113361498','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 16:02:51','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=17','');
INSERT INTO `sys_log` VALUES ('ccd7cc0f6249415f8d9ae307374adfd4','1','代码生成-代码生成-生成方案配置','1','2015-07-04 16:11:27','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/gen/genScheme','GET','tabPageId=jerichotabiframe_2','');
INSERT INTO `sys_log` VALUES ('cd20885edc1b4a519c918bf72cfeb746','1','系统设置-系统设置-菜单管理','1','2015-07-04 16:36:39','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/menu/','GET','tabPageId=jerichotabiframe_2','');
INSERT INTO `sys_log` VALUES ('cd43ba8ced69496e9fc595de029f618d','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 16:33:28','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/tree','GET','','');
INSERT INTO `sys_log` VALUES ('cd9c5075dbf24a1bb4013b8dbb03e3cf','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:29:11','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','','');
INSERT INTO `sys_log` VALUES ('cda70ed46cf44be6a1370c640cbd7589','1','系统设置-系统设置-角色管理-查看','1','2015-07-04 16:37:17','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/role/usertorole','POST','id=6&___t0.9604225987568498=','');
INSERT INTO `sys_log` VALUES ('cdb376599b2c49e094d92ec7aa9584b7','1','系统设置-系统设置-角色管理-修改','1','2015-07-04 16:40:45','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/role/save','POST','dataScope=2&officeIds=&remarks=&office.id=2&oldName=公司管理员&id=2&menuIds=1,31,32,36,37,38,33,34,35,27,28,29,30,71,56,2,13,20,21,22,17,18,19,14,15,16,3,4,5,6,7,8,9,10,11,1...&useable=1&office.name=公司领导&name=公司管理员&roleType=assignment&oldEnname=hr&enname=hr&sysData=1','');
INSERT INTO `sys_log` VALUES ('cdfa6087f90f4c53a89cab038ab6cdb3','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 16:05:21','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','','');
INSERT INTO `sys_log` VALUES ('ce7e84fce93a4747811219abfe0d5e82','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:57:54','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('ceab0144f8df43348565531ff6de03ca','1','系统设置-机构用户-用户管理-查看','1','2015-07-04 16:22:15','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/list','GET','','');
INSERT INTO `sys_log` VALUES ('cfef1fc619a5467cbbe434df376f1042','1','内容管理-内容管理-内容管理-查看','1','2015-07-04 16:54:10','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=0&chanId=1','');
INSERT INTO `sys_log` VALUES ('d01e94412ed343308594119da451f9dc','1','内容管理-栏目设置-分类管理','1','2015-07-04 15:14:12','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/classify/','GET','tabPageId=jerichotabiframe_1','');
INSERT INTO `sys_log` VALUES ('d038ae46b7cf4676914a8a448ab3fabd','1','内容管理-栏目设置-内容管理','1','2015-07-04 16:20:10','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_0','');
INSERT INTO `sys_log` VALUES ('d0e5db9f65064b1a9e0c6a846c2118fc','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 16:20:10','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','','');
INSERT INTO `sys_log` VALUES ('d10dab67e3ce46408a84c4661b16d4ef','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:47:01','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('d1278c67427c47e6b7a1526b47d37451','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 16:03:29','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('d141ec17dfe946e88b164f483b444259','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:34:35','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','POST','title=bb&pageNo=1&chanId=&pageSize=30&endDate=&beginDate=','');
INSERT INTO `sys_log` VALUES ('d187287233b74cf0a88d5fb568945f96','1','系统设置-机构用户-用户管理-查看','1','2015-07-04 16:22:24','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/list','GET','office.id=2&office.name=公司领导','');
INSERT INTO `sys_log` VALUES ('d1c73e03b8d141cdb3ee46341fab34a3','1','内容管理-内容管理-内容管理-查看','1','2015-07-04 16:57:55','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','POST','parentId=&title=&pageNo=1&chanId=&pageSize=10&endDate=&beginDate=','');
INSERT INTO `sys_log` VALUES ('d1c9cd9c42784154b84aab7f394009e4','1','系统设置-机构用户-机构管理-查看','1','2015-07-04 16:45:30','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/office/list','GET','id=&parentIds=','');
INSERT INTO `sys_log` VALUES ('d1e58471573645788304a85ec6a52bf1','1','系统设置-机构用户-用户管理-查看','1','2015-07-04 16:43:56','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/list','GET','','');
INSERT INTO `sys_log` VALUES ('d232e91addd44a2f8f6e6efe16a9e9d1','1','系统设置-机构用户-用户管理-查看','1','2015-07-04 16:35:12','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/list','GET','repage=','');
INSERT INTO `sys_log` VALUES ('d26a1be9dab942e591685551e398af7b','1','我的面板-个人信息-修改密码','1','2015-07-04 16:04:58','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/modifyPwd','GET','','');
INSERT INTO `sys_log` VALUES ('d277428e65864656845fd65aa829e138','1','系统设置-系统设置-菜单管理-修改','1','2015-07-04 16:36:48','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/menu/delete','GET','id=40','');
INSERT INTO `sys_log` VALUES ('d308dd8516264e4a908a93b52b90a7fb','1','系统设置-机构用户-用户管理-修改','1','2015-07-04 16:28:12','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/checkLoginName','GET','oldLoginName=&loginName=y','');
INSERT INTO `sys_log` VALUES ('d322c17abc4242d1a254b413d4086a99','1','系统设置-机构用户-用户管理-查看','1','2015-07-04 16:22:20','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/list','GET','office.id=2&office.name=公司领导','');
INSERT INTO `sys_log` VALUES ('d35075d11de042619eab20407e81d13b','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:52:50','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/tree','GET','','');
INSERT INTO `sys_log` VALUES ('d42941fe07a2454d9e8acd2f00ef2321','1','系统设置-系统设置-角色管理-查看','1','2015-07-04 16:38:57','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/role/form','GET','id=1','');
INSERT INTO `sys_log` VALUES ('d5b2edbe234645d4b5e4d5ad113cdbd4','1','系统登录','1','2015-07-04 16:27:07','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a','GET','login=','');
INSERT INTO `sys_log` VALUES ('d5d6286fa5ef4657a513a9fb7b4ae325','1','内容管理-栏目设置-内容管理','1','2015-07-04 15:16:02','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_16','');
INSERT INTO `sys_log` VALUES ('d5da630ffb774bf5a228ba58ece836e8','1','内容管理-内容管理-内容管理-查看','1','2015-07-04 16:58:31','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','POST','parentId=&title=&pageNo=1&chanId=&pageSize=5&endDate=&beginDate=','');
INSERT INTO `sys_log` VALUES ('d5e96eb350c14e68aab65b1e9c90330a','1','系统登录','1','2015-07-04 16:38:25','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a','GET','login=','');
INSERT INTO `sys_log` VALUES ('d5ef5a280e864d939cb2732162a96736','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:42:20','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/form','GET','chanId=16','');
INSERT INTO `sys_log` VALUES ('d65fed924155413487b935166c6f36e8','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:54:37','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=17','');
INSERT INTO `sys_log` VALUES ('d6b9d0a202434d1b8bf4474bb72ce559','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:38:55','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=0&chanId=1','');
INSERT INTO `sys_log` VALUES ('d77498c270ed49789a3d2e0246fc1c48','1','内容管理-栏目设置-内容管理-修改','1','2015-07-04 15:40:16','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/save','POST','tags=&channelId=16&status=&chanId=16&origin=aa&audit=0&type=0&contentTxt=aa\r\n&id=&isRecommand=0&parentId=&author=aa&title=aa&shortTitle=&description=&originUrl=&titleImg=','');
INSERT INTO `sys_log` VALUES ('d86985a1182848c79c7256ae769d35c6','1','我的面板-个人信息-修改密码','1','2015-07-04 16:05:14','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/modifyPwd','POST','id=1&confirmNewPassword=&oldPassword=&newPassword=','');
INSERT INTO `sys_log` VALUES ('d8a7c9c766d24df19d27a22e1ead6236','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:53:58','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/tree','GET','','');
INSERT INTO `sys_log` VALUES ('d8d0dd96aff146c6a20a2d6d8ae233e2','1','内容管理-内容管理-内容管理-查看','1','2015-07-04 16:42:48','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','','');
INSERT INTO `sys_log` VALUES ('d9695303192b4325b86ef74ae26fbdcb','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 16:22:14','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/tree','GET','','');
INSERT INTO `sys_log` VALUES ('da3218397572403998c5cc5bb9d3acce','1','内容管理-内容管理-内容管理-查看','1','2015-07-04 16:55:21','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','','');
INSERT INTO `sys_log` VALUES ('da38a324d3ec45528ce7b5d3529bd89d','1','内容管理-栏目设置-内容管理-修改','1','2015-07-04 15:43:29','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/save','POST','tags=&channelId=16&status=&chanId=16&origin=dd&audit=0&type=0&contentTxt=dd\r\n&id=&isRecommand=0&parentId=&author=dd&title=dd&shortTitle=&description=&originUrl=&titleImg=','');
INSERT INTO `sys_log` VALUES ('da4614d27b524aed8e8f5e9c5d58d42d','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:59:03','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('db20c062deda43c68d4bc9f25224942d','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:54:39','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('dbdc99d611f841ffbf668acdf4dd50fa','1','系统设置-机构用户-用户管理-查看','1','2015-07-04 16:21:43','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/list','GET','','');
INSERT INTO `sys_log` VALUES ('dc1d7cd29e09447a8a480facd8a7dc41','1','系统登录','1','2015-07-04 16:42:47','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a','GET','login=','');
INSERT INTO `sys_log` VALUES ('dc367e57fa624c2ba55934bb2d0484cf','1','系统设置-机构用户-用户管理-修改','1','2015-07-04 16:27:43','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/checkLoginName','GET','oldLoginName=&loginName=deve','');
INSERT INTO `sys_log` VALUES ('dda48be4eca14e3ea9e66e55968c74a9','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:57:35','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('de46b32e580f427e9e790e16fa5656da','1','内容管理-内容管理-内容管理-查看','1','2015-07-04 16:54:12','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=17','');
INSERT INTO `sys_log` VALUES ('de8e93d99fb84a2bbd72482f49ce9147','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 16:00:13','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/form','GET','id=14&parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('dea32d67580a4c2e8286b14ea5d624ea','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 16:36:35','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/tree','GET','','');
INSERT INTO `sys_log` VALUES ('df3c12495d144e84962c92c4f3af0f50','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:40:09','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','','');
INSERT INTO `sys_log` VALUES ('df3d408f85004c17ac6fcb8b0e018683','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:46:56','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('df8d07f6bbd946bab8cddde33dbf94a2','1','系统设置-系统设置-角色管理','1','2015-07-04 16:19:18','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/role/','GET','tabPageId=jerichotabiframe_3','');
INSERT INTO `sys_log` VALUES ('e0504272764d45f994657d020908a517','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:57:46','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('e07952e6bad744b29a9104d9033e3b13','1','系统设置-机构用户-用户管理-查看','1','2015-07-04 16:35:13','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/list','GET','office.name=公司领导&office.id=2','');
INSERT INTO `sys_log` VALUES ('e07ca1db0cb84b63ba3692b0910b5b48','1','内容管理-栏目设置-内容管理','1','2015-07-04 15:26:54','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_0','');
INSERT INTO `sys_log` VALUES ('e144e1ed3d5e405ca2925527c70c11f4','1','系统设置-机构用户-机构管理-查看','1','2015-07-04 15:14:28','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/office/list','GET','id=&parentIds=','');
INSERT INTO `sys_log` VALUES ('e2f9fbd998104f7f8617a12d97efd184','1','内容管理-栏目设置-内容管理-修改','1','2015-07-04 15:42:25','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/save','POST','tags=&channelId=16&status=&chanId=16&origin=cc&audit=0&type=0&contentTxt=cc\r\n&id=&isRecommand=0&parentId=&author=cc&title=cc&shortTitle=&description=&originUrl=&titleImg=','');
INSERT INTO `sys_log` VALUES ('e35065e172ad43feb084609f72bcf7f2','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:27:49','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','','');
INSERT INTO `sys_log` VALUES ('e35568bab723429db6e76ebf4fed388a','1','内容管理-栏目设置-内容管理','1','2015-07-04 16:27:07','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_0','');
INSERT INTO `sys_log` VALUES ('e45dc931f7e746e3a60faa92f1db29bb','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:58:37','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=17','');
INSERT INTO `sys_log` VALUES ('e4814cf348454deca3d75156abb8edfa','1','系统设置-系统设置-角色管理-查看','1','2015-07-04 16:40:49','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/role/form','GET','id=1','');
INSERT INTO `sys_log` VALUES ('e48e84d87fb444b6810899a5804be994','1','内容管理-内容管理-内容管理-查看','1','2015-07-04 16:38:26','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','','');
INSERT INTO `sys_log` VALUES ('e4e7a685ec4144b381bbafb3bf490dcd','1','系统设置-机构用户-用户管理-修改','1','2015-07-04 16:27:46','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/checkLoginName','GET','oldLoginName=&loginName=develpote','');
INSERT INTO `sys_log` VALUES ('e4ec7b55e9004413825e2c3329b27cf2','1','系统设置-机构用户-用户管理-查看','1','2015-07-04 16:39:09','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/form','GET','id=1','');
INSERT INTO `sys_log` VALUES ('e4f84ff28bd742fa8f43ac092e8cb4c8','1','系统登录','1','2015-07-04 15:26:02','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('e54bc73e30c4479996e26d5fd5624611','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:29:24','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('e643c24c672c4e659c77fb236843f61a','1','内容管理-内容管理-内容管理-查看','1','2015-07-04 16:57:30','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('e68dd85cafb2462aa7776a8da00f1c0e','1','系统设置-系统设置-字典管理','1','2015-07-04 16:38:35','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/dict/','GET','tabPageId=jerichotabiframe_3','');
INSERT INTO `sys_log` VALUES ('e694c2d1d6ba478290f3c1b4a9eff675','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:34:02','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','','');
INSERT INTO `sys_log` VALUES ('e6a44172f38240c5a9da9f76d0a1846e','1','系统登录','1','2015-07-04 16:20:08','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a','GET','login=','');
INSERT INTO `sys_log` VALUES ('e79d10b9ea464bfa94778b0947d897c2','1','系统设置-机构用户-用户管理-修改','1','2015-07-04 16:28:14','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/checkLoginName','GET','oldLoginName=&loginName=yfb_d','');
INSERT INTO `sys_log` VALUES ('e7a1d903695840e4a5804aa0e8100084','1','系统设置-系统设置-角色管理','1','2015-07-04 16:37:36','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/role/','GET','','');
INSERT INTO `sys_log` VALUES ('e860e0ae9cc9456085fda4b1e17c91bd','1','内容管理-内容管理-内容管理','1','2015-07-04 16:39:18','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_0','');
INSERT INTO `sys_log` VALUES ('e8898c92f55b4bdf827a705a4025ee35','1','内容管理-栏目设置-内容管理','1','2015-07-04 15:16:54','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_17','');
INSERT INTO `sys_log` VALUES ('e914abee18514a4aa80d05173d2865ae','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:45:39','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/form','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('e91803abb6d54318bbc429ba1e4f6218','1','内容管理-栏目设置-内容管理','1','2015-07-04 16:25:57','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_0','');
INSERT INTO `sys_log` VALUES ('e94c6c7ac5244147b2395c4815cdbd78','1','系统登录','1','2015-07-04 16:37:12','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/role/','GET','tabPageId=jerichotabiframe_3','');
INSERT INTO `sys_log` VALUES ('e97065beb3f14e49b5b138f9889debcd','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:39:27','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/tree','GET','','');
INSERT INTO `sys_log` VALUES ('eb3cb19d80194d0c9b0d5b1195103ad4','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:38:21','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','','');
INSERT INTO `sys_log` VALUES ('eb41c3a104d04cbb84637453bae07ae1','1','系统设置-机构用户-用户管理-修改','1','2015-07-04 16:27:42','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/checkLoginName','GET','oldLoginName=&loginName=deve','');
INSERT INTO `sys_log` VALUES ('eca5e51449c043189ac246de3c2f52e6','1','系统设置-系统设置-菜单管理','1','2015-07-04 15:14:32','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/menu/','GET','tabPageId=jerichotabiframe_10','');
INSERT INTO `sys_log` VALUES ('eeffba1d663e4addb5c40b650c70bc3d','1','系统设置-系统设置-菜单管理','1','2015-07-04 16:43:15','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/menu/','GET','tabPageId=jerichotabiframe_4','');
INSERT INTO `sys_log` VALUES ('ef2db25c8acd4d658889d2c58a2a6f63','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 16:03:17','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/tree','GET','','');
INSERT INTO `sys_log` VALUES ('efc8ac6c567c40e4baeff388a251f1af','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:52:12','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/tree','GET','','');
INSERT INTO `sys_log` VALUES ('f04836d1bf2e402c8ca7d29197e1c8e1','1','内容管理-栏目设置-内容管理','1','2015-07-04 15:30:03','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_0','');
INSERT INTO `sys_log` VALUES ('f074d46fafd0410da9e3f5d66adc64d2','1','内容管理-内容管理-内容管理','1','2015-07-04 16:54:06','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_0','');
INSERT INTO `sys_log` VALUES ('f19066eff348422b9afadd2d32a57d73','1','系统设置-机构用户-用户管理','1','2015-07-04 16:38:30','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/index','GET','tabPageId=jerichotabiframe_1','');
INSERT INTO `sys_log` VALUES ('f2ed318f5b334a8d9f43e150fe80d9de','1','系统设置-机构用户-用户管理-修改','1','2015-07-04 16:27:37','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/checkLoginName','GET','oldLoginName=&loginName=tes','');
INSERT INTO `sys_log` VALUES ('f300c9d0a83044d9aabf79ea11318723','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:46:57','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/form','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('f375a0aadf004ef4b03606a09ce8ea02','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:40:09','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/tree','GET','','');
INSERT INTO `sys_log` VALUES ('f37c43e99583437d968a1add5ee1fc5e','1','系统设置-机构用户-机构管理-查看','1','2015-07-04 16:39:29','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/office/list','GET','id=&parentIds=','');
INSERT INTO `sys_log` VALUES ('f394bfaf65cd4081ba999f7875992e17','1','内容管理-栏目设置-内容管理-修改','1','2015-07-04 15:46:51','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/save','POST','tags=&channelId=16&status=&chanId=16&origin=ss&audit=0&type=0&contentTxt=ss\r\n&id=&isRecommand=0&parentId=1&author=ss&title=ss&shortTitle=&description=&originUrl=&titleImg=','');
INSERT INTO `sys_log` VALUES ('f3c4a9db79db4ffa9cc76939ae8c8a61','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:18:55','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/form','GET','chanId=16','');
INSERT INTO `sys_log` VALUES ('f438ec0217c04cf3b3b9e7fcff33cf02','1','内容管理-栏目设置-内容管理-修改','1','2015-07-04 15:36:48','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/save','POST','tags=&status=&channelId=16&chanId=16&origin=bb&audit=0&type=0&contentTxt=bb\r\n&id=&isRecommand=0&author=bb&parentId=&title=bb&shortTitle=&description=&originUrl=&titleImg=','');
INSERT INTO `sys_log` VALUES ('f49b17445c744ff8914f4a35d2f4ae46','1','内容管理-栏目设置-内容管理','1','2015-07-04 16:36:35','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_0','');
INSERT INTO `sys_log` VALUES ('f49d044b23bf453a9769e7d64da9bc6f','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:54:15','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/tree','GET','','');
INSERT INTO `sys_log` VALUES ('f4fc9ef855d44513939796de370d31e0','1','系统设置-系统设置-字典管理','1','2015-07-04 16:43:09','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/dict/','GET','tabPageId=jerichotabiframe_2','');
INSERT INTO `sys_log` VALUES ('f511ca00b8984d37bc08067d5e6f93bc','1','系统设置-机构用户-用户管理-修改','1','2015-07-04 16:27:43','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/checkLoginName','GET','oldLoginName=&loginName=devep','');
INSERT INTO `sys_log` VALUES ('f6e4d562d406434b86dd6645251d3763','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:34:14','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','','');
INSERT INTO `sys_log` VALUES ('f728c2bd6d234b5d92d496e43d0aa3d4','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:41:25','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('f78bbbaaff8249369a96fa9a526ebfd5','1','系统设置-机构用户-用户管理-查看','1','2015-07-04 16:24:24','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/list','GET','office.id=1&office.name=科联汇通技术有限公司','');
INSERT INTO `sys_log` VALUES ('f84c45bb3b24471ead6207029eaadb45','1','系统登录','1','2015-07-04 16:25:57','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a','GET','login=','');
INSERT INTO `sys_log` VALUES ('f8ff76e60e304d2f9a2db51b17085374','1','系统设置-系统设置-角色管理','1','2015-07-04 15:14:34','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/role/','GET','tabPageId=jerichotabiframe_11','');
INSERT INTO `sys_log` VALUES ('f9576e4130f9422d8a1004fe6cc7c40f','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:59:13','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('f960678f35a44039b907508d841a4c62','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:52:19','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('f9f4bb10024d42bb8f066ea43386deee','1','系统设置-机构用户-用户管理-修改','1','2015-07-04 16:28:11','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/checkLoginName','GET','oldLoginName=&loginName=ys','');
INSERT INTO `sys_log` VALUES ('fa344e5616364291ae8299cf315bbf39','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:57:34','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','','');
INSERT INTO `sys_log` VALUES ('fa8518c61499462bbb089810ee836999','1','内容管理-栏目设置-内容管理-修改','1','2015-07-04 15:57:54','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/save','POST','tags=&channelId=16&status=&chanId=16&origin=yy&audit=0&type=0&contentTxt=yy\r\n&id=&isRecommand=0&parentId=1&author=yy&title=yy&shortTitle=&description=&originUrl=&titleImg=','');
INSERT INTO `sys_log` VALUES ('faf580d399ae41d09ed56e4a3a90502d','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:28:54','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','','');
INSERT INTO `sys_log` VALUES ('fbe18b8576504dcbba8c22b01fb501ac','1','系统设置-机构用户-机构管理','1','2015-07-04 15:14:28','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/office/','GET','tabPageId=jerichotabiframe_7','');
INSERT INTO `sys_log` VALUES ('fc8b9534ab44438ea73b150c45cea115','1','系统设置-机构用户-用户管理-修改','1','2015-07-04 16:27:42','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/checkLoginName','GET','oldLoginName=&loginName=de','');
INSERT INTO `sys_log` VALUES ('fe1fd779c2104f5db43ac714882c721b','1','系统设置-机构用户-用户管理-查看','1','2015-07-04 15:14:27','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/sys/user/list','GET','','');
INSERT INTO `sys_log` VALUES ('ff13eab83b89404da8dbfe391924010c','1','内容管理-栏目设置-内容管理','1','2015-07-04 16:19:03','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/','GET','tabPageId=jerichotabiframe_0','');
INSERT INTO `sys_log` VALUES ('ff189722f6e541e5b6bf376baaa481ca','1','内容管理-栏目设置-内容管理-修改','1','2015-07-04 15:18:40','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/delete','GET','type=0&ids=1&chanId=16','');
INSERT INTO `sys_log` VALUES ('ff4a435091c24808ba7fe380c96d5f46','1','内容管理-栏目设置-内容管理-查看','1','2015-07-04 15:45:36','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','/yundaicms/a/cms/content/list','GET','parentId=1&chanId=16','');
/*!40000 ALTER TABLE `sys_log` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table sys_mdict
#

DROP TABLE IF EXISTS `sys_mdict`;
CREATE TABLE `sys_mdict` (
  `id` varchar(255) DEFAULT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  `parent_ids` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `sort` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_date` varchar(255) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_date` varchar(255) DEFAULT NULL,
  `del_flag` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table sys_mdict
#
LOCK TABLES `sys_mdict` WRITE;
/*!40000 ALTER TABLE `sys_mdict` DISABLE KEYS */;

/*!40000 ALTER TABLE `sys_mdict` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table sys_menu
#

DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` varchar(64) DEFAULT NULL,
  `parent_id` varchar(64) DEFAULT NULL,
  `parent_ids` varchar(500) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `href` varchar(255) DEFAULT NULL,
  `target` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `sort` double(53,0) DEFAULT NULL,
  `is_show` double(53,0) DEFAULT NULL,
  `permission` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `create_by` varchar(64) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(64) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `del_flag` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table sys_menu
#
LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;

INSERT INTO `sys_menu` VALUES ('1','0','0,','功能菜单',NULL,NULL,NULL,0,1,NULL,NULL,'1','2013-05-27','1','2013-05-27','0');
INSERT INTO `sys_menu` VALUES ('2','1','0,1,','系统设置',NULL,NULL,NULL,900,1,NULL,NULL,'1','2013-05-27','1','2013-05-27','0');
INSERT INTO `sys_menu` VALUES ('3','2','0,1,2,','系统设置',NULL,NULL,NULL,980,1,NULL,NULL,'1','2013-05-27','1','2013-05-27','0');
INSERT INTO `sys_menu` VALUES ('4','3','0,1,2,3,','菜单管理','/sys/menu/',NULL,'list-alt',30,1,NULL,NULL,'1','2013-05-27','1','2013-05-27','0');
INSERT INTO `sys_menu` VALUES ('5','4','0,1,2,3,4,','查看',NULL,NULL,NULL,30,0,'sys:menu:view',NULL,'1','2013-05-27','1','2013-05-27','0');
INSERT INTO `sys_menu` VALUES ('6','4','0,1,2,3,4,','修改',NULL,NULL,NULL,40,0,'sys:menu:edit',NULL,'1','2013-05-27','1','2013-05-27','0');
INSERT INTO `sys_menu` VALUES ('7','3','0,1,2,3,','角色管理','/sys/role/',NULL,'lock',50,1,NULL,NULL,'1','2013-05-27','1','2013-05-27','0');
INSERT INTO `sys_menu` VALUES ('8','7','0,1,2,3,7,','查看',NULL,NULL,NULL,30,0,'sys:role:view',NULL,'1','2013-05-27','1','2013-05-27','0');
INSERT INTO `sys_menu` VALUES ('9','7','0,1,2,3,7,','修改',NULL,NULL,NULL,40,0,'sys:role:edit',NULL,'1','2013-05-27','1','2013-05-27','0');
INSERT INTO `sys_menu` VALUES ('10','3','0,1,2,3,','字典管理','/sys/dict/',NULL,'th-list',60,1,NULL,NULL,'1','2013-05-27','1','2013-05-27','0');
INSERT INTO `sys_menu` VALUES ('11','10','0,1,2,3,10,','查看',NULL,NULL,NULL,30,0,'sys:dict:view',NULL,'1','2013-05-27','1','2013-05-27','0');
INSERT INTO `sys_menu` VALUES ('12','10','0,1,2,3,10,','修改',NULL,NULL,NULL,40,0,'sys:dict:edit',NULL,'1','2013-05-27','1','2013-05-27','0');
INSERT INTO `sys_menu` VALUES ('13','2','0,1,2,','机构用户',NULL,NULL,NULL,970,1,NULL,NULL,'1','2013-05-27','1','2013-05-27','0');
INSERT INTO `sys_menu` VALUES ('14','13','0,1,2,13,','区域管理','/sys/area/',NULL,'th',50,1,NULL,NULL,'1','2013-05-27','1','2013-05-27','0');
INSERT INTO `sys_menu` VALUES ('15','14','0,1,2,13,14,','查看',NULL,NULL,NULL,30,0,'sys:area:view',NULL,'1','2013-05-27','1','2013-05-27','0');
INSERT INTO `sys_menu` VALUES ('16','14','0,1,2,13,14,','修改',NULL,NULL,NULL,40,0,'sys:area:edit',NULL,'1','2013-05-27','1','2013-05-27','0');
INSERT INTO `sys_menu` VALUES ('17','13','0,1,2,13,','机构管理','/sys/office/',NULL,'th-large',40,1,NULL,NULL,'1','2013-05-27','1','2013-05-27','0');
INSERT INTO `sys_menu` VALUES ('18','17','0,1,2,13,17,','查看',NULL,NULL,NULL,30,0,'sys:office:view',NULL,'1','2013-05-27','1','2013-05-27','0');
INSERT INTO `sys_menu` VALUES ('19','17','0,1,2,13,17,','修改',NULL,NULL,NULL,40,0,'sys:office:edit',NULL,'1','2013-05-27','1','2013-05-27','0');
INSERT INTO `sys_menu` VALUES ('20','13','0,1,2,13,','用户管理','/sys/user/index',NULL,'user',30,1,NULL,NULL,'1','2013-05-27','1','2013-05-27','0');
INSERT INTO `sys_menu` VALUES ('21','20','0,1,2,13,20,','查看',NULL,NULL,NULL,30,0,'sys:user:view',NULL,'1','2013-05-27','1','2013-05-27','0');
INSERT INTO `sys_menu` VALUES ('22','20','0,1,2,13,20,','修改',NULL,NULL,NULL,40,0,'sys:user:edit',NULL,'1','2013-05-27','1','2013-05-27','0');
INSERT INTO `sys_menu` VALUES ('27','1','0,1,','我的面板',NULL,NULL,NULL,600,1,NULL,NULL,'1','2013-05-27','1','2013-05-27','0');
INSERT INTO `sys_menu` VALUES ('28','27','0,1,27,','个人信息',NULL,NULL,NULL,30,1,NULL,NULL,'1','2013-05-27','1','2013-05-27','0');
INSERT INTO `sys_menu` VALUES ('29','28','0,1,27,28,','个人信息','/sys/user/info',NULL,'user',30,1,NULL,NULL,'1','2013-05-27','1','2013-05-27','0');
INSERT INTO `sys_menu` VALUES ('30','28','0,1,27,28,','修改密码','/sys/user/modifyPwd',NULL,'lock',40,1,NULL,NULL,'1','2013-05-27','1','2013-05-27','0');
INSERT INTO `sys_menu` VALUES ('31','1','0,1,','内容管理',NULL,NULL,NULL,500,1,NULL,NULL,'1','2013-05-27','1','2013-05-27','0');
INSERT INTO `sys_menu` VALUES ('32','31','0,1,31,','内容管理','','','',450,1,'','','1','2013-05-27','1','2015-07-04 16:37:01','0');
INSERT INTO `sys_menu` VALUES ('33','32','0,1,31,32,','分类管理','/cms/classify/','','align-justify',30,1,'','','1','2013-05-27','1','2015-07-01 22:36:30','0');
INSERT INTO `sys_menu` VALUES ('34','33','0,1,31,32,33,','查看','','','',30,0,'cms:classify:view','','1','2013-05-27','1','2015-07-01 22:30:16','0');
INSERT INTO `sys_menu` VALUES ('35','33','0,1,31,32,33,','修改','','','',40,0,'cms:classify:edit','','1','2013-05-27','1','2015-07-01 23:29:21','0');
INSERT INTO `sys_menu` VALUES ('36','32','0,1,31,32,','内容管理','/cms/content/','','certificate',20,1,'','','1','2013-05-27','1','2015-07-02 00:04:34','0');
INSERT INTO `sys_menu` VALUES ('37','36','0,1,31,32,36,','查看','','','',30,0,'cms:content:view','','1','2013-05-27','1','2015-07-02 00:04:48','0');
INSERT INTO `sys_menu` VALUES ('38','36','0,1,31,32,36,','修改','','','',40,0,'cms:content:edit','','1','2013-05-27','1','2015-07-02 00:04:55','0');
INSERT INTO `sys_menu` VALUES ('40','31','0,1,31,','内容管理',NULL,NULL,NULL,500,1,'cms:view',NULL,'1','2013-05-27','1','2013-05-27','1');
INSERT INTO `sys_menu` VALUES ('41','40','0,1,31,40,','内容发布','/cms/',NULL,'briefcase',30,1,NULL,NULL,'1','2013-05-27','1','2013-05-27','1');
INSERT INTO `sys_menu` VALUES ('42','41','0,1,31,40,41,','文章模型','/cms/article/',NULL,'file',40,0,NULL,NULL,'1','2013-05-27','1','2013-05-27','1');
INSERT INTO `sys_menu` VALUES ('43','42','0,1,31,40,41,42,','查看',NULL,NULL,NULL,30,0,'cms:article:view',NULL,'1','2013-05-27','1','2013-05-27','1');
INSERT INTO `sys_menu` VALUES ('44','42','0,1,31,40,41,42,','修改',NULL,NULL,NULL,40,0,'cms:article:edit',NULL,'1','2013-05-27','1','2013-05-27','1');
INSERT INTO `sys_menu` VALUES ('45','42','0,1,31,40,41,42,','审核',NULL,NULL,NULL,50,0,'cms:article:audit',NULL,'1','2013-05-27','1','2013-05-27','1');
INSERT INTO `sys_menu` VALUES ('46','41','0,1,31,40,41,','链接模型','/cms/link/',NULL,'random',60,0,NULL,NULL,'1','2013-05-27','1','2013-05-27','1');
INSERT INTO `sys_menu` VALUES ('47','46','0,1,31,40,41,46,','查看',NULL,NULL,NULL,30,0,'cms:link:view',NULL,'1','2013-05-27','1','2013-05-27','1');
INSERT INTO `sys_menu` VALUES ('48','46','0,1,31,40,41,46,','修改',NULL,NULL,NULL,40,0,'cms:link:edit',NULL,'1','2013-05-27','1','2013-05-27','1');
INSERT INTO `sys_menu` VALUES ('49','46','0,1,31,40,41,46,','审核',NULL,NULL,NULL,50,0,'cms:link:audit',NULL,'1','2013-05-27','1','2013-05-27','1');
INSERT INTO `sys_menu` VALUES ('50','40','0,1,31,40,','评论管理','/cms/comment/?status=2',NULL,'comment',40,1,NULL,NULL,'1','2013-05-27','1','2013-05-27','1');
INSERT INTO `sys_menu` VALUES ('51','50','0,1,31,40,50,','查看',NULL,NULL,NULL,30,0,'cms:comment:view',NULL,'1','2013-05-27','1','2013-05-27','1');
INSERT INTO `sys_menu` VALUES ('52','50','0,1,31,40,50,','审核',NULL,NULL,NULL,40,0,'cms:comment:edit',NULL,'1','2013-05-27','1','2013-05-27','1');
INSERT INTO `sys_menu` VALUES ('53','40','0,1,31,40,','公共留言','/cms/guestbook/?status=2',NULL,'glass',80,1,NULL,NULL,'1','2013-05-27','1','2013-05-27','1');
INSERT INTO `sys_menu` VALUES ('54','53','0,1,31,40,53,','查看',NULL,NULL,NULL,30,0,'cms:guestbook:view',NULL,'1','2013-05-27','1','2013-05-27','1');
INSERT INTO `sys_menu` VALUES ('55','53','0,1,31,40,53,','审核',NULL,NULL,NULL,40,0,'cms:guestbook:edit',NULL,'1','2013-05-27','1','2013-05-27','1');
INSERT INTO `sys_menu` VALUES ('56','71','0,1,27,71,','文件管理','/../static/ckfinder/ckfinder.html',NULL,'folder-open',90,1,NULL,NULL,'1','2013-05-27','1','2013-05-27','0');
INSERT INTO `sys_menu` VALUES ('57','56','0,1,27,40,56,','查看',NULL,NULL,NULL,30,0,'cms:ckfinder:view',NULL,'1','2013-05-27','1','2013-05-27','1');
INSERT INTO `sys_menu` VALUES ('58','56','0,1,27,40,56,','上传',NULL,NULL,NULL,40,0,'cms:ckfinder:upload',NULL,'1','2013-05-27','1','2013-05-27','1');
INSERT INTO `sys_menu` VALUES ('59','56','0,1,27,40,56,','修改',NULL,NULL,NULL,50,0,'cms:ckfinder:edit',NULL,'1','2013-05-27','1','2013-05-27','1');
INSERT INTO `sys_menu` VALUES ('67','2','0,1,2,','日志查询',NULL,NULL,NULL,985,1,NULL,NULL,'1','2013-06-03','1','2013-06-03','0');
INSERT INTO `sys_menu` VALUES ('68','67','0,1,2,67,','日志查询','/sys/log',NULL,'pencil',30,1,'sys:log:view',NULL,'1','2013-06-03','1','2013-06-03','0');
INSERT INTO `sys_menu` VALUES ('71','27','0,1,27,','文件管理',NULL,NULL,NULL,90,1,NULL,NULL,'1','2013-05-27','1','2013-05-27','0');
INSERT INTO `sys_menu` VALUES ('79','1','0,1,','代码生成','','','',5000,0,'','','1','2013-10-16','1','2015-07-04 16:43:48','0');
INSERT INTO `sys_menu` VALUES ('80','79','0,1,79,','代码生成',NULL,NULL,NULL,50,1,NULL,NULL,'1','2013-10-16','1','2013-10-16','0');
INSERT INTO `sys_menu` VALUES ('81','80','0,1,79,80,','生成方案配置','/gen/genScheme',NULL,NULL,30,1,'gen:genScheme:view,gen:genScheme:edit',NULL,'1','2013-10-16','1','2013-10-16','0');
INSERT INTO `sys_menu` VALUES ('82','80','0,1,79,80,','业务表配置','/gen/genTable',NULL,NULL,20,1,'gen:genTable:view,gen:genTable:edit,gen:genTableColumn:view,gen:genTableColumn:edit',NULL,'1','2013-10-16','1','2013-10-16','0');
INSERT INTO `sys_menu` VALUES ('83','80','0,1,79,80,','代码模板管理','/gen/genTemplate',NULL,NULL,90,1,'gen:genTemplate:view,gen:genTemplate:edit',NULL,'1','2013-10-16','1','2013-10-16','0');
INSERT INTO `sys_menu` VALUES ('84','67','0,1,2,67,','连接池监视','/../druid',NULL,NULL,40,1,NULL,NULL,'1','2013-10-18','1','2013-10-18','0');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table sys_office
#

DROP TABLE IF EXISTS `sys_office`;
CREATE TABLE `sys_office` (
  `id` double(53,0) DEFAULT NULL,
  `parent_id` double(53,0) DEFAULT NULL,
  `parent_ids` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sort` double(53,0) DEFAULT NULL,
  `area_id` double(53,0) DEFAULT NULL,
  `code` double(53,0) DEFAULT NULL,
  `type` double(53,0) DEFAULT NULL,
  `grade` double(53,0) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `master` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `useable` double(53,0) DEFAULT NULL,
  `create_by` double(53,0) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` double(53,0) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `del_flag` double(53,0) DEFAULT NULL,
  `PRIMARY_PERSON` varchar(64) DEFAULT NULL,
  `DEPUTY_PERSON` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table sys_office
#
LOCK TABLES `sys_office` WRITE;
/*!40000 ALTER TABLE `sys_office` DISABLE KEYS */;

INSERT INTO `sys_office` VALUES (1,0,'0,','科联汇通科技有限公司',10,2,100000,1,1,'','','','','','','',1,1,'2013-05-27',1,'2015-07-04 16:45:43',0,'','');
INSERT INTO `sys_office` VALUES (2,1,'0,1,','公司领导',10,2,100001,2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2013-05-27',1,'2013-05-27',0,NULL,NULL);
INSERT INTO `sys_office` VALUES (3,1,'0,1,','综合部',20,2,100002,2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2013-05-27',1,'2013-05-27',0,NULL,NULL);
INSERT INTO `sys_office` VALUES (4,1,'0,1,','市场部',30,2,100003,2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2013-05-27',1,'2013-05-27',0,NULL,NULL);
INSERT INTO `sys_office` VALUES (5,1,'0,1,','技术部',40,2,100004,2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2013-05-27',1,'2013-05-27',1,NULL,NULL);
INSERT INTO `sys_office` VALUES (6,1,'0,1,','研发部',50,2,100005,2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2013-05-27',1,'2013-05-27',0,NULL,NULL);
/*!40000 ALTER TABLE `sys_office` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table sys_role
#

DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(32) DEFAULT NULL,
  `office_id` varchar(32) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `enname` varchar(255) DEFAULT NULL,
  `role_type` varchar(255) DEFAULT NULL,
  `data_scope` double(53,0) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `useable` double(53,0) DEFAULT NULL,
  `create_by` varchar(32) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(32) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `del_flag` double(53,0) DEFAULT NULL,
  `is_sys` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table sys_role
#
LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;

INSERT INTO `sys_role` VALUES ('1','2','系统管理员','dept','assignment',1,'',1,'1','2013-05-27','1','2015-07-04 16:40:52',0,'1');
INSERT INTO `sys_role` VALUES ('2','2','公司管理员','hr','assignment',2,'',1,'1','2013-05-27','1','2015-07-04 16:40:45',0,'1');
INSERT INTO `sys_role` VALUES ('4','1','部门管理员','b','assignment',4,NULL,1,'1','2013-05-27','1','2013-05-27',0,NULL);
INSERT INTO `sys_role` VALUES ('6','2','普通用户','d','assignment',8,'',1,'1','2013-05-27','1','2015-07-04 16:38:11',0,'1');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table sys_role_menu
#

DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` varchar(32) DEFAULT NULL,
  `menu_id` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table sys_role_menu
#
LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;

INSERT INTO `sys_role_menu` VALUES ('3','1');
INSERT INTO `sys_role_menu` VALUES ('3','2');
INSERT INTO `sys_role_menu` VALUES ('3','3');
INSERT INTO `sys_role_menu` VALUES ('3','4');
INSERT INTO `sys_role_menu` VALUES ('3','5');
INSERT INTO `sys_role_menu` VALUES ('3','6');
INSERT INTO `sys_role_menu` VALUES ('3','7');
INSERT INTO `sys_role_menu` VALUES ('3','8');
INSERT INTO `sys_role_menu` VALUES ('3','9');
INSERT INTO `sys_role_menu` VALUES ('3','10');
INSERT INTO `sys_role_menu` VALUES ('3','11');
INSERT INTO `sys_role_menu` VALUES ('3','12');
INSERT INTO `sys_role_menu` VALUES ('3','13');
INSERT INTO `sys_role_menu` VALUES ('3','14');
INSERT INTO `sys_role_menu` VALUES ('3','15');
INSERT INTO `sys_role_menu` VALUES ('3','16');
INSERT INTO `sys_role_menu` VALUES ('3','17');
INSERT INTO `sys_role_menu` VALUES ('3','18');
INSERT INTO `sys_role_menu` VALUES ('3','19');
INSERT INTO `sys_role_menu` VALUES ('3','20');
INSERT INTO `sys_role_menu` VALUES ('3','21');
INSERT INTO `sys_role_menu` VALUES ('3','22');
INSERT INTO `sys_role_menu` VALUES ('3','23');
INSERT INTO `sys_role_menu` VALUES ('3','24');
INSERT INTO `sys_role_menu` VALUES ('3','25');
INSERT INTO `sys_role_menu` VALUES ('3','26');
INSERT INTO `sys_role_menu` VALUES ('3','27');
INSERT INTO `sys_role_menu` VALUES ('3','28');
INSERT INTO `sys_role_menu` VALUES ('3','29');
INSERT INTO `sys_role_menu` VALUES ('3','30');
INSERT INTO `sys_role_menu` VALUES ('3','31');
INSERT INTO `sys_role_menu` VALUES ('3','32');
INSERT INTO `sys_role_menu` VALUES ('3','33');
INSERT INTO `sys_role_menu` VALUES ('3','34');
INSERT INTO `sys_role_menu` VALUES ('3','35');
INSERT INTO `sys_role_menu` VALUES ('3','36');
INSERT INTO `sys_role_menu` VALUES ('3','37');
INSERT INTO `sys_role_menu` VALUES ('3','38');
INSERT INTO `sys_role_menu` VALUES ('3','39');
INSERT INTO `sys_role_menu` VALUES ('3','40');
INSERT INTO `sys_role_menu` VALUES ('3','41');
INSERT INTO `sys_role_menu` VALUES ('3','42');
INSERT INTO `sys_role_menu` VALUES ('3','43');
INSERT INTO `sys_role_menu` VALUES ('3','44');
INSERT INTO `sys_role_menu` VALUES ('3','45');
INSERT INTO `sys_role_menu` VALUES ('3','46');
INSERT INTO `sys_role_menu` VALUES ('3','47');
INSERT INTO `sys_role_menu` VALUES ('3','48');
INSERT INTO `sys_role_menu` VALUES ('3','49');
INSERT INTO `sys_role_menu` VALUES ('3','50');
INSERT INTO `sys_role_menu` VALUES ('3','51');
INSERT INTO `sys_role_menu` VALUES ('3','52');
INSERT INTO `sys_role_menu` VALUES ('3','53');
INSERT INTO `sys_role_menu` VALUES ('3','54');
INSERT INTO `sys_role_menu` VALUES ('3','55');
INSERT INTO `sys_role_menu` VALUES ('3','56');
INSERT INTO `sys_role_menu` VALUES ('3','57');
INSERT INTO `sys_role_menu` VALUES ('3','58');
INSERT INTO `sys_role_menu` VALUES ('3','59');
INSERT INTO `sys_role_menu` VALUES ('3','60');
INSERT INTO `sys_role_menu` VALUES ('3','61');
INSERT INTO `sys_role_menu` VALUES ('3','62');
INSERT INTO `sys_role_menu` VALUES ('3','63');
INSERT INTO `sys_role_menu` VALUES ('3','64');
INSERT INTO `sys_role_menu` VALUES ('3','65');
INSERT INTO `sys_role_menu` VALUES ('3','66');
INSERT INTO `sys_role_menu` VALUES ('3','67');
INSERT INTO `sys_role_menu` VALUES ('3','68');
INSERT INTO `sys_role_menu` VALUES ('3','69');
INSERT INTO `sys_role_menu` VALUES ('3','70');
INSERT INTO `sys_role_menu` VALUES ('3','71');
INSERT INTO `sys_role_menu` VALUES ('3','72');
INSERT INTO `sys_role_menu` VALUES ('3','73');
INSERT INTO `sys_role_menu` VALUES ('3','74');
INSERT INTO `sys_role_menu` VALUES ('3','75');
INSERT INTO `sys_role_menu` VALUES ('3','76');
INSERT INTO `sys_role_menu` VALUES ('3','77');
INSERT INTO `sys_role_menu` VALUES ('3','78');
INSERT INTO `sys_role_menu` VALUES ('3','79');
INSERT INTO `sys_role_menu` VALUES ('3','80');
INSERT INTO `sys_role_menu` VALUES ('3','81');
INSERT INTO `sys_role_menu` VALUES ('3','82');
INSERT INTO `sys_role_menu` VALUES ('3','83');
INSERT INTO `sys_role_menu` VALUES ('3','84');
INSERT INTO `sys_role_menu` VALUES ('3','85');
INSERT INTO `sys_role_menu` VALUES ('3','86');
INSERT INTO `sys_role_menu` VALUES ('3','87');
INSERT INTO `sys_role_menu` VALUES ('3','88');
INSERT INTO `sys_role_menu` VALUES ('3','89');
INSERT INTO `sys_role_menu` VALUES ('3','90');
INSERT INTO `sys_role_menu` VALUES ('6','1');
INSERT INTO `sys_role_menu` VALUES ('6','31');
INSERT INTO `sys_role_menu` VALUES ('6','32');
INSERT INTO `sys_role_menu` VALUES ('6','36');
INSERT INTO `sys_role_menu` VALUES ('6','37');
INSERT INTO `sys_role_menu` VALUES ('6','38');
INSERT INTO `sys_role_menu` VALUES ('6','33');
INSERT INTO `sys_role_menu` VALUES ('6','34');
INSERT INTO `sys_role_menu` VALUES ('6','35');
INSERT INTO `sys_role_menu` VALUES ('6','27');
INSERT INTO `sys_role_menu` VALUES ('6','28');
INSERT INTO `sys_role_menu` VALUES ('6','29');
INSERT INTO `sys_role_menu` VALUES ('6','30');
INSERT INTO `sys_role_menu` VALUES ('6','71');
INSERT INTO `sys_role_menu` VALUES ('6','56');
INSERT INTO `sys_role_menu` VALUES ('2','1');
INSERT INTO `sys_role_menu` VALUES ('2','31');
INSERT INTO `sys_role_menu` VALUES ('2','32');
INSERT INTO `sys_role_menu` VALUES ('2','36');
INSERT INTO `sys_role_menu` VALUES ('2','37');
INSERT INTO `sys_role_menu` VALUES ('2','38');
INSERT INTO `sys_role_menu` VALUES ('2','33');
INSERT INTO `sys_role_menu` VALUES ('2','34');
INSERT INTO `sys_role_menu` VALUES ('2','35');
INSERT INTO `sys_role_menu` VALUES ('2','27');
INSERT INTO `sys_role_menu` VALUES ('2','28');
INSERT INTO `sys_role_menu` VALUES ('2','29');
INSERT INTO `sys_role_menu` VALUES ('2','30');
INSERT INTO `sys_role_menu` VALUES ('2','71');
INSERT INTO `sys_role_menu` VALUES ('2','56');
INSERT INTO `sys_role_menu` VALUES ('2','2');
INSERT INTO `sys_role_menu` VALUES ('2','13');
INSERT INTO `sys_role_menu` VALUES ('2','20');
INSERT INTO `sys_role_menu` VALUES ('2','21');
INSERT INTO `sys_role_menu` VALUES ('2','22');
INSERT INTO `sys_role_menu` VALUES ('2','17');
INSERT INTO `sys_role_menu` VALUES ('2','18');
INSERT INTO `sys_role_menu` VALUES ('2','19');
INSERT INTO `sys_role_menu` VALUES ('2','14');
INSERT INTO `sys_role_menu` VALUES ('2','15');
INSERT INTO `sys_role_menu` VALUES ('2','16');
INSERT INTO `sys_role_menu` VALUES ('2','3');
INSERT INTO `sys_role_menu` VALUES ('2','4');
INSERT INTO `sys_role_menu` VALUES ('2','5');
INSERT INTO `sys_role_menu` VALUES ('2','6');
INSERT INTO `sys_role_menu` VALUES ('2','7');
INSERT INTO `sys_role_menu` VALUES ('2','8');
INSERT INTO `sys_role_menu` VALUES ('2','9');
INSERT INTO `sys_role_menu` VALUES ('2','10');
INSERT INTO `sys_role_menu` VALUES ('2','11');
INSERT INTO `sys_role_menu` VALUES ('2','12');
INSERT INTO `sys_role_menu` VALUES ('2','67');
INSERT INTO `sys_role_menu` VALUES ('2','68');
INSERT INTO `sys_role_menu` VALUES ('2','84');
INSERT INTO `sys_role_menu` VALUES ('1','1');
INSERT INTO `sys_role_menu` VALUES ('1','31');
INSERT INTO `sys_role_menu` VALUES ('1','32');
INSERT INTO `sys_role_menu` VALUES ('1','36');
INSERT INTO `sys_role_menu` VALUES ('1','37');
INSERT INTO `sys_role_menu` VALUES ('1','38');
INSERT INTO `sys_role_menu` VALUES ('1','33');
INSERT INTO `sys_role_menu` VALUES ('1','34');
INSERT INTO `sys_role_menu` VALUES ('1','35');
INSERT INTO `sys_role_menu` VALUES ('1','27');
INSERT INTO `sys_role_menu` VALUES ('1','28');
INSERT INTO `sys_role_menu` VALUES ('1','29');
INSERT INTO `sys_role_menu` VALUES ('1','30');
INSERT INTO `sys_role_menu` VALUES ('1','71');
INSERT INTO `sys_role_menu` VALUES ('1','56');
INSERT INTO `sys_role_menu` VALUES ('1','2');
INSERT INTO `sys_role_menu` VALUES ('1','13');
INSERT INTO `sys_role_menu` VALUES ('1','20');
INSERT INTO `sys_role_menu` VALUES ('1','21');
INSERT INTO `sys_role_menu` VALUES ('1','22');
INSERT INTO `sys_role_menu` VALUES ('1','17');
INSERT INTO `sys_role_menu` VALUES ('1','18');
INSERT INTO `sys_role_menu` VALUES ('1','19');
INSERT INTO `sys_role_menu` VALUES ('1','14');
INSERT INTO `sys_role_menu` VALUES ('1','15');
INSERT INTO `sys_role_menu` VALUES ('1','16');
INSERT INTO `sys_role_menu` VALUES ('1','3');
INSERT INTO `sys_role_menu` VALUES ('1','4');
INSERT INTO `sys_role_menu` VALUES ('1','5');
INSERT INTO `sys_role_menu` VALUES ('1','6');
INSERT INTO `sys_role_menu` VALUES ('1','7');
INSERT INTO `sys_role_menu` VALUES ('1','8');
INSERT INTO `sys_role_menu` VALUES ('1','9');
INSERT INTO `sys_role_menu` VALUES ('1','10');
INSERT INTO `sys_role_menu` VALUES ('1','11');
INSERT INTO `sys_role_menu` VALUES ('1','12');
INSERT INTO `sys_role_menu` VALUES ('1','67');
INSERT INTO `sys_role_menu` VALUES ('1','68');
INSERT INTO `sys_role_menu` VALUES ('1','84');
INSERT INTO `sys_role_menu` VALUES ('441cfed923064d59b6b9f4d447f9d72a','1');
INSERT INTO `sys_role_menu` VALUES ('441cfed923064d59b6b9f4d447f9d72a','31');
INSERT INTO `sys_role_menu` VALUES ('441cfed923064d59b6b9f4d447f9d72a','32');
INSERT INTO `sys_role_menu` VALUES ('441cfed923064d59b6b9f4d447f9d72a','36');
INSERT INTO `sys_role_menu` VALUES ('441cfed923064d59b6b9f4d447f9d72a','37');
INSERT INTO `sys_role_menu` VALUES ('441cfed923064d59b6b9f4d447f9d72a','38');
INSERT INTO `sys_role_menu` VALUES ('441cfed923064d59b6b9f4d447f9d72a','33');
INSERT INTO `sys_role_menu` VALUES ('441cfed923064d59b6b9f4d447f9d72a','34');
INSERT INTO `sys_role_menu` VALUES ('441cfed923064d59b6b9f4d447f9d72a','35');
INSERT INTO `sys_role_menu` VALUES ('441cfed923064d59b6b9f4d447f9d72a','27');
INSERT INTO `sys_role_menu` VALUES ('441cfed923064d59b6b9f4d447f9d72a','28');
INSERT INTO `sys_role_menu` VALUES ('441cfed923064d59b6b9f4d447f9d72a','29');
INSERT INTO `sys_role_menu` VALUES ('441cfed923064d59b6b9f4d447f9d72a','30');
INSERT INTO `sys_role_menu` VALUES ('441cfed923064d59b6b9f4d447f9d72a','71');
INSERT INTO `sys_role_menu` VALUES ('441cfed923064d59b6b9f4d447f9d72a','56');
INSERT INTO `sys_role_menu` VALUES ('441cfed923064d59b6b9f4d447f9d72a','2');
INSERT INTO `sys_role_menu` VALUES ('441cfed923064d59b6b9f4d447f9d72a','13');
INSERT INTO `sys_role_menu` VALUES ('441cfed923064d59b6b9f4d447f9d72a','20');
INSERT INTO `sys_role_menu` VALUES ('441cfed923064d59b6b9f4d447f9d72a','21');
INSERT INTO `sys_role_menu` VALUES ('441cfed923064d59b6b9f4d447f9d72a','22');
INSERT INTO `sys_role_menu` VALUES ('441cfed923064d59b6b9f4d447f9d72a','17');
INSERT INTO `sys_role_menu` VALUES ('441cfed923064d59b6b9f4d447f9d72a','18');
INSERT INTO `sys_role_menu` VALUES ('441cfed923064d59b6b9f4d447f9d72a','19');
INSERT INTO `sys_role_menu` VALUES ('441cfed923064d59b6b9f4d447f9d72a','14');
INSERT INTO `sys_role_menu` VALUES ('441cfed923064d59b6b9f4d447f9d72a','15');
INSERT INTO `sys_role_menu` VALUES ('441cfed923064d59b6b9f4d447f9d72a','16');
INSERT INTO `sys_role_menu` VALUES ('441cfed923064d59b6b9f4d447f9d72a','3');
INSERT INTO `sys_role_menu` VALUES ('441cfed923064d59b6b9f4d447f9d72a','4');
INSERT INTO `sys_role_menu` VALUES ('441cfed923064d59b6b9f4d447f9d72a','5');
INSERT INTO `sys_role_menu` VALUES ('441cfed923064d59b6b9f4d447f9d72a','6');
INSERT INTO `sys_role_menu` VALUES ('441cfed923064d59b6b9f4d447f9d72a','7');
INSERT INTO `sys_role_menu` VALUES ('441cfed923064d59b6b9f4d447f9d72a','8');
INSERT INTO `sys_role_menu` VALUES ('441cfed923064d59b6b9f4d447f9d72a','9');
INSERT INTO `sys_role_menu` VALUES ('441cfed923064d59b6b9f4d447f9d72a','10');
INSERT INTO `sys_role_menu` VALUES ('441cfed923064d59b6b9f4d447f9d72a','11');
INSERT INTO `sys_role_menu` VALUES ('441cfed923064d59b6b9f4d447f9d72a','12');
INSERT INTO `sys_role_menu` VALUES ('441cfed923064d59b6b9f4d447f9d72a','67');
INSERT INTO `sys_role_menu` VALUES ('441cfed923064d59b6b9f4d447f9d72a','68');
INSERT INTO `sys_role_menu` VALUES ('441cfed923064d59b6b9f4d447f9d72a','84');
INSERT INTO `sys_role_menu` VALUES ('441cfed923064d59b6b9f4d447f9d72a','79');
INSERT INTO `sys_role_menu` VALUES ('441cfed923064d59b6b9f4d447f9d72a','80');
INSERT INTO `sys_role_menu` VALUES ('441cfed923064d59b6b9f4d447f9d72a','82');
INSERT INTO `sys_role_menu` VALUES ('441cfed923064d59b6b9f4d447f9d72a','81');
INSERT INTO `sys_role_menu` VALUES ('441cfed923064d59b6b9f4d447f9d72a','83');
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table sys_role_office
#

DROP TABLE IF EXISTS `sys_role_office`;
CREATE TABLE `sys_role_office` (
  `role_id` varchar(32) DEFAULT NULL,
  `office_id` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table sys_role_office
#
LOCK TABLES `sys_role_office` WRITE;
/*!40000 ALTER TABLE `sys_role_office` DISABLE KEYS */;

INSERT INTO `sys_role_office` VALUES ('7','7');
INSERT INTO `sys_role_office` VALUES ('7','8');
INSERT INTO `sys_role_office` VALUES ('7','9');
INSERT INTO `sys_role_office` VALUES ('7','10');
INSERT INTO `sys_role_office` VALUES ('7','11');
INSERT INTO `sys_role_office` VALUES ('7','12');
INSERT INTO `sys_role_office` VALUES ('7','13');
INSERT INTO `sys_role_office` VALUES ('7','14');
INSERT INTO `sys_role_office` VALUES ('7','15');
INSERT INTO `sys_role_office` VALUES ('7','16');
INSERT INTO `sys_role_office` VALUES ('7','17');
INSERT INTO `sys_role_office` VALUES ('7','18');
INSERT INTO `sys_role_office` VALUES ('7','19');
INSERT INTO `sys_role_office` VALUES ('7','20');
INSERT INTO `sys_role_office` VALUES ('7','21');
INSERT INTO `sys_role_office` VALUES ('7','22');
INSERT INTO `sys_role_office` VALUES ('7','23');
INSERT INTO `sys_role_office` VALUES ('7','24');
INSERT INTO `sys_role_office` VALUES ('7','25');
INSERT INTO `sys_role_office` VALUES ('7','26');
/*!40000 ALTER TABLE `sys_role_office` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table sys_user
#

DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(32) DEFAULT NULL,
  `company_id` varchar(32) DEFAULT NULL,
  `office_id` varchar(32) DEFAULT NULL,
  `login_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `no` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(18) DEFAULT NULL,
  `mobile` varchar(18) DEFAULT NULL,
  `user_type` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `login_flag` double(53,0) DEFAULT NULL,
  `create_by` varchar(64) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(64) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `del_flag` double(53,0) DEFAULT NULL,
  `login_ip` varchar(100) DEFAULT NULL,
  `login_date` datetime DEFAULT NULL,
  `photo` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table sys_user
#
LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;

INSERT INTO `sys_user` VALUES ('1','1','2','admin','f5242185af06ac36b12835f5dc3be90e3ace0fe329438dbbd2864f12','0001','系统管理员','','8675','8675','','最高管理员',1,'1','2013-05-27','1','2015-07-04 16:39:15',0,'127.0.0.1','2015-07-04 16:57:12','/yundaicms/userfiles/1/images/content/2015/07/IMG_0465.JPG');
INSERT INTO `sys_user` VALUES ('3','1','3','sd_zhb','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0003','综合部',NULL,NULL,NULL,NULL,NULL,1,'1','2013-05-27','1','2013-05-27',0,NULL,NULL,NULL);
INSERT INTO `sys_user` VALUES ('4','1','4','sd_scb','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0004','市场部',NULL,NULL,NULL,NULL,NULL,1,'1','2013-05-27','1','2013-05-27',0,NULL,NULL,NULL);
INSERT INTO `sys_user` VALUES ('5','1','5','sd_jsb','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0005','技术部',NULL,NULL,NULL,NULL,NULL,1,'1','2013-05-27','1','2013-05-27',0,NULL,NULL,NULL);
INSERT INTO `sys_user` VALUES ('6','1','4','sd_yfb','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0006','研发部',NULL,NULL,NULL,NULL,NULL,1,'1','2013-05-27','1','2013-05-27',0,'127.0.0.1','2015-07-04 16:41:17',NULL);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table sys_user_role
#

DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` varchar(32) DEFAULT NULL,
  `role_id` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table sys_user_role
#
LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;

INSERT INTO `sys_user_role` VALUES ('2','1');
INSERT INTO `sys_user_role` VALUES ('3','2');
INSERT INTO `sys_user_role` VALUES ('4','3');
INSERT INTO `sys_user_role` VALUES ('5','4');
INSERT INTO `sys_user_role` VALUES ('6','5');
INSERT INTO `sys_user_role` VALUES ('8','2');
INSERT INTO `sys_user_role` VALUES ('9','1');
INSERT INTO `sys_user_role` VALUES ('10','2');
INSERT INTO `sys_user_role` VALUES ('11','3');
INSERT INTO `sys_user_role` VALUES ('12','4');
INSERT INTO `sys_user_role` VALUES ('13','5');
INSERT INTO `sys_user_role` VALUES ('14','6');
INSERT INTO `sys_user_role` VALUES ('7','2');
INSERT INTO `sys_user_role` VALUES ('20bb2128bb964f0f968ccfcff2d0917f','441cfed923064d59b6b9f4d447f9d72a');
INSERT INTO `sys_user_role` VALUES ('1','2');
INSERT INTO `sys_user_role` VALUES ('1','1');
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for function queryChildrenClassify
#

DROP FUNCTION IF EXISTS `queryChildrenClassify`;
CREATE DEFINER=`root`@`localhost` FUNCTION `queryChildrenClassify`(rootId INT) RETURNS varchar(1000) CHARSET utf8
BEGIN
      DECLARE sChildList VARCHAR(1000);
      DECLARE sChildTemp VARCHAR(1000);
      SET sChildTemp =cast(rootId as CHAR);
      WHILE sChildTemp is not null DO
        IF (sChildList is not null) THEN
          SET sChildList = concat(sChildList,',',sChildTemp);
    ELSE
      SET sChildList = concat(sChildTemp);
    END IF;
        SELECT group_concat(id) INTO sChildTemp FROM cms_tb_classify where FIND_IN_SET(parent_id,sChildTemp)>0;
      END WHILE;
      RETURN sChildList;
    END;


/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
