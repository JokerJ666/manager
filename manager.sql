/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 80015
Source Host           : localhost:3306
Source Database       : manager

Target Server Type    : MYSQL
Target Server Version : 80015
File Encoding         : 65001

Date: 2019-09-12 23:32:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `companyName` varchar(50) NOT NULL,
  `companyCreditCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createDate` datetime DEFAULT NULL,
  `address` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `managerPhone` varchar(11) DEFAULT NULL,
  `managerName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `workday` varchar(20) DEFAULT '',
  `beginTime` varchar(17) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `endTime` varchar(17) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `maintainNum` int(11) DEFAULT NULL,
  `remainingTime` date DEFAULT NULL,
  PRIMARY KEY (`id`,`companyCreditCode`),
  UNIQUE KEY `companyCreditCode` (`companyCreditCode`),
  KEY `companyName` (`companyName`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES ('1', '中国移动公司', 'SACXASDAS12315151Z', '2019-07-04 19:07:17', '上海', '12345678910', '自行车', '0,1,6', '00:50,00:05,21:00', '00:12,00:04,04:00', '8', '2019-11-14');
INSERT INTO `company` VALUES ('2', '阿里巴巴', 'ASDA1561A15ACZX121', '2019-07-10 19:07:24', '贵州', '16515165112', '阿萨伟', '1,2,3,4,5', null, null, null, null);
INSERT INTO `company` VALUES ('3', '中国石油公司', 'ADAFZXC8464GWEGZCZ', '2019-07-03 12:53:03', '火狐', '12212313531', 'c才是我', '', null, null, null, null);
INSERT INTO `company` VALUES ('5', '自行车公司', 'zxczcsafafagagcvsf', '2019-09-07 22:54:27', 'vcj', '23154345343', '123', '', null, null, null, null);
INSERT INTO `company` VALUES ('6', '撒旦威公司', 'iuouooyukjkghjhgjg', '2019-09-11 22:54:49', 'ytty', '68545345646', '54', '', null, null, null, null);
INSERT INTO `company` VALUES ('7', '新知错公司', 'tiytyiytjghjghjjrj', '2019-09-06 22:55:09', 'vvds', '53534345345', '66', '', null, null, null, null);
INSERT INTO `company` VALUES ('8', '给对方公司', 'qweqdggruiuiqwqw', '2019-09-11 23:20:52', 'jkhk', '54651351646', '11', '', null, null, null, null);
INSERT INTO `company` VALUES ('10', '无公司', 'Zsadasda121zx3czc', '2019-09-02 14:48:47', '广州市', '15016323910', 'asda', '', null, null, null, null);
INSERT INTO `company` VALUES ('11', '在线公司', 'Zsadsdas1313z1', '2019-09-02 14:52:32', '广州市', '15016323111', 'xzc', '', null, null, null, null);
INSERT INTO `company` VALUES ('13', '无a公司', 'Zsadsdas1313z2', '2019-09-02 14:53:41', '广州市', '15016321564', '中心城中心', '', null, null, null, null);
INSERT INTO `company` VALUES ('14', '无拍公司', 'ZXCZXCSADADAASD', '2019-09-02 14:59:49', '广州市', '15015615151', 'zxczx', '', null, null, null, null);
INSERT INTO `company` VALUES ('15', '无去在线公司', 'ZXCASASDASAF', '2019-09-02 15:00:42', '广州市', '150123123', 'cxc', '', null, null, null, null);
INSERT INTO `company` VALUES ('18', '公司在', 'ZCSAASASD12313212313', '2019-09-02 16:11:23', '广州市', '11111111111', '12', '', null, null, null, null);
INSERT INTO `company` VALUES ('21', '测试', 'zxcz321cz23c1xz3', '2019-09-08 21:58:01', '广州', '15011111111', '周星驰', '', '00:00,00:00,00:00', '00:00,00:00,00:00', null, null);

-- ----------------------------
-- Table structure for loginwithphonelog
-- ----------------------------
DROP TABLE IF EXISTS `loginwithphonelog`;
CREATE TABLE `loginwithphonelog` (
  `userId` int(11) NOT NULL,
  `loginDate` datetime NOT NULL,
  `loginType` enum('登出','登入') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(18) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `belong` varchar(20) DEFAULT NULL,
  `uName` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  KEY `id` (`userId`) USING BTREE,
  CONSTRAINT `id` FOREIGN KEY (`userId`) REFERENCES `phonemanager` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of loginwithphonelog
-- ----------------------------
INSERT INTO `loginwithphonelog` VALUES ('1', '2019-08-01 17:07:22', '登入', 'ak', '12354', '123121', null);
INSERT INTO `loginwithphonelog` VALUES ('1', '2019-08-02 17:09:40', '登出', null, null, null, null);
INSERT INTO `loginwithphonelog` VALUES ('1', '2019-08-13 17:09:51', '登入', null, null, null, null);
INSERT INTO `loginwithphonelog` VALUES ('1', '2019-08-17 22:09:08', '登出', null, null, null, null);
INSERT INTO `loginwithphonelog` VALUES ('1', '2019-08-07 22:09:16', '登入', null, null, null, null);
INSERT INTO `loginwithphonelog` VALUES ('1', '2019-08-12 22:09:24', '登出', null, null, null, null);
INSERT INTO `loginwithphonelog` VALUES ('2', '2019-09-06 14:22:05', '登出', '855', '166666874', 'gongsi', null);
INSERT INTO `loginwithphonelog` VALUES ('2', '2019-09-06 14:27:43', '登入', '855', '166666874', 'gongsi', null);
INSERT INTO `loginwithphonelog` VALUES ('2', '2019-09-06 14:29:17', '登入', '855', '166666874', 'gongsi', null);
INSERT INTO `loginwithphonelog` VALUES ('2', '2019-09-06 16:14:00', '登入', '855', '166666874', 'gongsi', null);
INSERT INTO `loginwithphonelog` VALUES ('2', '2019-09-06 16:17:07', '登入', '855', '166666874', 'gongsi', null);
INSERT INTO `loginwithphonelog` VALUES ('2', '2019-09-06 16:17:46', '登入', '855', '166666874', 'gongsi', null);
INSERT INTO `loginwithphonelog` VALUES ('2', '2019-09-06 16:19:37', '登入', '855', '166666874', 'gongsi', null);
INSERT INTO `loginwithphonelog` VALUES ('2', '2019-09-06 16:28:31', '登入', '855', '166666874', 'gongsi', null);
INSERT INTO `loginwithphonelog` VALUES ('2', '2019-09-06 00:00:00', '登入', '855', '166666874', 'gongsi', null);
INSERT INTO `loginwithphonelog` VALUES ('2', '2019-09-06 16:47:07', '登入', '855', '166666874', 'gongsi', null);
INSERT INTO `loginwithphonelog` VALUES ('2', '2019-09-06 16:49:15', '登入', '855', '166666874', 'gongsi', null);
INSERT INTO `loginwithphonelog` VALUES ('2', '2019-09-06 16:51:34', '登入', '855', '166666874', 'gongsi', null);
INSERT INTO `loginwithphonelog` VALUES ('2', '2019-09-06 16:52:45', '登入', '855', '166666874', 'gongsi', null);
INSERT INTO `loginwithphonelog` VALUES ('2', '2019-09-06 16:53:52', '登出', '855', '166666874', 'gongsi', null);
INSERT INTO `loginwithphonelog` VALUES ('20', '2019-09-08 21:59:41', '登入', '测试1', null, '一号店', '名字');
INSERT INTO `loginwithphonelog` VALUES ('20', '2019-09-08 22:00:14', '登入', '测试1', null, '一号店', '名字');
INSERT INTO `loginwithphonelog` VALUES ('20', '2019-09-08 22:01:12', '登入', '测试1', null, '一号店', '名字');
INSERT INTO `loginwithphonelog` VALUES ('20', '2019-09-08 22:02:18', '登入', '测试1', null, '一号店', '名字');
INSERT INTO `loginwithphonelog` VALUES ('20', '2019-09-08 22:41:28', '登入', '老王', '150111111', '一号店', '测试');
INSERT INTO `loginwithphonelog` VALUES ('20', '2019-09-08 22:41:51', '登入', '老王', '150111111', '一号店', '测试');
INSERT INTO `loginwithphonelog` VALUES ('20', '2019-09-08 22:42:20', '登出', '老王', '150111111', '一号店', '测试');
INSERT INTO `loginwithphonelog` VALUES ('20', '2019-09-08 22:42:34', '登出', '老王', '150111111', '一号店', '测试');
INSERT INTO `loginwithphonelog` VALUES ('20', '2019-09-08 22:43:08', '登出', '老王', '150111111', '一号店', '测试');
INSERT INTO `loginwithphonelog` VALUES ('20', '2019-09-08 22:43:19', '登出', '老王', '150111111', '一号店', '测试');
INSERT INTO `loginwithphonelog` VALUES ('20', '2019-09-08 22:44:30', '登出', '老王', '150111111', '一号店', '测试');
INSERT INTO `loginwithphonelog` VALUES ('20', '2019-09-10 23:36:56', '登入', 'zhang', '123456', '公司', '测试');
INSERT INTO `loginwithphonelog` VALUES ('20', '2019-09-10 23:37:12', '登入', 'zhang', '123456', '公司', '测试');
INSERT INTO `loginwithphonelog` VALUES ('20', '2019-09-10 23:38:02', '登出', 'zhang', '123456', '公司', '测试');
INSERT INTO `loginwithphonelog` VALUES ('20', '2019-09-10 23:38:51', '登出', 'zhang', '123456', '公司', '测试');
INSERT INTO `loginwithphonelog` VALUES ('20', '2019-09-10 23:39:22', '登出', 'zhang', '123456', '公司', '测试');

-- ----------------------------
-- Table structure for phoneadmin
-- ----------------------------
DROP TABLE IF EXISTS `phoneadmin`;
CREATE TABLE `phoneadmin` (
  `username` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `companyId` int(11) NOT NULL,
  PRIMARY KEY (`username`),
  KEY `companyId` (`companyId`),
  CONSTRAINT `phoneadmin_ibfk_1` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of phoneadmin
-- ----------------------------
INSERT INTO `phoneadmin` VALUES ('123', '1');
INSERT INTO `phoneadmin` VALUES ('124124', '1');
INSERT INTO `phoneadmin` VALUES ('15231', '1');
INSERT INTO `phoneadmin` VALUES ('456', '1');
INSERT INTO `phoneadmin` VALUES ('789', '1');

-- ----------------------------
-- Table structure for phonemanager
-- ----------------------------
DROP TABLE IF EXISTS `phonemanager`;
CREATE TABLE `phonemanager` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `userKey` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '串号 密钥',
  `createDate` datetime NOT NULL COMMENT '创建时间',
  `companyId` int(11) NOT NULL,
  `state` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '0为离线  1为在线',
  `note` varchar(255) DEFAULT NULL,
  `lastLoginTime` varchar(8) DEFAULT NULL,
  `permission` enum('正常','冻结') NOT NULL DEFAULT '正常',
  PRIMARY KEY (`id`,`companyId`),
  UNIQUE KEY `phone` (`userKey`),
  KEY `id` (`id`),
  KEY `companyId` (`companyId`),
  CONSTRAINT `phonemanager_ibfk_1` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of phonemanager
-- ----------------------------
INSERT INTO `phonemanager` VALUES ('1', '12322211', '2019-08-01 18:10:26', '1', '0', 'xvxc', null, '正常');
INSERT INTO `phonemanager` VALUES ('2', '1001110', '2019-08-16 18:10:40', '1', '0', '测试', '00:53', '正常');
INSERT INTO `phonemanager` VALUES ('3', '111', '2019-08-03 01:51:06', '1', '0', null, null, '冻结');
INSERT INTO `phonemanager` VALUES ('4', '122', '2019-08-09 01:51:27', '2', '0', null, null, '正常');
INSERT INTO `phonemanager` VALUES ('5', '16661', '2019-08-08 01:51:43', '2', '0', null, '11:30', '正常');
INSERT INTO `phonemanager` VALUES ('6', '123456', '2019-08-29 21:08:52', '2', '0', null, null, '正常');
INSERT INTO `phonemanager` VALUES ('7', '1214', '2019-08-28 15:25:15', '1', '0', null, null, '冻结');
INSERT INTO `phonemanager` VALUES ('8', '1333', '2019-08-30 15:25:44', '1', '0', null, '11:19', '正常');
INSERT INTO `phonemanager` VALUES ('10', '1777', '2019-08-30 15:26:20', '1', '0', null, null, '正常');
INSERT INTO `phonemanager` VALUES ('12', 'zxczc', '2019-09-02 15:21:05', '1', '0', 'zczxc', '11:33', '正常');
INSERT INTO `phonemanager` VALUES ('14', 'fzxc,zxc', '2019-09-03 09:54:25', '1', '0', null, null, '正常');
INSERT INTO `phonemanager` VALUES ('18', 'zxczxc', '2019-09-07 02:29:52', '1', '0', 'zxzasd', null, '正常');
INSERT INTO `phonemanager` VALUES ('19', 'bfdb', '2019-09-07 02:30:04', '1', '0', 'adf', null, '正常');
INSERT INTO `phonemanager` VALUES ('20', '789456', '2019-09-08 21:58:41', '21', '1', '123', '23:39', '正常');
INSERT INTO `phonemanager` VALUES ('21', 'ghjgh', '2019-09-12 13:37:51', '1', '0', 'bnmb', null, '正常');
INSERT INTO `phonemanager` VALUES ('22', 'reyey', '2019-09-12 13:40:52', '1', '0', 'fdg', null, '正常');
INSERT INTO `phonemanager` VALUES ('23', 'asd', '2019-09-12 14:00:15', '1', '0', '好地方', null, '正常');
INSERT INTO `phonemanager` VALUES ('24', 'zxczx', '2019-09-12 14:06:02', '1', '0', '周星驰', null, '正常');
INSERT INTO `phonemanager` VALUES ('25', 'zxc', '2019-09-12 14:06:46', '1', '0', '发送', null, '正常');
INSERT INTO `phonemanager` VALUES ('27', 'zczxc', '2019-09-12 14:11:16', '1', '0', 'zxczc', null, '正常');
INSERT INTO `phonemanager` VALUES ('28', 'zxccxbxc', '2019-09-12 15:18:23', '1', '0', 'zxcz', null, '正常');
INSERT INTO `phonemanager` VALUES ('29', 'ncvnc', '2019-09-12 15:18:36', '1', '0', 'cvncv', null, '正常');
INSERT INTO `phonemanager` VALUES ('30', 'yjgjh', '2019-09-12 15:18:40', '1', '0', 'hjghjg', null, '正常');

-- ----------------------------
-- Table structure for systemuser
-- ----------------------------
DROP TABLE IF EXISTS `systemuser`;
CREATE TABLE `systemuser` (
  `id` int(11) NOT NULL,
  `username` varchar(16) NOT NULL,
  `password` varchar(16) NOT NULL,
  `name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of systemuser
-- ----------------------------
INSERT INTO `systemuser` VALUES ('1', 'admin', '1', 'zczxc');
INSERT INTO `systemuser` VALUES ('2', 'root', '1', 'sdfsf');
