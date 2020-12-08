#客户端连接服务器端使用的编码是utf8
SET NAMES UTF8;
#丢弃数据库game，如果存在
DROP DATABASE IF EXISTS game;
#创建game数据库并设置utf8的编码格式
CREATE DATABASE game CHARSET=UTF8;
#进入game数据库
USE game;
#创建用户表game_users
CREATE TABLE game_users(
  uid INT UNSIGNED NOT NULL KEY AUTO_INCREMENT COMMENT '用户编号',
  username VARCHAR(32) NOT NULL UNIQUE COMMENT '用户账号',
  password VARCHAR(32) NOT NULL COMMENT '用户密码，MD5',
  nickname VARCHAR(12) UNIQUE DEFAULT NULL COMMENT '用户昵称',
  phone VARCHAR(11) UNIQUE DEFAULT NULL COMMENT '手机号',
  gender SMALLINT COMMENT '性别',
  birthday INT UNSIGNED COMMENT '生日',
  avatar VARCHAR(50) NOT NULL DEFAULT 'unnamed.jpg' COMMENT '用户头像',
  sign VARCHAR(30) COMMENT '用户签名'
);

#插入用户数据
INSERT INTO game_users(username,password,nickname,phone,gender,avatar) VALUES 
('dingding',MD5(12345678),'丁丁','18612345678',0,'33.jpg'),
('dangdang',MD5(12345678),'当当','18687654321',0,'16.jpg'),
('ranran',MD5(12345678),'冉冉','13312345678',0,'24.jpg'),
('liangliang',MD5(12345678),'晾凉','13512345678',1,'26.jpg'),
('dongdong',MD5(12345678),'冬冬','15512345678',1,'39.jpg'),
('huahua',MD5(12345678),'花桦','15912345678',0,'37.jpg'),
('dujiang',MD5(12345678),'渡江','18687564124',0,'43.jpg');

#创建文章信息表
CREATE TABLE game_articles(
  aid INT UNSIGNED NOT NULL KEY AUTO_INCREMENT COMMENT '文章编号',
  title VARCHAR(32) NOT NULL COMMENT '文章标题',
  description VARCHAR(255) NOT NULL COMMENT '文章简介',
  content MEDIUMTEXT NOT NULL COMMENT '文章正文',
  image VARCHAR(50) DEFAULT NULL COMMENT '文章缩略图',
  category_id SMALLINT NOT NULL COMMENT '文章分类ID，外键',
  author_id INT UNSIGNED NOT NULL COMMENT '作者ID，外键',
  created_at INT UNSIGNED NOT NULL COMMENT '文章创建日期'
);

#创建作者表
CREATE TABLE game_author(
  pid INT UNSIGNED NOT NULL KEY AUTO_INCREMENT COMMENT '作者编号',
  article_number MEDIUMINT NOT NULL DEFAULT '0'
);

#视频信息表
CREATE TABLE game_videos(
  vid INT UNSIGNED NOT NULL KEY AUTO_INCREMENT COMMENT '视频编号',
  link VARCHAR(255) NOT NULL COMMENT '视频链接',
  author_id MEDIUMINT NOT NULL UNIQUE COMMENT '作者ID，外键'
);

#板块分类表
CREATE TABLE game_category(
  cid INT UNSIGNED NOT NULL KEY AUTO_INCREMENT COMMENT '板块编号',
  class_name VARCHAR(8) UNIQUE NOT NULL COMMENT '板块名称'
);

#插入板块数据
INSERT INTO game_category(class_name) VALUES 
('热点'),('推荐'),('关注'),('精选'),('英雄联盟'),('王者荣耀'),('和平精英'),('我的世界');

#评论表
CREATE TABLE game_comments(
  oid INT UNSIGNED NOT NULL KEY AUTO_INCREMENT COMMENT '评论编号',
  content VARCHAR(128) NOT NULL COMMENT '评论内容',
  user_id INT UNSIGNED NOT NULL COMMENT '用户ID，外键',
  article_id INT UNSIGNED NOT NULL COMMENT '文章ID，外键',
  created_at INT UNSIGNED NOT NULL COMMENT '评论发表时间'
);

#轮播图表
CREATE TABLE game_carousel(
  rid INT UNSIGNED NOT NULL KEY AUTO_INCREMENT COMMENT '轮播图编号',
  image VARCHAR(50) NOT NULL COMMENT '轮播图图片'
);