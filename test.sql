/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50022
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50022
File Encoding         : 65001

Date: 2012-11-29 10:09:08
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `lists`
-- ----------------------------
DROP TABLE IF EXISTS `lists`;
CREATE TABLE `lists` (
  `ID` int(100) NOT NULL auto_increment,
  `NAME` varchar(100) character set utf8 default NULL,
  `PRICE` float(100,0) default NULL,
  `TIME` varchar(100) character set utf8 default NULL,
  `IMG` varchar(100) character set utf8 default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of lists
-- ----------------------------
INSERT INTO `lists` VALUES ('1', '333', '3', '2012-11-28 04:33:01', '1354091581390');
INSERT INTO `lists` VALUES ('3', '222', '200', '2012-11-28 04:33:47', '1354091627171');
INSERT INTO `lists` VALUES ('4', '神无昆桥', '10000', '2012-10-24 11:23:06', '1351048986097');
INSERT INTO `lists` VALUES ('5', '123', '321312', '2012-10-24 09:39:58', '1351042798615');
INSERT INTO `lists` VALUES ('6', '美女', '100', '2012-10-24 09:54:21', '1351043661759');
INSERT INTO `lists` VALUES ('7', '婚纱照', '4700', '2012-10-24 10:30:20', '1351045820947');
INSERT INTO `lists` VALUES ('8', '郝佳佳', '200', '2012-10-24 10:31:31', '1351045891352');
INSERT INTO `lists` VALUES ('9', '郝佳佳', '200', '2012-10-24 10:56:14', '1351047374513');
INSERT INTO `lists` VALUES ('10', '新娘子', '100', '2012-10-24 10:56:30', '1351047390744');
INSERT INTO `lists` VALUES ('13', '12', '231', '2012-10-24 11:03:48', '1351047828941');

-- ----------------------------
-- Table structure for `ny_list`
-- ----------------------------
DROP TABLE IF EXISTS `ny_list`;
CREATE TABLE `ny_list` (
  `fid` int(8) NOT NULL auto_increment,
  `name` char(32) NOT NULL,
  `rzzz` char(20) NOT NULL,
  `rzjg` char(32) NOT NULL,
  `address` char(14) NOT NULL,
  `shop` tinyint(1) unsigned NOT NULL,
  `pic` int(10) NOT NULL,
  `ok` tinyint(1) unsigned NOT NULL default '1',
  PRIMARY KEY  (`fid`),
  KEY `name` (`name`),
  KEY `address` (`address`),
  KEY `ok` (`ok`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- ----------------------------
-- Records of ny_list
-- ----------------------------
INSERT INTO `ny_list` VALUES ('1', '1NIWO有限公司', '1有机种植', '1三合木有限公司', '吉林吉林市', '14', '1351106230', '1');
INSERT INTO `ny_list` VALUES ('2', '2NIWO有限公司', '2有机种植', '2三合木有限公司', '吉林吉林市', '24', '1351106230', '1');
INSERT INTO `ny_list` VALUES ('3', '3NIWO有限公司', '3有机种植', '3三合木有限公司', '吉林吉林市', '34', '1351106230', '1');
INSERT INTO `ny_list` VALUES ('4', '4NIWO有限公司', '4有机种植', '4三合木有限公司', '吉林吉林市', '44', '1351106230', '1');
INSERT INTO `ny_list` VALUES ('5', '5NIWO有限公司', '5有机种植', '5三合木有限公司', '吉林吉林市', '54', '1351106230', '1');
INSERT INTO `ny_list` VALUES ('6', '6NIWO有限公司', '6有机种植', '6三合木有限公司', '吉林吉林市', '64', '1351106230', '1');
INSERT INTO `ny_list` VALUES ('7', '7NIWO有限公司', '7有机种植', '7三合木有限公司', '吉林吉林市', '74', '1351106230', '1');
INSERT INTO `ny_list` VALUES ('8', '8NIWO有限公司', '8有机种植', '8三合木有限公司', '吉林吉林市', '84', '1351106230', '1');
INSERT INTO `ny_list` VALUES ('9', '9NIWO有限公司', '9有机种植', '9三合木有限公司', '吉林吉林市', '94', '1351106230', '1');
INSERT INTO `ny_list` VALUES ('10', '10NIWO有限公司', '10有机种植', '10三合木有限公司', '吉林吉林市', '104', '1351106230', '1');
INSERT INTO `ny_list` VALUES ('11', '11NIWO有限公司', '11有机种植', '11三合木有限公司', '吉林吉林市', '114', '1351106230', '1');
INSERT INTO `ny_list` VALUES ('12', '12NIWO有限公司', '12有机种植', '12三合木有限公司', '吉林吉林市', '124', '1351106230', '1');
INSERT INTO `ny_list` VALUES ('13', '13NIWO有限公司', '13有机种植', '13三合木有限公司', '吉林吉林市', '134', '1351106230', '1');
INSERT INTO `ny_list` VALUES ('14', '14NIWO有限公司', '14有机种植', '14三合木有限公司', '吉林吉林市', '144', '1351106230', '1');
INSERT INTO `ny_list` VALUES ('15', '15NIWO有限公司', '15有机种植', '15三合木有限公司', '吉林吉林市', '154', '1351106230', '1');
INSERT INTO `ny_list` VALUES ('16', '16NIWO有限公司', '16有机种植', '16三合木有限公司', '吉林吉林市', '164', '1351106230', '1');
INSERT INTO `ny_list` VALUES ('17', '17NIWO有限公司', '17有机种植', '17三合木有限公司', '安徽滁州市', '174', '1351223449', '1');
INSERT INTO `ny_list` VALUES ('18', '18NIWO有限公司', '18有机种植', '18三合木有限公司', '安徽滁州市', '184', '1351219640', '1');
INSERT INTO `ny_list` VALUES ('19', '19NIWO有限公司', '19有机种植', '19三合木有限公司', '安徽滁州市', '194', '1351219553', '1');
INSERT INTO `ny_list` VALUES ('20', '20NIWO有限公司', '20有机种植', '20三合木有限公司', '安徽滁州市', '204', '1351219504', '1');
INSERT INTO `ny_list` VALUES ('21', '21NIWO有限公司', '21有机种植', '21三合木有限公司', '安徽滁州市', '214', '1351219204', '1');
INSERT INTO `ny_list` VALUES ('22', '22NIWO有限公司', '22有机种植', '22三合木有限公司', '安徽滁州市', '224', '1351219153', '1');
INSERT INTO `ny_list` VALUES ('23', '23NIWO有限公司', '23有机种植', '23三合木有限公司', '安徽滁州市', '234', '1351219117', '1');
INSERT INTO `ny_list` VALUES ('24', '24NIWO有限公司', '24有机种植', '24三合木有限公司', '安徽滁州市', '244', '1351218873', '1');
INSERT INTO `ny_list` VALUES ('25', '25NIWO有限公司', '25有机种植', '25三合木有限公司', '安徽滁州市', '254', '1351218670', '1');
INSERT INTO `ny_list` VALUES ('26', '山东高盛有限公司', '法国方式大幅', '经验太过分放到的说法', '山东淄博市', '3', '1351211988', '0');
INSERT INTO `ny_list` VALUES ('27', '淄博高盛有限公司', '法国认证的', '第三方的地方答复', '山东淄博市', '3', '1351212934', '1');

-- ----------------------------
-- Table structure for `ny_log`
-- ----------------------------
DROP TABLE IF EXISTS `ny_log`;
CREATE TABLE `ny_log` (
  `lid` mediumint(8) NOT NULL auto_increment,
  `message` mediumtext NOT NULL,
  PRIMARY KEY  (`lid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ny_log
-- ----------------------------
INSERT INTO `ny_log` VALUES ('1', '127.0.0.1在2012年10月26日 8:34 am登陆');
INSERT INTO `ny_log` VALUES ('2', '127.0.0.1在2012年10月26日 8:54 am登陆');
INSERT INTO `ny_log` VALUES ('3', '127.0.0.1在2012年10月26日 10:37 am登陆');
INSERT INTO `ny_log` VALUES ('4', '127.0.0.1在2012年10月26日 10:54 am登陆');
INSERT INTO `ny_log` VALUES ('5', '127.0.0.1在2012年10月26日 10:58 am登陆');
INSERT INTO `ny_log` VALUES ('6', '127.0.0.1在2012年10月26日 11:50 am登陆');
INSERT INTO `ny_log` VALUES ('7', '127.0.0.1在2012年10月26日 11:55 am登陆');
INSERT INTO `ny_log` VALUES ('8', '127.0.0.1在2012年10月26日 11:59 am登陆');
INSERT INTO `ny_log` VALUES ('9', '127.0.0.1在2012年10月26日 12:05 pm登陆');
INSERT INTO `ny_log` VALUES ('10', '127.0.0.1在2012年10月26日 1:20 pm登陆');
INSERT INTO `ny_log` VALUES ('11', '127.0.0.1在2012年10月26日 1:22 pm登陆');

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `ProdId` int(50) NOT NULL auto_increment,
  `ProdName` varchar(50) default NULL,
  `Num` varchar(50) default NULL,
  `Price` varchar(50) default NULL,
  PRIMARY KEY  (`ProdId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '茅台酒', '100瓶', '528元/瓶');
INSERT INTO `product` VALUES ('2', '西红柿炒鸡蛋', '1份', '5元');
INSERT INTO `product` VALUES ('3', '西兰花', '20斤', '3.5元');

-- ----------------------------
-- Table structure for `products`
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(50) NOT NULL auto_increment,
  `name` varchar(100) default NULL,
  `price` varchar(100) default NULL,
  `regist` varchar(100) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of products
-- ----------------------------

-- ----------------------------
-- Table structure for `sdly_pic`
-- ----------------------------
DROP TABLE IF EXISTS `sdly_pic`;
CREATE TABLE `sdly_pic` (
  `ID_SNO` int(50) NOT NULL auto_increment,
  `C_PIC` blob,
  `OC_FLAG` varchar(10) default NULL,
  `OC_YXBZ` varchar(50) default NULL,
  `DT_SCSJ` datetime default NULL,
  `OC_CZY` varchar(50) default NULL,
  PRIMARY KEY  (`ID_SNO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sdly_pic
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(20) default NULL,
  `password` varchar(20) default NULL,
  `md5pwd` varchar(50) default NULL,
  `salt` varchar(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('2', 'admin', 'admin', '43404936e29513ca74bef2716a0146c8', '175665');
INSERT INTO `user` VALUES ('3', 'gaowenhui2008', '123456', '5cb57a2688182b2d99d50547ca8749f8', '44e074');
INSERT INTO `user` VALUES ('4', 'gaowenhui', '831112', '9fc772e972e54ce713de0fa74f909c57', '70e9d3');
INSERT INTO `user` VALUES ('7', '123456', '123456', 'a62bb94cad7e9044e0c9600475b2e824', '050317');
INSERT INTO `user` VALUES ('13', 'gwh_2012', '370323', '763f00be6fcc0d5a619e0c9ec2982530', '080576');
INSERT INTO `user` VALUES ('14', '231', '321', 'ba736523321829706af3122aeac1b16a', '831907');

-- ----------------------------
-- Table structure for `wrox_pending`
-- ----------------------------
DROP TABLE IF EXISTS `wrox_pending`;
CREATE TABLE `wrox_pending` (
  `USER_ID` int(10) unsigned NOT NULL,
  `TOKEN` char(10) collate latin1_general_cs NOT NULL,
  `CREATED_DATE` timestamp NOT NULL default CURRENT_TIMESTAMP,
  KEY `USER_ID` (`USER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;

-- ----------------------------
-- Records of wrox_pending
-- ----------------------------

-- ----------------------------
-- Table structure for `wrox_user`
-- ----------------------------
DROP TABLE IF EXISTS `wrox_user`;
CREATE TABLE `wrox_user` (
  `USER_ID` int(10) unsigned NOT NULL auto_increment,
  `USERNAME` varchar(20) collate latin1_general_cs NOT NULL,
  `PASSWORD` char(40) collate latin1_general_cs NOT NULL,
  `EMAIL_ADDR` varchar(100) collate latin1_general_cs NOT NULL,
  `IS_ACTIVE` tinyint(1) default '0',
  PRIMARY KEY  (`USER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;

-- ----------------------------
-- Records of wrox_user
-- ----------------------------
INSERT INTO `wrox_user` VALUES ('1', '111111', '3d4f2bf07dc1be38b20cd6e46949a1071f9d0e3d', '1@2.com', '1');
