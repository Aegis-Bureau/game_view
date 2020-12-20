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
('dingding',MD5(12345678),'丁丁','18612345678',0,'01.jpg'),
('dangdang',MD5(12345678),'当当','18687654321',0,'03.jpg'),
('ranran',MD5(12345678),'冉冉','13312345678',0,'04.jpg'),
('liangliang',MD5(12345678),'晾凉','13512345678',1,'02.jpg'),
('dongdong',MD5(12345678),'冬冬','15512345678',1,'03.jpg'),
('huahua',MD5(12345678),'花桦','15912345678',0,'05.jpg'),
('dujiang',MD5(12345678),'渡江','18687564124',0,'06.jpg'),
('akun',MD5(12345678),'阿坤','13653644904',0,'04.jpg');

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

#赛事分类表
CREATE TABLE game_game(
  gid INT UNSIGNED NOT NULL KEY AUTO_INCREMENT COMMENT '分类编号',
  label VARCHAR(32) NOT NULL COMMENT '分类',
  img VARCHAR(50) NOT NULL COMMENT '头像'
);

#插入赛事分类数据
INSERT INTO game_game(label,img) VALUES 
('EPIC联赛','EPIC.jpg'),
('2020德玛西亚杯','dmxy.jpg'),
('2020和平精英全球总决赛','hpjy.jpg'),
('NEST2020','NEST.jpg'),
('2020PELS3','PEL.jpg'),
('2020PCL秋季赛','PCL.jpg'),
('英雄联盟S10','2020dmxy.jpg'),
('2020KPL秋季赛','KPL.jpg'),
('2020LPL春季赛','LPL.jpg'),
('2020LCS夏季赛','LCS.jpg'),
('ESLONE','ESLONE.jpg'),
('2020LEC春季赛','LEC.jpg'),
('2020PEL','2020PEL.jpg');

#赛事详情表
CREATE TABLE game_details(
  did INT UNSIGNED NOT NULL KEY AUTO_INCREMENT COMMENT '赛事编号',
  game_id INT UNSIGNED NOT NULL COMMENT '分类ID，外键',
  created_times INT UNSIGNED NOT NULL COMMENT '日期',
  created_time INT UNSIGNED NOT NULL COMMENT '赛事时间',
  title VARCHAR(32) NOT NULL COMMENT '赛事标题',
  name_1 VARCHAR(32) COMMENT '战队1',
  img_1 VARCHAR(50) COMMENT '战队1头像',
  name_2 VARCHAR(32) COMMENT '战队2',
  img_2 VARCHAR(50) COMMENT '战队2头像',
  result VARCHAR(16) COMMENT '战绩'
);

#插入赛事详情数据
INSERT INTO game_details(game_id,created_times,created_time,title,name_1,img_1,name_2,img_2,result) VALUES 
(3,'1607817600','1607857200','第三周-周末积分赛','','','','',''),
(4,'1605850000','1605850000','总决赛DAY1','WE','NEST/WE.jpg','EDG','NEST/EDG.jpg','1:2'),
(1,'1607817600','1607860800','EPIC联赛','LtW','EPIC/LtW.png','Alliance','EPIC/Alliance.jpg',''),
(12,'1587400000','1587400000','决赛','FNC','LEC/FNC.jpg','G2','LEC/G2.jpg','0:3'),
(8,'1608368400','1608368400','总决赛','DYG','KPL/DYG.jpg','成都AG超玩会','KPL/AG.jpg',''),
(1,'1607817600','1607860800','D2败者组决赛','OG','EPIC/OG.jpg','Vikin.gg','EPIC/Vikin.jpg','3:0'),
(1,'1607878800','1607878800','决赛','VP','EPIC/VP.jpg','OG','EPIC/OG.jpg',''),
(4,'1605850000','1605850000','总决赛DAY1','RW','NEST/RW.png','LGD','NEST/LGD.jpg','2:0'),
(4,'1605850000','1605850000','总决赛DAY1','FPX','NEST/FPX.png','RNG','NEST/RNG.jpg','2:1'),
(4,'1605890000','1605890000','总决赛DAY2','VG','NEST/VG.jpg','SN','NEST/SN.jpg','2:0'),
(4,'1605990000','1605990000','季军赛','FPX','NEST/FPX.png','EDG','NEST/EDG.jpg','1:2'),
(4,'1605990000','1605990000','总决赛','RW','NEST/RW.png','VG','NEST/VG.jpg','0:2'),
(10,'1587600000','1587600000','半决赛','FLY','LCS/FLY.jpg','EG','LCS/EG.jpg','3:1'),
(10,'1587600000','1587600000','决赛','C9','LCS/C9.jpg','FLY','LCS/FLY.jpg','3:0'),
(12,'1587400000','1587400000','半决赛','MAD','LEC/MAD.jpg','G2','LEC/G2.jpg','1:3');

#赛事直播表
CREATE TABLE game_live(
  lid INT UNSIGNED NOT NULL KEY AUTO_INCREMENT COMMENT '直播编号',
  title VARCHAR(32) NOT NULL COMMENT '直播标题',
  img VARCHAR(50) NOT NULL COMMENT '图片',
  begin SMALLINT NOT NULL COMMENT '状态'
);

#插入直播数据
INSERT INTO game_live(title,img,begin) VALUES
('2020和平精英全球总决赛','2020gwsc.jpg',1),
('DOTA2 EPIC联赛','dota2epic.jpg',1),
('2020KPL秋季赛','KPL65456.jpg',1),
('英雄联盟S10全球总决赛','180697389.jpg',0),
('2020PCL','2020PCL.jpg',0),
('2020LCK春季赛','2020lck.jpg',0),
('2020KPL春季赛','KPL65456.jpg',0),
('2020LOL季中杯','2020LOL.jpg',0);