/*
 Navicat Premium Data Transfer

 Source Server         : 172.17.12.201(云诊所)
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : 172.17.12.201:3307
 Source Schema         : clinic_00000

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 25/07/2022 17:50:36
*/
/*****/;
CREATE DATABASE `@@@dbName@@@`;

USE `@@@dbName@@@`;

-- ----------------------------
-- Table structure for appointment_info
-- ----------------------------
DROP TABLE IF EXISTS `appointment_info`;
CREATE TABLE `appointment_info`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '主键',
  `register_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '挂号id',
  `doctor_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '医生id',
  `archive_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '档案id',
  `type` tinyint(4) NULL DEFAULT NULL COMMENT '就诊类型：0：初诊。1：复诊',
  `dept_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室id',
  `appointment_date` date NOT NULL COMMENT '预约日期',
  `appointment_time_start` time(0) NOT NULL COMMENT '预约开始时间',
  `appointment_time_end` time(0) NOT NULL COMMENT '预约结束时间',
  `remark` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '预约状态（0已预约，1已失效，2待接诊，3接诊中，4已结诊）',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除：0否1、是',
  `created_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预约状态（0已预约，1已失效，2待接诊，3接诊中，4已结诊）',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '预约表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of appointment_info
-- ----------------------------

-- ----------------------------
-- Table structure for appointment_setting
-- ----------------------------
DROP TABLE IF EXISTS `appointment_setting`;
CREATE TABLE `appointment_setting`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键id',
  `morning_start` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '早上开始时间',
  `morning_end` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '早上结束时间',
  `afternoon_start` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '下午开始时间',
  `afternoon_end` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '下午结束时间',
  `night_start` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '晚上开始时间',
  `night_end` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '晚上结束时间',
  `appointment_time_unit` tinyint(5) NULL DEFAULT NULL COMMENT '预约时间单位设置',
  `scheduling_day_num` tinyint(3) NULL DEFAULT NULL COMMENT '可排班天数',
  `scheduling_effective_date` date NULL DEFAULT NULL COMMENT '周排班生效日期',
  `effective` tinyint(3) NULL DEFAULT NULL COMMENT '是否生效(0未生效，1已生效，2已过期)',
  `effective_date` date NULL DEFAULT NULL COMMENT '生效日期',
  `effective_date_end` date NULL DEFAULT NULL COMMENT '生效结束日期',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除：0否1、是',
  `created_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '预约设置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of appointment_setting
-- ----------------------------
INSERT INTO `appointment_setting` VALUES ('1', '08:30', '11:30', '14:00', '18:00', NULL, NULL, 15, 10, NULL, 1, '2022-08-15', NULL, b'0', NULL, '2022-09-01 09:35:21', NULL, NULL);

-- ----------------------------
-- Table structure for archive_info
-- ----------------------------
DROP TABLE IF EXISTS `archive_info`;
CREATE TABLE `archive_info`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id主键(患者id)',
  `coding` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '患者id标识',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `birthday` datetime(0) NULL DEFAULT NULL COMMENT '患者生日',
  `id_type` tinyint(4) NULL DEFAULT NULL COMMENT '证件类型(0-居民身份证，1-护照，2-港澳通行证,3-台湾通行证，4-出生证)',
  `id_card` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号',
  `gender` tinyint(3) NULL DEFAULT NULL COMMENT '性别',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `address` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `self` bit(1) NULL DEFAULT b'0' COMMENT '是否本人：0-否、1-是',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除：0-否、1-是',
  `created_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `updated_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '档案信息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of archive_info
-- ----------------------------

-- ----------------------------
-- Table structure for charge_daily_report
-- ----------------------------
DROP TABLE IF EXISTS `charge_daily_report`;
CREATE TABLE `charge_daily_report`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id主键',
  `setting_day` date NULL DEFAULT NULL COMMENT '结算日',
  `cashier_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收款员id',
  `cashier` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收款员',
  `discount_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '优惠金额',
  `amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '支付的金额',
  `real_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '实收金额',
  `wx_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '微信渠道金额',
  `zfb_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '支付宝渠道金额',
  `cash_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '现金渠道金额',
  `other_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '其他渠道金额',
  `refund_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '退款金额',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除：0-否、1-是',
  `created_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `updated_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收费日结算统计表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of charge_daily_report
-- ----------------------------

-- ----------------------------
-- Table structure for charge_discount_info
-- ----------------------------
DROP TABLE IF EXISTS `charge_discount_info`;
CREATE TABLE `charge_discount_info`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id主键',
  `charge_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收费记录id',
  `item_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药品/项目id',
  `discount_rate` decimal(3, 2) NULL DEFAULT NULL COMMENT '折扣率',
  `discount_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '优惠金额',
  `real_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '实付金额',
  `amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '应付金额',
  `note` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除：0-否、1-是',
  `created_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `updated_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收费优惠信息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of charge_discount_info
-- ----------------------------

-- ----------------------------
-- Table structure for charge_drug_stock
-- ----------------------------
DROP TABLE IF EXISTS `charge_drug_stock`;
CREATE TABLE `charge_drug_stock`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id主键',
  `medrecord_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '病历id',
  `prescription_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处方id',
  `drug_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药品id',
  `mgt_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '库存id',
  `drug_num` decimal(11, 1) NOT NULL COMMENT '药品数量',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除：0-否、1-是',
  `created_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `updated_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx1_rxId`(`prescription_id`) USING BTREE COMMENT '处方id索引'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收费药品库存记录表(方便退款入库)' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of charge_drug_stock
-- ----------------------------

-- ----------------------------
-- Table structure for charge_item_sum
-- ----------------------------
DROP TABLE IF EXISTS `charge_item_sum`;
CREATE TABLE `charge_item_sum`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id主键',
  `report_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日报表id',
  `setting_day` date NULL DEFAULT NULL COMMENT '结算日',
  `item_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目id',
  `item_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目名称',
  `amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '收费金额',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除：0-否、1-是',
  `created_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `updated_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收费项目合计' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of charge_item_sum
-- ----------------------------

-- ----------------------------
-- Table structure for charge_record
-- ----------------------------
DROP TABLE IF EXISTS `charge_record`;
CREATE TABLE `charge_record`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id主键',
  `pay_coding` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '付款编号',
  `patient_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '患者id',
  `medrecord_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '病历id',
  `prescription_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处方id',
  `register_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '挂号id',
  `prescription_type` tinyint(3) NULL DEFAULT NULL COMMENT '处方类型(1:药品;2:项目;3:附加费;4:挂号费)',
  `pay_status` tinyint(3) NOT NULL COMMENT '收费状态(0:待收费；1:已缴费；2：已退费；3:已失效。4：已作废)',
  `pay_mode` tinyint(3) NULL DEFAULT NULL COMMENT '支付方式(0：微信。1：支付宝。2：现金。3：其他)',
  `discount_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '优惠金额',
  `amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '支付的金额',
  `real_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '实收金额',
  `enable` bit(1) NULL DEFAULT b'1' COMMENT '是否启用：0-否(废弃)、1-是',
  `dispensed` bit(1) NULL DEFAULT NULL COMMENT '是否发药：0-否、1-是',
  `pay_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `refund_mode` tinyint(3) NULL DEFAULT NULL COMMENT '退款方式(0：微信。1：支付宝。2：现金。3：其他)',
  `refund_time` datetime(0) NULL DEFAULT NULL COMMENT '退款时间',
  `cashier_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收款员id',
  `cashier` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收款员',
  `discount_mode` tinyint(3) NULL DEFAULT NULL COMMENT '折扣方式。0：整单折扣，1：单笔折扣，2：优惠金额',
  `total_discount_rate` decimal(18, 2) NULL DEFAULT NULL COMMENT '合计折扣率或优惠金额',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除：0-否、1-是',
  `created_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `updated_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收费记录表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of charge_record
-- ----------------------------

-- ----------------------------
-- Table structure for charge_refund
-- ----------------------------
DROP TABLE IF EXISTS `charge_refund`;
CREATE TABLE `charge_refund`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id主键',
  `charge_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收费记录id',
  `prescription_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处方id',
  `pay_status` tinyint(3) NULL DEFAULT NULL COMMENT '退费状态()',
  `pay_mode` tinyint(3) NULL DEFAULT NULL COMMENT '支付方式',
  `amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '退费总金额',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除：0-否、1-是',
  `created_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `updated_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '退款记录表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of charge_refund
-- ----------------------------

-- ----------------------------
-- Table structure for clinicmng_audit
-- ----------------------------
DROP TABLE IF EXISTS `clinicmng_audit`;
CREATE TABLE `clinicmng_audit`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '记录id',
  `audit_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核类型 1-采购审核 2-库存盘点审核 .........(后续可扩展)',
  `audit_person_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审批人id',
  `audit_person_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审批人姓名',
  `audit_person_phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核人手机号',
  `audit_order` int(3) NULL DEFAULT NULL COMMENT '审批顺序',
  `audit_person_status` bit(1) NULL DEFAULT b'0' COMMENT '审批人状态 0-启用 1-停用',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '删除标志位 0-不删除 1-已删除',
  `created_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '审核管理表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of clinicmng_audit
-- ----------------------------

-- ----------------------------
-- Table structure for clinicmng_drug_unit
-- ----------------------------
DROP TABLE IF EXISTS `clinicmng_drug_unit`;
CREATE TABLE `clinicmng_drug_unit`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'id',
  `unit_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位名称',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序号',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '逻辑删除位',
  `created_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `created_by_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人姓名',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `updated_by_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人姓名',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '药品单位管理表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of clinicmng_drug_unit
-- ----------------------------
INSERT INTO `clinicmng_drug_unit` VALUES ('1447844755512774657', 'g', 1, b'0', '1442403455200149506', '管理员', '2021-10-12 16:41:04', '1442403455200149506', '管理员', '2021-10-12 16:41:04');
INSERT INTO `clinicmng_drug_unit` VALUES ('1447844821254295553', 'kg', 2, b'0', '1442403455200149506', '管理员', '2021-10-12 16:41:20', '1442403455200149506', '管理员', '2021-10-12 16:41:20');
INSERT INTO `clinicmng_drug_unit` VALUES ('1447844907791175682', 'ml', 3, b'0', '1442403455200149506', '管理员', '2021-10-12 16:41:40', '1442403455200149506', '管理员', '2021-10-12 16:41:40');
INSERT INTO `clinicmng_drug_unit` VALUES ('1447844980759482369', '丸', 4, b'0', '1442403455200149506', '管理员', '2021-10-12 16:41:58', '1442403455200149506', '管理员', '2021-10-12 16:41:58');
INSERT INTO `clinicmng_drug_unit` VALUES ('1447845031816744962', '盒', 5, b'0', '1442403455200149506', '管理员', '2021-10-12 16:42:10', '1442403455200149506', '管理员', '2021-10-12 16:42:10');
INSERT INTO `clinicmng_drug_unit` VALUES ('1447845066050654210', '包', 6, b'0', '1442403455200149506', '管理员', '2021-10-12 16:42:18', '1442403455200149506', '管理员', '2021-10-12 16:42:18');
INSERT INTO `clinicmng_drug_unit` VALUES ('1447845112313827330', '剂', 7, b'0', '1442403455200149506', '管理员', '2021-10-12 16:42:29', '1442403455200149506', '管理员', '2021-10-12 16:42:29');
INSERT INTO `clinicmng_drug_unit` VALUES ('1447845152478482434', '片', 8, b'0', '1442403455200149506', '管理员', '2021-10-12 16:42:39', '1442403455200149506', '管理员', '2021-10-12 16:42:39');
INSERT INTO `clinicmng_drug_unit` VALUES ('1447845196493508610', '粒', 9, b'0', '1442403455200149506', '管理员', '2021-10-12 16:42:49', '1442403455200149506', '管理员', '2021-10-12 16:42:49');
INSERT INTO `clinicmng_drug_unit` VALUES ('1447845235387289602', '份', 10, b'0', '1442403455200149506', '管理员', '2021-10-12 16:42:58', '1442403455200149506', '管理员', '2021-10-12 16:42:58');
INSERT INTO `clinicmng_drug_unit` VALUES ('1447845262931283970', '板', 11, b'0', '1442403455200149506', '管理员', '2021-10-12 16:43:05', '1442403455200149506', '管理员', '2021-10-12 16:43:05');
INSERT INTO `clinicmng_drug_unit` VALUES ('1447845314986790914', '升', 12, b'0', '1442403455200149506', '管理员', '2021-10-12 16:43:17', '1442403455200149506', '管理员', '2021-10-12 16:43:17');
INSERT INTO `clinicmng_drug_unit` VALUES ('1447845360104919042', '颗', 13, b'0', '1442403455200149506', '管理员', '2021-10-12 16:43:28', '1442403455200149506', '管理员', '2021-10-12 16:43:28');
INSERT INTO `clinicmng_drug_unit` VALUES ('1447845393755820034', 'u', 14, b'0', '1442403455200149506', '管理员', '2021-10-12 16:43:36', '1442403455200149506', '管理员', '2021-10-12 16:43:36');
INSERT INTO `clinicmng_drug_unit` VALUES ('1447845422482608130', 'ul', 15, b'0', '1442403455200149506', '管理员', '2021-10-12 16:43:43', '1442403455200149506', '管理员', '2021-10-12 16:43:43');
INSERT INTO `clinicmng_drug_unit` VALUES ('1447845467273580546', '次', 16, b'0', '1442403455200149506', '管理员', '2021-10-12 16:43:54', '1442403455200149506', '管理员', '2021-10-12 16:43:54');
INSERT INTO `clinicmng_drug_unit` VALUES ('1447845489763438593', '支', 17, b'0', '1442403455200149506', '管理员', '2021-10-12 16:43:59', '1442403455200149506', '管理员', '2021-10-12 16:43:59');
INSERT INTO `clinicmng_drug_unit` VALUES ('1447845525855424514', '副', 18, b'0', '1442403455200149506', '管理员', '2021-10-12 16:44:08', '1442403455200149506', '管理员', '2021-10-12 16:44:08');
INSERT INTO `clinicmng_drug_unit` VALUES ('1447845571644641282', '瓶', 19, b'0', '1442403455200149506', '管理员', '2021-10-12 16:44:19', '1442403455200149506', '管理员', '2021-10-12 16:44:19');
INSERT INTO `clinicmng_drug_unit` VALUES ('1447845602057539586', '箱', 20, b'0', '1442403455200149506', '管理员', '2021-10-12 16:44:26', '1442403455200149506', '管理员', '2021-10-12 16:44:26');
INSERT INTO `clinicmng_drug_unit` VALUES ('1447845652670205953', '块', 21, b'0', '1442403455200149506', '管理员', '2021-10-12 16:44:38', '1442403455200149506', '管理员', '2021-10-12 16:44:38');
INSERT INTO `clinicmng_drug_unit` VALUES ('1447845679752826881', '条', 22, b'0', '1442403455200149506', '管理员', '2021-10-12 16:44:44', '1442403455200149506', '管理员', '2021-10-12 16:44:44');
INSERT INTO `clinicmng_drug_unit` VALUES ('1447845706386657281', '组', 23, b'0', '1442403455200149506', '管理员', '2021-10-12 16:44:51', '1442403455200149506', '管理员', '2021-10-12 16:44:51');
INSERT INTO `clinicmng_drug_unit` VALUES ('1447845738909290498', '筒', 24, b'0', '1442403455200149506', '管理员', '2021-10-12 16:44:58', '1442403455200149506', '管理员', '2021-10-12 16:44:58');
INSERT INTO `clinicmng_drug_unit` VALUES ('1447845775965966338', '对', 25, b'0', '1442403455200149506', '管理员', '2021-10-12 16:45:07', '1442403455200149506', '管理员', '2021-10-12 16:45:07');
INSERT INTO `clinicmng_drug_unit` VALUES ('1447845810090823682', '套', 26, b'0', '1442403455200149506', '管理员', '2021-10-12 16:45:15', '1442403455200149506', '管理员', '2021-10-12 16:45:15');
INSERT INTO `clinicmng_drug_unit` VALUES ('1447845840415641602', '扎', 27, b'0', '1442403455200149506', '管理员', '2021-10-12 16:45:23', '1442403455200149506', '管理员', '2021-10-12 16:45:23');
INSERT INTO `clinicmng_drug_unit` VALUES ('1447845918870097921', '小包', 28, b'0', '1442403455200149506', '管理员', '2021-10-12 16:45:41', '1442403455200149506', '管理员', '2021-10-12 16:45:41');
INSERT INTO `clinicmng_drug_unit` VALUES ('1447845972334891010', '枚', 29, b'0', '1442403455200149506', '管理员', '2021-10-12 16:45:54', '1442403455200149506', '管理员', '2021-10-12 16:45:54');
INSERT INTO `clinicmng_drug_unit` VALUES ('1447845997806899202', '只', 30, b'0', '1442403455200149506', '管理员', '2021-10-12 16:46:00', '1442403455200149506', '管理员', '2021-10-12 16:46:00');
INSERT INTO `clinicmng_drug_unit` VALUES ('1447846028005888001', '袋', 31, b'0', '1442403455200149506', '管理员', '2021-10-12 16:46:07', '1442403455200149506', '管理员', '2021-10-12 16:46:07');
INSERT INTO `clinicmng_drug_unit` VALUES ('1447846072532619266', '帖', 32, b'0', '1442403455200149506', '管理员', '2021-10-12 16:46:18', '1442403455200149506', '管理员', '2021-10-12 16:46:18');
INSERT INTO `clinicmng_drug_unit` VALUES ('1447846109450883073', '付', 33, b'0', '1442403455200149506', '管理员', '2021-10-12 16:46:27', '1442403455200149506', '管理员', '2021-10-12 16:46:27');
INSERT INTO `clinicmng_drug_unit` VALUES ('1447846157131730946', '卷', 34, b'0', '1442403455200149506', '管理员', '2021-10-12 16:46:38', '1442403455200149506', '管理员', '2021-10-12 16:46:38');
INSERT INTO `clinicmng_drug_unit` VALUES ('1447846218729279489', 'iu', 35, b'0', '1442403455200149506', '管理员', '2021-10-12 16:46:53', '1442403455200149506', '管理员', '2021-10-12 16:46:53');
INSERT INTO `clinicmng_drug_unit` VALUES ('1447846555628359682', 'mg', 36, b'0', '1442403455200149506', '管理员', '2021-10-12 16:48:13', '1442403455200149506', '管理员', '2021-10-12 16:48:13');
INSERT INTO `clinicmng_drug_unit` VALUES ('1447847638912225282', '静脉注射', 37, b'1', '1442403455200149506', '管理员', '2021-10-12 16:52:31', '1442403455200149506', '管理员', '2021-10-12 16:52:31');
INSERT INTO `clinicmng_drug_unit` VALUES ('1447847667727093762', '肌肉注射', 38, b'1', '1442403455200149506', '管理员', '2021-10-12 16:52:38', '1442403455200149506', '管理员', '2021-10-12 16:52:38');

-- ----------------------------
-- Table structure for clinicmng_other_settins
-- ----------------------------
DROP TABLE IF EXISTS `clinicmng_other_settins`;
CREATE TABLE `clinicmng_other_settins`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'id',
  `type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设置类型(1-库存管理(1为启用 0或null为禁用) 2-负库存管理((1为启用 0或null为禁用)) 3-全局药品预警数量 4-库存有效期预警时间(单位是天) 5-药品用法管理 6-用药频率管理 7-服药方法管理 8-煎药方法管理 9-特殊用法管理 10-药品剂型管理',
  `value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设置值',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序号',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '逻辑删除位',
  `created_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '其他设置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of clinicmng_other_settins
-- ----------------------------
INSERT INTO `clinicmng_other_settins` VALUES ('1447846644052676610', '5', '共为细末，炼蜜为丸', 1, b'0', '1442403455200149506', '2021-10-12 16:48:34', '1442403455200149506', '2021-10-12 16:49:48');
INSERT INTO `clinicmng_other_settins` VALUES ('1447846991114555393', '5', '共为细末，水泛为丸', 2, b'0', '1442403455200149506', '2021-10-12 16:49:57', '1442403455200149506', '2021-10-12 16:49:57');
INSERT INTO `clinicmng_other_settins` VALUES ('1447847028171231234', '5', '共为细末', 3, b'0', '1442403455200149506', '2021-10-12 16:50:06', '1442403455200149506', '2021-10-12 16:50:06');
INSERT INTO `clinicmng_other_settins` VALUES ('1447847054058475522', '5', '每剂服4天', 4, b'0', '1442403455200149506', '2021-10-12 16:50:12', '1442403455200149506', '2021-10-12 16:50:12');
INSERT INTO `clinicmng_other_settins` VALUES ('1447847093304578050', '5', '每剂服3天', 5, b'0', '1442403455200149506', '2021-10-12 16:50:21', '1442403455200149506', '2021-10-12 16:50:21');
INSERT INTO `clinicmng_other_settins` VALUES ('1447847124774440962', '5', '每剂服2天', 6, b'0', '1442403455200149506', '2021-10-12 16:50:29', '1442403455200149506', '2021-10-12 16:50:29');
INSERT INTO `clinicmng_other_settins` VALUES ('1447847164427390977', '5', '每剂服1天', 7, b'0', '1442403455200149506', '2021-10-12 16:50:38', '1442403455200149506', '2021-10-12 16:50:38');
INSERT INTO `clinicmng_other_settins` VALUES ('1447847224603070466', '5', '每日2剂', 8, b'0', '1442403455200149506', '2021-10-12 16:50:53', '1442403455200149506', '2021-10-12 16:50:53');
INSERT INTO `clinicmng_other_settins` VALUES ('1447847250645504002', '5', '每日1剂', 9, b'0', '1442403455200149506', '2021-10-12 16:50:59', '1442403455200149506', '2021-10-12 16:50:59');
INSERT INTO `clinicmng_other_settins` VALUES ('1447847276557914113', '5', '外用', 10, b'0', '1442403455200149506', '2021-10-12 16:51:05', '1442403455200149506', '2021-10-12 16:51:05');
INSERT INTO `clinicmng_other_settins` VALUES ('1447847306727542785', '5', '滴鼻', 11, b'0', '1442403455200149506', '2021-10-12 16:51:12', '1442403455200149506', '2021-10-12 16:51:12');
INSERT INTO `clinicmng_other_settins` VALUES ('1447847332182773761', '5', '滴耳', 12, b'0', '1442403455200149506', '2021-10-12 16:51:18', '1442403455200149506', '2021-10-12 16:51:18');
INSERT INTO `clinicmng_other_settins` VALUES ('1447847381428097025', '5', '封闭用', 13, b'0', '1442403455200149506', '2021-10-12 16:51:30', '1442403455200149506', '2021-10-12 16:51:30');
INSERT INTO `clinicmng_other_settins` VALUES ('1447847941741039618', '5', '静脉注射', 14, b'0', '1442403455200149506', '2021-10-12 16:53:44', '1442403455200149506', '2021-10-12 16:53:44');
INSERT INTO `clinicmng_other_settins` VALUES ('1447847969754796034', '5', '肌肉注射', 15, b'0', '1442403455200149506', '2021-10-12 16:53:50', '1442403455200149506', '2021-10-12 16:53:50');
INSERT INTO `clinicmng_other_settins` VALUES ('1447848003162427394', '5', '皮内注射', 16, b'0', '1442403455200149506', '2021-10-12 16:53:58', '1442403455200149506', '2021-10-12 16:53:58');
INSERT INTO `clinicmng_other_settins` VALUES ('1447848029242609665', '5', '皮下注射', 17, b'0', '1442403455200149506', '2021-10-12 16:54:05', '1442403455200149506', '2021-10-12 16:54:05');
INSERT INTO `clinicmng_other_settins` VALUES ('1447848051828936706', '5', '雾化吸入', 18, b'0', '1442403455200149506', '2021-10-12 16:54:10', '1442403455200149506', '2021-10-12 16:54:10');
INSERT INTO `clinicmng_other_settins` VALUES ('1447848082585767937', '5', '口服', 19, b'0', '1442403455200149506', '2021-10-12 16:54:17', '1442403455200149506', '2021-10-12 16:54:17');
INSERT INTO `clinicmng_other_settins` VALUES ('1447848107378298882', '5', '含服', 20, b'0', '1442403455200149506', '2021-10-12 16:54:23', '1442403455200149506', '2021-10-12 16:54:23');
INSERT INTO `clinicmng_other_settins` VALUES ('1447848129012518914', '5', '含漱', 21, b'0', '1442403455200149506', '2021-10-12 16:54:28', '1442403455200149506', '2021-10-12 16:54:28');
INSERT INTO `clinicmng_other_settins` VALUES ('1447848205374017537', '6', '1日1次', 1, b'0', '1442403455200149506', '2021-10-12 16:54:47', '1442403455200149506', '2021-10-12 16:54:47');
INSERT INTO `clinicmng_other_settins` VALUES ('1447848244288770050', '6', '1日2次', 2, b'0', '1442403455200149506', '2021-10-12 16:54:56', '1442403455200149506', '2021-10-12 16:54:56');
INSERT INTO `clinicmng_other_settins` VALUES ('1447848271614660609', '6', '1日3次', 3, b'0', '1442403455200149506', '2021-10-12 16:55:02', '1442403455200149506', '2021-10-12 16:55:02');
INSERT INTO `clinicmng_other_settins` VALUES ('1447848436572405761', '6', '1日4次', 4, b'0', '1442403455200149506', '2021-10-12 16:55:42', '1442403455200149506', '2021-10-12 16:55:42');
INSERT INTO `clinicmng_other_settins` VALUES ('1447848492285345793', '6', '隔日一次', 5, b'0', '1442403455200149506', '2021-10-12 16:55:55', '1442403455200149506', '2021-10-12 16:55:55');
INSERT INTO `clinicmng_other_settins` VALUES ('1447848524837339138', '6', '隔周一次', 6, b'0', '1442403455200149506', '2021-10-12 16:56:03', '1442403455200149506', '2021-10-12 16:56:03');
INSERT INTO `clinicmng_other_settins` VALUES ('1447848551945125889', '6', '1周1次', 7, b'0', '1442403455200149506', '2021-10-12 16:56:09', '1442403455200149506', '2021-10-12 16:56:09');
INSERT INTO `clinicmng_other_settins` VALUES ('1447848576339197954', '6', '必要时', 8, b'0', '1442403455200149506', '2021-10-12 16:56:15', '1442403455200149506', '2021-10-12 16:56:15');
INSERT INTO `clinicmng_other_settins` VALUES ('1447848605640605698', '6', '每晚1次', 9, b'0', '1442403455200149506', '2021-10-12 16:56:22', '1442403455200149506', '2021-10-12 16:56:22');
INSERT INTO `clinicmng_other_settins` VALUES ('1447848629678161922', '6', '每晚1次', 10, b'0', '1442403455200149506', '2021-10-12 16:56:28', '1442403455200149506', '2021-10-12 16:56:28');
INSERT INTO `clinicmng_other_settins` VALUES ('1447848750251819009', '6', '每半小时一次', 11, b'0', '1442403455200149506', '2021-10-12 16:56:56', '1442403455200149506', '2021-10-12 16:56:56');
INSERT INTO `clinicmng_other_settins` VALUES ('1447848781138673666', '6', '每一小时一次', 12, b'0', '1442403455200149506', '2021-10-12 16:57:04', '1442403455200149506', '2021-10-12 16:57:04');
INSERT INTO `clinicmng_other_settins` VALUES ('1447848805373362177', '6', '每两小时一次', 13, b'0', '1442403455200149506', '2021-10-12 16:57:10', '1442403455200149506', '2021-10-12 16:57:10');
INSERT INTO `clinicmng_other_settins` VALUES ('1447848837652725761', '6', '每三小时一次', 14, b'0', '1442403455200149506', '2021-10-12 16:57:17', '1442403455200149506', '2021-10-12 16:57:17');
INSERT INTO `clinicmng_other_settins` VALUES ('1447848865649704962', '6', '每四小时一次', 15, b'0', '1442403455200149506', '2021-10-12 16:57:24', '1442403455200149506', '2021-10-12 16:57:24');
INSERT INTO `clinicmng_other_settins` VALUES ('1447848898491105281', '6', '每六小时一次', 16, b'0', '1442403455200149506', '2021-10-12 16:57:32', '1442403455200149506', '2021-10-12 16:57:32');
INSERT INTO `clinicmng_other_settins` VALUES ('1447848920888688641', '6', '每八小时一次', 17, b'0', '1442403455200149506', '2021-10-12 16:57:37', '1442403455200149506', '2021-10-12 16:57:37');
INSERT INTO `clinicmng_other_settins` VALUES ('1447848949934243841', '6', '每十二小时一次', 18, b'0', '1442403455200149506', '2021-10-12 16:57:44', '1442403455200149506', '2021-10-12 16:57:44');
INSERT INTO `clinicmng_other_settins` VALUES ('1447848978346459138', '6', '1周2次', 19, b'0', '1442403455200149506', '2021-10-12 16:57:51', '1442403455200149506', '2021-10-12 16:57:51');
INSERT INTO `clinicmng_other_settins` VALUES ('1447849059430744066', '7', '分早晚两次，饭后温服', 1, b'0', '1442403455200149506', '2021-10-12 16:58:10', '1442403455200149506', '2021-10-12 16:59:09');
INSERT INTO `clinicmng_other_settins` VALUES ('1447849095061356546', '7', '分早晚两次，饭前温服', 2, b'0', '1442403455200149506', '2021-10-12 16:58:19', '1442403455200149506', '2021-10-12 16:59:33');
INSERT INTO `clinicmng_other_settins` VALUES ('1447849118041948162', '7', '分早中晚三次，饭后温服', 3, b'0', '1442403455200149506', '2021-10-12 16:58:24', '1442403455200149506', '2021-10-12 16:59:50');
INSERT INTO `clinicmng_other_settins` VALUES ('1447849159930462209', '7', '分早中晚三次，饭前温服', 4, b'0', '1442403455200149506', '2021-10-12 16:58:34', '1442403455200149506', '2021-10-12 17:00:05');
INSERT INTO `clinicmng_other_settins` VALUES ('1447849185037565953', '7', '冷服', 5, b'0', '1442403455200149506', '2021-10-12 16:58:40', '1442403455200149506', '2021-10-12 17:01:39');
INSERT INTO `clinicmng_other_settins` VALUES ('1447849972694294530', '7', '每日2次，每次3克', 6, b'0', '1442403455200149506', '2021-10-12 17:01:48', '1442403455200149506', '2021-10-12 17:01:48');
INSERT INTO `clinicmng_other_settins` VALUES ('1447850013714587650', '7', '每日2次，每次5克', 7, b'0', '1442403455200149506', '2021-10-12 17:01:58', '1442403455200149506', '2021-10-12 17:01:58');
INSERT INTO `clinicmng_other_settins` VALUES ('1447850041388605442', '7', '每日2次，每次6克', 8, b'0', '1442403455200149506', '2021-10-12 17:02:04', '1442403455200149506', '2021-10-12 17:02:04');
INSERT INTO `clinicmng_other_settins` VALUES ('1447850075094032386', '8', '水煎200ml', 1, b'0', '1442403455200149506', '2021-10-12 17:02:12', '1442403455200149506', '2021-10-12 17:02:12');
INSERT INTO `clinicmng_other_settins` VALUES ('1447850103430750209', '8', '水煎300ml', 2, b'0', '1442403455200149506', '2021-10-12 17:02:19', '1442403455200149506', '2021-10-12 17:02:19');
INSERT INTO `clinicmng_other_settins` VALUES ('1447850133587795970', '8', '水煎400ml', 3, b'0', '1442403455200149506', '2021-10-12 17:02:26', '1442403455200149506', '2021-10-12 17:02:26');
INSERT INTO `clinicmng_other_settins` VALUES ('1447850201040592898', '8', '水煎500ml', 4, b'0', '1442403455200149506', '2021-10-12 17:02:42', '1442403455200149506', '2021-10-12 17:02:42');
INSERT INTO `clinicmng_other_settins` VALUES ('1447850251112194050', '8', '水煎600ml', 5, b'0', '1442403455200149506', '2021-10-12 17:02:54', '1442403455200149506', '2021-10-12 17:02:54');
INSERT INTO `clinicmng_other_settins` VALUES ('1546771171201048578', '9', '先煎', 27, b'0', '1542716295315771393', '2022-07-12 16:19:19', '1542716295315771393', '2022-07-12 16:19:19');
INSERT INTO `clinicmng_other_settins` VALUES ('1546771215031525378', '9', '后下', 26, b'0', '1542716295315771393', '2022-07-12 16:19:30', '1542716295315771393', '2022-07-12 16:19:30');
INSERT INTO `clinicmng_other_settins` VALUES ('1546771240616779778', '9', '另煎', 25, b'0', '1542716295315771393', '2022-07-12 16:19:36', '1542716295315771393', '2022-07-12 16:19:36');
INSERT INTO `clinicmng_other_settins` VALUES ('1546771275228176386', '9', '冲服', 24, b'0', '1542716295315771393', '2022-07-12 16:19:44', '1542716295315771393', '2022-07-12 16:19:44');
INSERT INTO `clinicmng_other_settins` VALUES ('1546771306039533569', '9', '烊化', 23, b'0', '1542716295315771393', '2022-07-12 16:19:52', '1542716295315771393', '2022-07-12 16:19:52');
INSERT INTO `clinicmng_other_settins` VALUES ('1546771337647808513', '9', '打碎', 22, b'0', '1542716295315771393', '2022-07-12 16:19:59', '1542716295315771393', '2022-07-12 16:19:59');
INSERT INTO `clinicmng_other_settins` VALUES ('1546771380756865026', '9', '泡服', 21, b'0', '1542716295315771393', '2022-07-12 16:20:09', '1542716295315771393', '2022-07-12 16:20:09');
INSERT INTO `clinicmng_other_settins` VALUES ('1546771435534475265', '9', '包煎', 20, b'0', '1542716295315771393', '2022-07-12 16:20:23', '1542716295315771393', '2022-07-12 16:20:33');
INSERT INTO `clinicmng_other_settins` VALUES ('1546771510511853569', '9', '研粉冲服', 19, b'0', '1542716295315771393', '2022-07-12 16:20:40', '1542716295315771393', '2022-07-12 16:20:40');
INSERT INTO `clinicmng_other_settins` VALUES ('1546771538013904898', '9', '烊化兑服', 17, b'0', '1542716295315771393', '2022-07-12 16:20:47', '1542716295315771393', '2022-07-12 16:20:47');
INSERT INTO `clinicmng_other_settins` VALUES ('1546771562986790914', '9', '溶入煎好的汤液中服用', 15, b'0', '1542716295315771393', '2022-07-12 16:20:53', '1542716295315771393', '2022-07-12 16:20:53');
INSERT INTO `clinicmng_other_settins` VALUES ('1546771591285760001', '9', '研粉吞服', 18, b'0', '1542716295315771393', '2022-07-12 16:21:00', '1542716295315771393', '2022-07-12 16:21:00');
INSERT INTO `clinicmng_other_settins` VALUES ('1546771628975775745', '9', '加药引煎', 16, b'0', '1542716295315771393', '2022-07-12 16:21:09', '1542716295315771393', '2022-07-12 16:21:09');
INSERT INTO `clinicmng_other_settins` VALUES ('1546771692846637058', '10', '洗剂', 5, b'0', '1542716295315771393', '2022-07-12 16:21:24', '1542716295315771393', '2022-07-12 16:21:24');
INSERT INTO `clinicmng_other_settins` VALUES ('1546771728796016642', '10', '霜剂', 4, b'0', '1542716295315771393', '2022-07-12 16:21:32', '1542716295315771393', '2022-07-12 16:21:32');
INSERT INTO `clinicmng_other_settins` VALUES ('1546771776980180994', '10', '其它', 3, b'0', '1542716295315771393', '2022-07-12 16:21:44', '1542716295315771393', '2022-07-12 16:21:44');
INSERT INTO `clinicmng_other_settins` VALUES ('1546771840163176449', '10', '橡膏剂', 6, b'0', '1542716295315771393', '2022-07-12 16:21:59', '1542716295315771393', '2022-07-12 16:21:59');
INSERT INTO `clinicmng_other_settins` VALUES ('1546771878075490305', '10', '贴剂', 7, b'0', '1542716295315771393', '2022-07-12 16:22:08', '1542716295315771393', '2022-07-12 16:22:08');
INSERT INTO `clinicmng_other_settins` VALUES ('1546771934375632898', '10', '中药', 8, b'0', '1542716295315771393', '2022-07-12 16:22:21', '1542716295315771393', '2022-07-12 16:22:21');
INSERT INTO `clinicmng_other_settins` VALUES ('1546771964729810945', '10', '滴剂', 9, b'0', '1542716295315771393', '2022-07-12 16:22:29', '1542716295315771393', '2022-07-12 16:22:29');
INSERT INTO `clinicmng_other_settins` VALUES ('1546772006622519297', '10', '胶囊剂', 10, b'0', '1542716295315771393', '2022-07-12 16:22:39', '1542716295315771393', '2022-07-12 16:22:39');
INSERT INTO `clinicmng_other_settins` VALUES ('1546772042806779905', '10', '中草药', 11, b'0', '1542716295315771393', '2022-07-12 16:22:47', '1542716295315771393', '2022-07-12 16:22:47');
INSERT INTO `clinicmng_other_settins` VALUES ('1546772075614625793', '10', '滴丸', 12, b'0', '1542716295315771393', '2022-07-12 16:22:55', '1542716295315771393', '2022-07-12 16:22:55');
INSERT INTO `clinicmng_other_settins` VALUES ('1546772103502553089', '10', '栓剂', 13, b'0', '1542716295315771393', '2022-07-12 16:23:02', '1542716295315771393', '2022-07-12 16:23:02');
INSERT INTO `clinicmng_other_settins` VALUES ('1546772133231779842', '10', '膜剂', 14, b'0', '1542716295315771393', '2022-07-12 16:23:09', '1542716295315771393', '2022-07-12 16:23:09');
INSERT INTO `clinicmng_other_settins` VALUES ('1546772159580397570', '10', '膏药', 15, b'0', '1542716295315771393', '2022-07-12 16:23:15', '1542716295315771393', '2022-07-12 16:23:15');
INSERT INTO `clinicmng_other_settins` VALUES ('1546772189552893953', '10', '注射剂', 16, b'0', '1542716295315771393', '2022-07-12 16:23:22', '1542716295315771393', '2022-07-12 16:23:22');
INSERT INTO `clinicmng_other_settins` VALUES ('1546772216320942081', '10', '露剂', 17, b'0', '1542716295315771393', '2022-07-12 16:23:29', '1542716295315771393', '2022-07-12 16:23:29');
INSERT INTO `clinicmng_other_settins` VALUES ('1546772243797827585', '10', '酊剂', 18, b'0', '1542716295315771393', '2022-07-12 16:23:35', '1542716295315771393', '2022-07-12 16:23:35');
INSERT INTO `clinicmng_other_settins` VALUES ('1546772271014666242', '10', '酒剂', 19, b'0', '1542716295315771393', '2022-07-12 16:23:42', '1542716295315771393', '2022-07-12 16:23:42');
INSERT INTO `clinicmng_other_settins` VALUES ('1546772299166834690', '10', '胶剂', 20, b'0', '1542716295315771393', '2022-07-12 16:23:48', '1542716295315771393', '2022-07-12 16:23:48');
INSERT INTO `clinicmng_other_settins` VALUES ('1546772328472436737', '10', '合剂', 21, b'0', '1542716295315771393', '2022-07-12 16:23:55', '1542716295315771393', '2022-07-12 16:23:55');
INSERT INTO `clinicmng_other_settins` VALUES ('1546772361200590849', '10', '糖浆剂', 22, b'0', '1542716295315771393', '2022-07-12 16:24:03', '1542716295315771393', '2022-07-12 16:24:03');
INSERT INTO `clinicmng_other_settins` VALUES ('1546772392397824001', '10', '喷雾剂', 23, b'0', '1542716295315771393', '2022-07-12 16:24:11', '1542716295315771393', '2022-07-12 16:24:11');
INSERT INTO `clinicmng_other_settins` VALUES ('1546772417060331522', '10', '软胶囊剂', 24, b'0', '1542716295315771393', '2022-07-12 16:24:17', '1542716295315771393', '2022-07-12 16:24:17');
INSERT INTO `clinicmng_other_settins` VALUES ('1546772447578087425', '10', '硬胶囊剂', 25, b'0', '1542716295315771393', '2022-07-12 16:24:24', '1542716295315771393', '2022-07-12 16:24:24');
INSERT INTO `clinicmng_other_settins` VALUES ('1546772472546779138', '10', '锭剂', 26, b'0', '1542716295315771393', '2022-07-12 16:24:30', '1542716295315771393', '2022-07-12 16:24:30');
INSERT INTO `clinicmng_other_settins` VALUES ('1546772498907979777', '10', '颗粒剂（冲剂）', 27, b'0', '1542716295315771393', '2022-07-12 16:24:36', '1542716295315771393', '2022-07-12 16:24:36');
INSERT INTO `clinicmng_other_settins` VALUES ('1546772520902909954', '10', '片剂', 28, b'0', '1542716295315771393', '2022-07-12 16:24:41', '1542716295315771393', '2022-07-12 16:24:41');
INSERT INTO `clinicmng_other_settins` VALUES ('1546772545800298497', '10', '丹剂', 29, b'0', '1542716295315771393', '2022-07-12 16:24:47', '1542716295315771393', '2022-07-12 16:24:47');
INSERT INTO `clinicmng_other_settins` VALUES ('1546772568961245185', '10', '膏剂', 30, b'0', '1542716295315771393', '2022-07-12 16:24:53', '1542716295315771393', '2022-07-12 16:24:53');
INSERT INTO `clinicmng_other_settins` VALUES ('1546772592893943809', '10', '散剂', 31, b'0', '1542716295315771393', '2022-07-12 16:24:58', '1542716295315771393', '2022-07-12 16:24:58');
INSERT INTO `clinicmng_other_settins` VALUES ('1546772634912481282', '10', '丸剂', 32, b'0', '1542716295315771393', '2022-07-12 16:25:08', '1542716295315771393', '2022-07-12 16:25:08');

-- ----------------------------
-- Table structure for clinicmng_pay_item
-- ----------------------------
DROP TABLE IF EXISTS `clinicmng_pay_item`;
CREATE TABLE `clinicmng_pay_item`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '收费项目Id',
  `pay_item` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收费项目',
  `initials` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收费项目首字母',
  `pay_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '收费金额',
  `pay_node` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收费节点 0-开处方前 1-开处方后',
  `pay_item_status` bit(1) NULL DEFAULT b'0' COMMENT '收费项目状态  0-启用 1-禁用',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除：0否、1是',
  `created_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '收费项目表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of clinicmng_pay_item
-- ----------------------------

-- ----------------------------
-- Table structure for clinicmng_store
-- ----------------------------
DROP TABLE IF EXISTS `clinicmng_store`;
CREATE TABLE `clinicmng_store`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID主键(仓库编码)',
  `store_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '仓库名称',
  `store_principal_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '仓库负责人id',
  `store_principal_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '仓库负责人姓名',
  `store_status` bit(1) NULL DEFAULT b'0' COMMENT '仓库状态 0-启用 1-停用',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除。0否、1是',
  `created_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '仓库表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of clinicmng_store
-- ----------------------------

-- ----------------------------
-- Table structure for drug_info
-- ----------------------------
DROP TABLE IF EXISTS `drug_info`;
CREATE TABLE `drug_info`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id主键',
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '药品编码',
  `type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '药品基本类别编码',
  `seqno` int(6) NOT NULL COMMENT '药品序号编码',
  `spec` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '药品规格',
  `detachable` bit(1) NULL DEFAULT NULL COMMENT '是否允许拆零：0-否、1-是',
  `base_unit` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包装单位,旧基本单位',
  `measure_unit` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '基本单位,旧计量单位',
  `detachable_unit` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最小单位,旧拆零单位',
  `base_convert_measure` int(10) NULL DEFAULT NULL COMMENT '包装单位与基本单位的换算关系,旧基本单位与计量单位的换算关系',
  `measure_convert_detachable` int(10) NULL DEFAULT NULL COMMENT '基本单位与最小单位的换算关系,旧计量单位与拆零单位的换算关系',
  `name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '药品名称',
  `common_name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药品通用名称',
  `brand_name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药品品牌名称',
  `initials` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药品名称首字母',
  `brand_initials` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药品品牌名称首字母',
  `common_initials` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药品通用名称首字母',
  `template_type` tinyint(3) NULL DEFAULT NULL COMMENT '模板类型(1:中药模板；2:西药模板)',
  `producer` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '生产厂商',
  `dosage_form` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药品剂型',
  `permission_no` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '批准文号',
  `bar_code` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药品条码',
  `otc_flag` bit(1) NULL DEFAULT NULL COMMENT '是否OTC药品:0-否、1-是',
  `illustrate` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药品用法',
  `special_require` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '特殊用法',
  `use_frequency` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用药频率',
  `dosage` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用药剂量',
  `unit` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用量单位',
  `days` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开药天数',
  `base_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '药品基本价格',
  `sell_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '药品销售价',
  `detachable_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '药品拆零价',
  `retail_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '药品零售价',
  `alert_stock` int(10) NULL DEFAULT NULL COMMENT '警戒库存数',
  `alert_stock_unit` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预警数量单位,为空是默认为包装单位',
  `alert_date` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '效期预警时间',
  `enable` bit(1) NULL DEFAULT b'1' COMMENT '是否启用:0-否、1-是',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除：0-否、1-是',
  `created_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `updated_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '药品信息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of drug_info
-- ----------------------------

-- ----------------------------
-- Table structure for drug_item_info
-- ----------------------------
DROP TABLE IF EXISTS `drug_item_info`;
CREATE TABLE `drug_item_info`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id主键',
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目编码',
  `seqno` int(6) NULL DEFAULT NULL COMMENT '项目编码序列号',
  `type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目基本类别编码',
  `content` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目内容',
  `initials` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目名称首字母',
  `unit` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '单价',
  `enable` bit(1) NULL DEFAULT b'1' COMMENT '是否启用:0-否、1-是',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除：0-否、1-是',
  `created_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `updated_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目信息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of drug_item_info
-- ----------------------------

-- ----------------------------
-- Table structure for drug_type_dict
-- ----------------------------
DROP TABLE IF EXISTS `drug_type_dict`;
CREATE TABLE `drug_type_dict`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id主键',
  `type_code` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '基本类型编码',
  `type_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '基本类型名称',
  `type_belongs` tinyint(3) NULL DEFAULT NULL COMMENT '类型所属(1:药品类型；2：项目类型)',
  `template_type` tinyint(3) NULL DEFAULT NULL COMMENT '模板类型(1:中药模板；2:西药模板)',
  `note` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `enable` bit(1) NULL DEFAULT b'1' COMMENT '是否启用:0-否、1-是',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除：0-否、1-是',
  `created_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `updated_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '药品基本类型字典表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of drug_type_dict
-- ----------------------------

-- ----------------------------
-- Table structure for medrecord_case_template
-- ----------------------------
DROP TABLE IF EXISTS `medrecord_case_template`;
CREATE TABLE `medrecord_case_template`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID主键',
  `doctor_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医生id',
  `type_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板分类id',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板名称',
  `chief_complaint` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主诉',
  `present_illness` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '现病史',
  `past_history` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '既往史',
  `dental_check` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '口腔检查',
  `diag` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '诊断',
  `diagnosis_plan` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '诊疗计划',
  `treatment` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '治疗',
  `advice` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医嘱',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除：0否、1是',
  `created_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '病历模板' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of medrecord_case_template
-- ----------------------------

-- ----------------------------
-- Table structure for medrecord_complaint_tag
-- ----------------------------
DROP TABLE IF EXISTS `medrecord_complaint_tag`;
CREATE TABLE `medrecord_complaint_tag`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID主键',
  `type_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主诉分类id',
  `tag` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述标签',
  `common_use` bit(1) NULL DEFAULT b'0' COMMENT '是否常用',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序号',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除：0否、1是',
  `created_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '主诉标签表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of medrecord_complaint_tag
-- ----------------------------
INSERT INTO `medrecord_complaint_tag` VALUES ('1447829729011867650', '1', '高烧', b'1', 1, b'0', '1442403455200149506', '2021-10-12 15:41:21', '1442403455200149506', '2021-10-12 15:41:21');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447829792278749186', '1', '寒战', b'0', 2, b'0', '1442403455200149506', '2021-10-12 15:41:37', '1442403455200149506', '2021-10-12 15:44:38');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447829997770285058', '1', '发热', b'1', 3, b'0', '1442403455200149506', '2021-10-12 15:42:26', '1442403455200149506', '2021-10-12 15:42:26');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447830077449478146', '1', '肌肉关节痛疼', b'0', 4, b'0', '1442403455200149506', '2021-10-12 15:42:45', '1442403455200149506', '2021-10-12 15:42:45');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447830532384661505', '1', '体温≥38°C', b'1', 5, b'0', '1442403455200149506', '2021-10-12 15:44:33', '1442403455200149506', '2021-10-12 15:44:33');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447830635698757633', '1', '食欲不振', b'0', 6, b'0', '1442403455200149506', '2021-10-12 15:44:58', '1442403455200149506', '2021-10-12 15:44:58');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447830695568252930', '1', '体重减轻', b'0', 7, b'0', '1442403455200149506', '2021-10-12 15:45:12', '1442403455200149506', '2021-10-12 15:45:12');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447830739843325953', '1', '四肢无力', b'0', 8, b'0', '1442403455200149506', '2021-10-12 15:45:22', '1442403455200149506', '2021-10-12 15:45:22');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447830829987307522', '1', '风热感冒', b'0', 9, b'0', '1442403455200149506', '2021-10-12 15:45:44', '1442403455200149506', '2021-10-12 15:45:44');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447830895691079682', '1', '流行性感冒', b'0', 10, b'0', '1442403455200149506', '2021-10-12 15:46:00', '1442403455200149506', '2021-10-12 15:46:00');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447830942285602817', '1', '风寒感冒', b'0', 11, b'0', '1442403455200149506', '2021-10-12 15:46:11', '1442403455200149506', '2021-10-12 15:46:11');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447830996786388993', '1', '乏力', b'0', 12, b'0', '1442403455200149506', '2021-10-12 15:46:24', '1442403455200149506', '2021-10-12 15:46:24');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447831148964126721', '1447831099538448386', '鼻塞', b'0', 1, b'0', '1442403455200149506', '2021-10-12 15:47:00', '1442403455200149506', '2021-10-12 15:47:00');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447831219009003522', '1447831099538448386', '流涕', b'1', 2, b'0', '1442403455200149506', '2021-10-12 15:47:17', '1442403455200149506', '2021-10-12 15:47:17');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447831282108112898', '1447831099538448386', '咳嗽', b'1', 3, b'0', '1442403455200149506', '2021-10-12 15:47:32', '1442403455200149506', '2021-10-12 15:47:32');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447831368594661377', '1447831099538448386', '咳痰', b'1', 4, b'0', '1442403455200149506', '2021-10-12 15:47:52', '1442403455200149506', '2021-10-12 15:47:52');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447831445685968898', '1447831099538448386', '胸痛', b'0', 5, b'0', '1442403455200149506', '2021-10-12 15:48:11', '1442403455200149506', '2021-10-12 15:48:11');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447831494570582017', '1447831099538448386', '咳血', b'1', 6, b'0', '1442403455200149506', '2021-10-12 15:48:22', '1442403455200149506', '2021-10-12 15:48:22');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447831657141805058', '1447831099538448386', '呼吸困难', b'1', 7, b'0', '1442403455200149506', '2021-10-12 15:49:01', '1442403455200149506', '2021-10-12 15:49:01');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447831747659079681', '1447831099538448386', '喘息', b'0', 8, b'0', '1442403455200149506', '2021-10-12 15:49:23', '1442403455200149506', '2021-10-12 15:49:23');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447831800775745538', '1447831099538448386', '发绀', b'0', 9, b'0', '1442403455200149506', '2021-10-12 15:49:35', '1442403455200149506', '2021-10-12 15:49:35');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447831860682989569', '1447831099538448386', '风寒感冒', b'0', 10, b'0', '1442403455200149506', '2021-10-12 15:49:50', '1442403455200149506', '2021-10-12 15:49:50');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447832009182322690', '1447831934783758337', '胸痛', b'0', 1, b'0', '1442403455200149506', '2021-10-12 15:50:25', '1442403455200149506', '2021-10-12 15:50:25');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447832066803671041', '1447831934783758337', '呼吸困难', b'0', 2, b'0', '1442403455200149506', '2021-10-12 15:50:39', '1442403455200149506', '2021-10-12 15:50:39');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447832138614349826', '1447831934783758337', '心悸', b'1', 3, b'0', '1442403455200149506', '2021-10-12 15:50:56', '1442403455200149506', '2021-10-12 15:50:56');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447832180758716418', '1447831934783758337', '昏厥', b'1', 4, b'0', '1442403455200149506', '2021-10-12 15:51:06', '1442403455200149506', '2021-10-12 15:51:06');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447832247901134850', '1447831934783758337', '水肿', b'1', 5, b'0', '1442403455200149506', '2021-10-12 15:51:22', '1442403455200149506', '2021-10-12 15:51:22');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447832408928854018', '1447831934783758337', '紫绀', b'0', 6, b'0', '1442403455200149506', '2021-10-12 15:52:00', '1442403455200149506', '2021-10-12 15:52:00');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447832492374532098', '1447832454411886594', '恶心', b'1', 1, b'0', '1442403455200149506', '2021-10-12 15:52:20', '1442403455200149506', '2021-10-12 15:52:20');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447832536842543105', '1447832454411886594', '呕吐', b'0', 2, b'0', '1442403455200149506', '2021-10-12 15:52:31', '1442403455200149506', '2021-10-12 15:52:31');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447832592274464770', '1447832454411886594', '呕血', b'1', 3, b'0', '1442403455200149506', '2021-10-12 15:52:44', '1442403455200149506', '2021-10-12 15:52:44');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447832639036760065', '1447832454411886594', '便血', b'0', 4, b'0', '1442403455200149506', '2021-10-12 15:52:55', '1442403455200149506', '2021-10-12 15:52:55');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447832684599484418', '1447832454411886594', '腹痛', b'1', 5, b'0', '1442403455200149506', '2021-10-12 15:53:06', '1442403455200149506', '2021-10-12 15:53:06');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447832735677718529', '1447832454411886594', '腹泻', b'0', 6, b'0', '1442403455200149506', '2021-10-12 15:53:18', '1442403455200149506', '2021-10-12 15:53:18');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447832766132559874', '1447832454411886594', '便秘', b'1', 7, b'0', '1442403455200149506', '2021-10-12 15:53:26', '1442403455200149506', '2021-10-12 15:53:26');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447832803361202177', '1447832454411886594', '黄疸', b'0', 8, b'0', '1442403455200149506', '2021-10-12 15:53:34', '1442403455200149506', '2021-10-12 15:53:34');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447832836919828482', '1447832454411886594', '食欲差', b'0', 9, b'0', '1442403455200149506', '2021-10-12 15:53:42', '1442403455200149506', '2021-10-12 15:53:42');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447832898601263106', '1447832454411886594', '米泔水样便', b'0', 10, b'0', '1442403455200149506', '2021-10-12 15:53:57', '1442403455200149506', '2021-10-12 15:53:57');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447832981413601282', '1447832454411886594', '水样便', b'0', 11, b'0', '1442403455200149506', '2021-10-12 15:54:17', '1442403455200149506', '2021-10-12 15:54:17');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447833030373711873', '1447832454411886594', '黑便', b'0', 12, b'0', '1442403455200149506', '2021-10-12 15:54:29', '1442403455200149506', '2021-10-12 15:54:29');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447833114729553922', '1447832454411886594', '脓血便', b'0', 13, b'0', '1442403455200149506', '2021-10-12 15:54:49', '1442403455200149506', '2021-10-12 15:54:49');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447834186323894273', '1447832454411886594', '粘尿便', b'0', 14, b'0', '1442403455200149506', '2021-10-12 15:59:04', '1442403455200149506', '2021-10-12 15:59:04');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447834221996449794', '1447832454411886594', '稀便', b'0', 15, b'0', '1442403455200149506', '2021-10-12 15:59:13', '1442403455200149506', '2021-10-12 15:59:13');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447834546245509121', '1447834282818052098', '尿频', b'0', 1, b'0', '1442403455200149506', '2021-10-12 16:00:30', '1442403455200149506', '2021-10-12 16:00:30');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447834608405094402', '1447834282818052098', '尿急', b'0', 2, b'0', '1442403455200149506', '2021-10-12 16:00:45', '1442403455200149506', '2021-10-12 16:00:45');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447834649756737538', '1447834282818052098', '尿痛', b'0', 3, b'0', '1442403455200149506', '2021-10-12 16:00:55', '1442403455200149506', '2021-10-12 16:00:55');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447834711543029762', '1447834282818052098', '血尿', b'0', 4, b'0', '1442403455200149506', '2021-10-12 16:01:09', '1442403455200149506', '2021-10-12 16:01:09');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447834936907177985', '1447834282818052098', '少尿', b'0', 5, b'0', '1442403455200149506', '2021-10-12 16:02:03', '1442403455200149506', '2021-10-12 16:02:03');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447834977436737538', '1447834282818052098', '遗尿', b'0', 6, b'0', '1442403455200149506', '2021-10-12 16:02:13', '1442403455200149506', '2021-10-12 16:02:13');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447835103026782209', '1447834282818052098', '排尿困难', b'0', 7, b'0', '1442403455200149506', '2021-10-12 16:02:43', '1442403455200149506', '2021-10-12 16:02:43');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447835168445341698', '1447834282818052098', '颜面浮肿', b'0', 8, b'0', '1442403455200149506', '2021-10-12 16:02:58', '1442403455200149506', '2021-10-12 16:02:58');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447835200846340098', '1447834282818052098', '腰痛', b'0', 9, b'0', '1442403455200149506', '2021-10-12 16:03:06', '1442403455200149506', '2021-10-12 16:03:06');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447835262154481666', '1447834282818052098', '尿道红肿', b'0', 10, b'0', '1442403455200149506', '2021-10-12 16:03:21', '1442403455200149506', '2021-10-12 16:03:21');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447835332732035073', '1447834282818052098', '下腹部疼痛', b'0', 11, b'0', '1442403455200149506', '2021-10-12 16:03:37', '1442403455200149506', '2021-10-12 16:03:37');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447835535136563202', '1447835482477076482', '失眠', b'0', 1, b'0', '1442403455200149506', '2021-10-12 16:04:26', '1442403455200149506', '2021-10-12 16:04:26');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447835616522838018', '1447835482477076482', '多梦', b'0', 2, b'0', '1442403455200149506', '2021-10-12 16:04:45', '1442403455200149506', '2021-10-12 16:04:45');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447835682138529793', '1447835482477076482', '精神抑郁', b'0', 3, b'0', '1442403455200149506', '2021-10-12 16:05:01', '1442403455200149506', '2021-10-12 16:05:01');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447835742414872578', '1447835482477076482', '意识障碍', b'0', 4, b'0', '1442403455200149506', '2021-10-12 16:05:15', '1442403455200149506', '2021-10-12 16:05:15');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447835787725938690', '1447835482477076482', '嗜睡', b'0', 5, b'0', '1442403455200149506', '2021-10-12 16:05:26', '1442403455200149506', '2021-10-12 16:05:26');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447835821511057409', '1447835482477076482', '抽搐', b'0', 6, b'0', '1442403455200149506', '2021-10-12 16:05:34', '1442403455200149506', '2021-10-12 16:05:34');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447835862548127746', '1447835482477076482', '焦虑', b'0', 7, b'0', '1442403455200149506', '2021-10-12 16:05:44', '1442403455200149506', '2021-10-12 16:05:44');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447836082480652289', '1447836005179629569', '外阴红肿', b'0', 1, b'0', '1442403455200149506', '2021-10-12 16:06:36', '1442403455200149506', '2021-10-12 16:06:36');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447836151414038529', '1447836005179629569', '外阴瘙痒', b'0', 2, b'0', '1442403455200149506', '2021-10-12 16:06:53', '1442403455200149506', '2021-10-12 16:06:53');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447836237820895234', '1447836005179629569', '外阴灼热疼痛', b'0', 3, b'0', '1442403455200149506', '2021-10-12 16:07:13', '1442403455200149506', '2021-10-12 16:07:13');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447836274755936258', '1447836005179629569', '白带增多', b'0', 4, b'0', '1442403455200149506', '2021-10-12 16:07:22', '1442403455200149506', '2021-10-12 16:07:22');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447836314383720450', '1447836005179629569', '白带异味', b'0', 5, b'0', '1442403455200149506', '2021-10-12 16:07:32', '1442403455200149506', '2021-10-12 16:07:32');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447836351671083010', '1447836005179629569', '脓性白带', b'0', 6, b'0', '1442403455200149506', '2021-10-12 16:07:40', '1442403455200149506', '2021-10-12 16:07:40');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447836390418063362', '1447836005179629569', '血性白带', b'0', 7, b'0', '1442403455200149506', '2021-10-12 16:07:50', '1442403455200149506', '2021-10-12 16:07:50');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447836432407240706', '1447836005179629569', '白带发黄', b'0', 8, b'0', '1442403455200149506', '2021-10-12 16:08:00', '1442403455200149506', '2021-10-12 16:08:00');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447836473347842050', '1447836005179629569', '豆渣样白带', b'0', 9, b'0', '1442403455200149506', '2021-10-12 16:08:09', '1442403455200149506', '2021-10-12 16:08:09');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447836519686512641', '1447836005179629569', '泡沫样白带', b'0', 10, b'0', '1442403455200149506', '2021-10-12 16:08:20', '1442403455200149506', '2021-10-12 16:08:20');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447836564318101505', '1447836005179629569', '下腹疼痛', b'0', 11, b'0', '1442403455200149506', '2021-10-12 16:08:31', '1442403455200149506', '2021-10-12 16:08:31');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447836606068203521', '1447836005179629569', '腰酸背痛', b'0', 12, b'0', '1442403455200149506', '2021-10-12 16:08:41', '1442403455200149506', '2021-10-12 16:08:41');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447836648762023937', '1447836005179629569', '阴道异常出血', b'0', 13, b'0', '1442403455200149506', '2021-10-12 16:08:51', '1442403455200149506', '2021-10-12 16:08:51');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447836683306311681', '1447836005179629569', '尿频尿急尿痛', b'0', 14, b'0', '1442403455200149506', '2021-10-12 16:08:59', '1442403455200149506', '2021-10-12 16:08:59');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447836714469990401', '1447836005179629569', '月经紊乱', b'0', 15, b'0', '1442403455200149506', '2021-10-12 16:09:07', '1442403455200149506', '2021-10-12 16:09:07');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447836746761936898', '1447836005179629569', '腹部肿块', b'0', 16, b'0', '1442403455200149506', '2021-10-12 16:09:15', '1442403455200149506', '2021-10-12 16:09:15');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447836954778451969', '1447836005179629569', '腹部包块', b'0', 17, b'0', '1442403455200149506', '2021-10-12 16:10:04', '1442403455200149506', '2021-10-12 16:10:04');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447837021174284290', '1447836005179629569', '便秘', b'0', 18, b'0', '1442403455200149506', '2021-10-12 16:10:20', '1442403455200149506', '2021-10-12 16:10:20');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447837058897854466', '1447836005179629569', '贫血', b'0', 19, b'0', '1442403455200149506', '2021-10-12 16:10:29', '1442403455200149506', '2021-10-12 16:10:29');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447837101033832450', '1447836005179629569', '不孕', b'0', 20, b'0', '1442403455200149506', '2021-10-12 16:10:39', '1442403455200149506', '2021-10-12 16:10:39');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447837134185611265', '1447836005179629569', '小腹胀痛', b'0', 21, b'0', '1442403455200149506', '2021-10-12 16:10:47', '1442403455200149506', '2021-10-12 16:10:47');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447837172831928321', '1447836005179629569', '经期腹痛', b'0', 22, b'0', '1442403455200149506', '2021-10-12 16:10:56', '1442403455200149506', '2021-10-12 16:10:56');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447837334593650689', '1447837267635781634', '性欲改变', b'0', 1, b'0', '1442403455200149506', '2021-10-12 16:11:35', '1442403455200149506', '2021-10-12 16:11:35');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447837376243089410', '1447837267635781634', '阳痿', b'1', 2, b'0', '1442403455200149506', '2021-10-12 16:11:45', '1442403455200149506', '2021-10-12 16:11:45');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447837409923350530', '1447837267635781634', '早泄', b'0', 3, b'0', '1442403455200149506', '2021-10-12 16:11:53', '1442403455200149506', '2021-10-12 16:11:53');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447837484762316802', '1447837267635781634', '尿频尿急尿痛', b'0', 4, b'0', '1442403455200149506', '2021-10-12 16:12:11', '1442403455200149506', '2021-10-12 16:12:11');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447837521366007810', '1447837267635781634', '尿道口分泌物', b'0', 5, b'0', '1442403455200149506', '2021-10-12 16:12:19', '1442403455200149506', '2021-10-12 16:12:19');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447837564647030785', '1447837267635781634', '龟头包皮红肿', b'0', 6, b'0', '1442403455200149506', '2021-10-12 16:12:30', '1442403455200149506', '2021-10-12 16:12:30');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447837601980530689', '1447837267635781634', '阴部赘生物', b'0', 7, b'0', '1442403455200149506', '2021-10-12 16:12:38', '1442403455200149506', '2021-10-12 16:12:38');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447837646305935361', '1447837267635781634', '龟头包皮溃疡', b'0', 8, b'0', '1442403455200149506', '2021-10-12 16:12:49', '1442403455200149506', '2021-10-12 16:12:49');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447837680359489538', '1447837267635781634', '生殖器脓疱', b'0', 9, b'0', '1442403455200149506', '2021-10-12 16:12:57', '1442403455200149506', '2021-10-12 16:12:57');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447837748202356737', '1447837267635781634', '腹股沟淋巴结肿大', b'0', 10, b'0', '1442403455200149506', '2021-10-12 16:13:13', '1442403455200149506', '2021-10-12 16:13:13');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447837789910515714', '1447837267635781634', '周身皮疹', b'0', 11, b'0', '1442403455200149506', '2021-10-12 16:13:23', '1442403455200149506', '2021-10-12 16:13:23');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447837834273669121', '1447837267635781634', '外阴部瘙痒', b'0', 12, b'0', '1442403455200149506', '2021-10-12 16:13:34', '1442403455200149506', '2021-10-12 16:13:34');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447837877504360449', '1447837267635781634', '生殖器部疼痛', b'0', 13, b'0', '1442403455200149506', '2021-10-12 16:13:44', '1442403455200149506', '2021-10-12 16:13:44');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447837917610295297', '1447837267635781634', '不育', b'0', 14, b'0', '1442403455200149506', '2021-10-12 16:13:54', '1442403455200149506', '2021-10-12 16:13:54');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447837954528559105', '1447837267635781634', '遗精', b'0', 15, b'0', '1442403455200149506', '2021-10-12 16:14:03', '1442403455200149506', '2021-10-12 16:14:03');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447837990406635522', '1447837267635781634', '尿滴沥不净', b'0', 16, b'0', '1442403455200149506', '2021-10-12 16:14:11', '1442403455200149506', '2021-10-12 16:14:11');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447838026687365122', '1447837267635781634', '尿流变细', b'0', 17, b'0', '1442403455200149506', '2021-10-12 16:14:20', '1442403455200149506', '2021-10-12 16:14:20');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447838065035886593', '1447837267635781634', '夜尿次数多', b'0', 18, b'0', '1442403455200149506', '2021-10-12 16:14:29', '1442403455200149506', '2021-10-12 16:14:29');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447838107306082306', '1447837267635781634', '尿无力', b'0', 19, b'0', '1442403455200149506', '2021-10-12 16:14:39', '1442403455200149506', '2021-10-12 16:14:39');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447838144639582209', '1447837267635781634', '小腹疼痛', b'0', 20, b'0', '1442403455200149506', '2021-10-12 16:14:48', '1442403455200149506', '2021-10-12 16:14:48');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447838184389001217', '1447837267635781634', '会阴部坠胀不适', b'0', 21, b'0', '1442403455200149506', '2021-10-12 16:14:57', '1442403455200149506', '2021-10-12 16:14:57');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447838219843452930', '1447837267635781634', '阴囊潮湿', b'0', 22, b'0', '1442403455200149506', '2021-10-12 16:15:06', '1442403455200149506', '2021-10-12 16:15:06');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447838349896237058', '1447837267635781634', '睾丸肿痛', b'0', 23, b'0', '1442403455200149506', '2021-10-12 16:15:37', '1442403455200149506', '2021-10-12 16:15:37');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447838402211790850', '1447837267635781634', '射精痛', b'0', 24, b'0', '1442403455200149506', '2021-10-12 16:15:49', '1442403455200149506', '2021-10-12 16:15:49');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447838435556507649', '1447837267635781634', '下腹部疼痛', b'0', 25, b'0', '1442403455200149506', '2021-10-12 16:15:57', '1442403455200149506', '2021-10-12 16:16:55');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447838727039635458', '1447837267635781634', '包皮过长', b'0', 26, b'0', '1442403455200149506', '2021-10-12 16:17:07', '1442403455200149506', '2021-10-12 16:17:07');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447838759637766145', '1447837267635781634', '龟头红疹', b'0', 27, b'0', '1442403455200149506', '2021-10-12 16:17:14', '1442403455200149506', '2021-10-12 16:17:14');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447838792797933570', '1447837267635781634', '阴茎发痒', b'0', 28, b'0', '1442403455200149506', '2021-10-12 16:17:22', '1442403455200149506', '2021-10-12 16:17:22');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447838835122655234', '1447837267635781634', '阴茎包皮垢多', b'0', 29, b'0', '1442403455200149506', '2021-10-12 16:17:32', '1442403455200149506', '2021-10-12 16:17:32');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447838920543850498', '1447837267635781634', '阴茎有异味', b'0', 30, b'0', '1442403455200149506', '2021-10-12 16:17:53', '1442403455200149506', '2021-10-12 16:17:53');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447838963212505089', '1447837267635781634', '阴茎包皮皲裂', b'0', 31, b'0', '1442403455200149506', '2021-10-12 16:18:03', '1442403455200149506', '2021-10-12 16:18:03');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447839014374625281', '1447837267635781634', '包皮嵌顿', b'0', 32, b'0', '1442403455200149506', '2021-10-12 16:18:15', '1442403455200149506', '2021-10-12 16:18:15');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447839050198175746', '1447837267635781634', '龟头糜烂', b'0', 33, b'0', '1442403455200149506', '2021-10-12 16:18:24', '1442403455200149506', '2021-10-12 16:18:24');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447839085208031233', '1447837267635781634', '龟头溃疡', b'0', 34, b'0', '1442403455200149506', '2021-10-12 16:18:32', '1442403455200149506', '2021-10-12 16:18:32');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447839113280507905', '1447837267635781634', '患侧阴囊肿大', b'0', 35, b'0', '1442403455200149506', '2021-10-12 16:18:39', '1442403455200149506', '2021-10-12 16:18:39');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447839149439602690', '1447837267635781634', '阴囊坠胀', b'0', 36, b'0', '1442403455200149506', '2021-10-12 16:18:47', '1442403455200149506', '2021-10-12 16:18:47');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447839183379910657', '1447837267635781634', '外阴部/阴茎赘生物', b'0', 37, b'0', '1442403455200149506', '2021-10-12 16:18:56', '1442403455200149506', '2021-10-12 16:18:56');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447839533352636418', '1447839485294301185', '外伤', b'0', 1, b'0', '1442403455200149506', '2021-10-12 16:20:19', '1442403455200149506', '2021-10-12 16:20:19');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447839571252367361', '1447839485294301185', '疼痛', b'0', 2, b'0', '1442403455200149506', '2021-10-12 16:20:28', '1442403455200149506', '2021-10-12 16:20:28');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447839606748762114', '1447839485294301185', '红肿热痛', b'0', 3, b'0', '1442403455200149506', '2021-10-12 16:20:36', '1442403455200149506', '2021-10-12 16:20:36');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447839658212872193', '1447839485294301185', '皮肤破损', b'0', 4, b'0', '1442403455200149506', '2021-10-12 16:20:49', '1442403455200149506', '2021-10-12 16:20:49');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447839690773254146', '1447839485294301185', '肿块', b'0', 5, b'0', '1442403455200149506', '2021-10-12 16:20:57', '1442403455200149506', '2021-10-12 16:20:57');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447839722205368321', '1447839485294301185', '肿大', b'0', 6, b'0', '1442403455200149506', '2021-10-12 16:21:04', '1442403455200149506', '2021-10-12 16:21:04');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447839757928255489', '1447839485294301185', '活动障碍', b'0', 7, b'0', '1442403455200149506', '2021-10-12 16:21:13', '1442403455200149506', '2021-10-12 16:21:13');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447839793818914818', '1447839485294301185', '活动受限', b'0', 8, b'0', '1442403455200149506', '2021-10-12 16:21:21', '1442403455200149506', '2021-10-12 16:21:21');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447839834738544641', '1447839485294301185', '出血', b'0', 9, b'0', '1442403455200149506', '2021-10-12 16:21:31', '1442403455200149506', '2021-10-12 16:21:31');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447839872051073026', '1447839485294301185', '瘙痒', b'0', 10, b'0', '1442403455200149506', '2021-10-12 16:21:40', '1442403455200149506', '2021-10-12 16:21:40');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447839905102188545', '1447839485294301185', '流脓', b'0', 11, b'0', '1442403455200149506', '2021-10-12 16:21:48', '1442403455200149506', '2021-10-12 16:21:48');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447839934198075394', '1447839485294301185', '破溃', b'0', 12, b'0', '1442403455200149506', '2021-10-12 16:21:55', '1442403455200149506', '2021-10-12 16:21:55');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447839969623166978', '1447839485294301185', '畸形', b'0', 13, b'0', '1442403455200149506', '2021-10-12 16:22:03', '1442403455200149506', '2021-10-12 16:22:03');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447840349421588481', '1447840239425966081', '听力减退', b'0', 1, b'0', '1442403455200149506', '2021-10-12 16:23:34', '1442403455200149506', '2021-10-12 16:23:34');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447840383064100865', '1447840239425966081', '耳鸣', b'0', 2, b'0', '1442403455200149506', '2021-10-12 16:23:42', '1442403455200149506', '2021-10-12 16:23:42');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447840415725146114', '1447840239425966081', '耳响', b'0', 3, b'0', '1442403455200149506', '2021-10-12 16:23:49', '1442403455200149506', '2021-10-12 16:23:49');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447840452525969409', '1447840239425966081', '耳痛', b'0', 4, b'0', '1442403455200149506', '2021-10-12 16:23:58', '1442403455200149506', '2021-10-12 16:23:58');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447840496306114561', '1447840239425966081', '外耳道发红', b'0', 5, b'0', '1442403455200149506', '2021-10-12 16:24:09', '1442403455200149506', '2021-10-12 16:24:09');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447840527545290754', '1447840239425966081', '外耳道分泌物', b'0', 6, b'0', '1442403455200149506', '2021-10-12 16:24:16', '1442403455200149506', '2021-10-12 16:24:16');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447840620734337026', '1447840239425966081', '外耳道流脓', b'1', 7, b'0', '1442403455200149506', '2021-10-12 16:24:38', '1442403455200149506', '2021-10-12 16:24:38');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447840665730830338', '1447840239425966081', '耳周红肿', b'0', 8, b'0', '1442403455200149506', '2021-10-12 16:24:49', '1442403455200149506', '2021-10-12 16:24:49');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447840702334521346', '1447840239425966081', '耳廊红肿', b'0', 9, b'0', '1442403455200149506', '2021-10-12 16:24:58', '1442403455200149506', '2021-10-12 16:24:58');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447840832827707394', '1447840239425966081', '耳痒', b'0', 10, b'0', '1442403455200149506', '2021-10-12 16:25:29', '1442403455200149506', '2021-10-12 16:25:29');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447840874984656897', '1447840239425966081', '耳内肿闷感', b'0', 11, b'0', '1442403455200149506', '2021-10-12 16:25:39', '1442403455200149506', '2021-10-12 16:25:39');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447840906550988802', '1447840239425966081', '耳聋', b'0', 12, b'0', '1442403455200149506', '2021-10-12 16:25:46', '1442403455200149506', '2021-10-12 16:25:46');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447840936812892162', '1447840239425966081', '眩晕', b'0', 13, b'0', '1442403455200149506', '2021-10-12 16:25:54', '1442403455200149506', '2021-10-12 16:25:54');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447840977648635905', '1447840239425966081', '鼻塞', b'0', 14, b'0', '1442403455200149506', '2021-10-12 16:26:03', '1442403455200149506', '2021-10-12 16:26:03');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447841033877475329', '1447840239425966081', '鼻漏', b'0', 15, b'0', '1442403455200149506', '2021-10-12 16:26:17', '1442403455200149506', '2021-10-12 16:26:17');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447841064156155906', '1447840239425966081', '流鼻涕', b'0', 16, b'0', '1442403455200149506', '2021-10-12 16:26:24', '1442403455200149506', '2021-10-12 16:26:24');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447841093776330753', '1447840239425966081', '嗅觉障碍', b'0', 17, b'0', '1442403455200149506', '2021-10-12 16:26:31', '1442403455200149506', '2021-10-12 16:26:31');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447841123224539137', '1447840239425966081', '鼻出血', b'0', 18, b'0', '1442403455200149506', '2021-10-12 16:26:38', '1442403455200149506', '2021-10-12 16:26:38');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447841150802087938', '1447840239425966081', '鼻部疼痛', b'0', 19, b'0', '1442403455200149506', '2021-10-12 16:26:45', '1442403455200149506', '2021-10-12 16:26:45');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447841249385009154', '1447840239425966081', '鼻内长肉', b'0', 20, b'0', '1442403455200149506', '2021-10-12 16:27:08', '1442403455200149506', '2021-10-12 16:27:08');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447841286382964737', '1447840239425966081', '鼻内异物', b'0', 21, b'0', '1442403455200149506', '2021-10-12 16:27:17', '1442403455200149506', '2021-10-12 16:27:17');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447841332310593538', '1447840239425966081', '鼻干燥', b'0', 22, b'0', '1442403455200149506', '2021-10-12 16:27:28', '1442403455200149506', '2021-10-12 16:27:28');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447841364908724226', '1447840239425966081', '咽痛', b'0', 23, b'0', '1442403455200149506', '2021-10-12 16:27:36', '1442403455200149506', '2021-10-12 16:27:36');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447841393434185730', '1447840239425966081', '咽干燥', b'0', 24, b'0', '1442403455200149506', '2021-10-12 16:27:42', '1442403455200149506', '2021-10-12 16:27:42');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447841433791778817', '1447840239425966081', '咽部不适', b'0', 25, b'0', '1442403455200149506', '2021-10-12 16:27:52', '1442403455200149506', '2021-10-12 16:27:52');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447841467761446914', '1447840239425966081', '声音嘶哑', b'0', 26, b'0', '1442403455200149506', '2021-10-12 16:28:00', '1442403455200149506', '2021-10-12 16:28:00');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447841498828656641', '1447840239425966081', '痰中带血', b'0', 27, b'0', '1442403455200149506', '2021-10-12 16:28:08', '1442403455200149506', '2021-10-12 16:28:08');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447841571708882945', '1447840239425966081', '失语', b'0', 28, b'0', '1442403455200149506', '2021-10-12 16:28:25', '1442403455200149506', '2021-10-12 16:28:25');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447841612355883009', '1447840239425966081', '口干', b'0', 29, b'0', '1442403455200149506', '2021-10-12 16:28:35', '1442403455200149506', '2021-10-12 16:28:35');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447841661706063873', '1447840239425966081', '口臭', b'0', 30, b'0', '1442403455200149506', '2021-10-12 16:28:46', '1442403455200149506', '2021-10-12 16:28:46');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447841696602673154', '1447840239425966081', '牙龈肿痛', b'0', 31, b'0', '1442403455200149506', '2021-10-12 16:28:55', '1442403455200149506', '2021-10-12 16:28:55');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447841755197100033', '1447840239425966081', '口腔溃疡', b'1', 32, b'0', '1442403455200149506', '2021-10-12 16:29:09', '1442403455200149506', '2021-10-12 16:29:09');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447841960160153601', '1447840239425966081', '牙龈出血', b'0', 33, b'0', '1442403455200149506', '2021-10-12 16:29:58', '1442403455200149506', '2021-10-12 16:29:58');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447842000467415041', '1447840239425966081', '拔牙后疼痛', b'0', 34, b'0', '1442403455200149506', '2021-10-12 16:30:07', '1442403455200149506', '2021-10-12 16:30:07');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447842045979807745', '1447840239425966081', '唇干舌燥', b'0', 35, b'0', '1442403455200149506', '2021-10-12 16:30:18', '1442403455200149506', '2021-10-12 16:30:18');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447842080188551169', '1447840239425966081', '唇红干燥', b'1', 36, b'0', '1442403455200149506', '2021-10-12 16:30:26', '1442403455200149506', '2021-10-12 16:30:26');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447842117492690945', '1447840239425966081', '唇厚舌大', b'0', 37, b'0', '1442403455200149506', '2021-10-12 16:30:35', '1442403455200149506', '2021-10-12 16:30:35');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447842151542050817', '1447840239425966081', '唇角脱屑', b'0', 38, b'0', '1442403455200149506', '2021-10-12 16:30:43', '1442403455200149506', '2021-10-12 16:30:43');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447842187780837378', '1447840239425966081', '咀嚼疼痛', b'0', 39, b'0', '1442403455200149506', '2021-10-12 16:30:52', '1442403455200149506', '2021-10-12 16:30:52');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447842219372335106', '1447840239425966081', '牙移位', b'0', 40, b'0', '1442403455200149506', '2021-10-12 16:30:59', '1442403455200149506', '2021-10-12 16:30:59');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447842250976415746', '1447840239425966081', '牙脱位', b'0', 41, b'0', '1442403455200149506', '2021-10-12 16:31:07', '1442403455200149506', '2021-10-12 16:31:07');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447842281913602050', '1447840239425966081', '牙缝增宽', b'0', 42, b'0', '1442403455200149506', '2021-10-12 16:31:14', '1442403455200149506', '2021-10-12 16:31:14');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447842328885612545', '1447840239425966081', '牙齿松动', b'0', 43, b'0', '1442403455200149506', '2021-10-12 16:31:25', '1442403455200149506', '2021-10-12 16:31:25');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447842368928632833', '1447840239425966081', '眼痛', b'0', 44, b'0', '1442403455200149506', '2021-10-12 16:31:35', '1442403455200149506', '2021-10-12 16:31:35');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447842403703607298', '1447840239425966081', '眼内异物', b'0', 45, b'0', '1442403455200149506', '2021-10-12 16:31:43', '1442403455200149506', '2021-10-12 16:31:43');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447842442232483842', '1447840239425966081', '眼花', b'0', 46, b'0', '1442403455200149506', '2021-10-12 16:31:52', '1442403455200149506', '2021-10-12 16:31:52');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447842472020430850', '1447840239425966081', '迎风流泪', b'0', 47, b'0', '1442403455200149506', '2021-10-12 16:32:00', '1442403455200149506', '2021-10-12 16:32:00');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447842497890897922', '1447840239425966081', '眼球突出', b'0', 48, b'0', '1442403455200149506', '2021-10-12 16:32:06', '1442403455200149506', '2021-10-12 16:32:06');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447842526361833474', '1447840239425966081', '眼睛肿胀', b'0', 49, b'0', '1442403455200149506', '2021-10-12 16:32:13', '1442403455200149506', '2021-10-12 16:32:13');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447843442792091650', '1447843392875679746', '瘙痒', b'0', 1, b'0', '1442403455200149506', '2021-10-12 16:35:51', '1442403455200149506', '2021-10-12 16:35:51');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447843481388077058', '1447843392875679746', '冻疮', b'0', 2, b'0', '1442403455200149506', '2021-10-12 16:36:00', '1442403455200149506', '2021-10-12 16:36:00');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447843512962797570', '1447843392875679746', '红肿', b'0', 3, b'0', '1442403455200149506', '2021-10-12 16:36:08', '1442403455200149506', '2021-10-12 16:36:08');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447843542780104706', '1447843392875679746', '红疹', b'0', 4, b'0', '1442403455200149506', '2021-10-12 16:36:15', '1442403455200149506', '2021-10-12 16:36:15');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447843568088535042', '1447843392875679746', '紫癜', b'0', 5, b'0', '1442403455200149506', '2021-10-12 16:36:21', '1442403455200149506', '2021-10-12 16:36:21');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447843602926424066', '1447843392875679746', '溃疡', b'0', 6, b'0', '1442403455200149506', '2021-10-12 16:36:29', '1442403455200149506', '2021-10-12 16:36:29');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447843688792215553', '1447843392875679746', '干燥', b'0', 7, b'0', '1442403455200149506', '2021-10-12 16:36:50', '1442403455200149506', '2021-10-12 16:36:50');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447843725907611650', '1447843392875679746', '破溃', b'1', 8, b'0', '1442403455200149506', '2021-10-12 16:36:59', '1442403455200149506', '2021-10-12 16:36:59');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447843755938828290', '1447843392875679746', '丘疹', b'0', 9, b'0', '1442403455200149506', '2021-10-12 16:37:06', '1442403455200149506', '2021-10-12 16:37:06');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447843791036764162', '1447843392875679746', '瘀斑', b'0', 10, b'0', '1442403455200149506', '2021-10-12 16:37:14', '1442403455200149506', '2021-10-12 16:37:14');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447843818979217410', '1447843392875679746', '水疱', b'0', 11, b'0', '1442403455200149506', '2021-10-12 16:37:21', '1442403455200149506', '2021-10-12 16:37:21');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447843866848808962', '1447843392875679746', '风团', b'0', 12, b'0', '1442403455200149506', '2021-10-12 16:37:32', '1442403455200149506', '2021-10-12 16:37:32');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447843896099885057', '1447843392875679746', '鳞屑', b'0', 13, b'0', '1442403455200149506', '2021-10-12 16:37:39', '1442403455200149506', '2021-10-12 16:37:39');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447843926789607426', '1447843392875679746', '瘀点', b'0', 14, b'0', '1442403455200149506', '2021-10-12 16:37:46', '1442403455200149506', '2021-10-12 16:37:46');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447843963141640194', '1447843392875679746', '黑头，粉刺', b'0', 15, b'0', '1442403455200149506', '2021-10-12 16:37:55', '1442403455200149506', '2021-10-12 16:37:55');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447843987044978690', '1447843392875679746', '白脓点', b'0', 16, b'0', '1442403455200149506', '2021-10-12 16:38:01', '1442403455200149506', '2021-10-12 16:38:01');
INSERT INTO `medrecord_complaint_tag` VALUES ('1447844014303760385', '1447843392875679746', '脱发', b'0', 17, b'0', '1442403455200149506', '2021-10-12 16:38:07', '1442403455200149506', '2021-10-12 16:38:07');

-- ----------------------------
-- Table structure for medrecord_complaint_type
-- ----------------------------
DROP TABLE IF EXISTS `medrecord_complaint_type`;
CREATE TABLE `medrecord_complaint_type`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID主键',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主诉分类名称',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序号',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除：0否、1是',
  `created_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '主诉分类表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of medrecord_complaint_type
-- ----------------------------
INSERT INTO `medrecord_complaint_type` VALUES ('1', '全身性症状', 1, b'0', '1442403455200149506', '2021-10-12 15:39:47', '1442403455200149506', '2021-10-12 15:40:55');
INSERT INTO `medrecord_complaint_type` VALUES ('1447831099538448386', '呼吸系统', 2, b'0', '1442403455200149506', '2021-10-12 15:46:48', '1442403455200149506', '2021-10-12 15:46:48');
INSERT INTO `medrecord_complaint_type` VALUES ('1447831934783758337', '循环系统', 3, b'0', '1442403455200149506', '2021-10-12 15:50:07', '1442403455200149506', '2021-10-12 15:50:07');
INSERT INTO `medrecord_complaint_type` VALUES ('1447832454411886594', '消化系统', 4, b'0', '1442403455200149506', '2021-10-12 15:52:11', '1442403455200149506', '2021-10-12 15:52:11');
INSERT INTO `medrecord_complaint_type` VALUES ('1447834282818052098', '泌尿系统', 5, b'0', '1442403455200149506', '2021-10-12 15:59:27', '1442403455200149506', '2021-10-12 15:59:27');
INSERT INTO `medrecord_complaint_type` VALUES ('1447835482477076482', '神经系统', 6, b'0', '1442403455200149506', '2021-10-12 16:04:13', '1442403455200149506', '2021-10-12 16:04:13');
INSERT INTO `medrecord_complaint_type` VALUES ('1447836005179629569', '妇科系统', 7, b'0', '1442403455200149506', '2021-10-12 16:06:18', '1442403455200149506', '2021-10-12 16:06:18');
INSERT INTO `medrecord_complaint_type` VALUES ('1447837267635781634', '男科系统', 8, b'0', '1442403455200149506', '2021-10-12 16:11:19', '1442403455200149506', '2021-10-12 16:11:19');
INSERT INTO `medrecord_complaint_type` VALUES ('1447839485294301185', '外壳系统', 9, b'0', '1442403455200149506', '2021-10-12 16:20:08', '1442403455200149506', '2021-10-12 16:20:08');
INSERT INTO `medrecord_complaint_type` VALUES ('1447840239425966081', '五官科症状', 10, b'0', '1442403455200149506', '2021-10-12 16:23:07', '1442403455200149506', '2021-10-12 16:23:07');
INSERT INTO `medrecord_complaint_type` VALUES ('1447843392875679746', '皮肤科症状', 11, b'0', '1442403455200149506', '2021-10-12 16:35:39', '1442403455200149506', '2021-10-12 16:35:39');

-- ----------------------------
-- Table structure for medrecord_dental_position
-- ----------------------------
DROP TABLE IF EXISTS `medrecord_dental_position`;
CREATE TABLE `medrecord_dental_position`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID主键',
  `medrecord_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '病历id',
  `diagnosis_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '诊断id  medrecord_diagnosis表的id',
  `position` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '方位：1.上左，2上右。 3.下左， 4 下右',
  `dental_position` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '牙位：1-8或者A-E。 12345678代表恒牙，ABCDE代表乳牙',
  `site` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部位选择：（La，B，F，M，D，O，L，P）\r\n唇面La（labial），颊面B（buccal）,唇面和颊面F（facial）,近中面M（mesial），远中面D（distal），牙合面O （occlusal），舌面L（lingual），腭面P（palatal）',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除：0否、1是',
  `created_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '口腔病历牙位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of medrecord_dental_position
-- ----------------------------

-- ----------------------------
-- Table structure for medrecord_diag_tag
-- ----------------------------
DROP TABLE IF EXISTS `medrecord_diag_tag`;
CREATE TABLE `medrecord_diag_tag`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID主键',
  `type_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签分类id',
  `tag` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述标签',
  `common_use` bit(1) NULL DEFAULT b'0' COMMENT '是否常用',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序号',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除：0否、1是',
  `created_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '诊断标签表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of medrecord_diag_tag
-- ----------------------------

-- ----------------------------
-- Table structure for medrecord_diag_type
-- ----------------------------
DROP TABLE IF EXISTS `medrecord_diag_type`;
CREATE TABLE `medrecord_diag_type`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID主键',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签分类名称',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序号',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除：0否、1是',
  `created_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '诊断标签分类表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of medrecord_diag_type
-- ----------------------------

-- ----------------------------
-- Table structure for medrecord_diagnosis
-- ----------------------------
DROP TABLE IF EXISTS `medrecord_diagnosis`;
CREATE TABLE `medrecord_diagnosis`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID主键',
  `medrecord_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '病历id',
  `type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '诊断类型：1.口腔检查，2.治疗计划，3.治疗 4.诊断',
  `name` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '说明',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除：0否、1是',
  `created_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '口腔病历诊断信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of medrecord_diagnosis
-- ----------------------------

-- ----------------------------
-- Table structure for medrecord_drug_detail
-- ----------------------------
DROP TABLE IF EXISTS `medrecord_drug_detail`;
CREATE TABLE `medrecord_drug_detail`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID主键',
  `prescription_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处方id',
  `drug_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药品id',
  `drug_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药品编码',
  `drug_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '药品基本类别编码',
  `drug_spec` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '药品规格',
  `drug_producer` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '药品生产厂家',
  `drug_supplier` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药品供应商',
  `drug_name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药品名称',
  `group_num` tinyint(1) NULL DEFAULT NULL COMMENT '组号',
  `illustrate` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药品用法',
  `use_frequency` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用药频率',
  `dosage` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用药剂量',
  `dosage_unit` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '剂量单位',
  `days` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用药天数',
  `item_name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目名称',
  `body_site` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部位',
  `expected_date` datetime(0) NULL DEFAULT NULL COMMENT '期望执行日期',
  `price` decimal(10, 2) NOT NULL COMMENT '单价',
  `quantity` decimal(11, 1) NOT NULL COMMENT '数量',
  `quantity_unit` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数量单位',
  `spit_num` decimal(11, 1) NULL DEFAULT NULL COMMENT '最小拆零单位',
  `special_require` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '特殊要求',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除：0否、1是',
  `created_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '处方药品信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of medrecord_drug_detail
-- ----------------------------

-- ----------------------------
-- Table structure for medrecord_info
-- ----------------------------
DROP TABLE IF EXISTS `medrecord_info`;
CREATE TABLE `medrecord_info`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID主键',
  `coding` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '病例id标识',
  `register_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '挂号id',
  `doctor_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医生id',
  `doctor_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医生姓名',
  `patient_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '患者id',
  `patient_name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `patient_gender` tinyint(3) NULL DEFAULT NULL COMMENT '患者性别',
  `patient_age` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '患者年龄',
  `status` tinyint(3) NULL DEFAULT NULL COMMENT '就诊状态(0-待接诊；1-接诊中；2-已结诊；3-过号)',
  `diag` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '诊断',
  `chief_complaint` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '患者主诉',
  `present_illness` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '现病史',
  `past_history` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '疾病史',
  `visit_time` datetime(0) NULL DEFAULT NULL COMMENT '就诊时间',
  `blood_pressure` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '血压',
  `pulse` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '脉搏',
  `blood_sugar` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '血糖',
  `temperature` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '体温',
  `advice` varchar(350) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医嘱',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除：0否、1是',
  `created_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '病历信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of medrecord_info
-- ----------------------------

-- ----------------------------
-- Table structure for medrecord_item_detail
-- ----------------------------
DROP TABLE IF EXISTS `medrecord_item_detail`;
CREATE TABLE `medrecord_item_detail`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID主键',
  `prescription_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处方id',
  `item_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目id',
  `item_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目编码',
  `item_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目类别编码',
  `item_name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目名称',
  `body_site` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部位',
  `expected_date` datetime(0) NULL DEFAULT NULL COMMENT '期望执行日期',
  `days` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '天数',
  `price` decimal(10, 2) NOT NULL COMMENT '单价',
  `quantity` int(4) NOT NULL COMMENT '数量',
  `quantity_unit` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数量单位',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除：0否、1是',
  `created_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '处方项目信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of medrecord_item_detail
-- ----------------------------

-- ----------------------------
-- Table structure for medrecord_other_index_tag
-- ----------------------------
DROP TABLE IF EXISTS `medrecord_other_index_tag`;
CREATE TABLE `medrecord_other_index_tag`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID主键',
  `type_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签分类id',
  `tag` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述标签',
  `common_use` bit(1) NULL DEFAULT b'0' COMMENT '是否常用',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序号',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除：0否、1是',
  `created_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '诊所其他指标标签表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of medrecord_other_index_tag
-- ----------------------------

-- ----------------------------
-- Table structure for medrecord_other_index_type
-- ----------------------------
DROP TABLE IF EXISTS `medrecord_other_index_type`;
CREATE TABLE `medrecord_other_index_type`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID主键',
  `type` tinyint(1) NOT NULL COMMENT '类型1.主诉， 2.口腔检查， 3.诊断 4.治疗计划，5.治疗 6.医嘱',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '指标分类名称',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序号',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除：0否、1是',
  `created_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '诊所其他指标分类表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of medrecord_other_index_type
-- ----------------------------

-- ----------------------------
-- Table structure for medrecord_prescription
-- ----------------------------
DROP TABLE IF EXISTS `medrecord_prescription`;
CREATE TABLE `medrecord_prescription`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID主键',
  `coding` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处方编码',
  `medrecord_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '病历id',
  `register_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '挂号id',
  `prescription_type` tinyint(3) NULL DEFAULT NULL COMMENT '处方类型(0:中药;1:西药;2:项目;3:附加费;4:挂号费)',
  `illustrate` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用法（中药专用）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服药方法（中药专用）',
  `decocting_method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '煎制方法（中药专用）',
  `pair_num` int(11) NULL DEFAULT NULL COMMENT '付数（中药专用）',
  `times` int(11) NULL DEFAULT NULL COMMENT '服药次数（中药专用）',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除：0否、1是',
  `created_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '病历处方信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of medrecord_prescription
-- ----------------------------

-- ----------------------------
-- Table structure for medrecord_register_fee
-- ----------------------------
DROP TABLE IF EXISTS `medrecord_register_fee`;
CREATE TABLE `medrecord_register_fee`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'id主键',
  `prescription_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处方id',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '收费价格',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除：0-否、1-是',
  `created_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `updated_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '病历挂号费记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of medrecord_register_fee
-- ----------------------------

-- ----------------------------
-- Table structure for medrecord_rx_template
-- ----------------------------
DROP TABLE IF EXISTS `medrecord_rx_template`;
CREATE TABLE `medrecord_rx_template`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID主键',
  `template_type` tinyint(3) NULL DEFAULT NULL COMMENT '模板类型(0:中药;1:西药;2:项目)',
  `doctor_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医生id',
  `type_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板分类id',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板名称',
  `template_overview` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板概述',
  `applicable_diagnosis` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '适用诊断',
  `illustrate` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用法（中药专用）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服药方法（中药专用）',
  `decocting_method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '煎制方法（中药专用）',
  `pair_num` int(11) NULL DEFAULT NULL COMMENT '付数（中药专用）',
  `times` int(11) NULL DEFAULT NULL COMMENT '服药次数（中药专用）',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除：0否、1是',
  `created_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '处方模板表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of medrecord_rx_template
-- ----------------------------

-- ----------------------------
-- Table structure for medrecord_rx_template_datail
-- ----------------------------
DROP TABLE IF EXISTS `medrecord_rx_template_datail`;
CREATE TABLE `medrecord_rx_template_datail`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID主键',
  `template_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处方模板id',
  `drug_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药品id',
  `drug_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药品编码',
  `drug_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药品基本类别编码',
  `drug_spec` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药品规格',
  `drug_producer` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药品生产厂家',
  `drug_supplier` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药品供应商',
  `drug_name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药品名称',
  `group_num` tinyint(1) NULL DEFAULT NULL COMMENT '组号',
  `illustrate` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药品用法',
  `use_frequency` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用药频率',
  `dosage` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用药剂量',
  `dosage_unit` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '剂量单位',
  `days` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用药天数',
  `item_name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目名称',
  `body_site` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部位',
  `expected_date` datetime(0) NULL DEFAULT NULL COMMENT '期望执行日期',
  `price` decimal(10, 2) NOT NULL COMMENT '单价',
  `quantity` decimal(11, 1) NOT NULL COMMENT '数量',
  `quantity_unit` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数量单位',
  `special_require` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '特殊要求',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除：0否、1是',
  `created_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '处方模板详情表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of medrecord_rx_template_datail
-- ----------------------------

-- ----------------------------
-- Table structure for medrecord_rx_template_type
-- ----------------------------
DROP TABLE IF EXISTS `medrecord_rx_template_type`;
CREATE TABLE `medrecord_rx_template_type`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID主键',
  `type` tinyint(3) NULL DEFAULT NULL COMMENT '模板类型(1.处方模板;2:项目模板;3:病历模板)',
  `doctor_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医生id',
  `common` bit(1) NULL DEFAULT b'0' COMMENT '是否公共模板：0否、1是',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板分组名称',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除：0否、1是',
  `created_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '处方模板分类表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of medrecord_rx_template_type
-- ----------------------------

-- ----------------------------
-- Table structure for medrecord_surcharge
-- ----------------------------
DROP TABLE IF EXISTS `medrecord_surcharge`;
CREATE TABLE `medrecord_surcharge`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id主键',
  `prescription_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处方id',
  `item_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收费项id',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收费项名称',
  `price` decimal(10, 2) NOT NULL COMMENT '收费价格',
  `quantity` int(4) NOT NULL COMMENT '数量',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除：0-否、1-是',
  `created_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `updated_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '病历附加收费记录表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of medrecord_surcharge
-- ----------------------------

-- ----------------------------
-- Table structure for payment_drug_info
-- ----------------------------
DROP TABLE IF EXISTS `payment_drug_info`;
CREATE TABLE `payment_drug_info`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID主键',
  `payment_record_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '付款记录信息id',
  `drug_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药品id',
  `drug_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药品编码',
  `drug_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '药品基本类别编码',
  `drug_spec` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '药品规格',
  `drug_producer` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '药品生产厂家',
  `drug_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '药品名称',
  `drug_price` decimal(10, 2) NOT NULL COMMENT '药品价格',
  `quantity` int(4) NOT NULL COMMENT '数量',
  `supplier_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药品供应商id',
  `supplier` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药品供应商',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除：0否、1是',
  `created_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '付款记录对应的药品信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of payment_drug_info
-- ----------------------------

-- ----------------------------
-- Table structure for payment_record
-- ----------------------------
DROP TABLE IF EXISTS `payment_record`;
CREATE TABLE `payment_record`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID主键',
  `fkdh` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '付款单号',
  `purchase_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采购单id',
  `supplier_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药品供应商id',
  `payable_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '应付金额',
  `real_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '实付金额',
  `pay_time` datetime(0) NULL DEFAULT NULL COMMENT '付款时间',
  `payer` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '付款人',
  `note` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `pay_status` bit(1) NULL DEFAULT b'1' COMMENT '付款状态 0-未付款 1-已付款',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除：0否、1是',
  `created_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '付款记录信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of payment_record
-- ----------------------------

-- ----------------------------
-- Table structure for purchase_audit_info
-- ----------------------------
DROP TABLE IF EXISTS `purchase_audit_info`;
CREATE TABLE `purchase_audit_info`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID主键',
  `purchase_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '采购单id',
  `auditor_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核员id',
  `auditor` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核员',
  `audit_time` datetime(0) NULL DEFAULT NULL COMMENT '审批时间',
  `auditmind` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审批意见',
  `audit_status` tinyint(3) NULL DEFAULT NULL COMMENT '审批状态 0-通过 1-否决',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除：0否、1是',
  `created_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '采购药品审核记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of purchase_audit_info
-- ----------------------------

-- ----------------------------
-- Table structure for purchase_detail
-- ----------------------------
DROP TABLE IF EXISTS `purchase_detail`;
CREATE TABLE `purchase_detail`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID主键',
  `purchase_record_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '采购单id',
  `drug_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药品id',
  `drug_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药品编码',
  `drug_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药品基本类别编码',
  `drug_spec` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '药品规格',
  `drug_producer` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '药品生产厂家',
  `drug_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '药品名称',
  `drug_price` decimal(10, 2) NOT NULL COMMENT '药品价格',
  `quantity` int(4) NOT NULL COMMENT '数量',
  `supplier_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药品供应商id',
  `supplier` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药品供应商',
  `whetherpay` bit(1) NULL DEFAULT b'0' COMMENT '是否已经付款 0-否 1-是',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除：0否、1是',
  `created_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '采购药品详情表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of purchase_detail
-- ----------------------------

-- ----------------------------
-- Table structure for purchase_drug_enternum
-- ----------------------------
DROP TABLE IF EXISTS `purchase_drug_enternum`;
CREATE TABLE `purchase_drug_enternum`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键id',
  `purchase_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '采购单id',
  `drug_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药品id',
  `enter_number` int(10) NULL DEFAULT 0 COMMENT '入库数量',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除。0否、1是',
  `created_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '采购单下，药品入库数量中间表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of purchase_drug_enternum
-- ----------------------------

-- ----------------------------
-- Table structure for purchase_record
-- ----------------------------
DROP TABLE IF EXISTS `purchase_record`;
CREATE TABLE `purchase_record`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID主键',
  `cgdh` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '采购单号',
  `purchase_person_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '采购人id',
  `purchase_person_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '采购人姓名',
  `supplier_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药品供应商id',
  `total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格总计',
  `type_quantity` int(4) NULL DEFAULT NULL COMMENT '药品种类总计',
  `total_number` int(6) NULL DEFAULT NULL COMMENT '药品数量总计',
  `status` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采购状态 0-待审核,1-审核中,2-审核不通过,3-审核通过,4-不需要审核',
  `closed` bit(1) NULL DEFAULT b'0' COMMENT '订单是否已经关闭',
  `closed_time` datetime(0) NULL DEFAULT NULL COMMENT '关闭时间',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除：0否、1是',
  `created_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '采购记录信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of purchase_record
-- ----------------------------

-- ----------------------------
-- Table structure for register_info
-- ----------------------------
DROP TABLE IF EXISTS `register_info`;
CREATE TABLE `register_info`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT 'ID主键',
  `coding` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '挂号id标识',
  `archive_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '档案id',
  `status` tinyint(3) NOT NULL DEFAULT 0 COMMENT '挂号状态。0：待接诊。1：接诊中。2：已接诊。3：已过号',
  `type` tinyint(3) NULL DEFAULT NULL COMMENT '就诊类型：0：初诊。1：复诊',
  `dept_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室id',
  `doctor_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医生id',
  `doctor_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医生姓名',
  `prosecution` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '自诉',
  `is_exist_allergy` tinyint(3) NULL DEFAULT NULL COMMENT '是否存在过敏史(0：不存在。1：存在)',
  `allergies` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '过敏史',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '当日排号数',
  `visit_time` datetime(0) NULL DEFAULT NULL COMMENT '就诊时间，可能会没有病历所以加一个字段',
  `remark` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除：0否1、是',
  `created_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '挂号记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of register_info
-- ----------------------------

-- ----------------------------
-- Table structure for retail_drug_detail
-- ----------------------------
DROP TABLE IF EXISTS `retail_drug_detail`;
CREATE TABLE `retail_drug_detail`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID主键',
  `retail_info_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '售药记录id',
  `group_num` int(3) NULL DEFAULT NULL COMMENT '分组编号',
  `drug_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '药品id',
  `drug_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药品编码',
  `drug_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药品基本类别编码',
  `drug_spec` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药品规格',
  `drug_producer` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药品生产厂家',
  `drug_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药品名称',
  `common_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药品通用名称',
  `brand_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药品品牌名称',
  `special_require` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '特殊说明',
  `illustrate` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用法',
  `use_frequency` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '频次',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '药品单价',
  `quantity` decimal(11, 1) NOT NULL COMMENT '购买数量',
  `quantity_unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数量单位',
  `unit_type` tinyint(2) NOT NULL COMMENT '数量单位类别(1:包装单位;2:基本单位;3:最小单位)',
  `spit_num` decimal(11, 1) NULL DEFAULT NULL COMMENT '最小拆零单位数量',
  `amount` decimal(18, 2) NOT NULL COMMENT '小计销售金额',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除。0否、1是',
  `created_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '售药记录药品详情表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of retail_drug_detail
-- ----------------------------

-- ----------------------------
-- Table structure for retail_drug_stock
-- ----------------------------
DROP TABLE IF EXISTS `retail_drug_stock`;
CREATE TABLE `retail_drug_stock`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id主键',
  `retail_info_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '零售id',
  `drug_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药品id',
  `mgt_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '库存id',
  `drug_num` decimal(11, 1) NOT NULL COMMENT '药品数量',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除：0-否、1-是',
  `created_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `updated_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '零售药品库存记录表(方便退款入库)' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of retail_drug_stock
-- ----------------------------

-- ----------------------------
-- Table structure for retail_info
-- ----------------------------
DROP TABLE IF EXISTS `retail_info`;
CREATE TABLE `retail_info`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID主键',
  `retail_type` tinyint(3) NOT NULL DEFAULT 1 COMMENT '零售药品类别(0-中药；1-西药)',
  `pay_coding` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '售药编号',
  `archive_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '档案id',
  `patient_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `patient_age` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者年龄',
  `doctor_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医生id',
  `doctor_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医生姓名',
  `amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '应付金额',
  `real_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '实付金额',
  `discount_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '优惠金额',
  `pay_status` tinyint(3) NOT NULL COMMENT '支付状态。0：未缴费。1：已缴费，2：已退费',
  `pay_mode` tinyint(3) NOT NULL COMMENT '支付方式。0：微信。1：支付宝、2：现金。3：其他',
  `pay_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `refund_user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退款人id',
  `refund_user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退款人姓名',
  `refund_mode` tinyint(3) NULL DEFAULT NULL COMMENT '退款方式。0：微信。1：支付宝、2：现金。3：其他',
  `refund_time` datetime(0) NULL DEFAULT NULL COMMENT '退费时间',
  `illustrate` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用法(中药专用)',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服药方法(中药专用)',
  `decocting_method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '煎制方法(中药专用)',
  `pair_num` int(11) NULL DEFAULT NULL COMMENT '购买付数(中药专用)',
  `times` int(11) NULL DEFAULT NULL COMMENT '服用次数(中药专用)',
  `discount_mode` tinyint(3) NULL DEFAULT NULL COMMENT '折扣方式。0：整单折扣，1：优惠金额',
  `discount_rate` decimal(18, 2) NULL DEFAULT NULL COMMENT '折扣率或优惠金额',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除。0否、1是',
  `created_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '售药记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of retail_info
-- ----------------------------

-- ----------------------------
-- Table structure for retail_info_drug
-- ----------------------------
DROP TABLE IF EXISTS `retail_info_drug`;
CREATE TABLE `retail_info_drug`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID主键',
  `retail_info_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '售药记录id',
  `drug_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '药品id',
  `price` decimal(10, 2) NOT NULL COMMENT '药品售价金额',
  `quantity` int(5) NOT NULL COMMENT '购买数量',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除。0否、1是',
  `created_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '售药记录、药品中间表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of retail_info_drug
-- ----------------------------

-- ----------------------------
-- Table structure for scheduling_info
-- ----------------------------
DROP TABLE IF EXISTS `scheduling_info`;
CREATE TABLE `scheduling_info`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键id',
  `doctor_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '医生id',
  `dept_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室id',
  `scheduling_date` date NULL DEFAULT NULL COMMENT '排班日期',
  `morning` tinyint(3) NULL DEFAULT 0 COMMENT '上午排班情况（0未排班，1有排班）',
  `afternoon` tinyint(3) NULL DEFAULT 0 COMMENT '下午排班情况（0未排班，1有排班）',
  `night` tinyint(3) NULL DEFAULT 0 COMMENT '晚上排班情况（0未排班，1有排班）',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除：0否1、是',
  `created_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '医生排班记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scheduling_info
-- ----------------------------

-- ----------------------------
-- Table structure for scheduling_week
-- ----------------------------
DROP TABLE IF EXISTS `scheduling_week`;
CREATE TABLE `scheduling_week`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键id',
  `doctor_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '医生id',
  `week` tinyint(3) NULL DEFAULT NULL COMMENT '周几（1是周一，2是周二..以此类推）',
  `morning` tinyint(3) NULL DEFAULT 0 COMMENT '上午排班情况（0未排班，1有排班）',
  `afternoon` tinyint(3) NULL DEFAULT 0 COMMENT '下午排班情况（0未排班，1有排班）',
  `night` tinyint(3) NULL DEFAULT 0 COMMENT '晚上排班情况（0未排班，1有排班）',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除：0否1、是',
  `created_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '周排班表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scheduling_week
-- ----------------------------

-- ----------------------------
-- Table structure for stock_enter
-- ----------------------------
DROP TABLE IF EXISTS `stock_enter`;
CREATE TABLE `stock_enter`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID主键',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '入库开始时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '入库结束时间',
  `number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入库单号',
  `type` tinyint(3) NULL DEFAULT NULL COMMENT '入库方式：1、新增入库.2、批量导入.3、采购单关联.4、处方退药.5、零售退药.6、快速盘点.7、全盘盘点',
  `drug_type_amount` int(3) NOT NULL COMMENT '药品种类数量',
  `store_ids` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入库记录的仓库id（可能多个）',
  `amount` decimal(11, 1) NOT NULL COMMENT '入库数量',
  `biz_number` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务编码',
  `biz_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务id，采购单id或者零售id或者盘点id或者处方id',
  `unit_transform_status` bit(1) NULL DEFAULT b'0' COMMENT 'rue:存的是零售单位。false：存的是基本单位。（兼容原先的数据）',
  `persons` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入库人员名称（多个用逗号分割）',
  `status` tinyint(3) NULL DEFAULT 0 COMMENT '入库状态。0：未入库。1：入库中。2：已入库',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除。0否、1是',
  `created_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '入库管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of stock_enter
-- ----------------------------

-- ----------------------------
-- Table structure for stock_enter_mgt
-- ----------------------------
DROP TABLE IF EXISTS `stock_enter_mgt`;
CREATE TABLE `stock_enter_mgt`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID主键',
  `drug_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药品id',
  `mgt_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '库存id',
  `store_ids` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '记录药品入库的仓库记录（可能多个）',
  `enter_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '入库管理id',
  `total_num` decimal(11, 1) NOT NULL COMMENT '总入库数量',
  `already_num` decimal(11, 1) NOT NULL DEFAULT 0.0 COMMENT '已入库数量',
  `unit` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入库时选择的单位， 为空是默认为包装单位',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除。0否、1是',
  `created_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '入库、库存中间表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of stock_enter_mgt
-- ----------------------------

-- ----------------------------
-- Table structure for stock_inventory
-- ----------------------------
DROP TABLE IF EXISTS `stock_inventory`;
CREATE TABLE `stock_inventory`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID主键',
  `number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '盘点单号',
  `type` tinyint(3) NULL DEFAULT NULL COMMENT '盘点方式：1、快速盘点.2、全盘盘点',
  `inventory_date` datetime(0) NULL DEFAULT NULL COMMENT '盘点日期',
  `person` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '盘点人',
  `review` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核人',
  `input_date` datetime(0) NULL DEFAULT NULL COMMENT '实盘录入时间',
  `review_date` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注（驳回理由）',
  `status` tinyint(3) NULL DEFAULT 0 COMMENT '盘点状态0:带盘点，1：待审核。2：审核通过。3：驳回',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除。0否、1是',
  `created_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '盘点信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of stock_inventory
-- ----------------------------

-- ----------------------------
-- Table structure for stock_inventory_mgt
-- ----------------------------
DROP TABLE IF EXISTS `stock_inventory_mgt`;
CREATE TABLE `stock_inventory_mgt`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID主键',
  `mgt_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '库存管理id',
  `inventory_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '盘点id',
  `mgt_num` decimal(11, 1) NOT NULL COMMENT '账面库存',
  `actual_num` decimal(11, 1) NULL DEFAULT NULL COMMENT '实际库存',
  `diff_num` decimal(11, 1) NULL DEFAULT NULL COMMENT '差异数量',
  `unit_transform_status` bit(1) NULL DEFAULT b'0' COMMENT 'true:存的是零售单位。false：存的是基本单位。（兼容原先的数据）',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除。0否、1是',
  `created_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '盘点库存中间表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of stock_inventory_mgt
-- ----------------------------

-- ----------------------------
-- Table structure for stock_mgt
-- ----------------------------
DROP TABLE IF EXISTS `stock_mgt`;
CREATE TABLE `stock_mgt`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID主键',
  `drug_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '药品id',
  `store_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '仓库id',
  `balance` decimal(11, 1) NOT NULL DEFAULT 0.0 COMMENT '库存余量',
  `deadline` datetime(0) NULL DEFAULT NULL COMMENT '药品截至日期',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除。0否、1是',
  `created_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `drug_id_btree`(`drug_id`) USING BTREE COMMENT '药品id索引'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '库存管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of stock_mgt
-- ----------------------------

-- ----------------------------
-- Table structure for stock_out
-- ----------------------------
DROP TABLE IF EXISTS `stock_out`;
CREATE TABLE `stock_out`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID主键',
  `out_time` datetime(0) NULL DEFAULT NULL COMMENT '出库时间',
  `number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出库单号',
  `type` tinyint(3) NULL DEFAULT NULL COMMENT '出库方式：1、药品退回.2、药品报损.3、处方单关联.4、零售单关联.5、快速盘点.6、全盘盘点.7、其他',
  `store_ids` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '仓库id列表',
  `drug_type_amount` int(3) NOT NULL COMMENT '药品种类数量',
  `amount` decimal(11, 1) NOT NULL COMMENT '出库数量',
  `biz_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务id，采购单id或者零售id或者盘点id或者处方id',
  `person` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出库人员',
  `status` tinyint(3) NULL DEFAULT 0 COMMENT '出库状态。0：未出库。1、已出库',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除。0否、1是',
  `created_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '出库管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of stock_out
-- ----------------------------

-- ----------------------------
-- Table structure for stock_out_drug
-- ----------------------------
DROP TABLE IF EXISTS `stock_out_drug`;
CREATE TABLE `stock_out_drug`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID主键',
  `mgt_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '库存id',
  `drug_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '药品id',
  `store_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '仓库id',
  `out_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '出库管理id',
  `number` decimal(11, 1) NOT NULL COMMENT '出库数量',
  `supplier` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '供应商',
  `reason` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出库原因',
  `unit` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出库时选择的单位， 为空是默认为包装单位',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除。0否、1是',
  `created_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `out_id_btree`(`out_id`) USING BTREE COMMENT '出库管理id索引',
  INDEX `drug_id_btree`(`drug_id`) USING BTREE COMMENT '药品id索引'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '出库、药品中间表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of stock_out_drug
-- ----------------------------

-- ----------------------------
-- Table structure for supplier_info
-- ----------------------------
DROP TABLE IF EXISTS `supplier_info`;
CREATE TABLE `supplier_info`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID主键',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '供应商名称',
  `person` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `phone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系地址',
  `bank_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开户银行',
  `bank_account` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行账号',
  `status` bit(1) NOT NULL DEFAULT b'0' COMMENT '状态。0:未启用。1：启用',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除。0否、1是',
  `created_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '库存管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of supplier_info
-- ----------------------------

-- ----------------------------
-- Table structure for sys_business_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_business_data`;
CREATE TABLE `sys_business_data`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID主键',
  `setting_day` date NULL DEFAULT NULL COMMENT '统计日期',
  `rx_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '接诊金额',
  `visit_num` int(10) NULL DEFAULT NULL COMMENT '接诊人次',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除。0否、1是',
  `created_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '运营数据统计表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_business_data
-- ----------------------------

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id主键',
  `log_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志类型',
  `method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求方法',
  `params` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '请求参数',
  `request_ip` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求ip',
  `time` bigint(20) NULL DEFAULT NULL COMMENT '请求耗时',
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ip来源',
  `browser` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '访问浏览器',
  `exception_detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '异常详情',
  `description` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除：0-否、1-是',
  `created_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日志表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_log
-- ----------------------------

-- ----------------------------
-- Table structure for test_mycat
-- ----------------------------
DROP TABLE IF EXISTS `test_mycat`;
CREATE TABLE `test_mycat`  (
  `id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `tenant` int(11) NOT NULL COMMENT '用来分区的字段，整数'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of test_mycat
-- ----------------------------

-- ----------------------------
-- commit提交处理
-- ----------------------------
commit;
