# MySQL-Front 5.1  (Build 3.0)

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;


# Host: localhost    Database: klcms
# ------------------------------------------------------
# Server version 5.1.32-community

DROP DATABASE IF EXISTS `klcms`;
CREATE DATABASE `klcms` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `klcms`;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

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
  `ID` bigint(20) NOT NULL,
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
  `CREATE_DATE` date NOT NULL,
  `CREATE_BY` varchar(30) NOT NULL,
  `UPDATE_DATE` date DEFAULT NULL,
  `UPDATE_BY` varchar(30) DEFAULT NULL,
  `REMARKS` varchar(200) DEFAULT NULL,
  `DEL_FLAG` char(1) DEFAULT '0',
  `TYPE` int(1) DEFAULT NULL,
  `IS_RECOMMAND` char(1) DEFAULT '0',
  `SHORT_TITLE` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `CHANNEL_ID` (`CHANNEL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table cms_tb_content
#
LOCK TABLES `cms_tb_content` WRITE;
/*!40000 ALTER TABLE `cms_tb_content` DISABLE KEYS */;

INSERT INTO `cms_tb_content` VALUES (0,16,NULL,'few','few','few','','',NULL,'/klcms/userfiles/1/_thumbs/images/content/2015/07/IMG_0465.JPG','1','',NULL,'2015-07-02','1','2015-07-02','1',NULL,'0',0,'0','few');
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
  `CONTENT_ID` bigint(1) NOT NULL,
  `CONTENT_TXT` text COMMENT '文章内容',
  `USER_DEF1` varchar(200) DEFAULT NULL COMMENT '扩展内容1',
  `USER_DEF2` varchar(200) DEFAULT NULL COMMENT '扩展内容2',
  `USER_DEF3` varchar(4000) DEFAULT NULL COMMENT '扩展内容3',
  PRIMARY KEY (`CONTENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table cms_tb_content_txt
#
LOCK TABLES `cms_tb_content_txt` WRITE;
/*!40000 ALTER TABLE `cms_tb_content_txt` DISABLE KEYS */;

INSERT INTO `cms_tb_content_txt` VALUES (0,'<p><img alt=\"\" src=\"/klcms/userfiles/1/images/content/2015/07/IMG_0466.PNG\" style=\"height:768px; width:512px\" />few</p>',NULL,NULL,NULL);
/*!40000 ALTER TABLE `cms_tb_content_txt` ENABLE KEYS */;
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
INSERT INTO `sys_menu` VALUES ('24','23','0,1,2,23','官方首页','http://jeesite.com','_blank',NULL,30,0,NULL,NULL,'1','2013-05-27','1','2013-05-27','0');
INSERT INTO `sys_menu` VALUES ('25','23','0,1,2,23','项目支持','http://jeesite.com/donation.html','_blank',NULL,50,0,NULL,NULL,'1','2013-05-27','1','2013-05-27','0');
INSERT INTO `sys_menu` VALUES ('26','23','0,1,2,23','论坛交流','http://bbs.jeesite.com','_blank',NULL,80,0,NULL,NULL,'1','2013-05-27','1','2013-05-27','0');
INSERT INTO `sys_menu` VALUES ('27','1','0,1,','我的面板',NULL,NULL,NULL,600,1,NULL,NULL,'1','2013-05-27','1','2013-05-27','0');
INSERT INTO `sys_menu` VALUES ('28','27','0,1,27,','个人信息',NULL,NULL,NULL,30,1,NULL,NULL,'1','2013-05-27','1','2013-05-27','0');
INSERT INTO `sys_menu` VALUES ('29','28','0,1,27,28,','个人信息','/sys/user/info',NULL,'user',30,1,NULL,NULL,'1','2013-05-27','1','2013-05-27','0');
INSERT INTO `sys_menu` VALUES ('30','28','0,1,27,28,','修改密码','/sys/user/modifyPwd',NULL,'lock',40,1,NULL,NULL,'1','2013-05-27','1','2013-05-27','0');
INSERT INTO `sys_menu` VALUES ('31','1','0,1,','内容管理',NULL,NULL,NULL,500,1,NULL,NULL,'1','2013-05-27','1','2013-05-27','0');
INSERT INTO `sys_menu` VALUES ('32','31','0,1,31,','栏目设置',NULL,NULL,NULL,450,1,NULL,NULL,'1','2013-05-27','1','2013-05-27','0');
INSERT INTO `sys_menu` VALUES ('33','32','0,1,31,32,','分类管理','/cms/classify/','','align-justify',30,1,'','','1','2013-05-27','1','2015-07-01 22:36:30','0');
INSERT INTO `sys_menu` VALUES ('34','33','0,1,31,32,33,','查看','','','',30,0,'cms:classify:view','','1','2013-05-27','1','2015-07-01 22:30:16','0');
INSERT INTO `sys_menu` VALUES ('35','33','0,1,31,32,33,','修改','','','',40,0,'cms:classify:edit','','1','2013-05-27','1','2015-07-01 23:29:21','0');
INSERT INTO `sys_menu` VALUES ('36','32','0,1,31,32,','内容管理','/cms/content/','','certificate',20,1,'','','1','2013-05-27','1','2015-07-02 00:04:34','0');
INSERT INTO `sys_menu` VALUES ('37','36','0,1,31,32,36,','查看','','','',30,0,'cms:content:view','','1','2013-05-27','1','2015-07-02 00:04:48','0');
INSERT INTO `sys_menu` VALUES ('38','36','0,1,31,32,36,','修改','','','',40,0,'cms:content:edit','','1','2013-05-27','1','2015-07-02 00:04:55','0');
INSERT INTO `sys_menu` VALUES ('40','31','0,1,31,','内容管理',NULL,NULL,NULL,500,1,'cms:view',NULL,'1','2013-05-27','1','2013-05-27','0');
INSERT INTO `sys_menu` VALUES ('41','40','0,1,31,40,','内容发布','/cms/',NULL,'briefcase',30,1,NULL,NULL,'1','2013-05-27','1','2013-05-27','0');
INSERT INTO `sys_menu` VALUES ('42','41','0,1,31,40,41,','文章模型','/cms/article/',NULL,'file',40,0,NULL,NULL,'1','2013-05-27','1','2013-05-27','0');
INSERT INTO `sys_menu` VALUES ('43','42','0,1,31,40,41,42,','查看',NULL,NULL,NULL,30,0,'cms:article:view',NULL,'1','2013-05-27','1','2013-05-27','0');
INSERT INTO `sys_menu` VALUES ('44','42','0,1,31,40,41,42,','修改',NULL,NULL,NULL,40,0,'cms:article:edit',NULL,'1','2013-05-27','1','2013-05-27','0');
INSERT INTO `sys_menu` VALUES ('45','42','0,1,31,40,41,42,','审核',NULL,NULL,NULL,50,0,'cms:article:audit',NULL,'1','2013-05-27','1','2013-05-27','0');
INSERT INTO `sys_menu` VALUES ('46','41','0,1,31,40,41,','链接模型','/cms/link/',NULL,'random',60,0,NULL,NULL,'1','2013-05-27','1','2013-05-27','0');
INSERT INTO `sys_menu` VALUES ('47','46','0,1,31,40,41,46,','查看',NULL,NULL,NULL,30,0,'cms:link:view',NULL,'1','2013-05-27','1','2013-05-27','0');
INSERT INTO `sys_menu` VALUES ('48','46','0,1,31,40,41,46,','修改',NULL,NULL,NULL,40,0,'cms:link:edit',NULL,'1','2013-05-27','1','2013-05-27','0');
INSERT INTO `sys_menu` VALUES ('49','46','0,1,31,40,41,46,','审核',NULL,NULL,NULL,50,0,'cms:link:audit',NULL,'1','2013-05-27','1','2013-05-27','0');
INSERT INTO `sys_menu` VALUES ('50','40','0,1,31,40,','评论管理','/cms/comment/?status=2',NULL,'comment',40,1,NULL,NULL,'1','2013-05-27','1','2013-05-27','0');
INSERT INTO `sys_menu` VALUES ('51','50','0,1,31,40,50,','查看',NULL,NULL,NULL,30,0,'cms:comment:view',NULL,'1','2013-05-27','1','2013-05-27','0');
INSERT INTO `sys_menu` VALUES ('52','50','0,1,31,40,50,','审核',NULL,NULL,NULL,40,0,'cms:comment:edit',NULL,'1','2013-05-27','1','2013-05-27','0');
INSERT INTO `sys_menu` VALUES ('53','40','0,1,31,40,','公共留言','/cms/guestbook/?status=2',NULL,'glass',80,1,NULL,NULL,'1','2013-05-27','1','2013-05-27','0');
INSERT INTO `sys_menu` VALUES ('54','53','0,1,31,40,53,','查看',NULL,NULL,NULL,30,0,'cms:guestbook:view',NULL,'1','2013-05-27','1','2013-05-27','0');
INSERT INTO `sys_menu` VALUES ('55','53','0,1,31,40,53,','审核',NULL,NULL,NULL,40,0,'cms:guestbook:edit',NULL,'1','2013-05-27','1','2013-05-27','0');
INSERT INTO `sys_menu` VALUES ('56','71','0,1,27,71,','文件管理','/../static/ckfinder/ckfinder.html',NULL,'folder-open',90,1,NULL,NULL,'1','2013-05-27','1','2013-05-27','0');
INSERT INTO `sys_menu` VALUES ('57','56','0,1,27,40,56,','查看',NULL,NULL,NULL,30,0,'cms:ckfinder:view',NULL,'1','2013-05-27','1','2013-05-27','0');
INSERT INTO `sys_menu` VALUES ('58','56','0,1,27,40,56,','上传',NULL,NULL,NULL,40,0,'cms:ckfinder:upload',NULL,'1','2013-05-27','1','2013-05-27','0');
INSERT INTO `sys_menu` VALUES ('59','56','0,1,27,40,56,','修改',NULL,NULL,NULL,50,0,'cms:ckfinder:edit',NULL,'1','2013-05-27','1','2013-05-27','0');
INSERT INTO `sys_menu` VALUES ('67','2','0,1,2,','日志查询',NULL,NULL,NULL,985,1,NULL,NULL,'1','2013-06-03','1','2013-06-03','0');
INSERT INTO `sys_menu` VALUES ('68','67','0,1,2,67,','日志查询','/sys/log',NULL,'pencil',30,1,'sys:log:view',NULL,'1','2013-06-03','1','2013-06-03','0');
INSERT INTO `sys_menu` VALUES ('71','27','0,1,27,','文件管理',NULL,NULL,NULL,90,1,NULL,NULL,'1','2013-05-27','1','2013-05-27','0');
INSERT INTO `sys_menu` VALUES ('79','1','0,1,','代码生成',NULL,NULL,NULL,5000,1,NULL,NULL,'1','2013-10-16','1','2013-10-16','0');
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

INSERT INTO `sys_office` VALUES (1,0,'0,','科联汇通技术有限公司',10,2,100000,1,1,'','','','','','','',1,1,'2013-05-27',1,'2015-07-01 21:59:06',0,'','');
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

INSERT INTO `sys_role` VALUES ('1','1','系统管理员','dept','assignment',1,NULL,1,'1','2013-05-27','1','2013-05-27',0,NULL);
INSERT INTO `sys_role` VALUES ('2','1','公司管理员','hr','assignment',2,NULL,1,'1','2013-05-27','1','2013-05-27',0,NULL);
INSERT INTO `sys_role` VALUES ('4','1','部门管理员','b','assignment',4,NULL,1,'1','2013-05-27','1','2013-05-27',0,NULL);
INSERT INTO `sys_role` VALUES ('6','1','普通用户','d','assignment',8,NULL,1,'1','2013-05-27','1','2013-05-27',0,NULL);
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table sys_role_menu
#

DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` double(53,0) DEFAULT NULL,
  `menu_id` double(53,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table sys_role_menu
#
LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;

INSERT INTO `sys_role_menu` VALUES (1,1);
INSERT INTO `sys_role_menu` VALUES (1,2);
INSERT INTO `sys_role_menu` VALUES (1,3);
INSERT INTO `sys_role_menu` VALUES (1,4);
INSERT INTO `sys_role_menu` VALUES (1,5);
INSERT INTO `sys_role_menu` VALUES (1,6);
INSERT INTO `sys_role_menu` VALUES (1,7);
INSERT INTO `sys_role_menu` VALUES (1,8);
INSERT INTO `sys_role_menu` VALUES (1,9);
INSERT INTO `sys_role_menu` VALUES (1,10);
INSERT INTO `sys_role_menu` VALUES (1,11);
INSERT INTO `sys_role_menu` VALUES (1,12);
INSERT INTO `sys_role_menu` VALUES (1,13);
INSERT INTO `sys_role_menu` VALUES (1,14);
INSERT INTO `sys_role_menu` VALUES (1,15);
INSERT INTO `sys_role_menu` VALUES (1,16);
INSERT INTO `sys_role_menu` VALUES (1,17);
INSERT INTO `sys_role_menu` VALUES (1,18);
INSERT INTO `sys_role_menu` VALUES (1,19);
INSERT INTO `sys_role_menu` VALUES (1,20);
INSERT INTO `sys_role_menu` VALUES (1,21);
INSERT INTO `sys_role_menu` VALUES (1,22);
INSERT INTO `sys_role_menu` VALUES (1,23);
INSERT INTO `sys_role_menu` VALUES (1,24);
INSERT INTO `sys_role_menu` VALUES (1,25);
INSERT INTO `sys_role_menu` VALUES (1,26);
INSERT INTO `sys_role_menu` VALUES (1,27);
INSERT INTO `sys_role_menu` VALUES (1,28);
INSERT INTO `sys_role_menu` VALUES (1,29);
INSERT INTO `sys_role_menu` VALUES (1,30);
INSERT INTO `sys_role_menu` VALUES (1,31);
INSERT INTO `sys_role_menu` VALUES (1,32);
INSERT INTO `sys_role_menu` VALUES (1,33);
INSERT INTO `sys_role_menu` VALUES (1,34);
INSERT INTO `sys_role_menu` VALUES (1,35);
INSERT INTO `sys_role_menu` VALUES (1,36);
INSERT INTO `sys_role_menu` VALUES (1,37);
INSERT INTO `sys_role_menu` VALUES (1,38);
INSERT INTO `sys_role_menu` VALUES (1,39);
INSERT INTO `sys_role_menu` VALUES (1,40);
INSERT INTO `sys_role_menu` VALUES (1,41);
INSERT INTO `sys_role_menu` VALUES (1,42);
INSERT INTO `sys_role_menu` VALUES (1,43);
INSERT INTO `sys_role_menu` VALUES (1,44);
INSERT INTO `sys_role_menu` VALUES (1,45);
INSERT INTO `sys_role_menu` VALUES (1,46);
INSERT INTO `sys_role_menu` VALUES (1,47);
INSERT INTO `sys_role_menu` VALUES (1,48);
INSERT INTO `sys_role_menu` VALUES (1,49);
INSERT INTO `sys_role_menu` VALUES (1,50);
INSERT INTO `sys_role_menu` VALUES (1,51);
INSERT INTO `sys_role_menu` VALUES (1,52);
INSERT INTO `sys_role_menu` VALUES (1,53);
INSERT INTO `sys_role_menu` VALUES (1,54);
INSERT INTO `sys_role_menu` VALUES (1,55);
INSERT INTO `sys_role_menu` VALUES (1,56);
INSERT INTO `sys_role_menu` VALUES (1,57);
INSERT INTO `sys_role_menu` VALUES (1,58);
INSERT INTO `sys_role_menu` VALUES (1,59);
INSERT INTO `sys_role_menu` VALUES (1,60);
INSERT INTO `sys_role_menu` VALUES (1,61);
INSERT INTO `sys_role_menu` VALUES (1,62);
INSERT INTO `sys_role_menu` VALUES (1,63);
INSERT INTO `sys_role_menu` VALUES (1,64);
INSERT INTO `sys_role_menu` VALUES (1,65);
INSERT INTO `sys_role_menu` VALUES (1,66);
INSERT INTO `sys_role_menu` VALUES (1,67);
INSERT INTO `sys_role_menu` VALUES (1,68);
INSERT INTO `sys_role_menu` VALUES (1,69);
INSERT INTO `sys_role_menu` VALUES (1,70);
INSERT INTO `sys_role_menu` VALUES (1,71);
INSERT INTO `sys_role_menu` VALUES (1,72);
INSERT INTO `sys_role_menu` VALUES (1,73);
INSERT INTO `sys_role_menu` VALUES (1,74);
INSERT INTO `sys_role_menu` VALUES (1,75);
INSERT INTO `sys_role_menu` VALUES (1,76);
INSERT INTO `sys_role_menu` VALUES (1,77);
INSERT INTO `sys_role_menu` VALUES (1,78);
INSERT INTO `sys_role_menu` VALUES (1,79);
INSERT INTO `sys_role_menu` VALUES (1,80);
INSERT INTO `sys_role_menu` VALUES (1,81);
INSERT INTO `sys_role_menu` VALUES (1,82);
INSERT INTO `sys_role_menu` VALUES (1,83);
INSERT INTO `sys_role_menu` VALUES (1,84);
INSERT INTO `sys_role_menu` VALUES (1,85);
INSERT INTO `sys_role_menu` VALUES (1,86);
INSERT INTO `sys_role_menu` VALUES (1,87);
INSERT INTO `sys_role_menu` VALUES (1,88);
INSERT INTO `sys_role_menu` VALUES (1,89);
INSERT INTO `sys_role_menu` VALUES (1,90);
INSERT INTO `sys_role_menu` VALUES (2,1);
INSERT INTO `sys_role_menu` VALUES (2,2);
INSERT INTO `sys_role_menu` VALUES (2,3);
INSERT INTO `sys_role_menu` VALUES (2,4);
INSERT INTO `sys_role_menu` VALUES (2,5);
INSERT INTO `sys_role_menu` VALUES (2,6);
INSERT INTO `sys_role_menu` VALUES (2,7);
INSERT INTO `sys_role_menu` VALUES (2,8);
INSERT INTO `sys_role_menu` VALUES (2,9);
INSERT INTO `sys_role_menu` VALUES (2,10);
INSERT INTO `sys_role_menu` VALUES (2,11);
INSERT INTO `sys_role_menu` VALUES (2,12);
INSERT INTO `sys_role_menu` VALUES (2,13);
INSERT INTO `sys_role_menu` VALUES (2,14);
INSERT INTO `sys_role_menu` VALUES (2,15);
INSERT INTO `sys_role_menu` VALUES (2,16);
INSERT INTO `sys_role_menu` VALUES (2,17);
INSERT INTO `sys_role_menu` VALUES (2,18);
INSERT INTO `sys_role_menu` VALUES (2,19);
INSERT INTO `sys_role_menu` VALUES (2,20);
INSERT INTO `sys_role_menu` VALUES (2,21);
INSERT INTO `sys_role_menu` VALUES (2,22);
INSERT INTO `sys_role_menu` VALUES (2,23);
INSERT INTO `sys_role_menu` VALUES (2,24);
INSERT INTO `sys_role_menu` VALUES (2,25);
INSERT INTO `sys_role_menu` VALUES (2,26);
INSERT INTO `sys_role_menu` VALUES (2,27);
INSERT INTO `sys_role_menu` VALUES (2,28);
INSERT INTO `sys_role_menu` VALUES (2,29);
INSERT INTO `sys_role_menu` VALUES (2,30);
INSERT INTO `sys_role_menu` VALUES (2,31);
INSERT INTO `sys_role_menu` VALUES (2,32);
INSERT INTO `sys_role_menu` VALUES (2,33);
INSERT INTO `sys_role_menu` VALUES (2,34);
INSERT INTO `sys_role_menu` VALUES (2,35);
INSERT INTO `sys_role_menu` VALUES (2,36);
INSERT INTO `sys_role_menu` VALUES (2,37);
INSERT INTO `sys_role_menu` VALUES (2,38);
INSERT INTO `sys_role_menu` VALUES (2,39);
INSERT INTO `sys_role_menu` VALUES (2,40);
INSERT INTO `sys_role_menu` VALUES (2,41);
INSERT INTO `sys_role_menu` VALUES (2,42);
INSERT INTO `sys_role_menu` VALUES (2,43);
INSERT INTO `sys_role_menu` VALUES (2,44);
INSERT INTO `sys_role_menu` VALUES (2,45);
INSERT INTO `sys_role_menu` VALUES (2,46);
INSERT INTO `sys_role_menu` VALUES (2,47);
INSERT INTO `sys_role_menu` VALUES (2,48);
INSERT INTO `sys_role_menu` VALUES (2,49);
INSERT INTO `sys_role_menu` VALUES (2,50);
INSERT INTO `sys_role_menu` VALUES (2,51);
INSERT INTO `sys_role_menu` VALUES (2,52);
INSERT INTO `sys_role_menu` VALUES (2,53);
INSERT INTO `sys_role_menu` VALUES (2,54);
INSERT INTO `sys_role_menu` VALUES (2,55);
INSERT INTO `sys_role_menu` VALUES (2,56);
INSERT INTO `sys_role_menu` VALUES (2,57);
INSERT INTO `sys_role_menu` VALUES (2,58);
INSERT INTO `sys_role_menu` VALUES (2,59);
INSERT INTO `sys_role_menu` VALUES (2,60);
INSERT INTO `sys_role_menu` VALUES (2,61);
INSERT INTO `sys_role_menu` VALUES (2,62);
INSERT INTO `sys_role_menu` VALUES (2,63);
INSERT INTO `sys_role_menu` VALUES (2,64);
INSERT INTO `sys_role_menu` VALUES (2,65);
INSERT INTO `sys_role_menu` VALUES (2,66);
INSERT INTO `sys_role_menu` VALUES (2,67);
INSERT INTO `sys_role_menu` VALUES (2,68);
INSERT INTO `sys_role_menu` VALUES (2,69);
INSERT INTO `sys_role_menu` VALUES (2,70);
INSERT INTO `sys_role_menu` VALUES (2,71);
INSERT INTO `sys_role_menu` VALUES (2,72);
INSERT INTO `sys_role_menu` VALUES (2,73);
INSERT INTO `sys_role_menu` VALUES (2,74);
INSERT INTO `sys_role_menu` VALUES (2,75);
INSERT INTO `sys_role_menu` VALUES (2,76);
INSERT INTO `sys_role_menu` VALUES (2,77);
INSERT INTO `sys_role_menu` VALUES (2,78);
INSERT INTO `sys_role_menu` VALUES (2,79);
INSERT INTO `sys_role_menu` VALUES (2,80);
INSERT INTO `sys_role_menu` VALUES (2,81);
INSERT INTO `sys_role_menu` VALUES (2,82);
INSERT INTO `sys_role_menu` VALUES (2,83);
INSERT INTO `sys_role_menu` VALUES (2,84);
INSERT INTO `sys_role_menu` VALUES (2,85);
INSERT INTO `sys_role_menu` VALUES (2,86);
INSERT INTO `sys_role_menu` VALUES (2,87);
INSERT INTO `sys_role_menu` VALUES (2,88);
INSERT INTO `sys_role_menu` VALUES (2,89);
INSERT INTO `sys_role_menu` VALUES (2,90);
INSERT INTO `sys_role_menu` VALUES (3,1);
INSERT INTO `sys_role_menu` VALUES (3,2);
INSERT INTO `sys_role_menu` VALUES (3,3);
INSERT INTO `sys_role_menu` VALUES (3,4);
INSERT INTO `sys_role_menu` VALUES (3,5);
INSERT INTO `sys_role_menu` VALUES (3,6);
INSERT INTO `sys_role_menu` VALUES (3,7);
INSERT INTO `sys_role_menu` VALUES (3,8);
INSERT INTO `sys_role_menu` VALUES (3,9);
INSERT INTO `sys_role_menu` VALUES (3,10);
INSERT INTO `sys_role_menu` VALUES (3,11);
INSERT INTO `sys_role_menu` VALUES (3,12);
INSERT INTO `sys_role_menu` VALUES (3,13);
INSERT INTO `sys_role_menu` VALUES (3,14);
INSERT INTO `sys_role_menu` VALUES (3,15);
INSERT INTO `sys_role_menu` VALUES (3,16);
INSERT INTO `sys_role_menu` VALUES (3,17);
INSERT INTO `sys_role_menu` VALUES (3,18);
INSERT INTO `sys_role_menu` VALUES (3,19);
INSERT INTO `sys_role_menu` VALUES (3,20);
INSERT INTO `sys_role_menu` VALUES (3,21);
INSERT INTO `sys_role_menu` VALUES (3,22);
INSERT INTO `sys_role_menu` VALUES (3,23);
INSERT INTO `sys_role_menu` VALUES (3,24);
INSERT INTO `sys_role_menu` VALUES (3,25);
INSERT INTO `sys_role_menu` VALUES (3,26);
INSERT INTO `sys_role_menu` VALUES (3,27);
INSERT INTO `sys_role_menu` VALUES (3,28);
INSERT INTO `sys_role_menu` VALUES (3,29);
INSERT INTO `sys_role_menu` VALUES (3,30);
INSERT INTO `sys_role_menu` VALUES (3,31);
INSERT INTO `sys_role_menu` VALUES (3,32);
INSERT INTO `sys_role_menu` VALUES (3,33);
INSERT INTO `sys_role_menu` VALUES (3,34);
INSERT INTO `sys_role_menu` VALUES (3,35);
INSERT INTO `sys_role_menu` VALUES (3,36);
INSERT INTO `sys_role_menu` VALUES (3,37);
INSERT INTO `sys_role_menu` VALUES (3,38);
INSERT INTO `sys_role_menu` VALUES (3,39);
INSERT INTO `sys_role_menu` VALUES (3,40);
INSERT INTO `sys_role_menu` VALUES (3,41);
INSERT INTO `sys_role_menu` VALUES (3,42);
INSERT INTO `sys_role_menu` VALUES (3,43);
INSERT INTO `sys_role_menu` VALUES (3,44);
INSERT INTO `sys_role_menu` VALUES (3,45);
INSERT INTO `sys_role_menu` VALUES (3,46);
INSERT INTO `sys_role_menu` VALUES (3,47);
INSERT INTO `sys_role_menu` VALUES (3,48);
INSERT INTO `sys_role_menu` VALUES (3,49);
INSERT INTO `sys_role_menu` VALUES (3,50);
INSERT INTO `sys_role_menu` VALUES (3,51);
INSERT INTO `sys_role_menu` VALUES (3,52);
INSERT INTO `sys_role_menu` VALUES (3,53);
INSERT INTO `sys_role_menu` VALUES (3,54);
INSERT INTO `sys_role_menu` VALUES (3,55);
INSERT INTO `sys_role_menu` VALUES (3,56);
INSERT INTO `sys_role_menu` VALUES (3,57);
INSERT INTO `sys_role_menu` VALUES (3,58);
INSERT INTO `sys_role_menu` VALUES (3,59);
INSERT INTO `sys_role_menu` VALUES (3,60);
INSERT INTO `sys_role_menu` VALUES (3,61);
INSERT INTO `sys_role_menu` VALUES (3,62);
INSERT INTO `sys_role_menu` VALUES (3,63);
INSERT INTO `sys_role_menu` VALUES (3,64);
INSERT INTO `sys_role_menu` VALUES (3,65);
INSERT INTO `sys_role_menu` VALUES (3,66);
INSERT INTO `sys_role_menu` VALUES (3,67);
INSERT INTO `sys_role_menu` VALUES (3,68);
INSERT INTO `sys_role_menu` VALUES (3,69);
INSERT INTO `sys_role_menu` VALUES (3,70);
INSERT INTO `sys_role_menu` VALUES (3,71);
INSERT INTO `sys_role_menu` VALUES (3,72);
INSERT INTO `sys_role_menu` VALUES (3,73);
INSERT INTO `sys_role_menu` VALUES (3,74);
INSERT INTO `sys_role_menu` VALUES (3,75);
INSERT INTO `sys_role_menu` VALUES (3,76);
INSERT INTO `sys_role_menu` VALUES (3,77);
INSERT INTO `sys_role_menu` VALUES (3,78);
INSERT INTO `sys_role_menu` VALUES (3,79);
INSERT INTO `sys_role_menu` VALUES (3,80);
INSERT INTO `sys_role_menu` VALUES (3,81);
INSERT INTO `sys_role_menu` VALUES (3,82);
INSERT INTO `sys_role_menu` VALUES (3,83);
INSERT INTO `sys_role_menu` VALUES (3,84);
INSERT INTO `sys_role_menu` VALUES (3,85);
INSERT INTO `sys_role_menu` VALUES (3,86);
INSERT INTO `sys_role_menu` VALUES (3,87);
INSERT INTO `sys_role_menu` VALUES (3,88);
INSERT INTO `sys_role_menu` VALUES (3,89);
INSERT INTO `sys_role_menu` VALUES (3,90);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table sys_role_office
#

DROP TABLE IF EXISTS `sys_role_office`;
CREATE TABLE `sys_role_office` (
  `role_id` double(53,0) DEFAULT NULL,
  `office_id` double(53,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table sys_role_office
#
LOCK TABLES `sys_role_office` WRITE;
/*!40000 ALTER TABLE `sys_role_office` DISABLE KEYS */;

INSERT INTO `sys_role_office` VALUES (7,7);
INSERT INTO `sys_role_office` VALUES (7,8);
INSERT INTO `sys_role_office` VALUES (7,9);
INSERT INTO `sys_role_office` VALUES (7,10);
INSERT INTO `sys_role_office` VALUES (7,11);
INSERT INTO `sys_role_office` VALUES (7,12);
INSERT INTO `sys_role_office` VALUES (7,13);
INSERT INTO `sys_role_office` VALUES (7,14);
INSERT INTO `sys_role_office` VALUES (7,15);
INSERT INTO `sys_role_office` VALUES (7,16);
INSERT INTO `sys_role_office` VALUES (7,17);
INSERT INTO `sys_role_office` VALUES (7,18);
INSERT INTO `sys_role_office` VALUES (7,19);
INSERT INTO `sys_role_office` VALUES (7,20);
INSERT INTO `sys_role_office` VALUES (7,21);
INSERT INTO `sys_role_office` VALUES (7,22);
INSERT INTO `sys_role_office` VALUES (7,23);
INSERT INTO `sys_role_office` VALUES (7,24);
INSERT INTO `sys_role_office` VALUES (7,25);
INSERT INTO `sys_role_office` VALUES (7,26);
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

INSERT INTO `sys_user` VALUES ('1','1','2','admin','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0001','系统管理员','','8675','8675',NULL,'最高管理员',1,'1','2013-05-27','1','2013-05-27',0,'127.0.0.1','2015-07-02 23:55:56',NULL);
INSERT INTO `sys_user` VALUES ('3','1','3','sd_zhb','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0003','综合部',NULL,NULL,NULL,NULL,NULL,1,'1','2013-05-27','1','2013-05-27',0,NULL,NULL,NULL);
INSERT INTO `sys_user` VALUES ('4','1','4','sd_scb','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0004','市场部',NULL,NULL,NULL,NULL,NULL,1,'1','2013-05-27','1','2013-05-27',0,NULL,NULL,NULL);
INSERT INTO `sys_user` VALUES ('5','1','5','sd_jsb','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0005','技术部',NULL,NULL,NULL,NULL,NULL,1,'1','2013-05-27','1','2013-05-27',0,NULL,NULL,NULL);
INSERT INTO `sys_user` VALUES ('6','1','6','sd_yfb','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0006','研发部',NULL,NULL,NULL,NULL,NULL,1,'1','2013-05-27','1','2013-05-27',0,NULL,NULL,NULL);
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

INSERT INTO `sys_user_role` VALUES ('1','1');
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
INSERT INTO `sys_user_role` VALUES ('1','2');
INSERT INTO `sys_user_role` VALUES ('7','2');
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
