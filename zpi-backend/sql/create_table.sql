# 数据库初始化
# @author <a href="https://github.com/liyupi">程序员鱼皮</a>
# @from <a href="https://yupi.icu">编程导航知识星球</a>

-- 创建库
create database if not exists zpi;

-- 切换库
use zpi;

-- 用户表
create table if not exists user
(
    id           bigint auto_increment comment 'id' primary key,
    userAccount  varchar(256)                           not null comment '账号',
    userPassword varchar(512)                           not null comment '密码',
    unionId      varchar(256)                           null comment '微信开放平台id',
    mpOpenId     varchar(256)                           null comment '公众号openId',
    userName     varchar(256)                           null comment '用户昵称',
    userAvatar   varchar(1024)                          null comment '用户头像',
    userProfile  varchar(512)                           null comment '用户简介',
    accessKey        VARCHAR(512) NOT NULL COMMENT 'accessKey',
    secretKey        VARCHAR(512) NOT NULL COMMENT 'secretKey',
    userRole     varchar(256) default 'user'            not null comment '用户角色：user/admin/ban',
    createTime   datetime     default CURRENT_TIMESTAMP not null comment '创建时间',
    updateTime   datetime     default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间',
    isDelete     tinyint      default 0                 not null comment '是否删除',
    index idx_unionId (unionId)
) comment '用户' collate = utf8mb4_unicode_ci;

-- 帖子表
create table if not exists post
(
    id         bigint auto_increment comment 'id' primary key,
    title      varchar(512)                       null comment '标题',
    content    text                               null comment '内容',
    tags       varchar(1024)                      null comment '标签列表（json 数组）',
    thumbNum   int      default 0                 not null comment '点赞数',
    favourNum  int      default 0                 not null comment '收藏数',
    userId     bigint                             not null comment '创建用户 id',
    createTime datetime default CURRENT_TIMESTAMP not null comment '创建时间',
    updateTime datetime default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间',
    isDelete   tinyint  default 0                 not null comment '是否删除',
    index idx_userId (userId)
) comment '帖子' collate = utf8mb4_unicode_ci;

-- 帖子点赞表（硬删除）
create table if not exists post_thumb
(
    id         bigint auto_increment comment 'id' primary key,
    postId     bigint                             not null comment '帖子 id',
    userId     bigint                             not null comment '创建用户 id',
    createTime datetime default CURRENT_TIMESTAMP not null comment '创建时间',
    updateTime datetime default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间',
    index idx_postId (postId),
    index idx_userId (userId)
) comment '帖子点赞';

-- 帖子收藏表（硬删除）
create table if not exists post_favour
(
    id         bigint auto_increment comment 'id' primary key,
    postId     bigint                             not null comment '帖子 id',
    userId     bigint                             not null comment '创建用户 id',
    createTime datetime default CURRENT_TIMESTAMP not null comment '创建时间',
    updateTime datetime default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间',
    index idx_postId (postId),
    index idx_userId (userId)
) comment '帖子收藏';

-- 接口信息表
CREATE TABLE if not exists interface_info
(
    `id`              bigint       NOT NULL AUTO_INCREMENT comment '主键' primary key,
    `name`            VARCHAR(256) NOT NULL COMMENT '接口名称',
    `description`     varchar(256) comment '描述',
    `url`             VARCHAR(512) NOT NULL COMMENT '接口地址',
    `method`          VARCHAR(256) NOT NULL COMMENT '请求类型',
    `requestHeader`   TEXT comment '请求头',
    `responseHeader`  TEXT comment '响应头',
    `interfaceStatus` TINYINT      NOT NULL COMMENT '接口状态',
    `userId`          bigint       NOT NULL COMMENT '创建人',
    `status`          int                   default 0 not null comment '状态，0-正常，1-禁用',
    `isDeleted`       TINYINT      NOT NULL DEFAULT 0 COMMENT '逻辑删除标识，1表示已删除，0表示未删除',
    `createdTime`     DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP comment '创建时间',
    updateTime        datetime     NOT NULL  default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间'
)  COMMENT '接口信息表';




INSERT INTO interface_info (name, description, url, method, requestHeader, responseHeader, interfaceStatus, userId, status, isDeleted, createdTime, updateTime)
VALUES ('接口1', '这是一个接口描述', 'http://example.com/api/v1/interface1', 'GET', '{"key1": "value1", "key2": "value2"}', '{"Content-Type": "application/json"}', 1, 100, 0, 0, '2021-01-01 00:00:00', '2021-01-01 00:00:00');

INSERT INTO interface_info (name, description, url, method, requestHeader, responseHeader, interfaceStatus, userId, status, isDeleted, createdTime, updateTime)
VALUES ('接口2', '这是一个接口描述', 'http://example.com/api/v1/interface2', 'POST', '{"key1": "value1", "key2": "value2"}', '{"Content-Type": "application/json"}', 1, 100, 0, 0, '2021-01-01 00:00:00', '2021-01-01 00:00:00');

INSERT INTO interface_info (name, description, url, method, requestHeader, responseHeader, interfaceStatus, userId, status, isDeleted, createdTime, updateTime)
VALUES ('接口3', '这是一个接口描述', 'http://example.com/api/v1/interface3', 'PUT', '{"key1": "value1", "key2": "value2"}', '{"Content-Type": "application/json"}', 1, 100, 0, 0, '2021-01-01 00:00:00', '2021-01-01 00:00:00');
