/*
 Navicat Premium Data Transfer

 Source Server         : dockerTest
 Source Server Type    : MySQL
 Source Server Version : 50734
 Source Host           : 127.0.0.1:4578
 Source Schema         : planTest

 Target Server Type    : MySQL
 Target Server Version : 50734
 File Encoding         : 65001

 Date: 29/06/2021 13:24:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for plans
-- ----------------------------
DROP TABLE IF EXISTS `plans`;
CREATE TABLE `plans`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '计划名称，唯一',
  `values` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '这个计划包含哪些服务',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '这个计划的月费，在创建和更新计划时设置月份',
  `state` int(255) NULL DEFAULT 1 COMMENT '状态1.有效,0.失效',
  `createAt` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '此数据的创建时间',
  `careteBy` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '创建者',
  `updated` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `updateBy` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '修改者',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of plans
-- ----------------------------
INSERT INTO `plans` VALUES (1, 'Standard Plan', '[\'General\']', 0.00, 1, '2021-06-29 03:26:09', NULL, '2021-06-29 03:26:09', NULL);
INSERT INTO `plans` VALUES (2, 'Premium Plan', '[\'General\', \'Specialist\']', 10.00, 1, '2021-06-29 03:26:36', NULL, '2021-06-29 03:26:36', NULL);
INSERT INTO `plans` VALUES (3, 'C Plan', '[\'General\', \'Specialist\', \'Physiotherapy\']', 30.00, 1, '2021-06-29 03:27:23', NULL, '2021-06-29 03:27:23', NULL);
INSERT INTO `plans` VALUES (4, 'D Plan', '[\'General\', \'Specialist\', \'Physiotherapy\', \'*\']', 50.00, 1, '2021-06-29 03:27:42', NULL, '2021-06-29 03:27:42', NULL);

-- ----------------------------
-- Table structure for services
-- ----------------------------
DROP TABLE IF EXISTS `services`;
CREATE TABLE `services`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `state` int(11) NULL DEFAULT 1,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `createAt` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `createBy` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `updated` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `updateBy` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of services
-- ----------------------------
INSERT INTO `services` VALUES (1, 'General', 1, 0.00, '2021-06-29 03:23:37', NULL, '2021-06-29 03:23:37', NULL);
INSERT INTO `services` VALUES (2, 'Specialist', 1, 10.00, '2021-06-29 03:24:17', NULL, '2021-06-29 03:24:17', NULL);
INSERT INTO `services` VALUES (3, 'Physiotherapy', 1, 20.00, '2021-06-29 03:24:24', NULL, '2021-06-29 03:24:24', NULL);
INSERT INTO `services` VALUES (4, '*', 1, NULL, '2021-06-29 03:24:32', NULL, '2021-06-29 03:24:32', NULL);

-- ----------------------------
-- View structure for allActivePlans
-- ----------------------------
DROP VIEW IF EXISTS `allActivePlans`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `allActivePlans` AS select `plans`.`id` AS `id`,`plans`.`name` AS `name`,`plans`.`values` AS `values`,`plans`.`price` AS `price` from `plans` where (`plans`.`state` = 1);

-- ----------------------------
-- View structure for allActiveServices
-- ----------------------------
DROP VIEW IF EXISTS `allActiveServices`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `allActiveServices` AS select `services`.`id` AS `id`,`services`.`name` AS `name`,`services`.`price` AS `price` from `services` where (`services`.`state` = 1);

SET FOREIGN_KEY_CHECKS = 1;
