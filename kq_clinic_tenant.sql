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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '预约表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '预约设置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of appointment_setting
-- ----------------------------
INSERT INTO `appointment_setting` VALUES ('1', '08:30', '11:30', '14:00', '18:00', NULL, NULL, 15, 10, NULL, 1, '2022-08-15', NULL, b'0', NULL, '2020-09-01 09:35:21', NULL, NULL);

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '病历模板' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of medrecord_case_template
-- ----------------------------
INSERT INTO `medrecord_case_template` VALUES ('1', NULL, '1584729973401395202', '残冠残根拔除', '牙齿折断数月/年', '左/右上/下牙齿因蛀牙逐渐残缺，影响咀嚼，无疼痛等不适。', '患者否认/自述有高血压、冠心病等心血管疾病；糖尿病、痛风等代谢性疾病。患者否认/自述有肝炎、梅毒、艾滋病等传染性疾病。患者否认/自述有红斑狼疮、类风湿性关节炎、桥本氏甲状腺炎等自身免疫性疾病。患者否认/自述有甲亢、甲减等激素紊乱病症。患者否认/自述有肾脏系统疾病。患者否认/自述有精神系统疾病。患者否认/自述有青霉素等药物或金属等物质过敏史。患者否认/自述有药物服用史。患者否认/自述有吸烟史。', '牙位图残根/冠，龋坏，松（-）/Ⅰ/Ⅱ/Ⅲ度，探（-），叩（- +）。余无特殊。', '牙位图残根/冠', '牙位图拔除', '\n局部聚维酮碘消毒，盐酸利多卡因上/下齿槽神经阻滞麻醉/牙位图碧兰麻局部浸润麻醉。待麻药发挥效果后分离牙龈，挺松牙齿，拔牙钳取出。常规搔刮拔牙创，压迫/缝合止血。\n', '严格遵守《拔牙后注意事项》，口服抗生素（自备），不适随诊。一周后拆线。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('10', NULL, '1584730047212756994', '冷光美白治疗模板', '牙齿偏黄要求美白治疗', '患者因长期饮咖啡，茶，及可乐，感觉前牙较黄，前来我院冷光美白治疗', '否认全身系统性疾病及传染病和药物过敏史。', '牙冠颜色暗黄，VITA比色板C2.探诊：（-）；冷试：（-）；热试：（-）；松动度：（-）；\n牙体完整，牙龈未见异常。', '黄染牙', '行冷光美白术，患者知情同意签字。', '比色C2,照相存档，牙齿抛光，漱净，涂唇油放置开口器，吹干牙面，涂牙龈保护剂光固化灯照3-4秒，涂抹美白凝胶，美\n白仪灯照射8分钟，强吸掉美白剂，重复操作，进行第二次及第三次8分钟的疗程，结束，美白完成后漱口。吹干。比色\nA1，照相存档，瞩须知。', '给患者术后注意事项卡片', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('100', NULL, '1584730192029491201', '全冠', '要求全冠保护', '右下后牙在我院口腔内科治疗后, 建议其全冠保护。', NULL, '47远中牙合面大面积水门汀充填体, 松( - ) , 叩( - ) ,龈( - ) , 牙周袋( - ) ,', '47牙体缺损。', '铸造全冠修复', '47拟铸造全冠修复，牙体预备, 取印模, 灌模型, 约戴冠。', NULL, b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('101', NULL, '1584730192029491201', '牙体变色', '左上前牙变色，要求修复', '右上前牙牙体颜色较暗。', 'B1曾在外院根管治疗', '牙体颜色较深，呈深褐色，叩（-），松（+），牙周软组织无异常。', '牙体变色，死髓牙。', '烤瓷冠修复', '备牙，取模，临时义齿修复。选色A2色。', '暂时不能咀嚼硬物', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('102', NULL, '1584730192029491201', '门牙不良修复体拆除', '右下后牙疼痛', '昨天因右下后牙疼痛，在富新镇医院行开髓治疗，疼痛未缓解，反而加重，现到我门诊治疗', NULL, '颌面有一开髓孔，未揭开髓顶，叩（-），冷热刺激疼痛加剧。', '牙髓炎', '根管治疗冠修复', '2%利多卡因注射液局麻下，调合，开髓，拨髓，机扩至F2，近中根未测出根长。远中根15mm，3%双氧水及生理盐水交替冲洗，敞开引流', '常规医嘱，不适随诊', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('103', NULL, '1584730192029491201', '全冠初诊备牙', '上/下/前/后牙牙体缺损，要求修复。', '时间牙位图已在外院/本院行根管治疗术和玻璃离子/树脂充填术/桩核修复，有/无食物嵌塞，有/无咬合不适，现要求冠修复。', '患者否认/自述有高血压、冠心病等心血管疾病；糖尿病、痛风等代谢性疾病。患者否认/自述有肝炎、梅毒、艾滋病等传染性疾病。患者否认/自述有红斑狼疮、类风湿性关节炎、桥本氏甲状腺炎等自身免疫性疾病。患者否认/自述有甲亢、甲减等激素紊乱病症。患者否认/自述有肾脏系统疾病。患者否认/自述有精神系统疾病。患者否认/自述有青霉素等药物或金属等物质过敏史。患者否认/自述有药物服用史。患者否认/自述有吸烟史。', '牙位图残冠 ，冷（-），探（-），叩（-），松（-），已行桩核修复。牙周未见明显异常。对合牙无/略伸长。余牙无特殊。咬合未见明显异常。', '牙体缺损', '全冠修复', '已告知患者各种备选修复材料的优缺点、相应修复费用和修复时间、可能的复诊次数和并发症，患者自愿选择：金属/烤瓷/全瓷冠修复。牙位图基牙预备，必兰/利多卡因局麻下排龈，精修，制取硅橡胶/藻酸盐印模，硅橡胶/蜡制咬合记录，进口/普通临时冠修复。比色：A2色。', '嘱患者注意休息，避免进食过冷、过热、过硬、过粘的食物。如有松脱不适等应及时复诊，来前电话预约。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('104', NULL, '1584730192029491201', '右下后牙缺失固定桥修复', '右下后牙缺失3个月。', '三个月前患者在本院拔除右下后牙，今来我院，要求做固定修复。', '否认有心脏病、高血压、糖尿病、肝炎、血液系统疾病、甲状腺功能亢进、肾脏疾病、神经精神疾患等疾病；', '缺牙区近远中间距正常，缺牙区颌龈距离正常。拔牙伤口愈合良好，邻近基牙牙龈正常，松动度（-），牙槽嵴形态正常；', '缺失', NULL, NULL, '10天复诊，不适随诊。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('105', NULL, '1584730192029491201', '固定义齿修复', '左上有一牙已拔除半年余要求修复。', '左上有一牙龋坏数年已剩残根，半年前已拔除，现已影响吃饭要求修复', '否认全身系统性疾病及传染病和药物过敏史。', '26 缺失，25、27良好稳固，无龋，咬合关系正常。', '左上牙列缺损', '建议固定桥修复（金属烤瓷桥）。', NULL, NULL, b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('106', NULL, '1584730192029491201', '固定桥初诊备牙', '上/下/前/后牙牙齿缺失数月/年，要求修复。', '数月/年前在我院/外院拔除牙位图，影响咀嚼，要求修复。', '患者否认/自述有高血压、冠心病等心血管疾病；糖尿病、痛风等代谢性疾病。患者否认/自述有肝炎、梅毒、艾滋病等传染性疾病。患者否认/自述有红斑狼疮、类风湿性关节炎、桥本氏甲状腺炎等自身免疫性疾病。患者否认/自述有甲亢、甲减等激素紊乱病症。患者否认/自述有肾脏系统疾病。患者否认/自述有精神系统疾病。患者否认/自述有青霉素等药物或金属等物质过敏史。患者否认/自述有药物服用史。患者否认/自述有吸烟史。', '牙位图缺失，缺牙区间隙尚可，牙槽嵴未见明显异常/轻度萎缩。邻缺隙牙牙冠完整，牙周未见明显异常，无松动，对合牙无/略伸长。余牙无特殊。咬合未见明显异常。', '牙列缺损', '牙位图固定义齿修复', '已告知患者各种备选修复材料的优缺点、相应修复费用和修复时间、可能的复诊次数和并发症，患者自愿选择：金属/烤瓷/全瓷固定桥修复。必兰/利多卡因局麻下，牙位图基牙预备，排龈，精修，制取硅橡胶/藻酸盐印模，硅橡胶/蜡制咬合记录，进口/普通临时桥修复。比色：A2色。', '嘱患者注意休息，避免进食过冷、过热、过硬、过粘的食物。如有松脱不适等应及时复诊，来前电话预约。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('107', NULL, '1584730192029491201', '桩核', '上牙列治疗后1周。要求固定修复。', '上牙残根于我院治疗后要求修复。', '否认有心脏病、高血压、糖尿病、肝炎、血液系统疾病、甲状腺功能亢进、肾脏疾病、神经精神疾患等疾病；', '拔牙窝愈合良好。无明显骨突，骨刺。', '残冠', NULL, NULL, NULL, b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('108', NULL, '1584730192029491201', '桩核冠初诊备牙', '上/下/前/后牙牙体缺损，要求修复。', '时间牙位图已在外院/本院行根管治疗术，有/无食物嵌塞，有/无咬合不适，现要求修复。', NULL, '牙位图残冠/残根 ，冷（-），探（-），叩（-），松（-），已根充。牙周未见明显异常。喇叭口型根管/前牙重度深覆合/临床牙冠短。余牙无特殊。', '残冠/残根', '桩核冠修复', '已告知患者各种备选修复材料的优缺点、相应修复费用和修复时间、可能的复诊次数和并发症，患者自愿选择：金属/烤瓷/全瓷桩核冠修复。牙位图基牙预备，必兰/利多卡因局麻下排龈，精修，制取硅橡胶/藻酸盐印模，硅橡胶/蜡制咬合记录，进口/普通临时桩核冠修复/根管口暂封。比色：A2色。', '\n嘱患者注意休息，避免进食过冷、过热、过硬、过粘的食物。如有松脱不适等应及时复诊，来前电话预约。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('109', NULL, '1584730192029491201', '活动义齿修复（牙体预备，取模）', '上前牙缺失6+月', '患者述6+月前上前牙于外院拔除，现来咨询活动义齿修复。', '\"拔牙\"史。', '（牙位）缺失，缺牙区牙槽嵴丰满度欠佳。（牙位）牙体未见明显缺损及隐裂纹，叩痛-，冷测-，松动+-。\n', '牙列缺损', NULL, NULL, '预约复诊戴牙，不适随诊。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('11', NULL, '1584730047212756994', '楔状缺损', '发现右下后牙颈部缺损，冷刺激敏感数月', '数月前发现右下后牙颈部缺损，冷刺激敏感，刷牙时尤其明显，无明显自发性疼痛', '否认以往有牙痛史和其他重大疾患史', '颊侧颈部呈楔状缺损，较深，冷（+ -）探（+ -）叩（-）\n     颊侧颈部呈楔状缺损，较浅，冷（-）探（ -）叩（-）', '楔状缺损', NULL, NULL, '改变刷牙方式，保持口腔卫生，若疼痛及时复诊RCT。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('110', NULL, '1584730192029491201', '粘桩备牙', '复诊：无不适。左右两侧后牙发现有洞一个月，求补。', NULL, NULL, '颌面龋，探诊：（-）；冷试：（+-）；热试：（-）；叩诊：（-）；', '深龋', NULL, NULL, '严禁患侧咀嚼，不适随诊。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('111', NULL, '1584730436918124545', '楔形缺损病历', '左/右上/下前/后牙冷热酸甜刺激后疼痛数日/周/月', '数日/周/月患者偶然发现左/右上/下前/后牙颈部横沟，冷热酸甜刺激后疼痛。无明显自发痛。', '有横向刷牙史。患者否认/自述有高血压、冠心病等心血管疾病；糖尿病、痛风等代谢性疾病。患者否认/自述有肝炎、梅毒、艾滋病等传染性疾病。患者否认/自述有红斑狼疮、类风湿性关节炎、桥本氏甲状腺炎等自身免疫性疾病。患者否认/自述有甲亢、甲减等激素紊乱病症。患者否认/自述有肾脏系统疾病。患者否认/自述有精神系统疾病。患者否认/自述有青霉素等药物或金属等物质过敏史。患者否认/自述有药物服用史。患者否认/自述有吸烟史。', '牙位图牙颈部楔状深沟，边缘整齐，表面光滑坚硬；深达牙本质浅/中/深层；探（-）/（+）；冷试：（-）/（+）；热试：（-）/（+）；叩诊：（-）/（+）。', '楔状缺损', '充填术', '牙体预备，清洁，玻璃离子充填/3M-Eazy One自酸蚀粘接剂涂布，3M-流体树脂充填，修形，打磨抛光。口腔卫生宣教，刷牙方法示教。', '改正刷牙方法，禁咬硬物。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('112', NULL, '1584730436918124545', '牙齿发黄', '牙齿偏黄要求美白治疗。', '患者因长期饮咖啡，/茶，及/可乐，感觉前牙较黄，前来我院冷光美白治疗。', '患者否认/自述有高血压、冠心病等心血管疾病；糖尿病、痛风等代谢性疾病。患者否认/自述有肝炎、梅毒、艾滋病等传染性疾病。患者否认/自述有红斑狼疮、类风湿性关节炎、桥本氏甲状腺炎等自身免疫性疾病。患者否认/自述有甲亢、甲减等激素紊乱病症。患者否认/自述有肾脏系统疾病。患者否认/自述有精神系统疾病。患者否认/自述有青霉素等药物或金属等物质过敏史。患者否认/自述有药物服用史。患者否认/自述有吸烟史。', '牙冠颜色暗黄/轻度发灰/黄斑，VITA比色板C2。探诊：（-）；冷试：（-）；热试：（-）；松动度：（-）；牙体完整/轻度釉质发育不全，牙龈未见异常。全口口腔卫生可，牙石（+），色素（+）', '黄染牙/轻度四环素牙/氟斑牙', '冷光美白术。患者知情同意签字。', '比色C2,照相存档。牙齿抛光，漱净。涂唇油放置开口器。吹干牙面。涂牙龈保护剂光固化灯照3-4秒。涂抹美白凝胶，美白仪灯照射8分钟，强吸掉美白剂，重复操作，进行第二次及第三次8分钟的疗程。结束。美白完成后漱口。吹干。比色A1，照相存档', '给患者术后注意事项卡片', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('113', NULL, '1584730436918124545', '隐裂', '左/右上/下后右上后牙咀嚼痛及冷热刺激痛数日/周/月。', '左/右上/下后右上后牙近日/周/一月因咀嚼硬物创伤后对冷热刺激敏感，不敢咀嚼。无自发痛史。', '患者否认/自述有高血压、冠心病等心血管疾病；糖尿病、痛风等代谢性疾病。患者否认/自述有肝炎、梅毒、艾滋病等传染性疾病。患者否认/自述有红斑狼疮、类风湿性关节炎、桥本氏甲状腺炎等自身免疫性疾病。患者否认/自述有甲亢、甲减等激素紊乱病症。患者否认/自述有肾脏系统疾病。患者否认/自述有精神系统疾病。患者否认/自述有青霉素等药物或金属等物质过敏史。患者否认/自述有药物服用史。患者否认/自述有吸烟史。', '牙位图近中颌面隐裂，冷（+），热（+），叩（-）（+），松（-）（+）', '隐裂', '暂时冠修复观察牙髓状况', '0.1%必兰麻注射液局麻下，备牙，取模，灌注硬石膏模型，DMG临时义齿修复，丁氧膏粘结。', '禁咬硬物。常规医嘱，不适随诊。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('114', NULL, '1584730436918124545', '继发龋病历', '发现上/下前/后牙补料脱落/补物边缘发黑，要求重新充填。', '年/月上/下前/后牙在本院/外院行充填治疗。年/月/近日发现补料脱落/补物边缘发黑。', '患者否认/自述有高血压、冠心病等心血管疾病；糖尿病、痛风等代谢性疾病。患者否认/自述有肝炎、梅毒、艾滋病等传染性疾病。患者否认/自述有红斑狼疮、类风湿性关节炎、桥本氏甲状腺炎等自身免疫性疾病。患者否认/自述有甲亢、甲减等激素紊乱病症。患者否认/自述有肾脏系统疾病。患者否认/自述有精神系统疾病。患者否认/自述有青霉素等药物或金属等物质过敏史。患者否认/自述有药物服用史。患者否认/自述有吸烟史。', '牙位图远中邻/合面有树脂/银汞充填物/牙体缺损，充填物边缘有缝隙/发黑/软龋。探（-）/（+）；冷试：（-）/（+）；热试：（-）/（+）；叩诊：（-）/（+）；', '牙位图继发龋', NULL, '放置橡皮障，去原充填物及龋坏，备洞。上成型片、楔子。清洁吹干，近髓处氢氧化钙垫底。酸蚀剂酸蚀 ，冲洗吹干。涂布粘接剂，吹薄，光照。3M-Z250树脂分层填入，分层光固化，修形、调颌、抛光。', '禁止患侧咀嚼2小时！不适随诊！勿咬硬物。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('115', NULL, '1584730436918124545', '龋', '上/下前/后牙发现有洞半年。', '半年前上前牙发现有洞，无疼痛，但越来越大，求补。', '患者否认/自述有高血压、冠心病等心血管疾病；糖尿病、痛风等代谢性疾病。患者否认/自述有肝炎、梅毒、艾滋病等传染性疾病。患者否认/自述有红斑狼疮、类风湿性关节炎、桥本氏甲状腺炎等自身免疫性疾病。患者否认/自述有甲亢、甲减等激素紊乱病症。患者否认/自述有肾脏系统疾病。患者否认/自述有精神系统疾病。患者否认/自述有青霉素等药物或金属等物质过敏史。患者否认/自述有药物服用史。患者否认/自述有吸烟史。', '牙位图邻/合/颊/舌/根面龋，深达牙本质浅/中/深层，探（-）/（+）；冷试：（-）/（+）；热试：（-）/（+）；叩诊：（-）/（+）；', '牙位图浅/中/深龋', '充填术', '放置橡皮障，去龋净，备洞。上成型片、楔子。清洁吹干，近髓处氢氧化钙垫底。酸蚀剂酸蚀 ，冲洗吹干。涂布粘接剂，吹薄，光照。3M-Z250树脂分层填入，分层光固化，修形、调颌、抛光。', '禁止患侧咀嚼2小时！不适随诊！勿咬硬物。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('116', NULL, '1584730489837658113', '牙龈炎', '全口牙龈刺激出血数月/年', '刷牙出血数月/年，无疼痛等不适。', '患者否认/自述有高血压、冠心病等心血管疾病；糖尿病、痛风等代谢性疾病。患者否认/自述有肝炎、梅毒、艾滋病等传染性疾病。患者否认/自述有红斑狼疮、类风湿性关节炎、桥本氏甲状腺炎等自身免疫性疾病。患者否认/自述有甲亢、甲减等激素紊乱病症。患者否认/自述有肾脏系统疾病。患者否认/自述有精神系统疾病。患者否认/自述有青霉素等药物或金属等物质过敏史。患者否认/自述有药物服用史。患者否认/自述有吸烟史。', '全口牙龈红肿，探易出血，未及牙周袋。牙石（+++），色素（+++）', '牙龈炎', '全口洁治', '全口龈上洁治，抛光，上药。', '一周内禁进酸性食物，避冷热刺激。常规医嘱保持口腔卫生，漱口水含漱。定期复查，不适随诊。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('117', NULL, '1584730489837658113', '牙龈疾病-色素沉着洗牙', '牙齿着色半年，求洗牙。', '半年来牙齿着色，越来越重，求洗牙。', '患者否认/自述有高血压、冠心病等心血管疾病；糖尿病、痛风等代谢性疾病。患者否认/自述有肝炎、梅毒、艾滋病等传染性疾病。患者否认/自述有红斑狼疮、类风湿性关节炎、桥本氏甲状腺炎等自身免疫性疾病。患者否认/自述有甲亢、甲减等激素紊乱病症。患者否认/自述有肾脏系统疾病。患者否认/自述有精神系统疾病。患者否认/自述有青霉素等药物或金属等物质过敏史。患者否认/自述有药物服用史。患者否认/自述有吸烟史。', '\n全口卫生情况：一般；软垢指数（DI）：软垢指数（DI）：1。牙石指数（CI）：牙石指数（CI）：0=无牙石，色素烟斑（+++）。\n', '1.牙龈炎 2.色素沉着', '1.全口超声波洁治术 2.全口喷砂洁治术。', '全口超声波洁治，喷砂洁治，抛光，上药。', '一周内禁进酸性食物，避冷热刺激。禁咖啡、茶、可乐等含色素饮品，禁止吸烟。保持口腔卫生，漱口水含漱。定期复查，不适随诊。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('118', NULL, '1584730489837658113', '牙龈疾病-龈乳头炎', '左/右上/下后牙疼痛2日', '左/右上/下后牙时有疼痛，近2日加剧，有跳痛，牙龈红肿疼痛不敢碰触。', '在外/本院曾行龋坏治疗。患者否认/自述有高血压、冠心病等心血管疾病；糖尿病、痛风等代谢性疾病。患者否认/自述有肝炎、梅毒、艾滋病等传染性疾病。患者否认/自述有红斑狼疮、类风湿性关节炎、桥本氏甲状腺炎等自身免疫性疾病。患者否认/自述有甲亢、甲减等激素紊乱病症。患者否认/自述有肾脏系统疾病。患者否认/自述有精神系统疾病。患者否认/自述有青霉素等药物或金属等物质过敏史。患者否认/自述有药物服用史。患者否认/自述有吸烟史。', '牙位图近/远中邻颌面补物/中龋。牙位图叩（+），松（—）; 牙间龈乳头红肿，充血，有嵌塞物。', '龈乳头炎', '1.局部冲洗上药 2.牙位图充填治疗/嵌体/冠修复', '去除嵌塞物，局部双氧水生理盐水冲洗，上碘甘油。', '减少患侧咀嚼。保持局部口腔卫生。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('12', NULL, '1584730047212756994', '楔状缺损，玻粘充填', '要求补牙', '近日吃冷热刺激痛', '楔状缺损，无自发痛史', '备洞，氟化玻粘充填', '楔状缺损', NULL, NULL, '常规医嘱，不适随诊', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('13', NULL, '1584730047212756994', '牙外伤', '上前牙因跌倒受伤2天', '2天前因打球时不慎跌倒，上前牙受伤，疼痛明显，牙齿部分缺损，影响进食，上唇擦破出血。', NULL, '牙冠折断冠长的2/3，松动（-），叩诊（+++），牙髓外露，上唇有1cm直径的浅表创口，张闭口及咬颌关系正常。上前\n牙牙槽骨无异常松动。', '冠折', '（1）牙挫伤：保证患牙休息，必要时可调颌，以减轻患牙负担；松动牙固定；定期复诊。（2）牙脱位：应尽快在麻醉下复位，固定1-2个月；完全脱位时，应尽早做牙再植术（最好在脱位后半小时内进行）；有\n牙龈损伤者应行牙龈对症处理，定期复诊。（3）牙折：釉质不完全折断一般可不做处理，缺损少的可磨除锐利边缘并用脱敏剂脱敏；牙冠折断牙髓外露者，行牙髓治\n疗，牙体修复；根折与口腔相通者行根管治疗，牙体修复，纵行根折者往往拔除；不与口腔相通者可复位固定，观察，视牙髓变化情况做根管治疗或拔除。', NULL, NULL, b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('14', NULL, '1584730047212756994', '牙隐裂', '右下后牙咬物后疼痛数月', '数月前右下后牙咬一硬物后出现定点性咀嚼疼痛，近期出现冷刺激不适，无自发性疼痛等', '否认以往有牙痛史和其他重大疾患史', '近远中向裂纹，侧向叩诊不适，冷（+ -）裂纹处咬诊疼痛', '牙隐裂', NULL, NULL, '勿用患侧咀嚼，约日代牙。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('15', NULL, '1584730047212756994', '牙震荡', '上前牙因撞击疼痛1小时。', '一小时前患者因打蓝球时不甚撞击至上前牙，感觉患牙有伸长感，咬合痛来院就诊。', '否认有牙痛史和其他疾患史。', '牙冠完整，轻度松动，龈缘少量出血，叩（+）。冷热诊反应迟钝，', '牙震荡', '患牙调颌，松牙固定，该牙休息，定期复查做牙髓活力测试，如牙变色及时做根管治疗。', NULL, NULL, b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('16', NULL, '1584730047212756994', '窝沟封闭', '家长要求检查患儿换牙情况', '近期发现患儿有新牙长出，要求做口腔检查', '牙科治疗史，否认重大疾病史', '完全萌出，合面窝沟较深，部分软垢', '新生恒牙', NULL, NULL, '叮嘱患儿认真刷牙，保持口腔卫生，3-6月定期复查。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('17', NULL, '1584730047212756994', '隐裂，冠修复', '右上后牙咀嚼痛及冷热刺激痛', '右上后牙近一月因咀嚼硬物创伤后对冷热刺激敏感，不敢咀嚼', NULL, '近中颌面隐裂，冷热刺激敏感，叩（-），松（+），无自发痛史', '隐裂\n牙本质过敏', '冠修复观察牙髓状况', '0.1%必兰麻注射液局麻下，备牙，取模，灌注硬石膏模型，DMG临时义齿修复，丁氧膏粘结', '常规医嘱，不适随诊', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('18', NULL, '1584730047212756994', '乳牙慢性根尖周炎', '要求补牙', '长期咀嚼痛，近日加重。', NULL, '残冠，叩（+），松（++），牙龈略红肿。', '慢性根尖周炎', NULL, NULL, NULL, b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('19', NULL, '1584730047212756994', '乳牙根尖周炎', '发现患儿右下牙龈长一突起物3+日', '3+日前发现患儿右下靠外侧牙龈长一突起物，压痛不明显，无明显自发性疼痛', '否认牙科治疗史及重大疾病史', '近中邻合面洞，可见较大穿髓孔，冷（-）探（-）叩（+ -）松1°，颊侧见粟粒大小瘘管口，挤压见脓点渗出，周围牙龈发红光亮，轻微压痛', '慢性根尖周炎', '干髓治疗', '去腐，封FC.', '叮嘱患儿勿用患侧咀嚼，1周复诊。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('2', NULL, '1584729973401395202', '多生牙拔除', '要求拔除多生牙', '无特殊。', '患者否认/自述有肝炎、梅毒、艾滋病等传染性疾病。患者否认/自述有红斑狼疮、类风湿性关节炎、桥本氏甲状腺炎等自身免疫性疾病。患者否认/自述有甲亢、甲减等激素紊乱病症。患者否认/自述有肾脏系统疾病。患者否认/自述有精神系统疾病。患者否认/自述有青霉素等药物或金属等物质过敏史。患者否认/自述有药物服用史。患者否认/自述有吸烟史。', '11、21间多生牙，无松动，叩（-）。', '多生牙', '拔除11、21间多生牙', '\n局部聚维酮碘消毒，牙位图碧兰麻浸润麻醉。待麻药发挥效果后分离牙龈，挺松牙齿，拔牙钳取出。常规搔刮拔牙创，压迫止血。', '严格遵守《拔牙后注意事项》，口服抗生素（自备），不适随诊。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('20', NULL, '1584730047212756994', '急性化脓性根尖周炎', '左下牙肿痛3天。', '患者左下牙有龋洞数年，无不适感，三天前嚼觉食物后疼痛，开始嚼觉轻疼痛，今疼痛渐加重伴肿来诊。', NULL, '36龋深及髓，无探痛；松动3度；叩痛+++，根尖部红肿，扪痛，有波动感；左侧面颊部水肿；体温38度。余牙检查无特殊情况。', '急性化脓性根尖周炎', '根管治疗后冠修复。', NULL, NULL, b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('21', NULL, '1584730047212756994', '急性根尖周炎', '右下后牙咀嚼痛1+周，持续性跳痛2+日', '1+周前右下后牙出现进食咀嚼痛，2+日前疼痛加剧，不敢用患侧咀嚼，不敢触碰患牙，患牙有伸长浮出感，呈持续性跳痛，能感觉到患牙位置，口服消炎止痛药未见明显缓解', '否认以往有牙痛史和其他重大疾患史', '远中邻面龋，探及穿髓孔，探（-）叩（+++）松1°，颊侧粘膜潮红，有压痛，但无明显肿胀，右下淋巴结肿大有压痛，温度刺激无反应', '急性根尖周炎', NULL, NULL, '口服消炎止痛药，因急性根尖周炎发病的复杂性，疼痛一般会在1-3日内逐渐缓解，3日后复诊。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('22', NULL, '1584730047212756994', '慢性根尖周炎', '复诊补牙，双侧食物嵌塞', NULL, '右下后牙曾在外院开髓治疗', '颌面有开髓孔，松（+），叩(+-);,颊侧粘膜有一瘘管。', '慢性根尖周炎', NULL, NULL, '常规医嘱，不适随诊', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('23', NULL, '1584730047212756994', '慢性根尖周炎急性发作', '左上后牙持续痛三日', NULL, '曾在外院治疗，未按时复诊', '颌面有开髓孔，叩（+++）,近中邻颌面有银汞合金充填物', '慢性根尖炎急性发作', NULL, NULL, '常规医嘱，不适随诊', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('24', NULL, '1584730047212756994', '慢性根尖周炎急性发作', '左下后牙持续痛数月', NULL, '曾在外院治疗，效果不佳，到外院治疗', '颌面有开髓孔，叩（+++），', '慢性根尖炎急性发作', '根管治疗，冠修复', '调颌，揭髓顶，疏通根管，开放引流，口服抗生素。', NULL, b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('26', NULL, '1584730047212756994', '慢性根尖囊肿', '右上牙食物嵌塞数年余要求诊治。', '右上牙发现龋洞数年，曾有疼痛过，经常有食物嵌塞，现要求诊治。', '患者有牙疼痛史，无其他重大疾患史。', '右上4牙合面龋坏，探诊（-），冷热诊（-），叩（-），牙龈处有一瘘道，牙齿无松动。', '根尖囊肿', '\n\n', '\n常规开髓，拔髓、无痛、根管治疗、充填。三个月后，瘘道未消失，阴影未缩小，行囊肿除切除术及根尖切除术。', '三个月复诊。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('27', NULL, '1584730047212756994', '慢性龈缘炎', '牙龈经常出血2年', '患者两年来早晨刷牙牙龈出血，用清水漱口后可以停止。有时吃东西的时候也会出血，未感觉到有明显的疼痛，患者感觉\n很苦恼，前来就诊。否认洁牙史，刷牙2次/天，每次2min，横竖刷。', '患者近几年一直偶尔有牙龈出血的现象，但症状较轻。否认药物过敏史，否认系统疾病史。\n个人史：吸烟4年，每天大约10支\n家族史：父母身体健康，无其他疾病。', '全口卫生状况差，软垢、色素（+++），牙石（++），其中下颌前牙舌侧牙石覆盖牙体1/2。BI普遍2~4，PD≈1~\n3mm。多颗牙龈缘及龈乳头色深红，肿胀，点彩消失。未探及松动牙，叩诊均未见异常。', '慢性龈缘炎', NULL, '1、向患者交代病情、治疗计划及相关费用，患者知情同意，要求治疗。2、OHI，3%双氧水含漱半分钟，超声龈上洁治，3%双氧水冲洗，上碘甘油。', '半小时后再喝水。一周后复查治疗及患者维护效果。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('28', NULL, '1584730047212756994', '有瘘型慢性根尖周炎', '右上后牙反复肿痛，牙龈起脓包6 个月。', '一年前右上后牙曾有冷热痛史，曾在外院治疗过，一月前进食时将治疗过的牙咬断。', NULL, '15 残根，根管外露，探不通，叩（-）。14 颈部锲状缺损并发深龋，探已穿髓，无反应，冷热测无反映，叩（+），\n松动1度。', '右上4慢性根尖脓肿（有瘘型）', '（1）14根管治疗，充填颊颈部缺损，观察根尖病变的修复情况后考虑修复；\n（2）15拔除后义齿修复。', NULL, NULL, b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('29', NULL, '1584730047212756994', '牙周牙髓联合病变', '左上后牙钝痛数日', '近日感觉左上后牙略松动，钝痛', '曾在外院拔牙数年', '松（+），叩（+），冷（++），牙龈萎缩，牙根暴露', '牙周牙髓联合病变', NULL, NULL, '常规医嘱，不适随诊', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('3', NULL, '1584729973401395202', '乳牙拔除病历', '乳牙滞留，要求拔除', '恒牙已萌出,乳牙长期不脱落，要求拔除', '否认全身系统性疾病及传染病和药物过敏史。', '牙位图松（-）/Ⅰ/Ⅱ/Ⅲ度。牙位图在其舌/腭侧萌出。余无特殊。', '牙位图滞留', '牙位图拔除', '局部聚维酮碘消毒，牙位图涂抹表面麻醉膏，碧兰麻局部浸润麻醉。待麻药发挥效果后分离牙龈，拔牙钳取出，压迫止血。', '严格遵守《拔牙后注意事项》，不适随诊。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('30', NULL, '1584730047212756994', '牙隐裂，根尖周炎', '左上后牙剧烈痛1日', '右上后牙长期冷热痛，现加重，持续痛，近一日加重', NULL, '颌面远中舌尖隐裂，叩痛（+++），冷（+-），松（+）。', '隐裂，急性根尖炎。', NULL, NULL, '常规医嘱，不适随诊', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('31', NULL, '1584730047212756994', '磨耗性根尖周炎伴牙髓炎', '右上前牙持续痛，牙伸长感。', '在外诊所采用口服药治疗，效果不佳，现在我门诊继续治疗', NULL, '颌面严重磨耗，唇侧楔状缺损，叩（++），冷（+），松（-）。', '磨耗性根尖周炎伴牙髓炎', NULL, NULL, '常规医嘱，不适随诊', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('32', NULL, '1584730047212756994', '中龋', '右下后牙食物嵌塞,凉刺激敏感1+月', '1+月前发现右下后牙食物嵌塞,冷刺激敏感症状,无自发性疼痛\n既往史:否认以往有牙痛史和其他重大疾患史\n', NULL, '远中邻合面洞达牙本质层,探(+ -);冷(+ -);扣(-);', '中龋', NULL, NULL, '保持口腔卫生,不适随诊', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('33', NULL, '1584730047212756994', '中龋模板', '右上牙易塞食物一周', '一周前患儿感觉右上牙易嵌塞食物，否认自发痛。前来治疗。', '否认全身系统性疾病及传染病和药物过敏史。', '远中邻颌面龋洞未及牙髓，探诊：（-）；冷试：（-）；热试：（-）；叩诊：（-）；松动度：（-）；牙龈未见异常，电活力测试：（+）；', '中龋', NULL, NULL, '两个小时后用对侧咀嚼，24小时后用双侧咀嚼。不适随诊！', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('34', NULL, '1584730047212756994', '中龋治疗', '要求填补右侧蛀牙', NULL, NULL, '17、47、46颊面沟及颌面窝沟可见牙体色黑，探针可探入，表面粗糙，探诊略有酸感。探（-）叩（-）松（-），冷诊\n同对照牙', '17、47、46中龋', '建议充填', '17、47、46   1、向患者交代病情、治疗计划及相关费用，患者知情同意，要求治疗。  2、去腐净后达牙本质浅层，修\n整洞型，预备小斜面。隔湿干燥，自酸蚀，3M超强树脂充填，调合，抛光。', '若不适感明显，及时复诊。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('35', NULL, '1584730047212756994', '中龋治疗模板', '右上后牙发现有洞一周', '一周前发现右上后牙有龋，遇冷敏感，前来我院治疗。', '否认全身系统性疾病及传染病和药物过敏史。', '\n牙冠腭面龋，未及牙髓 ，探诊：（-）；叩诊：（-）；冷试：（+-）；热试：（-）；松动度：（-）；电活力测试：（+）；牙龈未见异常。\n', '中龋', NULL, NULL, '24小时后可以咀嚼,不适随诊！', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('36', NULL, '1584730047212756994', '中龋，二类洞树脂充填', '要求补牙', '最近因左下牙刮舌不舒服发现左下牙有一洞', NULL, '远中邻面中龋，叩（-），松（-），冷（+），牙周无异常，无自发痛史。', '中龋', NULL, NULL, '常规医嘱，不适随诊', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('37', NULL, '1584730047212756994', '乳牙龋坏', '发现右下后牙一洞、咬物痛数日', '数日前家长发现患儿右下后牙一洞，食嵌，无自发性疼痛', '否认牙科治疗史及重大疾病史', '近中邻合面洞，质地较软，冷（+ -）探（+ -）叩（-）', '龋坏', NULL, NULL, '1h后进食，保持口腔卫生，因患儿牙齿正处于发育高峰期，后期可能易导致充填物脱落，请及时复诊。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('38', NULL, '1584730047212756994', '充填物部分脱落', '左上后牙充填物脱落半年，求补。', '左上后牙三年前于外地充填，半年前脱落，未曾疼痛，嵌塞食物，求补。', '否认全身系统性疾病及传染病和药物过敏史。', '远中邻颌面龋洞，充填物部分脱落，探诊：（-）；冷试：（-）；热试：（-）；叩诊：（-）；松动度：0。', '充填物脱落', '建议拍片，患者要求先充填。', '去原充填物及龋，净，备洞，清洗，3M-P60树脂充填分层填入，分层光固化，调颌，抛光。', '嘱勿咬硬物。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('39', NULL, '1584730047212756994', '楔形缺损', '牙酸痛不适', '现因牙酸不适来就诊', NULL, '24、25、26、35、36颈部缺损呈楔状浅，冷（+），叩（-），探（++），27颌面龋深，冷（++），叩（-），37颌面龋中，冷（+），叩（-），', '24、25、26、35、36楔状缺损\n27深龋\n37中龋', '24、25、26、27、35、36、37充填', '24、25、26、35、36GC充填，抛光\n27DACYL垫底，FXⅡ垫底，3M纳米树脂充填\n37光固化氢氧化钙垫底，3M纳米树脂充填', '不适随诊', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('4', NULL, '1584729973401395202', '松动牙拔除', '牙齿松动数月/年', '左/右上/下牙齿逐渐松动、移位，影响咀嚼，无疼痛等不适。', '患者否认/自述有高血压、冠心病等心血管疾病；糖尿病、痛风等代谢性疾病。患者否认/自述有肝炎、梅毒、艾滋病等传染性疾病。患者否认/自述有红斑狼疮、类风湿性关节炎、桥本氏甲状腺炎等自身免疫性疾病。患者否认/自述有甲亢、甲减等激素紊乱病症。患者否认/自述有肾脏系统疾病。患者否认/自述有精神系统疾病。患者否认/自述有青霉素等药物或金属等物质过敏史。患者否认/自述有药物服用史。患者否认/自述有吸烟史。', '牙位图牙龈中重度退缩，松Ⅲ/Ⅳ度，叩（- +）。余无特殊。', '牙位图牙周炎', '牙位图拔除', '局部聚维酮碘消毒，盐酸利多卡因上/下齿槽神经阻滞麻醉/牙位图碧兰麻局部浸润麻醉。待麻药发挥效果后分离牙龈，拔牙钳取出。常规搔刮拔牙创，压迫/缝合止血。', '严格遵守《拔牙后注意事项》，口服抗生素（自备），不适随诊。一周后拆线。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('40', NULL, '1584730047212756994', '正畸转诊补牙', '正畸转诊要求补牙', '正畸转诊要求补牙', NULL, '11远中邻面龋中，冷（+）', '11中龋', '11充填', '11去净腐质，氢氧化钙垫底，3MP60充填，抛光', '不适随诊', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('41', NULL, '1584730047212756994', '浅龋', '发现上前牙黑点1+月', '1+月前发现上前牙黑点,无任何不适症状', '否认以往有牙痛史和其他重大疾患史', '近中黑褐色变,探诊有粗糙感,探诊能进入至牙釉质层,探(-);叩(-);冷、热诊（-）', '浅龋', NULL, NULL, '保持口腔卫生,不适随诊', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('42', NULL, '1584730047212756994', '浅龋，楔形缺损', '左下后牙冷热酸甜刺激后疼痛', '几周患者偶然发现左下后牙横沟，冷热酸甜刺激后疼痛，刷牙时左、右侧牙酸痛。无明显自发痛', '有横向刷牙史。否认有心脏病、高血压、糖尿病、肝炎、血液系统疾病、甲状腺功能亢进、肾脏疾病、神经精神疾患等疾病；', '牙颈部楔状深沟，边缘整齐，表面光滑坚硬；深达牙本质浅层；探诊：（+）；叩诊：（-）；冷试：（+）；热试：（+-）；\n', '浅龋\n楔状缺损', NULL, '去龋，备洞，消毒，干燥，隔湿，3MP60树脂充填，抛光。\n排龈，去表污染层，消毒，干燥，隔湿，3MP60树脂充填，抛光。\n排龈，去表污染层，消毒，干燥，隔湿，光固化氢氧化钙垫底，3MP60树脂充填，抛光。\n排龈，去表污染层，消毒，干燥，隔湿，Dycal,FXⅡ双层垫底，3MP60树脂充填，抛光。', '若有疼痛需要根管治疗。\n注意刷牙方式。\n不适随诊。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('43', NULL, '1584730047212756994', '浅龋，牙周', '左下后牙疼痛2天就诊', '左下后牙半年前外院治疗，现再次疼痛，要求治疗。', NULL, '36合面有充填物，叩（+）松（Ⅱ）探诊7MM出血4度\n46颊面龋洞探（-）叩（-）松（Ⅰ）探诊5MM出血4度\n全口牙龈红肿，探诊易出血，龈上牙石++ 龈下牙石++', '36牙周牙髓综合征\n46浅龋，合创伤\n慢性牙周炎', '36拔除后种植，因患者明天有重要事情，改天再复诊拔除。\n46充填调合观察\n龈上洁治后牙周治疗', '46去龋，尽，备洞，干燥，3MP60树脂充填，调颌。', '不适随诊', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('44', NULL, '1584730047212756994', '深龋', '左下后牙进食时疼痛1+月', '1+月前左下后牙出现进食时疼痛,冷热饮食或食物嵌塞时疼痛明显,无自发性疼痛', '否认以往有牙痛史和其他重大疾患史', '远中邻面牙体变色,探诊龋洞达牙本质深层,探及酸痛敏感点,未探及明显穿髓孔,冷(+ -);探(+ -);叩(-);刺激后症状马上消失', '深龋', NULL, NULL, '保持口腔卫生,若疼痛及时复诊RCT,不适随诊', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('45', NULL, '1584730047212756994', '发龋', '发现补料脱落要求重新充填。', '发现补料脱落要求重新充填。', '否认全身系统性疾病及传染病和药物过敏史。', '\n远中邻颌面有树脂充填物，充填物边缘有缝隙，探诊：（-）；叩诊：（-）；冷试：（-）；热试：（-）；\n', '继发龋', '3M-Z250树脂修复， 3M-Z250树脂修复， 表麻下拔除。', '去原充填物，去龋净，备洞，清洗，棉卷隔湿法隔湿，3M自酸蚀粘接剂涂布，光照10秒，3M流体树脂垫底，3M-Z350树\n脂分层填入，分层光固化，调颌抛光。 去原充填物，去龋净，备洞，清洗，棉卷隔湿法隔湿，3M自酸蚀粘接剂涂布，光\n照10秒，3M流体树脂垫底，3M-Z350树脂分层填入，分层光固化，调颌抛光。 表麻下拔除。', NULL, b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('46', NULL, '1584730047212756994', '邻合面洞', '要求填补右侧蛀牙', NULL, NULL, '14、15远中邻合面龋损，探敏感，叩（-）松（-），冷诊\n同对照牙', '14、15深龋', '14、15建议充填或嵌体修复', '14、15去腐净后达牙本质深层，修整洞型，预备小斜面。隔湿干燥，自酸蚀，3M超强树脂充填，调合，抛光。', '若不适感明显，及时复诊。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('47', NULL, '1584730047212756994', '龋充填', '上前牙发现有洞半年。', '半年前上前牙发现有洞，无疼痛，但越来越大，求补。', '否认全身系统性疾病及传染病和药物过敏史。', '间隙龋，深达牙本质中层以下，探诊：（-）；冷试：（-）；热试：（-）；叩诊：（-）；', '深龋', NULL, NULL, '禁止患侧咀嚼！不适随诊！', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('48', NULL, '1584730047212756994', '一次性根管治疗', '左侧后牙疼痛1月。', '右下后牙有洞，于外院充填后冷热刺激痛，咀嚼食物刺激痛。一个月余。无明显咬合痛。要求治疗。', '否认有心脏病、高血压、糖尿病、肝炎、血液系统疾病、甲状腺功能亢进、肾脏疾病、神经精神疾患等疾病；', '远中邻唇面龋洞，已充填。边缘不密合。探诊：（-）；叩诊：（-）；冷试：（+）；热试：（+）；松动度：（-）；', '慢性牙髓炎', '根管治疗后全冠保护。', '于4%阿替卡因1.7mlX1支局部浸润麻醉下，开髓，揭髓顶，探查根管口有 2 个，拔髓；电测根管长度；大锥度根向预备技\n术预备根管；逐步后退法根管预备至35号锉；冲洗吸干，根管糊剂加牙胶尖根充，X线片显示根充恰填，水门汀垫底。预约\n两周后复诊，做冠保护。', '预约两周后复诊，做冠保护。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('49', NULL, '1584730047212756994', '乳牙去髓治疗', '右侧后牙咀嚼食物刺激痛7天。', '右侧后牙咀嚼食物刺激痛，遂于今日来我院求治。', '否认全身系统性疾病及传染病和药物过敏史。', '近中邻颌面龋洞，探诊：（+）；叩诊：（+-）；冷试：（+）；热试：（-）；松动度：（-）；', '慢性牙髓炎', NULL, NULL, '严禁患侧咀嚼，不适随诊', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('5', NULL, '1584729973401395202', '正畸牙拔除', '正畸治疗要求拔牙。', NULL, NULL, '牙列拥挤，14、24、34、44牙冠未见明显龋坏。余无特殊。', '牙列拥挤', '14、24、34、44拔除，转正畸治疗。', '局部聚维酮碘消毒，盐酸利多卡因上齿槽神经阻滞麻醉/牙位图碧兰麻浸润麻醉。待麻药发挥效果后分离牙龈，挺松牙齿，拔牙钳取出。常规搔刮拔牙创，压迫止血。', '严格遵守《拔牙后注意事项》，口服抗生素（自备），不适随诊。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('50', NULL, '1584730047212756994', '乳牙复诊', '经处理无不适继续治疗', '经处理无不适继续治疗', NULL, NULL, '65慢性牙髓炎', NULL, '65去暂封，疏通根管，3%双氧水和生理盐水交替冲洗，Vitapex充填，FXⅡ充填。', '常规医嘱，不适随诊', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('51', NULL, '1584730047212756994', '乳牙失活', '左下后牙偶有疼痛', '左下后牙前天夜间疼痛了一小会儿，刷牙时疼过一次', NULL, '牙合面龋深，食物残渣多，探（+）,叩（-），松（-）', '牙髓炎', '干髓术', '去龋，无砷失活剂+OC棉球置窝洞内，玻璃离子暂封。', '不用患侧咀嚼，一周复诊，告知有疼痛的可能，若疼痛严重随诊。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('52', NULL, '1584730047212756994', '乳牙慢性牙髓炎', '右上后牙咬东西崩了一块', '左上后牙有洞，咬东西崩了一块，长期出差没时间看牙，现在过来要求治疗，冷热刺激痛，咀嚼食物刺激痛。', '否认有心脏病、高血压、糖尿病、肝炎、血液系统疾病、甲状腺功能亢进、肾脏疾病、神经精神疾患等疾病；', '远中邻合面龋洞，探诊（+）；叩诊（-）；冷试（+）；热试（+）；松动度（-），牙龈（-）\n近中邻面中龋洞，洞内呈黑色，探诊（-）；叩诊（-）；冷试（-）；热试（-）；松动度（-），牙龈（-）', '慢性牙髓炎\n中龋', '根管治疗后全冠保护。\n充填', '于4%阿替卡因1.7mlX1支局部浸润麻醉下，开髓，冲洗止血，吸干，VOCO-Depulpin牙髓失活剂暂封。7日后复\n诊。\n去腐，修整洞型，预备小斜面。隔湿干燥，3MP60充填，调颌，抛光', '勿用该牙咬东西，头一两天轻微疼痛属正常现象，如果疼痛未缓解，及时复诊。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('53', NULL, '1584730047212756994', '乳牙根管治疗', '左上门牙反复肿包', '左上门牙反复肿包，患儿曾因疼痛哭闹过', NULL, '近中邻面龋损，唇侧瘘道，松Ⅲ°，叩（+-）', '慢性根尖周炎', '根管治疗术', '舌侧开髓，通畅根管14mm，3%过氧化氢+生理盐水交替冲洗，碘伏棉捻暂封。', '一周复诊，不适随诊。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('54', NULL, '1584730047212756994', '乳牙牙髓炎', '经处理无不适要求继续治疗', NULL, NULL, '25叩（-）松（-），暂封存。', '25慢性牙髓炎', NULL, '25去暂封，生理盐水冲洗，干燥，消毒，隔湿，vitapex根充，拍片到位，磷酸锌垫底，FXII充填，调牙合，抛光。', '避免进食过硬食物，以免充填物脱落。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('55', NULL, '1584730047212756994', '乳牙牙髓炎伴根尖周炎', '右下后牙疼痛', '右下后牙疼痛', '曾在我门诊做充填治疗', '远中邻颌洞，有银汞合金充填物，叩（+），冷（+）。', '根尖周炎。', NULL, NULL, '常规医嘱，不适随诊。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('56', NULL, '1584730047212756994', '乳牙牙髓炎失活', '左/右上/下前/后牙咀嚼食物刺激痛数日/周/月。', '左/右上/下前/后牙咀嚼食物刺激痛，有/无自发痛，夜间加剧。', '曾在我门诊做充填治疗。否认全身系统性疾病及传染病和药物过敏史。', '牙位图近/远中邻/合面龋洞，探诊：（+）；叩诊：（+-）；冷试：（+）；；热试：（-）；松动度：（-）。', '牙位图慢性牙髓炎/深龋', '根管治疗术/干髓术', '于4%阿替卡因1.7mlX1支局部浸润麻醉下，开髓，冲洗止血，吸干，VOCO-Depulpin牙髓失活剂暂封。', '10日后复诊。严禁患侧咀嚼，不适随诊。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('57', NULL, '1584730047212756994', '局麻失活', '左侧后牙疼痛1月。', '左上后牙有洞，冷热刺激痛，咀嚼食物刺激痛。一个月余。无明显咬合痛。要求治疗。', '否认有心脏病、高血压、糖尿病、肝炎、血液系统疾病、甲状腺功能亢进、肾脏疾病、神经精神疾患等疾病；', '远中邻唇颊面龋洞，探诊：（+）；叩诊：（-）；冷试：（+）；热试：（+）；松动度：（-）；', '慢性牙髓炎', NULL, NULL, NULL, b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('58', NULL, '1584730047212756994', '急性牙髓炎', '患牙无不适，继续治疗', '左/右上/下后牙冷热刺激痛，近日加剧，夜间加剧。', '左/右上/下后牙有洞，数年前在我院/外院行龋齿充填术。患者否认/自述有高血压、冠心病等心血管疾病；糖尿病、痛风等代谢性疾病。患者否认/自述有肝炎、梅毒、艾滋病等传染性疾病。患者否认/自述有红斑狼疮、类风湿性关节炎、桥本氏甲状腺炎等自身免疫性疾病。患者否认/自述有甲亢、甲减等激素紊乱病症。患者否认/自述有肾脏系统疾病。患者否认/自述有精神系统疾病。患者否认/自述有青霉素等药物或金属等物质过敏史。患者否认/自述有药物服用史。患者否认/自述有吸烟史。', '暂封物在位，叩（-），松（-）。牙龈未见异常。', '急性牙髓炎', '牙位图根管治疗术。患者知情同意签字。', '去暂封，髓腔清洁，根管口无异物。隔湿干燥下，进口糊剂+牙胶尖冷侧压充填根管X③。拍片示：恰填。隔湿干燥，磷\n酸锌水门汀垫底，进口玻璃离子充填，调合。', '充填体未完全固化，故2小时后再喝水，24小时勿用右侧咬物。不适随诊。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('59', NULL, '1584730047212756994', '急性牙髓炎-初诊', '右下后牙疼痛三个月，疼痛加重三天。', '三个月前患者发现右下后牙有洞，时有食物嵌入洞内，并有少许不适感。患者自觉可以忍受，故未曾治疗。后右下后牙逐渐出现咬合不适，傍晚症状更明显。晨起用凉水漱口也会有刺激痛。三天前患牙疼痛加剧，夜不能寐。今因剧痛而来就诊。自诉有时牙疼可伴有右侧耳颞部疼痛。', NULL, '远中合面窝沟可见深大龋洞，内含大量软腐及食物残渣。探针探入有轻微疼痛，可探及穿髓孔。冷诊疼痛明显，叩诊（±），龈缘少量软垢，色红。', '急性牙髓炎', NULL, '1、向患者交代病情、治疗计划及相关费用，患者知情同意，要求治疗。\n2、2%利多卡因局麻下开髓，揭顶，探及MB、ML、D三个根管口。电测WL，MB=18mm,ML=17.5mm,D=18mm。拔髓\nX③，手扩+EDTA+3%H2O2根管预备至35#.插主牙胶尖拍片示：达工作长度。隔湿干燥，封FC棉捻X③，ZOE暂封。', '一周后复诊继续治疗。因FC刺激性大，且有半抗原性，故若有不适随诊。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('6', NULL, '1584729973401395202', '上颌智齿拔除', '食物嵌塞', '左/右上后牙萌出后经常出现食物嵌塞，牙龈红肿易出血。', '患者否认/自述有高血压、冠心病等心血管疾病；糖尿病、痛风等代谢性疾病。患者否认/自述有肝炎、梅毒、艾滋病等传染性疾病。患者否认/自述有红斑狼疮、类风湿性关节炎、桥本氏甲状腺炎等自身免疫性疾病。患者否认/自述有甲亢、甲减等激素紊乱病症。患者否认/自述有肾脏系统疾病。患者否认/自述有精神系统疾病。患者否认/自述有青霉素等药物或金属等物质过敏史。患者否认/自述有药物服用史。患者否认/自述有吸烟史。', '牙位图伸长/颊向低位埋伏阻生，龋坏，近中食物嵌塞，龈乳头红肿、充血。余无特殊。', '牙位图龋坏/阻生牙', '牙位图拔除', '局部聚维酮碘消毒，盐酸利多卡因上齿槽神经阻滞麻醉/牙位图碧兰麻浸润麻醉。待麻药发挥效果后分离牙龈，挺松牙齿，拔牙钳取出。常规搔刮拔牙创，压迫/缝合止血。', '严格遵守《拔牙后注意事项》，口服抗生素（自备），不适随诊。一周后拆线。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('60', NULL, '1584730047212756994', '慢性牙髓炎', '右上后牙进食后明显疼痛3+日', '患者近1月出现右上后牙进食后嵌塞及轻微疼痛症状，3+日前进食后出现明显疼痛症状，刷牙和取出嵌塞食物后疼痛可缓解，无自发性疼痛，未口服消炎止痛药', '\n患者否认/自述有高血压、冠心病等心血管疾病；糖尿病、痛风等代谢性疾病。患者否认/自述有肝炎、梅毒、艾滋病等传染性疾病。患者否认/自述有红斑狼疮、类风湿性关节炎、桥本氏甲状腺炎等自身免疫性疾病。患者否认/自述有甲亢、甲减等激素紊乱病症。患者否认/自述有肾脏系统疾病。患者否认/自述有精神系统疾病。患者否认/自述有青霉素等药物或金属等物质过敏史。患者否认/自述有药物服用史。患者否认/自述有吸烟史。', '远中邻面龋，探及穿髓孔，探（+）冷（+）叩（+ -），周围牙龈无明显红肿，无触压痛。', '慢性牙髓炎', '牙位图根管治疗术。患者知情同意签字。', '\n4%阿替卡因1.7mlX1支局部浸润麻醉。上橡皮障，去腐 开髓，揭髓顶，探查根管口有两个，拔髓；GG钻预备根上三分之一，15#K锉探查根管长度，根测仪测量长度远中颊根长度为16.5mm，近中颊根长度为17mm，腭根长度为17mm。拍片确认根管长度。大锥度根向预备技术预备根管，机扩至F1；次氯酸钠和生理盐水交替冲洗，吸干，氢氧化钙糊剂暂封。', '勿用患侧咀嚼，1-2周复诊。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('61', NULL, '1584730047212756994', '慢性牙髓炎1', '右下后牙疼痛，夜间痛2天', '现因牙痛，冷热痛来就诊', '否认有心脏病、高血压、糖尿病、肝炎、血液系统疾病、甲状腺功能亢进、肾脏疾病、神经精神疾患等疾病，鼻炎史', '48 远中邻合面龋洞深，探诊（+）；叩诊（-）；冷试（+++）；松动度（-），牙龈（-）\n46远中食物嵌塞，远中邻颌面龋洞深，冷（-），叩（+）\n17残根，叩(-),\n15、14颈部龋洞深，呈楔状，冷（-）\n13缺失，患者鼻根部牙痛明显', '48慢性牙髓炎\n14、46根尖肉芽肿\n17残根\n13缺失', '14、48、46治疗后嵌体修复\n13建议耳鼻喉科治疗鼻炎后种植或冠修复\n17拔除后种植或者冠修复', '48局部麻醉下，开髓，失活7日后复诊', '勿用该牙咬东西，轻微疼痛属正常现象，如果疼痛未缓解，及时复诊。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('62', NULL, '1584730047212756994', '慢性牙髓炎急性发作', '右下后牙疼痛', '右下后牙之前塞牙蛀坏成洞，近日咬物崩掉遇冷热会痛，昨晚自发性，阵发性疼痛', '否认有心脏病、高血压、糖尿病、肝炎、血液系统疾病、甲状腺功能亢进、肾脏疾病、神经精神疾患等疾病', '45 远中邻合面龋洞，探诊（+）；叩诊（-）；冷试（+）；松动度（-），牙龈（-）\n近中黑褐色变,探诊有粗糙感,探诊能进入至牙釉质层,探(-);叩(-);冷、热诊（-）', '45 慢性牙髓炎\n浅龋', '45根管治疗后1.全冠保护。2. 充填', '45局部浸润麻醉下，开髓，冲洗止血，吸干，VOCO-Depulpin牙髓失活剂暂封。7日后复诊', '勿用该牙咬东西，轻微疼痛属正常现象，如果疼痛未缓解，及时复诊。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('63', NULL, '1584730047212756994', '慢性牙髓炎模板', '左上牙嵌塞食物疼痛一月。', '一月前左上牙嵌塞食物疼痛，常为钝痛或胀痛，自发痛不明显，现来治疗。', '否认全身系统性疾病及传染病和药物过敏史。否认有药物过敏史。', '远中邻颌面龋洞及牙髓 ，探诊：（-）；冷试：（+-）；热试：（+-）；松动度：（-）；叩诊：（+-）；电活力测试：（+-）；牙龈未见异常。', '慢性牙髓炎', NULL, NULL, '6天复诊不适随诊', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('64', NULL, '1584730047212756994', '慢性牙髓炎（初诊）', '右下后牙有洞三个月，疼痛一天。', '三个月前患者发现右下后牙有洞，时有食物嵌入洞内，并有少许不适感。患者自觉可以忍受，故未曾治疗。后右下后牙逐\n渐出现咬合不适，傍晚症状更明显。晨起用凉水漱口也会有刺激痛。一天前患牙突然疼痛起来，故来诊求治。', NULL, '远中合面窝沟可见深大龋洞，内含大量软腐及食物残渣。探针探入有轻微疼痛，未探及穿髓孔。冷诊校对照牙敏感，叩诊\n（+），龈缘少量软垢，色红。', '慢性牙髓炎', NULL, '1、向患者交代病情、治疗计划及相关费用，患者知情同意，要求治疗。\n2、去腐未净露髓，略扩大穿髓孔。隔湿干燥，慢失活剂覆盖，丁香油棉球+ZOE暂封。', '一周后复诊继续治疗。近几天患牙可能有轻微不适，若出现疼痛或不适感明显，及时复诊', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('65', NULL, '1584730047212756994', '根尖肉芽肿', '门牙缺损，影响美观', '现因牙齿缺损来就诊', NULL, '21色暗，近中切缺损，叩（+），冷（-)', '21根尖肉芽肿', '21治疗，冠修复', '21去除根充物，测长，机扩（19mm），冲洗，热牙胶填，玻璃离子填', '如有不适，口服消炎药', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('66', NULL, '1584730047212756994', '根管治疗', '左上后牙疼痛', NULL, NULL, '与前后邻牙之间食物嵌塞，叩痛（+），冷热刺激痛，夜间痛。', '急性牙髓炎，牙周牙髓合并症。', '根管治疗，全冠修复。', '2%利多卡因5ml局麻下开髓，髓腔内有大量鲜红色血性分泌物溢出。GG钻预备根上三分之一，机扩至F1，测得远中颊根长\n度为16.5mm，近中颊根长度为17mm，腭根长度为17mm,生理盐水冲洗根管，干棉球敞开引流。', '常规医嘱，不适随诊。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('67', NULL, '1584730047212756994', '根管治疗后冠修复及残根拔除', '右上后牙反复疼痛5年。', '右上后牙反复疼痛，影响咀嚼，求治。', '否认全身系统性疾病及传染病和药物过敏史。', '残冠，大面积龋坏，冷试：（+-）；热试：（+-）；探诊：（+）；叩诊：（-）；', '慢性牙髓炎', NULL, NULL, '棉球压迫30min ，尊医嘱，不适复诊。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('68', NULL, '1584730047212756994', '牙本质过敏症', '右下后牙咀嚼时酸痛1+月', '1+月前右下后牙咀嚼时出现酸痛症状，尤其对酸甜食物/硬物/刷牙时明显，畏过冷过热食物，无自发性疼痛及夜间痛，以往喜欢嚼硬食物，有右侧咀嚼习惯', '否认以往有牙痛史和其他重大疾患史', '\n双侧后牙磨牙咬合面磨耗明显，右下后牙过度磨耗暴露牙本质，合面可探及多处敏感点，冷（+ -）叩（-）\n', '牙本质过敏', NULL, NULL, '1h内勿进食饮水等，若症状加重或疼痛及时复诊RCT，不适随诊。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('69', NULL, '1584730047212756994', '牙髓坏死', '上前牙变色1+年', '1+年前因意外致上前牙碰伤，以后发现患牙变色变暗，未经治疗，无明显疼痛症状出现', '否认以往有牙痛史和其他重大疾患史', '牙冠暗灰色，无缺损，、无松动，叩（-）冷热（-）电活力测试无反应', '牙髓坏死', NULL, NULL, '勿用患牙咀嚼，1-2周复诊。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('7', NULL, '1584729973401395202', '上颌智齿（微创）拔除', '左/右下后牙疼痛', '经局部治疗后智齿炎症已控制', '患者否认/自述有高血压、冠心病等心血管疾病；糖尿病、痛风等代谢性疾病。患者否认/自述有肝炎、梅毒、艾滋病等传染性疾病。患者否认/自述有红斑狼疮、类风湿性关节炎、桥本氏甲状腺炎等自身免疫性疾病。患者否认/自述有甲亢、甲减等激素紊乱病症。患者否认/自述有肾脏系统疾病。患者否认/自述有精神系统疾病。患者否认/自述有青霉素等药物或金属等物质过敏史。患者否认/自述有药物服用史。患者否认/自述有吸烟史。', '牙位图近中低位埋伏/高位垂直阻生，粘膜覆盖远中颌面，颜色无异常，无红肿，充血。余无特殊。', '牙位图阻生牙', '牙位图拔除', '局部聚维酮碘消毒，盐酸利多卡因下齿槽神经阻滞麻醉，智齿周围碧兰麻浸润麻醉。待麻药发挥效果后牙位图分离牙龈，手机磨切分割牙冠部分，解除近中阻挡，分块挺松，拔牙钳取出。常规搔刮拔牙创，压迫/缝合止血。', '严格遵守《拔牙后注意事项》，口服抗生素（自备），不适随诊。一周后拆线。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('70', NULL, '1584730047212756994', '牙髓失活', '左/右上/下前/后牙嵌塞食物疼痛数日/周/月/年。', '左/右上/下后牙嵌塞食物疼痛数日/周/月/年，常为钝痛或胀痛，偶有自发痛。', '患者否认/自述有高血压、冠心病等心血管疾病；糖尿病、痛风等代谢性疾病。患者否认/自述有肝炎、梅毒、艾滋病等传染性疾病。患者否认/自述有红斑狼疮、类风湿性关节炎、桥本氏甲状腺炎等自身免疫性疾病。患者否认/自述有甲亢、甲减等激素紊乱病症。患者否认/自述有肾脏系统疾病。患者否认/自述有精神系统疾病。患者否认/自述有青霉素等药物或金属等物质过敏史。患者否认/自述有药物服用史。患者否认/自述有吸烟史。', '牙位图近/远中邻颌面龋洞及牙髓 ，探诊：（-）；冷试：（+-）；热试：（+-）；松动度：（-）；叩诊：（+-）；电活力测试：（+-）；余未见明显异常。', '慢性牙髓炎', '牙位图根管治疗术。患者知情同意签字。', '于4%阿替卡因1.7mlX1支局部浸润麻醉下，开髓，冲洗止血，吸干，牙髓失活剂暂封。', '10日后复诊，不适随诊。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('72', NULL, '1584730047212756994', '牙髓炎复诊', '疼痛缓解，继续治疗', NULL, NULL, '34封物存，叩（-）', '34慢性牙髓炎', NULL, '34去暂封，根备，23mm，冲洗，热牙胶根充，磷酸锌垫底，暂封。', '不适随诊', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('73', NULL, '1584730047212756994', '牙髓炎复诊根充', '经处理无不适要求继续治疗', NULL, NULL, '37叩（-）松Ⅲ，暂封存\n47叩（-）松Ⅰ，暂封存', '37、47慢性牙髓炎', NULL, '37去暂封，干燥，隔湿，干髓治疗，FXⅡ充填。\n47去暂封，拔髓3个，测长，插针拍片，到位，近颊两根19MM，远中根20MM,机扩，1%次氯酸钠，生理盐水交替冲\n洗，试尖，到位，干燥，消毒，隔湿，热凝牙胶充填，拍片到位，暂封。', '37能用多久是多久，必要时拔除。\n47待48拔除1个月后观察，若不松动，可考虑冠修复，若松动则必要时拔除。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('74', NULL, '1584730047212756994', '牙髓炎（急性）', '右下后牙疼痛2+日，加重1+日', '2+日前患儿右下后牙出现疼痛，间断性，1+日前加重，难以忍受，夜间尤甚，遇冷热刺激时加重，经常食嵌', '否认牙科治疗史及重大疾病史', '近中邻面洞，探（+）叩（+ -）冷（+）', '\n急性牙髓炎\n', NULL, NULL, '叮嘱患儿勿用患侧咀嚼，2-3日复诊，必要时可抗生素控制症状。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('75', NULL, '1584730047212756994', '牙髓病初诊', '左上后牙疼痛', NULL, NULL, '近中邻牙合面深龋，冷热刺激痛，夜间痛，叩痛（+）。', '急性牙髓炎', NULL, NULL, '常规医嘱，不适随诊。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('76', NULL, '1584730047212756994', '补牙', '洁牙转诊补牙', '洁牙转诊补牙', NULL, '26、46充填物部分脱落，冷（-），叩（-)', '26、46继发龋', '26、46嵌体', '26、46去原充填物，光固化氢氧化钙垫底，流体充填，牙体预备，取模', '如疼痛则需治疗', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('77', NULL, '1584730047212756994', '急性牙周脓肿', '右上后牙肿胀、疼痛3+日', '3+日前右上后牙龈肿胀，跳痛，感觉患牙伸长，咬合痛，未经治疗，口服消炎药无明显缓解', '否认牙科治疗史和其他重大疾患史', '叩（+）松2°，颊侧牙龈呈卵圆形膨隆，光亮，壁薄，有波动感，牙周袋约mm，龈下牙石（++）', '急性牙周脓肿', NULL, NULL, '口服消炎止痛药，24h复诊。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('78', NULL, '1584730047212756994', '慢性牙周炎', '刷牙出血口腔异味一年余', '刷牙出血，口腔异味一年余，要求洁牙', '否认全身系统性疾病及传染病和药物过敏史。', '全口卫生情况：一般；软垢指数（DI）：1，牙石指数（CI）：1=龈上牙石覆盖牙面不超过1/3，可探及附着丧失，可探及袋内牙石，出血指数：4=探诊后出血溢满并溢出龈沟，牙龈红肿，牙龈呈暗红色，附着龈点彩消失', '慢性牙周炎', NULL, NULL, '一周内禁进酸性食物，避冷热食品，注重口腔卫生。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('79', NULL, '1584730047212756994', '慢性龈炎', '牙龈出血数月', '数月前刷牙时牙龈出血，含漱后可止住，未经治疗', '否认系统疾病史', '牙石（+）牙龈边缘红，水肿，探诊深度小于3mm', '慢性龈炎', NULL, NULL, '半小时内勿饮水进食等，保持口腔清洁，不适随诊', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('8', NULL, '1584729973401395202', '智齿冠周炎病历', '左/右下后牙疼痛数日', '左/右下后牙反复肿痛数月/年，自服抗生素缓解。近三日疼痛加剧，出现跳痛，脸颊肿胀，伴发热。', '患者否认/自述有高血压、冠心病等心血管疾病；糖尿病、痛风等代谢性疾病。患者否认/自述有肝炎、梅毒、艾滋病等传染性疾病。患者否认/自述有红斑狼疮、类风湿性关节炎、桥本氏甲状腺炎等自身免疫性疾病。患者否认/自述有甲亢、甲减等激素紊乱病症。患者否认/自述有肾脏系统疾病。患者否认/自述有精神系统疾病。患者否认/自述有青霉素等药物或金属等物质过敏史。患者否认/自述有药物服用史。患者否认/自述有吸烟史。', '左/右侧脸颊近下颌角处红肿，皮温升高。口内牙位图，近中埋伏阻生，周围牙龈红肿，盲袋深，溢脓。', '智齿冠周炎', '1.局部冲洗上药；2.全身给予抗生素点滴/口服抗生素；3.待炎症消除后尽早拔除。', '局部双氧水生理盐水交替冲洗，盲袋内放置抗生素药膜/上碘合剂。', '保持口腔卫生，漱口水漱口。去外院全身给予抗生素点滴治疗/口服抗生素（自备）。及时复诊，尽早拔除。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('80', NULL, '1584730047212756994', '牙周炎', '右下牙齿松动数年', '数年前右下牙齿出现松动，逐渐加重，近期出现摇晃影响进食，无明显自发性疼痛等', '否认重大疾病史', '松3°，牙周溢脓，牙石（+++）BOP（+）牙周袋深约mm，附着丧失mm', '牙周炎', NULL, NULL, '口服消炎药，1周复诊拆线', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('81', NULL, '1584730047212756994', '牙周药浴治疗模板', '刷牙出血口腔异味一年余', '刷牙出血，口腔异味一年余，要求洁牙', '否认有心脏病、、肝炎、血液系统疾病、甲状腺功能亢进、肾脏疾病、神经精神疾患等疾病；\n有糖尿病及高血压。青霉素过敏。', '全口卫生情况较差；软垢指数（DI）：1，牙石（++）；：1=龈上牙石覆盖牙面不超过1/3，可探及附着丧失，可探及袋内牙石，牙龈红肿，牙龈呈暗红色，附着龈点彩消失，牙齿松动度：0度；', '全口慢性牙周炎', NULL, NULL, '一周内禁进酸性食物，避冷热食品，注重口腔卫生。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('82', NULL, '1584730047212756994', '色素沉着洗牙', '牙齿着色半年，求洗牙。', '半年来牙齿着色，越来越重，求洗牙。', '曾牙齿矫正。', '全口卫生情况：一般；软垢指数（DI）：软垢指数（DI）：1。牙石指数（CI）：牙石指数（CI）：0=无牙石，色素沉着。', '菌斑性龈炎', NULL, NULL, '注重口腔卫生。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('83', NULL, '1584730047212756994', '菌斑所致牙龈炎治疗', '牙龈出血半年要求洗牙', '半年前发现口腔内有少量牙龈出血，现来我院要求洗牙。', '否认全身系统性疾病及传染病和药物过敏史。', '全口牙石（++）；松动度：（-）；牙龈微红，未探及牙周袋。', '全口菌斑所致牙龈炎', NULL, NULL, '一周内禁进酸性食物，避冷热食品，注重口腔卫生。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('84', NULL, '1584730121187696641', '冠周炎', '牙痛2天', '现因牙痛来就诊', NULL, '48龈红肿，触诊（++），叩（-），张口度Ⅱ°', '48急性冠周炎', '48消炎后拔除', '48冲洗上药', NULL, b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('85', NULL, '1584730121187696641', '多生牙', '要求检查', '现因有多生牙来就诊', NULL, '61滞留，松动Ⅲ，腭侧可见一切端呈锥形的牙，叩（-）', '61乳牙滞留\n51、61多生牙', '61拔除及多生牙拔除', '61 及多生牙在4%阿替卡因1.7mlX1支局部浸润麻醉下拔除，搔刮，压迫止血。', '常规医嘱，口服抗生素，不适随诊。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('86', NULL, '1584730121187696641', '松动牙', '要求拔除右下松动牙', '右下后牙松动厉害，吃东西碰到会痛，要求拔除', '否认有拔牙禁忌症及麻药过敏史。', '松动Ⅲ°，叩（-），牙龈萎缩，根分叉暴露', '慢性牙周炎', '拔除后种植', '局麻下拔除，压迫止血', '常规医嘱，如有疼痛自行口服消炎药，不适随诊。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('87', NULL, '1584730121187696641', '残冠拔除', '要求拔牙。', '患者  牙齿龋坏多年，剩余部分牙冠，嵌塞食物，来诊', '体健，否认药物过敏史及传染病史', '口内查：口腔卫生一般，剩余部分牙冠，牙冠颜色变暗，探 可探及髓室底软组织，牙龈无红肿', '残冠', '拔除', '尊患者意见使用合格的一次性及消毒工具，粘膜消毒后局麻下拔除 ，无菌棉球压迫止血。', '1.无菌棉球压迫止血30分钟；\n2.当日口水内可见血丝现象；\n3.24小时不刷牙不漱口。\n4.局部及全身抗炎药物应用；\n5.不适随诊。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('88', NULL, '1584730121187696641', '残根拔除1', '左下后牙要求拔牙。', '左下后牙蛀牙多年，昨天吃完东西后开始疼痛，不敢咬合', '否认有拔牙禁忌症及麻药过敏史。', '残根，叩（+），牙龈（-）', '残根', '拔除，3个月后义齿或种植修复。', '局麻下拔除，搔刮，压迫止血。', '常规医嘱，口服抗生素，不适随诊。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('89', NULL, '1584730121187696641', '牙折裂', '右下后牙咬物折裂', '曾在外院做过根管治疗，前两天吃东西不慎咬裂，吃东西碰到会痛，不敢咀嚼。', '否认有拔牙禁忌症及麻药过敏史。', '牙冠近远中纵折，颊1/2松（+++），颊舌侧粘膜红肿, 叩（-）', '牙纵折，', '拔除，3个月后义齿修复', '局麻下拔除，搔刮，压迫止血。', '常规医嘱，口服抗生素，不适随诊。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('9', NULL, '1584729973401395202', '纵折牙拔除', '左/右上/下后牙咀嚼痛数日', '左/右上/下后牙长期无法咀嚼食物，近日加重，有/无自发痛。', '曾在外/本院行开髓/根管治疗。患者否认/自述有高血压、冠心病等心血管疾病；糖尿病、痛风等代谢性疾病。患者否认/自述有肝炎、梅毒、艾滋病等传染性疾病。患者否认/自述有红斑狼疮、类风湿性关节炎、桥本氏甲状腺炎等自身免疫性疾病。患者否认/自述有甲亢、甲减等激素紊乱病症。患者否认/自述有肾脏系统疾病。患者否认/自述有精神系统疾病。患者否认/自述有青霉素等药物或金属等物质过敏史。患者否认/自述有药物服用史。患者否认/自述有吸烟史。', '牙位图颌面有开髓孔/大面积充填物，牙冠近远中向裂开，分为颊舌两部分，松（-）/Ⅰ/Ⅱ/Ⅲ度，，叩痛 （- +）。', '牙纵折，慢性根尖周炎急性发作', '牙位图拔除，择期修复。', '局部聚维酮碘消毒，盐酸利多卡因上齿槽神经阻滞麻醉/牙位图碧兰麻浸润麻醉。待麻药发挥效果后分离牙龈，挺松牙齿，拔牙钳取出。常规搔刮拔牙创，压迫/缝合止血。', '严格遵守《拔牙后注意事项》，口服抗生素（自备），不适随诊。一周后拆线。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('90', NULL, '1584730121187696641', ' 中龋', '要求补蛀牙', '口腔检查，发现蛀牙，要求填补', '无自发痛和咬合痛', '远中邻面中龋洞，叩（-），探（-），牙龈（-）', '中龋', '充填', '去龋，备洞，进口玻璃离子充填，调合', '常规医嘱，不适随诊', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('91', NULL, '1584730121187696641', '牙周脓肿\n', '左下后牙长一脓包', '左下后牙牙龈长一脓包', NULL, '远中邻面充填物，颊侧近龈缘处长一脓包，压之有波动感，探及深牙周袋，溢脓，叩（-），松（+）', '牙根吸收较短', '脓肿切开，冲洗', '局麻下行脓肿切开，冲洗，上碘甘油', '常规医嘱，不适随诊', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('92', NULL, '1584730121187696641', '埋伏阻生', '要求拔除左下智齿', '左下智齿埋伏阻生，偶尔会发炎疼痛，要求拔除', '否认有拔牙禁忌症及麻药过敏史。', '埋伏阻生，牙龈未见异常', '埋伏阻生', '拔除', '2%利多卡因5ml局麻下拔除，压迫，缝合止血。', '常规医嘱，口服抗生素，不适随诊。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('93', NULL, '1584730121187696641', '拔牙', '左下后牙充填物脱落，要求充填，并拔除右下阻生牙', '左下后牙充填物脱落，无不适，要求充填，右下阻生牙要求拔除', NULL, '37合面充填物脱落，叩（-）松（-）牙龈（-）48伸长，叩（-）松（-）牙龈（-）', '37浅龋48阻生牙', '37充填48拔除', '37去龋，尽，备洞，消毒，3MP60树脂充填，抛光。482%利多卡因注射液局部阻滞麻醉，阿替卡因局部浸润麻醉\n下，分离牙龈，挺出牙齿，根折，取出折裂片，处理牙槽窝，止血，缝合。', '拔牙术后医嘱。不适随访。头孢拉定胶囊    0.25*24      用法 0.5 每日3次 饭后口服替硝唑片          0.5*8          用法 \n0.5 每日2次 饭后口服布洛芬缓释胶囊0.3*4          用法 0.3 必要时口服金栀洁龈含漱液240ml*1支   用法 10ml 每日3\n次 24小时后漱口用', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('94', NULL, '1584730121187696641', '冠周炎冲洗', '左下智齿疼痛三天', '左下智齿近几天疼痛，有口服消炎药，今天疼痛未缓解，嘴巴有点张不开，故来我院就诊。', '否认药物过敏史', '正中阻生，远中大部分龈覆盖，牙龈红肿，触痛，探及深盲袋，食物残渣嵌塞，未见脓性渗出物，Ⅰ°张口受限。', '智齿冠周炎', '冠周冲洗上药，炎症消退后予拔除', '3%过氧化氢加生理盐水交替冲洗，置碘甘油。\n 金栀洁龈含漱液240ml*1瓶  用法: 5~20ml  一天3次  含漱1分钟', '常规医嘱，消炎药自备，若肿痛严重则外院行静脉点滴抗炎，不适随诊。', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('96', NULL, '1584730192029491201', '不良修复体', '要求重做右下后牙假牙', '多年前在外院做的烤瓷牙，现在变色且牙龈发黑，刷牙会出血，影响美观，要求重新修复。', NULL, '16 烤瓷牙，颜色变色，，龈缘处牙龈发黑，叩（-），探（-），冷热（-）， 咬合正常，邻接较松。', '16 不良修复体', '16 重新修复', '16拆除烤瓷牙，去除原充填物，找根管，测长，机扩，冲洗，封药。', '常规医嘱，不适随诊', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('97', NULL, '1584730192029491201', '修复', '要求修复上前牙', '多年前在外院做的烤瓷牙，现在变色且牙龈发红，刷牙会出血，影响美观，要求重新修复。', NULL, '11、21 烤瓷牙，颜色变色，偏青，龈缘处牙龈发红，叩（-），探（-），冷热（-）， 咬合正常。X线：根管1/2见一\n金属钉，呈致密影像，根尖1/2无明显影像。', '12、11、21、22 不良修复体', '12、11、21、22 重新修复', '2%利多卡因注射液局麻下，调合，开髓，拨髓，机扩至F2，近中根未测出根长。远中根15毫米，3%双氧水及生理盐水交替冲洗，敞开引流', '常规医嘱，不适随诊', b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('98', NULL, '1584730192029491201', '残根拔除种植', '前牙假牙折断脱落', '十年前别处做前牙假牙，反复脱落，两天前折断，要求检查。', NULL, '11、21残根，唇侧断端位于龈下较深，根管口见充填物，根周牙龈红肿。\n12全瓷牙修复', '11、21残根\n12慢性根尖炎', '11、21残根拔除做种植，已院长会诊做即刻种植（22治疗后）\n12根管治疗', '取模，做弹性义齿。', NULL, b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');
INSERT INTO `medrecord_case_template` VALUES ('99', NULL, '1584730192029491201', '粘冠', '右上前牙修复体松动脱落，要求粘固。', '2天前右上前牙修复体松动脱落，要求粘固。', '否认血液病等全身系统性疾病。', '桩核冠脱落，牙根边缘龋坏，边缘不密合。', '桩核冠脱落', '建议重新修复。患者要求临时粘接，以后再行修复。', '临时粘固。', NULL, b'0', '1', '2022-10-25 10:44:58', '1', '2022-10-25 10:44:58');

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '口腔病历牙位信息表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '口腔病历诊断信息表' ROW_FORMAT = DYNAMIC;

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
INSERT INTO `medrecord_other_index_tag` VALUES ('1', '1584741461717442561', '无牙症', b'0', 1, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('10', '1584741461717442561', '釉珠', b'0', 10, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('100', '1584741461717442561', '牙齿沉积物［增积物］', b'0', 100, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('101', '1584741461717442561', '牙齿变色', b'0', 101, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('102', '1584741461717442561', '牙石', b'0', 102, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('103', '1584741461717442561', '龈下牙石(龈下垢)', b'0', 103, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('104', '1584741461717442561', '龈上牙石(龈上垢)', b'0', 104, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('105', '1584741461717442561', '牙上沉积物', b'0', 105, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('106', '1584741461717442561', '牙硬组织萌出后颜色改变', b'0', 106, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('107', '1584741461717442561', '牙硬组织疾病，其他特指的', b'0', 107, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('108', '1584741461717442561', '辐照性牙釉质', b'0', 108, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('109', '1584741461717442561', '牙本质过敏症', b'0', 109, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('11', '1584741461717442561', '过小牙', b'0', 11, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('110', '1584741461717442561', '牙隐裂', b'0', 110, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('111', '1584741461717442561', '牙震荡', b'0', 111, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('112', '1584741461717442561', '牙根纵裂', b'0', 112, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('113', '1584741461717442561', '牙硬组织疾病', b'0', 113, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('114', '1584741461717442561', '牙髓炎', b'0', 114, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('115', '1584741461717442561', '溃疡性牙髓炎', b'0', 115, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('116', '1584741461717442561', '增生性牙髓炎', b'0', 116, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('117', '1584741461717442561', '可逆性牙髓炎', b'0', 117, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('118', '1584741461717442561', '不可逆性牙髓炎', b'0', 118, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('119', '1584741461717442561', '急性牙髓炎', b'0', 119, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('12', '1584741461717442561', '牛牙症', b'0', 12, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('120', '1584741461717442561', '慢性牙髓炎', b'0', 120, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('121', '1584741461717442561', '牙髓脓肿', b'0', 121, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('122', '1584741461717442561', '化脓性牙髓炎', b'0', 122, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('123', '1584741461717442561', '牙髓息肉', b'0', 123, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('124', '1584741461717442561', '牙髓坏死', b'0', 124, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('125', '1584741461717442561', '牙髓坏疽', b'0', 125, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('126', '1584741461717442561', '牙髓变性', b'0', 126, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('127', '1584741461717442561', '牙髓钙化', b'0', 127, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('128', '1584741461717442561', '牙髓石', b'0', 128, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('129', '1584741461717442561', '牙髓异常硬组织形成', b'0', 129, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('13', '1584741461717442561', '畸形中央尖', b'0', 13, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('130', '1584741461717442561', '急性牙髓源性根尖牙周炎', b'0', 130, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('131', '1584741461717442561', '急性根尖周炎', b'0', 131, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('132', '1584741461717442561', '慢性根尖牙周炎', b'0', 132, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('133', '1584741461717442561', '牙根肉芽肿', b'0', 133, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('134', '1584741461717442561', '根尖肉芽肿', b'0', 134, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('135', '1584741461717442561', '根尖周脓肿伴有窦道', b'0', 135, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('136', '1584741461717442561', '根尖周脓肿不伴有窦道', b'0', 136, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('137', '1584741461717442561', '根尖脓肿', b'0', 137, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('138', '1584741461717442561', '牙槽脓肿', b'0', 138, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('139', '1584741461717442561', '剩余牙根脓肿', b'0', 139, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('14', '1584741461717442561', '牙内陷', b'0', 14, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('140', '1584741461717442561', '牙根囊肿', b'0', 140, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('141', '1584741461717442561', '牙-牙槽囊肿', b'0', 141, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('142', '1584741461717442561', '根尖囊肿', b'0', 142, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('143', '1584741461717442561', '根尖周囊肿', b'0', 143, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('144', '1584741461717442561', '残余牙根囊肿', b'0', 144, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('145', '1584741461717442561', '牙髓和根尖周组织其他和未特指的疾病', b'0', 145, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('146', '1584741461717442561', '牙髓和根尖周组织其他疾病', b'0', 146, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('147', '1584741461717442561', '牙髓和根尖周组织疾病', b'0', 147, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('148', '1584741461717442561', '牙周牙髓综合征', b'0', 148, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('149', '1584741461717442561', '急性龈炎', b'0', 149, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('15', '1584741461717442561', '双生牙', b'0', 15, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('150', '1584741461717442561', '急性龈乳头炎', b'0', 150, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('151', '1584741461717442561', '慢性龈炎', b'0', 151, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('152', '1584741461717442561', '龈炎', b'0', 152, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('153', '1584741461717442561', '青春期龈炎', b'0', 153, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('154', '1584741461717442561', '妊娠期龈炎', b'0', 154, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('155', '1584741461717442561', '龈乳头炎', b'0', 155, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('156', '1584741461717442561', '菌斑性龈炎', b'0', 156, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('157', '1584741461717442561', '萌出性龈炎', b'0', 157, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('158', '1584741461717442561', '浆细胞龈炎', b'0', 158, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('159', '1584741461717442561', '化脓性牙龈炎', b'0', 159, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('16', '1584741461717442561', '结合齿', b'0', 16, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('160', '1584741461717442561', '增生性牙龈炎', b'0', 160, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('161', '1584741461717442561', '溃疡性龈炎', b'0', 161, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('162', '1584741461717442561', '边缘性龈炎', b'0', 162, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('163', '1584741461717442561', '肥大性龈炎', b'0', 163, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('164', '1584741461717442561', '脱屑性龈炎', b'0', 164, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('165', '1584741461717442561', '急性牙周炎', b'0', 165, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('166', '1584741461717442561', '急性多发性龈脓肿', b'0', 166, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('167', '1584741461717442561', '牙周脓肿', b'0', 167, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('168', '1584741461717442561', '牙冠周脓肿', b'0', 168, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('169', '1584741461717442561', '牙龈脓肿', b'0', 169, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('17', '1584741461717442561', '套叠齿', b'0', 17, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('170', '1584741461717442561', '急性冠周炎', b'0', 170, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('171', '1584741461717442561', '慢性牙周炎', b'0', 171, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('172', '1584741461717442561', '复合性牙周炎', b'0', 172, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('173', '1584741461717442561', '单纯性牙周炎', b'0', 173, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('174', '1584741461717442561', '牙周变性', b'0', 174, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('175', '1584741461717442561', '幼年牙周变性', b'0', 175, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('176', '1584741461717442561', '牙周疾病，其他的', b'0', 176, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('177', '1584741461717442561', '咬合创伤', b'0', 177, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('178', '1584741461717442561', '侵袭性牙周炎', b'0', 178, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('179', '1584741461717442561', '根分歧病变', b'0', 179, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('18', '1584741461717442561', '融合齿', b'0', 18, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('180', '1584741461717442561', '种植体周围炎', b'0', 180, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('181', '1584741461717442561', '牙周病', b'0', 181, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('182', '1584741461717442561', '牙龈退缩', b'0', 182, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('183', '1584741461717442561', '局部性牙龈退缩', b'0', 183, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('184', '1584741461717442561', '感染后牙龈退缩', b'0', 184, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('185', '1584741461717442561', '手术后牙龈退缩', b'0', 185, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('186', '1584741461717442561', '牙龈增厚', b'0', 186, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('187', '1584741461717442561', '牙龈增生', b'0', 187, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('188', '1584741461717442561', '药物性牙龈增生', b'0', 188, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('189', '1584741461717442561', '遗传性龈纤维瘤病', b'0', 189, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('19', '1584741461717442561', '圆锥齿', b'0', 19, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('190', '1584741461717442561', '牙龈肥厚', b'0', 190, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('191', '1584741461717442561', '与创伤有关的牙龈和无牙牙槽嵴损害', b'0', 191, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('192', '1584741461717442561', '牙龈和无牙牙槽嵴其他特指的疾患', b'0', 192, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('193', '1584741461717442561', '牙周巨细胞肉芽肿', b'0', 193, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('194', '1584741461717442561', '牙龈黑斑', b'0', 194, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('195', '1584741461717442561', '牙龈粘膜色素沉着', b'0', 195, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('196', '1584741461717442561', '种植体周围黏膜炎', b'0', 196, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('197', '1584741461717442561', '白血病的龈病损', b'0', 197, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('198', '1584741461717442561', '牙槽嵴前突', b'0', 198, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('199', '1584741461717442561', '松弛嵴', b'0', 199, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('2', '1584741461717442561', '少牙畸形', b'0', 2, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('20', '1584741461717442561', '齿前突', b'0', 20, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('200', '1584741461717442561', '牙龈化脓性肉芽肿', b'0', 200, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('201', '1584741461717442561', '巨细胞性牙龈瘤', b'0', 201, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('202', '1584741461717442561', '牙龈瘤', b'0', 202, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('203', '1584741461717442561', '牙龈出血', b'0', 203, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('204', '1584741461717442561', '牙龈瘘管', b'0', 204, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('205', '1584741461717442561', '牙龈溃疡', b'0', 205, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('206', '1584741461717442561', '牙龈息肉', b'0', 206, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('207', '1584741461717442561', '牙槽嵴松弛', b'0', 207, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('208', '1584741461717442561', '纤维性牙龈瘤', b'0', 208, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('209', '1584741461717442561', '龈沟赘生物', b'0', 209, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('21', '1584741461717442561', '齿中突', b'0', 21, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('210', '1584741461717442561', '牙龈和无牙牙槽嵴疾患', b'0', 210, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('211', '1584741461717442561', '牙龈血肿', b'0', 211, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('212', '1584741461717442561', '牙龈肿物', b'0', 212, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('22', '1584741461717442561', '斑釉牙', b'0', 22, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('23', '1584741461717442561', '氟牙症', b'0', 23, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('24', '1584741461717442561', '牙形成障碍', b'0', 24, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('25', '1584741461717442561', '弯曲牙', b'0', 25, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('26', '1584741461717442561', '特奈牙', b'0', 26, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('27', '1584741461717442561', '牙根发育不良', b'0', 27, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('28', '1584741461717442561', '区域性牙齿发育异常', b'0', 28, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('29', '1584741461717442561', '釉质发育不全(新生儿)(生后)(生前)', b'0', 29, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('3', '1584741461717442561', '先天缺牙', b'0', 3, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('30', '1584741461717442561', '遗传性牙结构紊乱，不可归类在他处者', b'0', 30, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('31', '1584741461717442561', '壳状牙', b'0', 31, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('32', '1584741461717442561', '牙本质发育不全', b'0', 32, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('33', '1584741461717442561', '牙生长不全', b'0', 33, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('34', '1584741461717442561', '釉质生长不全', b'0', 34, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('35', '1584741461717442561', '牙萌出障碍', b'0', 35, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('36', '1584741461717442561', '乳牙早萌', b'0', 36, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('37', '1584741461717442561', '诞生牙', b'0', 37, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('38', '1584741461717442561', '乳牙萌出过迟', b'0', 38, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('39', '1584741461717442561', '恒牙萌出过迟', b'0', 39, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('4', '1584741461717442561', '牙齿发育不全', b'0', 4, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('40', '1584741461717442561', '恒牙早萌', b'0', 40, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('41', '1584741461717442561', '低位乳牙', b'0', 41, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('42', '1584741461717442561', '乳牙晚出', b'0', 42, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('43', '1584741461717442561', '个别乳磨牙早失', b'0', 43, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('44', '1584741461717442561', '新生儿牙', b'0', 44, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('45', '1584741461717442561', '牙齿萌出过早', b'0', 45, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('46', '1584741461717442561', '牙齿萌出过晚', b'0', 46, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('47', '1584741461717442561', '乳齿过早脱落', b'0', 47, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('48', '1584741461717442561', '乳牙滞留', b'0', 48, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('49', '1584741461717442561', '出牙综合征', b'0', 49, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('5', '1584741461717442561', '牙齿缺少', b'0', 5, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('50', '1584741461717442561', '牙发育的其他疾患', b'0', 50, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('51', '1584741461717442561', '四环素牙', b'0', 51, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('52', '1584741461717442561', '牙齿形成期间颜色改变', b'0', 52, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('53', '1584741461717442561', '牙发育疾患', b'0', 53, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('54', '1584741461717442561', '埋伏牙', b'0', 54, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('55', '1584741461717442561', '阻生牙', b'0', 55, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('56', '1584741461717442561', '牙釉质龋', b'0', 56, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('57', '1584741461717442561', '牙齿白斑点损害', b'0', 57, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('58', '1584741461717442561', '牙本质龋', b'0', 58, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('59', '1584741461717442561', '乳牙中龋', b'0', 59, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('6', '1584741461717442561', '额外牙［多生牙］', b'0', 6, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('60', '1584741461717442561', '牙骨质龋', b'0', 60, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('61', '1584741461717442561', '静止龋', b'0', 61, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('62', '1584741461717442561', '牙折裂', b'0', 62, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('63', '1584741461717442561', '婴儿黑牙病', b'0', 63, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('64', '1584741461717442561', '黑牙折断', b'0', 64, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('65', '1584741461717442561', '龋(牙)，其他的', b'0', 65, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('66', '1584741461717442561', '继发龋', b'0', 66, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('67', '1584741461717442561', '急性龋', b'0', 67, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('68', '1584741461717442561', '乳牙浅龋', b'0', 68, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('69', '1584741461717442561', '乳牙深龋', b'0', 69, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('7', '1584741461717442561', '第四臼齿', b'0', 7, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('70', '1584741461717442561', '恒牙浅龋', b'0', 70, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('71', '1584741461717442561', '恒牙中龋', b'0', 71, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('72', '1584741461717442561', '恒牙深龋', b'0', 72, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('73', '1584741461717442561', '龋(牙)', b'0', 73, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('74', '1584741461717442561', '龋病', b'0', 74, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('75', '1584741461717442561', '深部龋', b'0', 75, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('76', '1584741461717442561', '蔓延性龋', b'0', 76, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('77', '1584741461717442561', '牙过度磨耗', b'0', 77, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('78', '1584741461717442561', '牙齿颌面磨损', b'0', 78, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('79', '1584741461717442561', '邻面磨损', b'0', 79, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('8', '1584741461717442561', '牙齿大小和形状异常', b'0', 8, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('80', '1584741461717442561', '牙磨损', b'0', 80, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('81', '1584741461717442561', '牙齿楔状缺损', b'0', 81, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('82', '1584741461717442561', '净齿剂牙磨损', b'0', 82, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('83', '1584741461717442561', '习惯性牙磨损', b'0', 83, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('84', '1584741461717442561', '职业性牙磨损', b'0', 84, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('85', '1584741461717442561', '宗教仪式性牙磨损', b'0', 85, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('86', '1584741461717442561', '传统性牙磨损', b'0', 86, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('87', '1584741461717442561', '牙腐蚀', b'0', 87, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('88', '1584741461717442561', '牙酸蚀病', b'0', 88, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('89', '1584741461717442561', '特发性牙腐蚀', b'0', 89, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('9', '1584741461717442561', '巨牙症', b'0', 9, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('90', '1584741461717442561', '药物性牙腐蚀', b'0', 90, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('91', '1584741461717442561', '职业性牙腐蚀', b'0', 91, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('92', '1584741461717442561', '持续性呕吐致牙腐蚀', b'0', 92, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('93', '1584741461717442561', '牙病理性吸收', b'0', 93, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('94', '1584741461717442561', '牙髓内部肉芽肿', b'0', 94, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('95', '1584741461717442561', '牙根外吸收', b'0', 95, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('96', '1584741461717442561', '牙内吸收', b'0', 96, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('97', '1584741461717442561', '牙骨质增生', b'0', 97, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('98', '1584741461717442561', '齿槽骨质增生', b'0', 98, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');
INSERT INTO `medrecord_other_index_tag` VALUES ('99', '1584741461717442561', '牙骨粘连', b'0', 99, b'0', '1', '2022-10-25 11:06:10', '1', '2022-10-25 11:06:10');

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
INSERT INTO `medrecord_other_index_type` VALUES ('1584741461717442561', 3, '牙科疾病', 213, b'0', '1542716295315771393', '2022-10-25 10:59:42', '1428549285854613505', '2022-10-26 15:43:21');

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '病历挂号费记录表' ROW_FORMAT = DYNAMIC;

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
INSERT INTO `medrecord_rx_template_type` VALUES ('1584729973401395202', 3, '1542716295315771393', b'1', '颌面外科学', b'0', '1542716295315771393', '2022-10-25 10:14:03', '1542716295315771393', '2022-10-25 10:14:03');
INSERT INTO `medrecord_rx_template_type` VALUES ('1584730047212756994', 3, '1542716295315771393', b'1', '口腔内科', b'0', '1542716295315771393', '2022-10-25 10:14:21', '1542716295315771393', '2022-10-25 10:14:21');
INSERT INTO `medrecord_rx_template_type` VALUES ('1584730121187696641', 3, '1542716295315771393', b'1', '口腔外科', b'0', '1542716295315771393', '2022-10-25 10:14:38', '1542716295315771393', '2022-10-25 10:14:38');
INSERT INTO `medrecord_rx_template_type` VALUES ('1584730192029491201', 3, '1542716295315771393', b'1', '口腔修复科', b'0', '1542716295315771393', '2022-10-25 10:14:55', '1542716295315771393', '2022-10-25 10:14:55');
INSERT INTO `medrecord_rx_template_type` VALUES ('1584730313265848321', 3, '1542716295315771393', b'1', '口腔正畸科', b'0', '1542716295315771393', '2022-10-25 10:15:24', '1542716295315771393', '2022-10-25 10:15:24');
INSERT INTO `medrecord_rx_template_type` VALUES ('1584730436918124545', 3, '1542716295315771393', b'1', '牙体牙髓病学', b'0', '1542716295315771393', '2022-10-25 10:15:54', '1542716295315771393', '2022-10-25 10:15:54');
INSERT INTO `medrecord_rx_template_type` VALUES ('1584730489837658113', 3, '1542716295315771393', b'1', '牙周疾病', b'0', '1542716295315771393', '2022-10-25 10:16:06', '1542716295315771393', '2022-10-25 10:16:06');

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '医生排班记录表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '周排班表' ROW_FORMAT = DYNAMIC;

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
INSERT INTO `sys_business_data` VALUES ('1584576197738627072', '2022-10-24', 0.00, 0, b'0', NULL, '2022-10-25 00:03:00', NULL, '2022-10-25 00:03:00');
INSERT INTO `sys_business_data` VALUES ('1584938585214160896', '2022-10-25', 0.00, 0, b'0', NULL, '2022-10-26 00:03:00', NULL, '2022-10-26 00:03:00');
INSERT INTO `sys_business_data` VALUES ('1585300973109125120', '2022-10-26', 0.00, 0, b'0', NULL, '2022-10-27 00:03:00', NULL, '2022-10-27 00:03:00');
INSERT INTO `sys_business_data` VALUES ('1585663361041944576', '2022-10-27', 0.00, 0, b'0', NULL, '2022-10-28 00:03:00', NULL, '2022-10-28 00:03:00');

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
