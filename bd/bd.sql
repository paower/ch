/*
Navicat MySQL Data Transfer

Source Server         : paower
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : bd

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2020-07-07 09:26:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `ncconfig`
-- ----------------------------
DROP TABLE IF EXISTS `ncconfig`;
CREATE TABLE `ncconfig` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '配置名称',
  `config_group` varchar(20) NOT NULL COMMENT '配置分组',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `value` text NOT NULL COMMENT '配置值',
  `info` varchar(255) NOT NULL COMMENT '描述',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_name` (`name`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `group` (`config_group`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=147 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ncconfig
-- ----------------------------
INSERT INTO `ncconfig` VALUES ('7', 'SMTP_HOST', 'smtp', '1448266020', 'smtp.ym.163.com', '', '0');
INSERT INTO `ncconfig` VALUES ('8', 'SMTP_PORT', 'smtp', '1448266020', '25', '', '0');
INSERT INTO `ncconfig` VALUES ('9', 'SMTP_USER', 'smtp', '1448266020', '', '', '0');
INSERT INTO `ncconfig` VALUES ('10', 'SMTP_PASS', 'smtp', '1448266020', '', '', '0');
INSERT INTO `ncconfig` VALUES ('11', 'FROM_EMAIL', 'smtp', '1448266020', '', '', '0');
INSERT INTO `ncconfig` VALUES ('12', 'FROM_NAME', 'smtp', '1448266020', '', '', '0');
INSERT INTO `ncconfig` VALUES ('13', 'SITE_TITLE', 'site', '1448285156', '商城', '', '0');
INSERT INTO `ncconfig` VALUES ('14', 'SITE_NAME', 'site', '1448285156', '', '', '0');
INSERT INTO `ncconfig` VALUES ('15', 'SITE_DESCRIPTION', 'site', '1448285156', '《商城》协议《商城》协议《商城》协议《商城》协议《商城》协议《商城》协议《商城》协议', '', '0');
INSERT INTO `ncconfig` VALUES ('16', 'SITE_KEYWORDS', 'site', '1448285156', '商城', '', '0');
INSERT INTO `ncconfig` VALUES ('17', 'SITE_URL', 'site', '1448285156', '', '', '0');
INSERT INTO `ncconfig` VALUES ('18', 'SHORT_URL', 'site', '1448285156', '', '', '0');
INSERT INTO `ncconfig` VALUES ('19', 'SITE_ICP', 'site', '1448285156', '', 'ICP备案号', '0');
INSERT INTO `ncconfig` VALUES ('20', 'EMAIL', 'site', '1448285156', '123456', '', '0');
INSERT INTO `ncconfig` VALUES ('21', 'TELEPHONE', 'site', '1448285156', '', '', '0');
INSERT INTO `ncconfig` VALUES ('22', 'WEB_SITE_CLOSE', 'site', '1448285156', '1', '', '0');
INSERT INTO `ncconfig` VALUES ('23', 'common_image_thumb_width', 'image', '1448293183', '255', '', '0');
INSERT INTO `ncconfig` VALUES ('24', 'common_image_thumb_height', 'image', '1448293183', '255', '', '0');
INSERT INTO `ncconfig` VALUES ('25', 'gallery_thumb_width', 'image', '1448293183', '127', '', '0');
INSERT INTO `ncconfig` VALUES ('26', 'gallery_thumb_height', 'image', '1448293183', '127', '', '0');
INSERT INTO `ncconfig` VALUES ('27', 'gallery_related_thumb_width', 'image', '1448293183', '150', '', '0');
INSERT INTO `ncconfig` VALUES ('28', 'gallery_related_thumb_height', 'image', '1448293183', '150', '', '0');
INSERT INTO `ncconfig` VALUES ('29', 'blog_list_thumb_width', 'image', '1448293183', '280', '', '0');
INSERT INTO `ncconfig` VALUES ('30', 'blog_list_thumb_height', 'image', '1448293183', '140', '', '0');
INSERT INTO `ncconfig` VALUES ('31', 'goods_thumb_width', 'image', '1448293183', '360', '', '0');
INSERT INTO `ncconfig` VALUES ('32', 'goods_thumb_height', 'image', '1448293183', '360', '', '0');
INSERT INTO `ncconfig` VALUES ('33', 'goods_gallery_thumb_width', 'image', '1448293183', '75', '', '0');
INSERT INTO `ncconfig` VALUES ('34', 'goods_gallery_thumb_height', 'image', '1448293183', '75', '', '0');
INSERT INTO `ncconfig` VALUES ('35', 'goods_cart_thumb_width', 'image', '1448293183', '80', '', '0');
INSERT INTO `ncconfig` VALUES ('36', 'goods_cart_thumb_height', 'image', '1448293183', '80', '', '0');
INSERT INTO `ncconfig` VALUES ('39', 'length_clasisz_id', 'other', '1448588459', '2', '', '0');
INSERT INTO `ncconfig` VALUES ('40', 'WEIGHT_ID', 'other', '1448588459', '1', '', '0');
INSERT INTO `ncconfig` VALUES ('41', 'FRONT_PAGE_NUM', 'other', '1448588459', '8', '', '0');
INSERT INTO `ncconfig` VALUES ('42', 'BACK_PAGE_NUM', 'other', '1448588459', '10', '', '0');
INSERT INTO `ncconfig` VALUES ('43', 'default_order_status_id', 'other', '1448588459', '3', '', '0');
INSERT INTO `ncconfig` VALUES ('44', 'paid_order_status_id', 'other', '1448588459', '1', '', '0');
INSERT INTO `ncconfig` VALUES ('45', 'complete_order_status_id', 'other', '1448588459', '4', '', '0');
INSERT INTO `ncconfig` VALUES ('47', 'URL_ID', 'other', '1448588459', '10', '', '0');
INSERT INTO `ncconfig` VALUES ('48', 'SITE_SLOGAN', 'site', '1448285156', '', '', '0');
INSERT INTO `ncconfig` VALUES ('51', 'cancel_order_status_id', 'other', '0', '5', '', '0');
INSERT INTO `ncconfig` VALUES ('52', 'BLOG_TITLE', 'other', '0', '博客', '', '0');
INSERT INTO `ncconfig` VALUES ('53', 'SITE_ICON', 'site', '0', 'product/57a654b160dd9.png', '网站图标', '0');
INSERT INTO `ncconfig` VALUES ('54', 'goods_related_thumb_width', 'image', '0', '280', '', '0');
INSERT INTO `ncconfig` VALUES ('55', 'goods_related_thumb_height', 'image', '0', '280', '', '0');
INSERT INTO `ncconfig` VALUES ('59', 'PWD_KEY', 'site', '1470304751', '.O&4893h99s-pXf~F9(H4xZ@8NqsP#A3r', '', '0');
INSERT INTO `ncconfig` VALUES ('60', 'ewm', 'site', '0', '/ewm.jpg', '', '0');
INSERT INTO `ncconfig` VALUES ('61', 'gg', 'site', '0', '', '公告', '0');
INSERT INTO `ncconfig` VALUES ('72', 'payid', 'site', '0', 'd4m7xoorsaomtjw3shpzu2tq', '商户ID', '0');
INSERT INTO `ncconfig` VALUES ('73', 'paymi', 'site', '0', 't2iiufvwcky4nvn5tsek4janfmmvmt4x', '商户密钥', '0');
INSERT INTO `ncconfig` VALUES ('74', 'KM_KEY', 'site', '0', '', '', '0');
INSERT INTO `ncconfig` VALUES ('110', 'phone', 'site', '0', '88888888888888', '电话', '0');
INSERT INTO `ncconfig` VALUES ('113', 'chandan_time', 'site', '0', '8', '', '0');
INSERT INTO `ncconfig` VALUES ('115', 'add_hy', 'site', '0', '30', '', '0');
INSERT INTO `ncconfig` VALUES ('116', 'default_tx', 'site', '0', 'shop/597314adc65d4.jpg', '', '0');
INSERT INTO `ncconfig` VALUES ('117', 'kefu', 'site', '0', 'product/59812e9c2b24b.png', '', '0');
INSERT INTO `ncconfig` VALUES ('118', 'shuoming', 'site', '0', '&lt;h3&gt;奖励说明：&lt;/h3&gt;\r\n\r\n&lt;p&gt;直推10人，团队业绩150万，奖励每天团队新增业绩0.5%.&lt;/p&gt;\r\n\r\n&lt;p&gt;直推15人，团队业绩350万，奖励每天团队新增业绩1%.&lt;/p&gt;\r\n\r\n&lt;p&gt;直推20人，团队业绩800万，奖励每天团队新增业绩1.5%&lt;/p&gt;\r\n', '', '0');
INSERT INTO `ncconfig` VALUES ('119', 'sxf', 'site', '0', '0.1', '手续费', '0');
INSERT INTO `ncconfig` VALUES ('124', 'btd', 'site', '0', '2', '每次被偷蛋数', '0');
INSERT INTO `ncconfig` VALUES ('125', 'ydd', 'site', '0', '2', '被狗咬掉蛋', '0');
INSERT INTO `ncconfig` VALUES ('126', 'sd_one', 'site', '0', '0.1', '收蛋一代10%', '0');
INSERT INTO `ncconfig` VALUES ('127', 'sd_two', 'site', '0', '0.03', '收蛋二代3%', '0');
INSERT INTO `ncconfig` VALUES ('128', 'sd_three', 'site', '0', '0.02', '收蛋三代2%', '0');
INSERT INTO `ncconfig` VALUES ('129', 'mai_one', 'site', '0', '0.1', '买动物一代10%', '0');
INSERT INTO `ncconfig` VALUES ('130', 'mai_two', 'site', '0', '0.03', '买动物二代3%', '0');
INSERT INTO `ncconfig` VALUES ('131', 'mai_three', 'site', '0', '0.02', '买动物三代2%', '0');
INSERT INTO `ncconfig` VALUES ('132', 'qq', 'site', '0', '123456', '', '0');
INSERT INTO `ncconfig` VALUES ('133', 'm_sms_id', 'site', '0', 'yakrNoOUFiat3qTJRu5F9We9rXAVgz', 'accessKeyId', '0');
INSERT INTO `ncconfig` VALUES ('134', 'm_sms_user', 'site', '0', 'LTAIeVSBAFgHdKuK', 'accessKeySecret', '0');
INSERT INTO `ncconfig` VALUES ('135', 'm_sms_pwd', 'site', '0', 'SMS_78790147', 'SMS_77505064', '0');
INSERT INTO `ncconfig` VALUES ('136', 'm_sms_name', 'site', '0', '全民养殖', 'name', '0');
INSERT INTO `ncconfig` VALUES ('137', 'tui_one', 'site', '0', '0.005', '直推20人,150万', '0');
INSERT INTO `ncconfig` VALUES ('138', 'tui_two', 'site', '0', '0.01', '直推15人,350万', '0');
INSERT INTO `ncconfig` VALUES ('139', 'tui_three', 'site', '0', '0.015', '直推20人,800万', '0');
INSERT INTO `ncconfig` VALUES ('140', 'tui_one_rmb', 'site', '0', '1500000', '直推20人,150万', '0');
INSERT INTO `ncconfig` VALUES ('141', 'tui_two_rmb', 'site', '0', '3500000', '直推15人,350万', '0');
INSERT INTO `ncconfig` VALUES ('142', 'tui_three_rmb', 'site', '0', '8000000', '直推20人,800万', '0');
INSERT INTO `ncconfig` VALUES ('144', 'MSG_password', 'site', '0', '83850', '短信接口密码', '0');
INSERT INTO `ncconfig` VALUES ('145', 'MSG_account', 'site', '0', '3a247c90b02e8dc1c7f08de60542c622', '短信接口', '0');
INSERT INTO `ncconfig` VALUES ('146', 'MSG', 'site', '0', '&quot;你的验证码是&quot;.$code.&quot;，如非本人操作，请忽略本短信&quot;', '短信模板', '0');

-- ----------------------------
-- Table structure for `nc_admin`
-- ----------------------------
DROP TABLE IF EXISTS `nc_admin`;
CREATE TABLE `nc_admin` (
  `a_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `a_uname` varchar(20) NOT NULL COMMENT '用户名',
  `a_true_name` varchar(20) NOT NULL COMMENT '真名',
  `a_telephone` varchar(40) NOT NULL,
  `a_email` varchar(64) NOT NULL,
  `a_passwd` varchar(255) NOT NULL,
  `a_login_count` mediumint(8) NOT NULL COMMENT '登录次数',
  `a_last_login_ip` varchar(40) NOT NULL COMMENT '最后登录ip',
  `a_last_ip_region` varchar(40) NOT NULL,
  `a_create_time` int(11) NOT NULL COMMENT '创建时间',
  `a_last_login_time` int(11) NOT NULL COMMENT '最后登录',
  `a_status` tinyint(4) NOT NULL COMMENT '状态',
  PRIMARY KEY (`a_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='后台管理员';

-- ----------------------------
-- Records of nc_admin
-- ----------------------------
INSERT INTO `nc_admin` VALUES ('1', 'admin', '张恒涛', '18582322141', 'admin@admin.com', 'MDAwMDAwMDAwMIuNg9fHiGmdvtyMr4K3bnQ', '1099', '121.32.177.210', '', '1470304751', '1562664723', '1');

-- ----------------------------
-- Table structure for `nc_menu`
-- ----------------------------
DROP TABLE IF EXISTS `nc_menu`;
CREATE TABLE `nc_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `url` char(255) DEFAULT NULL COMMENT '链接地址',
  `icon` varchar(20) DEFAULT NULL,
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `pid` (`pid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=142 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='后台菜单';

-- ----------------------------
-- Records of nc_menu
-- ----------------------------
INSERT INTO `nc_menu` VALUES ('1', '0', '系统信息', '', 'icon-book', '7');
INSERT INTO `nc_menu` VALUES ('29', '28', '商品管理', 'Goods/index', '', '2');
INSERT INTO `nc_menu` VALUES ('36', '35', '订单管理', 'Order/index', '', '1');
INSERT INTO `nc_menu` VALUES ('38', '37', '基本信息', 'settings/general', '', '1');
INSERT INTO `nc_menu` VALUES ('40', '37', '邮件配置', 'settings/smtp_mail', '', '3');
INSERT INTO `nc_menu` VALUES ('43', '0', '用户', '', 'icon-user-md', '0');
INSERT INTO `nc_menu` VALUES ('46', '37', '配置管理', 'Config/index', '', '5');
INSERT INTO `nc_menu` VALUES ('47', '43', '后台用户', 'AdminUser/index', '', '3');
INSERT INTO `nc_menu` VALUES ('51', '1', '基本信息', 'settings/general', '', '1');
INSERT INTO `nc_menu` VALUES ('54', '53', '文章分类', 'BlogCategory/index', '', '0');
INSERT INTO `nc_menu` VALUES ('55', '53', '文章列表', 'Blog/index', '', '3');
INSERT INTO `nc_menu` VALUES ('56', '28', '商品分类', 'GoodsCategory/index', '', '1');
INSERT INTO `nc_menu` VALUES ('66', '65', '充值管理', 'member/chongzhi', null, '2');
INSERT INTO `nc_menu` VALUES ('68', '65', '资金充值', 'Member/rmb', null, '1');
INSERT INTO `nc_menu` VALUES ('69', '65', '资金记录', 'Member/zijing', null, '5');
INSERT INTO `nc_menu` VALUES ('75', '74', '投诉列表', '/Form/bdlist/bd_id/8', null, '0');
INSERT INTO `nc_menu` VALUES ('83', '82', '投诉列表', 'Form/bdlist/bd_id/8', null, '0');
INSERT INTO `nc_menu` VALUES ('85', '84', '分润记录', 'Record/fenrun', null, '1');
INSERT INTO `nc_menu` VALUES ('88', '84', '赠送记录', 'Record/transaction', null, '4');
INSERT INTO `nc_menu` VALUES ('140', '107', '总后台店铺', 'Goods/dianpu', null, '1');
INSERT INTO `nc_menu` VALUES ('93', '84', '交易记录', 'Record/sell', null, '3');
INSERT INTO `nc_menu` VALUES ('94', '84', '团队分红', 'Record/tuandui', null, '0');
INSERT INTO `nc_menu` VALUES ('97', '96', '商品管理', 'Goods/index', null, '0');
INSERT INTO `nc_menu` VALUES ('99', '96', '商城订单', 'Goods/shoporder', null, '0');
INSERT INTO `nc_menu` VALUES ('102', '101', '道具管理', 'Gpgoods/index', '', '0');
INSERT INTO `nc_menu` VALUES ('106', '0', '订单', '', 'icon-book', '3');
INSERT INTO `nc_menu` VALUES ('107', '0', '商城', '', 'icon-gift', '2');
INSERT INTO `nc_menu` VALUES ('108', '106', '订单管理', 'Order/index', null, '0');
INSERT INTO `nc_menu` VALUES ('109', '107', '商品管理', 'Goods/index', null, '5');
INSERT INTO `nc_menu` VALUES ('115', '110', '其他配置', 'Gameconfigs/Othersconfig', null, '16');
INSERT INTO `nc_menu` VALUES ('116', '0', '提现管理', '', 'icon-book', '5');
INSERT INTO `nc_menu` VALUES ('117', '116', '提现订单', 'Tixian/tixian', null, '0');
INSERT INTO `nc_menu` VALUES ('118', '116', '转账订单', 'Tixian/Transfers', null, '0');
INSERT INTO `nc_menu` VALUES ('119', '1', '公告', 'settings/notice', null, '3');
INSERT INTO `nc_menu` VALUES ('121', '107', '分类管理', 'Goods/cate', null, '3');
INSERT INTO `nc_menu` VALUES ('123', '122', '普通会员三级', 'Gameconfigs/sanjione', null, '20');
INSERT INTO `nc_menu` VALUES ('124', '122', '中级会员三级', 'Gameconfigs/sanjitwo', null, '21');
INSERT INTO `nc_menu` VALUES ('125', '122', '高级会员三级', 'Gameconfigs/sanjithree', null, '22');
INSERT INTO `nc_menu` VALUES ('126', '122', '三级达成条件', 'Gameconfigs/sanjiconditions', null, '18');
INSERT INTO `nc_menu` VALUES ('131', '90', '充值余额记录', 'Member/chongzhibiao', 'icon-dashboard', '55');
INSERT INTO `nc_menu` VALUES ('132', '90', '出售余额记录', 'Member/chushoubiao', 'icon-dashboard', '44');
INSERT INTO `nc_menu` VALUES ('133', '1', '文章列表', 'settings/wenzhang', 'icon-dashboard', '33');
INSERT INTO `nc_menu` VALUES ('134', '1', '文章类型', 'settings/wentype', 'icon-dashboard', '32');
INSERT INTO `nc_menu` VALUES ('135', '0', '商家入驻', null, 'icon-gift', '3');
INSERT INTO `nc_menu` VALUES ('136', '135', '个人店铺', 'Goods/ggshop', 'icon-dashboard', '0');
INSERT INTO `nc_menu` VALUES ('137', '135', '认证列表', 'Goods/verify', 'icon-dashboard', '2');
INSERT INTO `nc_menu` VALUES ('139', '138', '升级列表', 'Goods/level', 'icon-dashboard', '10');

-- ----------------------------
-- Table structure for `ysk_activate_num`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_activate_num`;
CREATE TABLE `ysk_activate_num` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '激活码',
  `activate_num` varchar(20) NOT NULL,
  `uid` int(11) NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL DEFAULT '',
  `mobile` varchar(20) DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-未使用 1已只用',
  `create_time` int(11) NOT NULL,
  `user_time` int(11) NOT NULL DEFAULT '0' COMMENT '使用时间',
  `user_ip` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `activate_num` (`activate_num`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ysk_activate_num
-- ----------------------------

-- ----------------------------
-- Table structure for `ysk_address`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_address`;
CREATE TABLE `ysk_address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` text NOT NULL,
  `name` varchar(20) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `address` varchar(200) NOT NULL DEFAULT '地址',
  `city_id` varchar(200) NOT NULL DEFAULT '市',
  `country_id` varchar(200) NOT NULL DEFAULT '县乡',
  `province_id` varchar(200) NOT NULL DEFAULT '省',
  `zt_` int(11) NOT NULL,
  PRIMARY KEY (`address_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ysk_address
-- ----------------------------

-- ----------------------------
-- Table structure for `ysk_admin`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_admin`;
CREATE TABLE `ysk_admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'UID',
  `auth_id` int(11) NOT NULL DEFAULT '1' COMMENT '角色ID',
  `nickname` varchar(63) DEFAULT NULL COMMENT '昵称',
  `username` varchar(31) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(63) NOT NULL DEFAULT '' COMMENT '密码',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '状态',
  `reg_type` varchar(20) DEFAULT NULL COMMENT '注册人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=121 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户账号表';

-- ----------------------------
-- Records of ysk_admin
-- ----------------------------
INSERT INTO `ysk_admin` VALUES ('5', '1', '超级管理', 'admin', '611fd61468729d297328a05cb48f9a86', '18582322141', '1902173178', '1526153248', '1587969970', '1', '');

-- ----------------------------
-- Table structure for `ysk_admin_kucun`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_admin_kucun`;
CREATE TABLE `ysk_admin_kucun` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '平台仓库',
  `total_num` decimal(15,2) NOT NULL COMMENT '累计添加总数',
  `less_num` decimal(15,2) NOT NULL COMMENT '库存余量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- ----------------------------
-- Records of ysk_admin_kucun
-- ----------------------------

-- ----------------------------
-- Table structure for `ysk_admin_zhuangz`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_admin_zhuangz`;
CREATE TABLE `ysk_admin_zhuangz` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员给用户拨发果子明细表id',
  `manage_id` int(11) NOT NULL COMMENT '管理员id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `guozi_num` decimal(15,0) NOT NULL COMMENT '转给用户的果子数量',
  `create_time` int(11) NOT NULL COMMENT '转果子时间',
  `ip` varchar(20) NOT NULL COMMENT '转果子时使用的电脑ip',
  `before_cangku_num` decimal(11,0) NOT NULL DEFAULT '0',
  `after_cangku_num` decimal(11,0) NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1-加 2-减',
  `content` varchar(255) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `account` varchar(20) NOT NULL,
  `manage_name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ysk_admin_zhuangz
-- ----------------------------
INSERT INTO `ysk_admin_zhuangz` VALUES ('51', '1', '1718', '2', '1523534817', '121.33.33.195', '0', '2', '1', '转给用户', '肥肥鱼', '13316098335', 'admin');

-- ----------------------------
-- Table structure for `ysk_baner`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_baner`;
CREATE TABLE `ysk_baner` (
  `baner_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `baner_px` int(11) DEFAULT '0' COMMENT '排序序号',
  `baner_url` varchar(250) NOT NULL COMMENT '图片路径',
  `baner_name` varchar(250) DEFAULT NULL COMMENT '点击链接',
  `baner_type` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`baner_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ysk_baner
-- ----------------------------
INSERT INTO `ysk_baner` VALUES ('5', '1', '2017-08-25/599ffda5edb9c.jpg', '###', '0');
INSERT INTO `ysk_baner` VALUES ('8', '19', '2017-08-25/599ffd8c46b57.jpg', '###', '0');
INSERT INTO `ysk_baner` VALUES ('9', '3', '2017-08-25/599ffd9920d0b.jpg', '###', '0');
INSERT INTO `ysk_baner` VALUES ('10', '0', '2017-08-25/599ffdc415550.jpg', '###', '1');
INSERT INTO `ysk_baner` VALUES ('11', '0', '2017-08-25/599ffdd60ab76.jpg', '###', '1');

-- ----------------------------
-- Table structure for `ysk_bank_name`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_bank_name`;
CREATE TABLE `ysk_bank_name` (
  `q_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `pid` int(11) NOT NULL COMMENT '外键',
  `banq_genre` varchar(20) NOT NULL COMMENT '银行类型',
  `banq_img` varchar(150) NOT NULL COMMENT '银行卡类型图片',
  PRIMARY KEY (`q_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='银行卡类型表';

-- ----------------------------
-- Records of ysk_bank_name
-- ----------------------------
INSERT INTO `ysk_bank_name` VALUES ('1', '1', '广州市农村信用合作社', 'ncxys.png');
INSERT INTO `ysk_bank_name` VALUES ('2', '2', '中国农业银行', 'zgnyyh.png');
INSERT INTO `ysk_bank_name` VALUES ('3', '3', '中国工商银行', 'zggsyh.png');
INSERT INTO `ysk_bank_name` VALUES ('4', '4', '中国招商银行', 'zsyh.png');
INSERT INTO `ysk_bank_name` VALUES ('5', '5', '中国邮政储蓄银行', 'zgyz.png');
INSERT INTO `ysk_bank_name` VALUES ('6', '6', '中国建设银行', 'zgjsyh.png');
INSERT INTO `ysk_bank_name` VALUES ('7', '7', '中国银行', 'zgyh.png');
INSERT INTO `ysk_bank_name` VALUES ('8', '8', '交通银行', 'jtyh.png');
INSERT INTO `ysk_bank_name` VALUES ('9', '9', '广州市商业银行', 'fjxyyh.png');
INSERT INTO `ysk_bank_name` VALUES ('10', '10', '中国民生银行', 'zgmsyh.png');
INSERT INTO `ysk_bank_name` VALUES ('11', '11', '深圳发展银行', 'szfzyh.png');
INSERT INTO `ysk_bank_name` VALUES ('12', '12', '上海浦东发展银行', 'shpdfzyh.png');
INSERT INTO `ysk_bank_name` VALUES ('13', '13', '华夏银行', 'hxyh.png');
INSERT INTO `ysk_bank_name` VALUES ('14', '14', '兴业银行', 'fjxyyh.png');
INSERT INTO `ysk_bank_name` VALUES ('15', '15', '广东发展银行', 'fjxyyh.png');
INSERT INTO `ysk_bank_name` VALUES ('16', '16', '中国光大银行', 'gdyh.jpg');
INSERT INTO `ysk_bank_name` VALUES ('17', '17', '支付宝', 'zfb.png');

-- ----------------------------
-- Table structure for `ysk_banner`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_banner`;
CREATE TABLE `ysk_banner` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id主键',
  `title` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '名称',
  `href` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '图片链接地址',
  `sort` int(8) DEFAULT NULL COMMENT '排序',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态',
  `picture` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '图片',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ysk_banner
-- ----------------------------
INSERT INTO `ysk_banner` VALUES ('1', '09', null, '0', '1', '2020-07-02/5efd97de2a333.jpg', '1593677790');
INSERT INTO `ysk_banner` VALUES ('2', '67', null, '0', '1', '2020-07-02/5efd984639b28.jpg', '1593677894');

-- ----------------------------
-- Table structure for `ysk_bofamx`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_bofamx`;
CREATE TABLE `ysk_bofamx` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '拨发果子到平台表的id',
  `manage_id` int(11) NOT NULL COMMENT '管理员id',
  `bofa_num` decimal(15,2) NOT NULL COMMENT '拨发的果子数量',
  `create_time` int(11) NOT NULL COMMENT '拨发时间',
  `note` tinytext NOT NULL COMMENT '备注',
  `manage_name` varchar(20) NOT NULL COMMENT '管理员账号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ysk_bofamx
-- ----------------------------
INSERT INTO `ysk_bofamx` VALUES ('1', '1', '50000.00', '1506487943', '', 'admin');

-- ----------------------------
-- Table structure for `ysk_childcoop_configs`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_childcoop_configs`;
CREATE TABLE `ysk_childcoop_configs` (
  `id` int(11) NOT NULL,
  `jiwo_ord` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '普通鸡窝开窝消耗积分',
  `jiwo_senior` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '高级鸡窝开窝消耗积分',
  `jiwo_ord_highst` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '普通鸡窝最高收益值',
  `jiwo_senior_highst` decimal(11,2) NOT NULL COMMENT '高级鸡窝最大收益',
  `guoyuan_ord` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '普通地开启消耗',
  `guoyuan_senior` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '果园中级地开启消耗果园积分',
  `guoyuan_henior` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '果园地高级开启消耗积分',
  `guoyuan_higest` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '果园普通地达到最高收益值',
  `yuchang_ord` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT '普通渔场开池消耗积分',
  `yucahng_senior` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT '高级渔场开池消耗积分',
  `yuchang_higest` int(1) NOT NULL DEFAULT '4' COMMENT '渔场最高收益（倍数）',
  `fengce_add` float(5,4) NOT NULL DEFAULT '0.0000' COMMENT '风车增益率',
  `guanjia_add` float(5,4) NOT NULL DEFAULT '0.0000' COMMENT '管家增益率',
  `dengji_add` float(8,4) NOT NULL DEFAULT '0.0001' COMMENT '等级增益率',
  `zhuanjia_add` float(5,2) NOT NULL DEFAULT '0.00' COMMENT '专家增益率',
  `chai_fen_min` float(8,3) NOT NULL DEFAULT '0.005' COMMENT '最小拆分率',
  `chai_fen_max` float(8,3) NOT NULL DEFAULT '0.250' COMMENT '最大拆分率',
  `chaifenmin_yu` float(8,3) NOT NULL DEFAULT '0.000' COMMENT '渔场最低拆分率',
  `chaifenmax_yu` float(8,3) NOT NULL DEFAULT '0.000' COMMENT '渔场最高拆分率',
  `jifen_cost` float(5,2) NOT NULL DEFAULT '0.00' COMMENT '积分服务费',
  `jifen_transmutation` float(5,2) NOT NULL DEFAULT '0.00' COMMENT '积分转化为消费的比例',
  `fengche_enddays` int(10) NOT NULL DEFAULT '0' COMMENT '风车有效期',
  `jiaoyi_cost` float(5,3) NOT NULL DEFAULT '0.000' COMMENT '交易手续费',
  `housekeeper` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '达到对应收益送专家',
  `expert` int(10) NOT NULL COMMENT '达到推荐人数送管家',
  `zhituijiang` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '第一次建窝给上级奖励',
  `yuchang_earns_max` tinyint(1) NOT NULL DEFAULT '3' COMMENT '渔场可拿最高收益',
  `add_tixian` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1->增养,2->提现',
  `nianhua_shouyi` float(8,2) NOT NULL DEFAULT '3.00' COMMENT '果园年化收益',
  `guoyuan_jiaoshui` float(8,4) NOT NULL DEFAULT '0.0050' COMMENT '果园浇水释放率',
  `gongtongdi_sifang` float(8,4) NOT NULL DEFAULT '0.0000' COMMENT '共同果园浇水释放率',
  `yuchang_guanjia_add` float(8,4) NOT NULL DEFAULT '0.0000' COMMENT '管家增益率',
  `yuchang_ord_max` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT '普通渔场最高投资值',
  `yuchang_higst_max` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT '高级渔场最高投资值',
  `tixian_beishu` int(10) NOT NULL DEFAULT '20' COMMENT '提现倍数',
  `tixian_start` int(10) NOT NULL DEFAULT '0' COMMENT '起提数量',
  `tixian_shouxu_yj` float(6,2) NOT NULL DEFAULT '0.00' COMMENT '佣金/代理佣金/农联积分提现扣除手续费',
  `tixian_xiaofei_yj` float(6,2) NOT NULL DEFAULT '0.00' COMMENT '佣金/代理佣金/农联积分提现拆分消费积分',
  `ji_tixian_shouxu` float(6,2) NOT NULL DEFAULT '0.00' COMMENT '鸡场提现手续费',
  `guo_tixian_shouxu` float(6,2) NOT NULL DEFAULT '0.00' COMMENT '果园提现手续费',
  `yu_tixian_shouxu` float(6,2) NOT NULL DEFAULT '0.00' COMMENT '渔场提现手续费',
  `ji_tixian_xiaofe` float(6,2) NOT NULL DEFAULT '0.00' COMMENT '鸡场提现消费',
  `guo_tixian_xiaofe` float(6,2) NOT NULL DEFAULT '0.00' COMMENT '果园提现消费',
  `yu_tixian_xiaofe` float(6,2) NOT NULL DEFAULT '0.00' COMMENT '渔场提现消费',
  `putong_member` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '普通会员达成条件',
  `senior_member` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '中级会员达成条件',
  `higst_member` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '高级会员达成条件',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ysk_childcoop_configs
-- ----------------------------
INSERT INTO `ysk_childcoop_configs` VALUES ('1', '360.00', '3600.00', '1440.00', '14440.00', '400.00', '800.00', '1200.00', '1600.00', '399.000', '800.000', '6', '0.0500', '0.0001', '0.0000', '0.00', '0.000', '0.010', '0.001', '0.150', '0.10', '0.25', '60', '0.100', '0.00', '80', '40.00', '3', '1', '3.00', '0.0050', '0.0002', '0.0100', '48000.000', '96000.000', '154', '154', '0.00', '0.00', '0.10', '0.10', '0.10', '0.25', '0.25', '0.00', '0.00', '50000.00', '100000.00');

-- ----------------------------
-- Table structure for `ysk_coindets`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_coindets`;
CREATE TABLE `ysk_coindets` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '币价格表',
  `cid` int(10) NOT NULL COMMENT '币价格表',
  `coin_name` char(40) NOT NULL COMMENT '币名称',
  `coin_price` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '币价格',
  `coin_addtime` char(40) NOT NULL COMMENT '币添加时间',
  `max` float(10,4) DEFAULT NULL,
  `min` float(10,4) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=20925 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- ----------------------------
-- Records of ysk_coindets
-- ----------------------------

-- ----------------------------
-- Table structure for `ysk_coindets_copy`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_coindets_copy`;
CREATE TABLE `ysk_coindets_copy` (
  `cid` int(10) NOT NULL AUTO_INCREMENT COMMENT '币价格表',
  `coin_name` char(40) NOT NULL COMMENT '币名称',
  `coin_price` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '币价格',
  `coin_addtime` char(40) NOT NULL COMMENT '币添加时间',
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- ----------------------------
-- Records of ysk_coindets_copy
-- ----------------------------

-- ----------------------------
-- Table structure for `ysk_collect`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_collect`;
CREATE TABLE `ysk_collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '收藏ID',
  `uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `type` int(1) DEFAULT NULL COMMENT '收藏类型',
  `proid` int(11) NOT NULL COMMENT 'ID',
  `time` int(11) NOT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- ----------------------------
-- Records of ysk_collect
-- ----------------------------

-- ----------------------------
-- Table structure for `ysk_comment`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_comment`;
CREATE TABLE `ysk_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL COMMENT '评论者ID',
  `toid` int(11) DEFAULT NULL COMMENT '被评论者ID',
  `video_id` int(11) DEFAULT NULL COMMENT '视频ID',
  `create_time` int(11) DEFAULT NULL COMMENT '评论时间',
  `content` varchar(255) DEFAULT NULL COMMENT '内容',
  `zan` int(10) NOT NULL DEFAULT '0' COMMENT '赞',
  `cai` int(10) NOT NULL DEFAULT '0' COMMENT '踩',
  `ait` varchar(255) DEFAULT NULL COMMENT '@',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ysk_comment
-- ----------------------------
INSERT INTO `ysk_comment` VALUES ('30', '0', '8936', '0', '58', '1590807446', '666', '0', '0', '');
INSERT INTO `ysk_comment` VALUES ('31', '0', '8936', '0', '58', '1591003911', '999', '0', '0', '');
INSERT INTO `ysk_comment` VALUES ('32', '0', '8936', '0', '58', '1591003922', '888', '0', '0', '');

-- ----------------------------
-- Table structure for `ysk_complaint`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_complaint`;
CREATE TABLE `ysk_complaint` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '投诉人id',
  `content` text COMMENT '投诉内容',
  `imgs` varchar(255) DEFAULT NULL COMMENT '图片路径',
  `status` tinyint(1) DEFAULT '0' COMMENT '0 未查看 1 已查看',
  `create_time` int(10) DEFAULT NULL COMMENT '投诉时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ysk_complaint
-- ----------------------------

-- ----------------------------
-- Table structure for `ysk_config`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_config`;
CREATE TABLE `ysk_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '配置标题',
  `name` varchar(32) DEFAULT NULL COMMENT '配置名称',
  `value` text NOT NULL COMMENT '配置值',
  `group` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `type` varchar(16) NOT NULL DEFAULT '' COMMENT '配置类型',
  `options` varchar(255) NOT NULL DEFAULT '' COMMENT '配置额外值',
  `tip` varchar(100) NOT NULL DEFAULT '' COMMENT '配置说明',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=83 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统配置表';

-- ----------------------------
-- Records of ysk_config
-- ----------------------------
INSERT INTO `ysk_config` VALUES ('1', '站点开关', 'TOGGLE_WEB_SITE', '1', '3', '0', '0:关闭\r\n1:开启', '平台进行维护', '1378898976', '1406992386', '1', '1');
INSERT INTO `ysk_config` VALUES ('2', '网站标题', 'WEB_SITE_TITLE', '', '1', '0', '', '网站标题前台显示标题', '1378898976', '1379235274', '2', '1');
INSERT INTO `ysk_config` VALUES ('3', '网站LOGO', 'WEB_SITE_LOGO', '', '1', '0', '', '网站LOGO', '1407003397', '1407004692', '3', '1');
INSERT INTO `ysk_config` VALUES ('4', '网站描述', 'WEB_SITE_DESCRIPTION', '', '1', '0', '', '网站搜索引擎描述', '1378898976', '1379235841', '4', '1');
INSERT INTO `ysk_config` VALUES ('5', '网站关键字', 'WEB_SITE_KEYWORD', '', '1', '0', '', '网站搜索引擎关键字', '1378898976', '1381390100', '5', '1');
INSERT INTO `ysk_config` VALUES ('6', '版权信息', 'WEB_SITE_COPYRIGHT', '', '1', '0', '', '设置在网站底部显示的版权信息，如“版权所有 © 2014-2015 科斯克网络科技”', '1406991855', '1406992583', '6', '1');
INSERT INTO `ysk_config` VALUES ('7', '网站备案号', 'WEB_SITE_ICP', '', '1', '0', '', '设置在网站底部显示的备案号，如“苏ICP备1502009号\"', '1378900335', '1415983236', '9', '1');
INSERT INTO `ysk_config` VALUES ('8', '黄土地最小值', 'huang_min', '300', '2', '1', '', '', '0', '0', '20', '1');
INSERT INTO `ysk_config` VALUES ('9', '黄土地最大值', 'huang_max', '600', '2', '1', '', '', '0', '0', '21', '1');
INSERT INTO `ysk_config` VALUES ('10', '红土地最小值', 'hong_min', '1000', '2', '2', '', '', '0', '0', '21', '1');
INSERT INTO `ysk_config` VALUES ('11', '红土地最大值', 'hong_max', '2000', '2', '2', '', '', '0', '0', '30', '1');
INSERT INTO `ysk_config` VALUES ('12', '黑土地最小值', 'hei_min', '2000', '2', '3', '', '', '0', '0', '31', '1');
INSERT INTO `ysk_config` VALUES ('13', '黑土地最大值', 'hei_max', '4000', '2', '3', '', '', '0', '0', '31', '1');
INSERT INTO `ysk_config` VALUES ('14', '积分基础释放率', 'sell_fee', '0.2', '4', '', '', '', '0', '0', '23', '1');
INSERT INTO `ysk_config` VALUES ('15', '1代积分加速放率', 'direct_fee', '5', '4', '', '', '', '0', '0', '0', '1');
INSERT INTO `ysk_config` VALUES ('16', '2-15代积分加速放率', 'shop_fee', '1', '4', '', '', '', '0', '0', '33', '1');
INSERT INTO `ysk_config` VALUES ('29', '2代Vip增加积分率', 'vadd_lv', '8', '4', '', '', '', '0', '0', '0', '1');
INSERT INTO `ysk_config` VALUES ('30', '2-15代Vip增加积分率', 'morevadd_lv', '5', '4', '0', '', '', '0', '0', '0', '1');
INSERT INTO `ysk_config` VALUES ('31', '总要扣比例', 'des_lv', '0.4', '2', '5', '', '', '0', '0', '0', '1');
INSERT INTO `ysk_config` VALUES ('27', '基础拆分倍数', 'base_lv', '2.5', '2', '5', '', '', '0', '0', '0', '1');
INSERT INTO `ysk_config` VALUES ('28', '哈士奇拆分倍数', 'hashiqi_lv', '0.05', '2', '5', '', '', '0', '0', '0', '1');
INSERT INTO `ysk_config` VALUES ('24', '一级好友采矿拆分', 'friends_one', '10', '2', '', '', '', '0', '0', '0', '1');
INSERT INTO `ysk_config` VALUES ('25', '二级好友采矿拆分', 'friends_two', '0', '2', '', '', '', '0', '0', '0', '1');
INSERT INTO `ysk_config` VALUES ('26', '微信二维码', 'WEB_SITE_WX', '', '1', '', '', '', '0', '0', '0', '1');
INSERT INTO `ysk_config` VALUES ('32', '注册开关', 'close_reg', '0', '3', '', '0:关闭1:开启', '平台进行维护中', '0', '0', '12', '1');
INSERT INTO `ysk_config` VALUES ('33', '交易开关', 'close_trading', '1', '3', '', '0:关闭1:开启', '交易暂时关闭，16:00后开启', '0', '0', '13', '0');
INSERT INTO `ysk_config` VALUES ('34', '果子转出开关', 'close_sellnum', '0', '3', '', '0:关闭1:开启', '关闭果子转出说明11', '0', '0', '0', '0');
INSERT INTO `ysk_config` VALUES ('35', '三级好友采矿拆分', 'friends_tree', '0', '2', '', '', '', '0', '0', '0', '1');
INSERT INTO `ysk_config` VALUES ('36', '体验地最小值', 'tiyan_min', '66', '2', '4', '', '', '0', '0', '0', '1');
INSERT INTO `ysk_config` VALUES ('37', '体验地最大值', 'tiyan_max', '130', '2', '4', '', '', '0', '0', '0', '1');
INSERT INTO `ysk_config` VALUES ('38', '鸡拆分倍数', 'ji_lv', '0.05', '2', '5', '', '', '0', '0', '0', '1');
INSERT INTO `ysk_config` VALUES ('39', '鸟拆分倍数', 'niao_lv', '0.15', '2', '5', '', '', '0', '0', '0', '1');
INSERT INTO `ysk_config` VALUES ('40', '猫拆分倍数', 'mao_lv', '0.1', '2', '5', '', '', '0', '0', '0', '1');
INSERT INTO `ysk_config` VALUES ('41', '实时价格每分钟增长', 'growem', '10', '2', '', '', '', '0', '0', '12', '1');
INSERT INTO `ysk_config` VALUES ('42', '商城开关', 'TOGGLE_MALL_SITE', '0', '3', '0', '0:关闭\r\n1:开启', '商城暂未开放', '1378898976', '1406992386', '1', '1');
INSERT INTO `ysk_config` VALUES ('43', '注册送积分数', 'jifen', '1000', '1', '0', '', '', '1407003397', '1407004692', '3', '1');
INSERT INTO `ysk_config` VALUES ('44', '奖励开关', 'regjifen', '1', '1', '0', '', '', '1407003397', '1407004692', '3', '1');
INSERT INTO `ysk_config` VALUES ('45', '直推奖条件', 'zhitui1', '0', '6', '', '', '500000', '0', '0', '0', '1');
INSERT INTO `ysk_config` VALUES ('46', '直推奖条件', 'zhitui2', '0', '6', '', '', '500000', '0', '0', '33', '1');
INSERT INTO `ysk_config` VALUES ('47', '直推奖条件', 'zhitui3', '0', '6', '', '', '500000', '0', '0', '0', '1');
INSERT INTO `ysk_config` VALUES ('48', '直推奖条件', 'zhitui4', '0', '6', '', '', '500000', '0', '0', '0', '1');
INSERT INTO `ysk_config` VALUES ('49', '管理奖条件', 'guanli1', '0.3', '7', '', '', '1', '0', '0', '0', '1');
INSERT INTO `ysk_config` VALUES ('50', '管理奖条件', 'guanli2', '0.4', '7', '', '', '5', '0', '0', '33', '1');
INSERT INTO `ysk_config` VALUES ('51', '管理奖条件', 'guanli3', '0.5', '7', '', '', '15', '0', '0', '0', '1');
INSERT INTO `ysk_config` VALUES ('52', '余额转动奖条件', 'zhuand1', '0', '8', '', '', '500000', '0', '0', '0', '1');
INSERT INTO `ysk_config` VALUES ('53', '余额转动奖条件', 'zhuand2', '0', '8', '', '', '500000', '0', '0', '33', '1');
INSERT INTO `ysk_config` VALUES ('54', '余额转动奖条件', 'zhuand3', '0', '8', '', '', '500000', '0', '0', '0', '1');
INSERT INTO `ysk_config` VALUES ('55', '余额转动奖条件', 'zhuand4', '0', '8', '', '', '500000', '0', '0', '0', '1');
INSERT INTO `ysk_config` VALUES ('56', '区块奖条件', 'qukuai1', '0.8', '9', '', '1', '1', '0', '0', '0', '1');
INSERT INTO `ysk_config` VALUES ('57', '区块奖条件', 'qukuai2', '1', '9', '', '1', '5', '0', '0', '33', '1');
INSERT INTO `ysk_config` VALUES ('58', '区块奖条件', 'qukuai3', '2', '9', '', '1', '10', '0', '0', '0', '1');
INSERT INTO `ysk_config` VALUES ('59', '区块奖条件', 'qukuai4', '3', '9', '', '1', '20', '0', '0', '0', '1');
INSERT INTO `ysk_config` VALUES ('60', '区块奖条件', 'qukuai5', '4', '9', '', '1', '40', '0', '0', '0', '1');
INSERT INTO `ysk_config` VALUES ('61', '蓝钻加速放率', 'vip1', '1.5', '10', '', '2', '3', '0', '0', '33', '1');
INSERT INTO `ysk_config` VALUES ('62', '金钻加速放率', 'vip2', '2', '10', '', '3', '2', '0', '0', '0', '1');
INSERT INTO `ysk_config` VALUES ('63', '推荐一个人赠送积分数', 'jifens', '50', '1', '0', '', '', '1407003397', '1407004692', '3', '1');
INSERT INTO `ysk_config` VALUES ('64', '赠送积分最大推荐人数', 'rens', '15', '1', '0', '', '', '1407003397', '1407004692', '3', '1');
INSERT INTO `ysk_config` VALUES ('65', '用户升级蓝钻奖励积分数', 'b_drills', '500', '1', '0', '', '', '0', '0', '0', '1');
INSERT INTO `ysk_config` VALUES ('66', '蓝钻会员赠送积分最大推荐人数', 'b_num', '10', '1', '0', '', '', '0', '0', '0', '1');
INSERT INTO `ysk_config` VALUES ('67', '用户升级蓝钻推荐人奖励积分数', 'g_drills', '5000', '1', '0', '', '', '0', '0', '0', '1');
INSERT INTO `ysk_config` VALUES ('68', '金钻会员赠送积分最大推荐人', 'g_num', '5', '1', '0', '', '', '0', '0', '0', '1');
INSERT INTO `ysk_config` VALUES ('69', '管理奖条件', 'guanli4', '0.6', '7', '', '', '30', '0', '0', '0', '1');
INSERT INTO `ysk_config` VALUES ('72', '增加人数', 'add_user', '7461', '1', '', '', '', '0', '1556089172', '0', '1');
INSERT INTO `ysk_config` VALUES ('71', '前台显示总会员数', 'false_user', '18330', '1', '', '', '', '0', '0', '0', '1');
INSERT INTO `ysk_config` VALUES ('70', 'VIP加速效率', 'vip3', '3', '10', '', '4', '1', '0', '0', '0', '1');
INSERT INTO `ysk_config` VALUES ('73', '余额低于多少无法投资', 'min_balance', '1', '1', '', '', '', '0', '0', '0', '1');
INSERT INTO `ysk_config` VALUES ('74', '求购当前价格', 'buy_new_price', '3', '0', '', '', '', '0', '0', '0', '1');
INSERT INTO `ysk_config` VALUES ('75', '出售当前价格', 'sell_new_price', '3', '0', '', '', '', '0', '0', '0', '1');
INSERT INTO `ysk_config` VALUES ('76', '市场开关', 'turntable', '1', '0', '', '', '', '0', '0', '0', '1');
INSERT INTO `ysk_config` VALUES ('77', '市场开始时间', 'turntable_start', '8:00', '0', '', '', '', '0', '0', '0', '1');
INSERT INTO `ysk_config` VALUES ('78', '市场结束时间', 'turntable_end', '22:30', '0', '', '', '', '0', '0', '0', '1');
INSERT INTO `ysk_config` VALUES ('79', '关于北斗', 'about_bd', '&lt;h2 style=&quot;text-align:center;&quot;&gt;\r\n	&lt;span style=&quot;font-size:24px;&quot;&gt;关于慈惠短视频&lt;/span&gt; \r\n&lt;/h2&gt;', '0', '', '', '', '0', '0', '0', '1');
INSERT INTO `ysk_config` VALUES ('80', '用户协议', 'xieyi', '&lt;div style=&quot;text-align:center;&quot;&gt;\r\n	用户协议\r\n&lt;/div&gt;', '0', '', '', '', '0', '0', '0', '1');
INSERT INTO `ysk_config` VALUES ('81', '用户隐私协议', 'yinsixieyi', '&lt;div style=&quot;text-align:center;&quot;&gt;\r\n	用户隐私协议\r\n&lt;/div&gt;', '0', '', '', '', '0', '0', '0', '1');
INSERT INTO `ysk_config` VALUES ('82', '签到广告图片路径', 'signin_img', '2020-07-02/5efda6856b49d.jpg', '0', '', '', '', '0', '0', '0', '1');

-- ----------------------------
-- Table structure for `ysk_crowds`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_crowds`;
CREATE TABLE `ysk_crowds` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `num` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '出售数量',
  `create_time` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0-出售成功 1-买家确认  2-买家确认 3-取消交易',
  `dprice` decimal(10,4) DEFAULT NULL,
  `jindu` decimal(10,2) DEFAULT NULL,
  `open_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=936 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- ----------------------------
-- Records of ysk_crowds
-- ----------------------------

-- ----------------------------
-- Table structure for `ysk_crowds_detail`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_crowds_detail`;
CREATE TABLE `ysk_crowds_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `crowds_id` int(11) NOT NULL,
  `num` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '出售数量',
  `dprice` decimal(10,4) DEFAULT NULL,
  `tprice` decimal(10,4) DEFAULT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=943 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- ----------------------------
-- Records of ysk_crowds_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `ysk_date_sell_limit`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_date_sell_limit`;
CREATE TABLE `ysk_date_sell_limit` (
  `uid` int(11) NOT NULL COMMENT '每天出售限制',
  `num` int(11) NOT NULL DEFAULT '0',
  `datestr` char(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf16 ROW_FORMAT=FIXED;

-- ----------------------------
-- Records of ysk_date_sell_limit
-- ----------------------------

-- ----------------------------
-- Table structure for `ysk_deal`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_deal`;
CREATE TABLE `ysk_deal` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `deal_sn` varchar(200) DEFAULT NULL COMMENT '订单编号',
  `num` decimal(10,0) NOT NULL DEFAULT '0' COMMENT '出售数量',
  `sell_id` int(11) NOT NULL DEFAULT '0' COMMENT '出售人ID',
  `pay_id` int(11) NOT NULL COMMENT '购买人',
  `fee_num` decimal(11,4) DEFAULT NULL COMMENT '手续费',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态：0出售中，1确认打款,2确认收款，3.交易完成,5取消交易,6申诉中',
  `type` tinyint(1) NOT NULL COMMENT '0求购 1出售',
  `tprice` decimal(10,2) NOT NULL COMMENT '支付金额',
  `dprice` decimal(10,2) NOT NULL COMMENT '购买单位价格',
  `expiration_time` int(11) NOT NULL COMMENT '过期时间',
  `img` varchar(255) NOT NULL COMMENT '打款截图',
  `end_time` int(11) NOT NULL COMMENT '结束时间',
  `pay_type` varchar(15) NOT NULL COMMENT '收款方式：1支付宝 2银行卡 3微信',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `sell_id` (`sell_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=715 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- ----------------------------
-- Records of ysk_deal
-- ----------------------------
INSERT INTO `ysk_deal` VALUES ('671', 'PAY2020052151555356', '60', '8946', '8803', '0.0000', '1590054195', '5', '0', '243.60', '4.06', '1591950899', '', '0', '1');
INSERT INTO `ysk_deal` VALUES ('672', 'PAY2020052254571021', '1', '8937', '8946', '0.0000', '1590118486', '3', '0', '4.06', '4.06', '1590126163', '', '1590118981', '1');
INSERT INTO `ysk_deal` VALUES ('673', 'PAY2020052253100485', '1', '8937', '8946', '0.5000', '1590120053', '3', '1', '4.09', '4.09', '1590127294', '', '1590120104', '1');
INSERT INTO `ysk_deal` VALUES ('674', 'PAY2020052955539956', '10', '8936', '8937', '0.0000', '1590740087', '3', '0', '40.60', '4.06', '1590748218', '', '1590741028', '1,2,3');
INSERT INTO `ysk_deal` VALUES ('675', 'PAY2020052997985748', '12', '8936', '8803', '0.0000', '1590740778', '5', '0', '48.72', '4.06', '1591949856', '', '0', '1,2,3');
INSERT INTO `ysk_deal` VALUES ('676', 'PAY2020052910150579', '10', '8937', '8936', '5.0000', '1590740798', '3', '1', '40.90', '4.09', '1590748632', '', '1590741464', '1,2,3');
INSERT INTO `ysk_deal` VALUES ('677', 'PAY2020061253100100', '100', '8803', '8936', '0.0000', '1591943781', '5', '0', '300.00', '3.00', '1592221237', '', '0', '1');
INSERT INTO `ysk_deal` VALUES ('678', 'PAY2020061557974954', '20', '8803', '8936', '0.0000', '1592212633', '6', '0', '60.00', '3.00', '1592222047', '', '0', '1');
INSERT INTO `ysk_deal` VALUES ('679', 'PAY2020061550545399', '10', '8803', '8936', '0.0000', '1592213730', '5', '0', '30.00', '3.00', '1592222039', '', '0', '1');
INSERT INTO `ysk_deal` VALUES ('680', 'PAY2020061554100565', '100', '8803', '8936', '0.0000', '1592214182', '5', '0', '300.00', '3.00', '1592221579', '', '0', '1');
INSERT INTO `ysk_deal` VALUES ('681', 'PAY2020061654975156', '10', '8936', '0', '0.0000', '1592273174', '5', '0', '30.10', '3.01', '0', '', '0', '1,2,3');
INSERT INTO `ysk_deal` VALUES ('682', 'PAY2020061697494910', '10', '8936', '8803', '0.0000', '1592273258', '5', '0', '30.00', '3.00', '1592273429', '', '0', '1,2,3');
INSERT INTO `ysk_deal` VALUES ('683', 'PAY2020061697101999', '10', '8803', '0', '0.0000', '1592273850', '0', '0', '3450.00', '345.00', '0', '', '0', '1');
INSERT INTO `ysk_deal` VALUES ('684', 'PAY2020061651999853', '20', '8803', '8936', '0.0000', '1592278451', '5', '0', '60.00', '3.00', '1592285686', '', '0', '1');
INSERT INTO `ysk_deal` VALUES ('685', 'PAY2020061656985052', '30', '8803', '8936', '0.0000', '1592296008', '2', '0', '90.00', '3.00', '1592300100', '', '0', '1');
INSERT INTO `ysk_deal` VALUES ('686', 'PAY2020061652574954', '10', '8803', '8936', '0.0000', '1592302052', '5', '0', '30.00', '3.00', '1592309275', '', '0', '1');
INSERT INTO `ysk_deal` VALUES ('687', 'PAY2020061798985710', '10', '8803', '8936', '0.0000', '1592357179', '3', '0', '30.00', '3.00', '1592365583', '', '1592358401', '1');
INSERT INTO `ysk_deal` VALUES ('688', 'PAY2020061710298489', '1', '8803', '8936', '0.0000', '1592358991', '3', '0', '3.00', '3.00', '1592359319', '', '1592359341', '1');
INSERT INTO `ysk_deal` VALUES ('689', 'PAY2020061750495256', '2', '8803', '8936', '0.0000', '1592372946', '3', '0', '6.00', '3.00', '1592380700', '', '1592373631', '1');
INSERT INTO `ysk_deal` VALUES ('690', 'PAY2020061755534849', '1', '8803', '8936', '0.0000', '1592373719', '5', '0', '3.00', '3.00', '1592366949', '', '0', '1');
INSERT INTO `ysk_deal` VALUES ('691', 'PAY2020061799505699', '2', '8803', '8936', '0.0000', '1592375820', '5', '0', '6.00', '3.00', '1592373035', '', '0', '1');
INSERT INTO `ysk_deal` VALUES ('692', 'PAY2020061752525457', '3', '8803', '8936', '0.0000', '1592377268', '3', '0', '9.00', '3.00', '1592384491', '', '1592377312', '1');
INSERT INTO `ysk_deal` VALUES ('693', 'PAY2020061710250101', '10', '8803', '8936', '0.0000', '1592377391', '3', '0', '30.00', '3.00', '1592384608', '', '1592377419', '1');
INSERT INTO `ysk_deal` VALUES ('694', 'PAY2020061754979810', '20', '8803', '8936', '0.0000', '1592386198', '5', '0', '60.00', '3.00', '1592386323', '', '0', '1');
INSERT INTO `ysk_deal` VALUES ('695', 'PAY2020061753515556', '10', '8803', '0', '0.0000', '1592386917', '0', '0', '30.00', '3.00', '0', '', '0', '1');
INSERT INTO `ysk_deal` VALUES ('696', 'PAY2020061710210048', '30', '8803', '8936', '0.0000', '1592388383', '5', '0', '90.00', '3.00', '1592388458', '', '0', '1');
INSERT INTO `ysk_deal` VALUES ('697', 'PAY2020061756100981', '10', '8803', '8936', '0.0000', '1592389496', '5', '0', '30.00', '3.00', '1592389707', '', '0', '1');
INSERT INTO `ysk_deal` VALUES ('698', 'PAY2020061748102505', '2', '8803', '8937', '0.0000', '1592389664', '5', '0', '6.00', '3.00', '1592389884', '', '0', '1');
INSERT INTO `ysk_deal` VALUES ('699', 'PAY2020061710154521', '1', '8803', '8937', '0.0000', '1592389886', '5', '0', '3.00', '3.00', '1592389955', '', '0', '1');
INSERT INTO `ysk_deal` VALUES ('700', 'PAY2020061799499755', '1', '8803', '0', '0.0000', '1592389948', '0', '0', '3.00', '3.00', '0', '', '0', '1');
INSERT INTO `ysk_deal` VALUES ('701', 'PAY2020061750495550', '10', '8803', '8936', '0.0000', '1592390130', '5', '0', '30.00', '3.00', '1592397340', '', '0', '1');
INSERT INTO `ysk_deal` VALUES ('702', 'PAY2020061950974997', '10', '8936', '0', '0.0000', '1592549842', '5', '0', '30.00', '3.00', '0', '', '0', '3');
INSERT INTO `ysk_deal` VALUES ('703', 'PAY2020061910155534', '10', '8936', '8803', '0.0000', '1592549902', '5', '0', '30.00', '3.00', '1592553521', '', '0', '3');
INSERT INTO `ysk_deal` VALUES ('704', 'PAY2020061948569910', '1', '8936', '0', '0.0000', '1592550048', '5', '0', '3.00', '3.00', '0', '', '0', '3');
INSERT INTO `ysk_deal` VALUES ('705', 'PAY2020061957524957', '1', '8936', '0', '0.0000', '1592550153', '5', '0', '3.00', '3.00', '0', '', '0', '3');
INSERT INTO `ysk_deal` VALUES ('706', 'PAY2020061951551025', '1', '8936', '0', '0.0000', '1592550179', '5', '0', '3.00', '3.00', '0', '', '0', '3');
INSERT INTO `ysk_deal` VALUES ('707', 'PAY2020061956544956', '30', '8803', '8936', '0.0000', '1592557224', '5', '0', '90.00', '3.00', '1592561274', '', '0', '1');
INSERT INTO `ysk_deal` VALUES ('708', 'PAY2020061910097555', '100', '8936', '8803', '0.0000', '1592557741', '5', '0', '300.00', '3.00', '1592558495', '', '0', '3');
INSERT INTO `ysk_deal` VALUES ('709', 'PAY2020061948974910', '100', '8803', '8936', '0.0000', '1592558608', '3', '0', '300.00', '3.00', '1592565853', '', '1592558966', '1');
INSERT INTO `ysk_deal` VALUES ('710', 'PAY2020061910298571', '100', '8803', '8936', '0.0000', '1592559119', '3', '0', '300.00', '3.00', '1592566524', '', '1592559341', '1');
INSERT INTO `ysk_deal` VALUES ('711', 'PAY2020062099501011', '10', '8936', '8803', '0.0000', '1592623324', '3', '0', '30.00', '3.00', '1592630714', '', '1592623865', '3');
INSERT INTO `ysk_deal` VALUES ('712', 'PAY2020062048531009', '30', '8803', '8936', '0.0000', '1592623920', '3', '0', '90.00', '3.00', '1592631166', '', '1592624003', '1');
INSERT INTO `ysk_deal` VALUES ('713', 'PAY2020062010051485', '10', '8803', '0', '0.0000', '1592624317', '0', '0', '30.00', '3.00', '0', '', '0', '1');
INSERT INTO `ysk_deal` VALUES ('714', 'PAY2020063097554954', '10', '8803', '0', '0.0000', '1593484618', '0', '0', '30.00', '3.00', '0', '', '0', '1');

-- ----------------------------
-- Table structure for `ysk_deals`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_deals`;
CREATE TABLE `ysk_deals` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `num` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '出售数量',
  `sell_id` int(11) NOT NULL DEFAULT '0' COMMENT '出售人ID',
  `buy_id` int(11) NOT NULL DEFAULT '0' COMMENT '购买者ID',
  `fee_num` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '手续费',
  `create_time` int(11) DEFAULT NULL,
  `buy_uname` varchar(255) DEFAULT NULL,
  `cid` tinyint(1) DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL COMMENT '1,出售 2,购买',
  `tprice` decimal(10,2) DEFAULT NULL,
  `dprice` decimal(10,2) DEFAULT NULL,
  `d_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `sell_id` (`sell_id`) USING BTREE,
  KEY `buy_id` (`buy_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=149 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ysk_deals
-- ----------------------------
INSERT INTO `ysk_deals` VALUES ('00000000102', '20.00', '0', '8936', '0.00', '1589510148', '13800138001', '127', '1', '81.80', '4.09', '661');
INSERT INTO `ysk_deals` VALUES ('00000000103', '20.00', '0', '8937', '0.00', '1589526140', '13800138000', '127', '1', '81.80', '4.09', '664');
INSERT INTO `ysk_deals` VALUES ('00000000104', '20.00', '0', '8936', '0.00', '1589527773', '13800138001', '127', '1', '81.80', '4.09', '663');
INSERT INTO `ysk_deals` VALUES ('00000000105', '15.00', '8936', '0', '0.00', '1589528375', '13800138001', '127', '1', '60.90', '4.06', '660');
INSERT INTO `ysk_deals` VALUES ('00000000106', '5.00', '8937', '0', '0.00', '1589528511', '13800138000', '127', '1', '20.30', '4.06', '665');
INSERT INTO `ysk_deals` VALUES ('00000000107', '20.00', '8937', '0', '0.00', '1589529923', '13800138000', '127', '1', '81.20', '4.06', '666');
INSERT INTO `ysk_deals` VALUES ('00000000108', '20.00', '8937', '8936', '0.00', '1589529968', '13800138000', '127', '1', '81.20', '4.06', '666');
INSERT INTO `ysk_deals` VALUES ('00000000109', '20.00', '8937', '8936', '0.00', '1589530113', '13800138000', '127', '1', '81.20', '4.06', '666');
INSERT INTO `ysk_deals` VALUES ('00000000110', '5.00', '8937', '8936', '0.00', '1589531340', '13800138000', '127', '1', '20.30', '4.06', '665');
INSERT INTO `ysk_deals` VALUES ('00000000111', '5.00', '0', '8936', '0.00', '1590047409', '13800138002', '127', '1', '20.45', '4.09', '670');
INSERT INTO `ysk_deals` VALUES ('00000000112', '1.00', '8937', '0', '0.00', '1590118676', '13800138002', '127', '1', '4.06', '4.06', '672');
INSERT INTO `ysk_deals` VALUES ('00000000113', '1.00', '0', '8946', '0.00', '1590120090', '13800138001', '127', '1', '4.09', '4.09', '673');
INSERT INTO `ysk_deals` VALUES ('00000000114', '10.00', '8936', '0', '0.00', '1590740235', '13800138001', '127', '1', '40.60', '4.06', '674');
INSERT INTO `ysk_deals` VALUES ('00000000115', '10.00', '0', '8936', '0.00', '1590741213', '13800138001', '127', '1', '40.90', '4.09', '676');
INSERT INTO `ysk_deals` VALUES ('00000000116', '12.00', '8936', '0', '0.00', '1591942656', '18888888888', '127', '1', '48.72', '4.06', '675');
INSERT INTO `ysk_deals` VALUES ('00000000117', '60.00', '8946', '0', '0.00', '1591943699', '18888888888', '127', '1', '243.60', '4.06', '671');
INSERT INTO `ysk_deals` VALUES ('00000000118', '10.00', '8803', '0', '0.00', '1592213862', '13800138000', '127', '1', '30.00', '3.00', '679');
INSERT INTO `ysk_deals` VALUES ('00000000119', '20.00', '8803', '0', '0.00', '1592213919', '13800138000', '127', '1', '60.00', '3.00', '678');
INSERT INTO `ysk_deals` VALUES ('00000000120', '100.00', '8803', '0', '0.00', '1592214037', '13800138000', '127', '1', '300.00', '3.00', '677');
INSERT INTO `ysk_deals` VALUES ('00000000121', '100.00', '8803', '0', '0.00', '1592214206', '13800138000', '127', '1', '300.00', '3.00', '680');
INSERT INTO `ysk_deals` VALUES ('00000000122', '10.00', '8936', '0', '0.00', '1592273369', '18888888888', '127', '1', '30.00', '3.00', '682');
INSERT INTO `ysk_deals` VALUES ('00000000123', '20.00', '8803', '0', '0.00', '1592278486', '13800138000', '127', '1', '60.00', '3.00', '684');
INSERT INTO `ysk_deals` VALUES ('00000000124', '30.00', '8803', '0', '0.00', '1592296041', '13800138000', '127', '1', '90.00', '3.00', '685');
INSERT INTO `ysk_deals` VALUES ('00000000125', '10.00', '8803', '0', '0.00', '1592302075', '13800138000', '127', '1', '30.00', '3.00', '686');
INSERT INTO `ysk_deals` VALUES ('00000000126', '10.00', '8803', '0', '0.00', '1592357196', '13800138000', '127', '1', '30.00', '3.00', '687');
INSERT INTO `ysk_deals` VALUES ('00000000127', '1.00', '8803', '0', '0.00', '1592359117', '13800138000', '127', '1', '3.00', '3.00', '688');
INSERT INTO `ysk_deals` VALUES ('00000000128', '2.00', '8803', '0', '0.00', '1592373216', '13800138000', '127', '1', '6.00', '3.00', '689');
INSERT INTO `ysk_deals` VALUES ('00000000129', '1.00', '8803', '0', '0.00', '1592373749', '13800138000', '127', '1', '3.00', '3.00', '690');
INSERT INTO `ysk_deals` VALUES ('00000000130', '2.00', '8803', '0', '0.00', '1592375835', '13800138000', '127', '1', '6.00', '3.00', '691');
INSERT INTO `ysk_deals` VALUES ('00000000131', '3.00', '8803', '0', '3.00', '1592377281', '13800138000', '127', '1', '0.90', '3.00', '692');
INSERT INTO `ysk_deals` VALUES ('00000000132', '10.00', '8803', '0', '3.00', '1592377401', '13800138000', '127', '1', '30.00', '3.00', '693');
INSERT INTO `ysk_deals` VALUES ('00000000133', '20.00', '8803', '0', '0.00', '1592386263', '13800138000', '127', '1', '60.00', '3.00', '694');
INSERT INTO `ysk_deals` VALUES ('00000000134', '30.00', '8803', '0', '0.00', '1592388398', '13800138000', '127', '1', '90.00', '3.00', '696');
INSERT INTO `ysk_deals` VALUES ('00000000135', '10.00', '8803', '0', '0.00', '1592389647', '13800138000', '127', '1', '30.00', '3.00', '697');
INSERT INTO `ysk_deals` VALUES ('00000000136', '2.00', '8803', '0', '0.00', '1592389824', '13800138001', '127', '1', '6.00', '3.00', '698');
INSERT INTO `ysk_deals` VALUES ('00000000137', '1.00', '8803', '0', '0.00', '1592389895', '13800138001', '127', '1', '3.00', '3.00', '699');
INSERT INTO `ysk_deals` VALUES ('00000000138', '10.00', '8803', '0', '0.00', '1592390140', '13800138000', '127', '1', '30.00', '3.00', '701');
INSERT INTO `ysk_deals` VALUES ('00000000139', '10.00', '8936', '0', '0.00', '1592549921', '18888888888', '127', '1', '30.00', '3.00', '703');
INSERT INTO `ysk_deals` VALUES ('00000000140', '30.00', '8803', '0', '0.00', '1592557674', '13800138000', '127', '1', '90.00', '3.00', '707');
INSERT INTO `ysk_deals` VALUES ('00000000141', '100.00', '8936', '0', '0.00', '1592557768', '18888888888', '127', '1', '300.00', '3.00', '708');
INSERT INTO `ysk_deals` VALUES ('00000000142', '100.00', '8936', '8803', '0.00', '1592558007', '18888888888', '127', '1', '300.00', '3.00', '708');
INSERT INTO `ysk_deals` VALUES ('00000000143', '100.00', '8936', '8803', '0.00', '1592558435', '18888888888', '127', '1', '300.00', '3.00', '708');
INSERT INTO `ysk_deals` VALUES ('00000000144', '100.00', '8803', '0', '0.00', '1592558634', '13800138000', '127', '1', '300.00', '3.00', '709');
INSERT INTO `ysk_deals` VALUES ('00000000145', '100.00', '8803', '0', '0.00', '1592559134', '13800138000', '127', '1', '300.00', '3.00', '710');
INSERT INTO `ysk_deals` VALUES ('00000000146', '100.00', '8803', '8936', '0.00', '1592559300', '13800138000', '127', '1', '300.00', '3.00', '710');
INSERT INTO `ysk_deals` VALUES ('00000000147', '10.00', '8936', '0', '0.00', '1592623487', '18888888888', '127', '1', '30.00', '3.00', '711');
INSERT INTO `ysk_deals` VALUES ('00000000148', '30.00', '8803', '0', '0.00', '1592623942', '13800138000', '127', '1', '90.00', '3.00', '712');

-- ----------------------------
-- Table structure for `ysk_farmgoods`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_farmgoods`;
CREATE TABLE `ysk_farmgoods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '土地详情表',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `farm_landstype` varchar(20) NOT NULL COMMENT '1->普通地,2->高级地',
  `open_time` date DEFAULT NULL COMMENT '建窝时间',
  `lands_posi` int(11) NOT NULL COMMENT '鸡窝位置',
  `farms_type` tinyint(1) NOT NULL COMMENT '1->养鸡场,2->果园,3->渔场',
  `jiwoearns_all` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '对应鸡窝总收益',
  `chicken_type` tinyint(1) DEFAULT '1' COMMENT '1->小鸡,2->大鸡',
  `qingsao_time` date NOT NULL COMMENT '最后一次清扫时间',
  `chicken_bjmoney` decimal(11,2) NOT NULL DEFAULT '360.00' COMMENT '鸡窝本金',
  `chicken_profit` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '鸡窝收益',
  `nianhua_shouyi` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '果园年化收益',
  `yuchang_higst` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '渔场最高值临界点',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE COMMENT 'id主键',
  KEY `seach` (`uid`,`farm_landstype`,`lands_posi`,`farms_type`) USING BTREE COMMENT '搜索优化'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ysk_farmgoods
-- ----------------------------

-- ----------------------------
-- Table structure for `ysk_feedtimes`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_feedtimes`;
CREATE TABLE `ysk_feedtimes` (
  `id` int(11) NOT NULL COMMENT '渔场可喂养时间点',
  `feed_time` date NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ysk_feedtimes
-- ----------------------------

-- ----------------------------
-- Table structure for `ysk_fengche`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_fengche`;
CREATE TABLE `ysk_fengche` (
  `f_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `f_uid` int(11) NOT NULL COMMENT '用户UID',
  `f_time` date NOT NULL COMMENT '获得用时间',
  `f_end_time` date NOT NULL COMMENT '到期时间',
  `f_state` tinyint(1) NOT NULL COMMENT '状态 1使用中   2未使用  3已过期 ',
  `f_type` tinyint(1) NOT NULL COMMENT '1风车',
  PRIMARY KEY (`f_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ysk_fengche
-- ----------------------------

-- ----------------------------
-- Table structure for `ysk_fruitdetail`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_fruitdetail`;
CREATE TABLE `ysk_fruitdetail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `trading_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '交易类型 0-数量在自己账户内变动 1-收入  2-支出',
  `num` decimal(10,2) NOT NULL COMMENT '交易数量',
  `to_id` int(11) DEFAULT NULL COMMENT '支出给对方ID',
  `trading_name` varchar(255) DEFAULT NULL,
  `content` text COMMENT '说明',
  `add_time` int(11) NOT NULL COMMENT '交易时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ysk_fruitdetail
-- ----------------------------

-- ----------------------------
-- Table structure for `ysk_fruit_in`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_fruit_in`;
CREATE TABLE `ysk_fruit_in` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '果子转入',
  `manage_id` int(11) NOT NULL COMMENT '管理员id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `num` decimal(15,0) NOT NULL COMMENT '转给用户的果子数量',
  `create_time` int(11) NOT NULL COMMENT '转果子时间',
  `ip` varchar(20) NOT NULL COMMENT '转果子时使用的电脑ip',
  `type` char(20) NOT NULL,
  `content` varchar(255) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `account` varchar(20) NOT NULL,
  `manage_name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ysk_fruit_in
-- ----------------------------

-- ----------------------------
-- Table structure for `ysk_gift_scroll`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_gift_scroll`;
CREATE TABLE `ysk_gift_scroll` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `scroll_id` int(11) NOT NULL COMMENT '赠送卷轴',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ysk_gift_scroll
-- ----------------------------
INSERT INTO `ysk_gift_scroll` VALUES ('1', '8801', '1');
INSERT INTO `ysk_gift_scroll` VALUES ('4', '8936', '1');
INSERT INTO `ysk_gift_scroll` VALUES ('5', '8803', '7');
INSERT INTO `ysk_gift_scroll` VALUES ('6', '8803', '3');

-- ----------------------------
-- Table structure for `ysk_goods`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_goods`;
CREATE TABLE `ysk_goods` (
  `goods_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `subtract` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否扣除库存',
  `minimum` int(11) NOT NULL DEFAULT '1' COMMENT '最小起订数目',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL COMMENT '加入时间',
  `date_modified` datetime DEFAULT NULL COMMENT '修改的时间',
  `viewed` int(5) NOT NULL DEFAULT '0' COMMENT '点击量',
  PRIMARY KEY (`goods_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品信息表';

-- ----------------------------
-- Records of ysk_goods
-- ----------------------------
INSERT INTO `ysk_goods` VALUES ('1', '11111111111', 'product/59a91f7fb7fa6.jpg', '111.00', '1', '1', '0', '1', '2017-09-01 16:51:31', null, '0');

-- ----------------------------
-- Table structure for `ysk_goods_discount`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_goods_discount`;
CREATE TABLE `ysk_goods_discount` (
  `product_discount_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `price` decimal(15,2) NOT NULL DEFAULT '0.00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='数量折扣';

-- ----------------------------
-- Records of ysk_goods_discount
-- ----------------------------

-- ----------------------------
-- Table structure for `ysk_group`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_group`;
CREATE TABLE `ysk_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上级部门ID',
  `title` varchar(31) NOT NULL DEFAULT '' COMMENT '部门名称',
  `icon` varchar(31) NOT NULL DEFAULT '' COMMENT '图标',
  `menu_auth` text NOT NULL COMMENT '权限列表',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '状态',
  `auth_id` int(11) DEFAULT NULL,
  `hylb` varchar(10) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='部门信息表';

-- ----------------------------
-- Records of ysk_group
-- ----------------------------
INSERT INTO `ysk_group` VALUES ('1', '0', '超级管理员', '', '', '1426881003', '1427552428', '0', '1', '1', '0');

-- ----------------------------
-- Table structure for `ysk_growth`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_growth`;
CREATE TABLE `ysk_growth` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `num` decimal(11,2) NOT NULL DEFAULT '0.00',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `hashiqi_lv` decimal(8,6) NOT NULL DEFAULT '0.000000',
  `zangao_lv` decimal(8,6) NOT NULL DEFAULT '0.000000',
  `dcr_lv` decimal(8,6) NOT NULL DEFAULT '0.000000',
  `des_lv` decimal(8,6) NOT NULL DEFAULT '0.000000' COMMENT '扣除',
  `base_lv` decimal(8,6) NOT NULL DEFAULT '0.000000' COMMENT '基础拆分',
  `total_lv` decimal(8,6) NOT NULL DEFAULT '0.000000' COMMENT '总拆分',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- ----------------------------
-- Records of ysk_growth
-- ----------------------------

-- ----------------------------
-- Table structure for `ysk_htrecharge`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_htrecharge`;
CREATE TABLE `ysk_htrecharge` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '后台充值订单id',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `type` int(11) NOT NULL COMMENT '充值种类',
  `get_type` int(11) NOT NULL COMMENT '1->增加2->减少',
  `num` decimal(11,4) NOT NULL COMMENT '充值数量',
  `time` varchar(255) NOT NULL COMMENT '充值时间',
  `state` int(11) NOT NULL DEFAULT '0' COMMENT '订单状态0->未审核1->审核通过2->审核不通过',
  `add_type` int(11) DEFAULT NULL COMMENT '0->收益1->分红',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ysk_htrecharge
-- ----------------------------
INSERT INTO `ysk_htrecharge` VALUES ('1', '8803', '1', '1', '10.0000', '1591084748', '1', null);
INSERT INTO `ysk_htrecharge` VALUES ('2', '8803', '1', '2', '20.0000', '1591085765', '1', null);
INSERT INTO `ysk_htrecharge` VALUES ('3', '8803', '1', '1', '10.0000', '1591086118', '1', null);
INSERT INTO `ysk_htrecharge` VALUES ('4', '8803', '1', '2', '-50.0000', '1591086136', '1', null);
INSERT INTO `ysk_htrecharge` VALUES ('5', '8803', '1', '2', '5.0000', '1591086307', '1', null);
INSERT INTO `ysk_htrecharge` VALUES ('6', '8803', '2', '1', '10.0000', '1591086389', '1', null);
INSERT INTO `ysk_htrecharge` VALUES ('7', '8803', '2', '2', '10.0000', '1591086410', '1', null);
INSERT INTO `ysk_htrecharge` VALUES ('8', '8803', '1', '1', '5.0000', '1591086452', '1', null);
INSERT INTO `ysk_htrecharge` VALUES ('9', '8951', '1', '1', '10.0000', '1591842678', '1', null);
INSERT INTO `ysk_htrecharge` VALUES ('10', '8951', '1', '1', '10.0000', '1591843407', '1', null);
INSERT INTO `ysk_htrecharge` VALUES ('11', '8951', '1', '1', '345.0000', '1591843475', '1', null);
INSERT INTO `ysk_htrecharge` VALUES ('12', '8951', '1', '1', '123.0000', '1591843485', '1', null);
INSERT INTO `ysk_htrecharge` VALUES ('13', '8951', '1', '1', '10.0000', '1591843559', '1', null);
INSERT INTO `ysk_htrecharge` VALUES ('14', '8953', '1', '1', '10.0000', '1591867367', '1', null);
INSERT INTO `ysk_htrecharge` VALUES ('15', '8953', '1', '1', '90.0000', '1591867398', '1', null);
INSERT INTO `ysk_htrecharge` VALUES ('16', '8957', '1', '1', '0.0000', '1591929316', '1', null);
INSERT INTO `ysk_htrecharge` VALUES ('17', '8957', '1', '1', '0.0000', '1591929488', '1', null);
INSERT INTO `ysk_htrecharge` VALUES ('18', '8957', '1', '1', '0.0001', '1591929592', '1', null);
INSERT INTO `ysk_htrecharge` VALUES ('19', '8957', '3', '1', '10.0000', '1591932545', '1', null);
INSERT INTO `ysk_htrecharge` VALUES ('20', '8957', '3', '2', '10.0000', '1591932580', '1', null);
INSERT INTO `ysk_htrecharge` VALUES ('21', '8957', '3', '1', '10.0000', '1591933494', '1', null);
INSERT INTO `ysk_htrecharge` VALUES ('22', '8957', '3', '2', '10.0000', '1591933512', '1', null);
INSERT INTO `ysk_htrecharge` VALUES ('23', '8803', '1', '2', '120.0000', '1591943238', '1', null);
INSERT INTO `ysk_htrecharge` VALUES ('24', '8803', '1', '1', '0.0001', '1591943245', '1', null);
INSERT INTO `ysk_htrecharge` VALUES ('25', '8803', '1', '1', '120.0000', '1591943561', '1', null);
INSERT INTO `ysk_htrecharge` VALUES ('26', '8958', '1', '1', '100.0000', '1591943882', '1', null);
INSERT INTO `ysk_htrecharge` VALUES ('27', '8958', '1', '1', '200.0000', '1591943914', '1', null);
INSERT INTO `ysk_htrecharge` VALUES ('28', '8936', '1', '1', '955.0000', '1592213817', '1', null);
INSERT INTO `ysk_htrecharge` VALUES ('29', '8936', '1', '1', '39.0000', '1592214022', '1', null);
INSERT INTO `ysk_htrecharge` VALUES ('30', '8803', '1', '1', '10.0000', '1592640115', '1', '0');
INSERT INTO `ysk_htrecharge` VALUES ('31', '8803', '1', '1', '20.0000', '1592640124', '1', '1');
INSERT INTO `ysk_htrecharge` VALUES ('32', '8803', '1', '1', '100.0000', '1592646084', '1', '1');

-- ----------------------------
-- Table structure for `ysk_industry`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_industry`;
CREATE TABLE `ysk_industry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `industry_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ysk_industry
-- ----------------------------
INSERT INTO `ysk_industry` VALUES ('1', '三农精品');
INSERT INTO `ysk_industry` VALUES ('2', '折扣');
INSERT INTO `ysk_industry` VALUES ('3', '旅游');

-- ----------------------------
-- Table structure for `ysk_industry_verify`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_industry_verify`;
CREATE TABLE `ysk_industry_verify` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `industry_id` int(11) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL COMMENT '公司名称',
  `license` varchar(255) DEFAULT NULL COMMENT '营业执照',
  `create_time` int(11) DEFAULT NULL COMMENT '提交时间',
  `status` int(1) DEFAULT '0' COMMENT '1审核通过；0未审核；2未通过',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ysk_industry_verify
-- ----------------------------
INSERT INTO `ysk_industry_verify` VALUES ('1', '8936', '2', '小橘子啊', 'http://192.168.0.164/Public/user/2020-05-19/5ec374c90ff95.jpg', '1589867828', '1');

-- ----------------------------
-- Table structure for `ysk_layerneeds`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_layerneeds`;
CREATE TABLE `ysk_layerneeds` (
  `id` int(11) NOT NULL COMMENT '等级设置表',
  `direct_pers` int(11) NOT NULL DEFAULT '0' COMMENT '所需直推人数',
  `member_jifen` int(11) NOT NULL DEFAULT '0' COMMENT '所需要积分',
  `member_grade` int(11) NOT NULL DEFAULT '1' COMMENT '对应用户等级',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ysk_layerneeds
-- ----------------------------
INSERT INTO `ysk_layerneeds` VALUES ('1', '0', '0', '1');
INSERT INTO `ysk_layerneeds` VALUES ('2', '10', '10', '2');
INSERT INTO `ysk_layerneeds` VALUES ('3', '20', '12', '3');
INSERT INTO `ysk_layerneeds` VALUES ('4', '30', '16', '4');
INSERT INTO `ysk_layerneeds` VALUES ('5', '40', '20', '5');
INSERT INTO `ysk_layerneeds` VALUES ('6', '50', '30', '6');
INSERT INTO `ysk_layerneeds` VALUES ('7', '60', '400', '7');

-- ----------------------------
-- Table structure for `ysk_level_list`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_level_list`;
CREATE TABLE `ysk_level_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '升级等级',
  `proof` varchar(128) NOT NULL COMMENT '支付凭证',
  `money` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '付款金额',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态0未处理 1已处理 2已取消',
  `time` varchar(12) NOT NULL COMMENT '申请时间',
  `datestr` varchar(16) NOT NULL COMMENT '申请日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ysk_level_list
-- ----------------------------

-- ----------------------------
-- Table structure for `ysk_limit`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_limit`;
CREATE TABLE `ysk_limit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `limit_num` int(11) NOT NULL COMMENT '限制数量',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '按稻草人还是直推会员推荐',
  `level_name` varchar(20) DEFAULT NULL,
  `content` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ysk_limit
-- ----------------------------

-- ----------------------------
-- Table structure for `ysk_member`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_member`;
CREATE TABLE `ysk_member` (
  `member_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '会员表',
  `uname` varchar(11) DEFAULT NULL COMMENT '用户名',
  `fid` int(11) NOT NULL DEFAULT '0' COMMENT '推荐人id',
  `path_id` text NOT NULL COMMENT '团队路径',
  `phone` varchar(11) NOT NULL DEFAULT '0' COMMENT '电话号码',
  `cangkujiwo__jifen` decimal(11,0) NOT NULL DEFAULT '0' COMMENT '仓库鸡窝积分',
  `renqizhinums` int(10) NOT NULL DEFAULT '0' COMMENT '人气值',
  `xiaofei_jifen` decimal(10,0) NOT NULL DEFAULT '0' COMMENT '消费积分',
  `mobile` varchar(11) NOT NULL DEFAULT '0' COMMENT '电话号码',
  `fc` int(11) NOT NULL DEFAULT '0' COMMENT '累计获得风车数',
  `login_count` int(11) NOT NULL DEFAULT '0' COMMENT '登陆次数',
  `last_login_ip` varchar(40) DEFAULT NULL COMMENT '上次登录ip',
  `last_ip_region` varchar(64) DEFAULT NULL COMMENT 'ip指向详细地址',
  `last_login_time` int(11) DEFAULT NULL,
  `session_id` varchar(100) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0->默认,1->冻结',
  `chicken_bili` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '鸡窝拆分率',
  `lenth_layer` int(11) NOT NULL DEFAULT '0' COMMENT '深度',
  `member_grade` tinyint(1) NOT NULL DEFAULT '0' COMMENT '对应用户等级 0普通会员 1体验会员 2钻石会员 3联盟会员  ',
  `member_grade_shoudong` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1默认 2后台已改 3前台受方法影响',
  `api_pay` varchar(30) DEFAULT NULL COMMENT '支付宝账号',
  `wx_name` varchar(30) DEFAULT NULL COMMENT '微信',
  `add_ress` varchar(100) DEFAULT NULL COMMENT '收货地址',
  `farmlink_address` varchar(100) DEFAULT NULL COMMENT '农联币地址',
  `zhuanjia` tinyint(1) NOT NULL DEFAULT '0' COMMENT '专家',
  `guanjia` tinyint(1) NOT NULL DEFAULT '0' COMMENT '管家',
  `pwd` varchar(255) NOT NULL COMMENT '密码',
  `twopass` varchar(255) NOT NULL COMMENT '二级密码',
  `avatar` varchar(50) NOT NULL DEFAULT '1.jpg' COMMENT '头像',
  `create_time` int(11) NOT NULL COMMENT '产生时间',
  `member_directnums` int(11) NOT NULL DEFAULT '0' COMMENT '直推有效人数',
  `team_directnums` int(11) NOT NULL DEFAULT '0' COMMENT '团队有效人数',
  `direct_kaidi` float(11,1) NOT NULL DEFAULT '0.0' COMMENT '我的直推人第一次开地',
  `weiyang_time` date NOT NULL COMMENT '会员喂养时间',
  `weiyang_earns` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT '会员喂养收益',
  `tiaofen_mid` text NOT NULL COMMENT '挑我粪人员会员id',
  `buyu_earns` decimal(11,3) NOT NULL COMMENT '喂鱼收益',
  `buyu_id` text NOT NULL COMMENT '捕鱼id',
  `buyu_time` date NOT NULL COMMENT '捕鱼时间',
  `yangqiji` float(5,2) NOT NULL DEFAULT '0.00' COMMENT '下级购买氧气机+0.1',
  `yangqiji_nums` int(1) NOT NULL DEFAULT '0' COMMENT '氧气机数量 最多5个',
  `music_isplay` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1->播放,2->暂停',
  `yuchang_guanjia` tinyint(1) NOT NULL DEFAULT '0' COMMENT '渔场管家',
  `bankname` varchar(80) NOT NULL DEFAULT '0' COMMENT '开户行',
  `banknumber` varchar(20) NOT NULL DEFAULT '0' COMMENT '银行卡号',
  `chaifen_bili` float(8,4) NOT NULL DEFAULT '0.0000' COMMENT '鸡窝拆分比例',
  `count_time` date NOT NULL COMMENT '计算拆分/收益时间',
  `tiaofen_earns` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT '挑粪收益',
  `guoyuan_earns` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT '果园施肥收益',
  `yuchang_earns` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT '渔场喂鱼收益',
  `guoyuan_chaifen` float(11,3) NOT NULL DEFAULT '0.000' COMMENT '果园拆分',
  `yuchang_chaifen` float(11,3) NOT NULL DEFAULT '0.000' COMMENT '渔场拆分',
  `jiwo_chaifen` float(11,3) NOT NULL DEFAULT '0.000' COMMENT '鸡场拆分率',
  `guoyuan_nextsix` decimal(15,3) NOT NULL DEFAULT '0.000' COMMENT '下6级本金',
  `guoyuan_nextone` decimal(15,3) NOT NULL DEFAULT '0.000' COMMENT '下1级本金',
  `jiaoshuiid` text NOT NULL COMMENT '给我浇水的下级',
  `houtaijibie` tinyint(1) NOT NULL DEFAULT '1' COMMENT '后台设置级别',
  `judian_pic` varchar(40) NOT NULL COMMENT '聚点收款账号',
  `buy_moneys` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '购买总数量',
  `is_dailishang` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1->普通用户,2->代理商,3->大区负责人',
  `is_manager` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为大区负责人0否 1是',
  `is_p_verify` tinyint(1) NOT NULL DEFAULT '0' COMMENT '个人认证 0未认证 1已认证 ',
  `is_e_verify` tinyint(1) NOT NULL COMMENT '企业认证 0未认证 1已认证 ',
  `prov` varchar(64) DEFAULT NULL COMMENT '代理省份',
  `city` varchar(64) DEFAULT NULL COMMENT '代理城市',
  `dl_money` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '代理服务费',
  `tg_money` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '推广金',
  `gl_money` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '管理服务费',
  `team_grade` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户所属团队',
  `dailishang_logo` varchar(256) NOT NULL DEFAULT '1.jpg' COMMENT '商家logo',
  `dailishang_name` varchar(35) NOT NULL COMMENT '商家店铺名',
  PRIMARY KEY (`member_id`) USING BTREE,
  UNIQUE KEY `member_id` (`member_id`) USING BTREE COMMENT 'member_id',
  KEY `fuzhu` (`lenth_layer`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ysk_member
-- ----------------------------

-- ----------------------------
-- Table structure for `ysk_member_jifens`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_member_jifens`;
CREATE TABLE `ysk_member_jifens` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '积分明细表',
  `chicken_jifen` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '鸡窝积分',
  `fish_jifen` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '渔场积分',
  `farm_jifen` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '农场积分',
  `farmlink_jifen` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '农联积分',
  `member_id` int(11) NOT NULL COMMENT '用户id',
  `chicken_earnjifen` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '鸡场总收益',
  `fish_earnjifen` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '渔场总收益',
  `farm_earnjifen` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '农场总收益',
  `xiaofei_jifen` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '消费积分',
  `renqicount` float(11,3) NOT NULL DEFAULT '0.000' COMMENT '人气值',
  `yongjin` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT '分销佣金',
  `daili_yongjin` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT '代理佣金',
  `balance_nums` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT '余额/(区块链使用)',
  `yu_ku` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT '只能用来提现',
  `yuchang_dongjie` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT '渔场摸虾冻结积分',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ysk_member_jifens
-- ----------------------------

-- ----------------------------
-- Table structure for `ysk_menu`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_menu`;
CREATE TABLE `ysk_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '菜单名称',
  `pid` int(11) NOT NULL COMMENT '父级id',
  `gid` int(11) NOT NULL DEFAULT '0' COMMENT '爷爷ID、',
  `col` varchar(30) NOT NULL COMMENT '控制器',
  `act` varchar(30) NOT NULL COMMENT '方法',
  `patch` varchar(50) DEFAULT NULL COMMENT '全路径',
  `level` int(11) NOT NULL COMMENT '级别',
  `icon` varchar(50) DEFAULT NULL,
  `sort` char(4) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=363 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ysk_menu
-- ----------------------------
INSERT INTO `ysk_menu` VALUES ('6', '管理员管理', '3', '1', 'Manage', 'index', '', '2', 'fa fa-cog', '13', '1');
INSERT INTO `ysk_menu` VALUES ('3', '统用功能', '1', '1', '', '', '', '1', 'fa-folder-open-o', '1', '1');
INSERT INTO `ysk_menu` VALUES ('5', '角色管理', '3', '1', 'Group', 'index', '', '2', 'fa-sitemap', '12', '1');
INSERT INTO `ysk_menu` VALUES ('7', '会员管理', '1', '1', '', '', '', '1', 'fa-folder-open-o', '2', '1');
INSERT INTO `ysk_menu` VALUES ('8', '会员列表', '7', '1', 'User', 'index', null, '2', 'fa-user', '21', '1');
INSERT INTO `ysk_menu` VALUES ('9', '推荐结构', '7', '1', 'Tree', 'index', null, '2', 'fa-th-large', '22', '1');
INSERT INTO `ysk_menu` VALUES ('1', '系统', '0', '0', '', '', null, '0', 'fa-cog', '0', '1');
INSERT INTO `ysk_menu` VALUES ('10', '系统记录', '0', '0', '', '', null, '0', 'fa-tasks', '0', '0');
INSERT INTO `ysk_menu` VALUES ('11', '商品管理', '10', '10', '', '', null, '1', 'fa-folder-open-o', '3', '1');
INSERT INTO `ysk_menu` VALUES ('315', '商品列表', '11', '10', 'Good', 'index', null, '2', null, '31', '1');
INSERT INTO `ysk_menu` VALUES ('316', '反馈管理', '1', '1', '', '', null, '1', 'fa-folder-open-o', '4', '1');
INSERT INTO `ysk_menu` VALUES ('331', '游戏币转入', '319', '1', 'BuyNum', 'index', null, '2', 'fa-list', '43', '0');
INSERT INTO `ysk_menu` VALUES ('319', '平台充值管理', '1', '1', '', '', null, '1', 'fa-folder-open-o', '5', '0');
INSERT INTO `ysk_menu` VALUES ('320', '平台充值', '319', '1', 'FruitsManage', 'index', null, '2', 'fa-jpy', '41', '0');
INSERT INTO `ysk_menu` VALUES ('321', '充值流水', '319', '1', 'FruitsDetail', 'index', null, '2', 'fa-list', '42', '0');
INSERT INTO `ysk_menu` VALUES ('322', '关于我们', '1', '1', '', '', null, '1', 'fa-folder-open-o', '6', '1');
INSERT INTO `ysk_menu` VALUES ('323', '系统公告', '322', '1', 'News', 'index', null, '2', 'fa-twitter-square', '51', '1');
INSERT INTO `ysk_menu` VALUES ('324', '交易管理', '10', '10', '', '', '', '1', 'fa-folder-open-o', '7', '1');
INSERT INTO `ysk_menu` VALUES ('325', '定向交易记录', '324', '10', 'Traing', 'index', '', '2', 'fa-list', '61', '1');
INSERT INTO `ysk_menu` VALUES ('328', '转盘记录', '324', '10', 'Traing', 'turntable', '', '2', 'fa-list', '67', '1');
INSERT INTO `ysk_menu` VALUES ('329', '施肥记录', '324', '10', 'Traing', 'growth', '', '2', 'fa-list', '66', '1');
INSERT INTO `ysk_menu` VALUES ('330', '果子转聚宝盆', '319', '1', 'SellNum', 'index', null, '2', 'fa-list', '45', '0');
INSERT INTO `ysk_menu` VALUES ('332', '激活码管理', '1', '1', '', '', null, '1', 'fa-folder-open-o', '8', '0');
INSERT INTO `ysk_menu` VALUES ('333', '激活码列表', '332', '1', 'ActivateNum', 'index', null, '2', 'fa-list', '71', '0');
INSERT INTO `ysk_menu` VALUES ('334', '自由交易记录', '324', '10', 'Traing', 'tradingfree', '', '2', 'fa-list', '62', '1');
INSERT INTO `ysk_menu` VALUES ('335', '轮播管理', '1', '1', '', '', '', '1', 'fa-folder-open-o', '6', '1');
INSERT INTO `ysk_menu` VALUES ('336', '系统轮播', '335', '1', 'Banner', 'index', '', '2', 'fa-twitter-square', '51', '1');
INSERT INTO `ysk_menu` VALUES ('337', '投诉列表', '316', '1', 'Complaint', 'index', null, '2', 'fa-file-text', '33', '1');
INSERT INTO `ysk_menu` VALUES ('339', '后台充值记录', '7', '1', 'User', 'recharge', null, '2', 'fa-list', '99', '0');
INSERT INTO `ysk_menu` VALUES ('341', '游戏道具', '1', '1', '', '', null, '1', 'fa-folder-open-o', '3', '1');
INSERT INTO `ysk_menu` VALUES ('342', '铭文列表', '341', '1', 'Scroll', 'index', null, '2', 'fa-list', '0', '1');
INSERT INTO `ysk_menu` VALUES ('343', '皮肤列表', '341', '1', 'Skin', 'index', null, '2', 'fa-list', '0', '0');
INSERT INTO `ysk_menu` VALUES ('344', '用户等级与直推人数', '7', '1', 'User', 'user_level', null, '2', 'fa-list', '99', '1');
INSERT INTO `ysk_menu` VALUES ('345', '星级达人', '7', '1', 'User', 'user_star', null, '2', 'fa-list', '99', '1');
INSERT INTO `ysk_menu` VALUES ('346', '实名认证', '7', '1', 'UserVerify', 'index', null, '2', 'fa-list', '99', '1');
INSERT INTO `ysk_menu` VALUES ('347', '话费充值', '7', '1', 'Phonerecharge', 'index', null, '2', 'fa-list', '99', '0');
INSERT INTO `ysk_menu` VALUES ('348', '市场设置', '7', '1', 'Market', 'index', null, '2', 'fa-list', '99', '1');
INSERT INTO `ysk_menu` VALUES ('349', '赠送铭文', '7', '1', 'GiftScroll', 'index', null, '2', 'fa-list', '99', '1');
INSERT INTO `ysk_menu` VALUES ('350', '交易列表', '7', '1', 'User', 'deal', null, '2', 'fa-list', '99', '1');
INSERT INTO `ysk_menu` VALUES ('351', '投诉列表', '7', '1', 'UserCompla', 'index', null, '2', 'fa-list', '99', '1');
INSERT INTO `ysk_menu` VALUES ('4', '系统配置', '3', '1', 'Config', 'group', '', '2', 'fa-wrench', '11', '1');
INSERT INTO `ysk_menu` VALUES ('352', '发布申请列表', '7', '1', 'UserVerify', 'upload_list', null, '2', 'fa-list', '99', '1');
INSERT INTO `ysk_menu` VALUES ('353', '关于北斗', '322', '1', 'AboutMe', 'index', null, '2', 'fa-file-text', '1', '1');
INSERT INTO `ysk_menu` VALUES ('354', '用户协议', '322', '1', 'AboutMe', 'xieyi', null, '2', 'fa-file-text', '2', '1');
INSERT INTO `ysk_menu` VALUES ('355', '用户隐私协议', '322', '1', 'AboutMe', 'yinsixieyi', null, '2', 'fa-file-text', '2', '1');
INSERT INTO `ysk_menu` VALUES ('356', '二级认证', '7', '1', 'UserVerify', 'two_verify', null, '2', 'fa-list', '99', '1');
INSERT INTO `ysk_menu` VALUES ('357', '用户铭文', '341', '1', 'Scroll', 'user_scroll', null, '2', 'fa-list', '1', '1');
INSERT INTO `ysk_menu` VALUES ('358', '用户明细', '341', '1', 'Scroll', 'user_changes', null, '2', 'fa-list', '2', '1');
INSERT INTO `ysk_menu` VALUES ('359', '视频列表', '341', '1', 'Video', 'user_video', null, '2', 'fa-list', '3', '1');
INSERT INTO `ysk_menu` VALUES ('360', '后台充值记录', '7', '1', 'User', 'htrecharge', null, '2', 'fa-list', '0', '1');
INSERT INTO `ysk_menu` VALUES ('361', '视频分类', '341', '1', 'Video', 'video_category', null, '2', 'fa-list', '4', '1');
INSERT INTO `ysk_menu` VALUES ('362', '手续费列表', '341', '1', 'Scroll', 'poundage_list', null, '2', 'fa-list', '4', '1');

-- ----------------------------
-- Table structure for `ysk_moneyils`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_moneyils`;
CREATE TABLE `ysk_moneyils` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pay_id` int(10) NOT NULL COMMENT '付钱会员id',
  `get_id` int(10) NOT NULL COMMENT '拿钱id',
  `get_nums` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '拿钱数量',
  `get_level` int(2) NOT NULL DEFAULT '0' COMMENT '第几代拿钱',
  `get_types` int(2) NOT NULL DEFAULT '0' COMMENT '1->转账三级分销，2->余额转积分三级分销',
  `get_time` char(30) NOT NULL DEFAULT '0' COMMENT '拿钱时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1036 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- ----------------------------
-- Records of ysk_moneyils
-- ----------------------------

-- ----------------------------
-- Table structure for `ysk_news`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_news`;
CREATE TABLE `ysk_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '文章标题',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '文章图片',
  `sort` smallint(6) NOT NULL DEFAULT '0',
  `desc` varchar(255) NOT NULL DEFAULT '',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `is_out` tinyint(4) NOT NULL DEFAULT '0',
  `content` text NOT NULL COMMENT '内容',
  `from` varchar(255) NOT NULL DEFAULT '' COMMENT '文章来源',
  `visit` smallint(6) NOT NULL DEFAULT '0',
  `lang` tinyint(4) NOT NULL DEFAULT '0',
  `tuijian` tinyint(4) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL COMMENT '类型:1公告，2帮助中心',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=121 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统公告';

-- ----------------------------
-- Records of ysk_news
-- ----------------------------
INSERT INTO `ysk_news` VALUES ('119', '公告标题', '', '0', '', '1589780866', '0', '公告内容', '', '0', '0', '0', '1');
INSERT INTO `ysk_news` VALUES ('120', '第二条系统公告', '', '0', '', '1589781919', '0', '&lt;span style=&quot;font-size:13.3333px;&quot;&gt;内容content&lt;/span&gt;&lt;span style=&quot;font-size:13.3333px;&quot;&gt;内容content&lt;/span&gt;&lt;span style=&quot;font-size:13.3333px;&quot;&gt;内容content&lt;/span&gt;&lt;span style=&quot;font-size:13.3333px;&quot;&gt;内容content&lt;/span&gt;&lt;span style=&quot;font-size:13.3333px;&quot;&gt;内容content&lt;/span&gt;&lt;span style=&quot;font-size:13.3333px;&quot;&gt;内容content&lt;/span&gt;&lt;span style=&quot;font-size:13.3333px;&quot;&gt;内容content&lt;/span&gt;&lt;span style=&quot;font-size:13.3333px;&quot;&gt;内容content&lt;/span&gt;&lt;span style=&quot;font-size:13.3333px;&quot;&gt;内容content&lt;/span&gt;&lt;span style=&quot;font-size:13.3333px;&quot;&gt;内容content&lt;/span&gt;&lt;span style=&quot;font-size:13.3333px;&quot;&gt;内容content&lt;/span&gt;', '', '0', '0', '0', '1');

-- ----------------------------
-- Table structure for `ysk_notice`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_notice`;
CREATE TABLE `ysk_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notice_tittle` varchar(80) NOT NULL COMMENT '公告标题',
  `notice_content` varchar(600) NOT NULL COMMENT '公告详情',
  `notice_addtime` varchar(20) NOT NULL COMMENT '公告添加时间',
  `notice_read` text NOT NULL COMMENT '看过公告会员',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ysk_notice
-- ----------------------------
INSERT INTO `ysk_notice` VALUES ('8', '这是最新公告', '最新公告', '1556847300', '');

-- ----------------------------
-- Table structure for `ysk_notice_message`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_notice_message`;
CREATE TABLE `ysk_notice_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `formid` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT '0' COMMENT '0未读',
  `type` int(1) DEFAULT NULL COMMENT '1@；2赞；3评论',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ysk_notice_message
-- ----------------------------
INSERT INTO `ysk_notice_message` VALUES ('14', '58', '0', '8936', '666', '1590807446', '0', '1');
INSERT INTO `ysk_notice_message` VALUES ('15', '58', '8936', '8936', '666', '1590807446', '0', '3');
INSERT INTO `ysk_notice_message` VALUES ('16', '58', '0', '8936', '999', '1591003911', '0', '1');
INSERT INTO `ysk_notice_message` VALUES ('17', '58', '8936', '8936', '999', '1591003911', '0', '3');
INSERT INTO `ysk_notice_message` VALUES ('18', '58', '0', '8936', '888', '1591003922', '0', '1');
INSERT INTO `ysk_notice_message` VALUES ('19', '58', '8936', '8936', '888', '1591003922', '0', '3');
INSERT INTO `ysk_notice_message` VALUES ('20', '65', '8803', '8946', null, '1591011265', '0', '2');
INSERT INTO `ysk_notice_message` VALUES ('21', '65', '8803', '8946', null, '1591018747', '0', '2');

-- ----------------------------
-- Table structure for `ysk_nzbill`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_nzbill`;
CREATE TABLE `ysk_nzbill` (
  `bill_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '明细id',
  `bill_uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `bill_num` decimal(10,1) NOT NULL DEFAULT '0.0' COMMENT '财富币',
  `bill_reason` char(20) NOT NULL COMMENT '生成的原因',
  `bill_time` int(11) NOT NULL DEFAULT '0' COMMENT '生成时间',
  `bill_name` varchar(50) DEFAULT NULL,
  `bill_type` char(1) NOT NULL COMMENT '0-扣除 1-获得',
  `bill_username` varchar(20) DEFAULT NULL,
  `bill_account` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`bill_id`) USING BTREE,
  KEY `bill_userid` (`bill_uid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=295 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='转盘抽奖';

-- ----------------------------
-- Records of ysk_nzbill
-- ----------------------------

-- ----------------------------
-- Table structure for `ysk_nzletter`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_nzletter`;
CREATE TABLE `ysk_nzletter` (
  `letter_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '站内信id',
  `send_id` int(11) DEFAULT NULL COMMENT '发件人id',
  `recipient_id` int(11) DEFAULT NULL COMMENT '收件人id',
  `title` char(50) DEFAULT NULL COMMENT '信件标题',
  `content` text COMMENT '信件内容',
  `time` int(11) DEFAULT NULL COMMENT '时间',
  `status` tinyint(1) DEFAULT '0' COMMENT '0未读，1已读',
  `img` varchar(225) NOT NULL,
  `reply` text NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `account` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`letter_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ysk_nzletter
-- ----------------------------

-- ----------------------------
-- Table structure for `ysk_nzusfarm`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_nzusfarm`;
CREATE TABLE `ysk_nzusfarm` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '农田id',
  `uid` int(10) unsigned NOT NULL COMMENT '用户ID',
  `f_id` int(10) unsigned NOT NULL COMMENT '用户自己的农田ID号 1-15',
  `farm_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '农田类型id 1普通矿车 2银矿车 3-金矿车',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '显示图片 0地 1树 2果子3死亡',
  `seeds` decimal(13,2) NOT NULL COMMENT '本金',
  `fruits` decimal(13,2) NOT NULL COMMENT '果子数量',
  `income` decimal(13,2) NOT NULL DEFAULT '0.00' COMMENT '收益累计 本金的10配枯死',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `f_id` (`f_id`) USING BTREE,
  KEY `farm_type` (`farm_type`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2149 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- ----------------------------
-- Records of ysk_nzusfarm
-- ----------------------------

-- ----------------------------
-- Table structure for `ysk_opesfarms`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_opesfarms`;
CREATE TABLE `ysk_opesfarms` (
  `id` varchar(11) NOT NULL COMMENT '系统土地操作表',
  `farm_type` tinyint(1) NOT NULL COMMENT '1->鸡窝 2->果园 3->渔场',
  `from_uid` varchar(0) NOT NULL COMMENT '被操作id',
  `ope_uid` varchar(0) NOT NULL COMMENT '操作id',
  `ope_nums` decimal(11,3) NOT NULL COMMENT '操作数量',
  `ope_types` int(2) NOT NULL COMMENT '具体操作',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ysk_opesfarms
-- ----------------------------

-- ----------------------------
-- Table structure for `ysk_opetypes`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_opetypes`;
CREATE TABLE `ysk_opetypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '自己id',
  `fid` int(11) NOT NULL COMMENT '触发人id',
  `ope_nums` decimal(9,2) NOT NULL DEFAULT '0.00' COMMENT '动作触发数量',
  `ope_date` date NOT NULL COMMENT '操作时间',
  `ope_type` int(2) NOT NULL COMMENT '操作类型:1开窝 2清扫 3收货 4清窝 5喂养 6挑粪 7获得风车 8获得管家 9获得专家 10购买一键挑粪 11冻结积分',
  `ope_farm` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1鸡窝 2果园 3渔场',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- ----------------------------
-- Records of ysk_opetypes
-- ----------------------------

-- ----------------------------
-- Table structure for `ysk_opinions`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_opinions`;
CREATE TABLE `ysk_opinions` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `contents` text NOT NULL,
  `plansimg` char(50) NOT NULL,
  `add_time` datetime NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '意见处理状态默认是0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ysk_opinions
-- ----------------------------

-- ----------------------------
-- Table structure for `ysk_order`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_order`;
CREATE TABLE `ysk_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '购买商品订单id',
  `order_no` varchar(225) NOT NULL COMMENT '订单号',
  `uid` int(11) NOT NULL COMMENT '购买者id',
  `total_yf` decimal(11,1) DEFAULT NULL COMMENT '总运费',
  `buy_price` decimal(11,2) DEFAULT NULL COMMENT '购买总价',
  `time` int(11) NOT NULL COMMENT '下单时间',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '订单状态 0未支付 1已支付 2已发货  3交易完成(已收货)',
  `buy_name` varchar(50) NOT NULL COMMENT '收货人',
  `buy_phone` char(12) NOT NULL COMMENT '收货人手机号码',
  `buy_address` varchar(255) NOT NULL COMMENT '收货地址',
  `pay_time` int(11) DEFAULT NULL COMMENT '付款时间',
  `pay_type` varchar(20) DEFAULT '' COMMENT '支付方式 1Vpay 2微信 3支付宝 4网银',
  `is_show` tinyint(1) DEFAULT '1' COMMENT '0-删除 1-显示 只用于客户端',
  `pay_money` decimal(11,2) DEFAULT NULL COMMENT '实际支付金额',
  `kd_name` varchar(64) DEFAULT NULL COMMENT '快递公司',
  `kd_no` varchar(30) DEFAULT NULL COMMENT '快递订单号',
  `remark` varchar(225) DEFAULT NULL COMMENT '备注',
  `trade_no` varchar(50) DEFAULT NULL COMMENT '交易订单号',
  `kd_type` varchar(66) DEFAULT NULL COMMENT '快递类型',
  `xiaofei_jifen` decimal(11,0) DEFAULT '0' COMMENT '消费积分积分总共可使用',
  `jifen_yu` decimal(11,0) NOT NULL DEFAULT '0' COMMENT '渔场积分',
  `jifen_ji` decimal(11,0) NOT NULL DEFAULT '0' COMMENT '总共可赠送鸡场积分',
  `jifen_guoyuan` decimal(11,0) DEFAULT '0' COMMENT '果园积分',
  `sanji_money` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '订单所有可三级分销的钱',
  `is_duobao` tinyint(1) DEFAULT '1' COMMENT '1->普通订单,2->夺宝订单',
  `seluid` int(11) DEFAULT '0' COMMENT '竞标选中uid',
  `order_proof` varchar(164) DEFAULT NULL COMMENT '收款凭证',
  `order_sellerid` int(11) NOT NULL DEFAULT '0' COMMENT '商家UID',
  `order_relation` varchar(255) DEFAULT NULL COMMENT '关联订单',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=454 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='购买商品表';

-- ----------------------------
-- Records of ysk_order
-- ----------------------------

-- ----------------------------
-- Table structure for `ysk_order_detail`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_order_detail`;
CREATE TABLE `ysk_order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `com_id` int(11) NOT NULL COMMENT '商品ID',
  `com_name` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '商品名称',
  `com_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '购买产品价格',
  `com_num` int(11) NOT NULL COMMENT '产品数量',
  `com_img` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `com_cs` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '商品参数',
  `is_comment` tinyint(1) DEFAULT '0' COMMENT '是否已评论 0-未评论 1-已评论',
  `com_shoptype` int(15) DEFAULT NULL COMMENT '商品所属',
  `size` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '商品尺寸',
  `color` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '商品颜色',
  `xiaofei_jifen` decimal(50,0) NOT NULL DEFAULT '0' COMMENT '可使用消费积分',
  `jifen_nums` decimal(11,0) DEFAULT '0' COMMENT '赠送数量(渔场鸡场果园)',
  `jifen_types` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '1-鸡场积分,2-果园积分,3-渔场积分',
  `buy_num` int(11) NOT NULL DEFAULT '0' COMMENT '购买次数',
  `sanji_money` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '商品可参与三级分销的钱',
  `shangjia` int(11) NOT NULL COMMENT '商家id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `jiesuan_price` decimal(11,0) NOT NULL DEFAULT '0' COMMENT '结算价',
  `express_order` decimal(20,0) DEFAULT NULL COMMENT '发货订单号',
  `express_name` varchar(80) CHARACTER SET utf8 DEFAULT NULL COMMENT '快递公司名称',
  `goods_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1->未付款,2->以付款,3->以发货,4-以签收',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=343 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ysk_order_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `ysk_poundage`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_poundage`;
CREATE TABLE `ysk_poundage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `orderid` int(11) NOT NULL COMMENT '订单id',
  `num` decimal(4,0) NOT NULL COMMENT '慈点数量',
  `createtime` varchar(255) NOT NULL COMMENT '插入时间',
  `oktime` varchar(255) NOT NULL COMMENT '订单完成时间',
  `state` int(11) NOT NULL COMMENT '手续费状态0->交易中1->已取消2->已完成',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ysk_poundage
-- ----------------------------
INSERT INTO `ysk_poundage` VALUES ('2', '8803', '708', '27', '1592558007', '', '1');
INSERT INTO `ysk_poundage` VALUES ('3', '8803', '708', '27', '1592558435', '', '1');
INSERT INTO `ysk_poundage` VALUES ('4', '8936', '709', '27', '1592558634', '', '2');
INSERT INTO `ysk_poundage` VALUES ('5', '8936', '710', '27', '1592559134', '', '1');
INSERT INTO `ysk_poundage` VALUES ('6', '8936', '710', '27', '1592559300', '', '2');
INSERT INTO `ysk_poundage` VALUES ('7', '8803', '711', '3', '1592623487', '1592624003', '2');
INSERT INTO `ysk_poundage` VALUES ('8', '8936', '712', '9', '1592623942', '1592624003', '2');

-- ----------------------------
-- Table structure for `ysk_preventip`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_preventip`;
CREATE TABLE `ysk_preventip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(20) NOT NULL,
  `time` varchar(30) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ysk_preventip
-- ----------------------------

-- ----------------------------
-- Table structure for `ysk_product_cate`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_product_cate`;
CREATE TABLE `ysk_product_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `name` varchar(50) NOT NULL COMMENT '分类名称',
  `tag` varchar(120) DEFAULT NULL COMMENT '标签',
  `pic` varchar(124) NOT NULL COMMENT '分类图片',
  `is_tui` tinyint(2) DEFAULT '0' COMMENT '是否推荐(0否 1是)',
  `is_hot` tinyint(2) DEFAULT '0' COMMENT '是否热门(0 否 1是)',
  `sort` tinyint(5) DEFAULT '0' COMMENT '商品排序',
  `pic1` varchar(255) DEFAULT NULL COMMENT '轮播图1',
  `pic2` varchar(255) DEFAULT NULL COMMENT '轮播图2',
  `pic3` varchar(255) DEFAULT NULL COMMENT '轮播图3',
  `pic4` varchar(255) DEFAULT NULL COMMENT '轮播图4',
  `pic5` varchar(255) DEFAULT NULL COMMENT '轮播图5',
  `ctime` varchar(11) DEFAULT NULL COMMENT '添加时间',
  `is_activity` tinyint(2) DEFAULT '0' COMMENT '是否活动0否1是',
  `status` tinyint(2) DEFAULT NULL COMMENT '状态',
  `is_duobao` tinyint(1) NOT NULL DEFAULT '1' COMMENT '2一元夺宝分类',
  `type` int(2) DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ysk_product_cate
-- ----------------------------
INSERT INTO `ysk_product_cate` VALUES ('5', '0', '服饰', 'test', '/Uploads/image/touxiang/2017-12-27/5a43124b316c1.png', '0', '0', '0', null, null, null, null, null, '1508125176', '0', null, '1', '1');
INSERT INTO `ysk_product_cate` VALUES ('8', '0', '餐饮', 'test', '/Uploads/image/touxiang/2017-12-27/5a43126bd052b.png', '0', '0', '0', null, null, null, null, null, '1508125567', '0', null, '1', '2');
INSERT INTO `ysk_product_cate` VALUES ('15', '0', '酒店', 'test', '/Uploads/image/touxiang/2017-12-27/5a43128769fdb.png', '0', '0', '0', null, null, null, null, null, '1508513711', '0', null, '1', '3');
INSERT INTO `ysk_product_cate` VALUES ('16', '0', '旅游', 'test', '/Uploads/image/touxiang/2017-12-27/5a4312a06ba97.png', '0', '0', '0', null, null, null, null, null, '1508513760', '0', null, '1', '4');
INSERT INTO `ysk_product_cate` VALUES ('22', '0', '科技', 'test', '/Uploads/image/touxiang/2017-12-27/5a4312b7ba490.png', '0', '0', '0', null, null, null, null, null, '1508515392', '0', null, '1', '5');
INSERT INTO `ysk_product_cate` VALUES ('23', '0', '养生', 'test', '/Uploads/image/touxiang/2017-12-27/5a4312d6381f6.png', '0', '0', '0', null, null, null, null, null, '1508515569', '0', null, '1', '6');
INSERT INTO `ysk_product_cate` VALUES ('24', '0', '美容', 'test', '/Uploads/image/touxiang/2017-12-27/5a4312e50c2f0.png', '0', '0', '0', null, null, null, null, null, '1508515811', '0', null, '1', '7');
INSERT INTO `ysk_product_cate` VALUES ('25', '0', '特产', 'test', '/Uploads/image/touxiang/2017-12-27/5a4312f3c526a.png', '0', '0', '0', null, null, null, null, null, '1508516000', '0', null, '1', '8');
INSERT INTO `ysk_product_cate` VALUES ('35', '0', '生鲜', null, '/Uploads/image/touxiang/2017-12-27/5a43131342991.png', '0', '0', '0', null, null, null, null, null, '1510280398', '0', null, '1', '9');
INSERT INTO `ysk_product_cate` VALUES ('36', '0', '其它', null, '/Uploads/image/touxiang/2017-12-27/5a431328ed687.png', '0', '0', '0', null, null, null, null, null, '1510280422', '0', null, '1', '10');

-- ----------------------------
-- Table structure for `ysk_product_detail`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_product_detail`;
CREATE TABLE `ysk_product_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `type_id` int(11) DEFAULT NULL COMMENT '类型ID',
  `name` varchar(120) NOT NULL COMMENT '商品名',
  `s_desc` text COMMENT '商品描述',
  `price` decimal(8,0) NOT NULL COMMENT '现价',
  `old_price` decimal(8,2) DEFAULT NULL COMMENT '原价',
  `buy_num` int(11) DEFAULT '0' COMMENT '付款人数',
  `pic` varchar(160) NOT NULL COMMENT '商品封面图',
  `pic1` varchar(160) DEFAULT NULL COMMENT '轮播图1',
  `pic2` varchar(160) DEFAULT NULL COMMENT '轮播图2',
  `pic3` varchar(160) DEFAULT NULL COMMENT '轮播图3',
  `pic4` varchar(160) DEFAULT NULL COMMENT '轮播图4',
  `pic5` varchar(160) DEFAULT NULL COMMENT '轮播图5',
  `freight` decimal(8,2) DEFAULT '0.00' COMMENT '运费',
  `address` varchar(50) DEFAULT NULL COMMENT '发货地址',
  `ctime` int(11) DEFAULT NULL COMMENT '添加时间',
  `is_sort` tinyint(5) DEFAULT '0' COMMENT '排序',
  `is_hot` tinyint(2) DEFAULT '1' COMMENT '是否热门',
  `color_cate` varchar(250) DEFAULT NULL COMMENT '颜色',
  `csize` varchar(250) DEFAULT NULL COMMENT '尺码',
  `stock` int(11) DEFAULT NULL COMMENT '库存',
  `praise_num` int(11) DEFAULT '0' COMMENT '点赞人数',
  `content` text COMMENT '商品详情',
  `status` tinyint(1) DEFAULT '1' COMMENT '是否启用0否1是',
  `jifen_nums` decimal(11,0) NOT NULL DEFAULT '0' COMMENT '积分数量',
  `jifen_type` varchar(25) DEFAULT NULL COMMENT '积分类型1:鸡场积分 2:果园积分 3:渔场积分',
  `xiaofei_bili` int(9) DEFAULT '10' COMMENT '消费积分使用比例',
  `is_duobao` tinyint(1) DEFAULT '1' COMMENT '1->普通商品,2->一元夺宝',
  `kaijiang_nums` int(11) DEFAULT '0' COMMENT '达到多少数量开奖',
  `sanji_use` int(8) DEFAULT '1' COMMENT '三级使用比例',
  `shangjia` int(11) NOT NULL DEFAULT '0' COMMENT '上传用户id默认为0',
  `seluid` int(11) DEFAULT NULL COMMENT '竞标选中uid',
  `count_price` decimal(11,2) DEFAULT '0.00' COMMENT '结算价格',
  `producs_pingjia` text COMMENT '商品评价',
  `gr_hot` int(1) NOT NULL DEFAULT '0' COMMENT '个人店铺-1-火热0-普通',
  `gr_new` int(1) NOT NULL DEFAULT '0' COMMENT '个人店铺-1-最新0-普通',
  `gr_tuijian` int(1) NOT NULL DEFAULT '0' COMMENT '个人店铺-1-推荐0-普通',
  `is_new` int(1) NOT NULL DEFAULT '1' COMMENT '是否最新',
  `is_tuijian` int(1) NOT NULL DEFAULT '1' COMMENT '是否推荐',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=190 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ysk_product_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `ysk_proxy`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_proxy`;
CREATE TABLE `ysk_proxy` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `province` int(11) NOT NULL COMMENT '省份',
  `city` int(11) NOT NULL COMMENT '城市',
  `time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- ----------------------------
-- Records of ysk_proxy
-- ----------------------------

-- ----------------------------
-- Table structure for `ysk_push`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_push`;
CREATE TABLE `ysk_push` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '接收者',
  `content` varchar(255) DEFAULT NULL COMMENT '推送内容',
  `formid` int(11) DEFAULT NULL COMMENT '推送者',
  `time` int(11) DEFAULT NULL COMMENT '推送时间',
  `type` int(1) DEFAULT NULL COMMENT '1=>@；2=>赞；3=>评论',
  `video_id` int(11) DEFAULT NULL COMMENT '视频ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ysk_push
-- ----------------------------

-- ----------------------------
-- Table structure for `ysk_scroll`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_scroll`;
CREATE TABLE `ysk_scroll` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL COMMENT '卷轴名称',
  `active` int(11) NOT NULL COMMENT '购买增加的活跃度',
  `sell_num` decimal(11,2) NOT NULL COMMENT '购买的灵石数量',
  `single_num` decimal(11,2) NOT NULL COMMENT '单生产量',
  `reward_num` decimal(11,2) NOT NULL COMMENT '预计奖励灵石',
  `max_day` int(11) NOT NULL COMMENT '最大运行时间',
  `max_size` int(11) NOT NULL COMMENT '最多使用数量',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态:0禁用,1正常',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='卷轴';

-- ----------------------------
-- Records of ysk_scroll
-- ----------------------------
INSERT INTO `ysk_scroll` VALUES ('1', '初级慈场', '1', '10.00', '0.33', '10.00', '30', '1', '1');
INSERT INTO `ysk_scroll` VALUES ('2', '微型慈场', '1', '10.00', '0.33', '10.00', '30', '1', '1');
INSERT INTO `ysk_scroll` VALUES ('3', '小型慈场', '10', '100.00', '4.37', '131.00', '30', '5', '1');
INSERT INTO `ysk_scroll` VALUES ('6', '高级慈场', '300', '3000.00', '134.00', '4020.00', '30', '1', '1');
INSERT INTO `ysk_scroll` VALUES ('5', '大型慈场', '100', '1000.00', '0.00', '1330.00', '30', '2', '1');
INSERT INTO `ysk_scroll` VALUES ('4', '中型慈场', '50', '500.00', '0.00', '660.00', '30', '3', '1');
INSERT INTO `ysk_scroll` VALUES ('7', '超级慈场', '500', '5000.00', '225.00', '6750.00', '30', '1', '1');
INSERT INTO `ysk_scroll` VALUES ('24', '全球合伙人', '1000', '10000.00', '0.00', '13700.00', '30', '1', '0');

-- ----------------------------
-- Table structure for `ysk_seed_to_fruit`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_seed_to_fruit`;
CREATE TABLE `ysk_seed_to_fruit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `num` int(11) NOT NULL COMMENT '总种子数量',
  `fee` decimal(14,2) NOT NULL COMMENT '手续费',
  `create_time` int(11) NOT NULL,
  `fruit` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '扣除手续费后的数量',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- ----------------------------
-- Records of ysk_seed_to_fruit
-- ----------------------------

-- ----------------------------
-- Table structure for `ysk_shifeijl`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_shifeijl`;
CREATE TABLE `ysk_shifeijl` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '施肥表id ',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `shifei_num` decimal(13,2) NOT NULL COMMENT '施肥数量',
  `farm_id` int(11) NOT NULL COMMENT '农田id',
  `tudi_type` tinyint(4) NOT NULL COMMENT '土地类型:1黄土地，2红土地，3黑土地',
  `shifei_time` int(11) NOT NULL COMMENT '施肥时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=458 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- ----------------------------
-- Records of ysk_shifeijl
-- ----------------------------

-- ----------------------------
-- Table structure for `ysk_shouge`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_shouge`;
CREATE TABLE `ysk_shouge` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '收割表id主键',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `farm_id` int(11) NOT NULL COMMENT '农田id',
  `farm_type` tinyint(4) NOT NULL COMMENT '农田类型：1黄土地 2.红土地 3黑土地',
  `shouge_num` decimal(13,2) NOT NULL COMMENT '收割数量',
  `shouge_time` int(11) NOT NULL COMMENT '收割时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=688 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- ----------------------------
-- Records of ysk_shouge
-- ----------------------------

-- ----------------------------
-- Table structure for `ysk_sign_in`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_sign_in`;
CREATE TABLE `ysk_sign_in` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `get_num` decimal(11,2) DEFAULT NULL COMMENT '今日签到金额',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ysk_sign_in
-- ----------------------------
INSERT INTO `ysk_sign_in` VALUES ('3', '8937', '清晨醒来打开窗，心情美美哒', '1590825003', '2.55');
INSERT INTO `ysk_sign_in` VALUES ('4', '8936', '早起的鸟儿有虫吃', '1590832231', '2.55');
INSERT INTO `ysk_sign_in` VALUES ('5', '8937', '新的一天，加油加油加油', '1590973914', '2.55');
INSERT INTO `ysk_sign_in` VALUES ('6', '8936', '123123123', '1590974457', '2.55');
INSERT INTO `ysk_sign_in` VALUES ('7', '8936', '666666', '1591067144', '2.55');
INSERT INTO `ysk_sign_in` VALUES ('8', '8937', '548465484', '1591069487', '2.55');
INSERT INTO `ysk_sign_in` VALUES ('10', '8953', '12312313', '1591867565', '4.70');
INSERT INTO `ysk_sign_in` VALUES ('11', '8954', '12312313', '1591868148', '0.33');
INSERT INTO `ysk_sign_in` VALUES ('12', '8956', '123123123', '1591869009', '0.33');
INSERT INTO `ysk_sign_in` VALUES ('13', '8957', '123123123', '1591869038', '0.33');
INSERT INTO `ysk_sign_in` VALUES ('14', '8803', '123123123', '1591945970', '0.33');
INSERT INTO `ysk_sign_in` VALUES ('15', '8803', '哈哈哈哈哈哈', '1592293676', '359.76');
INSERT INTO `ysk_sign_in` VALUES ('16', '8936', '啊啊啊啊啊啊啊啊啊啊啊', '1592293696', '3.54');

-- ----------------------------
-- Table structure for `ysk_skin`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_skin`;
CREATE TABLE `ysk_skin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL COMMENT '皮肤名称',
  `sell_num` decimal(10,2) NOT NULL,
  `lingshi_plus` int(11) NOT NULL COMMENT '皮肤灵石加成',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：0,禁止,1,正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='皮肤表';

-- ----------------------------
-- Records of ysk_skin
-- ----------------------------
INSERT INTO `ysk_skin` VALUES ('1', '皮肤', '10.00', '1', '1');

-- ----------------------------
-- Table structure for `ysk_steal_detail`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_steal_detail`;
CREATE TABLE `ysk_steal_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '种子奖励表id  ',
  `uid` int(11) unsigned NOT NULL COMMENT '用户id',
  `num` char(20) NOT NULL COMMENT '推荐人id',
  `fid` int(11) NOT NULL COMMENT '种子数量',
  `create_time` int(11) NOT NULL COMMENT '奖励时间',
  `type_name` varchar(20) NOT NULL COMMENT '状态',
  `username` varchar(20) DEFAULT NULL,
  `account` varchar(50) DEFAULT NULL,
  `datestr` varchar(20) NOT NULL DEFAULT '',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '0-取偷 1-被偷',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=928 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ysk_steal_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `ysk_store`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_store`;
CREATE TABLE `ysk_store` (
  `uid` int(11) unsigned NOT NULL COMMENT '用户id',
  `cangku_num` decimal(13,5) NOT NULL DEFAULT '0.00000' COMMENT '钱包余额',
  `fengmi_num` decimal(13,5) NOT NULL DEFAULT '0.00000' COMMENT '积分',
  `plant_num` decimal(13,4) NOT NULL DEFAULT '0.0000' COMMENT '播种总数',
  `huafei_total` decimal(13,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '施肥累计',
  `vip_grade` tinyint(1) DEFAULT '0' COMMENT '0：体验会员，1普通会员，2：蓝钻会员，3：金钻会员，4：VIP  会员',
  `add_or_reduce` tinyint(1) DEFAULT '0' COMMENT 'vip_grade升降',
  `exp` decimal(13,2) NOT NULL DEFAULT '0.00' COMMENT '经验值',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- ----------------------------
-- Records of ysk_store
-- ----------------------------
INSERT INTO `ysk_store` VALUES ('8803', '10.00000', '1450.00000', '0.0000', '10.00', '0', '0', '50.00');
INSERT INTO `ysk_store` VALUES ('8936', '10.00000', '1100.00000', '0.0000', '10.00', '0', '0', '10.00');
INSERT INTO `ysk_store` VALUES ('8937', '10.00000', '1100.00000', '0.0000', '10.00', '0', '0', '90.00');
INSERT INTO `ysk_store` VALUES ('8946', '0.00000', '1000.00000', '0.0000', '0.00', '0', '0', '1000.00');
INSERT INTO `ysk_store` VALUES ('8947', '0.00000', '1000.00000', '0.0000', '0.00', '0', '0', '10.00');
INSERT INTO `ysk_store` VALUES ('8948', '0.00000', '1000.00000', '0.0000', '0.00', '0', '0', '0.00');
INSERT INTO `ysk_store` VALUES ('8949', '0.00000', '1000.00000', '0.0000', '0.00', '0', '0', '10.00');
INSERT INTO `ysk_store` VALUES ('8950', '0.00000', '1000.00000', '0.0000', '0.00', '0', '0', '0.00');
INSERT INTO `ysk_store` VALUES ('8951', '0.00000', '1000.00000', '0.0000', '0.00', '0', '0', '0.00');
INSERT INTO `ysk_store` VALUES ('8952', '0.00000', '1050.00000', '0.0000', '0.00', '0', '0', '10.00');
INSERT INTO `ysk_store` VALUES ('8953', '0.00000', '1000.00000', '0.0000', '0.00', '0', '0', '10.00');
INSERT INTO `ysk_store` VALUES ('8954', '0.00000', '1050.00000', '0.0000', '0.00', '0', '0', '10.00');
INSERT INTO `ysk_store` VALUES ('8955', '0.00000', '1000.00000', '0.0000', '0.00', '0', '0', '0.00');
INSERT INTO `ysk_store` VALUES ('8956', '0.00000', '1050.00000', '0.0000', '0.00', '0', '0', '20.00');
INSERT INTO `ysk_store` VALUES ('8957', '0.00000', '1000.00000', '0.0000', '0.00', '0', '0', '10.00');
INSERT INTO `ysk_store` VALUES ('8958', '0.00000', '1000.00000', '0.0000', '0.00', '0', '0', '10.00');
INSERT INTO `ysk_store` VALUES ('8959', '0.00000', '1000.00000', '0.0000', '0.00', '0', '0', '10.00');
INSERT INTO `ysk_store` VALUES ('8960', '0.00000', '1000.00000', '0.0000', '0.00', '0', '0', '10.00');
INSERT INTO `ysk_store` VALUES ('8961', '0.00000', '1000.00000', '0.0000', '0.00', '0', '0', '0.00');
INSERT INTO `ysk_store` VALUES ('8962', '0.00000', '1000.00000', '0.0000', '0.00', '0', '0', '0.00');

-- ----------------------------
-- Table structure for `ysk_tcp_config`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_tcp_config`;
CREATE TABLE `ysk_tcp_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '挑粪/采蜜/扑鱼设置表',
  `farm_type` tinyint(1) NOT NULL COMMENT '1->鸡窝挑粪设置,2->渔场扑鱼设置,3->果园好友',
  `dai_dets` int(2) NOT NULL COMMENT '对应第几代',
  `earns_bili` float(10,2) NOT NULL COMMENT '可拿收益比例',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ysk_tcp_config
-- ----------------------------
INSERT INTO `ysk_tcp_config` VALUES ('1', '1', '1', '0.07');
INSERT INTO `ysk_tcp_config` VALUES ('2', '1', '2', '0.05');
INSERT INTO `ysk_tcp_config` VALUES ('3', '1', '3', '0.03');
INSERT INTO `ysk_tcp_config` VALUES ('4', '3', '3', '0.05');
INSERT INTO `ysk_tcp_config` VALUES ('5', '3', '4', '0.03');

-- ----------------------------
-- Table structure for `ysk_tixian`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_tixian`;
CREATE TABLE `ysk_tixian` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '订单号',
  `member_id` int(11) NOT NULL COMMENT '用户id',
  `zong_rmb` decimal(15,2) NOT NULL COMMENT '提现金额',
  `tx_rmb` decimal(15,2) NOT NULL COMMENT '实际到账金额',
  `pay_type` int(11) NOT NULL COMMENT '提现方式类型 1:微信 2:支付宝 3:银行卡4聚宝提现',
  `time` datetime NOT NULL COMMENT '时间',
  `state` int(1) NOT NULL DEFAULT '1' COMMENT '状t态 1->申请中，2->已通过 3->已拒绝',
  `refuse_rea` text CHARACTER SET utf8 COMMENT '拒绝说明',
  `zhifu_type` tinyint(1) NOT NULL COMMENT '哪种积分提现1佣金提现,2代理佣金提现,3农联积分提现，4鸡分提现，5鱼库积分提现，6果园积分提现',
  `give_xiaofei` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '赠送消费积分',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ysk_tixian
-- ----------------------------

-- ----------------------------
-- Table structure for `ysk_tool`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_tool`;
CREATE TABLE `ysk_tool` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `t_name` varchar(20) NOT NULL DEFAULT '',
  `t_num` int(11) NOT NULL DEFAULT '0' COMMENT '价格',
  `t_type` tinyint(1) NOT NULL DEFAULT '0',
  `t_month` tinyint(4) NOT NULL DEFAULT '0',
  `t_fieldname` varchar(20) DEFAULT NULL,
  `t_value` tinyint(4) NOT NULL DEFAULT '1',
  `t_img` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ysk_tool
-- ----------------------------

-- ----------------------------
-- Table structure for `ysk_trading`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_trading`;
CREATE TABLE `ysk_trading` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '出售数量',
  `sell_id` int(11) NOT NULL DEFAULT '0' COMMENT '出售人ID',
  `sell_account` varchar(50) NOT NULL,
  `sell_username` varchar(20) DEFAULT NULL,
  `buy_id` int(11) NOT NULL DEFAULT '0' COMMENT '购买者ID',
  `buy_account` varchar(50) NOT NULL COMMENT '购买者账号',
  `buy_username` varchar(20) DEFAULT NULL COMMENT '购买者姓名',
  `fee_num` decimal(11,2) NOT NULL COMMENT '手续费',
  `create_time` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0-出售成功 1-买家确认  2-买家确认 3-取消交易',
  `img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `sell_id` (`sell_id`) USING BTREE,
  KEY `buy_id` (`buy_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ysk_trading
-- ----------------------------

-- ----------------------------
-- Table structure for `ysk_trading_free`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_trading_free`;
CREATE TABLE `ysk_trading_free` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '出售数量',
  `sell_id` int(11) NOT NULL DEFAULT '0' COMMENT '出售人ID',
  `sell_account` varchar(50) NOT NULL,
  `sell_username` varchar(20) DEFAULT NULL,
  `buy_id` int(11) NOT NULL DEFAULT '0' COMMENT '购买者ID',
  `buy_account` varchar(50) DEFAULT NULL COMMENT '购买者账号',
  `buy_username` varchar(20) DEFAULT NULL COMMENT '购买者姓名',
  `fee_num` decimal(11,2) NOT NULL COMMENT '手续费',
  `create_time` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0-出售成功 1-买家确认  2-买家确认 3-取消交易',
  `img` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `sell_id` (`sell_id`) USING BTREE,
  KEY `buy_id` (`buy_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=118 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ysk_trading_free
-- ----------------------------

-- ----------------------------
-- Table structure for `ysk_tranmoney`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_tranmoney`;
CREATE TABLE `ysk_tranmoney` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pay_id` int(10) DEFAULT NULL COMMENT '支付的会员',
  `get_id` int(10) DEFAULT NULL COMMENT '收到转账用户id',
  `get_nums` decimal(10,4) DEFAULT '0.0000' COMMENT '转账总金额',
  `get_time` char(30) DEFAULT '0' COMMENT '转账时间',
  `get_type` tinyint(3) DEFAULT NULL COMMENT '0->转账,1->积分相关【转出80%与转入20%（只记录转入数）】、【余额对换积分（正数）或积分释放余额（负数）（判断2个UID相等）】,2->积分释放到余额（记录余额）,3->【余额交易】挂求购,4->购买，5->【余额交易】出售，6->取消，7->购买众筹， 8->买入（增加余额），9->卖出（减余额），10->取消（卖家返回余额），11->后台操作-CC，12->后台操作-活跃度，13->余额兑换积分（记录余额），22->转入的人弹出领取红包 23 推荐赠送 24 购物送积分,25 打卡奖励灵石，26 购买卷轴扣除灵石，27购买皮肤扣除灵石 ，28 话费充值消耗灵石 ，29卖出扣除灵石,30购买卷轴奖励活跃度，31购买扣除灵石，32买入获得灵石，33充值失败返灵石，34，卷轴过期扣除活跃度，35,实名认证获得活跃度，36出售取消，37星级达人获得,38购买卷轴增加步数，39签到获得步数，40 断签扣除步数，41卷轴失效,42实名认证，43卷轴赠送活跃度，44赠送卷轴步数,45投诉返回灵石，47直推实名获得活跃度,101直推获得经验值；100自身经验值增加；102收益分红',
  `now_nums` decimal(11,4) DEFAULT '0.0000' COMMENT '兑换之后当前余额 ',
  `now_nums_get` decimal(11,4) DEFAULT '0.0000' COMMENT '兑换之后当前余额 ',
  `is_release` tinyint(1) DEFAULT '0' COMMENT '0->未释放转账,1->1以释放转账',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=732 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- ----------------------------
-- Records of ysk_tranmoney
-- ----------------------------
INSERT INTO `ysk_tranmoney` VALUES ('503', '8946', '0', '10.0000', '1590111697', '26', '80.0000', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('504', '0', '8946', '1.0000', '1590111697', '30', '2.0000', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('505', '0', '8946', '1.0000', '1590116870', '35', '3.0000', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('506', '0', '8937', '1.0000', '1590116870', '47', '3.0000', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('507', '0', '8937', '30.0000', '1590116870', '101', '90.0000', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('508', '0', '8946', '30.0000', '1590116870', '100', '30.0000', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('509', '8946', '0', '1.5000', '1590118676', '29', '78.5000', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('510', '0', '8937', '1.0000', '1590118981', '32', '90.0000', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('511', '8946', '0', '1.5000', '1590120053', '29', '77.0000', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('512', '0', '8937', '1.0000', '1590120104', '32', '91.0000', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('513', '8937', '0', '50.0000', '1590125529', '26', '42.0000', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('514', '0', '8937', '5.0000', '1590125529', '30', '8.0000', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('515', '8937', '0', '10.0000', '1590126006', '26', '32.0000', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('516', '0', '8937', '1.0000', '1590126006', '30', '9.0000', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('517', '8936', '0', '50.0000', '1590196181', '26', '40.0000', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('518', '0', '8936', '5.0000', '1590196181', '30', '6.0000', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('519', '8936', '0', '10.0000', '1590196184', '26', '30.0000', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('520', '0', '8936', '1.0000', '1590196184', '30', '7.0000', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('526', '0', '8937', '0.5000', '1590215612', '25', '38.0500', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('527', '0', '8936', '0.5000', '1590215624', '25', '33.0500', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('528', '0', '8936', '0.5000', '1590375449', '25', '33.5500', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('529', '0', '8936', '1.0300', '1590378994', '102', '34.5800', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('530', '0', '8936', '0.5000', '1590471124', '25', '35.0800', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('531', '0', '8803', '0.2500', '1590471125', '102', '100.2500', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('532', '8937', '0', '15.0000', '1590740235', '29', '23.0500', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('533', '8936', '0', '15.0000', '1590740798', '29', '20.0800', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('534', '0', '8936', '10.0000', '1590741028', '32', '20.0800', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('535', '0', '8937', '10.0000', '1590741464', '32', '23.0500', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('536', '0', '8936', '0.5000', '1590742389', '25', '30.5800', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('537', '0', '8803', '0.2500', '1590742389', '102', '100.5000', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('538', '0', '8936', '0.5000', '1590742458', '25', '31.0800', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('539', '0', '8803', '0.2500', '1590742458', '102', '100.7500', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('540', '0', '8937', '2.0500', '1590808953', '25', '35.1000', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('541', '0', '8936', '1.0300', '1590808953', '102', '32.1100', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('542', '0', '8937', '2.0500', '1590824194', '25', '37.1500', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('543', '0', '8936', '1.0300', '1590824194', '102', '33.1400', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('544', '0', '8937', '2.0500', '1590824448', '25', '39.2000', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('545', '0', '8936', '1.0300', '1590824448', '102', '34.1700', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('546', '0', '8937', '0.5000', '1590824448', '25', '39.7000', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('547', '0', '8936', '0.2500', '1590824448', '102', '34.4200', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('548', '0', '8937', '2.0500', '1590825003', '25', '41.7500', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('549', '0', '8936', '1.0300', '1590825003', '102', '35.4500', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('550', '0', '8937', '0.5000', '1590825003', '25', '42.2500', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('551', '0', '8936', '0.2500', '1590825003', '102', '35.7000', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('552', '0', '8936', '2.0500', '1590832231', '25', '37.7500', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('553', '0', '8803', '1.0300', '1590832231', '102', '101.7800', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('554', '0', '8936', '0.5000', '1590832231', '25', '38.2500', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('555', '0', '8803', '0.2500', '1590832231', '102', '102.0300', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('556', '0', '8937', '2.0500', '1590973914', '25', '44.3000', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('557', '0', '8936', '1.0300', '1590973914', '102', '39.2800', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('558', '0', '8937', '0.5000', '1590973914', '25', '44.8000', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('559', '0', '8936', '0.2500', '1590973914', '102', '39.5300', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('560', '0', '8936', '2.0500', '1590974457', '25', '41.5800', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('561', '0', '8803', '1.0300', '1590974457', '102', '103.0600', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('562', '0', '8936', '0.5000', '1590974457', '25', '42.0800', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('563', '0', '8803', '0.2500', '1590974457', '102', '103.3100', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('564', '8946', '0', '0.0000', '1591015617', '26', '77.0000', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('565', '0', '8946', '1.0000', '1591015617', '30', '4.0000', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('566', '0', '8936', '2.0500', '1591067144', '25', '44.1300', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('567', '0', '8803', '1.0300', '1591067144', '102', '104.3400', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('568', '0', '8936', '0.5000', '1591067144', '25', '44.6300', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('569', '0', '8803', '0.2500', '1591067144', '102', '104.5900', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('570', '0', '8937', '2.0500', '1591069487', '25', '46.8500', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('571', '0', '8936', '1.0300', '1591069487', '102', '45.6600', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('572', '0', '8937', '0.5000', '1591069487', '25', '47.3500', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('573', '0', '8936', '0.2500', '1591069487', '102', '45.9100', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('574', '8936', '8936', '50.0000', '1591069583', '23', '1100.0000', '1100.0000', '1');
INSERT INTO `ysk_tranmoney` VALUES ('575', '8803', '8803', '50.0000', '1591069830', '23', '1050.0000', '1050.0000', '1');
INSERT INTO `ysk_tranmoney` VALUES ('576', '0', '0', '50.0000', '1591074799', '23', null, null, '1');
INSERT INTO `ysk_tranmoney` VALUES ('577', '0', '0', '50.0000', '1591074832', '23', null, null, '1');
INSERT INTO `ysk_tranmoney` VALUES ('578', '0', '0', '50.0000', '1591077388', '23', null, null, '1');
INSERT INTO `ysk_tranmoney` VALUES ('579', '0', null, '10.0000', '1591847073', '101', null, '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('580', '0', '8803', '10.0000', '1591847073', '100', '10.0000', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('581', '8803', '8803', '50.0000', '1591865987', '23', '1100.0000', '1100.0000', '1');
INSERT INTO `ysk_tranmoney` VALUES ('582', '8952', '8952', '50.0000', '1591866023', '23', '1050.0000', '1050.0000', '1');
INSERT INTO `ysk_tranmoney` VALUES ('583', '0', null, '10.0000', '1591866063', '101', null, '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('584', '0', '8952', '10.0000', '1591866063', '100', '10.0000', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('585', '0', null, '10.0000', '1591866109', '101', null, '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('586', '0', '8953', '10.0000', '1591866109', '100', '10.0000', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('587', '0', '8953', '0.3300', '1591866136', '25', '0.3300', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('588', '8953', '0', '100.0000', '1591867413', '26', '0.3300', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('589', '0', '8953', '10.0000', '1591867413', '30', '10.0000', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('590', '0', '8953', '0.3300', '1591867565', '25', '0.6600', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('591', '0', '8953', '4.3700', '1591867565', '25', '5.0300', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('592', '0', '8952', '0.0800', '1591867565', '102', '0.0800', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('593', '8803', '8803', '50.0000', '1591868054', '23', '1150.0000', '1150.0000', '1');
INSERT INTO `ysk_tranmoney` VALUES ('594', '8954', '8954', '50.0000', '1591868078', '23', '1050.0000', '1050.0000', '1');
INSERT INTO `ysk_tranmoney` VALUES ('595', '0', null, '10.0000', '1591868108', '101', null, '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('596', '0', '8954', '10.0000', '1591868108', '100', '10.0000', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('597', '0', '8954', '0.3300', '1591868148', '25', '0.3300', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('598', '8803', '8803', '50.0000', '1591868847', '23', '1200.0000', '1200.0000', '1');
INSERT INTO `ysk_tranmoney` VALUES ('599', '8956', '8956', '50.0000', '1591868881', '23', '1050.0000', '1050.0000', '1');
INSERT INTO `ysk_tranmoney` VALUES ('600', '0', '8803', '10.0000', '1591868918', '101', '20.0000', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('601', '0', '8956', '10.0000', '1591868918', '100', '10.0000', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('602', '0', '8956', '10.0000', '1591868973', '101', '20.0000', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('603', '0', '8957', '10.0000', '1591868973', '100', '10.0000', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('604', '0', '8956', '0.3300', '1591869009', '25', '0.3300', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('605', '0', '8803', '0.0100', '1591869009', '102', '135.6000', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('606', '0', '8957', '0.3300', '1591869038', '25', '0.3300', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('607', '0', '8956', '0.0200', '1591869038', '102', '0.3500', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('608', '8803', '8803', '50.0000', '1591941762', '23', '1250.0000', '1250.0000', '1');
INSERT INTO `ysk_tranmoney` VALUES ('609', '8803', '0', '15.6000', '1591942654', '29', '120.0049', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('610', '8803', '0', '78.0000', '1591943696', '29', '42.0050', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('611', '0', '8803', '10.0000', '1591943841', '101', '30.0000', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('612', '0', '8958', '10.0000', '1591943841', '100', '10.0000', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('621', '0', '8803', '134.0000', '1591945475', '25', '176.0050', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('622', '8803', '0', '10.0000', '1591945506', '26', '166.0050', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('623', '0', '8803', '1.0000', '1591945506', '30', '2.0000', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('624', '0', '8803', '0.4300', '1591945862', '25', '166.4350', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('625', '0', '8803', '225.0000', '1591945955', '25', '391.4350', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('626', '0', '8803', '0.3300', '1591945970', '25', '391.7650', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('627', '8803', '8803', '50.0000', '1591949157', '23', '1300.0000', '1300.0000', '1');
INSERT INTO `ysk_tranmoney` VALUES ('628', '8803', '8803', '50.0000', '1591949197', '23', '1350.0000', '1350.0000', '1');
INSERT INTO `ysk_tranmoney` VALUES ('629', '0', '8803', '10.0000', '1591949399', '101', '40.0000', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('630', '0', '8960', '10.0000', '1591949399', '100', '10.0000', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('631', '0', '8803', '10.0000', '1591949399', '101', '50.0000', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('632', '0', '8959', '10.0000', '1591949399', '100', '10.0000', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('633', '0', '0', '10.0000', '1591949497', '101', null, '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('634', '0', '8949', '10.0000', '1591949497', '100', '10.0000', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('635', '0', '8936', '10.0000', '1591949497', '101', '40.0000', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('636', '0', '8947', '10.0000', '1591949497', '100', '10.0000', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('637', '8803', '8803', '50.0000', '1591949798', '23', '1400.0000', '1400.0000', '1');
INSERT INTO `ysk_tranmoney` VALUES ('638', '8803', '8803', '50.0000', '1591949828', '23', '1450.0000', '1450.0000', '1');
INSERT INTO `ysk_tranmoney` VALUES ('639', '8936', '0', '13.0000', '1592213862', '29', '987.9100', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('640', '8936', '0', '26.0000', '1592213919', '29', '961.9100', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('641', '8936', '0', '130.0000', '1592214037', '29', '870.9100', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('642', '8936', '0', '130.0000', '1592214206', '29', '740.9100', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('643', '0', '8936', '100.0000', '1592214610', '45', '840.9100', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('644', '0', '8936', '10.0000', '1592272819', '45', '850.9100', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('645', '8803', '0', '13.0000', '1592273367', '29', '378.7650', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('646', '0', '8936', '1.0000', '1592273965', '43', '8.0000', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('647', '8936', '0', '26.0000', '1592278486', '29', '824.9100', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('648', '0', '8936', '1.0000', '1592279349', '43', '9.0000', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('651', '0', '8936', '1.0000', '1592279655', '43', '10.0000', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('652', '0', '8936', '0.3300', '1592279666', '25', '825.2400', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('653', '0', '8803', '0.0167', '1592279666', '102', '378.7817', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('654', '0', '8803', '0.3300', '1592293676', '25', '379.1117', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('655', '0', '8803', '134.0000', '1592293676', '25', '513.1117', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('656', '0', '8803', '225.0000', '1592293676', '25', '738.1117', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('657', '0', '8803', '0.4300', '1592293676', '25', '738.5417', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('658', '0', '8936', '2.0500', '1592293696', '25', '827.2900', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('659', '0', '8803', '0.0500', '1592293696', '102', '738.5917', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('660', '0', '8936', '0.5000', '1592293696', '25', '827.7900', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('661', '0', '8803', '0.0200', '1592293696', '102', '738.6117', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('662', '0', '8936', '0.3300', '1592293696', '25', '828.1200', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('663', '0', '8936', '0.3300', '1592293696', '25', '828.4500', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('664', '0', '8803', '0.0167', '1592293696', '102', '738.6284', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('665', '0', '8936', '0.3300', '1592293696', '25', '828.7800', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('666', '0', '8803', '0.0167', '1592293696', '102', '738.6451', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('667', '8936', '0', '39.0000', '1592296041', '29', '789.7800', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('668', '8936', '0', '13.0000', '1592302074', '29', '776.7800', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('669', '8936', '0', '13.0000', '1592357196', '29', '763.7800', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('670', '0', '8803', '10.0000', '1592358401', '32', '738.6451', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('671', '8936', '0', '1.3000', '1592359117', '29', '762.4800', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('672', '0', '8803', '1.0000', '1592359341', '32', '748.6451', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('673', '8936', '0', '2.6000', '1592373216', '29', '759.8800', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('674', '0', '8803', '2.0000', '1592373631', '32', '749.6451', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('675', '8936', '0', '1.3000', '1592373749', '29', '758.5800', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('682', '0', '8936', '1.0000', '1592375623', '45', '759.5800', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('683', '8936', '0', '2.6000', '1592375835', '29', '756.9800', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('684', '0', '8936', '2.0000', '1592375941', '45', '758.9800', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('685', '8936', '0', '3.9000', '1592377281', '29', '755.0800', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('686', '0', '8803', '3.0000', '1592377312', '32', '751.6451', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('687', '8936', '0', '13.0000', '1592377401', '29', '742.0800', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('688', '0', '8803', '10.0000', '1592377419', '32', '754.6451', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('689', '8936', '0', '26.0000', '1592386263', '29', '716.0800', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('690', '0', '8936', '20.0000', '1592386350', '45', '736.0800', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('691', '8936', '0', '39.0000', '1592388397', '29', '697.0800', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('692', '0', '8936', '30.0000', '1592388496', '45', '727.0800', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('693', '8936', '0', '13.0000', '1592389647', '29', '714.0800', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('694', '8937', '0', '2.6000', '1592389824', '29', '44.7500', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('695', '8937', '0', '1.3000', '1592389895', '29', '43.4500', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('696', '0', '8936', '10.0000', '1592390060', '45', '724.0800', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('697', '0', '8937', '2.0000', '1592390073', '45', '45.4500', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('698', '0', '8937', '1.0000', '1592390073', '45', '46.4500', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('699', '8936', '0', '13.0000', '1592390139', '29', '711.0800', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('700', '0', '8936', '10.0000', '1592549566', '45', '721.0800', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('701', '8803', '0', '13.0000', '1592549921', '29', '751.6451', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('702', '8936', '0', '30.0000', '1592557674', '29', '691.0800', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('703', '0', '8803', '12.7000', '1592557731', '45', '764.3451', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('704', '8803', '0', '127.0000', '1592557768', '29', '637.3451', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('705', '0', '8803', '127.0000', '1592557968', '45', '764.3451', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('706', '8803', '0', '127.0000', '1592558007', '29', '637.3451', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('707', '0', '8803', '127.0000', '1592558018', '45', '764.3451', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('708', '8803', '0', '127.0000', '1592558435', '29', '637.3451', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('709', '0', '8803', '127.0000', '1592558522', '45', '764.3451', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('710', '8936', '0', '100.0000', '1592558634', '29', '591.0800', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('711', '0', '8803', '100.0000', '1592558966', '32', '764.3451', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('712', '8936', '0', '100.0000', '1592559134', '29', '491.0800', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('713', '0', '8936', '125.0000', '1592559138', '45', '616.0800', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('714', '8936', '0', '100.0000', '1592559300', '29', '516.0800', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('715', '0', '8803', '100.0000', '1592559341', '32', '864.3451', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('716', '0', '8936', '39.0000', '1592623479', '45', '555.0800', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('717', '8803', '0', '12.7000', '1592623487', '29', '951.6451', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('718', '0', '8936', '10.0000', '1592623865', '32', '555.0800', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('719', '8936', '0', '39.0000', '1592623942', '29', '526.0800', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('720', '0', '8803', '30.0000', '1592624003', '32', '951.6451', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('721', '8803', '0', '10.0000', '1592963490', '26', '1101.6451', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('722', '0', '8803', '1.0000', '1592963490', '30', '3.0000', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('723', '0', '8803', '0.4300', '1592963529', '25', '1102.0751', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('724', '0', '8803', '0.3300', '1592963530', '25', '1102.4051', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('725', '8803', '0', '10.0000', '1592964978', '26', '1092.4051', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('726', '0', '8803', '1.0000', '1592964978', '30', '4.0000', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('727', '0', '8803', '0.3300', '1592964982', '25', '1092.7351', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('728', '0', '8803', '500.0000', '1592978657', '43', '504.0000', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('729', '0', '8803', '10.0000', '1593247867', '43', '514.0000', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('730', '0', '8803', '4.3700', '1593247875', '25', '1097.1051', '0.0000', '0');
INSERT INTO `ysk_tranmoney` VALUES ('731', '0', '8803', '4.3700', '1593249524', '25', '1101.4751', '0.0000', '0');

-- ----------------------------
-- Table structure for `ysk_trans`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_trans`;
CREATE TABLE `ysk_trans` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '挂单中心',
  `payout_id` int(10) DEFAULT '0' COMMENT '转出余额会员id',
  `payin_id` int(10) DEFAULT '0' COMMENT '转入会员id',
  `pay_nums` decimal(11,2) DEFAULT '0.00' COMMENT '转出数量',
  `pay_state` tinyint(1) DEFAULT '0' COMMENT '订单状态:0->默认上架,1->有人买入,2->已打款,3->确认到款(已完成)',
  `pay_time` char(30) DEFAULT NULL COMMENT '订单生成时间',
  `pay_no` char(30) DEFAULT NULL COMMENT '订单编号',
  `card_id` int(10) DEFAULT NULL COMMENT '会员银行卡id',
  `trade_notes` text COMMENT '订单备注',
  `trans_type` tinyint(1) DEFAULT '0' COMMENT '0->买入,1->卖出',
  `trans_img` varchar(100) DEFAULT NULL COMMENT '打款凭证',
  `get_moneytime` char(50) DEFAULT NULL COMMENT '收到款时间',
  `fee_nums` decimal(11,2) DEFAULT '0.00' COMMENT '手续费',
  `out_card` int(10) DEFAULT NULL COMMENT '买入会员银行卡id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=187 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ysk_trans
-- ----------------------------

-- ----------------------------
-- Table structure for `ysk_trans_quxiao`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_trans_quxiao`;
CREATE TABLE `ysk_trans_quxiao` (
  `id` int(10) NOT NULL COMMENT '挂单中心',
  `payout_id` int(10) DEFAULT '0' COMMENT '转出余额会员id',
  `payin_id` int(10) DEFAULT '0' COMMENT '转入会员id',
  `pay_nums` decimal(11,2) DEFAULT '0.00' COMMENT '转出数量',
  `pay_state` tinyint(1) DEFAULT '0' COMMENT '订单状态:0->默认上架,1->有人买入,2->已打款,3->确认到款(已完成),4->取消',
  `pay_time` char(30) DEFAULT NULL COMMENT '订单生成时间',
  `pay_no` char(30) DEFAULT NULL COMMENT '订单编号',
  `card_id` int(10) DEFAULT NULL COMMENT '会员银行卡id',
  `trade_notes` text COMMENT '订单备注',
  `trans_type` tinyint(1) DEFAULT '0' COMMENT '0->买入,1->卖出,',
  `trans_img` varchar(100) DEFAULT NULL COMMENT '打款凭证',
  `get_moneytime` char(50) DEFAULT NULL COMMENT '收到款时间',
  `fee_nums` decimal(11,2) DEFAULT '0.00' COMMENT '手续费',
  `out_card` int(10) DEFAULT NULL COMMENT '买入会员银行卡id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ysk_trans_quxiao
-- ----------------------------

-- ----------------------------
-- Table structure for `ysk_tuandui`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_tuandui`;
CREATE TABLE `ysk_tuandui` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id_2` (`id`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ysk_tuandui
-- ----------------------------

-- ----------------------------
-- Table structure for `ysk_turntable_lv`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_turntable_lv`;
CREATE TABLE `ysk_turntable_lv` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '转盘抽奖概率',
  `one` int(11) unsigned NOT NULL DEFAULT '0',
  `two` int(11) unsigned NOT NULL DEFAULT '0',
  `three` int(11) unsigned NOT NULL DEFAULT '0',
  `four` int(11) unsigned NOT NULL DEFAULT '0',
  `five` int(11) unsigned NOT NULL DEFAULT '0',
  `six` int(11) unsigned NOT NULL DEFAULT '0',
  `seven` int(11) unsigned NOT NULL DEFAULT '0',
  `eight` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6000002 DEFAULT CHARSET=utf16 ROW_FORMAT=FIXED;

-- ----------------------------
-- Records of ysk_turntable_lv
-- ----------------------------
INSERT INTO `ysk_turntable_lv` VALUES ('6000001', '0', '0', '1', '1', '1', '1', '30', '70');

-- ----------------------------
-- Table structure for `ysk_ubanks`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_ubanks`;
CREATE TABLE `ysk_ubanks` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '会员绑定银行卡',
  `user_id` int(10) NOT NULL COMMENT '会员id',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1开启 0关闭',
  `add_time` int(11) NOT NULL COMMENT '添加时间',
  `alipay_name` varchar(50) NOT NULL COMMENT '支付宝姓名/银行卡姓名',
  `alipay_number` char(50) NOT NULL COMMENT '支付宝账号/银行卡号/微信账号',
  `open_bank` varchar(50) DEFAULT NULL COMMENT '开户行',
  `opening_branch` varchar(50) DEFAULT NULL COMMENT '开户支行',
  `img` varchar(255) NOT NULL COMMENT '支付宝或微信收款码',
  `type` int(2) NOT NULL COMMENT '1=>支付宝 2=>银行卡 3=>微信',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1915 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='支付宝';

-- ----------------------------
-- Records of ysk_ubanks
-- ----------------------------
INSERT INTO `ysk_ubanks` VALUES ('1908', '8936', '0', '1589339324', '七年', '13800138000@alipay.com', 'null', 'null', 'http://192.168.0.164/Public/user/2020-05-13/5ebb8ae26422c.jpg', '1');
INSERT INTO `ysk_ubanks` VALUES ('1909', '8936', '0', '1589339832', '七年', '1380013800000000000', '广州银行', '广州支行', '', '2');
INSERT INTO `ysk_ubanks` VALUES ('1910', '8936', '1', '1589339956', '七年', 'qin@wechat.com', '', '', 'http://192.168.0.164/Public/user/2020-05-13/5ebb6edb46cf7.jpg', '3');
INSERT INTO `ysk_ubanks` VALUES ('1914', '8803', '0', '0', '', '', null, null, '', '1');
INSERT INTO `ysk_ubanks` VALUES ('1912', '8946', '1', '1590054163', '小飞猪', '66666', '', '', 'http://192.168.0.164/Public/user/2020-05-21/5ec64d0653354.jpg', '1');
INSERT INTO `ysk_ubanks` VALUES ('1913', '8803', '1', '1591942406', '123123', '123123123123', '', '', '', '1');

-- ----------------------------
-- Table structure for `ysk_ucoins`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_ucoins`;
CREATE TABLE `ysk_ucoins` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '每个人账户对应币',
  `cid` int(10) NOT NULL COMMENT '币对应id',
  `c_nums` decimal(11,4) NOT NULL DEFAULT '0.0000' COMMENT '对应币数量',
  `c_uid` int(10) NOT NULL COMMENT '对应的会员id',
  `djie_nums` decimal(11,4) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- ----------------------------
-- Records of ysk_ucoins
-- ----------------------------

-- ----------------------------
-- Table structure for `ysk_uesources`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_uesources`;
CREATE TABLE `ysk_uesources` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT ' 用户资源表(拆分比例,风车拥有数量)',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `chaifen_bili` float(8,4) NOT NULL DEFAULT '0.0000' COMMENT '拆分比例',
  `jiwo_earns` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT '鸡窝收益',
  `count_time` date NOT NULL COMMENT '计算拆分/收益时间',
  `earns` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT '记录收益',
  `tiaofen_earns` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT '挑粪收益',
  `guoyuan_earns` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT '果园施肥收益',
  `yuchang_earns` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT '渔场喂鱼收益',
  `buyu_earns` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT '捕鱼收益',
  `guoyuan_chaifen` float(11,3) NOT NULL DEFAULT '0.000' COMMENT '果园拆分',
  `yuchang_chaifen` float(11,3) NOT NULL DEFAULT '0.000' COMMENT '渔场拆分',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE COMMENT '表id',
  KEY `uid` (`uid`) USING BTREE COMMENT '用户id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- ----------------------------
-- Records of ysk_uesources
-- ----------------------------

-- ----------------------------
-- Table structure for `ysk_upgoods`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_upgoods`;
CREATE TABLE `ysk_upgoods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商户产品表',
  `uid` int(11) NOT NULL COMMENT '商户id',
  `goods_id` int(11) NOT NULL COMMENT '产品id',
  `uptime` int(20) NOT NULL COMMENT '产品上传时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=276 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- ----------------------------
-- Records of ysk_upgoods
-- ----------------------------

-- ----------------------------
-- Table structure for `ysk_upload`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_upload`;
CREATE TABLE `ysk_upload` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'UID',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '文件名',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '文件路径',
  `url` varchar(255) DEFAULT NULL COMMENT '文件链接',
  `ext` char(4) NOT NULL DEFAULT '' COMMENT '文件类型',
  `size` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) DEFAULT NULL COMMENT '文件md5',
  `sha1` char(40) DEFAULT NULL COMMENT '文件sha1编码',
  `location` varchar(15) NOT NULL DEFAULT '' COMMENT '文件存储位置',
  `download` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文件上传表';

-- ----------------------------
-- Records of ysk_upload
-- ----------------------------

-- ----------------------------
-- Table structure for `ysk_upload_verify`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_upload_verify`;
CREATE TABLE `ysk_upload_verify` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT '0' COMMENT '1=>通过；0=>未审核；2=>未通过',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ysk_upload_verify
-- ----------------------------
INSERT INTO `ysk_upload_verify` VALUES ('3', '8937', '1588142633', '1');

-- ----------------------------
-- Table structure for `ysk_user`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_user`;
CREATE TABLE `ysk_user` (
  `userid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL COMMENT '上级ID',
  `gid` int(11) NOT NULL DEFAULT '0' COMMENT '上上级ID',
  `ggid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上上上级ID',
  `account` char(20) NOT NULL DEFAULT '0' COMMENT '用户账号',
  `mobile` char(20) NOT NULL COMMENT '用户手机号',
  `username` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `safety_pwd` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT '安全密码',
  `safety_salt` char(5) CHARACTER SET latin1 NOT NULL,
  `login_pwd` varchar(32) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `login_salt` char(3) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `sex` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-女 1-男 2-保密',
  `reg_date` int(11) NOT NULL COMMENT '注册时间',
  `reg_ip` varchar(20) NOT NULL COMMENT '注册IP',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '用户锁定  1 不锁  0拉黑  -1 删除',
  `activate` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否激活 1-已激活 0-未激活',
  `session_id` varchar(225) DEFAULT NULL,
  `wx_no` varchar(20) DEFAULT '0' COMMENT '微信',
  `alipay` varchar(20) DEFAULT NULL,
  `note` text,
  `deep` int(11) NOT NULL DEFAULT '0',
  `path` text,
  `use_grade` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户等级',
  `img_head` varchar(100) NOT NULL DEFAULT 'toux-icon.png' COMMENT '用户头像',
  `bank_uname` varchar(20) DEFAULT NULL COMMENT '开户名',
  `releas_rate` float(10,4) NOT NULL DEFAULT '0.0000' COMMENT '增加的释放率',
  `releas_time` char(40) NOT NULL DEFAULT '1' COMMENT '释放时间',
  `is_reward` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0->默认未领取奖金,1->已经领取积分释放',
  `today_releas` float(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '今日释放率',
  `is_dailishang` tinyint(1) NOT NULL DEFAULT '0' COMMENT '2->商家',
  `wallet_add` text COMMENT '个人钱包地址',
  `vip_grade` tinyint(1) DEFAULT '1' COMMENT '0：体验会员，1普通会员，2：蓝钻会员，3：金钻会员，4：VIP  会员',
  `yinbi` tinyint(1) DEFAULT '0',
  `quanxian` varchar(10) DEFAULT NULL,
  `id_card` varchar(18) NOT NULL DEFAULT '' COMMENT '身份证',
  `truename` varchar(50) NOT NULL COMMENT '真实姓名',
  `total_lingshi` decimal(10,4) NOT NULL COMMENT '总灵石',
  `total_active` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '总活跃度',
  `djie_num` decimal(11,4) NOT NULL COMMENT '市场交易冻结的灵石',
  `is_real_name` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已实名认证：1是，0否',
  `is_pay` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否支付:0否，1是',
  `service_charge` int(11) NOT NULL COMMENT '手续费抽成',
  `is_verify` tinyint(4) NOT NULL DEFAULT '0' COMMENT '用户审核状态：0正常1失败，2成功',
  `user_star_id` int(11) DEFAULT '0' COMMENT '星级达人',
  `upload_verify` int(11) DEFAULT '0' COMMENT '0=>没有上传权限；1=>有',
  `headimg` varchar(255) NOT NULL COMMENT '头像',
  `gxqm` varchar(255) NOT NULL COMMENT '个性签名',
  `nickname` varchar(100) NOT NULL COMMENT '昵称',
  `openid` varchar(34) NOT NULL COMMENT '唯一字符串',
  `birthday` varchar(20) DEFAULT NULL COMMENT '生日',
  `industry_verify` int(1) NOT NULL DEFAULT '0' COMMENT '用户审核状态：0正常1失败，2成功',
  PRIMARY KEY (`userid`) USING BTREE,
  UNIQUE KEY `mobile` (`mobile`) USING BTREE,
  UNIQUE KEY `account` (`account`) USING BTREE,
  KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8963 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ysk_user
-- ----------------------------
INSERT INTO `ysk_user` VALUES ('8803', '8802', '8800', '8795', '18888888888', '18888888888', '123', '', '7d697c1daca906559ea01f5a4421d88d', '9d9', '358af4a8b0aee4b9715dd42e3c3c33df', '8ca', '0', '1560855645', '118.113.137.175', '1', '1', '375ue81opg09kl36cc38o3uhm7', '0', null, null, '29', '-8570-8599-8641-8658-8732-8733-8734-8736-8737-8748-8793-8795-8800-8802-', '0', 'toux-icon.png', null, '0.0000', '1', '0', '0.0000', '0', '0x69233e673ec7fed4108a36f3c0f5263bf49939', '2', '0', '', '123123123123123123', '123', '1101.4751', '2500.0000', '513.3000', '1', '1', '0', '2', '1', '0', 'http://192.168.0.164/Public/user/bd001.jpg', '', '达芬 Teng', 'MTM4MDAxMzgwMDF=', '2020-05-01', '0');
INSERT INTO `ysk_user` VALUES ('8936', '8803', '8802', '8800', '13800138000', '13800138000', '000', '', '9ae73da8c94a49f919e5dfc4ce6b1242', 'ff4', '22a8ed04613930a8d9822de172d65ba9', '754', '1', '1587978099', '127.0.0.1', '1', '1', 'cfkq19bmrecg6hig6431bhpq35', '0', null, null, '30', '-8570-8599-8641-8658-8732-8733-8734-8736-8737-8748-8793-8795-8800-8802-8803-', '0', 'toux-icon.png', null, '0.0000', '1', '0', '0.0000', '0', '0x69233e673ec7fed4108a36f3c0f5263bf49939', '1', '0', '', '420012198801011234', '000', '526.0800', '10.0000', '1024.7000', '1', '1', '0', '1', '2', '1', 'http://tt.demo88.top/Public/user/2020-06-02/5ed5c264dc370.jpg', '随哈哈哈', '小吉子呀她', 'MTM4MDAxMzgwMDA=', '2020-05-01', '1');
INSERT INTO `ysk_user` VALUES ('8937', '8936', '8803', '8802', '13800138001', '13800138001', '001', '', 'c2ed93933b04bf7aa322281b5aa7f20d', 'b8b', 'bad64000f4bf0411e3ad67500d26f4c7', '7f8', '0', '1587980200', '127.0.0.1', '1', '1', 'b2f4g5ds76pskfd4qas3i5f726', '0', null, null, '31', '-8570-8599-8641-8658-8732-8733-8734-8736-8737-8748-8793-8795-8800-8802-8803-8936-', '0', 'ba1d0e8228e4f671ee8645bb5f76156e.png', null, '0.0000', '1', '0', '0.0000', '0', '0x69233e673ec7fed4108a36f3c0f5263bf49939', '2', '0', '', '420012198801011235', '001', '46.4500', '9.0000', '78.9000', '1', '1', '0', '1', '2', '1', 'http://192.168.0.164/Public/user/2020-05-22/5ec782ddf1fea.jpeg', '112233...11', '用户bd002', 'MTM4MDAxMzgwMDE=', '2020-05-01', '0');
INSERT INTO `ysk_user` VALUES ('8946', '8937', '8936', '8803', '13800138002', '13800138002', '1115356', '', 'ca1dd4d33a8a3595b99137ee5d099141', '07c', '3f2e8d1ac7df7f8283f4ca979162bfa4', '21d', '0', '1590047216', '192.168.0.164', '1', '1', '375ue81opg09kl36cc38o3uhm7', '0', null, null, '32', '-8570-8599-8641-8658-8732-8733-8734-8736-8737-8748-8793-8795-8800-8802-8803-8936-8937-', '0', 'toux-icon.png', null, '0.0000', '1', '0', '0.0000', '0', '0x69233e673ec7fed4108a36f3c0f5263bf49939', '0', '0', '', '420012198801011235', '小飞猪', '77.0000', '4.0000', '3.0000', '1', '1', '0', '2', '1', '0', 'http://tt.demo88.top/Public/user/2020-06-01/5ed4e81264960.jpg', '这是我的个性签名内容', '小飞猪啊1', 'hCKqo4llFQBhYWmcwBnQQ==', '2020-05-01', '0');
INSERT INTO `ysk_user` VALUES ('8947', '8936', '8803', '8802', '18344324057', '18344324057', '6501953', '', '55fdf5387d06a1880dc6e33662a19598', 'ab1', '1af398a14e87bdf5b1701187c3ef16d0', 'ab1', '1', '1591069583', '113.68.9.132', '1', '1', 'oos7r2t1mt5el3qeredsnsmj10', '0', null, null, '31', '-8570-8599-8641-8658-8732-8733-8734-8736-8737-8748-8793-8795-8800-8802-8803-8936-', '0', 'toux-icon.png', null, '0.0000', '1', '0', '0.0000', '0', '0x374baf70c4a90e292a6ef928e2c6128f028c01be', '1', '0', '2-5', '440803111111111111', '炮武', '0.0000', '0.0000', '0.0000', '1', '1', '0', '2', '0', '0', 'http://tt.demo88.top/Public/user/default.jpg', '随', '炮武', '3AgnFQGD4OQOnuMWLzfAww==', '2020-06-02', '0');
INSERT INTO `ysk_user` VALUES ('8948', '8803', '8802', '8800', '15727528776', '15727528776', '8317443', '', 'd5fe928f185c414ed171c68806e0fdd3', 'c64', '71a372ecbcae4710d2fb83d54dc05ac1', 'c64', '0', '1591069830', '113.68.9.132', '1', '1', null, '0', null, null, '30', '-8570-8599-8641-8658-8732-8733-8734-8736-8737-8748-8793-8795-8800-8802-8803-', '0', 'toux-icon.png', null, '0.0000', '1', '0', '0.0000', '0', '0xa569a8cc6ca0fdaa5e109f2332ced8471a6f85e8', '1', '0', '2-5', '', '', '0.0000', '0.0000', '0.0000', '0', '0', '0', '0', '0', '0', 'http://tt.demo88.top/Public/user/default.jpg', '', '用户3580688', '5hW11TEYZz9KerN5Te0nAA==', '2020-06-02', '0');
INSERT INTO `ysk_user` VALUES ('8949', '0', '0', '0', '18670023799', '18670023799', '5804046', '', 'bce2ff5f48afdca64195a0ee175dfbaf', '7e9', '59208a2265ddd4639d5a250b6e668fd3', '7e9', '0', '1591074799', '119.39.248.22', '1', '1', 'npcpik643v13khmpdcio77j7p6', '0', null, null, '1', '--', '0', 'toux-icon.png', null, '0.0000', '1', '0', '0.0000', '0', '0xda73c6dc49dbb9b5770a1a663d14dd51ed8db7d2', '1', '0', '2-5', '430503199101134516', '夏准', '0.0000', '0.0000', '0.0000', '1', '1', '0', '2', '0', '0', 'http://tt.demo88.top/Public/user/2020-06-02/5ed5e043a4100.jpg', '', '用户3075317', 'TxAJ54DDvta596eB4l88/Q==', '2020-06-02', '0');
INSERT INTO `ysk_user` VALUES ('8950', '0', '0', '0', '13824357036', '13824357036', '4323089', '', '8974fe5df7081ea8f62c1d317535e221', '5dc', '066df3e97e07b78fdcae6db95b51b952', '2b3', '0', '1591074832', '117.175.16.162', '1', '1', 'dllqa5fn4mrj0oho9kbhb5int2', '0', null, null, '1', '--', '0', 'toux-icon.png', null, '0.0000', '1', '0', '0.0000', '0', '0xd76aeadd970c28fbe40c113102c805fba769c123', '1', '0', '2', '', '', '0.0000', '0.0000', '0.0000', '0', '0', '0', '0', '0', '0', 'http://tt.demo88.top/Public/user/default.jpg', '', '用户6121276', 'xBV7aDnqbrI0smqd9PAnBg==', '2020-06-02', '0');
INSERT INTO `ysk_user` VALUES ('8951', '0', '0', '0', '13049337536', '13049337536', '4921569', '', 'd45ef3b6289b758c0050fd3443ce6573', '02d', '3aa3ab281b858d455e94d2e925fed774', '02d', '0', '1591077388', '112.96.132.95', '1', '1', 's9viikr22flpt02sd807mprs15', '0', null, null, '1', '--', '0', 'toux-icon.png', null, '0.0000', '1', '0', '0.0000', '0', '0xc83a9dc9704ce5c5854bb10c00dff7f7aa4044ed', '1', '0', '2-5', '', '', '10.0000', '0.0000', '0.0000', '0', '0', '0', '0', '0', '0', 'http://tt.demo88.top/Public/user/default.jpg', '', '用户7147125', 'pE4rivjSWkWvTzWwYad/gQ==', '2020-06-02', '0');
INSERT INTO `ysk_user` VALUES ('8952', '8803', '8802', '8800', '13200000000', '13200000000', '1929168', '', 'cbeab72bb65ef4094d5eb7ab7498c05e', '6c9', 'b8d99035c929402f5a5db89097c9fadf', '6c9', '0', '1591865987', '192.168.0.94', '1', '1', '34gnpiad24e6rsgv4spp2q32i1', '0', null, null, '30', '-8570-8599-8641-8658-8732-8733-8734-8736-8737-8748-8793-8795-8800-8802-8803-', '0', 'toux-icon.png', null, '0.0000', '1', '0', '0.0000', '0', '0x5b4d7eb1cf70c09338f7e810dab3d4fb4b91af68', '1', '0', '2-5', '123123123123123123', '123', '0.0833', '0.0000', '0.0000', '1', '1', '0', '2', '0', '0', 'http://192.168.0.94/Public/user/default.jpg', '', '设置昵称', 'QXSjPyfyKqWYxbW7IoHczw==', '2020-06-11', '0');
INSERT INTO `ysk_user` VALUES ('8953', '8952', '8803', '8802', '13211111111', '13211111111', '3530700', '', '0481f3ee738dda7c5216a093d85daa3f', 'b9e', '2a4cb9d097584dee31b81ef9c91924e6', 'b9e', '0', '1591866023', '192.168.0.94', '1', '1', '34gnpiad24e6rsgv4spp2q32i1', '0', null, null, '31', '-8570-8599-8641-8658-8732-8733-8734-8736-8737-8748-8793-8795-8800-8802-8803-8952-', '0', 'toux-icon.png', null, '0.0000', '1', '0', '0.0000', '0', '0xfc9db616e49c55ee0f40d3df32bb7bdd5e61ab83', '1', '0', '2-5', '123123123123123123', '123', '5.0300', '10.0000', '0.0000', '1', '1', '0', '2', '0', '0', 'http://192.168.0.94/Public/user/default.jpg', '', '设置昵称', '80qhq4CbrdqNz1s5xzUwiQ==', '2020-06-11', '0');
INSERT INTO `ysk_user` VALUES ('8954', '8803', '8802', '8800', '13222222222', '13222222222', '8722290', '', '8e56910aa6a5f63eae055335f130e5c1', 'e5e', 'fa185bf842962f34f730cc21bf35d2f9', 'e5e', '0', '1591868054', '192.168.0.94', '1', '1', '34gnpiad24e6rsgv4spp2q32i1', '0', null, null, '30', '-8570-8599-8641-8658-8732-8733-8734-8736-8737-8748-8793-8795-8800-8802-8803-', '0', 'toux-icon.png', null, '0.0000', '1', '0', '0.0000', '0', '0x11c93bdb7522bd4a9641cd947c79d86bc755959f', '1', '0', '2-5', '123123123123123123', '123', '0.3300', '0.0000', '0.0000', '1', '1', '0', '2', '0', '0', 'http://192.168.0.94/Public/user/default.jpg', '', '设置昵称', 'TGOLcCqMxDOjc5mAUrCdhQ==', '2020-06-11', '0');
INSERT INTO `ysk_user` VALUES ('8955', '8954', '8803', '8802', '13233333333', '13233333333', '8908233', '', 'dd296c4338ea13d0aa0b65612bd09697', 'c9c', '41f189984868fe109819efd6c8505fe4', 'c9c', '0', '1591868077', '192.168.0.94', '1', '1', null, '0', null, null, '31', '-8570-8599-8641-8658-8732-8733-8734-8736-8737-8748-8793-8795-8800-8802-8803-8954-', '0', 'toux-icon.png', null, '0.0000', '1', '0', '0.0000', '0', '0x3fde3cf40150d14e6b020ec801597a505e40f445', '1', '0', '2-5', '', '', '0.0000', '0.0000', '0.0000', '0', '0', '0', '0', '0', '0', 'http://192.168.0.94/Public/user/default.jpg', '', '设置昵称', 'N1EueUZfHYSMcQP8VWIdnA==', '2020-06-11', '0');
INSERT INTO `ysk_user` VALUES ('8956', '8803', '8802', '8800', '13200000001', '13200000001', '9040618', '', '59b65bc9a3d1d780ee907df4496d25a6', '7f5', '781df1ba23a5204d27ab1394116e8ea1', '7f5', '0', '1591868847', '192.168.0.94', '1', '1', '34gnpiad24e6rsgv4spp2q32i1', '0', null, null, '30', '-8570-8599-8641-8658-8732-8733-8734-8736-8737-8748-8793-8795-8800-8802-8803-', '0', 'toux-icon.png', null, '0.0000', '1', '0', '0.0000', '0', '0x365acdd9aa6b9da2ae6b419d3417031045117801', '1', '0', '2-5', '123123123123123123', '123', '0.3467', '0.0000', '0.0000', '1', '1', '0', '2', '0', '0', 'http://192.168.0.94/Public/user/default.jpg', '', '设置昵称', 't63f+emFzcrOyMH6FZmj7g==', '2020-06-11', '0');
INSERT INTO `ysk_user` VALUES ('8957', '8956', '8803', '8802', '13200000002', '13200000002', '4341491', '', 'b272abe1e7d22e380de8225cb99e038e', 'e73', '3584357373f247f3a9b2d97e4c1b559b', 'e73', '0', '1591868881', '192.168.0.94', '1', '1', '34gnpiad24e6rsgv4spp2q32i1', '0', null, null, '31', '-8570-8599-8641-8658-8732-8733-8734-8736-8737-8748-8793-8795-8800-8802-8803-8956-', '0', 'toux-icon.png', null, '0.0000', '1', '0', '0.0000', '0', '0xb8828a8c9e7d7ae7f6d413e96f48026bf87255a6', '1', '0', '2-5', '123123123123123123', '123', '0.3301', '0.0000', '0.0000', '1', '1', '0', '2', '0', '0', 'http://192.168.0.94/Public/user/default.jpg', '', '设置昵称', 'NX/qHRHJ/DZo66bv0AR07Q==', '2020-06-11', '0');
INSERT INTO `ysk_user` VALUES ('8958', '8803', '8802', '8800', '13200000003', '13200000003', '9197448', '', 'bd84dfac219c684802aae5a872480c63', '033', 'd74391b28729ecad03cf8969e475240a', '033', '0', '1591941762', '192.168.0.94', '1', '1', '34gnpiad24e6rsgv4spp2q32i1', '0', null, null, '30', '-8570-8599-8641-8658-8732-8733-8734-8736-8737-8748-8793-8795-8800-8802-8803-', '0', 'toux-icon.png', null, '0.0000', '1', '0', '0.0000', '0', '0x846f788f5cc78ccb18f6d2c9557169f7bdd9cb4b', '1', '0', '2-5', '123123123123123123', '123', '300.0000', '0.0000', '0.0000', '1', '1', '0', '2', '0', '0', 'http://192.168.0.94/Public/user/default.jpg', '', '设置昵称', 'GuaGXq7YwX35Ss1X22Nc3Q==', '2020-06-12', '0');
INSERT INTO `ysk_user` VALUES ('8959', '8803', '8802', '8800', '13200000004', '13200000004', '5430786', '', '1f1be4055385ecc5a46a8dba1269e6b2', '944', 'c0dadb0dc8ab05b70d7f158b688c43af', '944', '0', '1591949157', '192.168.0.94', '1', '1', '34gnpiad24e6rsgv4spp2q32i1', '0', null, null, '30', '-8570-8599-8641-8658-8732-8733-8734-8736-8737-8748-8793-8795-8800-8802-8803-', '0', 'toux-icon.png', null, '0.0000', '1', '0', '0.0000', '0', '0x535e9c268511d84150bee21ea640e44742c44ab7', '1', '0', '2-5', '123123123123123123', '123', '0.0000', '0.0000', '0.0000', '1', '1', '0', '2', '0', '0', 'http://192.168.0.94/Public/user/default.jpg', '', '设置昵称', '4UdZoZq5h6KpOnDw7TLcRw==', '2020-06-12', '0');
INSERT INTO `ysk_user` VALUES ('8960', '8803', '8802', '8800', '13200000005', '13200000005', '4756774', '', 'e7fef9eaa7a34ae29cb17c210bc9ee5b', 'c3e', '9017b923c244c252681b60f7a84a3c9d', 'c3e', '0', '1591949197', '192.168.0.94', '1', '1', '34gnpiad24e6rsgv4spp2q32i1', '0', null, null, '30', '-8570-8599-8641-8658-8732-8733-8734-8736-8737-8748-8793-8795-8800-8802-8803-', '0', 'toux-icon.png', null, '0.0000', '1', '0', '0.0000', '0', '0xd9a91f2c2ce7e6cd29c72c4ccd3a782bcef1ada2', '1', '0', '2-5', '123123123123123123', '123', '0.0000', '0.0000', '0.0000', '1', '1', '0', '2', '0', '0', 'http://192.168.0.94/Public/user/default.jpg', '', '设置昵称', 'WAqHv9cJYqLogz3+HdE44Q==', '2020-06-12', '0');
INSERT INTO `ysk_user` VALUES ('8961', '8803', '8802', '8800', '13200000006', '13200000006', '4593078', '', '7e8324724e5880aed71bbaab9a977410', 'edc', '75206f524a816ed1bda2889d4f5def94', 'edc', '0', '1591949798', '192.168.0.94', '1', '1', '34gnpiad24e6rsgv4spp2q32i1', '0', null, null, '30', '-8570-8599-8641-8658-8732-8733-8734-8736-8737-8748-8793-8795-8800-8802-8803-', '0', 'toux-icon.png', null, '0.0000', '1', '0', '0.0000', '0', '0x788bc3fb5a1b8fd73fed943f96a2733817b097d2', '1', '0', '2-5', '', '', '0.0000', '0.0000', '0.0000', '0', '0', '0', '0', '0', '0', 'http://192.168.0.94/Public/user/default.jpg', '', '设置昵称', 'YOas6CQV694GwA6leDTuuw==', '2020-06-12', '0');
INSERT INTO `ysk_user` VALUES ('8962', '8803', '8802', '8800', '13200000007', '13200000007', '5469512', '', '1918c0c53e93a99dee49dbfacaa3bbc0', '478', '4ab11b6780701c87d047c7e4013d0e91', '478', '0', '1591949828', '192.168.0.94', '1', '1', 'b2f4g5ds76pskfd4qas3i5f726', '0', null, null, '30', '-8570-8599-8641-8658-8732-8733-8734-8736-8737-8748-8793-8795-8800-8802-8803-', '0', 'toux-icon.png', null, '0.0000', '1', '0', '0.0000', '0', '0x470f2139c1d9d0112bd2f61c4d35afc66df8b2db', '0', '0', '2-5', '', '', '0.0000', '0.0000', '0.0000', '0', '0', '0', '0', '0', '0', 'http://192.168.0.94/Public/user/default.jpg', '', '设置昵称', 'URJXRc8Rjg/qgKDM6Wbaog==', '2020-06-12', '0');

-- ----------------------------
-- Table structure for `ysk_user_action`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_user_action`;
CREATE TABLE `ysk_user_action` (
  `ua_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(40) NOT NULL COMMENT 'frontend,backend',
  `user_id` int(11) NOT NULL,
  `uname` varchar(40) NOT NULL COMMENT '用户名',
  `add_time` varchar(40) NOT NULL COMMENT '加入时间',
  `info` varchar(255) NOT NULL COMMENT '行为描述',
  PRIMARY KEY (`ua_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=250 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户行为';

-- ----------------------------
-- Records of ysk_user_action
-- ----------------------------

-- ----------------------------
-- Table structure for `ysk_user_clock`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_user_clock`;
CREATE TABLE `ysk_user_clock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `lasttime` int(11) NOT NULL COMMENT '最后打卡时间',
  `get_num` decimal(10,4) NOT NULL COMMENT '获得的灵石',
  `status` int(1) DEFAULT '0' COMMENT '0未领取；1已领取',
  `user_scroll_id` int(11) DEFAULT NULL COMMENT '用户铭文ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户打卡时间记录';

-- ----------------------------
-- Records of ysk_user_clock
-- ----------------------------

-- ----------------------------
-- Table structure for `ysk_user_compla`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_user_compla`;
CREATE TABLE `ysk_user_compla` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '收款投诉id',
  `deal_id` int(11) NOT NULL COMMENT '订单id',
  `status` tinyint(1) NOT NULL COMMENT '处理情况:0处理中，1成功，2,失败',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='交易投诉';

-- ----------------------------
-- Records of ysk_user_compla
-- ----------------------------
INSERT INTO `ysk_user_compla` VALUES ('1', '8819', '401', '1');
INSERT INTO `ysk_user_compla` VALUES ('2', '8936', '666', '1');
INSERT INTO `ysk_user_compla` VALUES ('3', '8936', '665', '1');
INSERT INTO `ysk_user_compla` VALUES ('4', '8936', '680', '1');
INSERT INTO `ysk_user_compla` VALUES ('5', '8936', '679', '1');
INSERT INTO `ysk_user_compla` VALUES ('6', '8936', '678', '2');

-- ----------------------------
-- Table structure for `ysk_user_copy`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_user_copy`;
CREATE TABLE `ysk_user_copy` (
  `userid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL COMMENT '上级ID',
  `gid` int(11) NOT NULL DEFAULT '0' COMMENT '上上级ID',
  `ggid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上上上级ID',
  `account` char(20) NOT NULL DEFAULT '0' COMMENT '用户账号',
  `mobile` char(20) NOT NULL COMMENT '用户手机号',
  `username` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `safety_pwd` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT '安全密码',
  `safety_salt` char(5) CHARACTER SET latin1 NOT NULL,
  `login_pwd` varchar(32) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `login_salt` char(3) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `sex` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-女 1-男',
  `reg_date` int(11) NOT NULL COMMENT '注册时间',
  `reg_ip` varchar(20) NOT NULL COMMENT '注册IP',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '用户锁定  1 不锁  0拉黑  -1 删除',
  `activate` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否激活 1-已激活 0-未激活',
  `session_id` varchar(225) DEFAULT NULL,
  `wx_no` varchar(20) DEFAULT '0' COMMENT '微信',
  `alipay` varchar(20) DEFAULT NULL,
  `note` text,
  `deep` int(11) NOT NULL DEFAULT '0',
  `path` text,
  `user_credit` int(11) NOT NULL DEFAULT '5' COMMENT '用户星级',
  `use_grade` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户等级',
  `img_head` varchar(100) NOT NULL DEFAULT 'toux-icon.png' COMMENT '用户头像',
  `bank_uname` varchar(20) NOT NULL COMMENT '开户名',
  `releas_rate` float(10,4) NOT NULL DEFAULT '0.0000' COMMENT '增加的释放率',
  `releas_time` char(40) NOT NULL DEFAULT '1' COMMENT '释放时间',
  `is_reward` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0->默认未领取奖金,1->已经领取积分释放',
  `today_releas` float(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '今日释放率',
  `is_dailishang` tinyint(1) NOT NULL DEFAULT '0' COMMENT '2->商家',
  `wallet_add` text NOT NULL COMMENT '个人钱包地址',
  PRIMARY KEY (`userid`) USING BTREE,
  UNIQUE KEY `mobile` (`mobile`) USING BTREE,
  UNIQUE KEY `account` (`account`) USING BTREE,
  KEY `username` (`username`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4064 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ysk_user_copy
-- ----------------------------

-- ----------------------------
-- Table structure for `ysk_user_dogeat`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_user_dogeat`;
CREATE TABLE `ysk_user_dogeat` (
  `uid` int(11) NOT NULL COMMENT '用户id',
  `num` int(11) NOT NULL COMMENT '总种子数量',
  `create_time` int(11) NOT NULL,
  `datestr` varchar(11) NOT NULL DEFAULT '0.00' COMMENT '扣除手续费后的数量',
  PRIMARY KEY (`uid`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ysk_user_dogeat
-- ----------------------------

-- ----------------------------
-- Table structure for `ysk_user_huafei`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_user_huafei`;
CREATE TABLE `ysk_user_huafei` (
  `uid` int(11) unsigned NOT NULL COMMENT '用户每天产生的化肥',
  `huafei_num` decimal(11,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '当天产生的肥料',
  `datestr` char(20) CHARACTER SET utf16 NOT NULL DEFAULT '',
  `uid_str` varchar(255) NOT NULL DEFAULT '',
  `pid_caimi` int(11) NOT NULL DEFAULT '0' COMMENT '一级采蜜',
  `gid_caimi` int(11) NOT NULL DEFAULT '0' COMMENT '二级采蜜',
  `ggid_caimi` int(11) NOT NULL DEFAULT '0' COMMENT '三级采蜜',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ysk_user_huafei
-- ----------------------------

-- ----------------------------
-- Table structure for `ysk_user_level`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_user_level`;
CREATE TABLE `ysk_user_level` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `title` varchar(50) NOT NULL COMMENT '等级名称',
  `is_real_name` tinyint(1) NOT NULL COMMENT '是否实名：0，否，1，是',
  `push_num` int(11) NOT NULL DEFAULT '0' COMMENT '升级达到的经验值',
  `level_id` int(11) NOT NULL DEFAULT '0' COMMENT '直推所需达到等级',
  `tran_fee` int(11) NOT NULL COMMENT '手续费',
  `scroll_id` int(11) NOT NULL DEFAULT '0' COMMENT '赠送矿机',
  `scroll_num` int(11) NOT NULL DEFAULT '0' COMMENT '赠送矿机数量',
  `vip_grade` int(2) NOT NULL COMMENT '相对应的等级',
  `service_charge` int(11) NOT NULL DEFAULT '0' COMMENT '手续费（%）',
  `active_num` int(11) NOT NULL COMMENT '所需活跃度',
  `img` varchar(255) NOT NULL COMMENT '图片',
  `state` int(11) NOT NULL DEFAULT '1' COMMENT '0->关闭1->开启',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf16 ROW_FORMAT=FIXED;

-- ----------------------------
-- Records of ysk_user_level
-- ----------------------------
INSERT INTO `ysk_user_level` VALUES ('1', '用户等级Lv1', '1', '10', '0', '30', '1', '1', '1', '0', '0', '/Uploads/2019-04-25/5cc1849128c50.png', '1');
INSERT INTO `ysk_user_level` VALUES ('2', '用户等级Lv2', '1', '50', '0', '27', '0', '0', '2', '0', '0', '/Uploads/2019-04-25/5cc184af378d3.png', '1');
INSERT INTO `ysk_user_level` VALUES ('3', '用户等级Lv3', '1', '1000', '2', '25', '0', '0', '3', '0', '0', '/Uploads/2019-04-25/5cc184bfd9ea2.png', '1');
INSERT INTO `ysk_user_level` VALUES ('4', '无', '1', '0', '4', '0', '0', '0', '3', '0', '0', '/Uploads/2019-04-25/5cc18510179a7.png', '0');
INSERT INTO `ysk_user_level` VALUES ('5', '无', '1', '0', '5', '0', '0', '0', '4', '0', '0', '/Uploads/2019-04-26/5cc25e1d741c1.png', '0');
INSERT INTO `ysk_user_level` VALUES ('6', '无', '1', '0', '4', '0', '0', '0', '5', '0', '0', '/Uploads/2019-04-26/5cc25e3c46555.png', '0');

-- ----------------------------
-- Table structure for `ysk_user_pay`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_user_pay`;
CREATE TABLE `ysk_user_pay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_fee` decimal(11,2) NOT NULL DEFAULT '1.00' COMMENT '支付金额',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `order_no` varchar(255) NOT NULL COMMENT '订单号(唯一）',
  `me_back_url` varchar(255) NOT NULL COMMENT '用户转向页面',
  `notify_url` varchar(255) NOT NULL COMMENT '回调通知地址',
  `overdue_time` int(11) NOT NULL COMMENT '过期时间',
  `param` varchar(255) NOT NULL COMMENT '其他参数',
  `sign` varchar(100) NOT NULL COMMENT '签名',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ysk_user_pay
-- ----------------------------

-- ----------------------------
-- Table structure for `ysk_user_scroll`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_user_scroll`;
CREATE TABLE `ysk_user_scroll` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `scroll_id` int(11) NOT NULL COMMENT '卷轴id',
  `overtime` int(11) NOT NULL COMMENT '过期时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态：0未领取，1已领取',
  `sell_num` decimal(11,0) DEFAULT NULL COMMENT '扣除数量',
  `scroll_num` int(11) NOT NULL DEFAULT '1' COMMENT '铭文数量',
  `reward_num` decimal(11,0) NOT NULL COMMENT '总产量',
  `single_num` decimal(11,2) NOT NULL COMMENT '单产量',
  `max_day` int(11) DEFAULT NULL COMMENT '周期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='用户购买卷轴关系表';

-- ----------------------------
-- Records of ysk_user_scroll
-- ----------------------------
INSERT INTO `ysk_user_scroll` VALUES ('13', '8937', '2', '1592717529', '0', '50', '1', '13', '2.05', '30');
INSERT INTO `ysk_user_scroll` VALUES ('14', '8937', '1', '1592717529', '0', '10', '1', '13', '0.50', '25');
INSERT INTO `ysk_user_scroll` VALUES ('15', '8936', '2', '1592356184', '1', '50', '1', '13', '2.05', '30');
INSERT INTO `ysk_user_scroll` VALUES ('16', '8936', '1', '1592356184', '1', '10', '1', '13', '0.50', '25');
INSERT INTO `ysk_user_scroll` VALUES ('17', '8946', '1', '1593607617', '0', '0', '1', '10', '0.00', '30');
INSERT INTO `ysk_user_scroll` VALUES ('18', '8803', '1', '1594439073', '1', null, '1', '0', '0.33', null);
INSERT INTO `ysk_user_scroll` VALUES ('19', '8803', '6', '1594452744', '1', null, '0', '0', '134.00', null);
INSERT INTO `ysk_user_scroll` VALUES ('20', '8803', '7', '1594452744', '1', null, '0', '0', '225.00', null);
INSERT INTO `ysk_user_scroll` VALUES ('21', '8952', '1', '1594458063', '0', null, '1', '0', '0.33', null);
INSERT INTO `ysk_user_scroll` VALUES ('22', '8953', '1', '1594458109', '0', null, '1', '0', '0.33', null);
INSERT INTO `ysk_user_scroll` VALUES ('23', '8953', '3', '1594459413', '0', '100', '1', '131', '4.37', '30');
INSERT INTO `ysk_user_scroll` VALUES ('24', '8954', '1', '1594460108', '0', null, '1', '0', '0.33', null);
INSERT INTO `ysk_user_scroll` VALUES ('25', '8956', '1', '1594460918', '0', '10', '1', '0', '0.33', '30');
INSERT INTO `ysk_user_scroll` VALUES ('26', '8957', '1', '1594460973', '0', '10', '1', '0', '0.33', '30');
INSERT INTO `ysk_user_scroll` VALUES ('27', '8958', '1', '1594535841', '0', '10', '1', '0', '0.33', '30');
INSERT INTO `ysk_user_scroll` VALUES ('28', '8803', '2', '321', '0', '10', '1', '0', '0.43', '30');
INSERT INTO `ysk_user_scroll` VALUES ('29', '8960', '1', '1594541399', '0', '10', '1', '0', '0.33', '30');
INSERT INTO `ysk_user_scroll` VALUES ('30', '8959', '1', '1594541399', '0', '10', '1', '0', '0.33', '30');
INSERT INTO `ysk_user_scroll` VALUES ('31', '8949', '1', '1594541497', '0', '10', '1', '0', '0.33', '30');
INSERT INTO `ysk_user_scroll` VALUES ('32', '8947', '1', '1594541497', '0', '10', '1', '0', '0.33', '30');
INSERT INTO `ysk_user_scroll` VALUES ('33', '8936', '1', '1595729965', '1', null, '1', '0', '0.33', null);
INSERT INTO `ysk_user_scroll` VALUES ('34', '8936', '1', '1594871349', '1', '10', '1', '0', '0.33', '30');
INSERT INTO `ysk_user_scroll` VALUES ('35', '8936', '1', '1594871655', '1', '10', '1', '0', '0.33', '30');
INSERT INTO `ysk_user_scroll` VALUES ('36', '8803', '3', '1595839867', '0', '100', '1', '0', '4.37', '30');
INSERT INTO `ysk_user_scroll` VALUES ('37', '8803', '3', '1595841463', '1', '100', '0', '0', '4.37', '30');

-- ----------------------------
-- Table structure for `ysk_user_seed`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_user_seed`;
CREATE TABLE `ysk_user_seed` (
  `uid` int(11) unsigned NOT NULL COMMENT '用户种子',
  `zhongzi_num` decimal(11,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf16 ROW_FORMAT=FIXED;

-- ----------------------------
-- Records of ysk_user_seed
-- ----------------------------
INSERT INTO `ysk_user_seed` VALUES ('1', '0.00');

-- ----------------------------
-- Table structure for `ysk_user_skin`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_user_skin`;
CREATE TABLE `ysk_user_skin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `skin_id` int(11) NOT NULL COMMENT '皮肤id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ysk_user_skin
-- ----------------------------

-- ----------------------------
-- Table structure for `ysk_user_star`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_user_star`;
CREATE TABLE `ysk_user_star` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL COMMENT '名称',
  `push_num` int(11) NOT NULL COMMENT '有效直推育成',
  `team_active` int(11) NOT NULL COMMENT '团队活跃度',
  `user_active` int(11) NOT NULL COMMENT '本人活跃度',
  `get_fee` int(11) NOT NULL COMMENT '共享全球的手续费（%）',
  `scroll_id` int(11) NOT NULL COMMENT '奖励卷轴id',
  `push_id` int(5) NOT NULL COMMENT '有效直推达人id',
  `scroll_num` int(11) DEFAULT '0' COMMENT '奖励铭文数量',
  `state` int(11) NOT NULL DEFAULT '1' COMMENT '0->关闭1->开启',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ysk_user_star
-- ----------------------------
INSERT INTO `ysk_user_star` VALUES ('1', '一星达人', '0', '2500', '0', '20', '3', '0', '0', '1');
INSERT INTO `ysk_user_star` VALUES ('2', '二星达人', '0', '10000', '0', '25', '4', '0', '0', '1');
INSERT INTO `ysk_user_star` VALUES ('3', '三星达人', '0', '25000', '0', '17', '5', '0', '0', '1');
INSERT INTO `ysk_user_star` VALUES ('4', '四星达人', '0', '70000', '0', '13', '6', '0', '0', '1');
INSERT INTO `ysk_user_star` VALUES ('5', '五星达人', '0', '120000', '0', '10', '7', '0', '0', '1');
INSERT INTO `ysk_user_star` VALUES ('6', '璀璨钻石', '2', '100000', '0', '5', '0', '5', '0', '0');
INSERT INTO `ysk_user_star` VALUES ('7', '超凡大师', '2', '200000', '0', '4', '0', '6', '0', '0');
INSERT INTO `ysk_user_star` VALUES ('8', '傲世宗师', '2', '1000000', '0', '4', '0', '7', '0', '0');
INSERT INTO `ysk_user_star` VALUES ('9', '最强王者', '2', '2000000', '0', '3', '0', '8', '0', '0');

-- ----------------------------
-- Table structure for `ysk_user_tool_month`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_user_tool_month`;
CREATE TABLE `ysk_user_tool_month` (
  `uid` int(11) unsigned NOT NULL COMMENT '用户种子',
  `oneclick` int(11) NOT NULL DEFAULT '0',
  `buy_oneclick_time` int(11) NOT NULL DEFAULT '0',
  `end_oneclick_time` int(11) NOT NULL,
  `dogfood` int(11) NOT NULL COMMENT '狗粮',
  `buy_dogfood_time` int(11) NOT NULL DEFAULT '0',
  `end_dogfood_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf16 ROW_FORMAT=FIXED;

-- ----------------------------
-- Records of ysk_user_tool_month
-- ----------------------------

-- ----------------------------
-- Table structure for `ysk_user_verify`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_user_verify`;
CREATE TABLE `ysk_user_verify` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `id_card` varchar(18) NOT NULL COMMENT '身份证',
  `truename` varchar(10) NOT NULL COMMENT '真实姓名',
  `phone` varchar(11) NOT NULL COMMENT '手机号',
  `alipay_number` varchar(25) NOT NULL COMMENT '支付宝号',
  `pic1` varchar(255) NOT NULL COMMENT '身份证正面',
  `pic2` varchar(255) NOT NULL COMMENT '身份证反面',
  `time` int(11) NOT NULL COMMENT '提交时间',
  `is_verify` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否验证过：0未审核，1通过，2未通过',
  `pic3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25629 DEFAULT CHARSET=utf8 COMMENT='用户实名认证';

-- ----------------------------
-- Records of ysk_user_verify
-- ----------------------------
INSERT INTO `ysk_user_verify` VALUES ('25613', '8936', '420012198801011234', '小橘子啊', '', '', 'http://192.168.0.164/Public/user/2020-05-19/5ec3456498d38.jpg', 'http://192.168.0.164/Public/user/2020-05-19/5ec345695c81a.jpg', '1589855594', '2', null);
INSERT INTO `ysk_user_verify` VALUES ('25615', '8946', '420012198801011235', '小飞猪', '', '', 'http://192.168.0.164/Public/user/2020-05-22/5ec7402669248.jpg', 'http://192.168.0.164/Public/user/2020-05-22/5ec7402bae85b.jpg', '1590116397', '1', null);
INSERT INTO `ysk_user_verify` VALUES ('25616', '8947', '440803111111111111', '炮武', '', '', 'http://tt.demo88.top/Public/user/2020-06-02/5ed5cbc84c2c0.jpg', 'http://tt.demo88.top/Public/user/2020-06-02/5ed5cbd855f00.jpg', '1591069661', '1', null);
INSERT INTO `ysk_user_verify` VALUES ('25617', '8949', '430503199101134516', '夏准', '', '', 'http://tt.demo88.top/Public/user/2020-06-02/5ed5e12464960.jpg', 'http://tt.demo88.top/Public/user/2020-06-02/5ed5e12b33c20.jpg', '1591075131', '1', null);
INSERT INTO `ysk_user_verify` VALUES ('25618', '8803', '123123123123123123', '123', '', '', 'http://192.168.0.94/Public/user/2020-06-11/5ee1a858822d3.jpg', 'http://192.168.0.94/Public/user/2020-06-11/5ee1a85b0ec82.jpg', '1591847011', '1', null);
INSERT INTO `ysk_user_verify` VALUES ('25619', '8952', '123123123123123123', '123', '', '', 'http://192.168.0.94/Public/user/2020-06-11/5ee1f2c3040d9.jpg', 'http://192.168.0.94/Public/user/2020-06-11/5ee1f2c4ac9d7.jpg', '1591866053', '1', null);
INSERT INTO `ysk_user_verify` VALUES ('25620', '8953', '123123123123123123', '123', '', '', 'http://192.168.0.94/Public/user/2020-06-11/5ee1f2f05e2ce.jpg', 'http://192.168.0.94/Public/user/2020-06-11/5ee1f2f214fb1.jpg', '1591866101', '1', null);
INSERT INTO `ysk_user_verify` VALUES ('25621', '8954', '123123123123123123', '123', '', '', 'http://192.168.0.94/Public/user/2020-06-11/5ee1fac561465.jpg', 'http://192.168.0.94/Public/user/2020-06-11/5ee1fac6e612e.jpg', '1591868103', '1', null);
INSERT INTO `ysk_user_verify` VALUES ('25622', '8956', '123123123123123123', '123', '', '', 'http://192.168.0.94/Public/user/2020-06-11/5ee1fde9bd4de.jpg', 'http://192.168.0.94/Public/user/2020-06-11/5ee1fdeb7de29.jpg', '1591868908', '1', null);
INSERT INTO `ysk_user_verify` VALUES ('25623', '8957', '123123123123123123', '123', '', '', 'http://192.168.0.94/Public/user/2020-06-11/5ee1fe243ef14.jpg', 'http://192.168.0.94/Public/user/2020-06-11/5ee1fe260501b.jpg', '1591868966', '1', null);
INSERT INTO `ysk_user_verify` VALUES ('25624', '8958', '123123123123123123', '123', '', '', 'http://192.168.0.94/Public/user/2020-06-12/5ee3229653354.jpg', 'http://192.168.0.94/Public/user/2020-06-12/5ee3229966c22.jpg', '1591943834', '1', null);
INSERT INTO `ysk_user_verify` VALUES ('25625', '8959', '123123123123123123', '123', '', '', 'http://192.168.0.94/Public/user/2020-06-12/5ee3377d62f19.jpg', 'http://192.168.0.94/Public/user/2020-06-12/5ee3377f636ba.jpg', '1591949184', '1', null);
INSERT INTO `ysk_user_verify` VALUES ('25626', '8960', '123123123123123123', '123', '', '', 'http://192.168.0.94/Public/user/2020-06-12/5ee3379ef23bb.jpg', 'http://192.168.0.94/Public/user/2020-06-12/5ee337a09d983.jpg', '1591949217', '1', null);
INSERT INTO `ysk_user_verify` VALUES ('25627', '8961', '123123123123123123', '132', '', '', 'http://192.168.0.94/Public/user/2020-06-12/5ee339f667794.jpg', 'http://192.168.0.94/Public/user/2020-06-12/5ee339f926dcb.jpg', '1591949817', '2', null);
INSERT INTO `ysk_user_verify` VALUES ('25628', '8962', '123123123123123123', '123', '', '', 'http://192.168.0.94/Public/user/2020-06-12/5ee33a12405f7.jpg', 'http://192.168.0.94/Public/user/2020-06-12/5ee33a13d023b.jpg', '1591949844', '2', null);

-- ----------------------------
-- Table structure for `ysk_verify_list`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_verify_list`;
CREATE TABLE `ysk_verify_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '认证列表',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `account` varchar(64) NOT NULL COMMENT '账号',
  `username` varchar(64) NOT NULL COMMENT '用户名',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '认证类型 1个人 2企业',
  `realname` varchar(64) NOT NULL COMMENT '真实姓名',
  `idcard` varchar(64) NOT NULL COMMENT '身份证号',
  `phone` varchar(15) NOT NULL COMMENT '手机号码',
  `up_idcard` varchar(128) DEFAULT NULL COMMENT '身份证正面',
  `down_idcard` varchar(128) DEFAULT NULL COMMENT '身份证反面',
  `hand_idcard` varchar(128) DEFAULT NULL COMMENT '手持身份证',
  `licence` varchar(128) DEFAULT NULL COMMENT '营业执照',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0未审核 1已通过审核 2未通过审核',
  `time` varchar(12) NOT NULL COMMENT '申请时间',
  `datestr` varchar(12) NOT NULL COMMENT '日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ysk_verify_list
-- ----------------------------

-- ----------------------------
-- Table structure for `ysk_video`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_video`;
CREATE TABLE `ysk_video` (
  `video_id` int(11) NOT NULL AUTO_INCREMENT,
  `aliyun_video_id` varchar(255) DEFAULT NULL COMMENT '阿里云video_id',
  `video_url` text COMMENT '视频链接地址',
  `user_id` int(11) DEFAULT NULL COMMENT '上传者',
  `status` int(2) DEFAULT '0' COMMENT '审核状态 0未审核 1通过 2失败',
  `show` int(2) DEFAULT '2' COMMENT '1不显示；2显示',
  `video_title` varchar(200) DEFAULT NULL COMMENT '视频标题',
  `video_describe` varchar(255) DEFAULT NULL COMMENT '视频描述',
  `cover_url` text COMMENT '封面图',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `verify_time` int(11) DEFAULT NULL COMMENT '审核通过时间',
  `city` varchar(255) DEFAULT NULL COMMENT '城市',
  `is_tuijian` int(2) DEFAULT '0' COMMENT '1推荐 0否',
  `lng` varchar(200) DEFAULT NULL COMMENT '经度',
  `lat` varchar(200) DEFAULT NULL COMMENT '纬度',
  `category_id` int(11) DEFAULT '0' COMMENT '分类id',
  PRIMARY KEY (`video_id`)
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ysk_video
-- ----------------------------
INSERT INTO `ysk_video` VALUES ('57', 'd3bb0a0eeebb4f3cb939fc33d9789edb', 'https://outin-28be35439e6911ea8a4100163e1c35d5.oss-cn-shanghai.aliyuncs.com/sv/1dc7d259-1725e3985a7/1dc7d259-1725e3985a7.mp4?Expires=1590722327&OSSAccessKeyId=LTAIwkKSLcUfI2u4&Signature=8LvQ1AVVboZx91Vwt02j%2BF6XI30%3D', '8936', '1', '1', '第一个短视频', '留下你的描述吧，第一个短视频上传', 'http://outin-28be35439e6911ea8a4100163e1c35d5.oss-cn-shanghai.aliyuncs.com/d3bb0a0eeebb4f3cb939fc33d9789edb/snapshots/1d21a6ba67914fdea639905f7b4b63f8-00001.jpg?Expires=1590723259&amp;OSSAccessKeyId=LTAIwkKSLcUfI2u4&amp;Signature=eLhctQCi6RR6m0B4rLHyA5UABzk%3D', '1590718726', null, '广州', '1', '', '', '0');
INSERT INTO `ysk_video` VALUES ('58', 'eedc6ecf64374cb484b2095bf1538f26', 'https://outin-28be35439e6911ea8a4100163e1c35d5.oss-cn-shanghai.aliyuncs.com/sv/4314f4e6-1725e40b48d/4314f4e6-1725e40b48d.mp4?Expires=1590722798&OSSAccessKeyId=LTAIwkKSLcUfI2u4&Signature=bNT5xBPwowbZQ9QUMOQi0a2jJAo%3D', '8936', '1', '1', '短视频2', '短视频2222222222222222222222222', 'http://outin-28be35439e6911ea8a4100163e1c35d5.oss-cn-shanghai.aliyuncs.com/eedc6ecf64374cb484b2095bf1538f26/snapshots/e9ac4d03e51d4c9f9993359f2c073f03-00001.jpg?Expires=1590723249&amp;OSSAccessKeyId=LTAIwkKSLcUfI2u4&amp;Signature=LX2B4NFRkAFPf%2FtC48qPGjkyswk%3D', '1590719196', null, '广州', '1', '', '', '0');
INSERT INTO `ysk_video` VALUES ('65', '442d66b6789d4ade9c7b001df267e8ee', 'https://outin-28be35439e6911ea8a4100163e1c35d5.oss-cn-shanghai.aliyuncs.com/sv/366ea2ff-1725f178291/366ea2ff-1725f178291.mp4?Expires=1590736875&OSSAccessKeyId=LTAIwkKSLcUfI2u4&Signature=D8mxc1MZWcqN8rdvUFYh2aPSlu4%3D', '8803', '1', '1', '第三个视频', '第三个视频第三个视频第三个视频第三个视频第三个视频第三个视频', 'http://outin-28be35439e6911ea8a4100163e1c35d5.oss-cn-shanghai.aliyuncs.com/442d66b6789d4ade9c7b001df267e8ee/snapshots/e56982560c874be194bccb184f581804-00001.jpg?Expires=1591021707&amp;OSSAccessKeyId=LTAIwkKSLcUfI2u4&amp;Signature=X%2BMGbf96S1m1qSynz5yByP2%2FxLg%3D', '1590733274', null, '广东省广州市白云区白云湖街道世盛精品酒店(广州白云外语外贸大学夏茅汽车站店)世盛展览中心', '1', '113.262457', '23.22544', '0');
INSERT INTO `ysk_video` VALUES ('66', '97ae83bf65ae4357a7638dd72db003ca', 'https://outin-28be35439e6911ea8a4100163e1c35d5.oss-cn-shanghai.aliyuncs.com/sv/444aa0b5-172b7006864/444aa0b5-172b7006864.mp4?Expires=1592211756&OSSAccessKeyId=LTAIwkKSLcUfI2u4&Signature=7v9USlUhAV%2FH4ynBxvLdSKbmqzI%3D', '8803', '1', '1', '123', '123', null, '1592208156', null, '', '1', '', null, '0');
INSERT INTO `ysk_video` VALUES ('67', 'f14b70715cdd4d238d829c783d8a791a', 'https://outin-28be35439e6911ea8a4100163e1c35d5.oss-cn-shanghai.aliyuncs.com/sv/b126287-172b700d910/b126287-172b700d910.mp4?Expires=1592211785&OSSAccessKeyId=LTAIwkKSLcUfI2u4&Signature=IW38%2FR0Mj6K9zcJ1IWGPrbIIwvQ%3D', '8803', '1', '1', '123', '123', null, '1592208185', null, '', '1', '', null, '0');

-- ----------------------------
-- Table structure for `ysk_video_category`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_video_category`;
CREATE TABLE `ysk_video_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(255) NOT NULL COMMENT '分类名称',
  `state` int(11) NOT NULL DEFAULT '0' COMMENT '分类状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ysk_video_category
-- ----------------------------
INSERT INTO `ysk_video_category` VALUES ('1', '666', '0');
INSERT INTO `ysk_video_category` VALUES ('2', '炮武', '1');
INSERT INTO `ysk_video_category` VALUES ('3', 'paower', '1');
INSERT INTO `ysk_video_category` VALUES ('4', '随', '1');

-- ----------------------------
-- Table structure for `ysk_wbao_detail`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_wbao_detail`;
CREATE TABLE `ysk_wbao_detail` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '每个人账户对应币',
  `num` decimal(11,4) NOT NULL DEFAULT '0.0000' COMMENT '对应币数量',
  `dprice` decimal(10,4) DEFAULT NULL COMMENT '对应的会员id',
  `tprice` decimal(10,4) DEFAULT NULL,
  `create_time` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `crowds_id` int(11) DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL COMMENT '1转出，2转入,3释放',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=57207 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- ----------------------------
-- Records of ysk_wbao_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `ysk_wentype`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_wentype`;
CREATE TABLE `ysk_wentype` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类型id',
  `title` varchar(255) NOT NULL COMMENT '类型名称',
  `addtime` varchar(222) NOT NULL COMMENT '增加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ysk_wentype
-- ----------------------------
INSERT INTO `ysk_wentype` VALUES ('3', '帮助中心', '1515470302');
INSERT INTO `ysk_wentype` VALUES ('4', '商城介绍', '1515470316');
INSERT INTO `ysk_wentype` VALUES ('5', '介绍', '1515470332');
INSERT INTO `ysk_wentype` VALUES ('6', '联系客服', '1515850423');

-- ----------------------------
-- Table structure for `ysk_wenzhang`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_wenzhang`;
CREATE TABLE `ysk_wenzhang` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(255) NOT NULL COMMENT '栏目',
  `content` text NOT NULL COMMENT '内容',
  `addtime` varchar(233) NOT NULL COMMENT '上传时间',
  `type` varchar(255) NOT NULL COMMENT '类型',
  `tid` int(22) NOT NULL COMMENT '类型id',
  `linkone` varchar(222) DEFAULT NULL COMMENT '视频连接',
  `linktwo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ysk_wenzhang
-- ----------------------------
INSERT INTO `ysk_wenzhang` VALUES ('4', '介绍', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-15/5a5c298596437.jpg&quot; style=&quot;margin:0 auto&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-15/5a5c29a988376.jpg&quot; style=&quot;margin:0 auto&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-15/5a5c29ba53e13.jpg&quot; style=&quot;margin:0 auto&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-15/5a5c29cf97db9.jpg&quot; style=&quot;margin:0 auto&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-15/5a5c29db5ddad.jpg&quot; style=&quot;margin:0 auto&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-15/5a5c29e86fa24.jpg&quot; style=&quot;margin:0 auto&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-15/5a5c29f55f22b.jpg&quot; style=&quot;margin:0 auto&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-15/5a5c2a061f5f8.jpg&quot; style=&quot;margin:0 auto&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-15/5a5c2a131a4cf.jpg&quot; style=&quot;margin:0 auto&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-15/5a5c2a2657711.jpg&quot; style=&quot;margin:0 auto&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-15/5a5c2a3328797.jpg&quot; style=&quot;margin:0 auto&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-15/5a5c2a3f2799c.jpg&quot; style=&quot;margin:0 auto&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-15/5a5c2a4ac3451.jpg&quot; style=&quot;margin:0 auto&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-15/5a5c2a5613335.jpg&quot; style=&quot;margin:0 auto&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-15/5a5c2a62d490b.jpg&quot; style=&quot;margin:0 auto&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-15/5a5c2a7235fa6.jpg&quot; style=&quot;margin:0 auto&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-15/5a5c2a7d53f6a.jpg&quot; style=&quot;margin:0 auto&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-15/5a5c2a89b24df.jpg&quot; style=&quot;margin:0 auto&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-15/5a5c2a94c10e3.jpg&quot; style=&quot;margin:0 auto&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:12px&quot;&gt;&lt;span style=&quot;background-color:rgb(0, 150, 234)&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:16px&quot;&gt;&lt;strong&gt;&amp;nbsp;Vpay是什么？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;Vpay是一个全面开放的网络支付平台，跟支付宝和微信一样，不同的是，Vpay是基于区块链技术开发的，能顺利实现点对点跨境转账，而且没有任何手续费。&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:12px&quot;&gt;&lt;span style=&quot;background-color:rgb(0, 150, 234)&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:16px&quot;&gt;&lt;strong&gt;&amp;nbsp;Vpay数字资产总量是多少？&lt;/strong&gt;&lt;/span&gt;\r\n\r\n&lt;p&gt;Vpay数字资产总量3.65亿&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:12px&quot;&gt;&lt;span style=&quot;background-color:rgb(0, 150, 234)&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:16px&quot;&gt;&lt;strong&gt;&amp;nbsp;如何查询Vpay数字资产开源代码？&lt;/strong&gt;&lt;/span&gt;\r\n\r\n&lt;p&gt;查询Vpay数字资产开源代码的方法&lt;br /&gt;\r\n第一步，打开百度搜索&amp;ldquo;比特币钱包&amp;rdquo;&lt;br /&gt;\r\n第二步，点击&amp;ldquo;比特币钱包官网下载&amp;rdquo;&lt;br /&gt;\r\n第三步，找到&amp;quot;bitcoin&amp;quot;，点击&amp;ldquo;源代码&amp;rdquo;,这时候我们将跳转到一个国际查询开源代码的网站，&amp;ldquo;github.com&amp;quot;，并显示出来了比特币的开源代码&lt;br /&gt;\r\n第四步，点击左上角的&amp;ldquo;黑白猫&amp;rdquo;图像，回到首页&lt;br /&gt;\r\n第五步，在右上角的灰色框输入&amp;ldquo;Vpay&amp;quot;按回车键&lt;br /&gt;\r\n第六步，把搜索内容拉到最下面，我们就可以看到Vpay的开源代码了，这里还可以直接下载Vpay的PC冷钱包。&lt;br /&gt;\r\nPS：我们也可以直接访问&amp;ldquo;github.com&amp;quot;查找开源代码。&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:rgb(0, 150, 234)&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:12px&quot;&gt;&lt;span style=&quot;background-color:rgb(0, 150, 234)&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;strong&gt;&amp;nbsp;Vpay运营模式是什么？&lt;/strong&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;\r\n\r\n&lt;p&gt;大家都知道，想打造一个全球的跨境支付平台！首要条件是要有大量的粉丝！没有人认可你的东西，就一文不值，跟当初的支付宝一样，几年前，放几百块在里面都怕不见了，到了现在，在支付宝里面十万，百万的人，大有人在吧！&lt;/p&gt;\r\n\r\n&lt;p&gt;既然作为全球支付软件，首先要考虑汇率的问题，Vpay采取区链块技术支持实时人民币，美元，欧元，英镑，日元&amp;hellip;&amp;hellip;等多币种实时兑换功能，秒到，且无损！&lt;/p&gt;\r\n\r\n&lt;p&gt;如何实现汇率之间恒定的问题，那我们需要一个媒介！就是数字资产，现阶段对接的是瑞波币的价格！实现各币种之间的兑换！&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:12px&quot;&gt;&lt;span style=&quot;background-color:rgb(0, 150, 234)&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:16px&quot;&gt;&lt;strong&gt;&amp;nbsp;Vpay是虚拟货币吗？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;显而易见，像我们的比特币，采取的是物理挖矿的方式进行挖矿，你的币根本没有挖矿功能，肯定是假的数字资产！&lt;/p&gt;\r\n\r\n&lt;p&gt;我们的Vpay数字资产总量恒定3.65亿，是一个开源的虚拟货币，VpayLabs预挖1000万作为种子资产，用于市场推广和团队激励，剩余3.55亿Vpay数字资产用流通算力挖矿，通过用户参与流通挖矿的方式，让所有用户持有Vpay数字资产，最终达到完全去中心化。或许有人会问，国家现在都关停虚拟币交易平台了！个人的理解是这是个好事，有监管，才可以更好的发展！国家鼓励互联网金融的百花齐放，但是前提是所有脱离是实体经济的互联网金融只是理想中的空中楼阁，是一定要取缔的！&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:12px&quot;&gt;&lt;span style=&quot;background-color:rgb(0, 150, 234)&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:16px&quot;&gt;&lt;strong&gt;&amp;nbsp;Vpay核心价值观是？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;Vpay核心价值观：流通产生价值&lt;br /&gt;\r\n流通：A转账给B的过程为流通&lt;br /&gt;\r\n增值：人与人第一次流通，系统赠送相应的积分，这个也可以说是我们的数字资产，人的价值进行挖矿！&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:12px&quot;&gt;&lt;span style=&quot;background-color:rgb(0, 150, 234)&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:16px&quot;&gt;&lt;strong&gt;&amp;nbsp;每天红包封顶吗？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;每天红包任你点，上不封顶。&lt;br /&gt;\r\nVpay无国界支付&lt;br /&gt;\r\n投多少送600%米：&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;投1米6米&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;投10米60米&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;投100米600米&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;投1000米6000米&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;投10000米60000米&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;投20000米送120000&lt;br /&gt;\r\n1米起投，上不封顶&lt;br /&gt;\r\n按积分2&amp;permil;每天分红&lt;br /&gt;\r\n今天投米，明天分米&lt;br /&gt;\r\n每天可以提现，点对点交易！ 动态2&amp;permil;～2%～10%推广越多，释放越快&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:12px&quot;&gt;&lt;span style=&quot;background-color:rgb(0, 150, 234)&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:16px&quot;&gt;&lt;strong&gt;&amp;nbsp;Vpay几个特性是？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;一：符合六大标准&lt;/strong&gt;&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;1去中心化&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;2去中央账户&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;3点对点交易&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;4有序的进出&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;5投资自由&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;6风险自控&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;二：有效规避5大风险&lt;/strong&gt;&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;1政策风险&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;2金流风险&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;3推广风险&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;4网络风险&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;5人脉风险&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;三：符合数字货币的5大属性&lt;/strong&gt;&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;1开源代码&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;2恒量发行&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;3独立钱包&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;4大盘交易&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;5商业运用&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:12px&quot;&gt;&lt;span style=&quot;background-color:rgb(0, 150, 234)&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:16px&quot;&gt;&lt;strong&gt;&amp;nbsp;Vpay的八大优势？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;1.拆分(原始发行1000万)&lt;br /&gt;\r\n2.互助(买进卖出点对点匹配打款)&lt;br /&gt;\r\n3.分红(每天最底2&amp;permil;释放)&lt;br /&gt;\r\n4.复利(放大倍增)&lt;br /&gt;\r\n5.虚拟币(区块链挖矿机制)&lt;br /&gt;\r\n6.数字资产(低进高出炒币)&lt;br /&gt;\r\n7.资产证券化(最高释放完再复投)&lt;br /&gt;\r\n8.消费返利（落地商家扫码支付）&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:12px&quot;&gt;&lt;span style=&quot;background-color:rgb(0, 150, 234)&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:16px&quot;&gt;&lt;strong&gt;&amp;nbsp;为什么说Vpay有拆分优势？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;Vpay类似拆分盘，发行原始股1000万，经过市场的繁荣也进行稳定&amp;ldquo;拆分&amp;rdquo;，但Vpay又跟拆分盘不同，基本上所有拆分盘都要半年、一年甚至一年半才能回本，而Vpay投资当天就可以回本80%，最重要的一点是，Vpay对所有的做付出做动态的人很公平，能力越强，分享越多越快，拆得越快。&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:12px&quot;&gt;&lt;span style=&quot;background-color:rgb(0, 150, 234)&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:16px&quot;&gt;&lt;strong&gt;&amp;nbsp;为什么说Vpay有互助盘的高利息和良好体验，却没有互助盘的高风险？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;Vpay的静态利息可以达到每天1.2%，比国3等互助盘的利息还要高，Vpay也没有排单币、激活码的成本。&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:12px&quot;&gt;&lt;span style=&quot;background-color:rgb(0, 150, 234)&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:16px&quot;&gt;&lt;strong&gt;&amp;nbsp;为什么说Vpay有全返优势？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;Vpay不但全返而且返还的速度更快更多，不到3个月就可以回本，回本后还可以继续返还，永不出局。&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:12px&quot;&gt;&lt;span style=&quot;background-color:rgb(0, 150, 234)&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:16px&quot;&gt;&lt;strong&gt;&amp;nbsp;Vpay有投资门槛吗？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;Vpay就不存在在投资门槛的问题，有钱你可以投10块100块，甚至10万都可以投，钱少些你就投资10块钱，一包烟钱，一单停车费都可以当作一份投资。&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:12px&quot;&gt;&lt;span style=&quot;background-color:rgb(0, 150, 234)&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:16px&quot;&gt;&lt;strong&gt;&amp;nbsp;静态怎么赚钱？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;每天1％100天回本，不复投的情况下，你可以选择对冲，或者平台挂卖，对冲，赠送80%积分，平台挂卖不赠送积分，但是你的积分只增不减，所以说，100天到本金收回，接下来的都是赚的，一年撬动3.65倍增值，复投就的话那就更加有魅力了！&lt;/p&gt;\r\n\r\n&lt;p&gt;拥有1万积分=日薪20左右月薪600左右 年薪7200&lt;br /&gt;\r\n拥有5万积分=日薪100左右 月薪3000左右 年薪3.6万&lt;br /&gt;\r\n拥有10万积分=日薪200左右 月薪6000左右 年薪7.2万&lt;br /&gt;\r\n拥有50万积分=日薪1000左右 月薪3万左右 年薪36万&lt;br /&gt;\r\n拥有100万积分=日薪2000左右 月薪6万左右 年薪72万&lt;br /&gt;\r\n拥有500万积分=日薪1万左右 月薪30万左右 年薪360万&lt;br /&gt;\r\n拥有1000万积分=日薪2万左右月薪60万左右 年薪720万&lt;br /&gt;\r\n拥有5000万积分=日薪10万左右 月薪300万左右 年薪3600万&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:12px&quot;&gt;&lt;span style=&quot;background-color:rgb(0, 150, 234)&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:16px&quot;&gt;&lt;strong&gt;&amp;nbsp;动态怎么赚钱？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;动态，直推人数越多越好，你的第一层越多，意味着你15代以内更多，以你为下，后面进来的市场都会加速你的流通，不设任何奖励制度，重点就是加速你的释放速度，市场流通足够快的情况下，最快可以一天释放1%-10%-100%，把原来的100天回本缩短到最快，可能就是几天，Vpay就是这么玩&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:12px&quot;&gt;&lt;span style=&quot;background-color:rgb(0, 150, 234)&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:16px&quot;&gt;&lt;strong&gt;&amp;nbsp;Vpay更独特的地方是什么？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;没有资金流，我们的资金自己说了算，相当于自己当老板，没有三级分销，其实他就是一个虚拟货币，我们推广市场，只是作为一个虚拟货币的推广着，不伤人脉，不用担心关网跑路，当你市场有人进入时候再一次加速你的释放速度，专业点来说，我们投资相当于买了一台矿机，推广相当于增加我们的算力。&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:12px&quot;&gt;&lt;span style=&quot;background-color:rgb(0, 150, 234)&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:16px&quot;&gt;&lt;strong&gt;&amp;nbsp;Vpay有投资风险吗？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;市场上所有项目基本上都有政策风险，只要是多层次分销、拉人头的、开公司的运营的，这些都是ZF的重点关注对象， Vpay在各地都有运营中心，在柬埔寨有，香港有，越南有，韩国有，日本有。Vpay没有直推奖，没有对碰奖，没有领导奖，没有管理奖，没有三级分销，没有多层次分销，更不需要拉人头所以不存在人脉风险，只需要流通就能产生价值，就能赚钱，关键是收益还不低，合情合理合法。&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n', '2018-06-15 10:14:40', '介绍', '5', 'http://player.youku.com/embed/XMzE0NTM4MDIwMA==', 'http://player.youku.com/embed/XMzE3MjkxOTAzNg==');
INSERT INTO `ysk_wenzhang` VALUES ('5', '问题', '&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:#0096ea; font-size:12px&quot;&gt;&lt;span style=&quot;background-color:#0096ea&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#0096ea; font-size:16px&quot;&gt;&lt;strong&gt; Vpay是什么？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;Vpay是一个全面开放的网络支付平台，跟支付宝和微信一样，不同的是，Vpay是基于区块链技术开发的，能顺利实现点对点跨境转账，而且没有任何手续费。&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:#0096ea; font-size:12px&quot;&gt;&lt;span style=&quot;background-color:#0096ea&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#0096ea; font-size:16px&quot;&gt;&lt;strong&gt; Vpay数字资产总量是多少？&lt;/strong&gt;&lt;/span&gt;\r\n\r\n&lt;p&gt;Vpay数字资产总量3.65亿&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:#0096ea; font-size:12px&quot;&gt;&lt;span style=&quot;background-color:#0096ea&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#0096ea; font-size:16px&quot;&gt;&lt;strong&gt; 如何查询Vpay数字资产开源代码？&lt;/strong&gt;&lt;/span&gt;\r\n\r\n&lt;p&gt;查询Vpay数字资产开源代码的方法&lt;br /&gt;\r\n第一步，打开百度搜索&amp;ldquo;比特币钱包&amp;rdquo;&lt;br /&gt;\r\n第二步，点击&amp;ldquo;比特币钱包官网下载&amp;rdquo;&lt;br /&gt;\r\n第三步，找到&amp;quot;bitcoin&amp;quot;，点击&amp;ldquo;源代码&amp;rdquo;,这时候我们将跳转到一个国际查询开源代码的网站，&amp;ldquo;github.com&amp;quot;，并显示出来了比特币的开源代码&lt;br /&gt;\r\n第四步，点击左上角的&amp;ldquo;黑白猫&amp;rdquo;图像，回到首页&lt;br /&gt;\r\n第五步，在右上角的灰色框输入&amp;ldquo;Vpay&amp;quot;按回车键&lt;br /&gt;\r\n第六步，把搜索内容拉到最下面，我们就可以看到Vpay的开源代码了，这里还可以直接下载Vpay的PC冷钱包。&lt;br /&gt;\r\nPS：我们也可以直接访问&amp;ldquo;github.com&amp;quot;查找开源代码。&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:#0096ea&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:#0096ea; font-size:12px&quot;&gt;&lt;span style=&quot;background-color:#0096ea&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#0096ea; font-size:16px&quot;&gt;&lt;strong&gt; Vpay运营模式是什么？&lt;/strong&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;\r\n\r\n&lt;p&gt;大家都知道，想打造一个全球的跨境支付平台！首要条件是要有大量的粉丝！没有人认可你的东西，就一文不值，跟当初的支付宝一样，几年前，放几百块在里面都怕不见了，到了现在，在支付宝里面十万，百万的人，大有人在吧！&lt;/p&gt;\r\n\r\n&lt;p&gt;既然作为全球支付软件，首先要考虑汇率的问题，Vpay采取区链块技术支持实时人民币，美元，欧元，英镑，日元&amp;hellip;&amp;hellip;等多币种实时兑换功能，秒到，且无损！&lt;/p&gt;\r\n\r\n&lt;p&gt;如何实现汇率之间恒定的问题，那我们需要一个媒介！就是数字资产，现阶段对接的是瑞波币的价格！实现各币种之间的兑换！&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:#0096ea; font-size:12px&quot;&gt;&lt;span style=&quot;background-color:#0096ea&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#0096ea; font-size:16px&quot;&gt;&lt;strong&gt; Vpay是虚拟货币吗？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;显而易见，像我们的比特币，采取的是物理挖矿的方式进行挖矿，你的币根本没有挖矿功能，肯定是假的数字资产！&lt;/p&gt;\r\n\r\n&lt;p&gt;我们的Vpay数字资产总量恒定3.65亿，是一个开源的虚拟货币，VpayLabs预挖1000万作为种子资产，用于市场推广和团队激励，剩余3.55亿Vpay数字资产用流通算力挖矿，通过用户参与流通挖矿的方式，让所有用户持有Vpay数字资产，最终达到完全去中心化。或许有人会问，国家现在都关停虚拟币交易平台了！个人的理解是这是个好事，有监管，才可以更好的发展！国家鼓励互联网金融的百花齐放，但是前提是所有脱离是实体经济的互联网金融只是理想中的空中楼阁，是一定要取缔的！&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:#0096ea; font-size:12px&quot;&gt;&lt;span style=&quot;background-color:#0096ea&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#0096ea; font-size:16px&quot;&gt;&lt;strong&gt; Vpay核心价值观是？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;Vpay核心价值观：流通产生价值&lt;br /&gt;\r\n流通：A转账给B的过程为流通&lt;br /&gt;\r\n增值：人与人第一次流通，系统赠送相应的积分，这个也可以说是我们的数字资产，人的价值进行挖矿！&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:#0096ea; font-size:12px&quot;&gt;&lt;span style=&quot;background-color:#0096ea&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#0096ea; font-size:16px&quot;&gt;&lt;strong&gt; 每天红包封顶吗？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;每天红包任你点，上不封顶。&lt;br /&gt;\r\nVpay无国界支付&lt;br /&gt;\r\n投多少送600%米：&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;投1米6米&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;投10米60米&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;投100米600米&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;投1000米6000米&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;投10000米60000米&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;投20000米送120000&lt;br /&gt;\r\n1米起投，上不封顶&lt;br /&gt;\r\n按积分2&amp;permil;每天分红&lt;br /&gt;\r\n今天投米，明天分米&lt;br /&gt;\r\n每天可以提现，点对点交易！ 动态2&amp;permil;～2%～10%推广越多，释放越快&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:#0096ea; font-size:12px&quot;&gt;&lt;span style=&quot;background-color:#0096ea&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#0096ea; font-size:16px&quot;&gt;&lt;strong&gt; Vpay几个特性是？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;一：符合六大标准&lt;/strong&gt;&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;1去中心化&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;2去中央账户&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;3点对点交易&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;4有序的进出&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;5投资自由&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;6风险自控&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;二：有效规避5大风险&lt;/strong&gt;&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;1政策风险&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;2金流风险&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;3推广风险&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;4网络风险&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;5人脉风险&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;三：符合数字货币的5大属性&lt;/strong&gt;&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;1开源代码&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;2恒量发行&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;3独立钱包&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;4大盘交易&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;5商业运用&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:#0096ea; font-size:12px&quot;&gt;&lt;span style=&quot;background-color:#0096ea&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#0096ea; font-size:16px&quot;&gt;&lt;strong&gt; Vpay的八大优势？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;1.拆分(原始发行1000万)&lt;br /&gt;\r\n2.互助(买进卖出点对点匹配打款)&lt;br /&gt;\r\n3.分红(每天最底2&amp;permil;释放)&lt;br /&gt;\r\n4.复利(放大倍增)&lt;br /&gt;\r\n5.虚拟币(区块链挖矿机制)&lt;br /&gt;\r\n6.数字资产(低进高出炒币)&lt;br /&gt;\r\n7.资产证券化(最高释放完再复投)&lt;br /&gt;\r\n8.消费返利（落地商家扫码支付）&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:#0096ea; font-size:12px&quot;&gt;&lt;span style=&quot;background-color:#0096ea&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#0096ea; font-size:16px&quot;&gt;&lt;strong&gt; 为什么说Vpay有拆分优势？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;Vpay类似拆分盘，发行原始股1000万，经过市场的繁荣也进行稳定&amp;ldquo;拆分&amp;rdquo;，但Vpay又跟拆分盘不同，基本上所有拆分盘都要半年、一年甚至一年半才能回本，而Vpay投资当天就可以回本80%，最重要的一点是，Vpay对所有的做付出做动态的人很公平，能力越强，分享越多越快，拆得越快。&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:#0096ea; font-size:12px&quot;&gt;&lt;span style=&quot;background-color:#0096ea&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#0096ea; font-size:16px&quot;&gt;&lt;strong&gt; 为什么说Vpay有互助盘的高利息和良好体验，却没有互助盘的高风险？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;Vpay的静态利息可以达到每天1.2%，比国3等互助盘的利息还要高，Vpay也没有排单币、激活码的成本。&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:#0096ea; font-size:12px&quot;&gt;&lt;span style=&quot;background-color:#0096ea&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#0096ea; font-size:16px&quot;&gt;&lt;strong&gt; 为什么说Vpay有全返优势？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;Vpay不但全返而且返还的速度更快更多，不到3个月就可以回本，回本后还可以继续返还，永不出局。&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:#0096ea; font-size:12px&quot;&gt;&lt;span style=&quot;background-color:#0096ea&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#0096ea; font-size:16px&quot;&gt;&lt;strong&gt; Vpay有投资门槛吗？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;Vpay就不存在在投资门槛的问题，有钱你可以投10块100块，甚至10万都可以投，钱少些你就投资10块钱，一包烟钱，一单停车费都可以当作一份投资。&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:#0096ea; font-size:12px&quot;&gt;&lt;span style=&quot;background-color:#0096ea&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#0096ea; font-size:16px&quot;&gt;&lt;strong&gt; 静态怎么赚钱？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;每天1％100天回本，不复投的情况下，你可以选择对冲，或者平台挂卖，对冲，赠送80%积分，平台挂卖不赠送积分，但是你的积分只增不减，所以说，100天到本金收回，接下来的都是赚的，一年撬动3.65倍增值，复投就的话那就更加有魅力了！&lt;/p&gt;\r\n\r\n&lt;p&gt;拥有1万积分=日薪20左右月薪600左右 年薪7200&lt;br /&gt;\r\n拥有5万积分=日薪100左右 月薪3000左右 年薪3.6万&lt;br /&gt;\r\n拥有10万积分=日薪200左右 月薪6000左右 年薪7.2万&lt;br /&gt;\r\n拥有50万积分=日薪1000左右 月薪3万左右 年薪36万&lt;br /&gt;\r\n拥有100万积分=日薪2000左右 月薪6万左右 年薪72万&lt;br /&gt;\r\n拥有500万积分=日薪1万左右 月薪30万左右 年薪360万&lt;br /&gt;\r\n拥有1000万积分=日薪2万左右月薪60万左右 年薪720万&lt;br /&gt;\r\n拥有5000万积分=日薪10万左右 月薪300万左右 年薪3600万&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:#0096ea; font-size:12px&quot;&gt;&lt;span style=&quot;background-color:#0096ea&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#0096ea; font-size:16px&quot;&gt;&lt;strong&gt; 动态怎么赚钱？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;动态，直推人数越多越好，你的第一层越多，意味着你15代以内更多，以你为下，后面进来的市场都会加速你的流通，不设任何奖励制度，重点就是加速你的释放速度，市场流通足够快的情况下，最快可以一天释放1%-10%-100%，把原来的100天回本缩短到最快，可能就是几天，Vpay就是这么玩&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:#0096ea; font-size:12px&quot;&gt;&lt;span style=&quot;background-color:#0096ea&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#0096ea; font-size:16px&quot;&gt;&lt;strong&gt; Vpay更独特的地方是什么？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;没有资金流，我们的资金自己说了算，相当于自己当老板，没有三级分销，其实他就是一个虚拟货币，我们推广市场，只是作为一个虚拟货币的推广着，不伤人脉，不用担心关网跑路，当你市场有人进入时候再一次加速你的释放速度，专业点来说，我们投资相当于买了一台矿机，推广相当于增加我们的算力。&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:#0096ea; font-size:12px&quot;&gt;&lt;span style=&quot;background-color:#0096ea&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#0096ea; font-size:16px&quot;&gt;&lt;strong&gt; Vpay有投资风险吗？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;市场上所有项目基本上都有政策风险，只要是多层次分销、拉人头的、开公司的运营的，这些都是ZF的重点关注对象， Vpay在各地都有运营中心，在柬埔寨有，香港有，越南有，韩国有，日本有。Vpay没有直推奖，没有对碰奖，没有领导奖，没有管理奖，没有三级分销，没有多层次分销，更不需要拉人头所以不存在人脉风险，只需要流通就能产生价值，就能赚钱，关键是收益还不低，合情合理合法。&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n', '2018-04-20 18:20:15', '帮助中心', '3', '', '');
INSERT INTO `ysk_wenzhang` VALUES ('6', '商城介绍', '&lt;p&gt;&amp;nbsp; 马克.米诺先生创办Vpay的精髓，就是流通产生价值，商城落地是加速实践Vpay全球支付的应用，让入驻商家和消费者通过Vpay数字资产更紧密联系，加速互动，加速流通，加速增值财富，倍增财富。&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp; 商城所有的商品均接受Vpay余额支付，是一个可以全部接受数字资产流通、购物的综合性商城，为倡导实现人类金融自由理念并付之行动的马克.米诺先生致敬。&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp; 商城所有商品都禁止高于市场价，每个商家的进驻会经过严格的审核，确保产品是正品，一经发现假冒伪劣的现象，将取消商家的入驻资格并协助消费者追回合法权益。&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;h3&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;消费者在Vpay商城的消费将得到的两项主要消费红利&lt;/span&gt;：&lt;/strong&gt;&lt;/span&gt;&lt;/h3&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;span style=&quot;color:#FF0000&quot;&gt;&lt;span style=&quot;font-size:20px&quot;&gt;&lt;strong&gt;A&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#FF0000&quot;&gt;&lt;span style=&quot;font-size:20px&quot;&gt; &lt;/span&gt;&lt;/span&gt;如果您是拥有Vpay电子钱包的消费者，您选好商品支付时用您的Vpay余额可直接扫商家的Vpay收款二维码支付，支付成功后你Vpay钱包里的的积分会增加你消费额的80%，然后按每天2&amp;permil;返回到余额账户里，几乎等于免费购买了产品，感受到无痛消费带来的轻松惬意。&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&amp;nbsp;&lt;span style=&quot;color:#FF0000&quot;&gt;&lt;span style=&quot;font-size:20px&quot;&gt;B&lt;/span&gt;&lt;/span&gt; &lt;/strong&gt;如果您是现金付款购买的消费者，商家会赠送给您一个Vpay电子钱包，商家会让利一部分充值到您的电子钱包余额里，兑换成积分后，按积分总数的2&amp;permil;以每天红包形式返回到余额账户里，以消费多少返还多少为执行原则。&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp; &amp;nbsp;总之，所有消费者在Vpay商城，可以做到&amp;ldquo;花本来该花的钱，赚意想不到的财富！&amp;rdquo;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;h3&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:#B22222&quot;&gt;入驻商家在Vpay商城的财富之路&lt;/span&gt;：&lt;/strong&gt;&lt;/span&gt;&lt;/h3&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:#FF0000&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:20px&quot;&gt;&amp;nbsp;A&lt;/span&gt;&lt;/strong&gt; &lt;/span&gt;全球的Vpay粉丝借助公司的平台，快速地产生庞大而有实力的消费群体，粉丝们使用Vpay余额购买是无痛消费，只要喜欢就尽情买买买，购买力强大。&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;span style=&quot;color:#FF0000&quot;&gt;&lt;span style=&quot;font-size:20px&quot;&gt;&lt;strong&gt;B&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt; 当非Vpay余额购买时，商家收到的是现金，赠送给客户一个Vpay电子钱包， 商家只要让利20%转入到客户的电子钱包余额中，通过平台的杠杆作用，让客户达到消费多少返还多少，客户花出去的钱还能在不太长的时间里返回来，加上因为是商家让利赠送的，客户当然也乐意接受。&lt;/p&gt;\r\n\r\n&lt;p&gt;因此，商家既可以赚到八折价里的利润，同时多了一个Vpay客户，客户在Vpay钱包里获益了就有参与推广的可能性，从而形成商家Vpay事业的良性循环，一段时间积累下来，就会有不断的持续的市场被动收入，最终达成财务自由目标！&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;span style=&quot;color:#FF0000&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:20px&quot;&gt;C &lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;商家也可以推荐其他商家入驻Vpay商城，你可以获得商城的广告费，重要的是你推荐的商家如果是你的Vpay事业伙伴，他延伸的Vpay客户在消费、流通都会加速您的奖金释放，这应该是长期的可观的财富。&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;span style=&quot;color:#FF0000&quot;&gt;&lt;span style=&quot;font-size:20px&quot;&gt;&lt;strong&gt;D&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt; Vpay全球支付的应用，让入驻商家和消费者通过Vpay钱包有了更紧密联系，入驻商家与商家有更广泛的合作，每一个在Vpay商城的参与者都将得到双赢或多赢的结果，前进的步伐不可阻挡！&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:#FF0000&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&amp;nbsp;&lt;strong&gt;&lt;span style=&quot;font-size:18px&quot;&gt;趋势大于优势！&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;h6&gt;&lt;strong&gt;&lt;span style=&quot;font-size:18px&quot;&gt;&lt;span style=&quot;color:#FF0000&quot;&gt;&amp;nbsp;Vpay商城 ，为您生活添色彩！&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/h6&gt;\r\n', '2018-02-02 22:11:54', '商城介绍', '4', '', '');
INSERT INTO `ysk_wenzhang` VALUES ('13', '联系客服', '&lt;h1 style=&quot;text-align:justify&quot;&gt;温馨提示&lt;/h1&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;您要充值的信息要准确填写Vpay账号；注册时的昵称；手机号码和充值金额。&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;有必要时请及时联系客服专员。&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-22/5a6563438f695.jpeg&quot; style=&quot;height:164px; width:162px&quot; /&gt;&lt;/p&gt;\r\n', '2018-01-22 12:14:20', '联系客服', '6', '', '');

-- ----------------------------
-- Table structure for `ysk_wetrans`
-- ----------------------------
DROP TABLE IF EXISTS `ysk_wetrans`;
CREATE TABLE `ysk_wetrans` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pay_id` int(10) NOT NULL COMMENT '支付的会员',
  `get_id` int(10) NOT NULL COMMENT '收到转账用户id',
  `get_nums` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '转账总金额',
  `get_time` char(30) NOT NULL DEFAULT '0' COMMENT '转账时间',
  `get_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '转账币种',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- ----------------------------
-- Records of ysk_wetrans
-- ----------------------------
