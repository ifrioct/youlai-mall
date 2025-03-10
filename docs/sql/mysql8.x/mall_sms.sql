/*
 Navicat Premium Data Transfer

 Source Server         : root.youlai.tech
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : www.youlai.tech:3306
 Source Schema         : mall_sms

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 04/07/2022 00:10:56
*/
use mall_sms;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sms_advert
-- ----------------------------
DROP TABLE IF EXISTS `sms_advert`;
CREATE TABLE `sms_advert`  (
                               `id` bigint NOT NULL AUTO_INCREMENT,
                               `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '广告标题',
                               `pic_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片地址',
                               `begin_time` datetime NULL DEFAULT NULL COMMENT '开始时间',
                               `end_time` datetime NULL DEFAULT NULL COMMENT '结束时间',
                               `status` tinyint(1) NULL DEFAULT NULL COMMENT '状态(1:开启；0:关闭)',
                               `sort` int NULL DEFAULT NULL COMMENT '排序',
                               `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '链接地址',
                               `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
                               `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                               `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间(新增有值)',
                               PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '广告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sms_advert
-- ----------------------------
INSERT INTO `sms_advert` VALUES (35, '首页banner2', 'https://oss.youlai.tech/default/14d9b8fb471a43429334080124a9c65d.png', '2022-07-04 00:00:00', '2022-10-07 00:00:00', 1, 2, NULL, NULL, '2022-07-04 00:08:10', '2022-07-04 00:08:10');
INSERT INTO `sms_advert` VALUES (36, 'banner1', 'https://oss.youlai.tech/default/8a0302b55f8a44d0ba92ad1b51bb0c2f.jpg', '2022-07-04 00:00:00', '2022-10-07 00:00:00', 1, 1, NULL, NULL, '2022-07-04 00:08:10', '2022-07-04 00:08:10');

-- ----------------------------
-- Table structure for sms_coupon
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon`;
CREATE TABLE `sms_coupon`  (
                               `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
                               `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '优惠券名称',
                               `type` tinyint NOT NULL DEFAULT 1 COMMENT '优惠券类型(1:满减券;2:直减券;3:折扣券)',
                               `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '优惠券码',
                               `platform` int NULL DEFAULT NULL COMMENT '使用平台(0:全平台;1:APP;2:PC)',
                               `face_value` bigint NULL DEFAULT NULL COMMENT '优惠券面值(分)',
                               `discount` decimal(10, 2) NULL DEFAULT NULL COMMENT '折扣',
                               `min_point` bigint NULL DEFAULT NULL COMMENT '使用门槛(0:无门槛)',
                               `per_limit` int NULL DEFAULT 1 COMMENT '每人限领张数(-1:无限制)',
                               `validity_period_type` tinyint NULL DEFAULT NULL COMMENT '有效期类型(1:自领取时起有效天数;2:有效起止时间)',
                               `validity_days` int NULL DEFAULT 1 COMMENT '有效期天数',
                               `validity_begin_time` datetime NULL DEFAULT NULL COMMENT '有效期起始时间',
                               `validity_end_time` datetime NULL DEFAULT NULL COMMENT '有效期截止时间',
                               `use_type` tinyint NULL DEFAULT NULL COMMENT '使用类型(0:全场通用;1:指定商品分类;2:指定商品)',
                               `issue_count` int NULL DEFAULT 1 COMMENT '优惠券发放数量(-1-无限制)',
                               `received_count` int NULL DEFAULT 0 COMMENT '已领取的优惠券数量(统计)',
                               `used_count` int NULL DEFAULT 0 COMMENT '已使用的优惠券数量(统计)',
                               `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
                               `update_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                               `create_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
                               `deleted` tinyint NULL DEFAULT 1 COMMENT '逻辑删除标识(0:正常;1:删除)',
                               PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '优惠券表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sms_coupon
-- ----------------------------
INSERT INTO `sms_coupon` VALUES (1, '新人无门槛优惠券,立减20元', 3, '123456', 1, 1, NULL, 10000000, 1, 1, 7, '2021-03-17 21:10:35', '2025-03-17 21:10:38', NULL, 1000, 0, 0, NULL, '2021-03-17 21:10:54', '2021-03-17 21:10:56', 0);
INSERT INTO `sms_coupon` VALUES (2, '满减优惠券', 1, '50', 2, 12, NULL, 10000000, 1, 2, 7, '2021-03-17 21:19:22', '2022-03-17 21:19:24', NULL, 100, 0, 0, NULL, '2021-03-17 21:19:44', '2021-03-17 21:19:46', 0);

-- ----------------------------
-- Table structure for sms_coupon_history
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon_history`;
CREATE TABLE `sms_coupon_history`  (
                                       `id` bigint NOT NULL,
                                       `coupon_id` bigint NULL DEFAULT NULL COMMENT '优惠券ID',
                                       `member_id` bigint NULL DEFAULT NULL COMMENT '会员ID',
                                       `member_nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员昵称',
                                       `coupon_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '优惠券码',
                                       `get_type` tinyint NULL DEFAULT NULL COMMENT '获取类型(1：后台增删；2：主动领取)',
                                       `status` tinyint NULL DEFAULT NULL COMMENT '状态(0：未使用；1：已使用；2：已过期)',
                                       `use_time` datetime NULL DEFAULT NULL COMMENT '使用时间',
                                       `order_id` bigint NULL DEFAULT NULL COMMENT '订单ID',
                                       `order_sn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单号',
                                       `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                                       `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                                       PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_coupon_history
-- ----------------------------

-- ----------------------------
-- Table structure for sms_coupon_spu
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon_spu`;
CREATE TABLE `sms_coupon_spu`  (
                                   `id` bigint NOT NULL,
                                   `coupon_id` bigint NOT NULL COMMENT '优惠券ID',
                                   `spu_id` bigint NOT NULL COMMENT '商品ID',
                                   `spu_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品名称',
                                   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_coupon_spu
-- ----------------------------

-- ----------------------------
-- Table structure for sms_coupon_spu_category
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon_spu_category`;
CREATE TABLE `sms_coupon_spu_category`  (
                                            `id` bigint NOT NULL,
                                            `coupon_id` bigint NOT NULL COMMENT '优惠券ID',
                                            `category_id` bigint NOT NULL COMMENT '商品分类ID',
                                            `category_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品分类名称',
                                            PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_coupon_spu_category
-- ----------------------------

-- ----------------------------
-- Table structure for undo_log
-- ----------------------------
DROP TABLE IF EXISTS `undo_log`;
CREATE TABLE `undo_log`  (
                             `branch_id` bigint NOT NULL COMMENT 'branch transaction id',
                             `xid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'global transaction id',
                             `context` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'undo_log context,such as serialization',
                             `rollback_info` longblob NOT NULL COMMENT 'rollback info',
                             `log_status` int NOT NULL COMMENT '0:normal status,1:defense status',
                             `log_created` datetime(6) NOT NULL COMMENT 'create datetime',
                             `log_modified` datetime(6) NOT NULL COMMENT 'modify datetime',
                             UNIQUE INDEX `ux_undo_log`(`xid`, `branch_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'AT transaction mode undo table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of undo_log
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
