/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80100 (8.1.0)
 Source Host           : localhost:3306
 Source Schema         : 3rapp

 Target Server Type    : MySQL
 Target Server Version : 80100 (8.1.0)
 File Encoding         : 65001

 Date: 27/01/2024 06:00:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for content_categories
-- ----------------------------
DROP TABLE IF EXISTS `content_categories`;
CREATE TABLE `content_categories` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '分类名称',
  `customOrder` int NOT NULL DEFAULT '0' COMMENT '分类排序',
  `mpath` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '',
  `parentId` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_d6aaf8517ca57297a8c3a44d3d` (`name`),
  KEY `FK_a03aea27707893300382b6f18ae` (`parentId`),
  CONSTRAINT `FK_a03aea27707893300382b6f18ae` FOREIGN KEY (`parentId`) REFERENCES `content_categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of content_categories
-- ----------------------------
BEGIN;
INSERT INTO `content_categories` (`id`, `name`, `customOrder`, `mpath`, `parentId`) VALUES ('2791f357-9433-40c5-a873-fad407b2afb0', '编程开发', 0, '596d0eec-7547-4d56-82a4-db39373f6b48.2791f357-9433-40c5-a873-fad407b2afb0.', '596d0eec-7547-4d56-82a4-db39373f6b48');
INSERT INTO `content_categories` (`id`, `name`, `customOrder`, `mpath`, `parentId`) VALUES ('596d0eec-7547-4d56-82a4-db39373f6b48', '技术文档', 1, '596d0eec-7547-4d56-82a4-db39373f6b48.', NULL);
INSERT INTO `content_categories` (`id`, `name`, `customOrder`, `mpath`, `parentId`) VALUES ('5afc40c0-b36f-4a9d-83e9-8916e7b9cb89', '部署运维', 1, '596d0eec-7547-4d56-82a4-db39373f6b48.5afc40c0-b36f-4a9d-83e9-8916e7b9cb89.', '596d0eec-7547-4d56-82a4-db39373f6b48');
INSERT INTO `content_categories` (`id`, `name`, `customOrder`, `mpath`, `parentId`) VALUES ('772ca6eb-e7cf-4d23-befd-080d781ae40f', '后端', 1, '596d0eec-7547-4d56-82a4-db39373f6b48.2791f357-9433-40c5-a873-fad407b2afb0.772ca6eb-e7cf-4d23-befd-080d781ae40f.', '2791f357-9433-40c5-a873-fad407b2afb0');
INSERT INTO `content_categories` (`id`, `name`, `customOrder`, `mpath`, `parentId`) VALUES ('c3d43cac-698b-47c8-ba28-974c963c5cd7', '开源推荐', 2, 'c3d43cac-698b-47c8-ba28-974c963c5cd7.', NULL);
INSERT INTO `content_categories` (`id`, `name`, `customOrder`, `mpath`, `parentId`) VALUES ('cb0d8764-a096-4be5-9b54-8994bf8db1f3', '前端', 0, '596d0eec-7547-4d56-82a4-db39373f6b48.2791f357-9433-40c5-a873-fad407b2afb0.cb0d8764-a096-4be5-9b54-8994bf8db1f3.', '2791f357-9433-40c5-a873-fad407b2afb0');
INSERT INTO `content_categories` (`id`, `name`, `customOrder`, `mpath`, `parentId`) VALUES ('fa400205-4074-446c-93f7-cd949a76a6fd', '随心笔记', 0, 'fa400205-4074-446c-93f7-cd949a76a6fd.', NULL);
COMMIT;

-- ----------------------------
-- Table structure for content_comments
-- ----------------------------
DROP TABLE IF EXISTS `content_comments`;
CREATE TABLE `content_comments` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `body` text COLLATE utf8mb4_general_ci NOT NULL COMMENT '评论内容',
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `mpath` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '',
  `parentId` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `postId` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_982a849f676860e5d6beb607f20` (`parentId`),
  KEY `FK_5e1c3747a0031f305e94493361f` (`postId`),
  FULLTEXT KEY `IDX_5f70a0489331d4346e46ea4d88` (`body`),
  CONSTRAINT `FK_5e1c3747a0031f305e94493361f` FOREIGN KEY (`postId`) REFERENCES `content_posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_982a849f676860e5d6beb607f20` FOREIGN KEY (`parentId`) REFERENCES `content_comments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of content_comments
-- ----------------------------
BEGIN;
INSERT INTO `content_comments` (`id`, `body`, `createdAt`, `mpath`, `parentId`, `postId`) VALUES ('09b11a00-74fa-4528-beea-c26d50031219', '子评论2', '2024-01-27 05:57:07.732298', 'fb0df54a-aac1-4a19-8cc6-eb1c4bbbadea.09b11a00-74fa-4528-beea-c26d50031219.', 'fb0df54a-aac1-4a19-8cc6-eb1c4bbbadea', 'ce5a84de-0dda-4474-a509-702604738aa9');
INSERT INTO `content_comments` (`id`, `body`, `createdAt`, `mpath`, `parentId`, `postId`) VALUES ('216b4895-73ec-457e-803c-81a65d73989a', '评论2', '2024-01-27 05:56:32.028929', '216b4895-73ec-457e-803c-81a65d73989a.', NULL, 'ce5a84de-0dda-4474-a509-702604738aa9');
INSERT INTO `content_comments` (`id`, `body`, `createdAt`, `mpath`, `parentId`, `postId`) VALUES ('62daa04e-d57f-4438-9601-936bde07086f', '评论3', '2024-01-27 05:56:35.366323', '62daa04e-d57f-4438-9601-936bde07086f.', NULL, 'ce5a84de-0dda-4474-a509-702604738aa9');
INSERT INTO `content_comments` (`id`, `body`, `createdAt`, `mpath`, `parentId`, `postId`) VALUES ('a37c588b-89ec-49ff-936b-125b2820894a', '子评论1', '2024-01-27 05:57:02.725224', 'fb0df54a-aac1-4a19-8cc6-eb1c4bbbadea.a37c588b-89ec-49ff-936b-125b2820894a.', 'fb0df54a-aac1-4a19-8cc6-eb1c4bbbadea', 'ce5a84de-0dda-4474-a509-702604738aa9');
INSERT INTO `content_comments` (`id`, `body`, `createdAt`, `mpath`, `parentId`, `postId`) VALUES ('cb801a95-2cfc-4f42-8530-06c51dac4b5f', '孙评论1', '2024-01-27 05:57:26.470244', 'fb0df54a-aac1-4a19-8cc6-eb1c4bbbadea.09b11a00-74fa-4528-beea-c26d50031219.cb801a95-2cfc-4f42-8530-06c51dac4b5f.', '09b11a00-74fa-4528-beea-c26d50031219', 'ce5a84de-0dda-4474-a509-702604738aa9');
INSERT INTO `content_comments` (`id`, `body`, `createdAt`, `mpath`, `parentId`, `postId`) VALUES ('fb0df54a-aac1-4a19-8cc6-eb1c4bbbadea', '评论1', '2024-01-27 05:56:20.664616', 'fb0df54a-aac1-4a19-8cc6-eb1c4bbbadea.', NULL, 'ce5a84de-0dda-4474-a509-702604738aa9');
COMMIT;

-- ----------------------------
-- Table structure for content_posts
-- ----------------------------
DROP TABLE IF EXISTS `content_posts`;
CREATE TABLE `content_posts` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章标题',
  `body` text COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章内容',
  `summary` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文章描述',
  `keywords` text COLLATE utf8mb4_general_ci COMMENT '关键字',
  `type` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'markdown' COMMENT '文章类型',
  `publishedAt` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '发布时间',
  `customOrder` int NOT NULL DEFAULT '0' COMMENT '自定义文章排序',
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `deletedAt` datetime(6) DEFAULT NULL COMMENT '删除时间',
  `categoryId` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_4027367881933f659d02f367e92` (`categoryId`),
  CONSTRAINT `FK_4027367881933f659d02f367e92` FOREIGN KEY (`categoryId`) REFERENCES `content_categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of content_posts
-- ----------------------------
BEGIN;
INSERT INTO `content_posts` (`id`, `title`, `body`, `summary`, `keywords`, `type`, `publishedAt`, `customOrder`, `createdAt`, `updatedAt`, `deletedAt`, `categoryId`) VALUES ('1be53e85-a5d3-4dc9-973c-3df64c68c959', '最新文章3', '这是第3篇文章', NULL, NULL, 'markdown', NULL, 0, '2024-01-26 15:28:25.187142', '2024-01-26 15:28:25.187142', NULL, '772ca6eb-e7cf-4d23-befd-080d781ae40f');
INSERT INTO `content_posts` (`id`, `title`, `body`, `summary`, `keywords`, `type`, `publishedAt`, `customOrder`, `createdAt`, `updatedAt`, `deletedAt`, `categoryId`) VALUES ('2fdc10bf-ef9f-46f1-a89a-66c91f22491d', '最新文章10', '这是第10篇文章', NULL, NULL, 'markdown', NULL, 0, '2024-01-26 15:30:06.320102', '2024-01-26 15:30:06.320102', NULL, 'cb0d8764-a096-4be5-9b54-8994bf8db1f3');
INSERT INTO `content_posts` (`id`, `title`, `body`, `summary`, `keywords`, `type`, `publishedAt`, `customOrder`, `createdAt`, `updatedAt`, `deletedAt`, `categoryId`) VALUES ('476520d8-2fa5-4dbf-8293-e241aa5d9c3a', '最新文章1', '这是第1篇文章', NULL, NULL, 'markdown', NULL, 0, '2024-01-26 15:28:13.288371', '2024-01-26 15:28:13.288371', NULL, '772ca6eb-e7cf-4d23-befd-080d781ae40f');
INSERT INTO `content_posts` (`id`, `title`, `body`, `summary`, `keywords`, `type`, `publishedAt`, `customOrder`, `createdAt`, `updatedAt`, `deletedAt`, `categoryId`) VALUES ('68b8b488-68b9-4b5e-a79c-6a6deba97c17', '最新文章5', '这是第5篇文章', NULL, NULL, 'markdown', NULL, 0, '2024-01-26 15:29:32.993839', '2024-01-26 15:29:32.993839', NULL, 'cb0d8764-a096-4be5-9b54-8994bf8db1f3');
INSERT INTO `content_posts` (`id`, `title`, `body`, `summary`, `keywords`, `type`, `publishedAt`, `customOrder`, `createdAt`, `updatedAt`, `deletedAt`, `categoryId`) VALUES ('bd6847e4-d7f7-41ca-9eba-d697acce27ea', '最新文章7', '这是第7篇文章', NULL, NULL, 'markdown', NULL, 0, '2024-01-26 15:29:43.544284', '2024-01-26 15:29:43.544284', NULL, 'cb0d8764-a096-4be5-9b54-8994bf8db1f3');
INSERT INTO `content_posts` (`id`, `title`, `body`, `summary`, `keywords`, `type`, `publishedAt`, `customOrder`, `createdAt`, `updatedAt`, `deletedAt`, `categoryId`) VALUES ('bf059f9b-dc8e-4b68-8174-65fdcdcbf7ae', '最新文章6', '这是第6篇文章', NULL, NULL, 'markdown', NULL, 0, '2024-01-26 15:29:38.876992', '2024-01-26 15:29:38.876992', NULL, 'cb0d8764-a096-4be5-9b54-8994bf8db1f3');
INSERT INTO `content_posts` (`id`, `title`, `body`, `summary`, `keywords`, `type`, `publishedAt`, `customOrder`, `createdAt`, `updatedAt`, `deletedAt`, `categoryId`) VALUES ('c6de2bba-5c0d-4d0e-8165-b33b54e9704c', '最新文章8', '这是第8篇文章', NULL, NULL, 'markdown', NULL, 0, '2024-01-26 15:29:48.691084', '2024-01-26 15:29:48.691084', NULL, 'cb0d8764-a096-4be5-9b54-8994bf8db1f3');
INSERT INTO `content_posts` (`id`, `title`, `body`, `summary`, `keywords`, `type`, `publishedAt`, `customOrder`, `createdAt`, `updatedAt`, `deletedAt`, `categoryId`) VALUES ('ca319bf4-cd68-4600-b440-5f4f1b1d9a10', '最新文章2', '这是第2篇文章', NULL, NULL, 'markdown', NULL, 0, '2024-01-26 15:28:19.342891', '2024-01-26 15:28:19.342891', NULL, '772ca6eb-e7cf-4d23-befd-080d781ae40f');
INSERT INTO `content_posts` (`id`, `title`, `body`, `summary`, `keywords`, `type`, `publishedAt`, `customOrder`, `createdAt`, `updatedAt`, `deletedAt`, `categoryId`) VALUES ('ce5a84de-0dda-4474-a509-702604738aa9', '最新文章4', '这是第4篇文章', NULL, NULL, 'markdown', NULL, 0, '2024-01-26 17:03:58.924815', '2024-01-26 17:03:58.924815', NULL, 'cb0d8764-a096-4be5-9b54-8994bf8db1f3');
INSERT INTO `content_posts` (`id`, `title`, `body`, `summary`, `keywords`, `type`, `publishedAt`, `customOrder`, `createdAt`, `updatedAt`, `deletedAt`, `categoryId`) VALUES ('cefff292-da5a-49eb-9e24-c27cbbc21177', '最新文章9', '这是第9篇文章', NULL, NULL, 'markdown', NULL, 0, '2024-01-26 15:29:53.431809', '2024-01-26 15:29:53.431809', NULL, 'cb0d8764-a096-4be5-9b54-8994bf8db1f3');
INSERT INTO `content_posts` (`id`, `title`, `body`, `summary`, `keywords`, `type`, `publishedAt`, `customOrder`, `createdAt`, `updatedAt`, `deletedAt`, `categoryId`) VALUES ('d99ab037-c6dd-407b-a10b-a6d8fbf0cc43', '最新文章11', '这是第11篇文章', NULL, NULL, 'markdown', NULL, 0, '2024-01-26 15:30:09.936867', '2024-01-26 15:30:09.936867', NULL, 'cb0d8764-a096-4be5-9b54-8994bf8db1f3');
COMMIT;

-- ----------------------------
-- Table structure for content_posts_tags_content_tags
-- ----------------------------
DROP TABLE IF EXISTS `content_posts_tags_content_tags`;
CREATE TABLE `content_posts_tags_content_tags` (
  `contentPostsId` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `contentTagsId` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`contentPostsId`,`contentTagsId`),
  KEY `IDX_1e8c41827d0d509e70de1f6b70` (`contentPostsId`),
  KEY `IDX_888e6754015ee17f9e22faae57` (`contentTagsId`),
  CONSTRAINT `FK_1e8c41827d0d509e70de1f6b70e` FOREIGN KEY (`contentPostsId`) REFERENCES `content_posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_888e6754015ee17f9e22faae578` FOREIGN KEY (`contentTagsId`) REFERENCES `content_tags` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of content_posts_tags_content_tags
-- ----------------------------
BEGIN;
INSERT INTO `content_posts_tags_content_tags` (`contentPostsId`, `contentTagsId`) VALUES ('1be53e85-a5d3-4dc9-973c-3df64c68c959', '6845accc-0929-4b3a-ade0-22ae2ae4a9b1');
INSERT INTO `content_posts_tags_content_tags` (`contentPostsId`, `contentTagsId`) VALUES ('1be53e85-a5d3-4dc9-973c-3df64c68c959', 'b2b1590f-c8a6-4d8e-a30b-c95b7ae5cd4d');
INSERT INTO `content_posts_tags_content_tags` (`contentPostsId`, `contentTagsId`) VALUES ('2fdc10bf-ef9f-46f1-a89a-66c91f22491d', '2ce734c7-9367-444a-8fd4-2296ee49020d');
INSERT INTO `content_posts_tags_content_tags` (`contentPostsId`, `contentTagsId`) VALUES ('2fdc10bf-ef9f-46f1-a89a-66c91f22491d', '592df60c-5a06-4ef6-bb2f-7af2fc82d784');
INSERT INTO `content_posts_tags_content_tags` (`contentPostsId`, `contentTagsId`) VALUES ('476520d8-2fa5-4dbf-8293-e241aa5d9c3a', '6845accc-0929-4b3a-ade0-22ae2ae4a9b1');
INSERT INTO `content_posts_tags_content_tags` (`contentPostsId`, `contentTagsId`) VALUES ('476520d8-2fa5-4dbf-8293-e241aa5d9c3a', 'b2b1590f-c8a6-4d8e-a30b-c95b7ae5cd4d');
INSERT INTO `content_posts_tags_content_tags` (`contentPostsId`, `contentTagsId`) VALUES ('68b8b488-68b9-4b5e-a79c-6a6deba97c17', '2ce734c7-9367-444a-8fd4-2296ee49020d');
INSERT INTO `content_posts_tags_content_tags` (`contentPostsId`, `contentTagsId`) VALUES ('68b8b488-68b9-4b5e-a79c-6a6deba97c17', '592df60c-5a06-4ef6-bb2f-7af2fc82d784');
INSERT INTO `content_posts_tags_content_tags` (`contentPostsId`, `contentTagsId`) VALUES ('bd6847e4-d7f7-41ca-9eba-d697acce27ea', '2ce734c7-9367-444a-8fd4-2296ee49020d');
INSERT INTO `content_posts_tags_content_tags` (`contentPostsId`, `contentTagsId`) VALUES ('bd6847e4-d7f7-41ca-9eba-d697acce27ea', '592df60c-5a06-4ef6-bb2f-7af2fc82d784');
INSERT INTO `content_posts_tags_content_tags` (`contentPostsId`, `contentTagsId`) VALUES ('bf059f9b-dc8e-4b68-8174-65fdcdcbf7ae', '2ce734c7-9367-444a-8fd4-2296ee49020d');
INSERT INTO `content_posts_tags_content_tags` (`contentPostsId`, `contentTagsId`) VALUES ('bf059f9b-dc8e-4b68-8174-65fdcdcbf7ae', '592df60c-5a06-4ef6-bb2f-7af2fc82d784');
INSERT INTO `content_posts_tags_content_tags` (`contentPostsId`, `contentTagsId`) VALUES ('c6de2bba-5c0d-4d0e-8165-b33b54e9704c', '2ce734c7-9367-444a-8fd4-2296ee49020d');
INSERT INTO `content_posts_tags_content_tags` (`contentPostsId`, `contentTagsId`) VALUES ('c6de2bba-5c0d-4d0e-8165-b33b54e9704c', '592df60c-5a06-4ef6-bb2f-7af2fc82d784');
INSERT INTO `content_posts_tags_content_tags` (`contentPostsId`, `contentTagsId`) VALUES ('ca319bf4-cd68-4600-b440-5f4f1b1d9a10', '6845accc-0929-4b3a-ade0-22ae2ae4a9b1');
INSERT INTO `content_posts_tags_content_tags` (`contentPostsId`, `contentTagsId`) VALUES ('ca319bf4-cd68-4600-b440-5f4f1b1d9a10', 'b2b1590f-c8a6-4d8e-a30b-c95b7ae5cd4d');
INSERT INTO `content_posts_tags_content_tags` (`contentPostsId`, `contentTagsId`) VALUES ('ce5a84de-0dda-4474-a509-702604738aa9', '2ce734c7-9367-444a-8fd4-2296ee49020d');
INSERT INTO `content_posts_tags_content_tags` (`contentPostsId`, `contentTagsId`) VALUES ('ce5a84de-0dda-4474-a509-702604738aa9', '74560955-2022-4e7c-8655-c7f4f5a00c29');
INSERT INTO `content_posts_tags_content_tags` (`contentPostsId`, `contentTagsId`) VALUES ('cefff292-da5a-49eb-9e24-c27cbbc21177', '2ce734c7-9367-444a-8fd4-2296ee49020d');
INSERT INTO `content_posts_tags_content_tags` (`contentPostsId`, `contentTagsId`) VALUES ('cefff292-da5a-49eb-9e24-c27cbbc21177', '592df60c-5a06-4ef6-bb2f-7af2fc82d784');
INSERT INTO `content_posts_tags_content_tags` (`contentPostsId`, `contentTagsId`) VALUES ('d99ab037-c6dd-407b-a10b-a6d8fbf0cc43', '2ce734c7-9367-444a-8fd4-2296ee49020d');
INSERT INTO `content_posts_tags_content_tags` (`contentPostsId`, `contentTagsId`) VALUES ('d99ab037-c6dd-407b-a10b-a6d8fbf0cc43', '592df60c-5a06-4ef6-bb2f-7af2fc82d784');
COMMIT;

-- ----------------------------
-- Table structure for content_tags
-- ----------------------------
DROP TABLE IF EXISTS `content_tags`;
CREATE TABLE `content_tags` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '标签名称',
  `description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '标签描述',
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_6f504a08a58010e15c55b1eb23` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of content_tags
-- ----------------------------
BEGIN;
INSERT INTO `content_tags` (`id`, `name`, `description`) VALUES ('17a46668-d492-44f7-ab27-de3410a08348', 'linux', NULL);
INSERT INTO `content_tags` (`id`, `name`, `description`) VALUES ('2ce734c7-9367-444a-8fd4-2296ee49020d', 'react', NULL);
INSERT INTO `content_tags` (`id`, `name`, `description`) VALUES ('509e5531-2baa-45b9-ab35-d1de274d74c5', 'node.js', NULL);
INSERT INTO `content_tags` (`id`, `name`, `description`) VALUES ('57353e3d-d40e-40d9-a4c8-2dfd22a7df5f', 'laravel', NULL);
INSERT INTO `content_tags` (`id`, `name`, `description`) VALUES ('592df60c-5a06-4ef6-bb2f-7af2fc82d784', 'nextjs', NULL);
INSERT INTO `content_tags` (`id`, `name`, `description`) VALUES ('6845accc-0929-4b3a-ade0-22ae2ae4a9b1', 'typeorm', NULL);
INSERT INTO `content_tags` (`id`, `name`, `description`) VALUES ('74560955-2022-4e7c-8655-c7f4f5a00c29', 'electron', NULL);
INSERT INTO `content_tags` (`id`, `name`, `description`) VALUES ('7d58543d-ecc0-43f7-96ae-2f07c30e3bd9', 'prisma', NULL);
INSERT INTO `content_tags` (`id`, `name`, `description`) VALUES ('8771a972-728d-4e00-9640-f0c65c35106f', 'symfony', NULL);
INSERT INTO `content_tags` (`id`, `name`, `description`) VALUES ('b2b1590f-c8a6-4d8e-a30b-c95b7ae5cd4d', 'nestjs', NULL);
INSERT INTO `content_tags` (`id`, `name`, `description`) VALUES ('b375946b-d42d-4f5e-9ed9-bf220ef64231', 'php', NULL);
INSERT INTO `content_tags` (`id`, `name`, `description`) VALUES ('c60f050f-af4a-43f3-a2b6-7f474681c177', 'react native', NULL);
INSERT INTO `content_tags` (`id`, `name`, `description`) VALUES ('ef448996-8c4e-4365-a255-c195afd66365', 'drizzle', NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
