/*
 Navicat Premium Data Transfer

 Source Server         : Test01
 Source Server Type    : MySQL
 Source Server Version : 80400
 Source Host           : localhost:3306
 Source Schema         : student_manage_db

 Target Server Type    : MySQL
 Target Server Version : 80400
 File Encoding         : 65001

 Date: 06/01/2025 00:19:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `adminId` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '管理员号',
  `password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `adminName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '姓名',
  `phoneNum` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电话号码',
  PRIMARY KEY (`adminId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('123456', '123456', '王二', '123456789');

-- ----------------------------
-- Table structure for selected_course
-- ----------------------------
DROP TABLE IF EXISTS `selected_course`;
CREATE TABLE `selected_course`  (
  `courseId` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程号',
  `stuId` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '学号',
  `courseName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '课程名',
  `courseType` enum('选修','辅修','二专') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '课程类型',
  `courseNature` enum('人文类','科技类') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '课程性质',
  `remainingCredits` double(10, 2) NULL DEFAULT NULL COMMENT '还差某类的学分数',
  PRIMARY KEY (`courseId`, `stuId`) USING BTREE,
  INDEX `student_selected`(`stuId` ASC) USING BTREE,
  CONSTRAINT `student_selected` FOREIGN KEY (`stuId`) REFERENCES `student` (`stuId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of selected_course
-- ----------------------------
INSERT INTO `selected_course` VALUES ('10001', '101', '美学鉴赏', '选修', '人文类', 15.00);
INSERT INTO `selected_course` VALUES ('10001', '102', '美学鉴赏', '选修', '人文类', 15.00);
INSERT INTO `selected_course` VALUES ('10001', '103', '美学鉴赏', '选修', '人文类', 15.00);
INSERT INTO `selected_course` VALUES ('10001', '107', '美学鉴赏', '选修', '人文类', 15.00);
INSERT INTO `selected_course` VALUES ('10002', '101', '大学物理', '辅修', '科技类', 10.00);
INSERT INTO `selected_course` VALUES ('10002', '102', '大学物理', '辅修', '科技类', 10.00);
INSERT INTO `selected_course` VALUES ('10002', '103', '大学物理', '辅修', '科技类', 10.00);
INSERT INTO `selected_course` VALUES ('10003', '101', '大学俄语', '二专', '人文类', 15.00);
INSERT INTO `selected_course` VALUES ('10003', '102', '大学俄语', '二专', '人文类', 15.00);
INSERT INTO `selected_course` VALUES ('10003', '103', '大学俄语', '二专', '人文类', 15.00);
INSERT INTO `selected_course` VALUES ('10004', '104', '计算机基础', '二专', '科技类', 15.00);
INSERT INTO `selected_course` VALUES ('10004', '105', '计算机基础', '二专', '科技类', 15.00);
INSERT INTO `selected_course` VALUES ('10004', '106', '计算机基础', '二专', '科技类', 15.00);
INSERT INTO `selected_course` VALUES ('10004', '107', '计算机基础', '二专', '科技类', 10.00);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `stuId` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '学号',
  `stuName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '学生姓名',
  `password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `gender` enum('男','女') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '性别',
  `age` int NULL DEFAULT NULL COMMENT '年龄',
  `phoneNum` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电话号码',
  `major` enum('计算机','外语') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '专业',
  `academicStatus` enum('已毕业','未毕业') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学业情况',
  `gpa` double(10, 2) NULL DEFAULT NULL COMMENT '学绩点',
  `intellectualScore` int NULL DEFAULT NULL COMMENT '智育分数',
  `earnedCredits` double(10, 2) NULL DEFAULT NULL COMMENT '取得学分数',
  `retakeStatus` enum('存在补考','不存在补考') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '补考重读情况',
  PRIMARY KEY (`stuId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('101', '张三', '123', '男', 19, '123456', '计算机', '未毕业', 3.50, 80, 66.00, '不存在补考');
INSERT INTO `student` VALUES ('102', '李四', '123', '女', 18, '123456', '计算机', '未毕业', 3.60, 80, 66.00, '不存在补考');
INSERT INTO `student` VALUES ('103', '王五', '123', '男', 18, '123456', '计算机', '未毕业', 3.70, 80, 66.00, '不存在补考');
INSERT INTO `student` VALUES ('104', '杨一', '123', '男', 18, '123456', '外语', '未毕业', 3.50, 80, 60.00, '存在补考');
INSERT INTO `student` VALUES ('105', '杨二', '123', '女', 18, '123456', '外语', '未毕业', 3.60, 80, 66.00, '不存在补考');
INSERT INTO `student` VALUES ('106', '杨三', '123', '女', 19, '123456', '外语', '未毕业', 3.60, 80, 66.00, '不存在补考');
INSERT INTO `student` VALUES ('107', '李一', '123', '男', 20, '123456', '计算机', '未毕业', 3.60, 90, 68.00, '不存在补考');

SET FOREIGN_KEY_CHECKS = 1;
