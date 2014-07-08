
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
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='分包商表';

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
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='供应商表';



DROP TABLE IF EXISTS `jb_alert`;
CREATE TABLE `jb_alert` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pro_id` char(20) NOT NULL COMMENT '项目ID',
  `depsx` char(20) DEFAULT NULL COMMENT '部门列表',
  `msg` char(50) DEFAULT NULL COMMENT '报警信息',
	`alert_time` datetime DEFAULT NULL COMMENT '报警日期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='报警表';

CREATE TABLE `jb_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` char(30) NOT NULL COMMENT '用户姓名',
  `email` char(30) NOT NULL COMMENT '电子邮件,作为用户登录名',
  `password` char(100) NOT NULL COMMENT '登录密码',
  `department` char(2) DEFAULT NULL COMMENT '部门',
  `salary` double DEFAULT NULL COMMENT '工资',
  `userflag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '用户标识 1:普通用户 2.用户管理员',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '用户标识 1：新建自注册用户 2:正常已经审核过的用户 3.已经删除用户',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='用户表';

DROP TABLE IF EXISTS `jb_pro2user`;
CREATE TABLE `jb_pro2user` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pro_id` char(8) NOT NULL COMMENT '项目ID',
  `user_id` INT(11) UNSIGNED NOT NULL COMMENT '用户ID',
  `department` CHAR(2) COMMENT '部门',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='项目2用户表';


DROP TABLE IF EXISTS `jb_cg_vo`;
CREATE TABLE `jb_cg_vo` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pro_id` char(30) NOT NULL COMMENT '项目ID',
  `srctype` char(5) NOT NULL COMMENT '采购 类型:装修,机电',
  `cg_name` char(30) NOT NULL COMMENT '采购 名称',
  `cg_gys_name` char(5) NOT NULL COMMENT '供应商名称',
  `cg_ht_lx` char(1) NOT NULL COMMENT '采购合同类型',
  `cg_je`  double NOT NULL COMMENT '采购金额',
  `cg_reson` char(1) NOT NULL COMMENT '采购 原因',
  `cg_desc` char(200) NOT NULL COMMENT '采购 描述',
  `vo1_je`  double NOT NULL COMMENT 'VO1 采购金额',
  `vo1_reson` char(1) NOT NULL COMMENT 'VO1 采购 原因',
  `vo1_desc` char(200) NOT NULL COMMENT 'VO1 采购 描述',
  `vo2_je`  double NOT NULL COMMENT 'VO2 采购金额',
  `vo2_reson` char(1) NOT NULL COMMENT 'VO2 采购 原因',
  `vo2_desc` char(200) NOT NULL COMMENT 'VO2 采购 描述',
  `vo3_je`  double NOT NULL COMMENT 'VO3 采购金额',
  `vo3_reson` char(1) NOT NULL COMMENT 'VO3 采购 原因',
  `vo3_desc` char(200) NOT NULL COMMENT 'VO3 采购 描述',
  `ys_pj` char(1) NOT NULL COMMENT '评价：预算部',
  `sj_pj` char(1) NOT NULL COMMENT '评价：设计部',
  `jd_pj` char(1) NOT NULL COMMENT '评价：机电部',
  `gc_pj` char(1) NOT NULL COMMENT '评价：工程部',
  `cg_pj` char(1) NOT NULL COMMENT '评价：采购部',
  `sh_pj` char(1) NOT NULL COMMENT '评价：售后部',

  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='采购材料 VO 表';

DROP TABLE IF EXISTS `jb_customer_vo`;
CREATE TABLE `jb_customer_vo` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pro_id` char(30) NOT NULL COMMENT '项目ID',
  `vo_type` char(5) NOT NULL COMMENT 'VO 类型',
  `vo_je`  double NOT NULL COMMENT 'VO价格',
  `vo_reson` char(1) NOT NULL COMMENT 'VO 原因',
  `vo_desc` char(200) NOT NULL COMMENT 'VO 描述',

  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='客户VO表';

DROP TABLE IF EXISTS `jb_fb_vo`;
CREATE TABLE `jb_fb_vo` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pro_id` char(30) NOT NULL COMMENT '项目ID',
  `vo_type` char(5) NOT NULL COMMENT 'VO 类型',
  `vo_je`  double NOT NULL COMMENT 'VO价格',
  `vo_reson` char(1) NOT NULL COMMENT 'VO 原因',
  `vo_desc` char(200) NOT NULL COMMENT 'VO 描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='分包VO表';

DROP TABLE IF EXISTS `jb_zjl_fkyj`;
CREATE TABLE `jb_zjl_fkyj` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pro_id` char(30) NOT NULL COMMENT '项目ID',
  `fk_bs` char(5) NOT NULL COMMENT '预计付款笔数',
  `fk_fb_rate_gc` double DEFAULT NULL COMMENT '预计付款占分包合同比例',
  `fk_cl_rate_cg` double DEFAULT NULL COMMENT '预计付款占材料合同比例',
  `fk_time` datetime DEFAULT NULL COMMENT '预计付款日期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='资金流管理 付款预计表';

DROP TABLE IF EXISTS `jb_zjl_sksj`;
CREATE TABLE `jb_zjl_sksj` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pro_id` char(30) NOT NULL COMMENT '项目ID',
  `sk_bs` char(5) NOT NULL COMMENT '实际收款笔数',
  `sk_je` double DEFAULT NULL COMMENT '实际收款金额',
  `sk_time` datetime DEFAULT NULL COMMENT '实际收款日期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='资金流管理 收款实计表';

DROP TABLE IF EXISTS `jb_zjl_skyj`;
CREATE TABLE `jb_zjl_skyj` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pro_id` char(30) NOT NULL COMMENT '项目ID',
  `sk_bs` char(5) NOT NULL COMMENT '预计收款笔数',
  `sk_rate` double DEFAULT NULL COMMENT '预计收款比例',
  `sk_time` datetime DEFAULT NULL COMMENT '预计收款日期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='资金流管理 收款预计表';


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
) ENGINE=MyISAM AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='供应商管理 分包管理表';

DROP TABLE IF EXISTS `jb_gczcjl`;
CREATE TABLE `jb_gczcjl` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT NULL COMMENT '录入人员',
  `department` char(2) DEFAULT NULL COMMENT '部门',
  `pro_id` char(30) NOT NULL COMMENT '项目ID',
  `in_type` char(5) NOT NULL COMMENT '输入 类型',
  `in_sub_type` char(5) NOT NULL COMMENT '输入 子类型',
	`jyzj` varchar(1024) NOT NULL COMMENT '经验总结',
	`ydwt` varchar(1024) NOT NULL COMMENT '具体遇到的问题',
	`jjfa` varchar(1024) NOT NULL COMMENT '具体的解决方案',
	`ckwj` varchar(1024) NOT NULL COMMENT '参考查询文件',

  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='过程资产积累表';
###########################################################################################################################################
DROP TABLE IF EXISTS `jb_project`;
CREATE TABLE `jb_project` (

  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pro_id` char(30) NOT NULL COMMENT '项目ID',
  
  #售后服务部表
  `sh_yjtime` datetime DEFAULT NULL COMMENT '工程部移交售后服务部移交日期',
  `sh_zbjtime` datetime DEFAULT NULL COMMENT '质保金到期日期',
  `sh_zb_sub_detail` longtext COMMENT '质保子项-JSON格式: 包括: 项目明细名称, 项目质保子项明细内容,项目质保子项原因',
	`sh_sh_myd_1`      char(1) DEFAULT NULL COMMENT '客户满意度:售后1',
	`sh_sh_myd_1_desc` varchar(200) DEFAULT NULL COMMENT '客户满意度:售后1 相关说明',
	`sh_sh_myd_2`      char(1) DEFAULT NULL COMMENT '客户满意度:售后2',
	`sh_sh_myd_2_desc` varchar(200) DEFAULT NULL COMMENT '客户满意度:售后2 相关说明',
	`sh_myd_all` int(2) NOT NULL DEFAULT '0' COMMENT '售后总体满意度（用数值，方便换算）',
  `sh_myd_sub_detail` longtext COMMENT '售后满意度调查表子项-JSON格式: 包括: 名称,售后满意度调查表子项原因,售后满意度附加信息',
	#'售后服务部表';

	#行政人事表
	`hr_follow_man` char(10) DEFAULT NULL COMMENT '到款跟踪负责人',
	#'行政人事表';
	
	#合同管理表
	`ht_xmcwbh` char(50) DEFAULT NULL COMMENT '项目财务编号',
	#'合同管理表';
	
	#采购管理部	
	#
	`cg_clbp_wc_time` datetime DEFAULT NULL COMMENT '材料报批完成时间',
	`cg_clbp_wc_time_desc` char(100) DEFAULT NULL COMMENT '材料报批完成时间:相关说明',
	#
	`cg_gckc_sjcb`  double DEFAULT NULL COMMENT '工厂库存及零星材料采购:实际成本',
	`cg_gcrgf_sjcb` double DEFAULT NULL COMMENT '工厂人工费总金额:实际成本',
	`cg_gckc_sjcb_vo`  double DEFAULT NULL COMMENT '工厂库存及零星材料采购:实际成本变化',
	`cg_gcrgf_sjcb_vo` double DEFAULT NULL COMMENT '工厂人工费总金额:实际成本变化',
	#
	`cg_zxclcg_sm`    varchar(200) DEFAULT NULL COMMENT '装修材料采购:  相关说明',
	`cg_jdsbcg_sm`    varchar(200) DEFAULT NULL COMMENT '机电设备采购:  相关说明',
	`cg_gckc_sm`      varchar(200) DEFAULT NULL COMMENT '工厂库存及零星材料采购总金额:  相关说明',
	`cg_gcrgf_sm`     varchar(200) DEFAULT NULL COMMENT '工厂人工费:  相关说明',
	#
	`cg_rlzy_cgr1`    tinyint(4) DEFAULT NULL COMMENT '人力资源:采购员1',
	`cg_rlzy_cgr1_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:采购员1 工作比例',
	`cg_rlzy_cgr1_desc`    varchar(200) DEFAULT NULL COMMENT '人力资源:采购员1  相关说明',	
	`cg_rlzy_cgr2`    tinyint(4) DEFAULT NULL COMMENT '人力资源:采购员2',
	`cg_rlzy_cgr2_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:采购员2 工作比例',
	`cg_rlzy_cgr2_desc`    varchar(200) DEFAULT NULL COMMENT '人力资源:采购员2  相关说明',
	#
	#'采购管理部';

	#工程管理部
  `gc_htqd_time` datetime DEFAULT NULL COMMENT '合同签订日期',
  `gc_customer_fkzq` int(11) DEFAULT NULL COMMENT '客户付款账期 单位:天',
  `gc_pay_sh_pzsc` int(11) DEFAULT NULL COMMENT '付款审核批准时长 单位:天',
  `gc_hetong_first_pay_rate` double DEFAULT NULL COMMENT '合同首付款比例',
	#
	`gc_jhkg_time` datetime DEFAULT NULL COMMENT '计划开工日期',
	`gc_jhjg_time` datetime DEFAULT NULL COMMENT '计划竣工日期',
	#
	`gc_dsbptj_jh_time` datetime DEFAULT NULL COMMENT '大厦报批提交日期:计划',
	`gc_dsbptj_sj_time` datetime DEFAULT NULL COMMENT '大厦报批提交日期:实际',
	`gc_dsbptj_time_desc` varchar(200) DEFAULT NULL COMMENT '大厦报批提交日期:相关说明',
	#
	`gc_dsbppz_time` datetime DEFAULT NULL COMMENT '大厦报批批准日期',
	`gc_dsbppz_time_desc` varchar(200) DEFAULT NULL COMMENT '大厦报批批准日期:相关说明',
	#
	`gc_xfbptj_jh_time` datetime DEFAULT NULL COMMENT '消防报批提交日期:计划',
	`gc_xfbptj_sj_time` datetime DEFAULT NULL COMMENT '消防报批提交日期:实际',
	`gc_xfbptj_time_desc` varchar(200) DEFAULT NULL COMMENT '消防报批提交日期:相关说明',
	#
	`gc_xfbppz_time` datetime DEFAULT NULL COMMENT '消防报批批准日期',
	`gc_xfbppz_time_desc` varchar(200) DEFAULT NULL COMMENT '消防报批批准日期:相关说明',
	#
	`gc_kg_jh_time` datetime DEFAULT NULL COMMENT '开工日期:计划',
	`gc_kg_sj_time` datetime DEFAULT NULL COMMENT '开工日期:实际',
	`gc_kg_time_desc` varchar(200) DEFAULT NULL COMMENT '开工日期:相关说明',
	#
	`gc_sl_time` datetime DEFAULT NULL COMMENT '收楼日期',
	`gc_sl_time_desc` varchar(200) DEFAULT NULL COMMENT '收楼日期:相关说明',
	#
	`gc_xfystj_jh_time` datetime DEFAULT NULL COMMENT '消防验收提交日期:计划',
	`gc_xfystj_sj_time` datetime DEFAULT NULL COMMENT '消防验收提交日期:实际',
	`gc_xfystj_time_desc` varchar(200) DEFAULT NULL COMMENT '消防验收提交日期:相关说明',
	#
	`gc_xfyspz_time` datetime DEFAULT NULL COMMENT '消防验收批准日期',
	`gc_xfyspz_time_desc` varchar(200) DEFAULT NULL COMMENT '消防验收批准日期:相关说明',
	#
	`gc_gqyj_jh_time` datetime DEFAULT NULL COMMENT '隔墙隐检日期:计划',
	`gc_gqyj_sj_time` datetime DEFAULT NULL COMMENT '隔墙隐检日期:实际',
	`gc_gqyj_time_desc` varchar(200) DEFAULT NULL COMMENT '隔墙隐检日期:相关说明',
	#
	`gc_jfyj_jh_time` datetime DEFAULT NULL COMMENT '机房移交日期:计划',
	`gc_jfyj_sj_time` datetime DEFAULT NULL COMMENT '机房移交日期:实际',
	`gc_jfyj_time_desc` varchar(200) DEFAULT NULL COMMENT '机房移交日期:相关说明',
	#
	`gc_thyj_jh_time` datetime DEFAULT NULL COMMENT '天花隐检日期:计划',
	`gc_thyj_sj_time` datetime DEFAULT NULL COMMENT '天花隐检日期:实际',
	`gc_thyj_time_desc` varchar(200) DEFAULT NULL COMMENT '天花隐检日期:相关说明',
	#
	`gc_xmwg_khys_jh_time` datetime DEFAULT NULL COMMENT '项目完工日期(客户验收):计划',
	`gc_xmwg_khys_sj_time` datetime DEFAULT NULL COMMENT '项目完工日期(客户验收):实际',
	`gc_xmwg_khys_time_desc` varchar(200) DEFAULT NULL COMMENT '项目完工日期(客户验收):相关说明',
	#
	`gc_xmyj_yyzbqjs_time` datetime DEFAULT NULL COMMENT '项目移交日期(用于质保期计算)',
	`gc_xmyj_yyzbqjs_time_desc` varchar(200) DEFAULT NULL COMMENT '项目移交日期(用于质保期计算):相关说明',
	#
	`gc_jgzltj_time` datetime DEFAULT NULL COMMENT '竣工资料提交日期',
	`gc_jgzltj_time_desc` varchar(200) DEFAULT NULL COMMENT '竣工资料提交日期:相关说明',
	#
	`gc_khbj_jh_time` datetime DEFAULT NULL COMMENT '客户搬家日期:计划',
	`gc_khbj_sj_time` datetime DEFAULT NULL COMMENT '客户搬家日期:实际',
	`gc_khbj_time_desc` varchar(200) DEFAULT NULL COMMENT '客户搬家日期:相关说明',
	#
	`gc_yjsh_jh_time` datetime DEFAULT NULL COMMENT '移交售后日期:计划',
	`gc_yjsh_sj_time` datetime DEFAULT NULL COMMENT '移交售后日期:实际',
	`gc_yjsh_time_desc` varchar(200) DEFAULT NULL COMMENT '移交售后日期:相关说明',
	#
	`gc_zbqm_time` datetime DEFAULT NULL COMMENT '质保期满时间',
	`gc_zbqm_time_desc` varchar(200) DEFAULT NULL COMMENT '质保期满时间:相关说明',
	#
	`gc_rlzy_xmzj`    tinyint(4) DEFAULT NULL COMMENT '人力资源:项目总监',
  `gc_rlzy_xmzj_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:项目总监 工作比例',
	`gc_rlzy_xmzj_desc`    varchar(200) DEFAULT NULL COMMENT '人力资源:项目总监  相关说明',
	`gc_rlzy_xmxc1`    tinyint(4) DEFAULT NULL COMMENT '人力资源:项目经理',
	`gc_rlzy_xmxc1_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:项目经理 工作比例',
	`gc_rlzy_xmxc1_desc`   varchar(200) DEFAULT NULL COMMENT '人力资源:项目经理  相关说明',
	`gc_rlzy_xmxc2`    tinyint(4) DEFAULT NULL COMMENT '人力资源:现场经理',
	`gc_rlzy_xmxc2_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:现场经理 工作比例',
	`gc_rlzy_xmxc2_desc`    varchar(200) DEFAULT NULL COMMENT '人力资源:现场经理  相关说明',
	`gc_rlzy_zxgz1`    tinyint(4) DEFAULT NULL COMMENT '人力资源:装修工长1',
	`gc_rlzy_zxgz1_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:装修工长1 工作比例',
	`gc_rlzy_zxgz1_desc`    varchar(200) DEFAULT NULL COMMENT '人力资源:装修工长1  相关说明',
	`gc_rlzy_zxgz2`    tinyint(4) DEFAULT NULL COMMENT '人力资源:装修工长2',
	`gc_rlzy_zxgz2_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:装修工长2 工作比例',
	`gc_rlzy_zxgz2_desc`    varchar(200) DEFAULT NULL COMMENT '人力资源:装修工长2  相关说明',
	`gc_rlzy_zxgz3`    tinyint(4) DEFAULT NULL COMMENT '人力资源:装修工长3',
	`gc_rlzy_zxgz3_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:装修工长3 工作比例',
	`gc_rlzy_zxgz3_desc`    varchar(200) DEFAULT NULL COMMENT '人力资源:装修工长3  相关说明',
	`gc_rlzy_aqy1`    tinyint(4) DEFAULT NULL COMMENT '人力资源:安全员1',
	`gc_rlzy_aqy1_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:安全员1 工作比例',
	`gc_rlzy_aqy1_desc`    varchar(200) DEFAULT NULL COMMENT '人力资源:安全员1  相关说明',
	`gc_rlzy_aqy2`    tinyint(4) DEFAULT NULL COMMENT '人力资源:安全员2',
	`gc_rlzy_aqy2_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:安全员2 工作比例',
	`gc_rlzy_aqy2_desc`    varchar(200) DEFAULT NULL COMMENT '人力资源:安全员2  相关说明',
	`gc_rlzy_aqy3`    tinyint(4) DEFAULT NULL COMMENT '人力资源:安全员3',
	`gc_rlzy_aqy3_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:安全员3 工作比例',
	`gc_rlzy_aqy3_desc`    varchar(200) DEFAULT NULL COMMENT '人力资源:安全员3  相关说明',
	`gc_rlzy_kfbj1`    tinyint(4) DEFAULT NULL COMMENT '人力资源:库房及保洁负责人1',
	`gc_rlzy_kfbj1_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:库房及保洁负责人1 工作比例',
	`gc_rlzy_kfbj1_desc`    varchar(200) DEFAULT NULL COMMENT '人力资源:库房及保洁负责人1  相关说明',
	`gc_rlzy_kfbj2`    tinyint(4) DEFAULT NULL COMMENT '人力资源:库房及保洁负责人2',
	`gc_rlzy_kfbj2_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:库房及保洁负责人2 工作比例',
	`gc_rlzy_kfbj2_desc`    varchar(200) DEFAULT NULL COMMENT '人力资源:库房及保洁负责人2  相关说明',
	`gc_rlzy_gczl`    tinyint(4) DEFAULT NULL COMMENT '人力资源:工程助理',
	`gc_rlzy_gczl_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:工程助理 工作比例',
	`gc_rlzy_gczl_desc`    varchar(200) DEFAULT NULL COMMENT '人力资源:工程助理  相关说明',
	#
	#'工程管理部';
	
	#机电管理部
	`jd_jdfatj_time` datetime DEFAULT NULL COMMENT '机电方案提交日期',
	`jd_jdfatj_time_desc` varchar(200) DEFAULT NULL COMMENT '机电方案提交日期相关说明',
	#
	`jd_jdbpttj_time` datetime DEFAULT NULL COMMENT '机电报批图提交日期',
	`jd_jdbpttj_time_desc` varchar(200)  DEFAULT NULL COMMENT '机电报批图提交日期:相关说明',
	#
	`jd_jdsgttj_time` datetime DEFAULT NULL COMMENT '机电施工图提交日期',
	`jd_jdsgttj_time_desc` varchar(200)  DEFAULT NULL COMMENT '机电施工图提交日期:相关说明',
	#
	`jd_jdjgttj_time` datetime DEFAULT NULL COMMENT '机电竣工图提交时间',
	`jd_jdjgttj_time_desc` varchar(200)  DEFAULT NULL COMMENT '机电竣工图提交时间:相关说明',
	#
	`jd_rlzy_jdzfzr`    tinyint(4) DEFAULT NULL COMMENT '人力资源:机电总负责人',
	`jd_rlzy_jdzfzr_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:机电总负责人 工作比例',
	`jd_rlzy_jdzfzr_desc`    varchar(200)) DEFAULT NULL COMMENT '人力资源:机电总负责人  相关说明',
	`jd_rlzy_ktxfjpssj1`    tinyint(4) DEFAULT NULL COMMENT '人力资源:空调消防给排水设计1',
	`jd_rlzy_ktxfjpssj1_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:空调消防给排水设计1 工作比例',
	`jd_rlzy_ktxfjpssj1_desc`    varchar(200) DEFAULT NULL COMMENT '人力资源:空调消防给排水设计1  相关说明',
	`jd_rlzy_ktxfjpssj2`    tinyint(4) DEFAULT NULL COMMENT '人力资源:空调消防给排水设计2',
	`jd_rlzy_ktxfjpssj2_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:空调消防给排水设计2 工作比例',
	`jd_rlzy_ktxfjpssj2_desc`    varchar(200) DEFAULT NULL COMMENT '人力资源:空调消防给排水设计2  相关说明',
	`jd_rlzy_ktxfjpssj3`    tinyint(4) DEFAULT NULL COMMENT '人力资源:空调消防给排水设计3',
	`jd_rlzy_ktxfjpssj3_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:空调消防给排水设计3 工作比例',
	`jd_rlzy_ktxfjpssj3_desc`    varchar(200) DEFAULT NULL COMMENT '人力资源:空调消防给排水设计3  相关说明',
	`jd_rlzy_dqsj1`    tinyint(4) DEFAULT NULL COMMENT '人力资源:电气设计1',
	`jd_rlzy_dqsj1_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:电气设计1 工作比例',
	`jd_rlzy_dqsj1_desc`    varchar(200) DEFAULT NULL COMMENT '人力资源:电气设计1  相关说明',
	`jd_rlzy_dqsj2`    tinyint(4) DEFAULT NULL COMMENT '人力资源:电气设计2',
	`jd_rlzy_dqsj2_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:电气设计2 工作比例',
	`jd_rlzy_dqsj2_desc`    varchar(200) DEFAULT NULL COMMENT '人力资源:电气设计2  相关说明',
	`jd_rlzy_dqsj3`    tinyint(4) DEFAULT NULL COMMENT '人力资源:电气设计3',
	`jd_rlzy_dqsj3_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:电气设计3 工作比例',
	`jd_rlzy_dqsj3_desc`    varchar(200) DEFAULT NULL COMMENT '人力资源:电气设计3  相关说明',
	`jd_rlzy_jdgz1`    tinyint(4) DEFAULT NULL COMMENT '人力资源:机电工长1',
	`jd_rlzy_jdgz1_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:机电工长1 工作比例',
	`jd_rlzy_jdgz1_desc`    varchar(200) DEFAULT NULL COMMENT '人力资源:机电工长1  相关说明',					
	`jd_rlzy_jdgz2`    tinyint(4) DEFAULT NULL COMMENT '人力资源:机电工长2',
	`jd_rlzy_jdgz2_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:机电工长2 工作比例',
	`jd_rlzy_jdgz2_desc`    varchar(200) DEFAULT NULL COMMENT '人力资源:机电工长2  相关说明',		
	`jd_rlzy_jdgz3`    tinyint(4) DEFAULT NULL COMMENT '人力资源:机电工长3',
	`jd_rlzy_jdgz3_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:机电工长3 工作比例',
	`jd_rlzy_jdgz3_desc`    varchar(200) DEFAULT NULL COMMENT '人力资源:机电工长3  相关说明',							
	#'机电管理部';

	#设计管理部
	`sj_sjfatj_time` datetime DEFAULT NULL COMMENT '设计方案提交日期',
	`sj_sjfatj_time_desc` varchar(200) DEFAULT NULL COMMENT '设计方案提交日期相关说明',
	#
	`sj_sjbpttj_time` datetime DEFAULT NULL COMMENT '设计报批图提交日期',
	`sj_sjbpttj_time_desc` varchar(200)  DEFAULT NULL COMMENT '设计报批图提交日期:相关说明',
	#
	`sj_zxsgt_time` datetime DEFAULT NULL COMMENT '装修施工图提交日期:计划日期',
	`sj_zxsgt_time_desc` varchar(200)  DEFAULT NULL COMMENT '装修施工图提交日期:相关说明',	
	#
	`sj_zxjgt_time` datetime DEFAULT NULL COMMENT '装修竣工图提交时间:计划日期',
	`sj_zxjgt_time_desc` varchar(200)  DEFAULT NULL COMMENT '装修竣工图提交时间:相关说明',	
	#
  `sj_rlzy_gjsjs1`    tinyint(4) DEFAULT NULL COMMENT '人力资源:高级设计师1',
  `sj_rlzy_gjsjs1_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:高级设计师1 工作比例',
	`sj_rlzy_gjsjs1_desc`    varchar(200) DEFAULT NULL COMMENT '人力资源:高级设计师1  相关说明',
	`sj_rlzy_gjsjs2`    tinyint(4) DEFAULT NULL COMMENT '人力资源:高级设计师2',
	`sj_rlzy_gjsjs2_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:高级设计师2 工作比例',
	`sj_rlzy_gjsjs2_desc`   varchar(200) DEFAULT NULL COMMENT '人力资源:高级设计师2  相关说明',
	`sj_rlzy_xgsjs1`    tinyint(4) DEFAULT NULL COMMENT '人力资源:效果图设计师1',
	`sj_rlzy_xgsjs1_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:效果图设计师1 工作比例',
	`sj_rlzy_xgsjs1_desc`    varchar(200) DEFAULT NULL COMMENT '人力资源:效果图设计师1  相关说明',
	`sj_rlzy_xgsjs2`    tinyint(4) DEFAULT NULL COMMENT '人力资源:效果图设计师2',
	`sj_rlzy_xgsjs2_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:效果图设计师2 工作比例',
	`sj_rlzy_xgsjs2_desc`   varchar(200) DEFAULT NULL COMMENT '人力资源:效果图设计师2  相关说明',
	`sj_rlzy_sgtfzr1`    tinyint(4) DEFAULT NULL COMMENT '人力资源:施工图负责人1',
  `sj_rlzy_sgtfzr1_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:施工图负责人1 工作比例',
	`sj_rlzy_sgtfzr1_desc`    varchar(200) DEFAULT NULL COMMENT '人力资源:施工图负责人1  相关说明',
	`sj_rlzy_sgtfzr2`    tinyint(4) DEFAULT NULL COMMENT '人力资源:施工图负责人2',
	`sj_rlzy_sgtfzr2_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:施工图负责人2 工作比例',
	`sj_rlzy_sgtfzr2_desc`   varchar(200) DEFAULT NULL COMMENT '人力资源:施工图负责人2  相关说明',
	`sj_rlzy_sgtfzr3`    tinyint(4) DEFAULT NULL COMMENT '人力资源:施工图负责人3',
	`sj_rlzy_sgtfzr3_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:施工图负责人3 工作比例',
	`sj_rlzy_sgtfzr3_desc`    varchar(200) DEFAULT NULL COMMENT '人力资源:施工图负责人3  相关说明',
	#'设计管理部';
	
	#市场管理部
  `sc_pro_name` char(50) DEFAULT NULL COMMENT '项目名称',
  `sc_pro_qx` longtext COMMENT '项目权限',
  `sc_pro_type`  char(1) DEFAULT NULL COMMENT '项目类别',
  `sc_pro_trade` char(20) DEFAULT NULL COMMENT '项目行业',
  `sc_pro_trade_base` char(20) DEFAULT NULL COMMENT '项目行业:基本',
  `sc_pro_trade_ot` char(20) DEFAULT NULL COMMENT '项目行业:其他',
	`sc_cus_name` char(50) DEFAULT NULL COMMENT '客户名称',
	`sc_cus_type` char(1) DEFAULT NULL COMMENT '客户类型',
	`sc_cus_t_1` char(1) NOT NULL DEFAULT '0' COMMENT '客户类别1',
	`sc_cus_t_2` char(1) NOT NULL DEFAULT '0' COMMENT '客户类别2',
	`sc_mag_company` char(50)  DEFAULT NULL COMMENT '管理公司',
	`sc_mag_company_base` char(50)  DEFAULT NULL COMMENT '管理公司:基本',
	`sc_mag_company_ot` char(50)  DEFAULT NULL COMMENT '管理公司:其他',
	`sc_compety_company` char(50) DEFAULT NULL COMMENT '竞争对手',
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
	`sc_sj_myd_1`      char(1) DEFAULT NULL COMMENT '客户满意度:设计1',
	`sc_sj_myd_1_desc` varchar(200) DEFAULT NULL COMMENT '客户满意度:设计1 相关说明',
	`sc_sj_myd_2`      char(1) DEFAULT NULL COMMENT '客户满意度:设计2',
	`sc_sj_myd_2_desc` varchar(200) DEFAULT NULL COMMENT '客户满意度:设计2 相关说明',
	`sc_sg_myd_1`      char(1) DEFAULT NULL COMMENT '客户满意度:施工1',
	`sc_sg_myd_1_desc` varchar(200) DEFAULT NULL COMMENT '客户满意度:施工1 相关说明',
	`sc_sg_myd_2`      char(1) DEFAULT NULL COMMENT '客户满意度:施工2',
	`sc_sg_myd_2_desc` varchar(200) DEFAULT NULL COMMENT '客户满意度:施工2 相关说明',
	#
	`sc_rlzy_scjl`    tinyint(4) DEFAULT NULL COMMENT '人力资源:市场经理',
	`sc_rlzy_scjl_desc`    varchar(200) DEFAULT NULL COMMENT '人力资源:市场经理 相关说明',
	`sc_rlzy_sczl`    tinyint(4) DEFAULT NULL COMMENT '人力资源:市场助理',
	`sc_rlzy_sczl_desc`    varchar(200) DEFAULT NULL COMMENT '人力资源:市场助理  相关说明',
	#
	#'市场管理部';

	#预算管理部
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

	#前期费用
	`ys_qq_dwbj`  double DEFAULT NULL COMMENT '前期:对外报价',
	`ys_qq_customer_vo`  double DEFAULT NULL COMMENT '前期:客户VO',
	`ys_qq_nkje`  double DEFAULT NULL COMMENT '前期:内控金额',
	`ys_qq_sm`  varchar(200) DEFAULT NULL COMMENT '前期:说明',
	#对外报价
	`ys_zx_dwbj`  double DEFAULT NULL COMMENT '装修:对外报价',
	`ys_dq_dwbj`  double DEFAULT NULL COMMENT '电气:对外报价',
	`ys_kt_dwbj`  double DEFAULT NULL COMMENT '空调:对外报价',
	`ys_xf_dwbj`  double DEFAULT NULL COMMENT '消防:对外报价',
	`ys_jps_dwbj` double DEFAULT NULL COMMENT '给排水:对外报价',
	`ys_it_dwbj`  double DEFAULT NULL COMMENT 'IT:对外报价',
	`ys_sec_dwbj` double DEFAULT NULL COMMENT 'SEC:对外报价',
	`ys_av_dwbj`  double DEFAULT NULL COMMENT 'AV:对外报价',
	#内控金额
	`ys_zx_nkje`  double DEFAULT NULL COMMENT '装修:内控金额',
	`ys_dq_nkje`  double DEFAULT NULL COMMENT '电气:内控金额',
	`ys_kt_nkje`  double DEFAULT NULL COMMENT '空调:内控金额',
	`ys_xf_nkje`  double DEFAULT NULL COMMENT '消防:内控金额',
	`ys_jps_nkje` double DEFAULT NULL COMMENT '给排水:内控金额',
	`ys_it_nkje`  double DEFAULT NULL COMMENT 'IT:内控金额',
	`ys_sec_nkje` double DEFAULT NULL COMMENT 'SEC:内控金额',
	`ys_av_nkje`  double DEFAULT NULL COMMENT 'AV:内控金额',
	#实际成本
	`ys_zx_sjcb`  double DEFAULT NULL COMMENT '装修:实际成本',
	`ys_dq_sjcb`  double DEFAULT NULL COMMENT '电气:实际成本',
	`ys_kt_sjcb`  double DEFAULT NULL COMMENT '空调:实际成本',
	`ys_xf_sjcb`  double DEFAULT NULL COMMENT '消防:实际成本',
	`ys_jps_sjcb` double DEFAULT NULL COMMENT '给排水:实际成本',
	`ys_it_sjcb`  double DEFAULT NULL COMMENT 'IT:实际成本',
	`ys_sec_sjcb` double DEFAULT NULL COMMENT 'SEC:实际成本',
	`ys_av_sjcb`  double DEFAULT NULL COMMENT 'AV:实际成本',
	#相关说明
	`ys_zx_sm`   varchar(200) DEFAULT NULL COMMENT '装修:相关说明',
	`ys_dq_sm`   varchar(200) DEFAULT NULL COMMENT '电气:相关说明',
	`ys_kt_sm`   varchar(200) DEFAULT NULL COMMENT '空调:相关说明',
	`ys_xf_sm`   varchar(200) DEFAULT NULL COMMENT '消防:相关说明',
	`ys_jps_sm`  varchar(200) DEFAULT NULL COMMENT '给排水:相关说明',
	`ys_it_sm`   varchar(200) DEFAULT NULL COMMENT 'IT:相关说明',
	`ys_sec_sm`  varchar(200) DEFAULT NULL COMMENT 'SEC:相关说明',
	`ys_av_sm`   varchar(200) DEFAULT NULL COMMENT 'AV:相关说明', 
	#采购
	`ys_cg_all_dwbj`  double DEFAULT NULL COMMENT '采购:对外报价',
	`ys_cg_all_nkje`  double DEFAULT NULL COMMENT '采购:内控金额',
	#直接人工成本
	`ys_rg_dwbj`  double DEFAULT NULL COMMENT '直接人工成本:对外报价',
	`ys_rg_nkje`  double DEFAULT NULL COMMENT '直接人工成本:内控金额',
	`ys_rg_sm`    varchar(200) DEFAULT NULL COMMENT '直接人工成本:相关说明', 
	#其他说明
	`ys_qt_sm`    varchar(200) DEFAULT NULL COMMENT '其他:相关说明', 
	
	#
	`ys_fb_ht_all_amt` double DEFAULT NULL COMMENT '分包合同总金额',
  #
  `ys_rlzy_ysy1`    tinyint(4) DEFAULT NULL COMMENT '人力资源:预算员1',
  `ys_rlzy_ysy1_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:预算员1 工作比例',
	`ys_rlzy_ysy1_desc`    varchar(200) DEFAULT NULL COMMENT '人力资源:预算员1  相关说明',
	`ys_rlzy_ysy2`    tinyint(4) DEFAULT NULL COMMENT '人力资源:预算员2',
	`ys_rlzy_ysy2_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:预算员2 工作比例',
	`ys_rlzy_ysy2_desc`   varchar(200) DEFAULT NULL COMMENT '人力资源:预算员2  相关说明',
	`ys_rlzy_ysy3`    tinyint(4) DEFAULT NULL COMMENT '人力资源:预算员3',
	`ys_rlzy_ysy3_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:预算员3 工作比例',
	`ys_rlzy_ysy3_desc`    varchar(200) DEFAULT NULL COMMENT '人力资源:预算员3  相关说明',
  #
	#预算管理部
	
	
	`status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '标识 1：新建 2:正常已经审核过 3.已经删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='项目总表';  

#######################################################################################################################################















