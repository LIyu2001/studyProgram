/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : my_db_01

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2022-05-14 17:46:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `author` varchar(20) DEFAULT NULL,
  `publish` varchar(20) DEFAULT NULL,
  `pages` int(10) DEFAULT NULL,
  `price` float(10,2) DEFAULT NULL,
  `bookcaseid` int(10) DEFAULT NULL,
  `abled` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ieh6qsxp6q7oydadktc9oc8t2` (`bookcaseid`),
  CONSTRAINT `FK_ieh6qsxp6q7oydadktc9oc8t2` FOREIGN KEY (`bookcaseid`) REFERENCES `bookcase` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('1', '解忧杂货店', '东野圭古', '电子工业出版社', '102', '27.30', '9', '1');
INSERT INTO `book` VALUES ('2', '追风筝的人', '卡勒德·胡赛尼', '中信出版社', '330', '26.00', '1', '1');
INSERT INTO `book` VALUES ('3', '人间失格', '太宰治', '作家出版社', '150', '17.30', '1', '1');
INSERT INTO `book` VALUES ('4', '这就是二十四节气', '白天', '电子工业出版社', '220', '59.00', '3', '1');
INSERT INTO `book` VALUES ('5', '白夜行', '东野圭吾', '南海出版公司', '300', '27.30', '4', '1');
INSERT INTO `book` VALUES ('6', '摆渡人', '克莱儿·麦克福尔', '百花洲文艺出版社', '225', '22.80', '1', '1');
INSERT INTO `book` VALUES ('7', '暖暖心绘本', '米拦弗特毕', '湖南少儿出版社', '168', '131.60', '5', '1');
INSERT INTO `book` VALUES ('8', '天才在左疯子在右', '高铭', '北京联合出版公司', '330', '27.50', '6', '1');
INSERT INTO `book` VALUES ('9', '我们仨', '杨绛', '生活.读书.新知三联书店', '89', '17.20', '7', '1');
INSERT INTO `book` VALUES ('10', '活着', '余华', '作家出版社', '100', '100.00', '6', '1');
INSERT INTO `book` VALUES ('11', '水浒传', '施耐庵', '三联出版社', '300', '50.00', '1', '1');
INSERT INTO `book` VALUES ('12', '三国演义', '罗贯中', '三联出版社', '300', '50.00', '2', '1');
INSERT INTO `book` VALUES ('13', '红楼梦', '曹雪芹', '三联出版社', '300', '50.00', '5', '1');
INSERT INTO `book` VALUES ('14', '西游记', '吴承恩', '三联出版社', '300', '60.00', '3', '1');
INSERT INTO `book` VALUES ('17', 'springboot', '张三', null, null, null, null, null);
INSERT INTO `book` VALUES ('18', 'springboot', '张三', null, null, null, null, null);
INSERT INTO `book` VALUES ('19', '顶数据库', '四点九六', null, null, null, null, null);
INSERT INTO `book` VALUES ('20', '额', '的', null, null, null, null, null);
INSERT INTO `book` VALUES ('21', '额', '的', null, null, null, null, null);
INSERT INTO `book` VALUES ('22', '额', '的', null, null, null, null, null);
INSERT INTO `book` VALUES ('23', '我的图书', '我', null, null, null, null, null);
INSERT INTO `book` VALUES ('26', '我读', '我', null, null, null, null, null);
INSERT INTO `book` VALUES ('27', '我是', '你', null, null, null, null, null);
INSERT INTO `book` VALUES ('28', '是', '我读', null, null, null, null, null);
INSERT INTO `book` VALUES ('29', '减去', '多余', null, null, null, null, null);
INSERT INTO `book` VALUES ('30', '减去', '多余', null, null, null, null, null);
INSERT INTO `book` VALUES ('31', '波', '地方', null, null, null, null, null);
INSERT INTO `book` VALUES ('32', 'save', '我', null, null, null, null, null);
INSERT INTO `book` VALUES ('33', 'jing', 'liyu', null, null, null, null, null);
INSERT INTO `book` VALUES ('34', '英', '的方式', null, null, null, null, null);
INSERT INTO `book` VALUES ('35', '你的', '我', null, null, null, null, null);
INSERT INTO `book` VALUES ('36', '额', '设计的', null, null, null, null, null);
INSERT INTO `book` VALUES ('37', '可以', '能够', null, null, null, null, null);
INSERT INTO `book` VALUES ('38', '三国演义', '无车变更', null, null, null, null, null);

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `unitprice` float DEFAULT NULL,
  `isselect` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('1', 'OPPO R15 智能手机 全网通', '2', '599', '1');
INSERT INTO `cart` VALUES ('2', 'vivo X27 8GB+256GB大内存', '1', '699', '1');

-- ----------------------------
-- Table structure for computer
-- ----------------------------
DROP TABLE IF EXISTS `computer`;
CREATE TABLE `computer` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of computer
-- ----------------------------
INSERT INTO `computer` VALUES ('1', 'KingstonU盘', '57.9');
INSERT INTO `computer` VALUES ('2', '优派液晶显示器', '699');
INSERT INTO `computer` VALUES ('3', '联想笔记本', '6599');
INSERT INTO `computer` VALUES ('4', 'LG 航拍器', '699');
INSERT INTO `computer` VALUES ('5', '惠普（HP）笔记本', '4999');
INSERT INTO `computer` VALUES ('6', 'NIZ静电容键盘', '657.9');

-- ----------------------------
-- Table structure for ev_users
-- ----------------------------
DROP TABLE IF EXISTS `ev_users`;
CREATE TABLE `ev_users` (
  `id` int(30) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(255) NOT NULL COMMENT '用户名称',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `nickname` varchar(255) DEFAULT '' COMMENT '绰号\r\n',
  `email` varchar(255) DEFAULT NULL COMMENT '电子邮箱地址',
  `user_pic` text COMMENT '用户介绍',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ev_users
-- ----------------------------
INSERT INTO `ev_users` VALUES ('1', 'liyu', '123', '小雨', '935362425@qq.com', '我是前端小白');
INSERT INTO `ev_users` VALUES ('2', 'root', 'admin123', '管理员', '97576867@qq.com', '我是管理员\r\n');
INSERT INTO `ev_users` VALUES ('3', 'admin1', '$2a$10$qQPnLAj9nbE/Rqqw06EG0.ItoOnpO02MkaNeJiRtjtxxg2soUbMMm', '', null, null);
INSERT INTO `ev_users` VALUES ('4', 'admin2', '$2a$10$qY9zMqLtLuJ7hlQUv2AfBO1Q7oZiwrdDktIvkTlRnTC3LR30.szmy', '', null, null);
INSERT INTO `ev_users` VALUES ('5', 'admin3', '$2a$10$kGaSThO23TDdoIg9EgqKLub.gmPedL.xwA7IWXdhf2cYbeOobVTs6', '', null, null);
INSERT INTO `ev_users` VALUES ('6', 'admin4', '$2a$10$mtsP47Q.smhFGQGAT5OhAeB45b5oUrDO1zDrt.Lf1F0ErUfi5i1Va', '', null, null);
INSERT INTO `ev_users` VALUES ('7', 'wangzhen', '$2a$10$6AWG3LiJQGWWg33SJ3u73uaunurmDMmuZPphnzpyZn4F0KIbZyWyS', '', null, null);

-- ----------------------------
-- Table structure for phone
-- ----------------------------
DROP TABLE IF EXISTS `phone`;
CREATE TABLE `phone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of phone
-- ----------------------------
INSERT INTO `phone` VALUES ('1', '荣耀8', '5888', null);
INSERT INTO `phone` VALUES ('2', '一加手机', '2499', '@/assets/images/phone2.jpg');
INSERT INTO `phone` VALUES ('3', '红米', '1199', null);
INSERT INTO `phone` VALUES ('4', 'LG G5', '2999', null);
INSERT INTO `phone` VALUES ('5', '苹果4s手机', '2099', null);
INSERT INTO `phone` VALUES ('6', '魅族 魅蓝', '999', null);
