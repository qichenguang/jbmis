/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.5.36 : Database - jinbi
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`jinbi` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `jinbi`;

/*Table structure for table `jb_alert` */

DROP TABLE IF EXISTS `jb_alert`;

CREATE TABLE `jb_alert` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pro_id` char(20) NOT NULL COMMENT '项目ID',
  `depsx` char(20) DEFAULT NULL COMMENT '部门列表',
  `msg` char(50) DEFAULT NULL COMMENT '报警信息',
  `alert_time` datetime DEFAULT NULL COMMENT '报警日期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='报警表';

/*Data for the table `jb_alert` */

insert  into `jb_alert`(`id`,`pro_id`,`depsx`,`msg`,`alert_time`) values (30,'pro_1','cg,ys,gc','采购内控单提交时间 晚于 项目实际开工时间','2014-06-19 00:00:00');

/*Table structure for table `jb_cg_vo` */

DROP TABLE IF EXISTS `jb_cg_vo`;

CREATE TABLE `jb_cg_vo` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pro_id` char(30) NOT NULL COMMENT '项目ID',
  `srctype` char(5) NOT NULL COMMENT '采购 类型:装修,机电',
  `cg_name` char(30) NOT NULL COMMENT '采购 名称',
  `cg_je` double NOT NULL COMMENT '采购金额',
  `cg_reson` char(1) NOT NULL COMMENT '采购 原因',
  `cg_desc` char(200) NOT NULL COMMENT '采购 描述',
  `vo1_je` double NOT NULL COMMENT 'VO1 采购金额',
  `vo1_reson` char(1) NOT NULL COMMENT 'VO1 采购 原因',
  `vo1_desc` char(200) NOT NULL COMMENT 'VO1 采购 描述',
  `vo2_je` double NOT NULL COMMENT 'VO2 采购金额',
  `vo2_reson` char(1) NOT NULL COMMENT 'VO2 采购 原因',
  `vo2_desc` char(200) NOT NULL COMMENT 'VO2 采购 描述',
  `vo3_je` double NOT NULL COMMENT 'VO3 采购金额',
  `vo3_reson` char(1) NOT NULL COMMENT 'VO3 采购 原因',
  `vo3_desc` char(200) NOT NULL COMMENT 'VO3 采购 描述',
  `ys_pj` char(1) NOT NULL COMMENT '评价：预算部',
  `sj_pj` char(1) NOT NULL COMMENT '评价：设计部',
  `jd_pj` char(1) NOT NULL COMMENT '评价：机电部',
  `gc_pj` char(1) NOT NULL COMMENT '评价：工程部',
  `cg_pj` char(1) NOT NULL COMMENT '评价：采购部',
  `sh_pj` char(1) NOT NULL COMMENT '评价：售后部',
  `cg_gys_name` char(5) NOT NULL COMMENT '供应商名称',
  `cg_ht_lx` char(1) NOT NULL COMMENT '采购合同类型',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='采购材料 VO 表';

/*Data for the table `jb_cg_vo` */

insert  into `jb_cg_vo`(`id`,`pro_id`,`srctype`,`cg_name`,`cg_je`,`cg_reson`,`cg_desc`,`vo1_je`,`vo1_reson`,`vo1_desc`,`vo2_je`,`vo2_reson`,`vo2_desc`,`vo3_je`,`vo3_reson`,`vo3_desc`,`ys_pj`,`sj_pj`,`jd_pj`,`gc_pj`,`cg_pj`,`sh_pj`,`cg_gys_name`,`cg_ht_lx`) values (81,'pro_1','','W',0,'','',0,'','',0,'','',0,'','','','','','','','','',''),(82,'pro_1','qq','A',5,'','wy',5,'E','sdf',6,'I','asdf',0,'0','','','','','','','','',''),(78,'pro_1','','T',0,'','',0,'','',0,'','',0,'','','','','','','','','',''),(79,'pro_1','','U',0,'','',0,'','',0,'','',0,'','','','','','','','','',''),(80,'pro_1','','V',0,'','',0,'','',0,'','',0,'','','','','','','','','',''),(77,'pro_1','','S',0,'','',0,'','',0,'','',0,'','','','','','','','','',''),(76,'pro_1','','R',0,'','',0,'','',0,'','',0,'','','','','','','','','',''),(75,'pro_1','','Q',0,'','',0,'','',0,'','',0,'','','','','','','','','',''),(74,'pro_1','','P',0,'','',0,'','',0,'','',0,'','','','','','','','','',''),(73,'pro_1','','O',0,'','',0,'','',0,'','',0,'','','','','','','','','',''),(72,'pro_1','','N',0,'','',0,'','',0,'','',0,'','','','','','','','','',''),(71,'pro_1','','M',0,'','',0,'','',0,'','',0,'','','','','','','','','',''),(70,'pro_1','','L',0,'','',0,'','',0,'','',0,'','','','','','','','','',''),(69,'pro_1','','K',0,'','',0,'','',0,'','',0,'','','','','','','','','',''),(68,'pro_1','','J',0,'','',0,'','',0,'','',0,'','','','','','','','','',''),(67,'pro_1','','I',0,'','',0,'','',0,'','',0,'','','','','','','','','',''),(66,'pro_1','','H',0,'','',0,'','',0,'','',0,'','','','','','','','','',''),(65,'pro_1','','G',0,'','',0,'','',0,'','',0,'','','','','','','','','',''),(64,'pro_1','','F',0,'','',0,'','',0,'','',0,'','','','','','','','','',''),(63,'pro_1','','E',0,'','',0,'','',0,'','',0,'','','','','','','','','',''),(62,'pro_1','','D',0,'','',0,'','',0,'','',0,'','','','','','','','','',''),(61,'pro_1','','C',0,'','',0,'','',0,'','',0,'','','','','','','','','',''),(60,'pro_1','','B',0,'','',0,'','',0,'','',0,'','','','','','','','','',''),(59,'pro_1','','A',0,'','',0,'','',0,'','',0,'','','','','','','','','',''),(83,'pro_1','qq','B',0,'','',0,'','',0,'','',0,'','','','','','','','','',''),(84,'pro_1','qq','C',0,'','',0,'','',0,'','',0,'','','','','','','','','',''),(85,'pro_1','qq','D',100,'','yu',200,'E','400',400,'F','',0,'0','','','','','','','','',''),(86,'pro_1','qq','E',0,'','',0,'','',0,'','',0,'','','','','','','','','',''),(87,'pro_1','qq','F',0,'','',0,'','',0,'','',0,'','','','','','','','','',''),(88,'pro_1','qq','G',0,'','',0,'','',0,'','',0,'','','','','','','','','',''),(89,'pro_1','qq','H',0,'','',0,'','',0,'','',0,'','','','','','','','','',''),(90,'pro_1','qq','I',0,'','',0,'','',0,'','',0,'','','','','','','','','',''),(91,'pro_1','qq','J',0,'','',0,'','',0,'','',0,'','','','','','','','','',''),(92,'pro_1','qq','K',0,'','',0,'','',0,'','',0,'','','','','','','','','',''),(93,'pro_1','qq','L',0,'','',0,'','',0,'','',0,'','','','','','','','','',''),(94,'pro_1','qq','M',0,'','',0,'','',0,'','',0,'','','','','','','','','',''),(95,'pro_1','qq','N',0,'','',0,'','',0,'','',0,'','','','','','','','','',''),(96,'pro_1','qq','O',0,'','',0,'','',0,'','',0,'','','','','','','','','',''),(97,'pro_1','qq','P',0,'','',0,'','',0,'','',0,'','','','','','','','','',''),(98,'pro_1','qq','Q',0,'','',0,'','',0,'','',0,'','','','','','','','','',''),(99,'pro_1','qq','R',0,'','',0,'','',0,'','',0,'','','','','','','','','',''),(100,'pro_1','qq','S',0,'','',0,'','',0,'','',0,'','','','','','','','','',''),(101,'pro_1','qq','T',0,'','',0,'','',0,'','',0,'','','','','','','','','',''),(102,'pro_1','qq','U',0,'','',0,'','',0,'','',0,'','','','','','','','','',''),(103,'pro_1','qq','V',0,'','',0,'','',0,'','',0,'','','','','','','','','',''),(104,'pro_1','qq','W',0,'','',0,'','',0,'','',0,'','','','','','','','','',''),(105,'pro_1','zxcg','机床',2,'','jc',3,'E','v1',4,'B','v2',7,'I','v3','','','','','','','',''),(106,'pro_1','jdcg','废物',3,'','阿斯顿飞家阿发',3,'D','阿斯蒂芬',0,'0','',0,'0','','','','','','','','','');

/*Table structure for table `jb_customer_vo` */

DROP TABLE IF EXISTS `jb_customer_vo`;

CREATE TABLE `jb_customer_vo` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pro_id` char(8) NOT NULL COMMENT '项目ID',
  `vo_type` char(5) NOT NULL COMMENT 'VO 类型',
  `vo_desc` char(200) NOT NULL COMMENT 'VO 描述',
  `vo_reson` char(1) NOT NULL COMMENT 'VO 原因',
  `vo_le` double DEFAULT NULL COMMENT 'VO价格',
  `vo_je` double DEFAULT NULL COMMENT 'VO价格',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=84 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='客户VO表';

/*Data for the table `jb_customer_vo` */

insert  into `jb_customer_vo`(`id`,`pro_id`,`vo_type`,`vo_desc`,`vo_reson`,`vo_le`,`vo_je`) values (66,'pro_1','zx','zx','A',NULL,1),(67,'pro_1','zx','zx','E',NULL,2),(68,'pro_1','av','av','D',NULL,1.5),(69,'pro_1','av','av','C',NULL,2),(70,'pro_1','zx','zx','C',NULL,4),(71,'pro_1','zx','zx','E',NULL,12),(72,'pro_1','jps','jps','C',NULL,12),(73,'pro_1','sec','sec','C',NULL,12),(74,'pro_1','it','it','B',NULL,10),(75,'pro_1','dq','dq','D',NULL,12),(76,'pro_1','kt','kt','B',NULL,6),(77,'pro_1','it','it','C',NULL,10),(78,'pro_1','av','av','D',NULL,6.5),(79,'pro_1','xf','xf','C',NULL,2),(80,'pro_1','cg','cg','D',NULL,2),(81,'pro_1','cg','cg','B',NULL,3),(82,'pro_1','cg','cg','D',NULL,6),(83,'pro_1','zx','sfsdsdsd','G',NULL,40);

/*Table structure for table `jb_fb_vo` */

DROP TABLE IF EXISTS `jb_fb_vo`;

CREATE TABLE `jb_fb_vo` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pro_id` char(30) NOT NULL COMMENT '项目ID',
  `vo_type` char(5) NOT NULL COMMENT 'VO 类型',
  `vo_je` double NOT NULL COMMENT 'VO价格',
  `vo_reson` char(1) NOT NULL COMMENT 'VO 原因',
  `vo_desc` char(200) NOT NULL COMMENT 'VO 描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='分包VO表';

/*Data for the table `jb_fb_vo` */

insert  into `jb_fb_vo`(`id`,`pro_id`,`vo_type`,`vo_je`,`vo_reson`,`vo_desc`) values (30,'pro_1','zx',1,'A','zx'),(31,'pro_1','dq',2,'G','dq'),(32,'pro_1','kt',3,'B','kt'),(33,'pro_1','av',10,'E','av'),(34,'pro_1','av',9,'D','av'),(35,'pro_1','xf',2,'D','xf'),(36,'pro_1','jps',1,'F','jps'),(37,'pro_1','it',3,'E','3'),(38,'pro_1','sec',2,'C','22'),(39,'pro_1','zx',5,'H','zx');

/*Table structure for table `jb_fbs` */

DROP TABLE IF EXISTS `jb_fbs`;

CREATE TABLE `jb_fbs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fbs_name` char(20) NOT NULL COMMENT '分包商名称',
  `fbs_type` char(5) NOT NULL COMMENT '分包商类型',
  `lxr_name` char(20) NOT NULL COMMENT '联系人姓名',
  `lxr_phone` char(20) DEFAULT NULL COMMENT '联系人电话',
  `email` char(30) DEFAULT NULL COMMENT '邮箱',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '标识 1：新建 2:正常已经审核 3.已经删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='分包商表';

/*Data for the table `jb_fbs` */

insert  into `jb_fbs`(`id`,`fbs_name`,`fbs_type`,`lxr_name`,`lxr_phone`,`email`,`status`) values (30,'qcg','zx','aqafd','qaf','adf@126.com',2),(31,'qcgasdf','zx','asdf','asdfas','qcg@132.com',2),(32,'dt','kt','asdf','asdf','qcg@126.com',2);

/*Table structure for table `jb_gczcjl` */

DROP TABLE IF EXISTS `jb_gczcjl`;

CREATE TABLE `jb_gczcjl` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT NULL COMMENT '录入人员',
  `department` char(2) DEFAULT NULL COMMENT '部门',
  `pro_id` char(8) NOT NULL COMMENT '项目ID',
  `in_type` char(5) NOT NULL COMMENT '输入 类型',
  `in_sub_type` char(5) NOT NULL COMMENT '输入 子类型',
  `jyzj` varchar(1024) NOT NULL COMMENT '经验总结',
  `ydwt` varchar(1024) NOT NULL COMMENT '具体遇到的问题',
  `jjfa` varchar(1024) NOT NULL COMMENT '具体的解决方案',
  `ckwj` varchar(1024) NOT NULL COMMENT '参考查询文件',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='过程资产积累表';

/*Data for the table `jb_gczcjl` */

insert  into `jb_gczcjl`(`id`,`user_id`,`department`,`pro_id`,`in_type`,`in_sub_type`,`jyzj`,`ydwt`,`jjfa`,`ckwj`) values (39,30,'gc','pro_1','A','O','1','1','1','1'),(34,30,'sc','pro_1','B','N','5','6','7','8'),(36,30,'sc','pro_1','A','A','p','1','1','1'),(37,30,'gc','pro_1','B','E','1','1','1','1'),(38,30,'sj','pro_1','B','J','1','1','1','1'),(40,30,'gc','pro_1','B','A','1','1','1','1'),(41,30,'jd','pro_1','B','R','1','1','1','1'),(42,30,'jd','pro_1','A','O','2','2','2','2'),(43,30,'jd','pro_1','A','C','2','2','2','2'),(44,30,'jd','pro_1','C','S','3','3','3','3'),(45,30,'sc','pro_1','A','E','1','1','1','1'),(46,30,'sc','pro_1','A','A','1','1','1','1'),(49,30,'sc','pro_1','A','B','这是我去年写的一篇文章，昨天赛前修改了一下：\n\n2014 世界杯我这个伪球迷为什么支持智利队\n\n这其中的原因要从跟我一个办公室的智利同（da）学（shu）说起。他曾经在智利总统顾问团里工作，他申请的推荐信是智利教育部长写的。每次想到这里就觉得当初肯定是哪个教授手一抖才录的我…\n\n这位智利大叔真是个人物，他最喜欢的东西是足球，最讨厌的东西是限速牌，做学术报告不用激光笔而用路边捡的一米多长带刺的树枝，经常偷吃我饼干，然后第二天觉得愧疚赔我一盒新的，结果自己又吃完。关于他我将来肯定会写篇日志让大家奇人共赏，不过今天我们就聊足球。\n\n正常的已婚男子如果在办公桌上放一张照片，那一般会是自己老婆。他桌上放着十一个爷们：球队的合影，放在最显眼的地方，一尘不染。\n\n他曾经用“要回家看智利队关键比赛”向导师请假，并觉得这是完全正当的理由。各位苦逼PhD你们谁敢试试？\n\n他习惯一边听着比赛转播一边写论文，效率却比我不知道高到哪里去了。\n\n他觉得结婚后最不能忍受的就是老婆不允许他每天起床先看半小时球赛。\n\n他每天下午三点到五点间都会准时忍不住向我感叹：“尼玛实在等不及想看世界杯了啊！”他告诉我，他脑中的纪年系统不是公元XXXX年，而是以世界杯为基准的，比如去年叫做“巴西世界杯倒数2年”，今年叫“巴西世界杯倒数1年”，而明年就是“巴西世界杯啊啊啊啊啊啊啊啊！！！” 所以说，爱一个东西爱到骨子里算什么，爱到时间轴里才特么是真爱。\n\n咱们再来聊聊孕育了智利大叔的这个神奇国度：智利。一般中国人对智利的了解就停留在四个方面：世界地图上最狭长的那一条国家，2010年智利33名矿工被困地下700米69天后全部获救震惊世界，在美国经常填表的同学会发现智利永远是China上面那个选项，或者对政治感兴趣的可能还知道军事独裁家皮诺切特。但中国对智利足球了解和智利队球迷的数量几乎为零。虽然永远处在巴西、阿根廷甚至乌拉圭的光晕中，但智利的足球文化绝对是货真价实的硬核南美范儿。\n\n智利电视上足球消息占新闻节目的比例甚至超过领导开会占新闻联播的比例，任何时段打开电视至少一半频道在播足球或足球新闻。\n\n智利不存在第二体育运动。\n\n前两天智利大叔回国参加好友婚礼，婚礼开始前两小时新郎、伴郎和所有男性客人全体消失，原来是去看世界杯分组抽签了。同理，据估计巴西世界杯期间，智利国内的男女比会出现明显失衡。\n\n智利黑社会烧杀抢掠样样不会，只玩足球。几乎每支俱乐部都与当地黑社会','这是我去年写的一篇文章，昨天赛前修改了一下：\n\n2014 世界杯我这个伪球迷为什么支持智利队\n\n这其中的原因要从跟我一个办公室的智利同（da）学（shu）说起。他曾经在智利总统顾问团里工作，他申请的推荐信是智利教育部长写的。每次想到这里就觉得当初肯定是哪个教授手一抖才录的我…\n\n这位智利大叔真是个人物，他最喜欢的东西是足球，最讨厌的东西是限速牌，做学术报告不用激光笔而用路边捡的一米多长带刺的树枝，经常偷吃我饼干，然后第二天觉得愧疚赔我一盒新的，结果自己又吃完。关于他我将来肯定会写篇日志让大家奇人共赏，不过今天我们就聊足球。\n\n正常的已婚男子如果在办公桌上放一张照片，那一般会是自己老婆。他桌上放着十一个爷们：球队的合影，放在最显眼的地方，一尘不染。\n\n他曾经用“要回家看智利队关键比赛”向导师请假，并觉得这是完全正当的理由。各位苦逼PhD你们谁敢试试？\n\n他习惯一边听着比赛转播一边写论文，效率却比我不知道高到哪里去了。\n\n他觉得结婚后最不能忍受的就是老婆不允许他每天起床先看半小时球赛。\n\n他每天下午三点到五点间都会准时忍不住向我感叹：“尼玛实在等不及想看世界杯了啊！”他告诉我，他脑中的纪年系统不是公元XXXX年，而是以世界杯为基准的，比如去年叫做“巴西世界杯倒数2年”，今年叫“巴西世界杯倒数1年”，而明年就是“巴西世界杯啊啊啊啊啊啊啊啊！！！” 所以说，爱一个东西爱到骨子里算什么，爱到时间轴里才特么是真爱。\n\n咱们再来聊聊孕育了智利大叔的这个神奇国度：智利。一般中国人对智利的了解就停留在四个方面：世界地图上最狭长的那一条国家，2010年智利33名矿工被困地下700米69天后全部获救震惊世界，在美国经常填表的同学会发现智利永远是China上面那个选项，或者对政治感兴趣的可能还知道军事独裁家皮诺切特。但中国对智利足球了解和智利队球迷的数量几乎为零。虽然永远处在巴西、阿根廷甚至乌拉圭的光晕中，但智利的足球文化绝对是货真价实的硬核南美范儿。\n\n智利电视上足球消息占新闻节目的比例甚至超过领导开会占新闻联播的比例，任何时段打开电视至少一半频道在播足球或足球新闻。\n\n智利不存在第二体育运动。\n\n前两天智利大叔回国参加好友婚礼，婚礼开始前两小时新郎、伴郎和所有男性客人全体消失，原来是去看世界杯分组抽签了。同理，据估计巴西世界杯期间，智利国内的男女比会出现明显失衡。\n\n智利黑社会烧杀抢掠样样不会，只玩足球。几乎每支俱乐部都与当地黑社会','这是我去年写的一篇文章，昨天赛前修改了一下：\n\n2014 世界杯我这个伪球迷为什么支持智利队\n\n这其中的原因要从跟我一个办公室的智利同（da）学（shu）说起。他曾经在智利总统顾问团里工作，他申请的推荐信是智利教育部长写的。每次想到这里就觉得当初肯定是哪个教授手一抖才录的我…\n\n这位智利大叔真是个人物，他最喜欢的东西是足球，最讨厌的东西是限速牌，做学术报告不用激光笔而用路边捡的一米多长带刺的树枝，经常偷吃我饼干，然后第二天觉得愧疚赔我一盒新的，结果自己又吃完。关于他我将来肯定会写篇日志让大家奇人共赏，不过今天我们就聊足球。\n\n正常的已婚男子如果在办公桌上放一张照片，那一般会是自己老婆。他桌上放着十一个爷们：球队的合影，放在最显眼的地方，一尘不染。\n\n他曾经用“要回家看智利队关键比赛”向导师请假，并觉得这是完全正当的理由。各位苦逼PhD你们谁敢试试？\n\n他习惯一边听着比赛转播一边写论文，效率却比我不知道高到哪里去了。\n\n他觉得结婚后最不能忍受的就是老婆不允许他每天起床先看半小时球赛。\n\n他每天下午三点到五点间都会准时忍不住向我感叹：“尼玛实在等不及想看世界杯了啊！”他告诉我，他脑中的纪年系统不是公元XXXX年，而是以世界杯为基准的，比如去年叫做“巴西世界杯倒数2年”，今年叫“巴西世界杯倒数1年”，而明年就是“巴西世界杯啊啊啊啊啊啊啊啊！！！” 所以说，爱一个东西爱到骨子里算什么，爱到时间轴里才特么是真爱。\n\n咱们再来聊聊孕育了智利大叔的这个神奇国度：智利。一般中国人对智利的了解就停留在四个方面：世界地图上最狭长的那一条国家，2010年智利33名矿工被困地下700米69天后全部获救震惊世界，在美国经常填表的同学会发现智利永远是China上面那个选项，或者对政治感兴趣的可能还知道军事独裁家皮诺切特。但中国对智利足球了解和智利队球迷的数量几乎为零。虽然永远处在巴西、阿根廷甚至乌拉圭的光晕中，但智利的足球文化绝对是货真价实的硬核南美范儿。\n\n智利电视上足球消息占新闻节目的比例甚至超过领导开会占新闻联播的比例，任何时段打开电视至少一半频道在播足球或足球新闻。\n\n智利不存在第二体育运动。\n\n前两天智利大叔回国参加好友婚礼，婚礼开始前两小时新郎、伴郎和所有男性客人全体消失，原来是去看世界杯分组抽签了。同理，据估计巴西世界杯期间，智利国内的男女比会出现明显失衡。\n\n智利黑社会烧杀抢掠样样不会，只玩足球。几乎每支俱乐部都与当地黑社会','这是我去年写的一篇文章，昨天赛前修改了一下：\n\n2014 世界杯我这个伪球迷为什么支持智利队\n\n这其中的原因要从跟我一个办公室的智利同（da）学（shu）说起。他曾经在智利总统顾问团里工作，他申请的推荐信是智利教育部长写的。每次想到这里就觉得当初肯定是哪个教授手一抖才录的我…\n\n这位智利大叔真是个人物，他最喜欢的东西是足球，最讨厌的东西是限速牌，做学术报告不用激光笔而用路边捡的一米多长带刺的树枝，经常偷吃我饼干，然后第二天觉得愧疚赔我一盒新的，结果自己又吃完。关于他我将来肯定会写篇日志让大家奇人共赏，不过今天我们就聊足球。\n\n正常的已婚男子如果在办公桌上放一张照片，那一般会是自己老婆。他桌上放着十一个爷们：球队的合影，放在最显眼的地方，一尘不染。\n\n他曾经用“要回家看智利队关键比赛”向导师请假，并觉得这是完全正当的理由。各位苦逼PhD你们谁敢试试？\n\n他习惯一边听着比赛转播一边写论文，效率却比我不知道高到哪里去了。\n\n他觉得结婚后最不能忍受的就是老婆不允许他每天起床先看半小时球赛。\n\n他每天下午三点到五点间都会准时忍不住向我感叹：“尼玛实在等不及想看世界杯了啊！”他告诉我，他脑中的纪年系统不是公元XXXX年，而是以世界杯为基准的，比如去年叫做“巴西世界杯倒数2年”，今年叫“巴西世界杯倒数1年”，而明年就是“巴西世界杯啊啊啊啊啊啊啊啊！！！” 所以说，爱一个东西爱到骨子里算什么，爱到时间轴里才特么是真爱。\n\n咱们再来聊聊孕育了智利大叔的这个神奇国度：智利。一般中国人对智利的了解就停留在四个方面：世界地图上最狭长的那一条国家，2010年智利33名矿工被困地下700米69天后全部获救震惊世界，在美国经常填表的同学会发现智利永远是China上面那个选项，或者对政治感兴趣的可能还知道军事独裁家皮诺切特。但中国对智利足球了解和智利队球迷的数量几乎为零。虽然永远处在巴西、阿根廷甚至乌拉圭的光晕中，但智利的足球文化绝对是货真价实的硬核南美范儿。\n\n智利电视上足球消息占新闻节目的比例甚至超过领导开会占新闻联播的比例，任何时段打开电视至少一半频道在播足球或足球新闻。\n\n智利不存在第二体育运动。\n\n前两天智利大叔回国参加好友婚礼，婚礼开始前两小时新郎、伴郎和所有男性客人全体消失，原来是去看世界杯分组抽签了。同理，据估计巴西世界杯期间，智利国内的男女比会出现明显失衡。\n\n智利黑社会烧杀抢掠样样不会，只玩足球。几乎每支俱乐部都与当地黑社会');

/*Table structure for table `jb_gys` */

DROP TABLE IF EXISTS `jb_gys`;

CREATE TABLE `jb_gys` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `gys_name` char(20) NOT NULL COMMENT '供应商名称',
  `gys_type` char(5) NOT NULL COMMENT '供应商类型',
  `lxr_name` char(20) NOT NULL COMMENT '联系人姓名',
  `lxr_phone` char(20) DEFAULT NULL COMMENT '联系人电话',
  `email` char(30) DEFAULT NULL COMMENT '邮箱',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '标识 1：新建 2:正常已经审核 3.已经删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='供应商表';

/*Data for the table `jb_gys` */

insert  into `jb_gys`(`id`,`gys_name`,`gys_type`,`lxr_name`,`lxr_phone`,`email`,`status`) values (30,'gradf','jd','asdf','asf','qcg@126.com',2),(31,'daf','zx','asdf','asdf','qcg@126.com',1),(32,'zxxx','zx','adfa','zzz','qcg@126.com',2);

/*Table structure for table `jb_gys_fbgl` */

DROP TABLE IF EXISTS `jb_gys_fbgl`;

CREATE TABLE `jb_gys_fbgl` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pro_id` char(30) NOT NULL COMMENT '项目ID',
  `fb_lx` char(5) NOT NULL COMMENT '分包类型',
  `ys_fbs_name` char(5) NOT NULL COMMENT '分包商名称',
  `ys_fb_ht_lx` char(1) NOT NULL COMMENT '分包合同类型',
  `ys_pj` char(1) NOT NULL COMMENT '评价：预算部',
  `sj_pj` char(1) NOT NULL COMMENT '评价：设计部',
  `jd_pj` char(1) NOT NULL COMMENT '评价：机电部',
  `gc_pj` char(1) NOT NULL COMMENT '评价：工程部',
  `cg_pj` char(1) NOT NULL COMMENT '评价：采购部',
  `sh_pj` char(1) NOT NULL COMMENT '评价：售后部',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='供应商管理 分包管理表';

/*Data for the table `jb_gys_fbgl` */

insert  into `jb_gys_fbgl`(`id`,`pro_id`,`fb_lx`,`ys_fbs_name`,`ys_fb_ht_lx`,`ys_pj`,`sj_pj`,`jd_pj`,`gc_pj`,`cg_pj`,`sh_pj`) values (76,'pro_1','sec','','','','','','','',''),(75,'pro_1','it','','','','','','','',''),(74,'pro_1','jps','','','','','','','',''),(73,'pro_1','xf','','','','','','','',''),(72,'pro_1','kt','32','E','D','0','0','0','','0'),(71,'pro_1','dq','31','C','0','0','0','0','','0'),(70,'pro_1','zx','32','B','A','0','0','0','','0'),(77,'pro_1','av','','','','','','','','');

/*Table structure for table `jb_pro2user` */

DROP TABLE IF EXISTS `jb_pro2user`;

CREATE TABLE `jb_pro2user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pro_id` char(8) NOT NULL COMMENT '项目ID',
  `user_id` int(11) unsigned NOT NULL COMMENT '用户ID',
  `department` char(2) DEFAULT NULL COMMENT '部门',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=406 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='项目2用户表';

/*Data for the table `jb_pro2user` */

insert  into `jb_pro2user`(`id`,`pro_id`,`user_id`,`department`) values (404,'pro_1',73,'ht'),(403,'pro_1',40,'ys'),(402,'pro_1',39,'ys'),(401,'pro_1',38,'ys'),(400,'pro_1',31,'ys'),(399,'pro_1',37,'sc'),(398,'pro_1',30,'sc'),(397,'pro_1',47,'sj'),(396,'pro_1',46,'sj'),(395,'pro_1',45,'sj'),(394,'pro_1',44,'sj'),(393,'pro_1',43,'sj'),(392,'pro_1',42,'sj'),(391,'pro_1',41,'sj'),(390,'pro_1',33,'sj'),(389,'pro_1',69,'jd'),(388,'pro_1',68,'jd'),(387,'pro_1',67,'jd'),(386,'pro_1',66,'jd'),(385,'pro_1',65,'jd'),(384,'pro_1',64,'jd'),(383,'pro_1',63,'jd'),(382,'pro_1',62,'jd'),(381,'pro_1',61,'jd'),(380,'pro_1',60,'jd'),(379,'pro_1',34,'jd'),(378,'pro_1',59,'gc'),(377,'pro_1',58,'gc'),(376,'pro_1',57,'gc'),(375,'pro_1',56,'gc'),(374,'pro_1',55,'gc'),(373,'pro_1',54,'gc'),(372,'pro_1',53,'gc'),(371,'pro_1',52,'gc'),(370,'pro_1',51,'gc'),(369,'pro_1',50,'gc'),(368,'pro_1',49,'gc'),(367,'pro_1',48,'gc'),(366,'pro_1',32,'gc'),(365,'pro_1',72,'hr'),(364,'pro_1',36,'sh'),(363,'pro_1',71,'cg'),(362,'pro_1',70,'cg'),(361,'pro_1',35,'cg'),(349,'pro_2',43,'sj'),(348,'pro_2',42,'sj'),(347,'pro_2',41,'sj'),(346,'pro_2',33,'sj'),(345,'pro_2',69,'jd'),(344,'pro_2',68,'jd'),(343,'pro_2',67,'jd'),(342,'pro_2',66,'jd'),(341,'pro_2',65,'jd'),(340,'pro_2',64,'jd'),(339,'pro_2',63,'jd'),(338,'pro_2',62,'jd'),(337,'pro_2',61,'jd'),(336,'pro_2',60,'jd'),(335,'pro_2',34,'jd'),(334,'pro_2',74,'gc'),(333,'pro_2',59,'gc'),(332,'pro_2',58,'gc'),(331,'pro_2',57,'gc'),(330,'pro_2',56,'gc'),(329,'pro_2',55,'gc'),(328,'pro_2',54,'gc'),(327,'pro_2',53,'gc'),(326,'pro_2',52,'gc'),(325,'pro_2',51,'gc'),(324,'pro_2',50,'gc'),(323,'pro_2',49,'gc'),(322,'pro_2',48,'gc'),(321,'pro_2',32,'gc'),(320,'pro_2',72,'hr'),(319,'pro_2',36,'sh'),(318,'pro_2',71,'cg'),(317,'pro_2',70,'cg'),(316,'pro_2',35,'cg'),(350,'pro_2',44,'sj'),(351,'pro_2',45,'sj'),(352,'pro_2',46,'sj'),(353,'pro_2',47,'sj'),(354,'pro_2',30,'sc'),(355,'pro_2',37,'sc'),(356,'pro_2',31,'ys'),(357,'pro_2',38,'ys'),(358,'pro_2',39,'ys'),(359,'pro_2',40,'ys'),(360,'pro_2',73,'ht'),(405,'pro_1',75,'gl');

/*Table structure for table `jb_project` */

DROP TABLE IF EXISTS `jb_project`;

CREATE TABLE `jb_project` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pro_id` char(8) NOT NULL COMMENT '项目ID',
  `sh_yjtime` datetime DEFAULT NULL COMMENT '工程部移交售后服务部移交日期',
  `sh_zbjtime` datetime DEFAULT NULL COMMENT '质保金到期日期',
  `sh_zb_sub_detail` longtext COMMENT '质保子项-JSON格式: 包括: 项目明细名称, 项目质保子项明细内容,项目质保子项原因',
  `sh_sh_myd_1` char(1) DEFAULT NULL COMMENT '客户满意度:售后1',
  `sh_sh_myd_1_desc` varchar(200) DEFAULT NULL COMMENT '客户满意度:售后1 相关说明',
  `sh_sh_myd_2` char(1) DEFAULT NULL COMMENT '客户满意度:售后2',
  `sh_sh_myd_2_desc` varchar(200) DEFAULT NULL COMMENT '客户满意度:售后2 相关说明',
  `sh_myd_all` int(2) NOT NULL DEFAULT '0' COMMENT '售后总体满意度（用数值，方便换算）',
  `sh_myd_sub_detail` longtext COMMENT '售后满意度调查表子项-JSON格式: 包括: 名称,售后满意度调查表子项原因,售后满意度附加信息',
  `hr_follow_man` char(10) DEFAULT NULL COMMENT '到款跟踪负责人',
  `cg_clbp_wc_time` datetime DEFAULT NULL COMMENT '材料报批完成时间',
  `cg_clbp_wc_time_desc` char(100) DEFAULT NULL COMMENT '材料报批完成时间:相关说明',
  `cg_buy_gckc_all_amt` double DEFAULT NULL COMMENT '工厂库存及零星材料采购总金额',
  `cg_buy_gcrgf_all_amt` double DEFAULT NULL COMMENT '工厂人工费总金额',
  `cg_buy_zscl_sub_detail` longtext COMMENT 'JSON格式: 装饰材料采购明细, 格式:数组, 数组每项包括：合同号,装饰材料采购明细价格,装饰材料采购明细VO价格,装饰材料采购明细原因,装饰材料采购供应商',
  `cg_buy_jdsb_sub_detail` longtext COMMENT 'JSON格式: 机电设备材料采购明细,格式:数组, 数组每项包括：合同号,机电设备材料采购明细价格,机电设备材料采购明细VO价格,机电设备材料采购明细原因,机电设备材料采购供应商',
  `cg_cljg_mon_pay_rate` double DEFAULT '0.25' COMMENT '材料竣工当月付款比例',
  `cg_cljg_next_mon_pay_rate` double DEFAULT '0.3' COMMENT '材料竣工次月付款比例',
  `cg_clzb_pay_rate` double DEFAULT '0.05' COMMENT '材料质保期满后付款比例',
  `cg_rlzy_cgr1` tinyint(4) DEFAULT NULL COMMENT '人力资源:采购员1',
  `cg_rlzy_cgr1_choose` tinyint(4) DEFAULT NULL COMMENT '人力资源:采购员1 工作比例',
  `cg_rlzy_cgr1_desc` varchar(200) DEFAULT NULL COMMENT '人力资源:采购员1  相关说明',
  `cg_rlzy_cgr2` tinyint(4) DEFAULT NULL COMMENT '人力资源:采购员2',
  `cg_rlzy_cgr2_choose` tinyint(4) DEFAULT NULL COMMENT '人力资源:采购员2 工作比例',
  `cg_rlzy_cgr2_desc` varchar(200) DEFAULT NULL COMMENT '人力资源:采购员2  相关说明',
  `gc_htqd_time` datetime DEFAULT NULL COMMENT '合同签订日期',
  `gc_customer_fkzq` int(11) DEFAULT NULL COMMENT '客户付款账期 单位:天',
  `gc_pay_sh_pzsc` int(11) DEFAULT NULL COMMENT '付款审核批准时长 单位:天',
  `gc_hetong_first_pay_rate` double DEFAULT NULL COMMENT '合同首付款比例',
  `gc_jhkg_time` datetime DEFAULT NULL COMMENT '计划开工日期',
  `gc_jhjg_time` datetime DEFAULT NULL COMMENT '计划竣工日期',
  `gc_dsbptj_jh_time` datetime DEFAULT NULL COMMENT '大厦报批提交日期:计划',
  `gc_dsbptj_sj_time` datetime DEFAULT NULL COMMENT '大厦报批提交日期:实际',
  `gc_dsbptj_time_desc` varchar(200) DEFAULT NULL COMMENT '大厦报批提交日期:相关说明',
  `gc_dsbppz_time` datetime DEFAULT NULL COMMENT '大厦报批批准日期',
  `gc_dsbppz_time_desc` varchar(200) DEFAULT NULL COMMENT '大厦报批批准日期:相关说明',
  `gc_xfbptj_jh_time` datetime DEFAULT NULL COMMENT '消防报批提交日期:计划',
  `gc_xfbptj_sj_time` datetime DEFAULT NULL COMMENT '消防报批提交日期:实际',
  `gc_xfbptj_time_desc` varchar(200) DEFAULT NULL COMMENT '消防报批提交日期:相关说明',
  `gc_xfbppz_time` datetime DEFAULT NULL COMMENT '消防报批批准日期',
  `gc_xfbppz_time_desc` varchar(200) DEFAULT NULL COMMENT '消防报批批准日期:相关说明',
  `gc_kg_jh_time` datetime DEFAULT NULL COMMENT '开工日期:计划',
  `gc_kg_sj_time` datetime DEFAULT NULL COMMENT '开工日期:实际',
  `gc_kg_time_desc` varchar(200) DEFAULT NULL COMMENT '开工日期:相关说明',
  `gc_sl_time` datetime DEFAULT NULL COMMENT '收楼日期',
  `gc_sl_time_desc` varchar(200) DEFAULT NULL COMMENT '收楼日期:相关说明',
  `gc_xfystj_jh_time` datetime DEFAULT NULL COMMENT '消防验收提交日期:计划',
  `gc_xfystj_sj_time` datetime DEFAULT NULL COMMENT '消防验收提交日期:实际',
  `gc_xfystj_time_desc` varchar(200) DEFAULT NULL COMMENT '消防验收提交日期:相关说明',
  `gc_xfyspz_time` datetime DEFAULT NULL COMMENT '消防验收批准日期',
  `gc_xfyspz_time_desc` varchar(200) DEFAULT NULL COMMENT '消防验收批准日期:相关说明',
  `gc_gqyj_jh_time` datetime DEFAULT NULL COMMENT '隔墙隐检日期:计划',
  `gc_gqyj_sj_time` datetime DEFAULT NULL COMMENT '隔墙隐检日期:实际',
  `gc_gqyj_time_desc` varchar(200) DEFAULT NULL COMMENT '隔墙隐检日期:相关说明',
  `gc_jfyj_jh_time` datetime DEFAULT NULL COMMENT '机房移交日期:计划',
  `gc_jfyj_sj_time` datetime DEFAULT NULL COMMENT '机房移交日期:实际',
  `gc_jfyj_time_desc` varchar(200) DEFAULT NULL COMMENT '机房移交日期:相关说明',
  `gc_thyj_jh_time` datetime DEFAULT NULL COMMENT '天花隐检日期:计划',
  `gc_thyj_sj_time` datetime DEFAULT NULL COMMENT '天花隐检日期:实际',
  `gc_thyj_time_desc` varchar(200) DEFAULT NULL COMMENT '天花隐检日期:相关说明',
  `gc_xmwg_khys_jh_time` datetime DEFAULT NULL COMMENT '项目完工日期(客户验收):计划',
  `gc_xmwg_khys_sj_time` datetime DEFAULT NULL COMMENT '项目完工日期(客户验收):实际',
  `gc_xmwg_khys_time_desc` varchar(200) DEFAULT NULL COMMENT '项目完工日期(客户验收):相关说明',
  `gc_xmyj_yyzbqjs_time` datetime DEFAULT NULL COMMENT '项目移交日期(用于质保期计算)',
  `gc_xmyj_yyzbqjs_time_desc` varchar(200) DEFAULT NULL COMMENT '项目移交日期(用于质保期计算):相关说明',
  `gc_jgzltj_time` datetime DEFAULT NULL COMMENT '竣工资料提交日期',
  `gc_jgzltj_time_desc` varchar(200) DEFAULT NULL COMMENT '竣工资料提交日期:相关说明',
  `gc_khbj_jh_time` datetime DEFAULT NULL COMMENT '客户搬家日期:计划',
  `gc_khbj_sj_time` datetime DEFAULT NULL COMMENT '客户搬家日期:实际',
  `gc_khbj_time_desc` varchar(200) DEFAULT NULL COMMENT '客户搬家日期:相关说明',
  `gc_yjsh_jh_time` datetime DEFAULT NULL COMMENT '移交售后日期:计划',
  `gc_yjsh_sj_time` datetime DEFAULT NULL COMMENT '移交售后日期:实际',
  `gc_yjsh_time_desc` varchar(200) DEFAULT NULL COMMENT '移交售后日期:相关说明',
  `gc_zbqm_time` datetime DEFAULT NULL COMMENT '质保期满时间',
  `gc_zbqm_time_desc` varchar(200) DEFAULT NULL COMMENT '质保期满时间:相关说明',
  `gc_gcxg_date_detail` longtext COMMENT '工程相关日期-JSON格式:  包括13项：\n		1.大厦报批提交日期,\n		2.大厦报批批准日期,\n		3.大厦报批提交次数,\n		4.消防报批提交日期,\n		5.消防报批批准日期,\n		6.计划开工日期,\n		7.实际开工日期,\n		8.机房移交,\n		9.天花隐检,\n		10.消防报验提交日期,\n		11.消防报验批准日期,\n		12.计划竣工日期（客户验收）,\n		13.实际竣工日期（客户验收）',
  `gc_jgxg_detail` longtext COMMENT '竣工相关明细-JSON格式:  , 格式:数组, 包括：\n		1.竣工款占合同金额比例,\n		2.计划竣工款到账日期,\n		3.预计结算款到账日期,\n		4.按时完工,\n		5.计划客户搬家日期,\n		6.实际客户搬家日期',
  `gc_rlzy_xmzj` tinyint(4) DEFAULT NULL COMMENT '人力资源:项目总监',
  `gc_rlzy_xmzj_choose` tinyint(4) DEFAULT NULL COMMENT '人力资源:项目总监 工作比例',
  `gc_rlzy_xmzj_desc` varchar(200) DEFAULT NULL COMMENT '人力资源:项目总监  相关说明',
  `gc_rlzy_xmxc1` tinyint(4) DEFAULT NULL COMMENT '人力资源:项目经理',
  `gc_rlzy_xmxc1_choose` tinyint(4) DEFAULT NULL COMMENT '人力资源:项目经理 工作比例',
  `gc_rlzy_xmxc1_desc` varchar(200) DEFAULT NULL COMMENT '人力资源:项目经理  相关说明',
  `gc_rlzy_xmxc2` tinyint(4) DEFAULT NULL COMMENT '人力资源:现场经理',
  `gc_rlzy_xmxc2_choose` tinyint(4) DEFAULT NULL COMMENT '人力资源:现场经理 工作比例',
  `gc_rlzy_xmxc2_desc` varchar(200) DEFAULT NULL COMMENT '人力资源:现场经理  相关说明',
  `gc_rlzy_zxgz1` tinyint(4) DEFAULT NULL COMMENT '人力资源:装修工长1',
  `gc_rlzy_zxgz1_choose` tinyint(4) DEFAULT NULL COMMENT '人力资源:装修工长1 工作比例',
  `gc_rlzy_zxgz1_desc` varchar(200) DEFAULT NULL COMMENT '人力资源:装修工长1  相关说明',
  `gc_rlzy_zxgz2` tinyint(4) DEFAULT NULL COMMENT '人力资源:装修工长2',
  `gc_rlzy_zxgz2_choose` tinyint(4) DEFAULT NULL COMMENT '人力资源:装修工长2 工作比例',
  `gc_rlzy_zxgz2_desc` varchar(200) DEFAULT NULL COMMENT '人力资源:装修工长2  相关说明',
  `gc_rlzy_zxgz3` tinyint(4) DEFAULT NULL COMMENT '人力资源:装修工长3',
  `gc_rlzy_zxgz3_choose` tinyint(4) DEFAULT NULL COMMENT '人力资源:装修工长3 工作比例',
  `gc_rlzy_zxgz3_desc` varchar(200) DEFAULT NULL COMMENT '人力资源:装修工长3  相关说明',
  `gc_rlzy_aqy1` tinyint(4) DEFAULT NULL COMMENT '人力资源:安全员1',
  `gc_rlzy_aqy1_choose` tinyint(4) DEFAULT NULL COMMENT '人力资源:安全员1 工作比例',
  `gc_rlzy_aqy1_desc` varchar(200) DEFAULT NULL COMMENT '人力资源:安全员1  相关说明',
  `gc_rlzy_aqy2` tinyint(4) DEFAULT NULL COMMENT '人力资源:安全员2',
  `gc_rlzy_aqy2_choose` tinyint(4) DEFAULT NULL COMMENT '人力资源:安全员2 工作比例',
  `gc_rlzy_aqy2_desc` varchar(200) DEFAULT NULL COMMENT '人力资源:安全员2  相关说明',
  `gc_rlzy_aqy3` tinyint(4) DEFAULT NULL COMMENT '人力资源:安全员3',
  `gc_rlzy_aqy3_choose` tinyint(4) DEFAULT NULL COMMENT '人力资源:安全员3 工作比例',
  `gc_rlzy_aqy3_desc` varchar(200) DEFAULT NULL COMMENT '人力资源:安全员3  相关说明',
  `gc_rlzy_kfbj1` tinyint(4) DEFAULT NULL COMMENT '人力资源:库房及保洁负责人1',
  `gc_rlzy_kfbj1_choose` tinyint(4) DEFAULT NULL COMMENT '人力资源:库房及保洁负责人1 工作比例',
  `gc_rlzy_kfbj1_desc` varchar(200) DEFAULT NULL COMMENT '人力资源:库房及保洁负责人1  相关说明',
  `gc_rlzy_kfbj2` tinyint(4) DEFAULT NULL COMMENT '人力资源:库房及保洁负责人2',
  `gc_rlzy_kfbj2_choose` tinyint(4) DEFAULT NULL COMMENT '人力资源:库房及保洁负责人2 工作比例',
  `gc_rlzy_kfbj2_desc` varchar(200) DEFAULT NULL COMMENT '人力资源:库房及保洁负责人2  相关说明',
  `gc_rlzy_gczl` tinyint(4) DEFAULT NULL COMMENT '人力资源:工程助理',
  `gc_rlzy_gczl_choose` tinyint(4) DEFAULT NULL COMMENT '人力资源:工程助理 工作比例',
  `gc_rlzy_gczl_desc` varchar(200) DEFAULT NULL COMMENT '人力资源:工程助理  相关说明',
  `gc_xmry_detail` longtext COMMENT '项目人员明细-JSON格式:  包括6项：\n	1.项目总监,\n	2.项目经理,\n	3.现场经理,\n	4.工长列表, 格式:数组, 数组每项包括: 装修工长序号,装修工长承担工程量的比例,\n	5.安全员列表,格式:数组,数组每项包括: 安全员序号,\n	6.现场保洁负责人',
  `gc_fee_detail` longtext COMMENT '工程费用明细-JSON格式:  包括22项：\n	  1.物业管理费用（一般按平米算）,\n		2.办公用品1\n		3.办公用品2\n		4.临时水电设施费\n		5.临时水电费用\n		6.施工手续费\n		7.大楼审图等管理费\n		8.设备租赁费\n		9.空气检测费\n		10.现场保护及成品保护（公司自己做的）\n		11.招待费\n		12.劳防用品其他\n		13.生活交通安置费\n		14.工程保险费\n		15.施工清洁费\n		16.税金\n		17.报审图打图费用\n		18.临时办公室费用\n		19.材料报检费用\n		20.垃圾清运费\n		21.施工图和竣工图（助理最清楚）\n		22.其它费用\n	',
  `jd_jdfatj_time` datetime DEFAULT NULL COMMENT '机电方案提交日期',
  `jd_jdfatj_time_desc` varchar(200) DEFAULT NULL COMMENT '机电方案提交日期相关说明',
  `jd_jdbpttj_time` datetime DEFAULT NULL COMMENT '机电报批图提交日期',
  `jd_jdbpttj_time_desc` varchar(200) DEFAULT NULL COMMENT '机电报批图提交日期:相关说明',
  `jd_jdsgttj_time` datetime DEFAULT NULL COMMENT '机电施工图提交日期',
  `jd_jdsgttj_time_desc` varchar(200) DEFAULT NULL COMMENT '机电施工图提交日期:相关说明',
  `jd_jdjgttj_time` datetime DEFAULT NULL COMMENT '机电竣工图提交时间',
  `jd_jdjgttj_time_desc` varchar(200) DEFAULT NULL COMMENT '机电竣工图提交时间:相关说明',
  `jd_rlzy_jdzfzr` tinyint(4) DEFAULT NULL COMMENT '人力资源:机电总负责人',
  `jd_rlzy_jdzfzr_choose` tinyint(4) DEFAULT NULL COMMENT '人力资源:机电总负责人 工作比例',
  `jd_rlzy_jdzfzr_desc` varchar(200) DEFAULT NULL COMMENT '人力资源:机电总负责人  相关说明',
  `jd_rlzy_ktxfjpssj1` tinyint(4) DEFAULT NULL COMMENT '人力资源:空调消防给排水设计1',
  `jd_rlzy_ktxfjpssj1_choose` tinyint(4) DEFAULT NULL COMMENT '人力资源:空调消防给排水设计1 工作比例',
  `jd_rlzy_ktxfjpssj1_desc` varchar(200) DEFAULT NULL COMMENT '人力资源:空调消防给排水设计1  相关说明',
  `jd_rlzy_ktxfjpssj2` tinyint(4) DEFAULT NULL COMMENT '人力资源:空调消防给排水设计2',
  `jd_rlzy_ktxfjpssj2_choose` tinyint(4) DEFAULT NULL COMMENT '人力资源:空调消防给排水设计2 工作比例',
  `jd_rlzy_ktxfjpssj2_desc` varchar(200) DEFAULT NULL COMMENT '人力资源:空调消防给排水设计2  相关说明',
  `jd_rlzy_ktxfjpssj3` tinyint(4) DEFAULT NULL COMMENT '人力资源:空调消防给排水设计3',
  `jd_rlzy_ktxfjpssj3_choose` tinyint(4) DEFAULT NULL COMMENT '人力资源:空调消防给排水设计3 工作比例',
  `jd_rlzy_ktxfjpssj3_desc` varchar(200) DEFAULT NULL COMMENT '人力资源:空调消防给排水设计3  相关说明',
  `jd_rlzy_dqsj1` tinyint(4) DEFAULT NULL COMMENT '人力资源:电气设计1',
  `jd_rlzy_dqsj1_choose` tinyint(4) DEFAULT NULL COMMENT '人力资源:电气设计1 工作比例',
  `jd_rlzy_dqsj1_desc` varchar(200) DEFAULT NULL COMMENT '人力资源:电气设计1  相关说明',
  `jd_rlzy_dqsj2` tinyint(4) DEFAULT NULL COMMENT '人力资源:电气设计2',
  `jd_rlzy_dqsj2_choose` tinyint(4) DEFAULT NULL COMMENT '人力资源:电气设计2 工作比例',
  `jd_rlzy_dqsj2_desc` varchar(200) DEFAULT NULL COMMENT '人力资源:电气设计2  相关说明',
  `jd_rlzy_dqsj3` tinyint(4) DEFAULT NULL COMMENT '人力资源:电气设计3',
  `jd_rlzy_dqsj3_choose` tinyint(4) DEFAULT NULL COMMENT '人力资源:电气设计3 工作比例',
  `jd_rlzy_dqsj3_desc` varchar(200) DEFAULT NULL COMMENT '人力资源:电气设计3  相关说明',
  `jd_rlzy_jdgz1` tinyint(4) DEFAULT NULL COMMENT '人力资源:机电工长1',
  `jd_rlzy_jdgz1_choose` tinyint(4) DEFAULT NULL COMMENT '人力资源:机电工长1 工作比例',
  `jd_rlzy_jdgz1_desc` varchar(200) DEFAULT NULL COMMENT '人力资源:机电工长1  相关说明',
  `jd_rlzy_jdgz2` tinyint(4) DEFAULT NULL COMMENT '人力资源:机电工长2',
  `jd_rlzy_jdgz2_choose` tinyint(4) DEFAULT NULL COMMENT '人力资源:机电工长2 工作比例',
  `jd_rlzy_jdgz2_desc` varchar(200) DEFAULT NULL COMMENT '人力资源:机电工长2  相关说明',
  `jd_rlzy_jdgz3` tinyint(4) DEFAULT NULL COMMENT '人力资源:机电工长3',
  `jd_rlzy_jdgz3_choose` tinyint(4) DEFAULT NULL COMMENT '人力资源:机电工长3 工作比例',
  `jd_rlzy_jdgz3_desc` varchar(200) DEFAULT NULL COMMENT '人力资源:机电工长3  相关说明',
  `jd_tjsj_date_detail` longtext COMMENT '提交时间相关日期-JSON格式:  包括5项：\n		1.投标方案提交时间,\n		2.大厦报审图首次提交时间,\n		3.施工图提交时间,\n		4.竣工图提交时间,\n		5.竣工资料提交时间',
  `jd_jdgl_detail` longtext COMMENT '机电管理部人员明细-JSON格式:  包括6项：\n		1.设计总负责人,\n		2.空调消防给排水负责人列表, 格式:数组, 数组每项包括: 负责人序号,负责人占比(占比总和为100%),\n		3.电气负责人列表, 格式:数组, 数组每项包括: 负责人序号,负责人占比(占比总和为100%)\n		4.给排水工长列表, 格式:数组, 数组每项包括: 空调消防给排水工长,空调消防给排水工长占比\n		5.电气工长列表, 格式:数组, 数组每项包括: 电气工长,电气工长占比',
  `jd_kt_xf_jps_rate` double DEFAULT '0.5' COMMENT '空调消防给排水占机电工程设计量比例',
  `jd_dq_rate` double DEFAULT '0' COMMENT '电气机电占机电工程设计量比例',
  `sj_sjfatj_time` datetime DEFAULT NULL COMMENT '设计方案提交日期',
  `sj_sjfatj_time_desc` varchar(200) DEFAULT NULL COMMENT '设计方案提交日期相关说明',
  `sj_sjbpttj_time` datetime DEFAULT NULL COMMENT '设计报批图提交日期',
  `sj_sjbpttj_time_desc` varchar(200) DEFAULT NULL COMMENT '设计报批图提交日期:相关说明',
  `sj_zxsgt_time` datetime DEFAULT NULL COMMENT '装修施工图提交日期:计划日期',
  `sj_zxsgt_time_desc` varchar(200) DEFAULT NULL COMMENT '装修施工图提交日期:相关说明',
  `sj_zxjgt_time` datetime DEFAULT NULL COMMENT '装修竣工图提交时间:计划日期',
  `sj_zxjgt_time_desc` varchar(200) DEFAULT NULL COMMENT '装修竣工图提交时间:相关说明',
  `sj_rlzy_gjsjs1` tinyint(4) DEFAULT NULL COMMENT '人力资源:高级设计师1',
  `sj_rlzy_gjsjs1_choose` tinyint(4) DEFAULT NULL COMMENT '人力资源:高级设计师1 工作比例',
  `sj_rlzy_gjsjs1_desc` varchar(200) DEFAULT NULL COMMENT '人力资源:高级设计师1  相关说明',
  `sj_rlzy_gjsjs2` tinyint(4) DEFAULT NULL COMMENT '人力资源:高级设计师2',
  `sj_rlzy_gjsjs2_choose` tinyint(4) DEFAULT NULL COMMENT '人力资源:高级设计师2 工作比例',
  `sj_rlzy_gjsjs2_desc` varchar(200) DEFAULT NULL COMMENT '人力资源:高级设计师2  相关说明',
  `sj_rlzy_xgsjs1` tinyint(4) DEFAULT NULL COMMENT '人力资源:效果图设计师1',
  `sj_rlzy_xgsjs1_choose` tinyint(4) DEFAULT NULL COMMENT '人力资源:效果图设计师1 工作比例',
  `sj_rlzy_xgsjs1_desc` varchar(200) DEFAULT NULL COMMENT '人力资源:效果图设计师1  相关说明',
  `sj_rlzy_xgsjs2` tinyint(4) DEFAULT NULL COMMENT '人力资源:效果图设计师2',
  `sj_rlzy_xgsjs2_choose` tinyint(4) DEFAULT NULL COMMENT '人力资源:效果图设计师2 工作比例',
  `sj_rlzy_xgsjs2_desc` varchar(200) DEFAULT NULL COMMENT '人力资源:效果图设计师2  相关说明',
  `sj_rlzy_sgtfzr1` tinyint(4) DEFAULT NULL COMMENT '人力资源:施工图负责人1',
  `sj_rlzy_sgtfzr1_choose` tinyint(4) DEFAULT NULL COMMENT '人力资源:施工图负责人1 工作比例',
  `sj_rlzy_sgtfzr1_desc` varchar(200) DEFAULT NULL COMMENT '人力资源:施工图负责人1  相关说明',
  `sj_rlzy_sgtfzr2` tinyint(4) DEFAULT NULL COMMENT '人力资源:施工图负责人2',
  `sj_rlzy_sgtfzr2_choose` tinyint(4) DEFAULT NULL COMMENT '人力资源:施工图负责人2 工作比例',
  `sj_rlzy_sgtfzr2_desc` varchar(200) DEFAULT NULL COMMENT '人力资源:施工图负责人2  相关说明',
  `sj_rlzy_sgtfzr3` tinyint(4) DEFAULT NULL COMMENT '人力资源:施工图负责人3',
  `sj_rlzy_sgtfzr3_choose` tinyint(4) DEFAULT NULL COMMENT '人力资源:施工图负责人3 工作比例',
  `sj_rlzy_sgtfzr3_desc` varchar(200) DEFAULT NULL COMMENT '人力资源:施工图负责人3  相关说明',
  `sj_tjsj_date_detail` longtext COMMENT 'JSON格式: 提交时间相关日期 包括5项：\n		1.投标方案提交时间,\n		2.大厦报审图首次提交时间,\n		3.施工图提交时间,\n		4.竣工图提交时间,\n		5.竣工资料提交时间',
  `sj_sjgl_detail` longtext COMMENT '设计管理部人员明细-JSON格式:  包括6项：\n		1.设计总负责人,\n		2.效果图负责人,\n		3.施工图设计负责人负责人列表, 格式:JSON数组, 数组每项包括: 负责人序号,负责人占比(占比总和为100%),\n		4.设计方案书面效果负责人\n		5.深化图设计负责人',
  `sc_pro_name` char(50) DEFAULT NULL COMMENT '项目名称',
  `sc_pro_qx` longtext COMMENT '项目权限',
  `sc_pro_type` char(1) DEFAULT NULL COMMENT '项目类别',
  `sc_pro_trade_base` char(20) DEFAULT NULL COMMENT '项目行业:基本',
  `sc_pro_trade_ot` char(20) DEFAULT NULL COMMENT '项目行业:其他',
  `sc_cus_name` char(50) DEFAULT NULL COMMENT '客户名称',
  `sc_cus_type` char(1) DEFAULT NULL COMMENT '客户类型',
  `sc_cus_t_1` char(1) NOT NULL DEFAULT '0' COMMENT '客户类别1',
  `sc_cus_t_2` char(1) NOT NULL DEFAULT '0' COMMENT '客户类别2',
  `sc_mag_company_base` char(50) DEFAULT NULL COMMENT '管理公司:基本',
  `sc_mag_company_ot` char(50) DEFAULT NULL COMMENT '管理公司:其他',
  `sc_compety_company_base` char(50) DEFAULT NULL COMMENT '竞争对手:基本',
  `sc_compety_company_ot` char(50) DEFAULT NULL COMMENT '竞争对手:其他',
  `sc_pro_city` char(50) DEFAULT NULL COMMENT '项目城市',
  `sc_pro_address` char(100) DEFAULT NULL COMMENT '项目地点',
  `sc_invest_type` char(1) DEFAULT NULL COMMENT '投标类别',
  `sc_fb_time` datetime DEFAULT NULL COMMENT '发标日期',
  `sc_fb_time_desc` varchar(200) DEFAULT NULL COMMENT '发标日期相关说明',
  `sc_hb_time` datetime DEFAULT NULL COMMENT '回标日期',
  `sc_hb_time_desc` varchar(200) DEFAULT NULL COMMENT '回标日期相关说明',
  `sc_htqd_time` datetime DEFAULT NULL COMMENT '合同签订日期',
  `sc_htqd_time_desc` varchar(200) DEFAULT NULL COMMENT '合同签订日期相关说明',
  `sc_tbcl_fxh` char(1) NOT NULL DEFAULT '0' COMMENT '投标策略分析会',
  `sc_zb_flag` char(1) DEFAULT NULL COMMENT '中标状态',
  `sc_zb_time` datetime DEFAULT NULL COMMENT '中标日期',
  `sc_zb_time_desc` char(100) DEFAULT NULL COMMENT '中标日期相关说明',
  `sc_zb_amt` double DEFAULT NULL COMMENT '中标金额',
  `sc_zb_reason_base` char(50) DEFAULT NULL COMMENT '中标原因:基本',
  `sc_zb_reason_ot` varchar(200) DEFAULT NULL COMMENT '中标原因:其他',
  `sc_lb_reason_base` varchar(200) DEFAULT NULL COMMENT '落标原因:基本',
  `sc_lb_reason_ot` varchar(200) DEFAULT NULL COMMENT '落标原因:其他',
  `sc_ss_fgs` char(1) DEFAULT NULL COMMENT '项目实施分公司',
  `sc_sj_myd_1` char(1) DEFAULT NULL COMMENT '客户满意度:设计1',
  `sc_sj_myd_1_desc` varchar(200) DEFAULT NULL COMMENT '客户满意度:设计1 相关说明',
  `sc_sj_myd_2` char(1) DEFAULT NULL COMMENT '客户满意度:设计2',
  `sc_sj_myd_2_desc` varchar(200) DEFAULT NULL COMMENT '客户满意度:设计2 相关说明',
  `sc_sg_myd_1` char(1) DEFAULT NULL COMMENT '客户满意度:施工1',
  `sc_sg_myd_1_desc` varchar(200) DEFAULT NULL COMMENT '客户满意度:施工1 相关说明',
  `sc_sg_myd_2` char(1) DEFAULT NULL COMMENT '客户满意度:施工2',
  `sc_sg_myd_2_desc` varchar(200) DEFAULT NULL COMMENT '客户满意度:施工2 相关说明',
  `sc_rlzy_scjl` tinyint(4) DEFAULT NULL COMMENT '人力资源:市场经理',
  `sc_rlzy_scjl_desc` varchar(200) DEFAULT NULL COMMENT '人力资源:市场经理 相关说明',
  `sc_rlzy_sczl` tinyint(4) DEFAULT NULL COMMENT '人力资源:市场助理',
  `sc_rlzy_sczl_desc` varchar(200) DEFAULT NULL COMMENT '人力资源:市场助理  相关说明',
  `sc_myd_sub_detail` longtext COMMENT '满意度详细信息-JSON格式: , 包括: \n		1.设计满意度,满意度值,满意度附加信息,\n		2.施工质量满意度,满意度值,满意度附加信息,\n		3.服务态度满意度,满意度值,满意度附加信息,\n		4.反应速度满意度,满意度值,满意度附加信息,\n		5.机电功能满意度,满意度值,满意度附加信息,\n		6.售后服务满意度,满意度值,满意度附加信息,\n		7.客户整体满意度,满意度值,满意度附加信息,',
  `sc_tbtd_detail` longtext COMMENT 'JSON格式: 市场部投标团队人员明细 包括2项：\n		1.市场部项目负责人,\n		2.投标TEAM成员列表, 格式:数组, 数组每项包括: 人员名称 ',
  `ys_cw_bh` char(20) DEFAULT NULL COMMENT '项目财务编号',
  `ys_hetong_amt` double DEFAULT NULL COMMENT '合同金额',
  `ys_xm_mj` double DEFAULT NULL COMMENT '项目面积',
  `ys_xm_jmj` double DEFAULT NULL COMMENT '项目净面积',
  `ys_tb_mll` double DEFAULT NULL COMMENT '投标毛利率',
  `ys_kg_mll` double DEFAULT NULL COMMENT '开工毛利率',
  `ys_cg_nk_amt` double DEFAULT NULL COMMENT '采购内控金额',
  `ys_xc_nk_amt` double DEFAULT NULL COMMENT '现场内控金额',
  `ys_cg_nkt_tj_time` datetime DEFAULT NULL COMMENT '采购内控单提交时间',
  `ys_cg_nkt_tj_time_desc` varchar(200) DEFAULT NULL COMMENT '采购内控单提交时间:相关说明',
  `ys_xc_nkt_tj_time` datetime DEFAULT NULL COMMENT '现场内控单提交时间',
  `ys_xc_nkt_tj_time_desc` varchar(200) DEFAULT NULL COMMENT '现场内控单提交时间:相关说明',
  `ys_jswc_time` datetime DEFAULT NULL COMMENT '项目结算完成时间',
  `ys_jswc_time_desc` varchar(200) DEFAULT NULL COMMENT '项目结算完成时间:相关说明',
  `ys_qt_zjcb_amt` double DEFAULT NULL COMMENT '其他项目未能及时计入的项目直接成本',
  `ys_zx_sub_detail` longtext COMMENT 'JSON格式: 装修相关信息 包括: \n		1.装修工程合同报价,\n		2.装修工程合同内控,\n		3.装修工程合同预期毛利率(公式生成),\n		4.装修分包合同价格,\n		5.装修分包合同类型,\n		6.装修分包,\n		7.装修分包选定日期,\n		8.装修分包评定,\n		9.装修工程客户总VO,(项目预算控制子表自动生成),\n		10.装修工程分包总VO,(项目预算控制子表自动生成),\n		11.装修工程实际毛利率,(公式生成),\n		12.装修工程客户VO明细, 格式:数组, 每一项包括：\n			1)VO编号\n			2)装修工程客户VO明细\n			3)装修工程客户VO明细原因,',
  `ys_dq_sub_detail` longtext COMMENT 'JSON格式: 电气相关信息 结构和 zx_sub_detail 字段一致,',
  `ys_kt_sub_detail` longtext COMMENT 'JSON格式: 空调相关信息 结构和 zx_sub_detail 字段一致,',
  `ys_xf_sub_detail` longtext COMMENT 'JSON格式: 消防相关信息 结构和 zx_sub_detail 字段一致,',
  `ys_jps_sub_detail` longtext COMMENT 'JSON格式: 给排水相关信息 结构和 zx_sub_detail 字段一致,',
  `ys_it_sub_detail` longtext COMMENT 'JSON格式: IT相关信息 结构和 zx_sub_detail 字段一致,',
  `ys_af_sub_detail` longtext COMMENT 'JSON格式: 安防相关信息 结构和 zx_sub_detail 字段一致,',
  `ys_av_sub_detail` longtext COMMENT 'JSON格式: AV相关信息 结构和 zx_sub_detail 字段一致,',
  `ys_rlzy_ysy1` tinyint(4) DEFAULT NULL COMMENT '人力资源:预算员1',
  `ys_rlzy_ysy1_choose` tinyint(4) DEFAULT NULL COMMENT '人力资源:预算员1 工作比例',
  `ys_rlzy_ysy1_desc` varchar(200) DEFAULT NULL COMMENT '人力资源:预算员1  相关说明',
  `ys_rlzy_ysy2` tinyint(4) DEFAULT NULL COMMENT '人力资源:预算员2',
  `ys_rlzy_ysy2_choose` tinyint(4) DEFAULT NULL COMMENT '人力资源:预算员2 工作比例',
  `ys_rlzy_ysy2_desc` varchar(200) DEFAULT NULL COMMENT '人力资源:预算员2  相关说明',
  `ys_rlzy_ysy3` tinyint(4) DEFAULT NULL COMMENT '人力资源:预算员3',
  `ys_rlzy_ysy3_choose` tinyint(4) DEFAULT NULL COMMENT '人力资源:预算员3 工作比例',
  `ys_rlzy_ysy3_desc` varchar(200) DEFAULT NULL COMMENT '人力资源:预算员3  相关说明',
  `ys_ysgl_detail` longtext COMMENT 'JSON格式: 预算管理部人员明细 包括6项：\n		1.预算总负责人,\n		2.预算负责人列表, 格式:JSON数组, 数组每项包括: 负责人序号,负责人占比(占比总和为100%),',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '标识 1：新建 2:正常已经审核过 3.已经删除',
  `ht_xmcwbh` char(50) DEFAULT NULL COMMENT '项目财务编号',
  `ys_zx_dwbj` double DEFAULT NULL COMMENT '装修:对外报价',
  `ys_dq_dwbj` double DEFAULT NULL COMMENT '电气:对外报价',
  `ys_kt_dwbj` double DEFAULT NULL COMMENT '空调:对外报价',
  `ys_xf_dwbj` double DEFAULT NULL COMMENT '消防:对外报价',
  `ys_jps_dwbj` double DEFAULT NULL COMMENT '给排水:对外报价',
  `ys_it_dwbj` double DEFAULT NULL COMMENT 'IT:对外报价',
  `ys_sec_dwbj` double DEFAULT NULL COMMENT 'SEC:对外报价',
  `ys_av_dwbj` double DEFAULT NULL COMMENT 'AV:对外报价',
  `ys_zx_nkje` double DEFAULT NULL COMMENT '装修:内控金额',
  `ys_dq_nkje` double DEFAULT NULL COMMENT '电气:内控金额',
  `ys_kt_nkje` double DEFAULT NULL COMMENT '空调:内控金额',
  `ys_xf_nkje` double DEFAULT NULL COMMENT '消防:内控金额',
  `ys_jps_nkje` double DEFAULT NULL COMMENT '给排水:内控金额',
  `ys_it_nkje` double DEFAULT NULL COMMENT 'IT:内控金额',
  `ys_sec_nkje` double DEFAULT NULL COMMENT 'SEC:内控金额',
  `ys_av_nkje` double DEFAULT NULL COMMENT 'AV:内控金额',
  `ys_zx_sjcb` double DEFAULT NULL COMMENT '装修:实际成本',
  `ys_dq_sjcb` double DEFAULT NULL COMMENT '电气:实际成本',
  `ys_kt_sjcb` double DEFAULT NULL COMMENT '空调:实际成本',
  `ys_xf_sjcb` double DEFAULT NULL COMMENT '消防:实际成本',
  `ys_jps_sjcb` double DEFAULT NULL COMMENT '给排水:实际成本',
  `ys_it_sjcb` double DEFAULT NULL COMMENT 'IT:实际成本',
  `ys_sec_sjcb` double DEFAULT NULL COMMENT 'SEC:实际成本',
  `ys_av_sjcb` double DEFAULT NULL COMMENT 'AV:实际成本',
  `ys_zx_sm` varchar(200) DEFAULT NULL COMMENT '装修:相关说明',
  `ys_dq_sm` varchar(200) DEFAULT NULL COMMENT '电气:相关说明',
  `ys_kt_sm` varchar(200) DEFAULT NULL COMMENT '空调:相关说明',
  `ys_xf_sm` varchar(200) DEFAULT NULL COMMENT '消防:相关说明',
  `ys_jps_sm` varchar(200) DEFAULT NULL COMMENT '给排水:相关说明',
  `ys_it_sm` varchar(200) DEFAULT NULL COMMENT 'IT:相关说明',
  `ys_sec_sm` varchar(200) DEFAULT NULL COMMENT 'SEC:相关说明',
  `ys_av_sm` varchar(200) DEFAULT NULL COMMENT 'AV:相关说明',
  `ys_cg_all_dwbj` double DEFAULT NULL COMMENT '采购:对外报价',
  `ys_cg_all_nkje` double DEFAULT NULL COMMENT '采购:内控金额',
  `cg_gckc_sjcb` double DEFAULT NULL COMMENT '工厂库存及零星材料采购:实际成本',
  `cg_gcrgf_sjcb` double DEFAULT NULL COMMENT '工厂人工费总金额:实际成本',
  `cg_gckc_sjcb_vo` double DEFAULT NULL COMMENT '工厂库存及零星材料采购:实际成本变化',
  `cg_gcrgf_sjcb_vo` double DEFAULT NULL COMMENT '工厂人工费总金额:实际成本变化',
  `cg_zxclcg_sm` varchar(200) DEFAULT NULL COMMENT '装修材料采购:  相关说明',
  `cg_jdsbcg_sm` varchar(200) DEFAULT NULL COMMENT '机电设备采购:  相关说明',
  `cg_gckc_sm` varchar(200) DEFAULT NULL COMMENT '工厂库存及零星材料采购总金额:  相关说明',
  `cg_gcrgf_sm` varchar(200) DEFAULT NULL COMMENT '工厂人工费:  相关说明',
  `ys_qq_dwbj` double DEFAULT NULL COMMENT '前期:对外报价',
  `ys_qq_customer_vo` double DEFAULT NULL COMMENT '前期:客户VO',
  `ys_qq_nkje` double DEFAULT NULL COMMENT '前期:内控金额',
  `ys_qq_sm` varchar(200) DEFAULT NULL COMMENT '前期:说明',
  `ys_rg_dwbj` double DEFAULT NULL COMMENT '直接人工成本:对外报价',
  `ys_rg_nkje` double DEFAULT NULL COMMENT '直接人工成本:内控金额',
  `ys_rg_sm` varchar(200) DEFAULT NULL COMMENT '直接人工成本:相关说明',
  `ys_qt_sm` varchar(200) DEFAULT NULL COMMENT '其他:相关说明',
  `sc_mag_company` char(50) DEFAULT NULL COMMENT '管理公司',
  `sc_pro_trade` char(20) DEFAULT NULL COMMENT '项目行业',
  `sc_compety_company` char(50) DEFAULT NULL COMMENT '竞争对手',
  `ys_rg_sjcb` double DEFAULT NULL COMMENT '人工:实际成本',
  `ys_qt_dwbj` double DEFAULT NULL COMMENT '其他:对外报价',
  `ys_qt_customer_vo` double DEFAULT NULL COMMENT '其他:客户VO',
  `ys_qt_nkje` double DEFAULT NULL COMMENT '其他:内控金额',
  `ys_qt_sjcb` double DEFAULT NULL COMMENT '其他:实际成本',
  `ys_qt_vo` double DEFAULT NULL COMMENT '其他:实际VO',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='项目总表';

/*Data for the table `jb_project` */

insert  into `jb_project`(`id`,`pro_id`,`sh_yjtime`,`sh_zbjtime`,`sh_zb_sub_detail`,`sh_sh_myd_1`,`sh_sh_myd_1_desc`,`sh_sh_myd_2`,`sh_sh_myd_2_desc`,`sh_myd_all`,`sh_myd_sub_detail`,`hr_follow_man`,`cg_clbp_wc_time`,`cg_clbp_wc_time_desc`,`cg_buy_gckc_all_amt`,`cg_buy_gcrgf_all_amt`,`cg_buy_zscl_sub_detail`,`cg_buy_jdsb_sub_detail`,`cg_cljg_mon_pay_rate`,`cg_cljg_next_mon_pay_rate`,`cg_clzb_pay_rate`,`cg_rlzy_cgr1`,`cg_rlzy_cgr1_choose`,`cg_rlzy_cgr1_desc`,`cg_rlzy_cgr2`,`cg_rlzy_cgr2_choose`,`cg_rlzy_cgr2_desc`,`gc_htqd_time`,`gc_customer_fkzq`,`gc_pay_sh_pzsc`,`gc_hetong_first_pay_rate`,`gc_jhkg_time`,`gc_jhjg_time`,`gc_dsbptj_jh_time`,`gc_dsbptj_sj_time`,`gc_dsbptj_time_desc`,`gc_dsbppz_time`,`gc_dsbppz_time_desc`,`gc_xfbptj_jh_time`,`gc_xfbptj_sj_time`,`gc_xfbptj_time_desc`,`gc_xfbppz_time`,`gc_xfbppz_time_desc`,`gc_kg_jh_time`,`gc_kg_sj_time`,`gc_kg_time_desc`,`gc_sl_time`,`gc_sl_time_desc`,`gc_xfystj_jh_time`,`gc_xfystj_sj_time`,`gc_xfystj_time_desc`,`gc_xfyspz_time`,`gc_xfyspz_time_desc`,`gc_gqyj_jh_time`,`gc_gqyj_sj_time`,`gc_gqyj_time_desc`,`gc_jfyj_jh_time`,`gc_jfyj_sj_time`,`gc_jfyj_time_desc`,`gc_thyj_jh_time`,`gc_thyj_sj_time`,`gc_thyj_time_desc`,`gc_xmwg_khys_jh_time`,`gc_xmwg_khys_sj_time`,`gc_xmwg_khys_time_desc`,`gc_xmyj_yyzbqjs_time`,`gc_xmyj_yyzbqjs_time_desc`,`gc_jgzltj_time`,`gc_jgzltj_time_desc`,`gc_khbj_jh_time`,`gc_khbj_sj_time`,`gc_khbj_time_desc`,`gc_yjsh_jh_time`,`gc_yjsh_sj_time`,`gc_yjsh_time_desc`,`gc_zbqm_time`,`gc_zbqm_time_desc`,`gc_gcxg_date_detail`,`gc_jgxg_detail`,`gc_rlzy_xmzj`,`gc_rlzy_xmzj_choose`,`gc_rlzy_xmzj_desc`,`gc_rlzy_xmxc1`,`gc_rlzy_xmxc1_choose`,`gc_rlzy_xmxc1_desc`,`gc_rlzy_xmxc2`,`gc_rlzy_xmxc2_choose`,`gc_rlzy_xmxc2_desc`,`gc_rlzy_zxgz1`,`gc_rlzy_zxgz1_choose`,`gc_rlzy_zxgz1_desc`,`gc_rlzy_zxgz2`,`gc_rlzy_zxgz2_choose`,`gc_rlzy_zxgz2_desc`,`gc_rlzy_zxgz3`,`gc_rlzy_zxgz3_choose`,`gc_rlzy_zxgz3_desc`,`gc_rlzy_aqy1`,`gc_rlzy_aqy1_choose`,`gc_rlzy_aqy1_desc`,`gc_rlzy_aqy2`,`gc_rlzy_aqy2_choose`,`gc_rlzy_aqy2_desc`,`gc_rlzy_aqy3`,`gc_rlzy_aqy3_choose`,`gc_rlzy_aqy3_desc`,`gc_rlzy_kfbj1`,`gc_rlzy_kfbj1_choose`,`gc_rlzy_kfbj1_desc`,`gc_rlzy_kfbj2`,`gc_rlzy_kfbj2_choose`,`gc_rlzy_kfbj2_desc`,`gc_rlzy_gczl`,`gc_rlzy_gczl_choose`,`gc_rlzy_gczl_desc`,`gc_xmry_detail`,`gc_fee_detail`,`jd_jdfatj_time`,`jd_jdfatj_time_desc`,`jd_jdbpttj_time`,`jd_jdbpttj_time_desc`,`jd_jdsgttj_time`,`jd_jdsgttj_time_desc`,`jd_jdjgttj_time`,`jd_jdjgttj_time_desc`,`jd_rlzy_jdzfzr`,`jd_rlzy_jdzfzr_choose`,`jd_rlzy_jdzfzr_desc`,`jd_rlzy_ktxfjpssj1`,`jd_rlzy_ktxfjpssj1_choose`,`jd_rlzy_ktxfjpssj1_desc`,`jd_rlzy_ktxfjpssj2`,`jd_rlzy_ktxfjpssj2_choose`,`jd_rlzy_ktxfjpssj2_desc`,`jd_rlzy_ktxfjpssj3`,`jd_rlzy_ktxfjpssj3_choose`,`jd_rlzy_ktxfjpssj3_desc`,`jd_rlzy_dqsj1`,`jd_rlzy_dqsj1_choose`,`jd_rlzy_dqsj1_desc`,`jd_rlzy_dqsj2`,`jd_rlzy_dqsj2_choose`,`jd_rlzy_dqsj2_desc`,`jd_rlzy_dqsj3`,`jd_rlzy_dqsj3_choose`,`jd_rlzy_dqsj3_desc`,`jd_rlzy_jdgz1`,`jd_rlzy_jdgz1_choose`,`jd_rlzy_jdgz1_desc`,`jd_rlzy_jdgz2`,`jd_rlzy_jdgz2_choose`,`jd_rlzy_jdgz2_desc`,`jd_rlzy_jdgz3`,`jd_rlzy_jdgz3_choose`,`jd_rlzy_jdgz3_desc`,`jd_tjsj_date_detail`,`jd_jdgl_detail`,`jd_kt_xf_jps_rate`,`jd_dq_rate`,`sj_sjfatj_time`,`sj_sjfatj_time_desc`,`sj_sjbpttj_time`,`sj_sjbpttj_time_desc`,`sj_zxsgt_time`,`sj_zxsgt_time_desc`,`sj_zxjgt_time`,`sj_zxjgt_time_desc`,`sj_rlzy_gjsjs1`,`sj_rlzy_gjsjs1_choose`,`sj_rlzy_gjsjs1_desc`,`sj_rlzy_gjsjs2`,`sj_rlzy_gjsjs2_choose`,`sj_rlzy_gjsjs2_desc`,`sj_rlzy_xgsjs1`,`sj_rlzy_xgsjs1_choose`,`sj_rlzy_xgsjs1_desc`,`sj_rlzy_xgsjs2`,`sj_rlzy_xgsjs2_choose`,`sj_rlzy_xgsjs2_desc`,`sj_rlzy_sgtfzr1`,`sj_rlzy_sgtfzr1_choose`,`sj_rlzy_sgtfzr1_desc`,`sj_rlzy_sgtfzr2`,`sj_rlzy_sgtfzr2_choose`,`sj_rlzy_sgtfzr2_desc`,`sj_rlzy_sgtfzr3`,`sj_rlzy_sgtfzr3_choose`,`sj_rlzy_sgtfzr3_desc`,`sj_tjsj_date_detail`,`sj_sjgl_detail`,`sc_pro_name`,`sc_pro_qx`,`sc_pro_type`,`sc_pro_trade_base`,`sc_pro_trade_ot`,`sc_cus_name`,`sc_cus_type`,`sc_cus_t_1`,`sc_cus_t_2`,`sc_mag_company_base`,`sc_mag_company_ot`,`sc_compety_company_base`,`sc_compety_company_ot`,`sc_pro_city`,`sc_pro_address`,`sc_invest_type`,`sc_fb_time`,`sc_fb_time_desc`,`sc_hb_time`,`sc_hb_time_desc`,`sc_htqd_time`,`sc_htqd_time_desc`,`sc_tbcl_fxh`,`sc_zb_flag`,`sc_zb_time`,`sc_zb_time_desc`,`sc_zb_amt`,`sc_zb_reason_base`,`sc_zb_reason_ot`,`sc_lb_reason_base`,`sc_lb_reason_ot`,`sc_ss_fgs`,`sc_sj_myd_1`,`sc_sj_myd_1_desc`,`sc_sj_myd_2`,`sc_sj_myd_2_desc`,`sc_sg_myd_1`,`sc_sg_myd_1_desc`,`sc_sg_myd_2`,`sc_sg_myd_2_desc`,`sc_rlzy_scjl`,`sc_rlzy_scjl_desc`,`sc_rlzy_sczl`,`sc_rlzy_sczl_desc`,`sc_myd_sub_detail`,`sc_tbtd_detail`,`ys_cw_bh`,`ys_hetong_amt`,`ys_xm_mj`,`ys_xm_jmj`,`ys_tb_mll`,`ys_kg_mll`,`ys_cg_nk_amt`,`ys_xc_nk_amt`,`ys_cg_nkt_tj_time`,`ys_cg_nkt_tj_time_desc`,`ys_xc_nkt_tj_time`,`ys_xc_nkt_tj_time_desc`,`ys_jswc_time`,`ys_jswc_time_desc`,`ys_qt_zjcb_amt`,`ys_zx_sub_detail`,`ys_dq_sub_detail`,`ys_kt_sub_detail`,`ys_xf_sub_detail`,`ys_jps_sub_detail`,`ys_it_sub_detail`,`ys_af_sub_detail`,`ys_av_sub_detail`,`ys_rlzy_ysy1`,`ys_rlzy_ysy1_choose`,`ys_rlzy_ysy1_desc`,`ys_rlzy_ysy2`,`ys_rlzy_ysy2_choose`,`ys_rlzy_ysy2_desc`,`ys_rlzy_ysy3`,`ys_rlzy_ysy3_choose`,`ys_rlzy_ysy3_desc`,`ys_ysgl_detail`,`status`,`ht_xmcwbh`,`ys_zx_dwbj`,`ys_dq_dwbj`,`ys_kt_dwbj`,`ys_xf_dwbj`,`ys_jps_dwbj`,`ys_it_dwbj`,`ys_sec_dwbj`,`ys_av_dwbj`,`ys_zx_nkje`,`ys_dq_nkje`,`ys_kt_nkje`,`ys_xf_nkje`,`ys_jps_nkje`,`ys_it_nkje`,`ys_sec_nkje`,`ys_av_nkje`,`ys_zx_sjcb`,`ys_dq_sjcb`,`ys_kt_sjcb`,`ys_xf_sjcb`,`ys_jps_sjcb`,`ys_it_sjcb`,`ys_sec_sjcb`,`ys_av_sjcb`,`ys_zx_sm`,`ys_dq_sm`,`ys_kt_sm`,`ys_xf_sm`,`ys_jps_sm`,`ys_it_sm`,`ys_sec_sm`,`ys_av_sm`,`ys_cg_all_dwbj`,`ys_cg_all_nkje`,`cg_gckc_sjcb`,`cg_gcrgf_sjcb`,`cg_gckc_sjcb_vo`,`cg_gcrgf_sjcb_vo`,`cg_zxclcg_sm`,`cg_jdsbcg_sm`,`cg_gckc_sm`,`cg_gcrgf_sm`,`ys_qq_dwbj`,`ys_qq_customer_vo`,`ys_qq_nkje`,`ys_qq_sm`,`ys_rg_dwbj`,`ys_rg_nkje`,`ys_rg_sm`,`ys_qt_sm`,`sc_mag_company`,`sc_pro_trade`,`sc_compety_company`,`ys_rg_sjcb`,`ys_qt_dwbj`,`ys_qt_customer_vo`,`ys_qt_nkje`,`ys_qt_sjcb`,`ys_qt_vo`) values (3,'pro_1',NULL,NULL,NULL,NULL,'在我看来，很多国内创投就像上面故事里的哥萨克人，他们其实不知道怎么把事情做好，只是下命令，让创业者自',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.25,0.3,0.05,70,10,'1',71,90,'2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-17 00:00:00','2014-07-31 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-17 00:00:00','2014-06-10 00:00:00',NULL,'2014-06-29 00:00:00','0000-00-00 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-26 00:00:00',NULL,NULL,NULL,49,NULL,'gc bu',NULL,NULL,NULL,NULL,NULL,NULL,51,40,'',52,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'北京项目',NULL,'0',NULL,NULL,NULL,NULL,'0','0',NULL,NULL,'','qcg','北京市,市辖区,石景山区',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,'0','B',NULL,NULL,NULL,'[\"A\",\"C\",\"F\"]','FT社评：要遏制朝鲜核计划，中国加大压力是不可缺少的一环。中国国家主席习近平未访朝鲜先访韩国，令人对朝鲜半岛局势好转产生期盼。但若把此行放在东亚地缘政治紧张加剧的大背景下看，有些迹象却令人担忧asfasdfasdfdfasfasdfsadfasdfasdfasdfasdsdasfadfasdfasasdfasdfasdfas\nadfasdfasdfasdfasdf\nasdfasdfasdf\nasd','[\"B\",\"C\"]','asdfasfasdfas\nasdflasjfa\n\nda\nf\nasdf\n\nasf\na','E','C','这是我去年写的一篇文章，昨天赛前修改了一下：\n\n2014 世界杯我这个伪球迷为什么支持智利队\n\n这其中的原因要从跟我一个办公室的智利同（da）学（shu）说起。他曾经在智利总统顾问团里工作，他申请的推荐信是智利教育部长写的。每次想到这里就觉得当初肯定是哪个教授手一抖才录的我…\n\n这位智利大叔真是个人物，他最喜欢的东西是足球，最讨厌的东西是限速牌，做学术报告不用激光笔而用路边捡的一米多长带刺的树枝，','',NULL,NULL,'这是我去年写的一篇文章，昨天赛前修改了一下：\n\n2014 世界杯我这个伪球迷为什么支持智利队\n\n这其中的原因要从跟我一个办公室的智利同（da）学（shu）说起。他曾经在智利总统顾问团里工作，他申请的推荐信是智利教育部长写的。每次想到这里就觉得当初肯定是哪个教授手一抖才录的我…\n\n这位智利大叔真是个人物，他最喜欢的东西是足球，最讨厌的东西是限速牌，做学术报告不用激光笔而用路边捡的一米多长带刺的树枝，','C',NULL,30,'检索或设置对象的高度。\n对于img对象来说，仅指定此属性，其width值将根据图片源尺寸等比例缩放。\n对应的脚本特性为height。其值为一字符串，所以不可用于脚本(Scripts)中的计算。请使用style对象的posHeight，pixelHeight，以及对象的offsetHeight等特性。请参阅我编写的其他书目。\n按照样式表的规则，对象的实际高度为其下列属性值之和：\nmargin-top',NULL,'这是我去年写的一篇文章，昨天赛前修改了一下：\n\n2014 世界杯我这个伪球迷为什么支持智利队\n\n这其中的原因要从跟我一个办公室的智利同（da）学（shu）说起。他曾经在智利总统顾问团里工作，他申请的推荐信是智利教育部长写的。每次想到这里就觉得当初肯定是哪个教授手一抖才录的我…\n\n这位智利大叔真是个人物，他最喜欢的东西是足球，最讨厌的东西是限速牌，做学术报告不用激光笔而用路边捡的一米多长带刺的树枝，',NULL,NULL,NULL,2000,10000,NULL,15,NULL,NULL,NULL,'2014-06-18 00:00:00',NULL,NULL,NULL,'2014-06-26 00:00:00','没有值jkjk\njkjkk\nj\n\njk\n\n\n\n\n\n\n\nsd\ndf\nsds',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,31,10,NULL,31,20,NULL,38,70,NULL,NULL,2,'xmcwbh',10,2,4,4,5,6.2,7,27,1,0.9,3,4,3,6,6,8,5,2,3,2,5,6,7,8,'1','2','3','4','5','6','7','8',1,0.5,2,3,2,4,'1','2','3','4',4,1,1.5,'qq',10,5,'rg','qt','CUSHMAN','物流',NULL,9,10,2,4,5,4),(4,'pro_2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.25,0.3,0.05,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,74,NULL,'sddssddssdsd',49,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'天津项目',NULL,NULL,NULL,NULL,NULL,NULL,'0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-11 00:00:00','没有值','2014-06-12 00:00:00','没有值',NULL,NULL,'0','B',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'pro_3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.25,0.3,0.05,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'南京项目',NULL,NULL,NULL,NULL,NULL,NULL,'0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'pro_4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.25,0.3,0.05,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'南京项目',NULL,NULL,NULL,NULL,NULL,NULL,'0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `jb_user` */

DROP TABLE IF EXISTS `jb_user`;

CREATE TABLE `jb_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` char(30) NOT NULL COMMENT '用户姓名',
  `email` char(30) NOT NULL COMMENT '电子邮件,作为用户登录名',
  `password` char(100) NOT NULL COMMENT '登录密码',
  `department` char(2) DEFAULT NULL COMMENT '部门',
  `userflag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '用户标识 1:普通用户 2.用户管理员',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '用户标识 1：新建自注册用户 2:正常已经审核过的用户 3.已经删除用户',
  `salary` double DEFAULT NULL COMMENT '工资',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='用户表';

/*Data for the table `jb_user` */

insert  into `jb_user`(`id`,`user_name`,`email`,`password`,`department`,`userflag`,`status`,`salary`) values (30,'admin','admin@jinbi.com','111111','sc',2,2,NULL),(31,'ys','ys@jinbi.com','111111','ys',1,2,NULL),(32,'gc','gc@jinbi.com','111111','gc',1,2,NULL),(33,'sj','sj@jinbi.com','111111','sj',1,2,NULL),(34,'jd','jd@jinbi.com','111111','jd',1,2,NULL),(35,'cg','cg@jinbi.com','111111','cg',1,2,NULL),(36,'sh','sh@jinbi.com','111111','sh',1,2,NULL),(37,'sczl','sczl@jinbi.com','111111','sc',1,2,NULL),(38,'ys1','ys1@jinbi.com','111111','ys',1,2,NULL),(39,'ys2','ys2@jinbi.com','111111','ys',1,2,NULL),(40,'ys3','ys3@jinbi.com','111111','ys',1,2,NULL),(41,'gjsjs1','gjsjs1@jinbi.com','111111','sj',1,2,NULL),(42,'gjsjs2','gjsjs2@jinbi.com','111111','sj',1,2,NULL),(43,'xgtsjs1','xgtsjs1@jinbi.com','111111','sj',1,2,NULL),(44,'xgtsjs2','xgtsjs2@jinbi.com','111111','sj',1,2,NULL),(45,'sgtfzr1','sgtfzr1@jinbi.com','111111','sj',1,2,NULL),(46,'sgtfzr2','sgtfzr2@jinbi.com','111111','sj',1,2,NULL),(47,'sgtfzr3','sgtfzr3@jinbi.com','111111','sj',1,2,NULL),(48,'xmzj','xmzj@jinbi.com','111111','gc',1,2,NULL),(49,'xmjl','xmjl@jinbi.com','111111','gc',1,2,NULL),(50,'xcjl','xcjl@jinbi.com','111111','gc',1,2,NULL),(51,'zxgz1','zxgz1@jinbi.com','111111','gc',1,2,1000),(52,'zxgz2','zxgz2@jinbi.com','111111','gc',1,2,2000),(53,'zxgz3','zxgz3@jinbi.com','111111','gc',1,2,3000),(54,'aqy1','aqy1@jinbi.com','111111','gc',1,2,100),(55,'aqy2','aqy2@jinbi.com','111111','gc',1,2,NULL),(56,'aqy3','aqy3@jinbi.com','111111','gc',1,2,NULL),(57,'kf1','kf1@jinbi.com','111111','gc',1,2,NULL),(58,'kf2','kf2@jinbi.com','111111','gc',1,2,NULL),(59,'gczl','gczl@jinbi.com','111111','gc',1,2,NULL),(60,'jdfzr','jdfzr@jinbi.com','111111','jd',1,2,NULL),(61,'kt1','kt1@jinbi.com','111111','jd',1,2,NULL),(62,'kt2','kt2@jinbi.com','111111','jd',1,2,NULL),(63,'kt3','kt3@jinbi.com','111111','jd',1,2,NULL),(64,'dq1','dq1@jinbi.com','111111','jd',1,2,NULL),(65,'dq2','dq2@jinbi.com','111111','jd',1,2,NULL),(66,'dq3','dq3@jinbi.com','111111','jd',1,2,NULL),(67,'jdgz1','jdgz1@jinbi.com','111111','jd',1,2,NULL),(68,'jdgz2','jdgz2@jinbi.com','111111','jd',1,2,NULL),(69,'jdgz3','jdgz3@jinbi.com','111111','jd',1,2,NULL),(70,'cgr1','cgr1@jinbi.com','111111','cg',1,2,NULL),(71,'cgr2','cgr2@jinbi.com','111111','cg',1,2,NULL),(72,'hr','hr@jinbi.com','111111','hr',3,2,NULL),(73,'ht','ht@jinbi.com','111111','ht',1,2,NULL),(74,'dxk','dxk@jinbi.com','111111','gc',1,2,200),(75,'gl','gl@jinbi.com','111111','gl',1,2,NULL);

/*Table structure for table `jb_zjl_fkyj` */

DROP TABLE IF EXISTS `jb_zjl_fkyj`;

CREATE TABLE `jb_zjl_fkyj` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pro_id` char(30) NOT NULL COMMENT '项目ID',
  `fk_bs` char(5) NOT NULL COMMENT '预计付款笔数',
  `fk_fb_rate_gc` double DEFAULT NULL COMMENT '预计付款占分包合同比例',
  `fk_cl_rate_cg` double DEFAULT NULL COMMENT '预计付款占材料合同比例',
  `fk_time` datetime DEFAULT NULL COMMENT '预计付款日期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='资金流管理 付款预计表';

/*Data for the table `jb_zjl_fkyj` */

insert  into `jb_zjl_fkyj`(`id`,`pro_id`,`fk_bs`,`fk_fb_rate_gc`,`fk_cl_rate_cg`,`fk_time`) values (30,'pro_1','40',3,4,'2014-06-05 00:00:00'),(31,'pro_1','7',2,3,'2014-06-14 00:00:00'),(32,'pro_1','6',1,2000,'2014-06-11 00:00:00'),(33,'pro_1','20',0,3,'2014-06-11 00:00:00'),(35,'pro_1','3',0,4,'2014-05-01 00:00:00'),(36,'pro_1','5',0,5,'2014-03-05 00:00:00');

/*Table structure for table `jb_zjl_sksj` */

DROP TABLE IF EXISTS `jb_zjl_sksj`;

CREATE TABLE `jb_zjl_sksj` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pro_id` char(30) NOT NULL COMMENT '项目ID',
  `sk_bs` char(5) NOT NULL COMMENT '实际收款笔数',
  `sk_je` double DEFAULT NULL COMMENT '实际收款金额',
  `sk_time` datetime DEFAULT NULL COMMENT '实际收款日期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='资金流管理 收款实计表';

/*Data for the table `jb_zjl_sksj` */

insert  into `jb_zjl_sksj`(`id`,`pro_id`,`sk_bs`,`sk_je`,`sk_time`) values (30,'pro_1','0.1',2,'2014-06-30 00:00:00'),(32,'pro_1','6',0,'2014-06-17 00:00:00');

/*Table structure for table `jb_zjl_skyj` */

DROP TABLE IF EXISTS `jb_zjl_skyj`;

CREATE TABLE `jb_zjl_skyj` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pro_id` char(30) NOT NULL COMMENT '项目ID',
  `sk_bs` char(5) NOT NULL COMMENT '预计收款笔数',
  `sk_rate` double DEFAULT NULL COMMENT '预计收款比例',
  `sk_time` datetime DEFAULT NULL COMMENT '预计收款日期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='资金流管理 收款预计表';

/*Data for the table `jb_zjl_skyj` */

insert  into `jb_zjl_skyj`(`id`,`pro_id`,`sk_bs`,`sk_rate`,`sk_time`) values (30,'pro_1','1',1,'2014-06-18 00:00:00'),(31,'pro_1','40',2,'2014-06-11 00:00:00'),(32,'pro_2','4',5,'2014-06-18 00:00:00'),(33,'pro_1','5',2,'2014-06-20 00:00:00'),(34,'pro_1','30',5,'2014-06-11 00:00:00');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
