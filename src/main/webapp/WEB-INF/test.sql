/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50626
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2015-11-04 17:47:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` int(11) NOT NULL,
  `enable` tinyint(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `registerTime` datetime NOT NULL,
  `roleId` int(11) DEFAULT NULL,
  `organizationId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_gex1lmaqpg0ir5g1f5eftyaa1` (`username`),
  KEY `IDX_account_roleId` (`roleId`),
  KEY `IDX_account_organizationId` (`organizationId`),
  KEY `FK_account_role` (`roleId`),
  KEY `FK_account_organization` (`organizationId`),
  CONSTRAINT `FK_account_organization` FOREIGN KEY (`organizationId`) REFERENCES `organization` (`id`),
  CONSTRAINT `FK_account_role` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('1', '1', '1', 'MissWhen...', 'liukemng@sina.com', 'liukemng', 'd2e91fd86941f35afe2ca473f9736c1d', '2014-04-02 23:26:40', '1', '1');
INSERT INTO `account` VALUES ('2', '0', '1', 'AAA', '123@123.com', 'AAAA', '9ec0247a3bb48e6368fc77623b519102', '2014-04-03 14:38:38', '2', null);
INSERT INTO `account` VALUES ('3', '0', '0', 'WWWWW', '123@123.com', 'FFFFFF', 'CFBDA3E623045D2C2130D653909397E0', '2014-04-03 14:39:00', null, null);
INSERT INTO `account` VALUES ('4', '0', '0', 'TTTT', '123@123.com', 'SSSDD', '50F86F5725447FE015467D74A7D7DB11', '2014-04-03 14:39:18', null, null);
INSERT INTO `account` VALUES ('5', '0', '0', 'OOOO', '123@123.com', 'LLLL', '1F5297672E6BF686ED906F69DBD9B509', '2014-04-03 14:39:36', null, null);
INSERT INTO `account` VALUES ('6', '0', '0', 'CCCCC', '123@123.com', 'RRRR', 'DDF8448BC7A6BEC245B7293CE4EBDA74', '2014-04-03 14:40:16', null, null);
INSERT INTO `account` VALUES ('7', '0', '0', 'NNNN', '123@123.com', 'MMMM', 'A9C51ACEFD41BB51F1A7546B358BF1BD', '2014-04-03 14:40:32', null, null);
INSERT INTO `account` VALUES ('8', '0', '0', 'ZZZZZ', '123@123.com', 'TTTTTT', '8B5CC63F5053E982AD5EB6A461F69209', '2014-04-03 14:40:49', null, null);
INSERT INTO `account` VALUES ('9', '0', '0', 'KKKKK', '123@123.com', 'PPPPP', '78EB5B2DDCC23A6E13A48AEF3B28C87D', '2014-04-03 14:41:10', null, null);
INSERT INTO `account` VALUES ('10', '0', '0', 'XXXXX', '123@123.com', 'DDDF', 'AF8B0A62C9844F4B4E339230D85ECBE0', '2014-04-03 14:41:49', null, null);
INSERT INTO `account` VALUES ('11', '0', '0', 'RTYV', '123@123.com', 'WWW', 'B04874C43B023CB87F753717D73C4D6D', '2014-04-03 14:42:07', null, null);

-- ----------------------------
-- Table structure for authority
-- ----------------------------
DROP TABLE IF EXISTS `authority`;
CREATE TABLE `authority` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` int(11) NOT NULL,
  `enable` tinyint(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `levelCode` varchar(255) NOT NULL,
  `position` int(11) NOT NULL,
  `theValue` varchar(255) DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  `matchUrl` varchar(255) NOT NULL,
  `itemIcon` varchar(255) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_authority_parentId_authority` (`parentId`),
  CONSTRAINT `FK_authority_parentId_authority` FOREIGN KEY (`parentId`) REFERENCES `authority` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of authority
-- ----------------------------
INSERT INTO `authority` VALUES ('1', '3', '0', '欢迎使用', '1', '0', '1', '/home', '^/home$', 'icon-home', null);
INSERT INTO `authority` VALUES ('2', '2', '0', '首页', '1,2', '0', '1', '/home/index', '/home/index', '', '1');
INSERT INTO `authority` VALUES ('3', '2', '0', '系统设置', '3', '0', '2', '/setting', '^/setting$', 'icon-cogs', null);
INSERT INTO `authority` VALUES ('4', '4', '0', '用户管理', '3,4', '0', '1', '/account/list', '^/account$', '', '3');
INSERT INTO `authority` VALUES ('5', '1', '0', '用户列表', '3,4,5', '0', '1', '/account/list', '/account/list', '', '4');
INSERT INTO `authority` VALUES ('6', '2', '0', '账户绑定', '3,4,6', '0', '2', '/account/authorize', '/account/authorize', '', '4');
INSERT INTO `authority` VALUES ('7', '1', '0', '角色管理', '3,7', '0', '2', '/role/list', '^/role$', '', '3');
INSERT INTO `authority` VALUES ('8', '1', '0', '角色列表', '3,7,8', '0', '1', '/role/list', '/role/list', '', '7');
INSERT INTO `authority` VALUES ('9', '1', '0', '权限绑定', '3,7,9', '0', '2', '/role/bind', '/role/bind', '', '7');
INSERT INTO `authority` VALUES ('10', '1', '0', '权限管理', '3,10', '0', '3', '/authority/chain', '^/authority$', '', '3');
INSERT INTO `authority` VALUES ('11', '1', '0', '权限添加', '3,10,11', '0', '1', '/authority/add', '/authority/add', '', '10');
INSERT INTO `authority` VALUES ('12', '1', '0', '权限编辑', '3,10,12', '0', '2', '/authority/edit', '/authority/edit', '', '10');
INSERT INTO `authority` VALUES ('13', '1', '0', '权限删除', '3,10,13', '0', '3', '/authority/delete', '/authority/delete', '', '10');
INSERT INTO `authority` VALUES ('14', '1', '0', '组织机构管理', '3,14', '0', '4', '/organization/chain', '^/organization$', '', '3');
INSERT INTO `authority` VALUES ('15', '1', '0', '组织机构树', '3,14,15', '0', '1', '/organization/chain', '/organization/chain', '', '14');
INSERT INTO `authority` VALUES ('16', '1', '0', '组织机构添加', '3,14,16', '0', '2', '/organization/add', '/organization/add', '', '14');
INSERT INTO `authority` VALUES ('17', '1', '0', '组织机构编辑', '3,14,17', '0', '3', '/organization/edit', '/organization/edit', '', '14');
INSERT INTO `authority` VALUES ('18', '1', '0', '组织机构删除', '3,14,18', '0', '4', '/organization/delete', '/organization/delete', '', '14');
INSERT INTO `authority` VALUES ('19', '1', '0', '权限树', '3,10,19', '0', '4', '/authority/chain', '/authority/chain', '', '10');
INSERT INTO `authority` VALUES ('21', '1', '0', '微信管理', '21', '0', '3', '/weixinsend', '^/weixinsend$', 'icon-comments', null);
INSERT INTO `authority` VALUES ('22', '1', '0', '创建菜单', '21,22', '0', '1', '/weixinsend/createmenu', '/weixinsend/createmenu', '', '21');
INSERT INTO `authority` VALUES ('23', '4', '0', '查询菜单', '21,23', '0', '2', '/weixinsend/getmenu', '/weixinsend/getmenu', '', '21');
INSERT INTO `authority` VALUES ('24', '1', '0', '测试节点', '24', '0', '1', '/test/list', '^/test$', 'icon-cogs', null);
INSERT INTO `authority` VALUES ('25', '1', '0', '测试节点01', '24,25', '0', '2', '/test0/list', '/test01/list', '', '24');
INSERT INTO `authority` VALUES ('26', '1', '0', '角色添加', '3,7,26', '0', '1', '/role/add', '/role/add', '', '7');

-- ----------------------------
-- Table structure for organization
-- ----------------------------
DROP TABLE IF EXISTS `organization`;
CREATE TABLE `organization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` int(11) NOT NULL,
  `enable` tinyint(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `levelCode` varchar(255) NOT NULL,
  `position` int(11) NOT NULL,
  `theValue` varchar(255) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_organization_parentId_organization` (`parentId`),
  CONSTRAINT `FK_organization_parentId_organization` FOREIGN KEY (`parentId`) REFERENCES `organization` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of organization
-- ----------------------------
INSERT INTO `organization` VALUES ('1', '1', '0', '总机构', '1', '0', '1', null);
INSERT INTO `organization` VALUES ('2', '1', '0', '分机构1-1', '1,2', '0', '1', '1');
INSERT INTO `organization` VALUES ('3', '1', '0', '分机构', '1,3', '0', '', '1');
INSERT INTO `organization` VALUES ('4', '1', '0', '总机构2', '4', '0', '2', null);
INSERT INTO `organization` VALUES ('5', '2', '0', '组织机构2-1', '4,5', '0', '1', '4');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `enable` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '4', '系统管理员', '1');
INSERT INTO `role` VALUES ('2', '2', '普通管理员', '1');

-- ----------------------------
-- Table structure for role_authority
-- ----------------------------
DROP TABLE IF EXISTS `role_authority`;
CREATE TABLE `role_authority` (
  `roleId` int(11) NOT NULL,
  `authorityId` int(11) NOT NULL,
  KEY `FK_sccf4fx8omb6jlsy2ra75xxer` (`authorityId`),
  KEY `FK_fftr98ew5vtbdpcfetn7xd715` (`roleId`),
  CONSTRAINT `FK_fftr98ew5vtbdpcfetn7xd715` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`),
  CONSTRAINT `FK_sccf4fx8omb6jlsy2ra75xxer` FOREIGN KEY (`authorityId`) REFERENCES `authority` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_authority
-- ----------------------------
INSERT INTO `role_authority` VALUES ('1', '1');
INSERT INTO `role_authority` VALUES ('1', '2');
INSERT INTO `role_authority` VALUES ('1', '3');
INSERT INTO `role_authority` VALUES ('1', '4');
INSERT INTO `role_authority` VALUES ('1', '5');
INSERT INTO `role_authority` VALUES ('1', '6');
INSERT INTO `role_authority` VALUES ('1', '7');
INSERT INTO `role_authority` VALUES ('1', '8');
INSERT INTO `role_authority` VALUES ('1', '9');
INSERT INTO `role_authority` VALUES ('1', '10');
INSERT INTO `role_authority` VALUES ('1', '11');
INSERT INTO `role_authority` VALUES ('1', '12');
INSERT INTO `role_authority` VALUES ('1', '13');
INSERT INTO `role_authority` VALUES ('1', '19');
INSERT INTO `role_authority` VALUES ('1', '14');
INSERT INTO `role_authority` VALUES ('1', '15');
INSERT INTO `role_authority` VALUES ('1', '16');
INSERT INTO `role_authority` VALUES ('1', '17');
INSERT INTO `role_authority` VALUES ('1', '18');
INSERT INTO `role_authority` VALUES ('1', '21');
INSERT INTO `role_authority` VALUES ('1', '22');
INSERT INTO `role_authority` VALUES ('1', '23');
INSERT INTO `role_authority` VALUES ('1', '24');
INSERT INTO `role_authority` VALUES ('1', '25');
INSERT INTO `role_authority` VALUES ('1', '26');
INSERT INTO `role_authority` VALUES ('2', '1');
INSERT INTO `role_authority` VALUES ('2', '2');
INSERT INTO `role_authority` VALUES ('2', '3');
INSERT INTO `role_authority` VALUES ('2', '4');
INSERT INTO `role_authority` VALUES ('2', '5');
INSERT INTO `role_authority` VALUES ('2', '6');
INSERT INTO `role_authority` VALUES ('2', '7');
INSERT INTO `role_authority` VALUES ('2', '8');
INSERT INTO `role_authority` VALUES ('2', '9');
INSERT INTO `role_authority` VALUES ('2', '26');
INSERT INTO `role_authority` VALUES ('2', '10');
INSERT INTO `role_authority` VALUES ('2', '11');
INSERT INTO `role_authority` VALUES ('2', '12');
INSERT INTO `role_authority` VALUES ('2', '13');
INSERT INTO `role_authority` VALUES ('2', '19');
INSERT INTO `role_authority` VALUES ('2', '14');
INSERT INTO `role_authority` VALUES ('2', '15');
INSERT INTO `role_authority` VALUES ('2', '16');
INSERT INTO `role_authority` VALUES ('2', '17');
INSERT INTO `role_authority` VALUES ('2', '18');
INSERT INTO `role_authority` VALUES ('2', '21');
INSERT INTO `role_authority` VALUES ('2', '22');
INSERT INTO `role_authority` VALUES ('2', '23');
