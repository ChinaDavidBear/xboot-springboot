/*
Navicat MySQL Data Transfer

Source Server         : ROOT@127.0.0.1
Source Server Version : 50624
Source Host           : 127.0.0.1:3306
Source Database       : xboot

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2019-04-23 18:34:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(200) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `value` varchar(100) NOT NULL COMMENT '数据值',
  `label` varchar(100) NOT NULL COMMENT '标签名',
  `type` varchar(100) NOT NULL COMMENT '类型',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `sort_order` int(11) NOT NULL COMMENT '排序（升序）',
  `status` int(1) DEFAULT NULL,
  `parent_id` varchar(64) DEFAULT '0' COMMENT '父级编号',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` int(1) DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_dict_value` (`value`) USING BTREE,
  KEY `sys_dict_label` (`label`) USING BTREE,
  KEY `sys_dict_del_flag` (`del_flag`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('09f429a57fa645a3a4c7433c5e77e459', '0', '女', 'gender', '性别', '1', '0', '', 'admin', '2018-12-22 11:04:13', 'admin', '2018-12-22 11:04:13', '0');
INSERT INTO `sys_dict` VALUES ('3340086d047d49169fc09d323cdb196a', 'delete', '删除权限', 'button_type', '按钮权限', '2', '0', '', 'admin', '2018-12-22 11:04:37', 'admin', '2018-12-22 11:04:37', '0');
INSERT INTO `sys_dict` VALUES ('43bdda6c37e4469fbee6af1a78478ca6', 'view', '查看权限', 'button_type', '按钮权限', '0', '0', '', 'admin', '2018-12-22 11:04:37', 'admin', '2018-12-22 11:04:37', '0');
INSERT INTO `sys_dict` VALUES ('510078d5678e4072874d622eef13ebdf', 'add', '添加权限', 'button_type', '按钮权限', '4', '0', '', 'admin', '2018-12-22 12:59:25', null, '2018-12-22 12:59:25', '0');
INSERT INTO `sys_dict` VALUES ('6c661262f95e4e4b90f4228be28fde54', 'edit', '编辑权限', 'button_type', '按钮权限', '1', '0', '', 'admin', '2018-12-22 11:04:37', 'admin', '2018-12-22 11:04:37', '0');
INSERT INTO `sys_dict` VALUES ('72c1b1aa80324289830a1cd2550d5504', '2', '未知', 'gender', '性别', '3', '0', '', 'admin', '2018-12-22 11:04:37', 'admin', '2018-12-22 11:38:35', '0');
INSERT INTO `sys_dict` VALUES ('7b767947d5594235809235baf1e4e946', 'search', '查询权限', 'button_type', '按钮权限', '3', '0', '', 'admin', '2018-12-22 11:04:37', 'admin', '2018-12-22 11:04:37', '0');
INSERT INTO `sys_dict` VALUES ('b6c20628729a4d469520c43ca0c79f12', '1', '男', 'gender', '性别', '1', '0', '', 'admin', '2018-12-22 11:03:57', 'admin', '2018-12-22 11:03:57', '0');
INSERT INTO `sys_dict` VALUES ('d21c2710fb55490cb77e4ef8c0237334', 'upload', '上传图片', 'button_type', '11', '0', '0', '', null, '2019-02-12 02:16:07', null, '2019-02-12 02:16:07', '0');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `cost_time` int(11) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `ip_info` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `request_param` varchar(255) DEFAULT NULL,
  `request_type` varchar(255) DEFAULT NULL,
  `request_url` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `log_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('7d043adcb7d54f06ad355e31fd11ff0f', null, '2019-02-13 00:24:30', '0', null, '2019-02-13 00:24:30', '9555', '192.168.0.126', '局域网', '获取当前登录用户接口', '{}', 'GET', '/admin/user/info', 'admin', '0');
INSERT INTO `sys_log` VALUES ('2c0de0dccc7943c8bc7b4bbf1ac6aa37', null, '2019-02-13 00:24:31', '0', null, '2019-02-13 00:24:31', '120', '192.168.0.126', '局域网', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('623618db6c894e07b8e20bcefc518930', null, '2019-02-13 00:28:43', '0', null, '2019-02-13 00:28:43', '10722', '192.168.0.126', '局域网', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"verify\":\"2z25\",\"captchaId\":\"543d66aae98647f189ff25bec9256994\",\"username\":\"admin\"}', 'POST', '/admin/login', 'admin', '1');
INSERT INTO `sys_log` VALUES ('d9608b9e0754480884e18f067a121fb6', null, '2019-02-13 00:28:46', '0', null, '2019-02-13 00:28:46', '3994', '192.168.0.126', '局域网', '获取当前登录用户接口', '{}', 'GET', '/admin/user/info', 'admin', '0');
INSERT INTO `sys_log` VALUES ('44e0f96348834a80a9e0b5e1854b0415', null, '2019-02-13 00:28:48', '0', null, '2019-02-13 00:28:48', '1620', '192.168.0.126', '局域网', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('369d243c957149a3a51cc7e89b78a428', null, '2019-02-13 00:53:58', '0', null, '2019-02-13 00:53:58', '13026', '192.168.0.126', '局域网', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"verify\":\"icbs\",\"captchaId\":\"b6527063846c4e34904beffc96f97705\",\"username\":\"admin\"}', 'POST', '/admin/login', 'admin', '1');
INSERT INTO `sys_log` VALUES ('6dbbc3847b1f407599bf39cd40dd3ca7', null, '2019-02-13 00:53:58', '0', null, '2019-02-13 00:53:58', '65', '192.168.0.126', '局域网', '获取当前登录用户接口', '{}', 'GET', '/admin/user/info', 'admin', '0');
INSERT INTO `sys_log` VALUES ('5513d93a54c84bb289482f296eee7f00', null, '2019-02-13 00:53:58', '0', null, '2019-02-13 00:53:58', '50', '192.168.0.126', '局域网', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('11ca61c8769b48bea962511b4481ccf7', null, '2019-02-13 00:55:17', '0', null, '2019-02-13 00:55:17', '62', '192.168.0.126', '局域网', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"verify\":\"7erx\",\"captchaId\":\"6be620c40967423fb751304163a1020a\",\"username\":\"admin\"}', 'POST', '/admin/login', 'admin', '1');
INSERT INTO `sys_log` VALUES ('5c7cc82555764f388d6f400c572f37ae', null, '2019-02-13 00:55:17', '0', null, '2019-02-13 00:55:17', '62', '192.168.0.126', '局域网', '获取当前登录用户接口', '{}', 'GET', '/admin/user/info', 'admin', '0');
INSERT INTO `sys_log` VALUES ('32ceb1438f39487eb719738666ede3ae', null, '2019-02-13 00:55:17', '0', null, '2019-02-13 00:55:17', '43', '192.168.0.126', '局域网', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('df60ca0d7c2f4cd8992346da46514bfd', null, '2019-02-13 00:55:42', '0', null, '2019-02-13 00:55:42', '74', '192.168.0.126', '局域网', '获取全部角色', '{}', 'GET', '/admin/role/getAllList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('e5641b20c52b439baf29bff7d855ffcc', null, '2019-02-13 00:55:42', '0', null, '2019-02-13 00:55:42', '70', '192.168.0.126', '局域网', '查询用户列表', '{\"officeId\":\"\",\"pageNo\":\"1\",\"sex\":\"\",\"mobile\":\"\",\"pageSize\":\"10\",\"sort\":\"create_time\",\"type\":\"\",\"email\":\"\",\"username\":\"\",\"status\":\"\",\"order\":\"desc\"}', 'GET', '/admin/user/getUserList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('8d7d3981f4cf4cdc9b262685a9fbfa58', null, '2019-02-13 00:55:53', '0', null, '2019-02-13 00:55:53', '65', '192.168.0.126', '局域网', '用户资料修改', '{}', 'POST', '/admin/user/admin/edit', 'admin', '0');
INSERT INTO `sys_log` VALUES ('5c74db1063c7405b826e0b7343dc0c9a', null, '2019-02-13 00:55:53', '0', null, '2019-02-13 00:55:53', '45', '192.168.0.126', '局域网', '查询用户列表', '{\"officeId\":\"\",\"pageNo\":\"1\",\"sex\":\"\",\"mobile\":\"\",\"pageSize\":\"10\",\"sort\":\"create_time\",\"type\":\"\",\"email\":\"\",\"username\":\"\",\"status\":\"\",\"order\":\"desc\"}', 'GET', '/admin/user/getUserList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('782af0ff110449d39ee8b532878bdc02', null, '2019-02-13 00:55:56', '0', null, '2019-02-13 00:55:56', '41', '192.168.0.126', '局域网', '获取权限菜单树', '{}', 'GET', '/admin/menu/getAllList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('e8afdcdbf3e4456f8702a89d4ead7d22', null, '2019-02-13 00:55:56', '0', null, '2019-02-13 00:55:56', '75', '192.168.0.126', '局域网', '分页获取角色', '{\"pageNo\":\"1\",\"name\":\"\",\"pageSize\":\"10\"}', 'GET', '/admin/role/getAllByPage', 'admin', '0');
INSERT INTO `sys_log` VALUES ('7fc5236831b64f15be36e11cca3eaa64', null, '2019-02-13 00:55:58', '0', null, '2019-02-13 00:55:58', '39', '192.168.0.126', '局域网', '获取权限菜单树', '{}', 'GET', '/admin/menu/getAllList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('2e89e73f46704be7a8b44215bcde435d', null, '2019-02-18 20:39:40', '0', null, '2019-02-18 20:39:40', '131', '192.168.0.126', '局域网', '获取当前登录用户接口', '{}', 'GET', '/admin/user/info', 'admin', '0');
INSERT INTO `sys_log` VALUES ('a0d289b7df2e4081b19e8b0bdba641c7', null, '2019-02-18 20:39:40', '0', null, '2019-02-18 20:39:40', '168', '192.168.0.126', '局域网', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"verify\":\"iyuq\",\"captchaId\":\"22f2abd73c4a4f148a0951593b64811b\",\"username\":\"admin\"}', 'POST', '/admin/login', 'admin', '1');
INSERT INTO `sys_log` VALUES ('a751f747e9784d0e88a45a56bd3fc048', null, '2019-02-18 20:39:40', '0', null, '2019-02-18 20:39:40', '56', '192.168.0.126', '局域网', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('5849404d3e104aa6b54cbb06362072d9', null, '2019-04-16 18:22:36', '0', null, '2019-04-16 18:22:36', '393', '169.254.180.57', '本地链路', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"verify\":\"exub\",\"captchaId\":\"3494877cee0340d8b11e37bf9897c7fe\",\"username\":\"admin\"}', 'POST', '/admin/login', 'admin', '1');
INSERT INTO `sys_log` VALUES ('dfc4f70d50174d7caf40434b05a3aeb6', null, '2019-04-16 18:22:36', '0', null, '2019-04-16 18:22:36', '53', '169.254.180.57', '本地链路', '获取当前登录用户接口', '{}', 'GET', '/admin/user/info', 'admin', '0');
INSERT INTO `sys_log` VALUES ('36675c07f6224de39a12f4c43030c932', null, '2019-04-16 18:22:37', '0', null, '2019-04-16 18:22:37', '381', '169.254.180.57', '本地链路', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('d27aca03a6d9487caae79f7b91e0f983', null, '2019-04-16 18:22:49', '0', null, '2019-04-16 18:22:49', '121', '169.254.180.57', '本地链路', '获取全部角色', '{}', 'GET', '/admin/role/getAllList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('9d40927bcb014bd5a82ffbbc6a68236d', null, '2019-04-16 18:22:49', '0', null, '2019-04-16 18:22:49', '129', '169.254.180.57', '本地链路', '查询用户列表', '{\"officeId\":\"\",\"pageNo\":\"1\",\"sex\":\"\",\"mobile\":\"\",\"pageSize\":\"10\",\"sort\":\"create_time\",\"type\":\"\",\"email\":\"\",\"username\":\"\",\"status\":\"\",\"order\":\"desc\"}', 'GET', '/admin/user/getUserList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('c27211de77ac4fbcb7b4af83305cc630', null, '2019-04-16 18:22:53', '0', null, '2019-04-16 18:22:53', '84', '169.254.180.57', '本地链路', '获取权限菜单树', '{}', 'GET', '/admin/menu/getAllList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('3750d454a1f3476580e1193663a2a682', null, '2019-04-16 18:22:53', '0', null, '2019-04-16 18:22:53', '127', '169.254.180.57', '本地链路', '分页获取角色', '{\"pageNo\":\"1\",\"name\":\"\",\"pageSize\":\"10\"}', 'GET', '/admin/role/getAllByPage', 'admin', '0');
INSERT INTO `sys_log` VALUES ('ab7eaa83a1134b768abc6a599c01805e', null, '2019-04-16 18:22:54', '0', null, '2019-04-16 18:22:54', '76', '169.254.180.57', '本地链路', '获取权限菜单树', '{}', 'GET', '/admin/menu/getAllList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('d7ededf5d5144190af5d019b60b7aafa', null, '2019-04-16 18:25:31', '0', null, '2019-04-16 18:25:31', '73', '169.254.180.57', '本地链路', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"verify\":\"hytw\",\"captchaId\":\"140825fa55d04efc93811b0ed57c68cf\",\"username\":\"admin\"}', 'POST', '/admin/login', 'admin', '1');
INSERT INTO `sys_log` VALUES ('7fd4f24d0d4b4d08a3569a3c4c711431', null, '2019-04-16 18:25:31', '0', null, '2019-04-16 18:25:31', '94', '169.254.180.57', '本地链路', '获取当前登录用户接口', '{}', 'GET', '/admin/user/info', 'admin', '0');
INSERT INTO `sys_log` VALUES ('0f4252b509a24dadb060f62108e6df92', null, '2019-04-16 18:25:32', '0', null, '2019-04-16 18:25:32', '208', '169.254.180.57', '本地链路', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('0c57df0a6b5d4074a28a3e2fe32f4718', null, '2019-04-16 18:27:33', '0', null, '2019-04-16 18:27:33', '251', '169.254.180.57', '本地链路', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('4bb4b58c40be495aa6041ec176cbee5b', null, '2019-04-16 18:28:18', '0', null, '2019-04-16 18:28:18', '250', '169.254.180.57', '本地链路', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('173bd2fe51ef4905be70a04997a3c8d0', null, '2019-04-16 18:28:41', '0', null, '2019-04-16 18:28:41', '236', '169.254.180.57', '本地链路', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('2a5f57ddb7b64a0da8186074a68117e4', null, '2019-04-16 18:28:58', '0', null, '2019-04-16 18:28:58', '229', '169.254.180.57', '本地链路', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('5cb80bb8e2274acf91e97bc6be650f89', null, '2019-04-16 18:29:39', '0', null, '2019-04-16 18:29:39', '237', '169.254.180.57', '本地链路', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('dc5c7b7e2efa4036adcf6e830891aedf', null, '2019-04-16 18:29:52', '0', null, '2019-04-16 18:29:52', '109', '169.254.180.57', '本地链路', '获取权限菜单树', '{}', 'GET', '/admin/menu/getAllList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('ef78386b5b98415fbbb484fe67847a3b', null, '2019-04-16 18:29:52', '0', null, '2019-04-16 18:29:52', '58', '169.254.180.57', '本地链路', '分页获取角色', '{\"pageNo\":\"1\",\"name\":\"\",\"pageSize\":\"10\"}', 'GET', '/admin/role/getAllByPage', 'admin', '0');
INSERT INTO `sys_log` VALUES ('fb6fb55aeae3467d9b11fcb6c2876365', null, '2019-04-16 18:29:52', '0', null, '2019-04-16 18:29:52', '94', '169.254.180.57', '本地链路', '获取权限菜单树', '{}', 'GET', '/admin/menu/getAllList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('aeb5b4c02b8a466c9621dd381438ac2b', null, '2019-04-16 18:29:53', '0', null, '2019-04-16 18:29:53', '42', '169.254.180.57', '本地链路', '获取全部角色', '{}', 'GET', '/admin/role/getAllList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('6034ff014bc14e81b91d8245cde9ad9d', null, '2019-04-16 18:29:53', '0', null, '2019-04-16 18:29:53', '59', '169.254.180.57', '本地链路', '查询用户列表', '{\"officeId\":\"\",\"pageNo\":\"1\",\"sex\":\"\",\"mobile\":\"\",\"pageSize\":\"10\",\"sort\":\"create_time\",\"type\":\"\",\"email\":\"\",\"username\":\"\",\"status\":\"\",\"order\":\"desc\"}', 'GET', '/admin/user/getUserList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('c1606097507247d9b34ed69207a5e914', null, '2019-04-23 14:30:12', '0', null, '2019-04-23 14:30:12', '770', '169.254.180.57', '本地链路', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"verify\":\"unou\",\"captchaId\":\"adfba49608584a598a0e3f38b9160ed7\",\"username\":\"admin\"}', 'POST', '/admin/login', 'admin', '1');
INSERT INTO `sys_log` VALUES ('75e580a4b36542af8a7bf321fcdd2a89', null, '2019-04-23 14:30:12', '0', null, '2019-04-23 14:30:12', '92', '169.254.180.57', '本地链路', '获取当前登录用户接口', '{}', 'GET', '/admin/user/info', 'admin', '0');
INSERT INTO `sys_log` VALUES ('06d1961ca3ac4ccebde1ef2498e8212e', null, '2019-04-23 14:30:13', '0', null, '2019-04-23 14:30:13', '310', '169.254.180.57', '本地链路', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('bd33b7a8702743fa97bb71185f4eee21', null, '2019-04-23 14:30:22', '0', null, '2019-04-23 14:30:22', '133', '169.254.180.57', '本地链路', '获取权限菜单树', '{}', 'GET', '/admin/menu/getAllList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('0061fa6d9e5c406f97fd74653f4ec49b', null, '2019-04-23 14:30:23', '0', null, '2019-04-23 14:30:23', '56', '169.254.180.57', '本地链路', '获取权限菜单树', '{}', 'GET', '/admin/menu/getAllList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('2cb44bf3dde9451fa36c5c5337840e3a', null, '2019-04-23 14:30:23', '0', null, '2019-04-23 14:30:23', '248', '169.254.180.57', '本地链路', '分页获取角色', '{\"pageNo\":\"1\",\"name\":\"\",\"pageSize\":\"10\"}', 'GET', '/admin/role/getAllByPage', 'admin', '0');
INSERT INTO `sys_log` VALUES ('51d6a502ac5240c2b1c15d7486e397e3', null, '2019-04-23 14:30:24', '0', null, '2019-04-23 14:30:24', '59', '169.254.180.57', '本地链路', '获取全部角色', '{}', 'GET', '/admin/role/getAllList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('984a1dcd3a1c40aea1d156b3442e5c08', null, '2019-04-23 14:30:24', '0', null, '2019-04-23 14:30:24', '85', '169.254.180.57', '本地链路', '查询用户列表', '{\"officeId\":\"\",\"pageNo\":\"1\",\"sex\":\"\",\"mobile\":\"\",\"pageSize\":\"10\",\"sort\":\"create_time\",\"type\":\"\",\"email\":\"\",\"username\":\"\",\"status\":\"\",\"order\":\"desc\"}', 'GET', '/admin/user/getUserList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('ee72366b8fa84b1195fc40fda7ec91f9', null, '2019-04-23 14:31:42', '0', null, '2019-04-23 14:31:42', '232', '169.254.180.57', '本地链路', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('d97ad8b571324619a15f7071f5f24fa9', null, '2019-04-23 14:33:02', '0', null, '2019-04-23 14:33:02', '232', '169.254.180.57', '本地链路', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('d25710c7f85a452d88dae9afd9a3710c', null, '2019-04-23 14:36:44', '0', null, '2019-04-23 14:36:44', '656', '169.254.180.57', '本地链路', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"verify\":\"jtti\",\"captchaId\":\"1eb278a579a649f09a5437bc7cbef8be\",\"username\":\"admin\"}', 'POST', '/admin/login', 'admin', '1');
INSERT INTO `sys_log` VALUES ('d8aa310b9783492c9216e668dd2a7c6a', null, '2019-04-23 14:36:44', '0', null, '2019-04-23 14:36:44', '67', '169.254.180.57', '本地链路', '获取当前登录用户接口', '{}', 'GET', '/admin/user/info', 'admin', '0');
INSERT INTO `sys_log` VALUES ('3f4b0d3234e44174a26dad6ae6a6479c', null, '2019-04-23 14:36:45', '0', null, '2019-04-23 14:36:45', '197', '169.254.180.57', '本地链路', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('7f0930db9405447085daa9cdc0503308', null, '2019-04-23 15:03:58', '0', null, '2019-04-23 15:03:58', '230', '169.254.180.57', '本地链路', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('45e2bf453eaf4fb3a077e92e7e3f7e36', null, '2019-04-23 15:04:16', '0', null, '2019-04-23 15:04:16', '3236', '169.254.180.57', '未知', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('73d1808ac4434cf19a9920da76318ea2', null, '2019-04-23 15:06:29', '0', null, '2019-04-23 15:06:29', '241', '169.254.180.57', '本地链路', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('5b6da02a0ca14f87b3020532537e9ce2', null, '2019-04-23 15:06:56', '0', null, '2019-04-23 15:06:56', '226', '169.254.180.57', '本地链路', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('cdfd2e62db6d4a948fd44b15ebdc2c8a', null, '2019-04-23 15:07:01', '0', null, '2019-04-23 15:07:01', '92', '169.254.180.57', '本地链路', '获取权限菜单树', '{}', 'GET', '/admin/menu/getAllList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('235d97bedbb14594a2f7911d8cfa3684', null, '2019-04-23 15:09:35', '0', null, '2019-04-23 15:09:35', '66', '169.254.180.57', '本地链路', '添加菜单', '{}', 'POST', '/admin/menu/add', 'admin', '0');
INSERT INTO `sys_log` VALUES ('50e817963c564876bffb9fb961fb88de', null, '2019-04-23 15:09:38', '0', null, '2019-04-23 15:09:38', '41', '169.254.180.57', '本地链路', '添加菜单', '{}', 'POST', '/admin/menu/add', 'admin', '0');
INSERT INTO `sys_log` VALUES ('e63305e01e2e4b54b1521306b8858706', null, '2019-04-23 15:09:42', '0', null, '2019-04-23 15:09:42', '37', '169.254.180.57', '本地链路', '添加菜单', '{}', 'POST', '/admin/menu/add', 'admin', '0');
INSERT INTO `sys_log` VALUES ('628bc6e2025243c091f176faf1750f7d', null, '2019-04-23 15:09:58', '0', null, '2019-04-23 15:09:58', '71', '169.254.180.57', '本地链路', '添加菜单', '{}', 'POST', '/admin/menu/add', 'admin', '0');
INSERT INTO `sys_log` VALUES ('b31a09d2f0744c02b790e7a35cdd55a5', null, '2019-04-23 15:10:01', '0', null, '2019-04-23 15:10:01', '37', '169.254.180.57', '本地链路', '添加菜单', '{}', 'POST', '/admin/menu/add', 'admin', '0');
INSERT INTO `sys_log` VALUES ('945f417b372e49c19ece1948f54a4e0b', null, '2019-04-23 15:10:04', '0', null, '2019-04-23 15:10:04', '40', '169.254.180.57', '本地链路', '添加菜单', '{}', 'POST', '/admin/menu/add', 'admin', '0');
INSERT INTO `sys_log` VALUES ('041d91169174408d8e14c654085aadce', null, '2019-04-23 15:10:04', '0', null, '2019-04-23 15:10:04', '38', '169.254.180.57', '本地链路', '添加菜单', '{}', 'POST', '/admin/menu/add', 'admin', '0');
INSERT INTO `sys_log` VALUES ('7a6a386a908640a6bbcecddac9949283', null, '2019-04-23 15:11:32', '0', null, '2019-04-23 15:11:32', '118', '169.254.180.57', '本地链路', '添加菜单', '{}', 'POST', '/admin/menu/add', 'admin', '0');
INSERT INTO `sys_log` VALUES ('2be90eba41f14b8b824730dbedb6eddc', null, '2019-04-23 15:11:34', '0', null, '2019-04-23 15:11:34', '43', '169.254.180.57', '本地链路', '添加菜单', '{}', 'POST', '/admin/menu/add', 'admin', '0');
INSERT INTO `sys_log` VALUES ('e689c6042d2d4586b0c97c2278f9b4ba', null, '2019-04-23 15:11:35', '0', null, '2019-04-23 15:11:35', '34', '169.254.180.57', '本地链路', '添加菜单', '{}', 'POST', '/admin/menu/add', 'admin', '0');
INSERT INTO `sys_log` VALUES ('4957454f09144567b37ec43cdca1a58c', null, '2019-04-23 15:11:35', '0', null, '2019-04-23 15:11:35', '33', '169.254.180.57', '本地链路', '添加菜单', '{}', 'POST', '/admin/menu/add', 'admin', '0');
INSERT INTO `sys_log` VALUES ('81dd46490d234509a9f5ab632907a5bd', null, '2019-04-23 15:11:35', '0', null, '2019-04-23 15:11:35', '32', '169.254.180.57', '本地链路', '添加菜单', '{}', 'POST', '/admin/menu/add', 'admin', '0');
INSERT INTO `sys_log` VALUES ('6b2df14d384b4aafaf1a70ee51b8eead', null, '2019-04-23 15:11:36', '0', null, '2019-04-23 15:11:36', '42', '169.254.180.57', '本地链路', '添加菜单', '{}', 'POST', '/admin/menu/add', 'admin', '0');
INSERT INTO `sys_log` VALUES ('07b42150a67849e8a2f4b884ccd7914b', null, '2019-04-23 15:12:48', '0', null, '2019-04-23 15:12:48', '67', '169.254.180.57', '本地链路', '添加菜单', '{}', 'POST', '/admin/menu/add', 'admin', '0');
INSERT INTO `sys_log` VALUES ('a203ba1c17714c31affbb4a676c35f45', null, '2019-04-23 15:12:50', '0', null, '2019-04-23 15:12:50', '40', '169.254.180.57', '本地链路', '添加菜单', '{}', 'POST', '/admin/menu/add', 'admin', '0');
INSERT INTO `sys_log` VALUES ('cef12d714b5e442b938b7ee513623501', null, '2019-04-23 15:12:50', '0', null, '2019-04-23 15:12:50', '41', '169.254.180.57', '本地链路', '添加菜单', '{}', 'POST', '/admin/menu/add', 'admin', '0');
INSERT INTO `sys_log` VALUES ('9977941af71b4bc3a57fca628e4f6842', null, '2019-04-23 15:12:53', '0', null, '2019-04-23 15:12:53', '35', '169.254.180.57', '本地链路', '添加菜单', '{}', 'POST', '/admin/menu/add', 'admin', '0');
INSERT INTO `sys_log` VALUES ('84ac9a855d28440db8b6def9c03b1274', null, '2019-04-23 15:12:54', '0', null, '2019-04-23 15:12:54', '36', '169.254.180.57', '本地链路', '添加菜单', '{}', 'POST', '/admin/menu/add', 'admin', '0');
INSERT INTO `sys_log` VALUES ('cec2862c41f64f38a34b4872a9de8227', null, '2019-04-23 15:13:28', '0', null, '2019-04-23 15:13:28', '232', '169.254.180.57', '本地链路', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('3bee6fde132148fbbe61a4a12cb48548', null, '2019-04-23 15:13:29', '0', null, '2019-04-23 15:13:29', '69', '169.254.180.57', '本地链路', '获取权限菜单树', '{}', 'GET', '/admin/menu/getAllList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('5df827c74c66445f8fef672c17366060', null, '2019-04-23 15:13:34', '0', null, '2019-04-23 15:13:34', '74', '169.254.180.57', '本地链路', '获取权限菜单树', '{}', 'GET', '/admin/menu/getAllList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('0baff629bfdc41c390a71228654944ec', null, '2019-04-23 15:13:34', '0', null, '2019-04-23 15:13:34', '69', '169.254.180.57', '本地链路', '分页获取角色', '{\"pageNo\":\"1\",\"name\":\"\",\"pageSize\":\"10\"}', 'GET', '/admin/role/getAllByPage', 'admin', '0');
INSERT INTO `sys_log` VALUES ('9ba1399f4ac5441a923e607070e148bf', null, '2019-04-23 15:13:48', '0', null, '2019-04-23 15:13:48', '91', '169.254.180.57', '本地链路', '分页获取角色', '{\"pageNo\":\"1\",\"name\":\"\",\"pageSize\":\"10\"}', 'GET', '/admin/role/getAllByPage', 'admin', '0');
INSERT INTO `sys_log` VALUES ('b3aba29ae21d45acb9d116806612f164', null, '2019-04-23 15:13:48', '0', null, '2019-04-23 15:13:48', '350', '169.254.180.57', '本地链路', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('de164c677b764c66ae824c69bd8098dc', null, '2019-04-23 15:15:21', '0', null, '2019-04-23 15:15:21', '72', '169.254.180.57', '本地链路', '编辑菜单', '{}', 'POST', '/admin/menu/edit', 'admin', '0');
INSERT INTO `sys_log` VALUES ('90226454c05e4c15bff865cee36d1d01', null, '2019-04-23 15:15:26', '0', null, '2019-04-23 15:15:26', '207', '169.254.180.57', '本地链路', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('cfe513bd4a934e2aa4f33430f6029a7a', null, '2019-04-23 15:15:27', '0', null, '2019-04-23 15:15:27', '51', '169.254.180.57', '本地链路', '获取权限菜单树', '{}', 'GET', '/admin/menu/getAllList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('9daca69490484e6598126c89269164a0', null, '2019-04-23 15:15:55', '0', null, '2019-04-23 15:15:55', '70', '169.254.180.57', '本地链路', '编辑菜单', '{}', 'POST', '/admin/menu/edit', 'admin', '0');
INSERT INTO `sys_log` VALUES ('37608bfa926844caa172eaa82501fd77', null, '2019-04-23 15:16:01', '0', null, '2019-04-23 15:16:01', '61', '169.254.180.57', '本地链路', '编辑菜单', '{}', 'POST', '/admin/menu/edit', 'admin', '0');
INSERT INTO `sys_log` VALUES ('8be3bd32dd5141abb32aea27528084bb', null, '2019-04-23 15:16:05', '0', null, '2019-04-23 15:16:05', '40', '169.254.180.57', '本地链路', '编辑菜单', '{}', 'POST', '/admin/menu/edit', 'admin', '0');
INSERT INTO `sys_log` VALUES ('d8e1b9ec2f744fd0925bd416d7268be5', null, '2019-04-23 15:16:09', '0', null, '2019-04-23 15:16:09', '41', '169.254.180.57', '本地链路', '编辑菜单', '{}', 'POST', '/admin/menu/edit', 'admin', '0');
INSERT INTO `sys_log` VALUES ('cd5a74e4d2284c62be82827d49e242d5', null, '2019-04-23 15:16:13', '0', null, '2019-04-23 15:16:13', '37', '169.254.180.57', '本地链路', '编辑菜单', '{}', 'POST', '/admin/menu/edit', 'admin', '0');
INSERT INTO `sys_log` VALUES ('6dea3c709c3047d1a225bd8c4b08cb56', null, '2019-04-23 15:16:16', '0', null, '2019-04-23 15:16:16', '194', '169.254.180.57', '本地链路', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('bdc7ee4cab5f47f09b4d90ddcdcc24ab', null, '2019-04-23 15:16:16', '0', null, '2019-04-23 15:16:16', '50', '169.254.180.57', '本地链路', '获取权限菜单树', '{}', 'GET', '/admin/menu/getAllList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('b0333cfc6f3b4d2aab501f0fb258dfb0', null, '2019-04-23 15:16:52', '0', null, '2019-04-23 15:16:52', '91', '169.254.180.57', '本地链路', '获取当前登录用户接口', '{}', 'GET', '/admin/user/info', 'admin', '0');
INSERT INTO `sys_log` VALUES ('f742f8b352c04ca2898cafe6d1f9cfed', null, '2019-04-23 15:16:52', '0', null, '2019-04-23 15:16:52', '195', '169.254.180.57', '本地链路', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('9b09aa581b0246eeab0d420cbb4a2a6a', null, '2019-04-23 15:16:52', '0', null, '2019-04-23 15:16:52', '3627', '169.254.180.57', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"verify\":\"8abn\",\"captchaId\":\"93c44c02c61147b0953edae4c53190a8\",\"username\":\"admin\"}', 'POST', '/admin/login', 'admin', '1');
INSERT INTO `sys_log` VALUES ('93905b475a974dab9c35741cfa309f80', null, '2019-04-23 15:17:15', '0', null, '2019-04-23 15:17:15', '214', '169.254.180.57', '本地链路', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('7daa9cbf07bc44b18bad07bd04e0f56a', null, '2019-04-23 15:19:33', '0', null, '2019-04-23 15:19:33', '804', '169.254.180.57', '本地链路', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"verify\":\"r2ax\",\"captchaId\":\"9d6a6cda56cf4f69b1939d03d74d8d96\",\"username\":\"admin\"}', 'POST', '/admin/login', 'admin', '1');
INSERT INTO `sys_log` VALUES ('dfe95c320c614e809a4ff9d6fe73ffa9', null, '2019-04-23 15:19:33', '0', null, '2019-04-23 15:19:33', '52', '169.254.180.57', '本地链路', '获取当前登录用户接口', '{}', 'GET', '/admin/user/info', 'admin', '0');
INSERT INTO `sys_log` VALUES ('b1e36f1bb68a4f01b695570c3cc731d4', null, '2019-04-23 15:19:34', '0', null, '2019-04-23 15:19:34', '212', '169.254.180.57', '本地链路', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('6b72eda4ee7d429aac07643321825581', null, '2019-04-23 15:19:43', '0', null, '2019-04-23 15:19:43', '79', '169.254.180.57', '本地链路', '获取全部角色', '{}', 'GET', '/admin/role/getAllList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('3e31fb253b994c59a777ff195dedce82', null, '2019-04-23 15:19:43', '0', null, '2019-04-23 15:19:43', '86', '169.254.180.57', '本地链路', '查询用户列表', '{\"officeId\":\"\",\"pageNo\":\"1\",\"sex\":\"\",\"mobile\":\"\",\"pageSize\":\"10\",\"sort\":\"create_time\",\"type\":\"\",\"email\":\"\",\"username\":\"\",\"status\":\"\",\"order\":\"desc\"}', 'GET', '/admin/user/getUserList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('1e7a4b113247420b97f4ddca1732fe94', null, '2019-04-23 15:20:45', '0', null, '2019-04-23 15:20:45', '229', '169.254.180.57', '本地链路', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('5ee056174322423f8a210fabc331a358', null, '2019-04-23 15:20:45', '0', null, '2019-04-23 15:20:45', '49', '169.254.180.57', '本地链路', '获取全部角色', '{}', 'GET', '/admin/role/getAllList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('d6d45f4352a440d48a48e7d10c7fe264', null, '2019-04-23 15:20:45', '0', null, '2019-04-23 15:20:45', '78', '169.254.180.57', '本地链路', '查询用户列表', '{\"officeId\":\"\",\"pageNo\":\"1\",\"sex\":\"\",\"mobile\":\"\",\"pageSize\":\"10\",\"sort\":\"create_time\",\"type\":\"\",\"email\":\"\",\"username\":\"\",\"status\":\"\",\"order\":\"desc\"}', 'GET', '/admin/user/getUserList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('adcd1bba9cf045ce947df8d91e31f89c', null, '2019-04-23 15:21:30', '0', null, '2019-04-23 15:21:30', '352', '169.254.180.57', '本地链路', '添加用户', '{}', 'POST', '/admin/user/admin/add', 'admin', '0');
INSERT INTO `sys_log` VALUES ('a2afb134ddd7478892ab485cfbc1c9fd', null, '2019-04-23 15:21:30', '0', null, '2019-04-23 15:21:30', '53', '169.254.180.57', '本地链路', '查询用户列表', '{\"officeId\":\"\",\"pageNo\":\"1\",\"sex\":\"\",\"mobile\":\"\",\"pageSize\":\"10\",\"sort\":\"create_time\",\"type\":\"\",\"email\":\"\",\"username\":\"\",\"status\":\"\",\"order\":\"desc\"}', 'GET', '/admin/user/getUserList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('d368d17181374876bcef6eaf47e54935', null, '2019-04-23 15:21:44', '0', null, '2019-04-23 15:21:44', '525', '169.254.180.57', '本地链路', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"verify\":\"cbsi\",\"captchaId\":\"bde5355cf33849a89144232eba16bf09\",\"username\":\"test\"}', 'POST', '/admin/login', 'test', '1');
INSERT INTO `sys_log` VALUES ('a4f8edb7e7a3474eb716f71caf6da976', null, '2019-04-23 15:21:44', '0', null, '2019-04-23 15:21:44', '59', '169.254.180.57', '本地链路', '获取当前登录用户接口', '{}', 'GET', '/admin/user/info', 'test', '0');
INSERT INTO `sys_log` VALUES ('96578fd7bf8b4ec49d391230b55231f6', null, '2019-04-23 15:21:45', '0', null, '2019-04-23 15:21:45', '355', '169.254.180.57', '本地链路', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'test', '0');
INSERT INTO `sys_log` VALUES ('e24734542fb641f59297264b5c0bb13f', null, '2019-04-23 15:21:51', '0', null, '2019-04-23 15:21:51', '64', '169.254.180.57', '本地链路', '获取全部角色', '{}', 'GET', '/admin/role/getAllList', 'test', '0');
INSERT INTO `sys_log` VALUES ('a1daa6c7a8e84b4fae7fc04d6cf5b10d', null, '2019-04-23 15:21:51', '0', null, '2019-04-23 15:21:51', '82', '169.254.180.57', '本地链路', '查询用户列表', '{\"officeId\":\"\",\"pageNo\":\"1\",\"sex\":\"\",\"mobile\":\"\",\"pageSize\":\"10\",\"sort\":\"create_time\",\"type\":\"\",\"email\":\"\",\"username\":\"\",\"status\":\"\",\"order\":\"desc\"}', 'GET', '/admin/user/getUserList', 'test', '0');
INSERT INTO `sys_log` VALUES ('8721259542c94f039c4ee55739d6849b', null, '2019-04-23 15:22:19', '0', null, '2019-04-23 15:22:19', '703', '169.254.180.57', '本地链路', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"verify\":\"6nvz\",\"captchaId\":\"5cf62673db1f4069875aadc0471f5181\",\"username\":\"admin\"}', 'POST', '/admin/login', 'admin', '1');
INSERT INTO `sys_log` VALUES ('1760a06785a74ab6b7512c887597c6d2', null, '2019-04-23 15:22:19', '0', null, '2019-04-23 15:22:19', '50', '169.254.180.57', '本地链路', '获取当前登录用户接口', '{}', 'GET', '/admin/user/info', 'admin', '0');
INSERT INTO `sys_log` VALUES ('cb7e94c9b1134f93acdb1cf0cb1cce93', null, '2019-04-23 15:22:20', '0', null, '2019-04-23 15:22:20', '221', '169.254.180.57', '本地链路', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('c891552d27364f6daffc77887071ee24', null, '2019-04-23 15:22:50', '0', null, '2019-04-23 15:22:50', '231', '169.254.180.57', '本地链路', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('bc7b8a7f0481400996285b9fc6541ef4', null, '2019-04-23 15:24:04', '0', null, '2019-04-23 15:24:04', '641', '169.254.180.57', '本地链路', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"verify\":\"bqt2\",\"captchaId\":\"7966d6b31331460c975a7aa1935fcb7f\",\"username\":\"admin\"}', 'POST', '/admin/login', 'admin', '1');
INSERT INTO `sys_log` VALUES ('2c95c71db43745d9a4d85f0ed0606375', null, '2019-04-23 15:24:04', '0', null, '2019-04-23 15:24:04', '42', '169.254.180.57', '本地链路', '获取当前登录用户接口', '{}', 'GET', '/admin/user/info', 'admin', '0');
INSERT INTO `sys_log` VALUES ('42ae0ff7683f4868a21ec6e571b7a43b', null, '2019-04-23 15:24:04', '0', null, '2019-04-23 15:24:04', '199', '169.254.180.57', '本地链路', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('cc4f85b352be4ed3874031cdd5e3cf03', null, '2019-04-23 15:26:28', '0', null, '2019-04-23 15:26:28', '227', '169.254.180.57', '本地链路', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('c3be21ade212499b818e0925da578a63', null, '2019-04-23 15:26:47', '0', null, '2019-04-23 15:26:47', '224', '169.254.180.57', '本地链路', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('8c7238fe6cef4032917655d5d1e001aa', null, '2019-04-23 15:28:11', '0', null, '2019-04-23 15:28:11', '650', '169.254.180.57', '本地链路', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"verify\":\"2z6y\",\"captchaId\":\"8245f08e8103484e8766a31114ef9481\",\"username\":\"admin\"}', 'POST', '/admin/login', 'admin', '1');
INSERT INTO `sys_log` VALUES ('2be3d77e77684e94af543830e92890d7', null, '2019-04-23 15:28:11', '0', null, '2019-04-23 15:28:11', '40', '169.254.180.57', '本地链路', '获取当前登录用户接口', '{}', 'GET', '/admin/user/info', 'admin', '0');
INSERT INTO `sys_log` VALUES ('37d1cc11dd2b419aa4eb18c39988117d', null, '2019-04-23 15:28:11', '0', null, '2019-04-23 15:28:11', '191', '169.254.180.57', '本地链路', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('62d8fff625824078a4307ff526cbea35', null, '2019-04-23 15:32:17', '0', null, '2019-04-23 15:32:17', '3072', '169.254.180.57', '未知', '获取权限菜单树', '{}', 'GET', '/admin/menu/getAllList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('efe6da776b4640afab01100f1d34688f', null, '2019-04-23 15:32:29', '0', null, '2019-04-23 15:32:29', '65', '169.254.180.57', '本地链路', '编辑菜单', '{}', 'POST', '/admin/menu/edit', 'admin', '0');
INSERT INTO `sys_log` VALUES ('24152115ba1e4e41a2553ceee543800e', null, '2019-04-23 15:32:35', '0', null, '2019-04-23 15:32:35', '226', '169.254.180.57', '本地链路', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('279176f174994cc18897008416fb6a1f', null, '2019-04-23 15:32:35', '0', null, '2019-04-23 15:32:35', '59', '169.254.180.57', '本地链路', '获取权限菜单树', '{}', 'GET', '/admin/menu/getAllList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('567c2601c3e64971bcf188c0bd6d42d0', null, '2019-04-23 15:32:50', '0', null, '2019-04-23 15:32:50', '239', '169.254.180.57', '本地链路', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('7c9d558e3dd94022a0751e7d8aefb55e', null, '2019-04-23 15:32:51', '0', null, '2019-04-23 15:32:51', '52', '169.254.180.57', '本地链路', '获取权限菜单树', '{}', 'GET', '/admin/menu/getAllList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('2de27beff6634abda380146c57f8ef2f', null, '2019-04-23 15:34:53', '0', null, '2019-04-23 15:34:53', '749', '169.254.180.57', '本地链路', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"verify\":\"h12s\",\"captchaId\":\"03768fc891844fabbe4dbd1c4ba79277\",\"username\":\"admin\"}', 'POST', '/admin/login', 'admin', '1');
INSERT INTO `sys_log` VALUES ('cfdddfb42be34530ae1cf0aed721facc', null, '2019-04-23 15:34:53', '0', null, '2019-04-23 15:34:53', '52', '169.254.180.57', '本地链路', '获取当前登录用户接口', '{}', 'GET', '/admin/user/info', 'admin', '0');
INSERT INTO `sys_log` VALUES ('c046f3bcc9634c6090c01bbabc2e253a', null, '2019-04-23 15:34:54', '0', null, '2019-04-23 15:34:54', '66', '169.254.180.57', '本地链路', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('777b6ac45cf549d2862e95961aa98bae', null, '2019-04-23 15:37:41', '0', null, '2019-04-23 15:37:41', '762', '169.254.180.57', '本地链路', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"verify\":\"fuv2\",\"captchaId\":\"d1a7152934e645ba808555e3e44ec70a\",\"username\":\"admin\"}', 'POST', '/admin/login', 'admin', '1');
INSERT INTO `sys_log` VALUES ('132ca250ceb44b6883edf5e13a00fe37', null, '2019-04-23 15:37:41', '0', null, '2019-04-23 15:37:41', '59', '169.254.180.57', '本地链路', '获取当前登录用户接口', '{}', 'GET', '/admin/user/info', 'admin', '0');
INSERT INTO `sys_log` VALUES ('19ca49763e99470589b7f8607bfd81e9', null, '2019-04-23 15:37:41', '0', null, '2019-04-23 15:37:41', '67', '169.254.180.57', '本地链路', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('3984810854ff4a3488bff06537460c43', null, '2019-04-23 15:39:32', '0', null, '2019-04-23 15:39:32', '96', '169.254.180.57', '本地链路', '获取全部角色', '{}', 'GET', '/admin/role/getAllList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('6d1e1e0cda1341c1b47a3b32c35b40f4', null, '2019-04-23 15:39:32', '0', null, '2019-04-23 15:39:32', '107', '169.254.180.57', '本地链路', '查询用户列表', '{\"officeId\":\"\",\"pageNo\":\"1\",\"sex\":\"\",\"mobile\":\"\",\"pageSize\":\"10\",\"sort\":\"create_time\",\"type\":\"\",\"email\":\"\",\"username\":\"\",\"status\":\"\",\"order\":\"desc\"}', 'GET', '/admin/user/getUserList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('be91f311cfd14d76bb131e1e497a6d2c', null, '2019-04-23 15:41:57', '0', null, '2019-04-23 15:41:57', '75', '169.254.180.57', '本地链路', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('909b514e73554ba899b6909d357f445a', null, '2019-04-23 15:41:59', '0', null, '2019-04-23 15:41:59', '48', '169.254.180.57', '本地链路', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('c0b6241110cf4d5cab091a1830c7230f', null, '2019-04-23 15:42:03', '0', null, '2019-04-23 15:42:03', '42', '169.254.180.57', '本地链路', '获取全部角色', '{}', 'GET', '/admin/role/getAllList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('92c867ee9bda4fda955d123fc05cca22', null, '2019-04-23 15:42:03', '0', null, '2019-04-23 15:42:03', '97', '169.254.180.57', '本地链路', '查询用户列表', '{\"officeId\":\"\",\"pageNo\":\"1\",\"sex\":\"\",\"mobile\":\"\",\"pageSize\":\"10\",\"sort\":\"create_time\",\"type\":\"\",\"email\":\"\",\"username\":\"\",\"status\":\"\",\"order\":\"desc\"}', 'GET', '/admin/user/getUserList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('ab3f44ec41894a1fb2ecfaf75d3b1446', null, '2019-04-23 15:42:04', '0', null, '2019-04-23 15:42:04', '54', '169.254.180.57', '本地链路', '获取权限菜单树', '{}', 'GET', '/admin/menu/getAllList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('596e78d0e0d541cfa9ee6a8ca525dd03', null, '2019-04-23 15:43:25', '0', null, '2019-04-23 15:43:25', '68', '169.254.180.57', '本地链路', '获取全部角色', '{}', 'GET', '/admin/role/getAllList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('ce87fb531b4d49cb86f6302d90985a0a', null, '2019-04-23 15:43:25', '0', null, '2019-04-23 15:43:25', '80', '169.254.180.57', '本地链路', '查询用户列表', '{\"officeId\":\"\",\"pageNo\":\"1\",\"sex\":\"\",\"mobile\":\"\",\"pageSize\":\"10\",\"sort\":\"create_time\",\"type\":\"\",\"email\":\"\",\"username\":\"\",\"status\":\"\",\"order\":\"desc\"}', 'GET', '/admin/user/getUserList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('dce0144d102a44b39aed5a1a5bca11d3', null, '2019-04-23 15:49:49', '0', null, '2019-04-23 15:49:49', '725', '169.254.180.57', '本地链路', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"verify\":\"arpu\",\"captchaId\":\"c699391366704f2b8e6e7a479f995baf\",\"username\":\"admin\"}', 'POST', '/admin/login', 'admin', '1');
INSERT INTO `sys_log` VALUES ('3d7f5494c52a4bb4a43b2d23d25c1ead', null, '2019-04-23 15:49:49', '0', null, '2019-04-23 15:49:49', '51', '169.254.180.57', '本地链路', '获取当前登录用户接口', '{}', 'GET', '/admin/user/info', 'admin', '0');
INSERT INTO `sys_log` VALUES ('a846e6eb54e7443ea25801d10c857ef6', null, '2019-04-23 15:49:49', '0', null, '2019-04-23 15:49:49', '59', '169.254.180.57', '本地链路', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('700aaefc1d614d3c9af8df8766b70edb', null, '2019-04-23 16:09:33', '0', null, '2019-04-23 16:09:33', '92', '169.254.180.57', '本地链路', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('6098465a4ff2486fbc8e4ba4aac5d76d', null, '2019-04-23 16:09:36', '0', null, '2019-04-23 16:09:36', '43', '169.254.180.57', '本地链路', '获取全部角色', '{}', 'GET', '/admin/role/getAllList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('71dc9b01047d4b50ad9ced65071e8493', null, '2019-04-23 16:09:36', '0', null, '2019-04-23 16:09:36', '87', '169.254.180.57', '本地链路', '查询用户列表', '{\"officeId\":\"\",\"pageNo\":\"1\",\"sex\":\"\",\"mobile\":\"\",\"pageSize\":\"10\",\"sort\":\"create_time\",\"type\":\"\",\"email\":\"\",\"username\":\"\",\"status\":\"\",\"order\":\"desc\"}', 'GET', '/admin/user/getUserList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('aa32230c39c941f7b2e4a0dce1c2f9b2', null, '2019-04-23 16:33:15', '0', null, '2019-04-23 16:33:15', '96', '169.254.180.57', '本地链路', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('d3005d2d59ec42f2af3975c46a58ae96', null, '2019-04-23 16:33:23', '0', null, '2019-04-23 16:33:23', '75', '169.254.180.57', '本地链路', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('ed560864695748368d9cfcd71dcdd6f1', null, '2019-04-23 16:33:30', '0', null, '2019-04-23 16:33:30', '75', '169.254.180.57', '本地链路', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('a04a5e3946bc4000a19e27bfeda495db', null, '2019-04-23 16:36:57', '0', null, '2019-04-23 16:36:57', '3044', '169.254.180.57', '未知', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('9f96f49e89764a7689cbb6eadff61875', null, '2019-04-23 16:37:19', '0', null, '2019-04-23 16:37:19', '62', '169.254.180.57', '本地链路', '编辑消息', '{}', 'POST', '/admin/message/edit', 'admin', '0');
INSERT INTO `sys_log` VALUES ('32508029205f4037bee266de7665a6f9', null, '2019-04-23 16:39:57', '0', null, '2019-04-23 16:39:57', '761', '169.254.180.57', '本地链路', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"verify\":\"37ck\",\"captchaId\":\"0cfd1a6812d949d794619016e3ee05c6\",\"username\":\"admin\"}', 'POST', '/admin/login', 'admin', '1');
INSERT INTO `sys_log` VALUES ('4356ae402dd849b286b66b8d953c997b', null, '2019-04-23 16:39:57', '0', null, '2019-04-23 16:39:57', '57', '169.254.180.57', '本地链路', '获取当前登录用户接口', '{}', 'GET', '/admin/user/info', 'admin', '0');
INSERT INTO `sys_log` VALUES ('32cad21d8eb044728450e84a302a9b74', null, '2019-04-23 16:39:58', '0', null, '2019-04-23 16:39:58', '72', '169.254.180.57', '本地链路', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('bc575b1e059e4d8292209ef4569a096b', null, '2019-04-23 16:40:17', '0', null, '2019-04-23 16:40:17', '324', '169.254.180.57', '本地链路', '编辑消息', '{}', 'POST', '/admin/message/edit', 'admin', '0');
INSERT INTO `sys_log` VALUES ('a9b435b81ac94d55bd5c114731c94d01', null, '2019-04-23 16:42:17', '0', null, '2019-04-23 16:42:17', '3049', '169.254.180.57', '未知', '编辑消息', '{}', 'POST', '/admin/message/edit', 'admin', '0');
INSERT INTO `sys_log` VALUES ('cb2727f9a6664bb88ef8e92e8cbc1b35', null, '2019-04-23 16:44:58', '0', null, '2019-04-23 16:44:58', '89', '169.254.180.57', '本地链路', '编辑消息', '{}', 'POST', '/admin/message/edit', 'admin', '0');
INSERT INTO `sys_log` VALUES ('bb4c6ce1dcdb40a885943254c792c5d6', null, '2019-04-23 16:46:20', '0', null, '2019-04-23 16:46:20', '80', '169.254.180.57', '本地链路', '编辑消息', '{}', 'POST', '/admin/message/edit', 'admin', '0');
INSERT INTO `sys_log` VALUES ('059e46dcb39c447d9ae24fc9eaba8fd6', null, '2019-04-23 16:47:02', '0', null, '2019-04-23 16:47:02', '74', '169.254.180.57', '本地链路', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('22e498b9e25443449eb42eb6ebdd0e9c', null, '2019-04-23 16:47:19', '0', null, '2019-04-23 16:47:19', '65', '169.254.180.57', '本地链路', '编辑消息', '{}', 'POST', '/admin/message/edit', 'admin', '0');
INSERT INTO `sys_log` VALUES ('82c165bc3d36483bad8e20c03030e915', null, '2019-04-23 16:47:52', '0', null, '2019-04-23 16:47:52', '87', '169.254.180.57', '本地链路', '保存消息', '{}', 'POST', '/admin/message/add', 'admin', '0');
INSERT INTO `sys_log` VALUES ('98125169af8b4a929e5516fc18dbafbc', null, '2019-04-23 16:48:03', '0', null, '2019-04-23 16:48:03', '75', '169.254.180.57', '本地链路', '编辑消息', '{}', 'POST', '/admin/message/edit', 'admin', '0');
INSERT INTO `sys_log` VALUES ('27a7797d33b04cdf90ecf4c2c0c40835', null, '2019-04-23 16:48:50', '0', null, '2019-04-23 16:48:50', '145', '169.254.180.57', '本地链路', '获取权限菜单树', '{}', 'GET', '/admin/menu/getAllList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('ec20226a166c4042ab60966291e8504b', null, '2019-04-23 16:49:42', '0', null, '2019-04-23 16:49:42', '108', '169.254.180.57', '本地链路', '获取权限菜单树', '{}', 'GET', '/admin/menu/getAllList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('4a5410a2bcc94ab381a8dd11b6b9acfa', null, '2019-04-23 16:49:42', '0', null, '2019-04-23 16:49:42', '112', '169.254.180.57', '本地链路', '分页获取角色', '{\"pageNo\":\"1\",\"name\":\"\",\"pageSize\":\"10\"}', 'GET', '/admin/role/getAllByPage', 'admin', '0');
INSERT INTO `sys_log` VALUES ('dada0fd3250f4c218d9268cb8e505548', null, '2019-04-23 16:53:53', '0', null, '2019-04-23 16:53:53', '112', '169.254.180.57', '本地链路', '添加菜单', '{}', 'POST', '/admin/menu/add', 'admin', '0');
INSERT INTO `sys_log` VALUES ('b9d4dd1bb9c4468c9a3578478814cfb3', null, '2019-04-23 16:54:13', '0', null, '2019-04-23 16:54:13', '81', '169.254.180.57', '本地链路', '添加菜单', '{}', 'POST', '/admin/menu/add', 'admin', '0');
INSERT INTO `sys_log` VALUES ('8ac76fe47e0a484a8ac07947735f4b18', null, '2019-04-23 16:54:21', '0', null, '2019-04-23 16:54:21', '65', '169.254.180.57', '本地链路', '添加菜单', '{}', 'POST', '/admin/menu/add', 'admin', '0');
INSERT INTO `sys_log` VALUES ('e797ded2715e4117b236fcf42d87300c', null, '2019-04-23 16:54:28', '0', null, '2019-04-23 16:54:28', '77', '169.254.180.57', '本地链路', '获取权限菜单树', '{}', 'GET', '/admin/menu/getAllList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('3363ebb3b3864480ac337274eb1259fd', null, '2019-04-23 16:54:57', '0', null, '2019-04-23 16:54:57', '75', '169.254.180.57', '本地链路', '添加菜单', '{}', 'POST', '/admin/menu/add', 'admin', '0');
INSERT INTO `sys_log` VALUES ('58bbb83955a942c3b085166aa559b222', null, '2019-04-23 16:55:02', '0', null, '2019-04-23 16:55:02', '85', '169.254.180.57', '本地链路', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('a98876ea7d554e70b60530783e3a0fe3', null, '2019-04-23 16:55:03', '0', null, '2019-04-23 16:55:03', '57', '169.254.180.57', '本地链路', '获取权限菜单树', '{}', 'GET', '/admin/menu/getAllList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('1bb69668df5643188d711187d50ff5fc', null, '2019-04-23 16:57:05', '0', null, '2019-04-23 16:57:05', '70', '169.254.180.57', '本地链路', '编辑消息', '{}', 'POST', '/admin/message/edit', 'admin', '0');
INSERT INTO `sys_log` VALUES ('4623794c21b54df88ebe3c72e5dfd44d', null, '2019-04-23 17:01:10', '0', null, '2019-04-23 17:01:10', '94', '169.254.180.57', '本地链路', '分页获取角色', '{\"pageNo\":\"1\",\"name\":\"\",\"pageSize\":\"10\"}', 'GET', '/admin/role/getAllByPage', 'admin', '0');
INSERT INTO `sys_log` VALUES ('ec038b4f1cbb4eb2bb8644e4e0c3e1cd', null, '2019-04-23 17:01:10', '0', null, '2019-04-23 17:01:10', '97', '169.254.180.57', '本地链路', '获取权限菜单树', '{}', 'GET', '/admin/menu/getAllList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('bc211bac096e4afbb08dc50c5774f599', null, '2019-04-23 17:01:20', '0', null, '2019-04-23 17:01:20', '50', '169.254.180.57', '本地链路', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('16e7bd1b2b204363bb2d6253527c2590', null, '2019-04-23 17:01:20', '0', null, '2019-04-23 17:01:20', '80', '169.254.180.57', '本地链路', '分页获取角色', '{\"pageNo\":\"1\",\"name\":\"\",\"pageSize\":\"10\"}', 'GET', '/admin/role/getAllByPage', 'admin', '0');
INSERT INTO `sys_log` VALUES ('b129b2018e0b43e49ce20dd48de244cc', null, '2019-04-23 17:01:42', '0', null, '2019-04-23 17:01:42', '658', '169.254.180.57', '本地链路', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"verify\":\"oakn\",\"captchaId\":\"0defda863c7d486ea6fe881af272f3d3\",\"username\":\"admin\"}', 'POST', '/admin/login', 'admin', '1');
INSERT INTO `sys_log` VALUES ('87a8884e9a474dc3b89113ee43c3b0a7', null, '2019-04-23 17:01:42', '0', null, '2019-04-23 17:01:42', '69', '169.254.180.57', '本地链路', '获取当前登录用户接口', '{}', 'GET', '/admin/user/info', 'admin', '0');
INSERT INTO `sys_log` VALUES ('d3007eeac21e4af28831e9b796fbbf8a', null, '2019-04-23 17:01:42', '0', null, '2019-04-23 17:01:42', '81', '169.254.180.57', '本地链路', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('5852d0ca746547359fee36af890961b9', null, '2019-04-23 17:01:55', '0', null, '2019-04-23 17:01:55', '104', '169.254.180.57', '本地链路', '获取权限菜单树', '{}', 'GET', '/admin/menu/getAllList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('1a2f907674f1429da1aa9efafa7902c2', null, '2019-04-23 17:02:27', '0', null, '2019-04-23 17:02:27', '75', '169.254.180.57', '本地链路', '获取权限菜单树', '{}', 'GET', '/admin/menu/getAllList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('b2508020b3ee414e96d08e99bd80bb08', null, '2019-04-23 17:02:27', '0', null, '2019-04-23 17:02:27', '69', '169.254.180.57', '本地链路', '分页获取角色', '{\"pageNo\":\"1\",\"name\":\"\",\"pageSize\":\"10\"}', 'GET', '/admin/role/getAllByPage', 'admin', '0');
INSERT INTO `sys_log` VALUES ('08e896759741418293726b6df530d802', null, '2019-04-23 17:02:41', '0', null, '2019-04-23 17:02:41', '44', '169.254.180.57', '本地链路', '分页获取角色', '{\"pageNo\":\"1\",\"name\":\"\",\"pageSize\":\"10\"}', 'GET', '/admin/role/getAllByPage', 'admin', '0');
INSERT INTO `sys_log` VALUES ('a94b177843224dde85c65dadade14837', null, '2019-04-23 17:02:41', '0', null, '2019-04-23 17:02:41', '71', '169.254.180.57', '本地链路', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('3c7f0e911dc840409e3e833035bfa3f9', null, '2019-04-23 17:03:00', '0', null, '2019-04-23 17:03:00', '657', '169.254.180.57', '本地链路', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"verify\":\"e5el\",\"captchaId\":\"aa8653f9458344aea954da5c07c51695\",\"username\":\"admin\"}', 'POST', '/admin/login', 'admin', '1');
INSERT INTO `sys_log` VALUES ('1312ef82e4e84bb3a36f70b4b68d4900', null, '2019-04-23 17:03:00', '0', null, '2019-04-23 17:03:00', '59', '169.254.180.57', '本地链路', '获取当前登录用户接口', '{}', 'GET', '/admin/user/info', 'admin', '0');
INSERT INTO `sys_log` VALUES ('0a893275503343c9b4583e931fc4e494', null, '2019-04-23 17:03:00', '0', null, '2019-04-23 17:03:00', '70', '169.254.180.57', '本地链路', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('e5f4991e549b4c80b06ec011dacc53fe', null, '2019-04-23 17:03:13', '0', null, '2019-04-23 17:03:13', '61', '169.254.180.57', '本地链路', '获取全部角色', '{}', 'GET', '/admin/role/getAllList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('75b61d73d1404732a12b1f218ce3f51e', null, '2019-04-23 17:03:13', '0', null, '2019-04-23 17:03:13', '80', '169.254.180.57', '本地链路', '查询用户列表', '{\"officeId\":\"\",\"pageNo\":\"1\",\"sex\":\"\",\"mobile\":\"\",\"pageSize\":\"10\",\"sort\":\"create_time\",\"type\":\"\",\"email\":\"\",\"username\":\"\",\"status\":\"\",\"order\":\"desc\"}', 'GET', '/admin/user/getUserList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('e6a30ff7a24443ed9526bc131d2aecb2', null, '2019-04-23 17:03:16', '0', null, '2019-04-23 17:03:16', '47', '169.254.180.57', '本地链路', '获取权限菜单树', '{}', 'GET', '/admin/menu/getAllList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('5600c3e902744f52a744422eb8da3e7f', null, '2019-04-23 17:03:16', '0', null, '2019-04-23 17:03:16', '41', '169.254.180.57', '本地链路', '分页获取角色', '{\"pageNo\":\"1\",\"name\":\"\",\"pageSize\":\"10\"}', 'GET', '/admin/role/getAllByPage', 'admin', '0');
INSERT INTO `sys_log` VALUES ('3a516cccc10f442b8371479ea0290022', null, '2019-04-23 17:04:14', '0', null, '2019-04-23 17:04:14', '68', '169.254.180.57', '本地链路', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('eb62a8abec3d47fbb35924d9e1fa56ec', null, '2019-04-23 17:05:28', '0', null, '2019-04-23 17:05:28', '68', '169.254.180.57', '本地链路', '分页获取角色', '{\"pageNo\":\"1\",\"name\":\"\",\"pageSize\":\"10\"}', 'GET', '/admin/role/getAllByPage', 'admin', '0');
INSERT INTO `sys_log` VALUES ('9d9ff059a7444089897979ad05e38055', null, '2019-04-23 17:05:28', '0', null, '2019-04-23 17:05:28', '71', '169.254.180.57', '本地链路', '获取权限菜单树', '{}', 'GET', '/admin/menu/getAllList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('8bf45efb2acc4d24be0fe9916e63f8c6', null, '2019-04-23 17:05:56', '0', null, '2019-04-23 17:05:56', '664', '169.254.180.57', '本地链路', '角色分配菜单权限', '{\"permIds\":\"5129710648430592,9fbea9d2790a4a6b9971461551db8d40,5129710648430593,40238597734928384\",\"roleId\":\"2c08a6cb17a74c8c9823432a8272eaf3\"}', 'POST', '/admin/role/editRolePerm', 'admin', '0');
INSERT INTO `sys_log` VALUES ('3b4c69834c2c49299fe0f1deb19e0187', null, '2019-04-23 17:05:57', '0', null, '2019-04-23 17:05:57', '54', '169.254.180.57', '本地链路', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('c581639d74344bdaada930ae1695c4e0', null, '2019-04-23 17:05:57', '0', null, '2019-04-23 17:05:57', '79', '169.254.180.57', '本地链路', '分页获取角色', '{\"pageNo\":\"1\",\"name\":\"\",\"pageSize\":\"10\"}', 'GET', '/admin/role/getAllByPage', 'admin', '0');
INSERT INTO `sys_log` VALUES ('7c36e10140d14e36b5e91ee84aaffe73', null, '2019-04-23 17:06:14', '0', null, '2019-04-23 17:06:14', '643', '169.254.180.57', '本地链路', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"verify\":\"ehdk\",\"captchaId\":\"fa6e481f447d4c1fb1db600b7276e59f\",\"username\":\"test\"}', 'POST', '/admin/login', 'test', '1');
INSERT INTO `sys_log` VALUES ('f054d8e56dde4e5699da21a79654bd07', null, '2019-04-23 17:06:14', '0', null, '2019-04-23 17:06:14', '55', '169.254.180.57', '本地链路', '获取当前登录用户接口', '{}', 'GET', '/admin/user/info', 'test', '0');
INSERT INTO `sys_log` VALUES ('f3893b537bcf4912832ce2d90cdb9b35', null, '2019-04-23 17:06:14', '0', null, '2019-04-23 17:06:14', '78', '169.254.180.57', '本地链路', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'test', '0');
INSERT INTO `sys_log` VALUES ('661a1aa850f749339fc563cf582a5022', null, '2019-04-23 17:06:25', '0', null, '2019-04-23 17:06:25', '69', '169.254.180.57', '本地链路', '获取全部角色', '{}', 'GET', '/admin/role/getAllList', 'test', '0');
INSERT INTO `sys_log` VALUES ('1ca9fd4fb8e54aad99244ec9e7ac65d4', null, '2019-04-23 17:06:25', '0', null, '2019-04-23 17:06:25', '81', '169.254.180.57', '本地链路', '查询用户列表', '{\"officeId\":\"\",\"pageNo\":\"1\",\"sex\":\"\",\"mobile\":\"\",\"pageSize\":\"10\",\"sort\":\"create_time\",\"type\":\"\",\"email\":\"\",\"username\":\"\",\"status\":\"\",\"order\":\"desc\"}', 'GET', '/admin/user/getUserList', 'test', '0');
INSERT INTO `sys_log` VALUES ('45742cd7519d452985486825a6d5a917', null, '2019-04-23 18:10:42', '0', null, '2019-04-23 18:10:42', '694', '169.254.180.57', '本地链路', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"verify\":\"o4iu\",\"captchaId\":\"32b006370f0844e187c32169452a39f3\",\"username\":\"admin\"}', 'POST', '/admin/login', 'admin', '1');
INSERT INTO `sys_log` VALUES ('2813e37e1bfd42898c4080e95d4c80f9', null, '2019-04-23 18:10:43', '0', null, '2019-04-23 18:10:43', '61', '169.254.180.57', '本地链路', '获取当前登录用户接口', '{}', 'GET', '/admin/user/info', 'admin', '0');
INSERT INTO `sys_log` VALUES ('73f5ed70d1124ae0904e3afd7045ec41', null, '2019-04-23 18:10:43', '0', null, '2019-04-23 18:10:43', '73', '169.254.180.57', '本地链路', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('0d0d289fe433450b94b354552cb4f8af', null, '2019-04-23 18:11:02', '0', null, '2019-04-23 18:11:02', '647', '169.254.180.57', '本地链路', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"verify\":\"yweb\",\"captchaId\":\"81b74583d1b44594bd7391416fd36aca\",\"username\":\"test\"}', 'POST', '/admin/login', 'test', '1');
INSERT INTO `sys_log` VALUES ('e8fac523322e452bbf349cbeb73c2c58', null, '2019-04-23 18:11:02', '0', null, '2019-04-23 18:11:02', '43', '169.254.180.57', '本地链路', '获取当前登录用户接口', '{}', 'GET', '/admin/user/info', 'test', '0');
INSERT INTO `sys_log` VALUES ('fb15563eca53456889069a918595289d', null, '2019-04-23 18:11:02', '0', null, '2019-04-23 18:11:02', '67', '169.254.180.57', '本地链路', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'test', '0');
INSERT INTO `sys_log` VALUES ('91f7ede2ecc9443db24a59b3c1d3fe9f', null, '2019-04-23 18:11:11', '0', null, '2019-04-23 18:11:11', '72', '169.254.180.57', '本地链路', '获取全部角色', '{}', 'GET', '/admin/role/getAllList', 'test', '0');
INSERT INTO `sys_log` VALUES ('842365a4907f4469b9b0e49233fbaa8b', null, '2019-04-23 18:11:11', '0', null, '2019-04-23 18:11:11', '90', '169.254.180.57', '本地链路', '查询用户列表', '{\"officeId\":\"\",\"pageNo\":\"1\",\"sex\":\"\",\"mobile\":\"\",\"pageSize\":\"10\",\"sort\":\"create_time\",\"type\":\"\",\"email\":\"\",\"username\":\"\",\"status\":\"\",\"order\":\"desc\"}', 'GET', '/admin/user/getUserList', 'test', '0');
INSERT INTO `sys_log` VALUES ('1c2f82a3e3124f9fa05b9400c1015f09', null, '2019-04-23 18:16:16', '0', null, '2019-04-23 18:16:16', '665', '169.254.180.57', '本地链路', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"verify\":\"lvyu\",\"captchaId\":\"8d8ab13379554fdcbdec0010316d2c95\",\"username\":\"admin\"}', 'POST', '/admin/login', 'admin', '1');
INSERT INTO `sys_log` VALUES ('15e9823eb33140eeb707f4a969098e44', null, '2019-04-23 18:16:16', '0', null, '2019-04-23 18:16:16', '61', '169.254.180.57', '本地链路', '获取当前登录用户接口', '{}', 'GET', '/admin/user/info', 'admin', '0');
INSERT INTO `sys_log` VALUES ('ca17e34be3e14217900f299fd566ff5d', null, '2019-04-23 18:16:16', '0', null, '2019-04-23 18:16:16', '42', '169.254.180.57', '本地链路', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('a985a2cfba964eada0796ee1cc818b30', null, '2019-04-23 18:17:12', '0', null, '2019-04-23 18:17:12', '50', '169.254.180.57', '本地链路', '获取权限菜单树', '{}', 'GET', '/admin/menu/getAllList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('a0f5408691664d08bbec811c692872e3', null, '2019-04-23 18:17:12', '0', null, '2019-04-23 18:17:12', '87', '169.254.180.57', '本地链路', '分页获取角色', '{\"pageNo\":\"1\",\"name\":\"\",\"pageSize\":\"10\"}', 'GET', '/admin/role/getAllByPage', 'admin', '0');
INSERT INTO `sys_log` VALUES ('2df9c581e0814fae9c86dfc0857cf052', null, '2019-04-23 18:17:28', '0', null, '2019-04-23 18:17:28', '716', '169.254.180.57', '本地链路', '角色分配菜单权限', '{\"permIds\":\"5129710648430592,9fbea9d2790a4a6b9971461551db8d40,5129710648430593\",\"roleId\":\"2c08a6cb17a74c8c9823432a8272eaf3\"}', 'POST', '/admin/role/editRolePerm', 'admin', '0');
INSERT INTO `sys_log` VALUES ('6695df257e5a4fb3aef6d2ba1d1c5886', null, '2019-04-23 18:17:28', '0', null, '2019-04-23 18:17:28', '57', '169.254.180.57', '本地链路', '分页获取角色', '{\"pageNo\":\"1\",\"name\":\"\",\"pageSize\":\"10\"}', 'GET', '/admin/role/getAllByPage', 'admin', '0');
INSERT INTO `sys_log` VALUES ('49cd0fb422ff4d0fbac39c153cf032df', null, '2019-04-23 18:17:28', '0', null, '2019-04-23 18:17:28', '81', '169.254.180.57', '本地链路', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('1e34e017bbd54db181dd8b05537d9b94', null, '2019-04-23 18:17:44', '0', null, '2019-04-23 18:17:44', '3347', '169.254.180.57', '本地链路', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"verify\":\"kje3\",\"captchaId\":\"4415bb5f0d3a4d54b3750b8f802e79f7\",\"username\":\"test\"}', 'POST', '/admin/login', 'test', '1');
INSERT INTO `sys_log` VALUES ('1854f543105940bfa97144cc5e04539d', null, '2019-04-23 18:17:48', '0', null, '2019-04-23 18:17:48', '610', '169.254.180.57', '本地链路', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"verify\":\"kje3\",\"captchaId\":\"4415bb5f0d3a4d54b3750b8f802e79f7\",\"username\":\"test\"}', 'POST', '/admin/login', 'test', '1');
INSERT INTO `sys_log` VALUES ('920861ba2380424c884e327708699f47', null, '2019-04-23 18:17:48', '0', null, '2019-04-23 18:17:48', '46', '169.254.180.57', '本地链路', '获取当前登录用户接口', '{}', 'GET', '/admin/user/info', 'test', '0');
INSERT INTO `sys_log` VALUES ('3b1ace384e084556880444c490893789', null, '2019-04-23 18:17:49', '0', null, '2019-04-23 18:17:49', '77', '169.254.180.57', '本地链路', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'test', '0');
INSERT INTO `sys_log` VALUES ('205bd5683c234b01ac1d1c8ee5df43be', null, '2019-04-23 18:17:52', '0', null, '2019-04-23 18:17:52', '50', '169.254.180.57', '本地链路', '获取全部角色', '{}', 'GET', '/admin/role/getAllList', 'test', '0');
INSERT INTO `sys_log` VALUES ('36b348e8c2e44d0db3fbd367e1b4aa6f', null, '2019-04-23 18:17:52', '0', null, '2019-04-23 18:17:52', '52', '169.254.180.57', '本地链路', '查询用户列表', '{\"officeId\":\"\",\"pageNo\":\"1\",\"sex\":\"\",\"mobile\":\"\",\"pageSize\":\"10\",\"sort\":\"create_time\",\"type\":\"\",\"email\":\"\",\"username\":\"\",\"status\":\"\",\"order\":\"desc\"}', 'GET', '/admin/user/getUserList', 'test', '0');
INSERT INTO `sys_log` VALUES ('c0aaa5507c0441e4a55b5537f418b0b7', null, '2019-04-23 18:17:59', '0', null, '2019-04-23 18:17:59', '73', '169.254.180.57', '本地链路', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'test', '0');
INSERT INTO `sys_log` VALUES ('767b6984a1354689961a79f757f6e85c', null, '2019-04-23 18:18:06', '0', null, '2019-04-23 18:18:06', '60', '169.254.180.57', '本地链路', '获取全部角色', '{}', 'GET', '/admin/role/getAllList', 'test', '0');
INSERT INTO `sys_log` VALUES ('28d1a45052c3473fa95ef326718c570e', null, '2019-04-23 18:18:06', '0', null, '2019-04-23 18:18:06', '86', '169.254.180.57', '本地链路', '查询用户列表', '{\"officeId\":\"\",\"pageNo\":\"1\",\"sex\":\"\",\"mobile\":\"\",\"pageSize\":\"10\",\"sort\":\"create_time\",\"type\":\"\",\"email\":\"\",\"username\":\"\",\"status\":\"\",\"order\":\"desc\"}', 'GET', '/admin/user/getUserList', 'test', '0');
INSERT INTO `sys_log` VALUES ('f9862aa90776446196e4b000c5f2ef18', null, '2019-04-23 18:20:02', '0', null, '2019-04-23 18:20:02', '71', '169.254.180.57', '本地链路', '获取全部角色', '{}', 'GET', '/admin/role/getAllList', 'test', '0');
INSERT INTO `sys_log` VALUES ('177e4b0e3d0546988673162c34a7ec21', null, '2019-04-23 18:20:02', '0', null, '2019-04-23 18:20:02', '87', '169.254.180.57', '本地链路', '查询用户列表', '{\"officeId\":\"\",\"pageNo\":\"1\",\"sex\":\"\",\"mobile\":\"\",\"pageSize\":\"10\",\"sort\":\"create_time\",\"type\":\"\",\"email\":\"\",\"username\":\"\",\"status\":\"\",\"order\":\"desc\"}', 'GET', '/admin/user/getUserList', 'test', '0');
INSERT INTO `sys_log` VALUES ('d4155842b4314aa0a44bd5b7537d4271', null, '2019-04-23 18:20:08', '0', null, '2019-04-23 18:20:08', '67', '169.254.180.57', '本地链路', '获取全部角色', '{}', 'GET', '/admin/role/getAllList', 'test', '0');
INSERT INTO `sys_log` VALUES ('a4a2474bf2b648fcb7e0c85bc41eb093', null, '2019-04-23 18:20:08', '0', null, '2019-04-23 18:20:08', '90', '169.254.180.57', '本地链路', '查询用户列表', '{\"officeId\":\"\",\"pageNo\":\"1\",\"sex\":\"\",\"mobile\":\"\",\"pageSize\":\"10\",\"sort\":\"create_time\",\"type\":\"\",\"email\":\"\",\"username\":\"\",\"status\":\"\",\"order\":\"desc\"}', 'GET', '/admin/user/getUserList', 'test', '0');
INSERT INTO `sys_log` VALUES ('922ed6b6805749ae8c95a8877927ac44', null, '2019-04-23 18:20:21', '0', null, '2019-04-23 18:20:21', '62', '169.254.180.57', '本地链路', '获取全部角色', '{}', 'GET', '/admin/role/getAllList', 'test', '0');
INSERT INTO `sys_log` VALUES ('f4685a5f11c643a8bf3fd89537200fc8', null, '2019-04-23 18:20:22', '0', null, '2019-04-23 18:20:22', '78', '169.254.180.57', '本地链路', '查询用户列表', '{\"officeId\":\"\",\"pageNo\":\"1\",\"sex\":\"\",\"mobile\":\"\",\"pageSize\":\"10\",\"sort\":\"create_time\",\"type\":\"\",\"email\":\"\",\"username\":\"\",\"status\":\"\",\"order\":\"desc\"}', 'GET', '/admin/user/getUserList', 'test', '0');
INSERT INTO `sys_log` VALUES ('49bea6c759ca431cb609501e643b42d5', null, '2019-04-23 18:20:26', '0', null, '2019-04-23 18:20:26', '55', '169.254.180.57', '本地链路', '查询用户列表', '{\"officeId\":\"\",\"pageNo\":\"1\",\"sex\":\"\",\"mobile\":\"\",\"pageSize\":\"10\",\"sort\":\"create_time\",\"type\":\"\",\"email\":\"\",\"username\":\"\",\"status\":\"\",\"order\":\"desc\"}', 'GET', '/admin/user/getUserList', 'test', '0');
INSERT INTO `sys_log` VALUES ('5da5ea55be58477c9bd15ef5e16540bc', null, '2019-04-23 18:20:26', '0', null, '2019-04-23 18:20:26', '34', '169.254.180.57', '本地链路', '获取全部角色', '{}', 'GET', '/admin/role/getAllList', 'test', '0');
INSERT INTO `sys_log` VALUES ('335788f261be40c4ba524317f63b7f6a', null, '2019-04-23 18:20:44', '0', null, '2019-04-23 18:20:44', '653', '169.254.180.57', '本地链路', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"verify\":\"x8d6\",\"captchaId\":\"4b59f5fba1c24addb7e3cb42194353dc\",\"username\":\"admin\"}', 'POST', '/admin/login', 'admin', '1');
INSERT INTO `sys_log` VALUES ('61f6a9fb08f843fa83a85880f4fafcff', null, '2019-04-23 18:20:44', '0', null, '2019-04-23 18:20:44', '55', '169.254.180.57', '本地链路', '获取当前登录用户接口', '{}', 'GET', '/admin/user/info', 'admin', '0');
INSERT INTO `sys_log` VALUES ('b33823b6d6b6434e86dcb513dc4bd6c1', null, '2019-04-23 18:20:45', '0', null, '2019-04-23 18:20:45', '40', '169.254.180.57', '本地链路', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('f8baba4fa68840098277e3cef1257ad4', null, '2019-04-23 18:20:49', '0', null, '2019-04-23 18:20:49', '50', '169.254.180.57', '本地链路', '获取权限菜单树', '{}', 'GET', '/admin/menu/getAllList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('9f68d49e3d2d49429e3d14a7d8fdee5b', null, '2019-04-23 18:21:25', '0', null, '2019-04-23 18:21:25', '673', '169.254.180.57', '本地链路', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"verify\":\"zapz\",\"captchaId\":\"9816d6ee708a43f8967704538333dff7\",\"username\":\"test\"}', 'POST', '/admin/login', 'test', '1');
INSERT INTO `sys_log` VALUES ('b865456cda2845d39ee89b59d0101685', null, '2019-04-23 18:21:26', '0', null, '2019-04-23 18:21:26', '64', '169.254.180.57', '本地链路', '获取当前登录用户接口', '{}', 'GET', '/admin/user/info', 'test', '0');
INSERT INTO `sys_log` VALUES ('59c83a8d771f42379ca6522b237da0b1', null, '2019-04-23 18:21:26', '0', null, '2019-04-23 18:21:26', '39', '169.254.180.57', '本地链路', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'test', '0');
INSERT INTO `sys_log` VALUES ('162437388c334b2f8dfc95bf188fcc6a', null, '2019-04-23 18:21:29', '0', null, '2019-04-23 18:21:29', '37', '169.254.180.57', '本地链路', '获取全部角色', '{}', 'GET', '/admin/role/getAllList', 'test', '0');
INSERT INTO `sys_log` VALUES ('849a1d7ce8ef4df7b44d0b850721197e', null, '2019-04-23 18:21:29', '0', null, '2019-04-23 18:21:29', '70', '169.254.180.57', '本地链路', '查询用户列表', '{\"officeId\":\"\",\"pageNo\":\"1\",\"sex\":\"\",\"mobile\":\"\",\"pageSize\":\"10\",\"sort\":\"create_time\",\"type\":\"\",\"email\":\"\",\"username\":\"\",\"status\":\"\",\"order\":\"desc\"}', 'GET', '/admin/user/getUserList', 'test', '0');
INSERT INTO `sys_log` VALUES ('0e6897c27b644cd5acabda26a98a8031', null, '2019-04-23 18:22:39', '0', null, '2019-04-23 18:22:39', '680', '169.254.180.57', '本地链路', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"verify\":\"s2q4\",\"captchaId\":\"4bc9dd38113548ffada9b8b2afe0a76d\",\"username\":\"admin\"}', 'POST', '/admin/login', 'admin', '1');
INSERT INTO `sys_log` VALUES ('529bf825ec994fe49e7437a04993551e', null, '2019-04-23 18:22:39', '0', null, '2019-04-23 18:22:39', '58', '169.254.180.57', '本地链路', '获取当前登录用户接口', '{}', 'GET', '/admin/user/info', 'admin', '0');
INSERT INTO `sys_log` VALUES ('af55274a8a114b38b991fb260ebe2025', null, '2019-04-23 18:22:39', '0', null, '2019-04-23 18:22:39', '46', '169.254.180.57', '本地链路', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('3dd6148dda184ab380cbd68cb80a552c', null, '2019-04-23 18:22:43', '0', null, '2019-04-23 18:22:43', '47', '169.254.180.57', '本地链路', '分页获取角色', '{\"pageNo\":\"1\",\"name\":\"\",\"pageSize\":\"10\"}', 'GET', '/admin/role/getAllByPage', 'admin', '0');
INSERT INTO `sys_log` VALUES ('afb6890cb9c842519454725d96fd33f1', null, '2019-04-23 18:22:43', '0', null, '2019-04-23 18:22:43', '80', '169.254.180.57', '本地链路', '获取权限菜单树', '{}', 'GET', '/admin/menu/getAllList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('2a6219228fe74b3489089c6b4cb1ebaa', null, '2019-04-23 18:23:01', '0', null, '2019-04-23 18:23:01', '351', '169.254.180.57', '本地链路', '更新角色', '{}', 'POST', '/admin/role/edit', 'admin', '0');
INSERT INTO `sys_log` VALUES ('dddcb6689ae74219922457b68ef6a961', null, '2019-04-23 18:23:01', '0', null, '2019-04-23 18:23:01', '55', '169.254.180.57', '本地链路', '分页获取角色', '{\"pageNo\":\"1\",\"name\":\"\",\"pageSize\":\"10\"}', 'GET', '/admin/role/getAllByPage', 'admin', '0');
INSERT INTO `sys_log` VALUES ('f8dc4f6396ca4e399b8ae24a2d16819c', null, '2019-04-23 18:23:37', '0', null, '2019-04-23 18:23:37', '721', '169.254.180.57', '本地链路', '角色分配菜单权限', '{\"permIds\":\"5129710648430592,9fbea9d2790a4a6b9971461551db8d40,5129710648430593\",\"roleId\":\"d559c3bd0c244cbebef2cb66e35e19c0\"}', 'POST', '/admin/role/editRolePerm', 'admin', '0');
INSERT INTO `sys_log` VALUES ('8f3c436ffb5049f39a4e52f570b03bb2', null, '2019-04-23 18:23:37', '0', null, '2019-04-23 18:23:37', '42', '169.254.180.57', '本地链路', '获取用户页面菜单数据', '{}', 'GET', '/admin/menu/getMenuList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('10473cad6525457ab1a692de818629b4', null, '2019-04-23 18:23:37', '0', null, '2019-04-23 18:23:37', '69', '169.254.180.57', '本地链路', '分页获取角色', '{\"pageNo\":\"1\",\"name\":\"\",\"pageSize\":\"10\"}', 'GET', '/admin/role/getAllByPage', 'admin', '0');
INSERT INTO `sys_log` VALUES ('d86dc535757c4f4890e3aea5946a0a34', null, '2019-04-23 18:23:44', '0', null, '2019-04-23 18:23:44', '63', '169.254.180.57', '本地链路', '批量删除角色', '{}', 'DELETE', '/admin/role/delAllByIds/2c08a6cb17a74c8c9823432a8272eaf3', 'admin', '0');
INSERT INTO `sys_log` VALUES ('e9fdca80dbf2471494e57cc0a651aba4', null, '2019-04-23 18:23:57', '0', null, '2019-04-23 18:23:57', '357', '169.254.180.57', '本地链路', '更新角色', '{}', 'POST', '/admin/role/edit', 'admin', '0');
INSERT INTO `sys_log` VALUES ('f87e09db5a4c42aba6f71225c12bb27b', null, '2019-04-23 18:23:57', '0', null, '2019-04-23 18:23:57', '41', '169.254.180.57', '本地链路', '分页获取角色', '{\"pageNo\":\"1\",\"name\":\"\",\"pageSize\":\"10\"}', 'GET', '/admin/role/getAllByPage', 'admin', '0');
INSERT INTO `sys_log` VALUES ('f6ec35978a864b5c904277b9af51f67e', null, '2019-04-23 18:24:05', '0', null, '2019-04-23 18:24:05', '65', '169.254.180.57', '本地链路', '获取全部角色', '{}', 'GET', '/admin/role/getAllList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('9df0e6883e3f41b584cf7658552080ff', null, '2019-04-23 18:24:05', '0', null, '2019-04-23 18:24:05', '80', '169.254.180.57', '本地链路', '查询用户列表', '{\"officeId\":\"\",\"pageNo\":\"1\",\"sex\":\"\",\"mobile\":\"\",\"pageSize\":\"10\",\"sort\":\"create_time\",\"type\":\"\",\"email\":\"\",\"username\":\"\",\"status\":\"\",\"order\":\"desc\"}', 'GET', '/admin/user/getUserList', 'admin', '0');
INSERT INTO `sys_log` VALUES ('c994560389b94f098d1e612df82dec22', null, '2019-04-23 18:24:18', '0', null, '2019-04-23 18:24:18', '75', '169.254.180.57', '本地链路', '获取权限菜单树', '{}', 'GET', '/admin/menu/getAllList', 'admin', '0');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `sort_order` decimal(10,2) DEFAULT NULL,
  `component` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `button_type` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('5129710648430592', '', '2018-06-04 19:02:29', '0', '', '2018-09-29 23:11:56', '', 'sys', '', '0', '1.00', 'Main', '/sys', '系统管理', 'ios-settings', '1', '', '0', '');
INSERT INTO `sys_menu` VALUES ('5129710648430593', '', '2018-06-04 19:02:32', '0', '', '2018-08-13 15:15:33', '', 'user-manage', '5129710648430592', '0', '4.10', 'sys/user-manage/userManage', 'user-manage', '用户管理', 'md-person', '2', '', '0', '');
INSERT INTO `sys_menu` VALUES ('5129710648430594', '', '2018-06-04 19:02:35', '0', '', '2018-10-13 13:51:36', '', 'role-manage', '5129710648430592', '0', '2.60', 'sys/role-manage/roleManage', 'role-manage', '角色管理', 'md-contacts', '2', '', '0', '');
INSERT INTO `sys_menu` VALUES ('5129710648430595', '', '2018-06-04 19:02:37', '0', '', '2018-09-23 23:32:02', '', 'menu-manage', '5129710648430592', '0', '1.70', 'sys/menu-manage/menuManage', 'menu-manage', '菜单管理', 'md-menu', '2', '', '0', '');
INSERT INTO `sys_menu` VALUES ('15701400130424832', '', '2018-06-03 22:04:06', '0', '', '2018-09-19 22:16:44', '', '', '5129710648430593', '1', '1.11', '', '/user/admin/add*', '添加用户', '', '3', 'add', '0', '');
INSERT INTO `sys_menu` VALUES ('15701915807518720', '', '2018-06-03 22:06:09', '0', '', '2018-06-06 14:46:51', '', '', '5129710648430593', '1', '1.13', '', '/user/admin/disable/**', '禁用用户', '', '3', 'disable', '0', null);
INSERT INTO `sys_menu` VALUES ('15708892205944832', '', '2018-06-03 22:33:52', '0', '', '2018-06-28 16:44:48', '', '', '5129710648430593', '1', '1.14', '', '/user/admin/enable/**', '启用用户', '', '3', 'enable', '0', null);
INSERT INTO `sys_menu` VALUES ('16678126574637056', '', '2018-06-06 14:45:16', '0', '', '2018-09-19 22:16:48', '', '', '5129710648430593', '1', '1.12', '', '/user/admin/edit*', '编辑用户', '', '3', 'edit', '0', '');
INSERT INTO `sys_menu` VALUES ('16678447719911424', '', '2018-06-06 14:46:32', '0', '', '2018-08-10 21:41:16', '', '', '5129710648430593', '1', '1.15', '', '/user/delByIds/**', '删除用户', '', '3', 'delete', '0', '');
INSERT INTO `sys_menu` VALUES ('16687383932047360', '', '2018-06-06 15:22:03', '0', '', '2018-09-19 22:07:34', '', '', '5129710648430594', '1', '1.21', '', '/role/save*', '添加角色', '', '3', 'add', '0', '');
INSERT INTO `sys_menu` VALUES ('16689632049631232', '', '2018-06-06 15:30:59', '0', '', '2018-09-19 22:07:37', '', '', '5129710648430594', '1', '1.22', '', '/role/edit*', '编辑角色', '', '3', 'edit', '0', '');
INSERT INTO `sys_menu` VALUES ('16689745006432256', '', '2018-06-06 15:31:26', '0', '', '2018-08-10 21:41:23', '', '', '5129710648430594', '1', '1.23', '', '/role/delAllByIds/**', '删除角色', '', '3', 'delete', '0', '');
INSERT INTO `sys_menu` VALUES ('16689883993083904', null, '2018-06-06 15:31:59', '0', null, '2018-06-06 15:31:59', null, null, '5129710648430594', '1', '1.24', null, '/role/editRolePerm/**', '分配权限', null, '3', 'editPerm', '0', null);
INSERT INTO `sys_menu` VALUES ('16690313745666048', '', '2018-06-06 15:33:41', '0', '', '2018-09-19 22:07:46', '', '', '5129710648430594', '1', '1.25', '', '/role/setDefault*', '设为默认角色', '', '3', 'setDefault', '0', '');
INSERT INTO `sys_menu` VALUES ('16694861252005888', '', '2018-06-06 15:51:46', '0', '', '2018-09-19 22:07:52', '', '', '5129710648430595', '1', '1.31', '', '/menu/add*', '添加菜单', '', '3', 'add', '0', '');
INSERT INTO `sys_menu` VALUES ('16695107491205120', '', '2018-06-06 15:52:44', '0', '', '2018-09-19 22:07:57', '', '', '5129710648430595', '1', '1.32', '', '/menu/edit*', '编辑菜单', '', '3', 'edit', '0', '');
INSERT INTO `sys_menu` VALUES ('16695243126607872', '', '2018-06-06 15:53:17', '0', 'admin', '2018-08-10 21:41:33', '', '', '5129710648430595', '1', '1.33', '', '/menu/delByIds/**', '删除菜单', '', '3', 'delete', '0', '');
INSERT INTO `sys_menu` VALUES ('39915540965232640', null, '2018-08-09 17:42:28', '0', null, '2018-08-09 17:42:28', null, 'monitor', null, '0', '2.00', 'Main', '/monitor', '系统设置', 'ios-analytics', '1', '', '0', null);
INSERT INTO `sys_menu` VALUES ('054f68ecbdd1497fbedd12f4b2b188d1', null, '2018-12-22 17:51:25', '0', null, '2018-12-22 17:51:25', null, 'system_setting', '39915540965232640', '0', '4.00', 'sys/setting/setting', 'setting/setting', '系统设置', 'ios-cog', '2', '', '0', null);
INSERT INTO `sys_menu` VALUES ('40238597734928384', null, '2018-08-10 15:06:10', '0', null, '2018-08-10 15:06:10', null, 'department-manage', '5129710648430592', '0', '3.20', 'sys/office/Office', 'department-manage', '部门管理', 'md-git-branch', '2', '', '0', null);
INSERT INTO `sys_menu` VALUES ('41363147411427328', '', '2018-08-13 17:34:43', '0', '', '2018-08-20 20:05:21', '', 'log-manage', '39915540965232640', '0', '2.20', 'sys/log-manage/logManage', 'log-manage', '日志管理', 'md-list-box', '2', '', '0', '');
INSERT INTO `sys_menu` VALUES ('41363537456533504', '', '2018-08-13 17:36:16', '0', '', '2018-08-13 17:56:11', '', '', '41363147411427328', '1', '2.11', '', '/log/delByIds/**', '删除日志', '', '3', 'delete', '0', '');
INSERT INTO `sys_menu` VALUES ('41364927394353152', '', '2018-08-13 17:41:48', '0', '', '2018-09-19 22:08:57', '', '', '41363147411427328', '1', '2.12', '', '/log/delAll*', '清空日志', '', '3', 'undefined', '0', '');
INSERT INTO `sys_menu` VALUES ('45235228800716800', '', '2018-08-24 10:01:00', '0', '', '2018-09-19 22:07:23', '', '', '44986029924421632', '1', '1.41', '', '/relate/delByIds*', '删除解绑', '', '3', 'delete', '0', '');
INSERT INTO `sys_menu` VALUES ('45235621697949696', '', '2018-08-24 10:02:33', '0', '', '2018-09-19 22:06:57', '', '', '40238597734928384', '1', '1.21', '', '/office/add*', '添加部门', '', '3', 'add', '0', '');
INSERT INTO `sys_menu` VALUES ('45235787867885568', '', '2018-08-24 10:03:13', '0', '', '2018-09-19 22:07:02', '', '', '40238597734928384', '1', '1.22', '', '/office/edit*', '编辑部门', '', '3', 'edit', '0', '');
INSERT INTO `sys_menu` VALUES ('45235939278065664', null, '2018-08-24 10:03:49', '0', null, '2018-08-24 10:03:49', null, '', '40238597734928384', '1', '1.23', '', '/office/delByIds/*', '删除部门', '', '3', 'delete', '0', null);
INSERT INTO `sys_menu` VALUES ('45236734832676864', '', '2018-08-24 10:06:59', '0', '', '2018-09-19 22:07:07', '', '', '43117268627886080', '1', '1.31', '', '/message/add*', '添加消息', '', '3', 'add', '0', '');
INSERT INTO `sys_menu` VALUES ('45237010692050944', '', '2018-08-24 10:08:04', '0', '', '2018-09-19 22:07:12', '', '', '43117268627886080', '1', '1.32', '', '/message/edit*', '编辑消息', '', '3', 'edit', '0', '');
INSERT INTO `sys_menu` VALUES ('45237170029465600', null, '2018-08-24 10:08:42', '0', null, '2018-08-24 10:08:42', null, '', '43117268627886080', '1', '1.33', '', '/message/delByIds/*', '删除消息', '', '3', 'delete', '0', null);
INSERT INTO `sys_menu` VALUES ('56898976661639168', '', '2018-09-25 14:28:34', '0', '', '2018-09-25 15:12:46', '', '', '5129710648430593', '1', '1.17', '', '/user/importData*', '导入用户', '', '3', 'input', '0', '');
INSERT INTO `sys_menu` VALUES ('b8a7639e9897425caf85f0e08616707e', null, null, '0', null, null, null, 'dict', '5129710648430592', '0', '5.00', 'sys/dict-manage/dictManage', 'dict', '字典管理', 'md-albums', '2', 'add', '0', null);
INSERT INTO `sys_menu` VALUES ('7435c534fd964e60bedd654fa02f3e21', null, null, '0', 'admin', null, null, '', 'b8a7639e9897425caf85f0e08616707e', '1', '1.00', '', 'dict/add', '添加字典', '', '3', 'add', '0', null);
INSERT INTO `sys_menu` VALUES ('9aee9dee2c434ddcad482c062730ef03', 'admin', '2018-12-22 14:04:48', '0', 'admin', '2018-12-22 14:04:48', null, '', 'b8a7639e9897425caf85f0e08616707e', '1', '3.00', '', '无', '删除字典', '', '3', 'delete', '0', null);
INSERT INTO `sys_menu` VALUES ('3467b2a05f224d2fb64055c4b36d18a0', 'admin', '2018-12-22 14:05:41', '0', null, '2018-12-22 14:05:41', null, '', 'b8a7639e9897425caf85f0e08616707e', '1', '1.00', '', '无', '编辑字典', '', '3', 'edit', '0', null);
INSERT INTO `sys_menu` VALUES ('e7f4c5f9c38345b395908f36b1ad90a9', null, '2019-02-12 02:17:37', '0', null, '2019-02-12 02:17:37', null, '', '5129710648430593', '1', '1.00', '', '无', '上传图片', '', '3', 'upload', '0', null);
INSERT INTO `sys_menu` VALUES ('9fbea9d2790a4a6b9971461551db8d40', null, '2019-04-23 15:09:35', '0', null, '2019-04-23 15:09:35', null, 'message', '5129710648430592', '0', '7.00', 'sys/message-manage/messageManage', '/message', '消息管理', 'ios-chatboxes', '2', '', '0', null);
INSERT INTO `sys_menu` VALUES ('096d022c186643d6894e5fb4cbe6ea97', null, '2019-04-23 16:54:57', '0', null, '2019-04-23 16:54:57', null, '', '9fbea9d2790a4a6b9971461551db8d40', '1', '1.00', '', '无', '消息编辑权限 ', '', '3', 'edit', '0', null);
INSERT INTO `sys_menu` VALUES ('b721306acb714cfca3a3db3addb5f49a', null, '2019-04-23 16:54:21', '0', null, '2019-04-23 16:54:21', null, '', '9fbea9d2790a4a6b9971461551db8d40', '1', '1.00', '', '无', '添加消息按钮', '', '3', 'add', '0', null);

-- ----------------------------
-- Table structure for sys_message
-- ----------------------------
DROP TABLE IF EXISTS `sys_message`;
CREATE TABLE `sys_message` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `context` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_message
-- ----------------------------
INSERT INTO `sys_message` VALUES ('44e0f96348834a80a9e0b5e1854b0415', '1', '2019-04-23 15:05:49', '0', '1', '2019-04-23 16:48:03', '消息1', '123123123\n消息1\n消息1');
INSERT INTO `sys_message` VALUES ('68227ab314c54758b4ae65c3523dd406', null, '2019-04-23 16:47:52', '0', null, '2019-04-23 16:57:05', '中国。北京', '中国。北京\n中国。北京\n中国。北京\n中国。北京\n中国。北京');

-- ----------------------------
-- Table structure for sys_office
-- ----------------------------
DROP TABLE IF EXISTS `sys_office`;
CREATE TABLE `sys_office` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  `sort_order` decimal(10,2) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `is_parent` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_office
-- ----------------------------
INSERT INTO `sys_office` VALUES ('5a32ed5e028340b8b9b4749cf2e236ad', null, null, '0', null, '2019-02-11 21:49:59', '5e305db0ae6e4132a25138eae3994acf', '1.00', '0', '研发部', '');
INSERT INTO `sys_office` VALUES ('5e305db0ae6e4132a25138eae3994acf', null, null, '0', null, null, '0', '1.00', '0', '耕雨科技', '');
INSERT INTO `sys_office` VALUES ('976e13f02b5942728ccce07b7e3eef79', null, '2019-02-11 21:49:59', '0', null, '2019-02-11 21:49:59', '5a32ed5e028340b8b9b4749cf2e236ad', '1.00', '0', '测试部', '\0');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `default_role` bit(1) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `data_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('496138616573952', 'admin', '2018-04-22 23:03:49', 'admin', '2018-11-15 23:02:59', 'ROLE_ADMIN', '0', '\0', '超级管理员 拥有所有权限', '0');
INSERT INTO `sys_role` VALUES ('d559c3bd0c244cbebef2cb66e35e19c0', 'admin', '2018-12-22 17:38:45', 'admin', '2018-12-22 17:38:45', 'ROLE_USER', '0', '', '普通用户', '0');
INSERT INTO `sys_role` VALUES ('2c08a6cb17a74c8c9823432a8272eaf3', null, '2019-02-12 01:29:43', null, '2019-02-12 01:29:43', 'ROLE_TEST', '0', null, '测试用户', '0');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `menu_id` varchar(255) DEFAULT NULL,
  `role_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('9f1db9fb95b348c58c7879f6cf686979', null, '2019-04-23 18:23:36', '0', null, '2019-04-23 18:23:36', '5129710648430593', 'd559c3bd0c244cbebef2cb66e35e19c0');
INSERT INTO `sys_role_menu` VALUES ('05efa8b67c0348f980b6f4bda127d009', null, '2019-04-23 18:23:36', '0', null, '2019-04-23 18:23:36', '5129710648430592', 'd559c3bd0c244cbebef2cb66e35e19c0');
INSERT INTO `sys_role_menu` VALUES ('b39ea9b199b14980ac2f8eafd668c4d3', null, '2019-04-23 18:23:36', '0', null, '2019-04-23 18:23:36', '9fbea9d2790a4a6b9971461551db8d40', 'd559c3bd0c244cbebef2cb66e35e19c0');
INSERT INTO `sys_role_menu` VALUES ('30508e5e0a39498b87424db64a9c2643', null, '2019-04-23 17:02:41', '0', null, '2019-04-23 17:02:41', '16694861252005888', '496138616573952');
INSERT INTO `sys_role_menu` VALUES ('b3557c9f6ff34d9ab5c3383f4fe48733', null, '2019-04-23 17:02:41', '0', null, '2019-04-23 17:02:41', '16695107491205120', '496138616573952');
INSERT INTO `sys_role_menu` VALUES ('212a9c60f2284eba9e111892d06fdb30', null, '2019-04-23 17:02:41', '0', null, '2019-04-23 17:02:41', '16695243126607872', '496138616573952');
INSERT INTO `sys_role_menu` VALUES ('1ef5eece00ff42f09bb409b09f572f76', null, '2019-04-23 17:02:41', '0', null, '2019-04-23 17:02:41', '5129710648430595', '496138616573952');
INSERT INTO `sys_role_menu` VALUES ('60939e6a654e423cb921d110f4318c91', null, '2019-04-23 17:02:41', '0', null, '2019-04-23 17:02:41', '16687383932047360', '496138616573952');
INSERT INTO `sys_role_menu` VALUES ('784a54d36f7f4f888319422cde5be7d2', null, '2019-04-23 17:02:41', '0', null, '2019-04-23 17:02:41', '16689632049631232', '496138616573952');
INSERT INTO `sys_role_menu` VALUES ('a9b3bd0aaa4741a69664888478cd7caa', null, '2019-04-23 17:02:41', '0', null, '2019-04-23 17:02:41', '16689745006432256', '496138616573952');
INSERT INTO `sys_role_menu` VALUES ('08f62361d7d54f31a0b2db9709aff4c0', null, '2019-04-23 17:02:41', '0', null, '2019-04-23 17:02:41', '16690313745666048', '496138616573952');
INSERT INTO `sys_role_menu` VALUES ('b3889bebba76405a9b274c1441f1e0c3', null, '2019-04-23 17:02:41', '0', null, '2019-04-23 17:02:41', '16689883993083904', '496138616573952');
INSERT INTO `sys_role_menu` VALUES ('e75011df403040518eddd92f1cde4192', null, '2019-04-23 17:02:41', '0', null, '2019-04-23 17:02:41', '5129710648430594', '496138616573952');
INSERT INTO `sys_role_menu` VALUES ('8c66329ca2a8436f822c73407a21b1ac', null, '2019-04-23 17:02:41', '0', null, '2019-04-23 17:02:41', '45235621697949696', '496138616573952');
INSERT INTO `sys_role_menu` VALUES ('b62b01c4b80a4ebdab1e99230cec062f', null, '2019-04-23 17:02:41', '0', null, '2019-04-23 17:02:41', '45235787867885568', '496138616573952');
INSERT INTO `sys_role_menu` VALUES ('8afffb7159f64b478fe30553b653ba26', null, '2019-04-23 17:02:41', '0', null, '2019-04-23 17:02:41', '45235939278065664', '496138616573952');
INSERT INTO `sys_role_menu` VALUES ('bfe57e57e92545479c5fe7825c4e2945', null, '2019-04-23 17:02:41', '0', null, '2019-04-23 17:02:41', '40238597734928384', '496138616573952');
INSERT INTO `sys_role_menu` VALUES ('936c2a9cf87442e1a2fb5444e9f62324', null, '2019-04-23 17:02:41', '0', null, '2019-04-23 17:02:41', 'e7f4c5f9c38345b395908f36b1ad90a9', '496138616573952');
INSERT INTO `sys_role_menu` VALUES ('0f549d71ee3c41a896cb3087469125e1', null, '2019-04-23 17:02:41', '0', null, '2019-04-23 17:02:41', '16678126574637056', '496138616573952');
INSERT INTO `sys_role_menu` VALUES ('1fee9d2dfa534d8997e147621bfdfe40', null, '2019-04-23 17:02:41', '0', null, '2019-04-23 17:02:41', '15701400130424832', '496138616573952');
INSERT INTO `sys_role_menu` VALUES ('2ed70bc57c3f49fbb72a03ab80f73a8c', null, '2019-04-23 17:02:41', '0', null, '2019-04-23 17:02:41', '15701915807518720', '496138616573952');
INSERT INTO `sys_role_menu` VALUES ('6f6c98d5db454d09a4b6f5457a093b22', null, '2019-04-23 17:02:41', '0', null, '2019-04-23 17:02:41', '16678447719911424', '496138616573952');
INSERT INTO `sys_role_menu` VALUES ('da6df0b674194c13af2690ef8a54d984', null, '2019-04-23 17:02:41', '0', null, '2019-04-23 17:02:41', '15708892205944832', '496138616573952');
INSERT INTO `sys_role_menu` VALUES ('ff7f8dc975654afba015002fc4a0def2', null, '2019-04-23 17:02:41', '0', null, '2019-04-23 17:02:41', '56898976661639168', '496138616573952');
INSERT INTO `sys_role_menu` VALUES ('96eb9fab14114200a8504d5afb3c9763', null, '2019-04-23 17:02:41', '0', null, '2019-04-23 17:02:41', '5129710648430593', '496138616573952');
INSERT INTO `sys_role_menu` VALUES ('87f71062507344ff9873c177dd5df6d0', null, '2019-04-23 17:02:41', '0', null, '2019-04-23 17:02:41', '3467b2a05f224d2fb64055c4b36d18a0', '496138616573952');
INSERT INTO `sys_role_menu` VALUES ('57698c6906984f45b616e8eb60a508df', null, '2019-04-23 17:02:41', '0', null, '2019-04-23 17:02:41', '7435c534fd964e60bedd654fa02f3e21', '496138616573952');
INSERT INTO `sys_role_menu` VALUES ('398d0983d9e448ecbf08fefff946d586', null, '2019-04-23 17:02:41', '0', null, '2019-04-23 17:02:41', '9aee9dee2c434ddcad482c062730ef03', '496138616573952');
INSERT INTO `sys_role_menu` VALUES ('3d83eef5c45b4eb8a4d825d9552bd0f2', null, '2019-04-23 17:02:41', '0', null, '2019-04-23 17:02:41', 'b8a7639e9897425caf85f0e08616707e', '496138616573952');
INSERT INTO `sys_role_menu` VALUES ('f8cb55afc6f14fb0a21d1e8de43167d5', null, '2019-04-23 18:17:27', '0', null, '2019-04-23 18:17:27', '9fbea9d2790a4a6b9971461551db8d40', '2c08a6cb17a74c8c9823432a8272eaf3');
INSERT INTO `sys_role_menu` VALUES ('90ba3b0150c64a9fba51db71250b2489', null, '2019-04-23 18:17:27', '0', null, '2019-04-23 18:17:27', '5129710648430593', '2c08a6cb17a74c8c9823432a8272eaf3');
INSERT INTO `sys_role_menu` VALUES ('757eb4f4907743b0aebd4bcf886752a2', null, '2019-04-23 18:17:27', '0', null, '2019-04-23 18:17:27', '5129710648430592', '2c08a6cb17a74c8c9823432a8272eaf3');
INSERT INTO `sys_role_menu` VALUES ('17d0c154f48245b0a3b552571e5be583', null, '2019-04-23 17:02:41', '0', null, '2019-04-23 17:02:41', 'b721306acb714cfca3a3db3addb5f49a', '496138616573952');
INSERT INTO `sys_role_menu` VALUES ('b4843a4aa5a3442287b2e5f58673497e', null, '2019-04-23 17:02:41', '0', null, '2019-04-23 17:02:41', '096d022c186643d6894e5fb4cbe6ea97', '496138616573952');
INSERT INTO `sys_role_menu` VALUES ('871f35f902ff4ba2a0605216a8c4b0df', null, '2019-04-23 17:02:41', '0', null, '2019-04-23 17:02:41', '9fbea9d2790a4a6b9971461551db8d40', '496138616573952');
INSERT INTO `sys_role_menu` VALUES ('beb42b3248a2429586dacdd8c7a6f380', null, '2019-04-23 17:02:41', '0', null, '2019-04-23 17:02:41', '5129710648430592', '496138616573952');
INSERT INTO `sys_role_menu` VALUES ('cfabf7413e0a44048b17822f5a8d8a7a', null, '2019-04-23 17:02:41', '0', null, '2019-04-23 17:02:41', '41363537456533504', '496138616573952');
INSERT INTO `sys_role_menu` VALUES ('f88ca1f538a6482092388aaeb54dc765', null, '2019-04-23 17:02:41', '0', null, '2019-04-23 17:02:41', '41364927394353152', '496138616573952');
INSERT INTO `sys_role_menu` VALUES ('6c75bd270e8242a19c4adcf89d9bb2eb', null, '2019-04-23 17:02:41', '0', null, '2019-04-23 17:02:41', '41363147411427328', '496138616573952');
INSERT INTO `sys_role_menu` VALUES ('e48385f1112a4c18945c2e84cb3a74dd', null, '2019-04-23 17:02:41', '0', null, '2019-04-23 17:02:41', '054f68ecbdd1497fbedd12f4b2b188d1', '496138616573952');
INSERT INTO `sys_role_menu` VALUES ('d30a3fa44e3741c287885229bbd2bcf0', null, '2019-04-23 17:02:41', '0', null, '2019-04-23 17:02:41', '39915540965232640', '496138616573952');

-- ----------------------------
-- Table structure for sys_role_office
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_office`;
CREATE TABLE `sys_role_office` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `office_id` varchar(255) DEFAULT NULL,
  `role_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_office
-- ----------------------------
INSERT INTO `sys_role_office` VALUES ('3e5ba582dc3149ddb6e699c644381528', null, '2019-02-12 01:39:51', '0', null, '2019-02-12 01:39:51', '976e13f02b5942728ccce07b7e3eef79', '2c08a6cb17a74c8c9823432a8272eaf3');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `avatar` varchar(1000) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `nick_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `office_id` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `pass_strength` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '', '2018-05-01 16:13:51', 'admin', '2018-11-14 21:52:20', '[\"510000\",\"510100\",\"510104\"]', 'http://tx.haiqq.com/uploads/allimg/160824/1126355296-0.jpg', 'test', '2549575805@qq.com', '18782059038', 'admin', '$2a$10$PS04ecXfknNd3V8d.ymLTObQciapMU4xU8.GADBZZsuTZr7ymnagy', '1', '0', '1', 'admin', '0', '5e305db0ae6e4132a25138eae3994acf', '天府1街', '弱');
INSERT INTO `sys_user` VALUES ('f5a97ee936e441a58b8a4baa2ad41907', null, '2018-12-22 17:33:12', null, '2018-12-22 17:33:12', null, 'http://127.0.0.1:8888/upload/2019/2/13/20190213145550timg.jpg', null, '775771672@qq.com', '18302971493', null, '$2a$10$ZmnzEzq.y8dyDKl.GiQIZ.Mu.5DAL5np/eeX5gH/uGbgsnQp117aC', '1', '0', '1', 'hugd', '0', '5e305db0ae6e4132a25138eae3994acf', null, null);
INSERT INTO `sys_user` VALUES ('ce6b8f483ca74e308c59c15e10bde014', null, '2019-02-12 01:44:25', null, '2019-02-12 01:44:25', null, 'http://tx.haiqq.com/uploads/allimg/160824/1126355296-0.jpg', null, '18302971493@163.com', '15029227850', null, '$2a$10$B7jrf5vMfERhcbKqpbcReeArWzQ/LMb10oUOokX57VhmDuesJOMOa', '1', '-1', '0', 'xiaohu', '0', '976e13f02b5942728ccce07b7e3eef79', null, null);
INSERT INTO `sys_user` VALUES ('5ba6fefae7bc4e48a199e4e8abbcee94', null, '2019-04-23 15:21:29', null, '2019-04-23 15:21:29', null, 'http://tx.haiqq.com/uploads/allimg/160824/1126355296-0.jpg', null, '123@qwe.nm', '18999999999', null, '$2a$10$HagEPKOAwkkLKU7zbNoI2ejRFpSZ5y/TcajWidDp8vwfokLt2xXAa', '1', '0', '0', 'test', '0', '5e305db0ae6e4132a25138eae3994acf', null, null);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `role_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('70669807116095488', null, '2018-11-02 14:28:56', '0', null, '2018-11-02 14:28:56', '496138616573952', '1');
INSERT INTO `sys_user_role` VALUES ('ab22aabca14042559780a4a5c4207bb7', null, '2019-02-13 00:55:53', '0', null, '2019-02-13 00:55:53', 'd559c3bd0c244cbebef2cb66e35e19c0', 'f5a97ee936e441a58b8a4baa2ad41907');
INSERT INTO `sys_user_role` VALUES ('8c483399097f4d158719bf8c7a68cb96', null, '2019-02-12 01:44:25', '0', null, '2019-02-12 01:44:25', '2c08a6cb17a74c8c9823432a8272eaf3', 'ce6b8f483ca74e308c59c15e10bde014');
INSERT INTO `sys_user_role` VALUES ('248ff2296ab94a4a850d178dd9a71b4f', null, '2019-04-23 15:21:30', '0', null, '2019-04-23 15:21:30', '2c08a6cb17a74c8c9823432a8272eaf3', '5ba6fefae7bc4e48a199e4e8abbcee94');

-- ----------------------------
-- Table structure for t_department
-- ----------------------------
DROP TABLE IF EXISTS `t_department`;
CREATE TABLE `t_department` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  `sort_order` decimal(10,2) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `is_parent` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_department
-- ----------------------------
INSERT INTO `t_department` VALUES ('40327253309001728', '', '2018-08-10 20:58:27', '0', '', '2018-08-11 17:26:38', '40322811096469504', '3.00', '-1', '人工智障', null);
INSERT INTO `t_department` VALUES ('40322777781112832', '', '2018-08-10 20:40:40', '0', '', '2018-08-11 00:03:06', '0', '1.00', '0', '总部', '');
INSERT INTO `t_department` VALUES ('40322811096469504', '', '2018-08-10 20:40:48', '0', '', '2018-08-11 00:27:05', '40322777781112832', '1.00', '0', '技术部', '');
INSERT INTO `t_department` VALUES ('40322852833988608', '', '2018-08-10 20:40:58', '0', '', '2018-08-11 01:29:42', '40322811096469504', '1.00', '0', '研发中心', null);
INSERT INTO `t_department` VALUES ('40327204755738624', '', '2018-08-10 20:58:15', '0', '', '2018-08-10 22:02:15', '40322811096469504', '2.00', '0', '大数据', null);
INSERT INTO `t_department` VALUES ('40343262766043136', '', '2018-08-10 22:02:04', '0', '', '2018-08-11 00:02:53', '0', '2.00', '0', '成都分部', '');
INSERT INTO `t_department` VALUES ('40681289119961088', '', '2018-08-11 20:25:16', '0', '', '2018-08-11 22:47:48', '40652270295060480', '2.00', '0', 'VIP', '\0');
INSERT INTO `t_department` VALUES ('40344005342400512', '', '2018-08-10 22:05:01', '0', '', '2018-08-11 17:48:44', '40343262766043136', '2.00', '0', 'Vue', null);
INSERT INTO `t_department` VALUES ('40652270295060480', '', '2018-08-11 18:29:57', '0', '', '2018-08-12 18:45:01', '0', '3.00', '0', '人事部', '');
INSERT INTO `t_department` VALUES ('40389030113710080', '', '2018-08-11 01:03:56', '0', '', '2018-08-11 17:50:04', '40343262766043136', '1.00', '0', 'JAVA', '\0');
INSERT INTO `t_department` VALUES ('40652338142121984', null, '2018-08-11 18:30:13', '0', null, '2018-08-11 18:30:13', '40652270295060480', '1.00', '0', '游客', '\0');

-- ----------------------------
-- Table structure for t_department_header
-- ----------------------------
DROP TABLE IF EXISTS `t_department_header`;
CREATE TABLE `t_department_header` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `department_id` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_department_header
-- ----------------------------

-- ----------------------------
-- Table structure for t_dict
-- ----------------------------
DROP TABLE IF EXISTS `t_dict`;
CREATE TABLE `t_dict` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `sort_order` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dict
-- ----------------------------
INSERT INTO `t_dict` VALUES ('75135930788220928', 'admin', '2018-11-14 22:15:43', '0', 'admin', '2018-11-27 01:39:06', '', '性别', 'sex', '0.00');
INSERT INTO `t_dict` VALUES ('75383353938808832', 'admin', '2018-11-15 14:38:53', '0', 'admin', '2018-11-27 01:39:15', '', '消息类型', 'message_type', '1.00');
INSERT INTO `t_dict` VALUES ('75388696739713024', 'admin', '2018-11-15 15:00:07', '0', 'admin', '2018-11-27 01:39:22', '', '按钮权限类型', 'permission_type', '3.00');
INSERT INTO `t_dict` VALUES ('75392985935646720', 'admin', '2018-11-15 15:17:10', '0', 'admin', '2018-11-27 01:39:29', '', '腾讯云对象存储区域', 'tencent_bucket_region', '4.00');

-- ----------------------------
-- Table structure for t_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `t_dict_data`;
CREATE TABLE `t_dict_data` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `dict_id` varchar(255) DEFAULT NULL,
  `sort_order` decimal(10,2) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dict_data
-- ----------------------------
INSERT INTO `t_dict_data` VALUES ('75158227712479232', 'admin', '2018-11-14 23:44:19', '0', 'admin', '2018-11-14 23:50:23', '', '75135930788220928', '0.00', '0', '男', '1');
INSERT INTO `t_dict_data` VALUES ('75159254272577536', 'admin', '2018-11-14 23:48:24', '0', 'admin', '2018-11-14 23:50:14', '', '75135930788220928', '1.00', '0', '女', '0');
INSERT INTO `t_dict_data` VALUES ('75159898425397248', 'admin', '2018-11-14 23:50:57', '0', 'admin', '2018-11-15 17:27:15', '', '75135930788220928', '2.00', '-1', '保密', '2');
INSERT INTO `t_dict_data` VALUES ('75385648017575936', 'admin', '2018-11-15 14:48:00', '0', 'admin', '2018-11-15 14:48:41', '', '75383353938808832', '0.00', '0', '系统公告', '0');
INSERT INTO `t_dict_data` VALUES ('75385706913992704', 'admin', '2018-11-15 14:48:14', '0', 'admin', '2018-11-15 14:48:44', '', '75383353938808832', '1.00', '0', '提醒', '1');
INSERT INTO `t_dict_data` VALUES ('75385774274514944', 'admin', '2018-11-15 14:48:30', '0', 'admin', '2018-11-15 14:48:48', '', '75383353938808832', '2.00', '0', '私信', '2');
INSERT INTO `t_dict_data` VALUES ('75390787835138048', 'admin', '2018-11-15 15:08:26', '0', 'admin', '2018-11-15 15:08:26', '', '75388696739713024', '0.00', '0', '查看操作(view)', 'view');
INSERT INTO `t_dict_data` VALUES ('75390886501945344', 'admin', '2018-11-15 15:08:49', '0', 'admin', '2018-11-15 15:08:57', '', '75388696739713024', '1.00', '0', '添加操作(add)', 'add');
INSERT INTO `t_dict_data` VALUES ('75390993939042304', 'admin', '2018-11-15 15:09:15', '0', 'admin', '2018-11-15 15:09:15', '', '75388696739713024', '2.00', '0', '编辑操作(edit)', 'edit');
INSERT INTO `t_dict_data` VALUES ('75391067532300288', 'admin', '2018-11-15 15:09:32', '0', 'admin', '2018-11-15 15:09:32', '', '75388696739713024', '3.00', '0', '删除操作(delete)', 'delete');
INSERT INTO `t_dict_data` VALUES ('75391126902673408', 'admin', '2018-11-15 15:09:46', '0', 'admin', '2018-11-15 15:09:46', '', '75388696739713024', '4.00', '0', '清空操作(clear)', 'clear');
INSERT INTO `t_dict_data` VALUES ('75391192883269632', 'admin', '2018-11-15 15:10:02', '0', 'admin', '2018-11-15 15:10:02', '', '75388696739713024', '5.00', '0', '启用操作(enable)', 'enable');
INSERT INTO `t_dict_data` VALUES ('75391251024711680', 'admin', '2018-11-15 15:10:16', '0', 'admin', '2018-11-15 15:10:16', '', '75388696739713024', '6.00', '0', '禁用操作(disable)', 'disable');
INSERT INTO `t_dict_data` VALUES ('75391297124306944', 'admin', '2018-11-15 15:10:27', '0', 'admin', '2018-11-15 15:10:27', '', '75388696739713024', '7.00', '0', '搜索操作(search)', 'search');
INSERT INTO `t_dict_data` VALUES ('75391343379091456', 'admin', '2018-11-15 15:10:38', '0', 'admin', '2018-11-15 15:10:38', '', '75388696739713024', '8.00', '0', '上传文件(upload)', 'upload');
INSERT INTO `t_dict_data` VALUES ('75391407526776832', 'admin', '2018-11-15 15:10:53', '0', 'admin', '2018-11-15 15:10:53', '', '75388696739713024', '9.00', '0', '导出操作(output)', 'output');
INSERT INTO `t_dict_data` VALUES ('75391475042488320', 'admin', '2018-11-15 15:11:09', '0', 'admin', '2018-11-15 15:11:09', '', '75388696739713024', '10.00', '0', '导入操作(input)', 'input');
INSERT INTO `t_dict_data` VALUES ('75391522182270976', 'admin', '2018-11-15 15:11:21', '0', 'admin', '2018-11-15 15:11:21', '', '75388696739713024', '11.00', '0', '分配权限(editPerm)', 'editPerm');
INSERT INTO `t_dict_data` VALUES ('75391576364290048', 'admin', '2018-11-15 15:11:34', '0', 'admin', '2018-11-15 15:11:34', '', '75388696739713024', '12.00', '0', '设为默认(setDefault)', 'setDefault');
INSERT INTO `t_dict_data` VALUES ('75391798033256448', 'admin', '2018-11-15 15:12:26', '0', 'admin', '2018-11-15 15:12:26', '', '75388696739713024', '13.00', '0', '其他操作(other)', 'other');
INSERT INTO `t_dict_data` VALUES ('75393605291741184', 'admin', '2018-11-15 15:19:37', '0', 'admin', '2018-11-15 15:19:37', '', '75392985935646720', '0.00', '0', '北京一区（华北）', 'ap-beijing-1');
INSERT INTO `t_dict_data` VALUES ('75393681254780928', 'admin', '2018-11-15 15:19:55', '0', 'admin', '2018-11-15 15:19:55', '', '75392985935646720', '1.00', '0', '北京', 'ap-beijing');
INSERT INTO `t_dict_data` VALUES ('75393767619694592', 'admin', '2018-11-15 15:20:16', '0', 'admin', '2018-11-15 15:20:16', '', '75392985935646720', '2.00', '0', '上海（华东）', 'ap-shanghai');
INSERT INTO `t_dict_data` VALUES ('75393851484803072', 'admin', '2018-11-15 15:20:36', '0', 'admin', '2018-11-15 15:20:36', '', '75392985935646720', '3.00', '0', '广州（华南）', 'ap-guangzhou');
INSERT INTO `t_dict_data` VALUES ('75393961887272960', 'admin', '2018-11-15 15:21:02', '0', 'admin', '2018-11-15 15:21:02', '', '75392985935646720', '4.00', '0', '成都（西南）', 'ap-chengdu');
INSERT INTO `t_dict_data` VALUES ('75394053969022976', 'admin', '2018-11-15 15:21:24', '0', 'admin', '2018-11-15 15:21:24', '', '75392985935646720', '5.00', '0', '重庆', 'ap-chongqing');
INSERT INTO `t_dict_data` VALUES ('75394122474590208', 'admin', '2018-11-15 15:21:41', '0', 'admin', '2018-11-15 15:21:41', '', '75392985935646720', '6.00', '0', '新加坡', 'ap-singapore');
INSERT INTO `t_dict_data` VALUES ('75394186202845184', 'admin', '2018-11-15 15:21:56', '0', 'admin', '2018-11-15 15:21:56', '', '75392985935646720', '7.00', '0', '香港', 'ap-hongkong');
INSERT INTO `t_dict_data` VALUES ('75394254255427584', 'admin', '2018-11-15 15:22:12', '0', 'admin', '2018-11-15 15:22:12', '', '75392985935646720', '8.00', '0', '多伦多', 'na-toronto');
INSERT INTO `t_dict_data` VALUES ('75394309125312512', 'admin', '2018-11-15 15:22:25', '0', 'admin', '2018-11-15 15:22:25', '', '75392985935646720', '9.00', '0', '法兰克福', 'eu-frankfurt');
INSERT INTO `t_dict_data` VALUES ('75394367044456448', 'admin', '2018-11-15 15:22:39', '0', 'admin', '2018-11-15 15:22:39', '', '75392985935646720', '10.00', '0', '孟买', 'ap-mumbai');
INSERT INTO `t_dict_data` VALUES ('75394448523005952', 'admin', '2018-11-15 15:22:58', '0', 'admin', '2018-11-15 15:22:58', '', '75392985935646720', '11.00', '0', '首尔', 'ap-seoul');
INSERT INTO `t_dict_data` VALUES ('75394604765024256', 'admin', '2018-11-15 15:23:36', '0', 'admin', '2018-11-15 15:23:36', '', '75392985935646720', '12.00', '0', '硅谷', 'na-siliconvalley');
INSERT INTO `t_dict_data` VALUES ('75394659299364864', 'admin', '2018-11-15 15:23:49', '0', 'admin', '2018-11-15 15:23:49', '', '75392985935646720', '13.00', '0', '弗吉尼亚', 'na-ashburn');
INSERT INTO `t_dict_data` VALUES ('75394705700950016', 'admin', '2018-11-15 15:24:00', '0', 'admin', '2018-11-15 15:24:00', '', '75392985935646720', '14.00', '0', '曼谷', 'ap-bangkok');
INSERT INTO `t_dict_data` VALUES ('75394759287377920', 'admin', '2018-11-15 15:24:12', '0', 'admin', '2018-11-15 15:24:12', '', '75392985935646720', '15.00', '0', '莫斯科', 'eu-moscow');

-- ----------------------------
-- Table structure for t_file
-- ----------------------------
DROP TABLE IF EXISTS `t_file`;
CREATE TABLE `t_file` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `size` bigint(20) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `f_key` varchar(255) DEFAULT NULL,
  `location` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_file
-- ----------------------------

-- ----------------------------
-- Table structure for t_log
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `cost_time` int(11) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `ip_info` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `request_param` longtext,
  `request_type` varchar(255) DEFAULT NULL,
  `request_url` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `log_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_log
-- ----------------------------

-- ----------------------------
-- Table structure for t_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `sort_order` decimal(10,2) DEFAULT NULL,
  `component` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `button_type` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_permission
-- ----------------------------
INSERT INTO `t_permission` VALUES ('5129710648430592', '', '2018-06-04 19:02:29', '0', '', '2018-09-29 23:11:56', '', 'sys', '', '0', '1.00', 'Main', '/sys', '系统管理', 'ios-settings', '1', '', '0', '');
INSERT INTO `t_permission` VALUES ('5129710648430593', '', '2018-06-04 19:02:32', '0', '', '2018-08-13 15:15:33', '', 'user-manage', '5129710648430592', '0', '1.10', 'sys/user-manage/userManage', 'user-manage', '用户管理', 'md-person', '2', '', '0', '');
INSERT INTO `t_permission` VALUES ('5129710648430594', '', '2018-06-04 19:02:35', '0', '', '2018-10-13 13:51:36', '', 'role-manage', '5129710648430592', '0', '1.60', 'sys/role-manage/roleManage', 'role-manage', '角色权限管理', 'md-contacts', '2', '', '0', '');
INSERT INTO `t_permission` VALUES ('5129710648430595', '', '2018-06-04 19:02:37', '0', '', '2018-09-23 23:32:02', '', 'menu-manage', '5129710648430592', '0', '1.70', 'sys/menu-manage/menuManage', 'menu-manage', '菜单权限管理', 'md-menu', '2', '', '0', '');
INSERT INTO `t_permission` VALUES ('41375330996326400', '', '2018-08-13 18:23:08', '0', 'admin', '2018-10-20 22:47:07', '', 'simple-table', '41373430515240960', '0', '3.10', 'xboot-vue-template/simple-table/simpleTable', 'simple-table', '简单表格', 'ios-grid-outline', '2', '', '0', '');
INSERT INTO `t_permission` VALUES ('15701400130424832', '', '2018-06-03 22:04:06', '0', '', '2018-09-19 22:16:44', '', '', '5129710648430593', '1', '1.11', '', '/xboot/user/admin/add*', '添加用户', '', '3', 'add', '0', '');
INSERT INTO `t_permission` VALUES ('15701915807518720', '', '2018-06-03 22:06:09', '0', '', '2018-06-06 14:46:51', '', '', '5129710648430593', '1', '1.13', '', '/xboot/user/admin/disable/**', '禁用用户', '', '3', 'disable', '0', null);
INSERT INTO `t_permission` VALUES ('15708892205944832', '', '2018-06-03 22:33:52', '0', '', '2018-06-28 16:44:48', '', '', '5129710648430593', '1', '1.14', '', '/xboot/user/admin/enable/**', '启用用户', '', '3', 'enable', '0', null);
INSERT INTO `t_permission` VALUES ('16392452747300864', '', '2018-06-05 19:50:06', '0', 'admin', '2019-03-01 18:20:30', '', 'access', '', '0', '9.00', 'Main', '/access', '权限按钮测试页', 'md-lock', '1', '', '0', '');
INSERT INTO `t_permission` VALUES ('16392767785668608', '', '2018-06-05 19:51:21', '0', 'admin', '2018-10-23 12:34:38', '', 'access_index', '16392452747300864', '0', '5.10', 'access/access', 'index', '权限按钮测试页', 'md-lock', '2', '', '0', '');
INSERT INTO `t_permission` VALUES ('16438800255291392', '', '2018-06-05 22:54:18', '0', 'admin', '2018-10-23 12:34:51', '', '', '16392767785668608', '1', '5.11', '', 'test-add', '添加按钮测试', '', '3', 'add', '0', '');
INSERT INTO `t_permission` VALUES ('16438962738434048', '', '2018-06-05 22:54:55', '0', 'admin', '2018-10-23 12:35:05', '', '', '16392767785668608', '1', '5.12', '', 'test-edit', '编辑按钮测试', '', '3', 'edit', '0', '');
INSERT INTO `t_permission` VALUES ('16439068543946752', '', '2018-06-05 22:55:20', '0', 'admin', '2018-10-23 12:34:54', '', '', '16392767785668608', '1', '5.13', '', 'test-delete', '删除按钮测试', '', '3', 'delete', '0', '');
INSERT INTO `t_permission` VALUES ('16678126574637056', '', '2018-06-06 14:45:16', '0', '', '2018-09-19 22:16:48', '', '', '5129710648430593', '1', '1.12', '', '/xboot/user/admin/edit*', '编辑用户', '', '3', 'edit', '0', '');
INSERT INTO `t_permission` VALUES ('16678447719911424', '', '2018-06-06 14:46:32', '0', '', '2018-08-10 21:41:16', '', '', '5129710648430593', '1', '1.15', '', '/xboot/user/delByIds/**', '删除用户', '', '3', 'delete', '0', '');
INSERT INTO `t_permission` VALUES ('16687383932047360', '', '2018-06-06 15:22:03', '0', '', '2018-09-19 22:07:34', '', '', '5129710648430594', '1', '1.21', '', '/xboot/role/save*', '添加角色', '', '3', 'add', '0', '');
INSERT INTO `t_permission` VALUES ('16689632049631232', '', '2018-06-06 15:30:59', '0', '', '2018-09-19 22:07:37', '', '', '5129710648430594', '1', '1.22', '', '/xboot/role/edit*', '编辑角色', '', '3', 'edit', '0', '');
INSERT INTO `t_permission` VALUES ('16689745006432256', '', '2018-06-06 15:31:26', '0', '', '2018-08-10 21:41:23', '', '', '5129710648430594', '1', '1.23', '', '/xboot/role/delAllByIds/**', '删除角色', '', '3', 'delete', '0', '');
INSERT INTO `t_permission` VALUES ('16689883993083904', null, '2018-06-06 15:31:59', '0', null, '2018-06-06 15:31:59', null, null, '5129710648430594', '1', '1.24', null, '/xboot/role/editRolePerm**', '分配权限', null, '3', 'editPerm', '0', null);
INSERT INTO `t_permission` VALUES ('16690313745666048', '', '2018-06-06 15:33:41', '0', '', '2018-09-19 22:07:46', '', '', '5129710648430594', '1', '1.25', '', '/xboot/role/setDefault*', '设为默认角色', '', '3', 'setDefault', '0', '');
INSERT INTO `t_permission` VALUES ('16694861252005888', '', '2018-06-06 15:51:46', '0', '', '2018-09-19 22:07:52', '', '', '5129710648430595', '1', '1.31', '', '/xboot/permission/add*', '添加菜单', '', '3', 'add', '0', '');
INSERT INTO `t_permission` VALUES ('16695107491205120', '', '2018-06-06 15:52:44', '0', '', '2018-09-19 22:07:57', '', '', '5129710648430595', '1', '1.32', '', '/xboot/permission/edit*', '编辑菜单', '', '3', 'edit', '0', '');
INSERT INTO `t_permission` VALUES ('16695243126607872', '', '2018-06-06 15:53:17', '0', '', '2018-08-10 21:41:33', '', '', '5129710648430595', '1', '1.33', '', '/xboot/permission/delByIds/**', '删除菜单', '', '3', 'delete', '0', '');
INSERT INTO `t_permission` VALUES ('41371711400054784', '', '2018-08-13 18:08:45', '0', '', '2018-08-14 12:31:15', '', 'actuator', '39915540965232640', '0', '2.30', 'sys/actuator/actuator', 'actuator', 'Actuator监控[付费]', 'logo-angular', '2', '', '0', '');
INSERT INTO `t_permission` VALUES ('41370251991977984', null, '2018-08-13 18:02:57', '0', null, '2018-08-13 18:02:57', null, 'quartz-job', '39915540965232640', '0', '2.10', 'sys/quartz-manage/quartzManage', 'quartz-job', '定时任务', 'md-time', '2', '', '0', null);
INSERT INTO `t_permission` VALUES ('25014528525733888', '', '2018-06-29 14:51:09', '0', '', '2018-10-08 11:13:27', '', '', '5129710648430593', '1', '1.16', '', '无', '上传图片', '', '3', 'upload', '0', '');
INSERT INTO `t_permission` VALUES ('39915540965232640', '', '2018-08-09 17:42:28', '0', '', '2019-03-01 18:20:14', '', 'monitor', '', '0', '3.00', 'Main', '/monitor', '系统监控', 'ios-analytics', '1', '', '0', '');
INSERT INTO `t_permission` VALUES ('39916171171991552', '', '2018-08-09 17:44:57', '0', 'admin', '2019-01-20 00:37:29', '', 'druid', '39915540965232640', '0', '2.40', 'sys/monitor/monitor', 'druid', 'SQL监控', 'md-analytics', '2', '', '0', 'http://127.0.0.1:8888/druid/login.html');
INSERT INTO `t_permission` VALUES ('39918482854252544', '', '2018-08-09 17:54:08', '0', 'admin', '2019-01-20 00:37:41', '', 'swagger', '39915540965232640', '0', '2.50', 'sys/monitor/monitor', 'swagger', '接口文档', 'md-document', '2', '', '0', 'http://127.0.0.1:8888/swagger-ui.html');
INSERT INTO `t_permission` VALUES ('40238597734928384', null, '2018-08-10 15:06:10', '0', null, '2018-08-10 15:06:10', null, 'department-manage', '5129710648430592', '0', '1.20', 'sys/department-manage/departmentManage', 'department-manage', '部门管理', 'md-git-branch', '2', '', '0', null);
INSERT INTO `t_permission` VALUES ('42082442672082944', '', '2018-08-15 17:12:57', '0', 'admin', '2019-02-04 17:03:47', '', 'new-window', '41373430515240960', '0', '3.20', 'xboot-vue-template/new-window/newWindow', 'new-window', '新窗口操作', 'ios-browsers', '2', '', '0', '');
INSERT INTO `t_permission` VALUES ('41373430515240960', '', '2018-08-13 18:15:35', '0', 'admin', '2019-03-01 18:20:17', '', 'vue-template', '', '0', '4.00', 'Main', '/vue-template', '后台Vue模版', 'ios-albums', '1', '', '0', '');
INSERT INTO `t_permission` VALUES ('41363147411427328', '', '2018-08-13 17:34:43', '0', '', '2018-08-20 20:05:21', '', 'log-manage', '39915540965232640', '0', '2.20', 'sys/log-manage/logManage', 'log-manage', '操作日志管理', 'md-list-box', '2', '', '0', '');
INSERT INTO `t_permission` VALUES ('41363537456533504', '', '2018-08-13 17:36:16', '0', '', '2018-08-13 17:56:11', '', '', '41363147411427328', '1', '2.11', '', '/xboot/log/delByIds/**', '删除日志', '', '3', 'delete', '0', '');
INSERT INTO `t_permission` VALUES ('41364927394353152', '', '2018-08-13 17:41:48', '0', '', '2018-09-19 22:08:57', '', '', '41363147411427328', '1', '2.12', '', '/xboot/log/delAll*', '清空日志', '', '3', 'undefined', '0', '');
INSERT INTO `t_permission` VALUES ('41376192166629376', '', '2018-08-13 18:26:33', '0', 'admin', '2018-10-20 22:47:26', '', 'search-table', '41373430515240960', '0', '3.40', 'xboot-vue-template/search-table/searchTable', 'search-table', '搜索表格[付费]', 'md-grid', '2', '', '0', '');
INSERT INTO `t_permission` VALUES ('41377034236071936', '', '2018-08-13 18:29:54', '0', 'admin', '2018-10-20 22:47:33', '', 'complex-table', '41373430515240960', '0', '3.50', 'xboot-vue-template/complex-table/complexTable', 'complex-table', '复杂表格[付费]', 'ios-grid', '2', '', '0', '');
INSERT INTO `t_permission` VALUES ('41378916912336896', '', '2018-08-13 18:37:23', '0', 'admin', '2019-02-04 17:04:04', '', 'tree', '41373430515240960', '0', '3.21', 'xboot-vue-template/tree/tree', 'tree', '树形结构', 'ios-git-network', '2', '', '0', '');
INSERT INTO `t_permission` VALUES ('41469219249852416', null, '2018-08-14 00:36:13', '0', null, '2018-08-14 00:36:13', null, '', '41371711400054784', '1', '2.31', '', '无', '查看数据', '', '3', 'view', '0', null);
INSERT INTO `t_permission` VALUES ('42087054753927168', '', '2018-08-15 17:31:16', '0', 'admin', '2018-10-22 21:33:53', '', 'html-edit', '41373430515240960', '0', '3.92', 'xboot-vue-template/html-edit/htmlEdit', 'html-edit', '富文本编辑[付费]', 'ios-create', '2', '', '0', '');
INSERT INTO `t_permission` VALUES ('43117268627886080', '', '2018-08-18 13:44:58', '0', '', '2018-08-18 20:55:04', '', 'message-manage', '5129710648430592', '0', '1.30', 'sys/message-manage/messageManage', 'message-manage', '消息管理[付费]', 'md-mail', '2', '', '0', '');
INSERT INTO `t_permission` VALUES ('44986029924421632', '', '2018-08-23 17:30:46', '0', '', '2018-09-23 23:26:53', '', 'social-manage', '5129710648430592', '0', '1.50', 'sys/social-manage/socialManage', 'social-manage', '社交账号绑定[付费]', 'md-share', '2', '', '0', '');
INSERT INTO `t_permission` VALUES ('45069342940860416', '', '2018-08-23 23:01:49', '0', '', '2018-08-24 10:01:09', '', '', '44986029924421632', '1', '1.42', '', '无', '查看社交账号数据', '', '3', 'view', '0', '');
INSERT INTO `t_permission` VALUES ('45235228800716800', '', '2018-08-24 10:01:00', '0', '', '2018-09-19 22:07:23', '', '', '44986029924421632', '1', '1.41', '', '/xboot/relate/delByIds*', '删除解绑', '', '3', 'delete', '0', '');
INSERT INTO `t_permission` VALUES ('45235621697949696', '', '2018-08-24 10:02:33', '0', '', '2018-09-19 22:06:57', '', '', '40238597734928384', '1', '1.21', '', '/xboot/department/add*', '添加部门', '', '3', 'add', '0', '');
INSERT INTO `t_permission` VALUES ('45235787867885568', '', '2018-08-24 10:03:13', '0', '', '2018-09-19 22:07:02', '', '', '40238597734928384', '1', '1.22', '', '/xboot/department/edit*', '编辑部门', '', '3', 'edit', '0', '');
INSERT INTO `t_permission` VALUES ('45235939278065664', null, '2018-08-24 10:03:49', '0', null, '2018-08-24 10:03:49', null, '', '40238597734928384', '1', '1.23', '', '/xboot/department/delByIds/*', '删除部门', '', '3', 'delete', '0', null);
INSERT INTO `t_permission` VALUES ('45236734832676864', '', '2018-08-24 10:06:59', '0', '', '2018-09-19 22:07:07', '', '', '43117268627886080', '1', '1.31', '', '/xboot/message/add*', '添加消息', '', '3', 'add', '0', '');
INSERT INTO `t_permission` VALUES ('45237010692050944', '', '2018-08-24 10:08:04', '0', '', '2018-09-19 22:07:12', '', '', '43117268627886080', '1', '1.32', '', '/xboot/message/edit*', '编辑消息', '', '3', 'edit', '0', '');
INSERT INTO `t_permission` VALUES ('45237170029465600', null, '2018-08-24 10:08:42', '0', null, '2018-08-24 10:08:42', null, '', '43117268627886080', '1', '1.33', '', '/xboot/message/delByIds/*', '删除消息', '', '3', 'delete', '0', null);
INSERT INTO `t_permission` VALUES ('45264987354042368', '', '2018-08-24 11:59:14', '0', '', '2018-09-19 22:08:11', '', '', '41370251991977984', '1', '2.11', '', '/xboot/quartzJob/add*', '添加定时任务', '', '3', 'add', '0', '');
INSERT INTO `t_permission` VALUES ('45265487029866496', '', '2018-08-24 12:01:14', '0', '', '2018-09-19 22:08:17', '', '', '41370251991977984', '1', '2.12', '', '/xboot/quartzJob/edit*', '编辑定时任务', '', '3', 'edit', '0', '');
INSERT INTO `t_permission` VALUES ('45265762415284224', '', '2018-08-24 12:02:19', '0', '', '2018-09-19 22:08:24', '', '', '41370251991977984', '1', '2.13', '', '/xboot/quartzJob/pause*', '暂停定时任务', '', '3', 'disable', '0', '');
INSERT INTO `t_permission` VALUES ('45265886315024384', '', '2018-08-24 12:02:49', '0', '', '2018-09-19 22:09:13', '', '', '41370251991977984', '1', '2.14', '', '/xboot/quartzJob/resume*', '恢复定时任务', '', '3', 'enable', '0', '');
INSERT INTO `t_permission` VALUES ('45266070000373760', null, '2018-08-24 12:03:33', '0', null, '2018-08-24 12:03:33', null, '', '41370251991977984', '1', '2.15', '', '/xboot/quartzJob/delByIds/*', '删除定时任务', '', '3', 'delete', '0', null);
INSERT INTO `t_permission` VALUES ('56309618086776832', '', '2018-09-23 23:26:40', '0', 'admin', '2018-11-15 15:17:43', '', 'oss-manage', '5129710648430592', '0', '1.40', 'sys/oss-manage/ossManage', 'oss-manage', '文件对象存储[付费]', 'ios-folder', '2', '', '0', '');
INSERT INTO `t_permission` VALUES ('56898976661639168', '', '2018-09-25 14:28:34', '0', '', '2018-09-25 15:12:46', '', '', '5129710648430593', '1', '1.17', '', '/xboot/user/importData*', '导入用户', '', '3', 'input', '0', '');
INSERT INTO `t_permission` VALUES ('56911328312299520', '', '2018-09-25 15:17:39', '0', 'admin', '2018-10-20 22:47:36', '', 'excel', '41373430515240960', '0', '3.60', 'xboot-vue-template/excel/excel', 'excel', 'Excel导入导出[付费]', 'md-exit', '2', '', '0', '');
INSERT INTO `t_permission` VALUES ('57009544286441472', null, '2018-09-25 21:47:55', '0', null, '2018-09-25 21:47:55', null, '', '43117268627886080', '1', '1.40', '', '/xboot/messageSend/save*', '添加已发送消息', '', '3', 'add', '0', null);
INSERT INTO `t_permission` VALUES ('57009744761589760', null, '2018-09-25 21:48:43', '0', null, '2018-09-25 21:48:43', null, '', '43117268627886080', '1', '1.50', '', '/xboot/messageSend/update*', '编辑已发送消息', '', '3', 'edit', '0', null);
INSERT INTO `t_permission` VALUES ('57009981228060672', null, '2018-09-25 21:49:39', '0', null, '2018-09-25 21:49:39', null, '', '43117268627886080', '1', '1.60', '', '/xboot/messageSend/delByIds/*', '删除已发送消息', '', '3', 'delete', '0', null);
INSERT INTO `t_permission` VALUES ('57212882168844288', '', '2018-09-26 11:15:55', '0', '', '2018-10-08 11:10:05', '', '', '56309618086776832', '1', '1.41', '', '无', '上传文件', '', '3', 'upload', '0', '');
INSERT INTO `t_permission` VALUES ('58480609315524608', '', '2018-09-29 23:13:24', '0', 'admin', '2018-11-14 13:24:26', '', 'setting', '5129710648430592', '0', '1.90', 'sys/setting-manage/settingManage', 'setting', '系统配置[付费]', 'ios-settings-outline', '2', '', '0', '');
INSERT INTO `t_permission` VALUES ('61394706252173312', null, '2018-10-08 00:12:59', '0', null, '2018-10-08 00:12:59', null, '', '58480609315524608', '1', '1.81', '', '/xboot/setting/seeSecret/**', '查看私密配置', '', '3', 'view', '0', null);
INSERT INTO `t_permission` VALUES ('61417744146370560', '', '2018-10-08 01:44:32', '0', '', '2018-10-08 01:50:03', '', '', '58480609315524608', '1', '1.82', '', '/xboot/setting/*/set*', '编辑配置', '', '3', 'edit', '0', '');
INSERT INTO `t_permission` VALUES ('61560480518377472', null, '2018-10-08 11:11:43', '0', null, '2018-10-08 11:11:43', null, '', '56309618086776832', '1', '1.44', '', '/xboot/file/delete/*', '删除文件', '', '3', 'delete', '0', null);
INSERT INTO `t_permission` VALUES ('61560275261722624', null, '2018-10-08 11:10:54', '0', null, '2018-10-08 11:10:54', null, '', '56309618086776832', '1', '1.43', '', '/xboot/file/copy*', '复制文件', '', '3', 'edit', '0', null);
INSERT INTO `t_permission` VALUES ('61560041605435392', null, '2018-10-08 11:09:58', '0', null, '2018-10-08 11:09:58', null, '', '56309618086776832', '1', '1.42', '', '/xboot/file/rename*', '重命名文件', '', '3', 'edit', '0', null);
INSERT INTO `t_permission` VALUES ('63482475359244288', '', '2018-10-13 18:29:02', '0', 'admin', '2018-10-20 22:47:45', '', 'custom-tree', '41373430515240960', '0', '3.80', 'xboot-vue-template/custom-tree/customTree', 'custom-tree', '自定义树[付费]', 'md-git-network', '2', '', '0', '');
INSERT INTO `t_permission` VALUES ('63741744973352960', '', '2018-10-14 11:39:17', '0', 'admin', '2019-02-04 17:03:07', '', 'render', '41373430515240960', '0', '3.30', 'xboot-vue-template/render/render', 'render', 'Render函数示例[付费]', 'md-aperture', '2', '', '0', '');
INSERT INTO `t_permission` VALUES ('64290663792906240', '', '2018-10-16 00:00:29', '0', 'admin', '2018-10-20 22:47:49', '', 'tree&table', '41373430515240960', '0', '3.90', 'xboot-vue-template/tree&table/tree&table', 'tree&table', '树+表格[付费]', 'md-list', '2', '', '0', '');
INSERT INTO `t_permission` VALUES ('66790433014943744', 'admin', '2018-10-22 21:33:42', '0', 'admin', '2018-10-22 21:37:12', '', 'card-list', '41373430515240960', '0', '3.91', 'xboot-vue-template/card-list/cardList', 'card-list', '卡片列表[付费]', 'md-card', '2', '', '0', '');
INSERT INTO `t_permission` VALUES ('67027909637836800', 'admin', '2018-10-23 13:17:19', '0', 'admin', '2018-10-23 14:57:46', '', 'banner', '67027338952445952', '0', '4.10', 'product-template/banner/Banner', 'banner', '轮播组件[付费]', 'md-book', '2', '', '0', '');
INSERT INTO `t_permission` VALUES ('67027338952445952', 'admin', '2018-10-23 13:15:03', '0', 'admin', '2018-10-23 14:57:38', '', 'product-template', '', '0', '4.00', 'Main', '/product-template', '前台产品级组件', 'md-ribbon', '1', '', '0', '');
INSERT INTO `t_permission` VALUES ('67042515441684480', 'admin', '2018-10-23 14:15:22', '0', 'admin', '2018-10-23 14:57:51', '', 'product', '67027338952445952', '0', '4.20', 'product-template/product/Product', 'product', '产品组件[付费]', 'md-pricetags', '2', '', '0', '');
INSERT INTO `t_permission` VALUES ('67082402312228864', 'admin', '2018-10-23 16:53:53', '0', 'admin', '2018-10-23 16:53:53', null, 'category', '67027338952445952', '0', '4.30', 'product-template/category/Category', 'category', '分类栏组件[付费]', 'md-apps', '2', '', '0', null);
INSERT INTO `t_permission` VALUES ('75002207560273920', 'admin', '2018-11-14 13:24:21', '0', 'admin', '2018-11-20 20:06:22', '', 'dict', '5129710648430592', '0', '1.80', 'sys/dict-manage/dictManage', 'dict', '数据字典管理', 'md-bookmarks', '2', '', '0', '');
INSERT INTO `t_permission` VALUES ('76606430504816640', 'admin', '2018-11-18 23:38:57', '0', 'admin', '2019-03-01 18:20:10', '', 'activiti', '', '0', '2.00', 'Main', '/activiti', '工作流程', 'md-git-compare', '1', '', '0', '');
INSERT INTO `t_permission` VALUES ('76607201262702592', 'admin', '2018-11-18 23:42:01', '0', 'admin', '2018-11-20 19:41:58', '', 'model-manage', '76606430504816640', '0', '1.00', 'activiti/model-manage/modelManage', 'model-manage', '模型管理[付费]', 'md-cube', '2', '', '0', '');
INSERT INTO `t_permission` VALUES ('76914082455752704', 'admin', '2018-11-19 20:01:28', '0', 'admin', '2018-11-20 19:41:50', '', 'process-manage', '76606430504816640', '0', '0.90', 'activiti/process-manage/processManage', 'process-manage', '流程管理[付费]', 'md-calendar', '2', '', '0', '');
INSERT INTO `t_permission` VALUES ('76215889006956544', 'admin', '2018-11-17 21:47:05', '0', 'admin', '2018-11-17 21:47:53', '', '', '75002207560273920', '1', '1.81', '', '/xboot/dict/add*', '添加字典', '', '3', 'add', '0', '');
INSERT INTO `t_permission` VALUES ('76216071333351424', 'admin', '2018-11-17 21:47:48', '0', 'admin', '2018-11-17 21:47:48', null, '', '75002207560273920', '1', '1.82', '', '/xboot/dict/edit*', '编辑字典', '', '3', 'edit', '0', null);
INSERT INTO `t_permission` VALUES ('76216264070008832', 'admin', '2018-11-17 21:48:34', '0', 'admin', '2018-11-17 21:48:34', null, '', '75002207560273920', '1', '1.83', '', '/xboot/dict/delByIds/**', '删除字典', '', '3', 'delete', '0', null);
INSERT INTO `t_permission` VALUES ('76216459709124608', 'admin', '2018-11-17 21:49:21', '0', 'admin', '2018-11-17 21:49:21', null, '', '75002207560273920', '1', '1.84', '', '/xboot/dictData/add*', '添加字典数据', '', '3', 'add', '0', null);
INSERT INTO `t_permission` VALUES ('76216594207870976', 'admin', '2018-11-17 21:49:53', '0', 'admin', '2018-11-17 21:49:53', null, '', '75002207560273920', '1', '1.85', '', '/xboot/dictData/edit*', '编辑字典数据', '', '3', 'edit', '0', null);
INSERT INTO `t_permission` VALUES ('76216702639017984', 'admin', '2018-11-17 21:50:18', '0', 'admin', '2018-11-17 21:50:18', null, '', '75002207560273920', '1', '1.86', '', '/xboot/dictData/delByIds/**', '删除字典数据', '', '3', 'delete', '0', null);
INSERT INTO `t_permission` VALUES ('80539147005071360', 'admin', '2018-11-29 20:06:10', '0', 'admin', '2018-12-04 14:14:41', '', 'category-manage', '76606430504816640', '0', '2.00', 'activiti/category-manage/categoryManage', 'category-manage', '流程分类管理[付费]', 'md-bookmark', '2', '', '0', '');
INSERT INTO `t_permission` VALUES ('81319435670917120', 'admin', '2018-12-01 23:46:45', '0', 'admin', '2018-12-02 15:37:03', '', 'process-ins-manage', '76606430504816640', '0', '0.70', 'activiti/process-ins-manage/processInsManage', 'process-ins-manage', '运行中的流程[付费]', 'md-fastforward', '2', '', '0', '');
INSERT INTO `t_permission` VALUES ('81558529864896512', 'admin', '2018-12-02 15:36:50', '0', 'admin', '2018-12-08 14:50:38', '', 'apply-manage', '76606430504816640', '0', '0.00', 'activiti/apply-manage/applyManage', 'apply-manage', '我的申请[付费]', 'md-clipboard', '2', '', '0', '');
INSERT INTO `t_permission` VALUES ('81716172680073216', 'admin', '2018-12-03 02:03:15', '0', 'admin', '2018-12-03 02:03:15', null, 'todo-manage', '76606430504816640', '0', '0.10', 'activiti/todo-manage/todoManage', 'todo-manage', '我的待办[付费]', 'ios-pricetag', '2', '', '0', null);
INSERT INTO `t_permission` VALUES ('82269650301227008', 'admin', '2018-12-04 14:42:34', '0', 'admin', '2018-12-04 14:42:34', null, 'done-manage', '76606430504816640', '0', '0.20', 'activiti/done-manage/doneManage', 'done-manage', '我的已办[付费]', 'ios-pricetag-outline', '2', '', '0', null);
INSERT INTO `t_permission` VALUES ('117806106536841216', 'admin', '2019-03-14 15:49:03', '0', 'admin', '2019-03-14 15:49:03', '', 'process-finish-manage', '76606430504816640', '0', '0.80', 'activiti/process-finish-manage/processFinishManage', 'process-finish-manage', '结束的流程[付费]', 'md-power', '2', '', '0', '');
INSERT INTO `t_permission` VALUES ('84082369492946944', 'admin', '2018-12-09 14:45:40', '0', 'admin', '2018-12-09 14:46:59', '', '', '81558529864896512', '1', '0.00', '', '/xboot/leave/add*', '添加请假申请', '', '3', 'add', '0', '');
INSERT INTO `t_permission` VALUES ('84082920431554560', 'admin', '2018-12-09 14:47:51', '0', 'admin', '2018-12-09 14:47:51', null, '', '81558529864896512', '1', '1.00', '', '/xboot/actBusiness/delByIds/**', '删除草稿申请', '', '3', 'delete', '0', null);
INSERT INTO `t_permission` VALUES ('84083562503999488', 'admin', '2018-12-09 14:50:25', '0', 'admin', '2018-12-09 14:50:25', null, '', '81716172680073216', '1', '0.00', '', '/xboot/actTask/pass**', '审批通过', '', '3', 'enable', '0', null);
INSERT INTO `t_permission` VALUES ('84083641302388736', 'admin', '2018-12-09 14:50:43', '0', 'admin', '2018-12-09 14:50:43', null, '', '81716172680073216', '1', '1.00', '', '/xboot/actTask/back**', '审批驳回', '', '3', 'disable', '0', null);
INSERT INTO `t_permission` VALUES ('84084404707659776', 'admin', '2018-12-09 14:53:45', '0', 'admin', '2018-12-09 14:53:45', null, '', '81716172680073216', '1', '3.00', '', '/xboot/actTask/delegate**', '委托代办', '', '3', 'other', '0', null);
INSERT INTO `t_permission` VALUES ('84084724590448640', 'admin', '2018-12-09 14:55:02', '0', 'admin', '2018-12-09 14:55:02', null, '', '82269650301227008', '1', '0.00', '', '/xboot/actTask/deleteHistoric/**', '删除已办任务', '', '3', 'delete', '0', null);
INSERT INTO `t_permission` VALUES ('84084965817454592', 'admin', '2018-12-09 14:55:59', '0', 'admin', '2018-12-09 14:55:59', null, '', '81319435670917120', '1', '0.00', '', '/xboot/actProcess/delInsByIds/**', '删除运行流程', '', '3', 'delete', '0', null);
INSERT INTO `t_permission` VALUES ('84085542324539392', 'admin', '2018-12-09 14:58:17', '0', 'admin', '2018-12-09 14:58:17', null, '', '76914082455752704', '1', '0.00', '', '/xboot/actProcess/updateInfo/**', '编辑流程信息', '', '3', 'edit', '0', null);
INSERT INTO `t_permission` VALUES ('84085810797744128', 'admin', '2018-12-09 14:59:21', '0', 'admin', '2018-12-09 14:59:21', null, '', '76914082455752704', '1', '1.00', '', '/xboot/actProcess/editNodeUser**', '流程节点设置', '', '3', 'edit', '0', null);
INSERT INTO `t_permission` VALUES ('84085980943880192', 'admin', '2018-12-09 15:00:01', '0', 'admin', '2018-12-09 15:00:01', null, '', '76914082455752704', '1', '2.00', '', '/xboot/actProcess/convertToModel/**', '流程转模型', '', '3', 'other', '0', null);
INSERT INTO `t_permission` VALUES ('84086163001839616', 'admin', '2018-12-09 15:00:45', '0', 'admin', '2018-12-09 15:01:37', '', '', '76914082455752704', '1', '3.00', '', '/xboot/actProcess/delByIds/**', '删除流程定义', '', '3', 'delete', '0', '');
INSERT INTO `t_permission` VALUES ('84086362248056832', 'admin', '2018-12-09 15:01:32', '0', 'admin', '2018-12-09 15:01:32', null, '', '76914082455752704', '1', '4.00', '', '/xboot/actModel/deployByFile**', '文件部署流程', '', '3', 'other', '0', null);
INSERT INTO `t_permission` VALUES ('84086882907983872', 'admin', '2018-12-09 15:03:36', '0', 'admin', '2018-12-09 15:03:36', null, '', '76607201262702592', '1', '0.00', '', '/xboot/actModel/add**', '添加模型', '', '3', 'add', '0', null);
INSERT INTO `t_permission` VALUES ('84087009940869120', 'admin', '2018-12-09 15:04:06', '0', 'admin', '2018-12-09 15:04:06', null, '', '76607201262702592', '1', '1.00', '', '/xboot/actModel/delByIds/**', '删除模型', '', '3', 'delete', '0', null);
INSERT INTO `t_permission` VALUES ('84087154040377344', 'admin', '2018-12-09 15:04:41', '0', 'admin', '2018-12-09 15:04:41', null, '', '76607201262702592', '1', '2.00', '', '/xboot/actModel/deploy/**', '部署模型', '', '3', 'other', '0', null);
INSERT INTO `t_permission` VALUES ('84087344352727040', 'admin', '2018-12-09 15:05:26', '0', 'admin', '2018-12-09 15:05:33', '', '', '80539147005071360', '1', '0.00', '', '/xboot/actCategory/add**', '添加流程分类', '', '3', 'add', '0', '');
INSERT INTO `t_permission` VALUES ('84087480852156416', 'admin', '2018-12-09 15:05:59', '0', 'admin', '2018-12-09 15:05:59', null, '', '80539147005071360', '1', '1.00', '', '/xboot/actCategory/edit**', '编辑流程分类', '', '3', 'edit', '0', null);
INSERT INTO `t_permission` VALUES ('84087593041399808', 'admin', '2018-12-09 15:06:25', '0', 'admin', '2018-12-09 15:06:25', null, '', '80539147005071360', '1', '2.00', '', '/xboot/actCategory/delByIds/**', '删除流程分类', '', '3', 'delete', '0', null);
INSERT INTO `t_permission` VALUES ('102235632889237504', 'admin', '2019-01-28 17:00:15', '0', 'admin', '2019-03-01 18:20:21', '', 'vue-generator', '', '0', '5.00', 'Main', '/vue-generator', 'Vue代码生成', 'md-send', '1', '', '0', '');
INSERT INTO `t_permission` VALUES ('102237605176807424', 'admin', '2019-01-28 17:08:06', '0', 'admin', '2019-02-01 20:41:31', '', 'table-generator', '102235632889237504', '0', '0.00', 'xboot-vue-generator/tableGenerator', 'table', '增删改表格生成[付费]', 'md-grid', '2', '', '0', '');
INSERT INTO `t_permission` VALUES ('102240052523831296', 'admin', '2019-01-28 17:17:49', '0', 'admin', '2019-02-01 20:41:38', '', 'tree-generator', '102235632889237504', '0', '1.00', 'xboot-vue-generator/treeGenerator', 'tree', '树形结构生成[付费]', 'md-git-branch', '2', '', '0', '');
INSERT INTO `t_permission` VALUES ('103658022701633536', 'admin', '2019-02-01 15:12:20', '0', 'admin', '2019-02-01 18:38:29', '', 'test', '102235632889237504', '0', '3.00', 'xboot-vue-generator/test', 'test', '代码生成测试页', 'ios-bug', '2', '', '0', '');
INSERT INTO `t_permission` VALUES ('104451415484665856', 'admin', '2019-02-03 19:44:59', '0', 'admin', '2019-03-01 18:20:35', '', 'flutter', '', '0', '10.00', 'Main', '/flutter', 'XBoot Flutter App', 'md-phone-portrait', '1', '', '0', '');
INSERT INTO `t_permission` VALUES ('104451721685635072', 'admin', '2019-02-03 19:46:12', '0', 'admin', '2019-02-03 19:47:04', '', 'flutter', '104451415484665856', '0', '0.00', 'flutter/flutter', 'flutter', 'XBoot Flutter App', 'md-phone-portrait', '2', '', '0', '');
INSERT INTO `t_permission` VALUES ('113603617897844736', 'admin', '2019-03-01 01:52:34', '0', 'admin', '2019-03-01 02:03:15', '', 'library', '113603512293658624', '0', '0.00', 'xboot-library/xboot-library', 'library', '第三方依赖工具/组件', 'ios-link', '2', '', '0', '');
INSERT INTO `t_permission` VALUES ('113603512293658624', 'admin', '2019-03-01 01:52:09', '0', 'admin', '2019-03-01 18:20:05', '', 'library', '', '0', '7.00', 'Main', '/library', '第三方依赖工具/组件', 'ios-link', '1', '', '0', '');
INSERT INTO `t_permission` VALUES ('113602342657462272', 'admin', '2019-03-01 01:47:30', '0', 'admin', '2019-03-01 02:03:26', '', 'components', '113602149589454848', '0', '0.00', 'xboot-components/xboot-components', 'components', 'XBoot业务组件', 'md-cube', '2', '', '0', '');
INSERT INTO `t_permission` VALUES ('113602149589454848', 'admin', '2019-03-01 01:46:44', '0', 'admin', '2019-03-01 18:20:02', '', 'components', '', '0', '6.00', 'Main', '/components', 'XBoot业务组件', 'md-cube', '1', '', '0', '');

-- ----------------------------
-- Table structure for t_quartz_job
-- ----------------------------
DROP TABLE IF EXISTS `t_quartz_job`;
CREATE TABLE `t_quartz_job` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `cron_expression` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `job_class_name` varchar(255) DEFAULT NULL,
  `parameter` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_quartz_job
-- ----------------------------
INSERT INTO `t_quartz_job` VALUES ('41065738420621312', '', '2018-08-12 21:52:56', '0', '', '2018-09-23 23:19:39', '0/1 * * * * ? ', '带参测试 后台将每隔1秒执行输出日志', 'cn.exrick.xboot.quartz.jobs.SampleParamJob', 'World', '-1');
INSERT INTO `t_quartz_job` VALUES ('41060689401352192', '', '2018-08-12 20:32:52', '0', 'admin', '2018-11-20 09:51:38', '0/1 * * * * ? ', '无参测试 后台将每隔1秒执行输出日志', 'cn.exrick.xboot.quartz.jobs.SampleJob', '', '-1');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `default_role` bit(1) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `data_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('496138616573952', '', '2018-04-22 23:03:49', 'admin', '2018-11-15 23:02:59', 'ROLE_ADMIN', '0', null, '超级管理员 拥有所有权限', '0');
INSERT INTO `t_role` VALUES ('496138616573953', '', '2018-05-02 21:40:03', 'admin', '2018-11-01 22:59:48', 'ROLE_USER', '0', '', '普通注册用户 路过看看', '0');
INSERT INTO `t_role` VALUES ('16457350655250432', '', '2018-06-06 00:08:00', 'admin', '2018-11-02 20:42:24', 'ROLE_TEST', '0', null, '测试权限按钮显示', '1');

-- ----------------------------
-- Table structure for t_role_department
-- ----------------------------
DROP TABLE IF EXISTS `t_role_department`;
CREATE TABLE `t_role_department` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `department_id` varchar(255) DEFAULT NULL,
  `role_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_department
-- ----------------------------
INSERT INTO `t_role_department` VALUES ('70763874256687105', 'admin', '2018-11-02 20:42:43', '0', 'admin', '2018-11-02 20:42:43', '40322777781112832', '16457350655250432');
INSERT INTO `t_role_department` VALUES ('70763874265075712', 'admin', '2018-11-02 20:42:43', '0', 'admin', '2018-11-02 20:42:43', '40322811096469504', '16457350655250432');
INSERT INTO `t_role_department` VALUES ('70763874277658624', 'admin', '2018-11-02 20:42:43', '0', 'admin', '2018-11-02 20:42:43', '40322852833988608', '16457350655250432');

-- ----------------------------
-- Table structure for t_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_role_permission`;
CREATE TABLE `t_role_permission` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `permission_id` varchar(255) DEFAULT NULL,
  `role_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_permission
-- ----------------------------
INSERT INTO `t_role_permission` VALUES ('75002588625375232', 'admin', '2018-11-14 13:25:52', '0', 'admin', '2018-11-14 13:25:52', '57009744761589760', '16457350655250432');
INSERT INTO `t_role_permission` VALUES ('75002588633763840', 'admin', '2018-11-14 13:25:52', '0', 'admin', '2018-11-14 13:25:52', '16392452747300864', '16457350655250432');
INSERT INTO `t_role_permission` VALUES ('75002588637958144', 'admin', '2018-11-14 13:25:52', '0', 'admin', '2018-11-14 13:25:52', '16392767785668608', '16457350655250432');
INSERT INTO `t_role_permission` VALUES ('75002588650541056', 'admin', '2018-11-14 13:25:52', '0', 'admin', '2018-11-14 13:25:52', '16439068543946752', '16457350655250432');
INSERT INTO `t_role_permission` VALUES ('75002588612792320', 'admin', '2018-11-14 13:25:52', '0', 'admin', '2018-11-14 13:25:52', '40238597734928384', '16457350655250432');
INSERT INTO `t_role_permission` VALUES ('75002588604403712', 'admin', '2018-11-14 13:25:52', '0', 'admin', '2018-11-14 13:25:52', '5129710648430593', '16457350655250432');
INSERT INTO `t_role_permission` VALUES ('75002588591820806', 'admin', '2018-11-14 13:25:52', '0', 'admin', '2018-11-14 13:25:52', '5129710648430592', '16457350655250432');
INSERT INTO `t_role_permission` VALUES ('118525260420091904', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '16439068543946752', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260411703296', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '16438962738434048', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260407508992', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '16438800255291392', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260399120384', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '16392767785668608', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260386537472', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '16392452747300864', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260378148864', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '113603617897844736', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260369760256', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '113603512293658624', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260361371648', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '113602342657462272', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260352983040', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '113602149589454848', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260348788736', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '102240052523831296', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260340400128', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '102237605176807424', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260332011520', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '102235632889237504', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260323622912', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '67082402312228864', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260315234304', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '67042515441684480', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260306845696', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '67027909637836800', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260298457088', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '67027338952445952', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260290068480', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '42087054753927168', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260281679872', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '66790433014943744', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260273291264', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '64290663792906240', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260264902656', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '63482475359244288', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260256514048', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '56911328312299520', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260248125440', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '41377034236071936', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260239736832', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '41376192166629376', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260231348224', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '63741744973352960', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260222959616', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '41378916912336896', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260214571008', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '42082442672082944', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260206182400', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '41375330996326400', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260201988096', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '41373430515240960', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260197793792', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '39918482854252544', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260189405184', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '39916171171991552', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260181016576', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '41371711400054784', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260176822272', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '41363147411427328', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260168433664', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '41370251991977984', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260160045056', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '39915540965232640', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260151656448', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '80539147005071360', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260143267840', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '76607201262702592', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260130684928', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '76914082455752704', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260122296320', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '117806106536841216', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260113907712', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '81319435670917120', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260105519104', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '82269650301227008', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260097130496', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '81716172680073216', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260088741888', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '81558529864896512', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260080353280', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '76606430504816640', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260076158976', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '58480609315524608', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260067770368', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '75002207560273920', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525220989440000', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '81716172680073216', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220981051392', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '84082920431554560', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220972662784', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '84082369492946944', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220964274176', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '81558529864896512', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220955885568', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '76606430504816640', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220947496960', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '61417744146370560', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220939108352', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '61394706252173312', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220926525440', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '58480609315524608', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220918136832', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '76216702639017984', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220913942528', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '76216594207870976', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220905553920', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '76216459709124608', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220897165312', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '76216264070008832', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220888776704', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '76216071333351424', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220876193792', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '76215889006956544', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220867805184', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '75002207560273920', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220859416576', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '16695243126607872', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220851027968', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '16695107491205120', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220842639360', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '16694861252005888', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220838445056', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '5129710648430595', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220830056448', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '16690313745666048', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220821667840', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '16689883993083904', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220813279232', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '16689745006432256', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220804890624', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '16689632049631232', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220796502016', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '16687383932047360', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220788113408', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '5129710648430594', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220779724800', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '45069342940860416', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220771336192', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '45235228800716800', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220762947584', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '44986029924421632', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220750364672', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '61560480518377472', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220741976064', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '61560275261722624', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220733587456', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '61560041605435392', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220725198848', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '57212882168844288', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220712615936', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '56309618086776832', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220704227328', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '57009981228060672', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220695838720', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '57009744761589760', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220687450112', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '57009544286441472', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220674867200', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '45237170029465600', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220662284288', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '45237010692050944', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220649701376', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '45236734832676864', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220641312768', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '43117268627886080', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220628729856', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '45235939278065664', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220620341248', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '45235787867885568', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220607758336', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '45235621697949696', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220599369728', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '40238597734928384', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525260059381760', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '5129710648430595', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260050993152', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '5129710648430594', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260042604544', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '44986029924421632', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260030021632', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '56309618086776832', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260021633024', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '57009744761589760', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260009050112', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '43117268627886080', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525220586786816', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '56898976661639168', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220578398208', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '25014528525733888', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220565815296', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '16678447719911424', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220553232384', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '15708892205944832', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220469346304', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '5129710648430592', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220507095040', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '5129710648430593', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220519677952', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '15701400130424832', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220528066560', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '16678126574637056', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220540649472', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '15701915807518720', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221450813440', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '102240052523831296', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221442424832', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '102237605176807424', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221434036224', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '102235632889237504', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221425647616', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '67082402312228864', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221417259008', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '67042515441684480', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221408870400', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '67027909637836800', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221400481792', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '67027338952445952', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221396287488', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '42087054753927168', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221387898880', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '66790433014943744', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221375315968', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '64290663792906240', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221366927360', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '63482475359244288', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221354344448', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '56911328312299520', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221345955840', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '41377034236071936', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221341761536', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '41376192166629376', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221333372928', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '63741744973352960', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221324984320', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '41378916912336896', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221316595712', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '42082442672082944', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221308207104', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '41375330996326400', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221299818496', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '41373430515240960', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221291429888', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '39918482854252544', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221283041280', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '39916171171991552', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221274652672', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '41469219249852416', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221266264064', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '41371711400054784', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221257875456', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '41364927394353152', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221249486848', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '41363537456533504', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221241098240', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '41363147411427328', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221232709632', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '45266070000373760', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221224321024', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '45265886315024384', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221211738112', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '45265762415284224', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221203349504', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '45265487029866496', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221194960896', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '45264987354042368', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221190766592', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '41370251991977984', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221182377984', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '39915540965232640', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221173989376', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '84087593041399808', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221165600768', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '84087480852156416', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221153017856', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '84087344352727040', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221144629248', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '80539147005071360', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221136240640', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '84087154040377344', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221127852032', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '84087009940869120', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221123657728', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '84086882907983872', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221115269120', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '76607201262702592', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221102686208', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '84086362248056832', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221094297600', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '84086163001839616', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221085908992', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '84085980943880192', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221077520384', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '84085810797744128', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221064937472', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '84085542324539392', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221060743168', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '76914082455752704', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221052354560', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '117806106536841216', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221043965952', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '84084965817454592', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221035577344', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '81319435670917120', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221027188736', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '84084724590448640', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221018800128', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '82269650301227008', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221014605824', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '84084404707659776', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221002022912', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '84083641302388736', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220997828608', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '84083562503999488', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525260000661504', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '40238597734928384', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525259992272896', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '5129710648430593', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525259979689984', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '5129710648430592', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525221459202048', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '103658022701633536', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221467590656', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '113602149589454848', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221475979264', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '113602342657462272', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221484367872', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '113603512293658624', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221488562176', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '113603617897844736', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221501145088', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '16392452747300864', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221509533696', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '16392767785668608', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221517922304', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '16438800255291392', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221526310912', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '16438962738434048', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221534699520', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '16439068543946752', '496138616573952');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `avatar` varchar(1000) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `nick_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `department_id` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `pass_strength` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('682265633886209', '', '2018-04-30 23:28:42', 'admin', '2018-11-20 09:55:49', '', 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', '', '1012@qq.com', '18782059033', '', '$2a$10$PS04ecXfknNd3V8d.ymLTObQciapMU4xU8.GADBZZsuTZr7ymnagy', '0', '-1', '0', 'Exrick', '0', '40322777781112832', '', '弱');
INSERT INTO `t_user` VALUES ('16739222421508096', '', '2018-06-06 18:48:02', '', '2018-10-08 00:04:32', '', 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', '', '1012139570@qq.com', '18782059033', '', '$2a$10$PS04ecXfknNd3V8d.ymLTObQciapMU4xU8.GADBZZsuTZr7ymnagy', '1', '0', '0', 'test2', '0', '40652338142121984', '', '弱');
INSERT INTO `t_user` VALUES ('4363087427670016', '', '2018-05-03 15:09:42', '', '2018-10-08 00:04:46', '[\"510000\",\"510100\",\"510114\"]', 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', '', '1012139570@qq.com', '18782059033', '', '$2a$10$PS04ecXfknNd3V8d.ymLTObQciapMU4xU8.GADBZZsuTZr7ymnagy', '1', '0', '0', 'test', '0', '40652338142121984', '', '弱');
INSERT INTO `t_user` VALUES ('682265633886208', '', '2018-05-01 16:13:51', 'admin', '2018-11-14 21:52:20', '[\"510000\",\"510100\",\"510104\"]', 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', 'test', '2549575805@qq.com', '18782059038', 'Exrick', '$2a$10$PS04ecXfknNd3V8d.ymLTObQciapMU4xU8.GADBZZsuTZr7ymnagy', '1', '0', '1', 'admin', '0', '40322777781112832', '天府1街', '弱');

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `role_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES ('70669807116095488', null, '2018-11-02 14:28:56', '0', null, '2018-11-02 14:28:56', '496138616573952', '682265633886208');
INSERT INTO `t_user_role` VALUES ('61392579396112384', null, '2018-10-08 00:04:32', '0', null, '2018-10-08 00:04:32', '16457350655250432', '16739222421508096');
INSERT INTO `t_user_role` VALUES ('61392637076180992', null, '2018-10-08 00:04:46', '0', null, '2018-10-08 00:04:46', '496138616573953', '4363087427670016');
INSERT INTO `t_user_role` VALUES ('75424516313976832', 'admin', '2018-11-15 17:22:27', '0', 'admin', '2018-11-15 17:22:27', '496138616573952', '682265633886209');
INSERT INTO `t_user_role` VALUES ('75424516414640128', 'admin', '2018-11-15 17:22:27', '0', 'admin', '2018-11-15 17:22:27', '496138616573953', '682265633886209');
