
CREATE TABLE `jb_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` char(30) NOT NULL COMMENT '用户姓名',
  `email` char(30) NOT NULL COMMENT '电子邮件,作为用户登录名',
  `password` char(100) NOT NULL COMMENT '登录密码',
  `department` char(2) DEFAULT NULL COMMENT '部门',
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
  `fk_fb_rate` double DEFAULT NULL COMMENT '预计付款占分包合同比例',
  `fk_cl_rate` double DEFAULT NULL COMMENT '预计付款占材料合同比例',
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

DROP TABLE IF EXISTS `jb_gys`;
CREATE TABLE `jb_gys` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `gys_name` char(30) NOT NULL COMMENT '供应商名称',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '标识 1：新建 2:正常已经审核 3.已经删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='供应商表';

DROP TABLE IF EXISTS `jb_gys_fb`;
CREATE TABLE `jb_gys_fb` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pro_id` char(30) NOT NULL COMMENT '项目ID',
  `ys_fb_lx` char(5) NOT NULL COMMENT '分包类型',
  `ys_fb_ht_lx` char(1) NOT NULL COMMENT '分包合同类型',
  `ys_fb_ht_je` double DEFAULT NULL COMMENT '分包合同金额',
  `ys_fb_ht_voje` double DEFAULT NULL COMMENT '分包合同VO金额',
  `ys_pj` char(1) NOT NULL COMMENT '平均：预算部',
  `sj_pj` char(1) NOT NULL COMMENT '平均：设计部',
  `jd_pj` char(1) NOT NULL COMMENT '平均：机电部',
  `gc_pj` char(1) NOT NULL COMMENT '平均：工程部',
  `cg_pj` char(1) NOT NULL COMMENT '平均：采购部',
  `sh_pj` char(1) NOT NULL COMMENT '平均：售后部',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='供应商管理 分包表';

DROP TABLE IF EXISTS `jb_gys_zxcl`;
CREATE TABLE `jb_gys_zxcl` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pro_id` char(30) NOT NULL COMMENT '项目ID',
  `ys_zxcl_name` char(5) NOT NULL COMMENT '装修材料名称',
  `ys_htje` double DEFAULT NULL COMMENT '合同金额',
  `ys_voje` double DEFAULT NULL COMMENT 'VO金额',
  `ys_pj` char(1) NOT NULL COMMENT '平均：预算部',
  `sj_pj` char(1) NOT NULL COMMENT '平均：设计部',
  `jd_pj` char(1) NOT NULL COMMENT '平均：机电部',
  `gc_pj` char(1) NOT NULL COMMENT '平均：工程部',
  `cg_pj` char(1) NOT NULL COMMENT '平均：采购部',
  `sh_pj` char(1) NOT NULL COMMENT '平均：售后部',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='供应商管理 装修材料表';

DROP TABLE IF EXISTS `jb_gys_jdcl`;
CREATE TABLE `jb_gys_jdcl` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pro_id` char(30) NOT NULL COMMENT '项目ID',
  `ys_zxcl_name` char(5) NOT NULL COMMENT '装修材料名称',
  `ys_htje` double DEFAULT NULL COMMENT '合同金额',
  `ys_voje` double DEFAULT NULL COMMENT 'VO金额',
  `ys_pj` char(1) NOT NULL COMMENT '平均：预算部',
  `sj_pj` char(1) NOT NULL COMMENT '平均：设计部',
  `jd_pj` char(1) NOT NULL COMMENT '平均：机电部',
  `gc_pj` char(1) NOT NULL COMMENT '平均：工程部',
  `cg_pj` char(1) NOT NULL COMMENT '平均：采购部',
  `sh_pj` char(1) NOT NULL COMMENT '平均：售后部',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='供应商管理 机电材料表';

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
#	`sh_zb_all_amt` double DEFAULT NULL COMMENT '项目质保总费用',
  `sh_zb_sub_detail` longtext COMMENT '质保子项-JSON格式: 包括: 项目明细名称, 项目质保子项明细内容,项目质保子项原因',
#	`sh_myd_amt` double DEFAULT NULL COMMENT '售后满意度平均值',
	`sh_sh_myd_1`      char(1) DEFAULT NULL COMMENT '客户满意度:售后1',
	`sh_sh_myd_1_desc` char(50) DEFAULT NULL COMMENT '客户满意度:售后1 相关说明',
	`sh_sh_myd_2`      char(1) DEFAULT NULL COMMENT '客户满意度:售后2',
	`sh_sh_myd_2_desc` char(50) DEFAULT NULL COMMENT '客户满意度:售后2 相关说明',
	`sh_myd_all` int(2) NOT NULL DEFAULT '0' COMMENT '售后总体满意度（用数值，方便换算）',
  `sh_myd_sub_detail` longtext COMMENT '售后满意度调查表子项-JSON格式: 包括: 名称,售后满意度调查表子项原因,售后满意度附加信息',
	#'售后服务部表';

	#行政人事表
#	`hr_hetong_daozhang_all_amt` double DEFAULT NULL COMMENT '客户合同到账总金额',
#	`hr_hetong_daozhang_rate` double DEFAULT NULL COMMENT '客户合同到账比例',
#	`hr_hetong_js_daozhang_rate` double DEFAULT NULL COMMENT '客户合同结算总额到账比例',
#	`hr_hetong_daozhang_sub_detail` longtext COMMENT 'JSON格式: 序号,客户合同到账金额,到账时间',
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
#	`cg_buy_all_amt` double DEFAULT NULL COMMENT '采购总金额',
#	`cg_buy_zscl_all_amt` double DEFAULT NULL COMMENT '装饰材料采购总金额',
#	`cg_buy_jdsb_all_amt` double DEFAULT NULL COMMENT '机电设备材料采购总金额',
	`cg_buy_gckc_all_amt` double DEFAULT NULL COMMENT '工厂库存及零星材料采购总金额',
	`cg_buy_gcrgf_all_amt` double DEFAULT NULL COMMENT '工厂人工费总金额',
	`cg_buy_zscl_sub_detail` longtext COMMENT 'JSON格式: 装饰材料采购明细, 格式:数组, 数组每项包括：合同号,装饰材料采购明细价格,装饰材料采购明细VO价格,装饰材料采购明细原因,装饰材料采购供应商',
	`cg_buy_jdsb_sub_detail` longtext COMMENT 'JSON格式: 机电设备材料采购明细,格式:数组, 数组每项包括：合同号,机电设备材料采购明细价格,机电设备材料采购明细VO价格,机电设备材料采购明细原因,机电设备材料采购供应商',
#	`cg_cl_pay_rate` longtext COMMENT '材料付款比例-JSON格式: , 格式:数组, 数组每项包括：序号,付款比例,付款金额',
	`cg_cljg_mon_pay_rate` double DEFAULT 0.25 COMMENT '材料竣工当月付款比例',
#	`cg_cljg_mon_pay_amt` double DEFAULT NULL COMMENT '材料竣工当月付款金额',
	`cg_cljg_next_mon_pay_rate` double DEFAULT 0.3 COMMENT '材料竣工次月付款比例',
#	`cg_cljg_next_mon_pay_amt` double DEFAULT NULL COMMENT '材料竣工次月付款金额',
	`cg_clzb_pay_rate` double DEFAULT 0.05 COMMENT '材料质保期满后付款比例',
#	`cg_clzb_pay_amt` double DEFAULT NULL COMMENT '材料质保期满后付款金额',
	#
	`cg_gckc_sjcb`  double DEFAULT NULL COMMENT '工厂库存及零星材料采购:实际成本',
	`cg_gcrgf_sjcb` double DEFAULT NULL COMMENT '工厂人工费总金额:实际成本',
	`cg_gckc_sjcb_vo`  double DEFAULT NULL COMMENT '工厂库存及零星材料采购:实际成本变化',
	`cg_gcrgf_sjcb_vo` double DEFAULT NULL COMMENT '工厂人工费总金额:实际成本变化',
	#
	`cg_zxclcg_sm`    char(200) DEFAULT NULL COMMENT '装修材料采购:  相关说明',
	`cg_jdsbcg_sm`    char(200) DEFAULT NULL COMMENT '机电设备采购:  相关说明',
	`cg_gckc_sm`      char(200) DEFAULT NULL COMMENT '工厂库存及零星材料采购总金额:  相关说明',
	`cg_gcrgf_sm`     char(200) DEFAULT NULL COMMENT '工厂人工费:  相关说明',
	#
	`cg_rlzy_cgr1`    tinyint(4) DEFAULT NULL COMMENT '人力资源:采购员1',
	`cg_rlzy_cgr1_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:采购员1 工作比例',
	`cg_rlzy_cgr1_desc`    char(100) DEFAULT NULL COMMENT '人力资源:采购员1  相关说明',	
	`cg_rlzy_cgr2`    tinyint(4) DEFAULT NULL COMMENT '人力资源:采购员2',
	`cg_rlzy_cgr2_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:采购员2 工作比例',
	`cg_rlzy_cgr2_desc`    char(100) DEFAULT NULL COMMENT '人力资源:采购员2  相关说明',
	#
	#'采购管理部';

	#工程管理部
  `gc_htqd_time` datetime DEFAULT NULL COMMENT '合同签订日期',
  `gc_customer_fkzq` int(11) DEFAULT NULL COMMENT '客户付款账期 单位:天',
  `gc_pay_sh_pzsc` int(11) DEFAULT NULL COMMENT '付款审核批准时长 单位:天',
  `gc_hetong_first_pay_rate` double DEFAULT NULL COMMENT '合同首付款比例',
#  `gc_hetong_first_pay_amt` double DEFAULT NULL COMMENT '合同首付款金额',
#`gc_jh_first_pay_dz_time` datetime NOT NULL COMMENT '计划首付款到账日期, 计算公式:合同签订日期+客户付款账期+付款审核批准时长',
#`gc_sj_first_pay_dz_time` datetime NOT NULL COMMENT '实际首付款到账日期',
	`gc_jhkg_time` datetime DEFAULT NULL COMMENT '计划开工日期',
	`gc_jhjg_time` datetime DEFAULT NULL COMMENT '计划竣工日期',
	
	#
	`gc_dsbptj_jh_time` datetime DEFAULT NULL COMMENT '大厦报批提交日期:计划',
	`gc_dsbptj_sj_time` datetime DEFAULT NULL COMMENT '大厦报批提交日期:实际',
	`gc_dsbptj_time_desc` char(100) DEFAULT NULL COMMENT '大厦报批提交日期:相关说明',
	#
	`gc_dsbppz_time` datetime DEFAULT NULL COMMENT '大厦报批批准日期',
	`gc_dsbppz_time_desc` char(100) DEFAULT NULL COMMENT '大厦报批批准日期:相关说明',
	#
	`gc_xfbptj_jh_time` datetime DEFAULT NULL COMMENT '消防报批提交日期:计划',
	`gc_xfbptj_sj_time` datetime DEFAULT NULL COMMENT '消防报批提交日期:实际',
	`gc_xfbptj_time_desc` char(100) DEFAULT NULL COMMENT '消防报批提交日期:相关说明',
	#
	`gc_xfbppz_time` datetime DEFAULT NULL COMMENT '消防报批批准日期',
	`gc_xfbppz_time_desc` char(100) DEFAULT NULL COMMENT '消防报批批准日期:相关说明',
	#
	`gc_kg_jh_time` datetime DEFAULT NULL COMMENT '开工日期:计划',
	`gc_kg_sj_time` datetime DEFAULT NULL COMMENT '开工日期:实际',
	`gc_kg_time_desc` char(100) DEFAULT NULL COMMENT '开工日期:相关说明',
	#
	`gc_sl_time` datetime DEFAULT NULL COMMENT '收楼日期',
	`gc_sl_time_desc` char(100) DEFAULT NULL COMMENT '收楼日期:相关说明',
	#
	`gc_xfystj_jh_time` datetime DEFAULT NULL COMMENT '消防验收提交日期:计划',
	`gc_xfystj_sj_time` datetime DEFAULT NULL COMMENT '消防验收提交日期:实际',
	`gc_xfystj_time_desc` char(100) DEFAULT NULL COMMENT '消防验收提交日期:相关说明',
	#
	`gc_xfyspz_time` datetime DEFAULT NULL COMMENT '消防验收批准日期',
	`gc_xfyspz_time_desc` char(100) DEFAULT NULL COMMENT '消防验收批准日期:相关说明',
	#
	`gc_gqyj_jh_time` datetime DEFAULT NULL COMMENT '隔墙隐检日期:计划',
	`gc_gqyj_sj_time` datetime DEFAULT NULL COMMENT '隔墙隐检日期:实际',
	`gc_gqyj_time_desc` char(100) DEFAULT NULL COMMENT '隔墙隐检日期:相关说明',
	#
	`gc_jfyj_jh_time` datetime DEFAULT NULL COMMENT '机房移交日期:计划',
	`gc_jfyj_sj_time` datetime DEFAULT NULL COMMENT '机房移交日期:实际',
	`gc_jfyj_time_desc` char(100) DEFAULT NULL COMMENT '机房移交日期:相关说明',
	#
	`gc_thyj_jh_time` datetime DEFAULT NULL COMMENT '天花隐检日期:计划',
	`gc_thyj_sj_time` datetime DEFAULT NULL COMMENT '天花隐检日期:实际',
	`gc_thyj_time_desc` char(100) DEFAULT NULL COMMENT '天花隐检日期:相关说明',
	#
	`gc_xmwg_khys_jh_time` datetime DEFAULT NULL COMMENT '项目完工日期(客户验收):计划',
	`gc_xmwg_khys_sj_time` datetime DEFAULT NULL COMMENT '项目完工日期(客户验收):实际',
	`gc_xmwg_khys_time_desc` char(100) DEFAULT NULL COMMENT '项目完工日期(客户验收):相关说明',
	#
	`gc_xmyj_yyzbqjs_time` datetime DEFAULT NULL COMMENT '项目移交日期(用于质保期计算)',
	`gc_xmyj_yyzbqjs_time_desc` char(100) DEFAULT NULL COMMENT '项目移交日期(用于质保期计算):相关说明',
	#
	`gc_jgzltj_time` datetime DEFAULT NULL COMMENT '竣工资料提交日期',
	`gc_jgzltj_time_desc` char(100) DEFAULT NULL COMMENT '竣工资料提交日期:相关说明',
	#
	`gc_khbj_jh_time` datetime DEFAULT NULL COMMENT '客户搬家日期:计划',
	`gc_khbj_sj_time` datetime DEFAULT NULL COMMENT '客户搬家日期:实际',
	`gc_khbj_time_desc` char(100) DEFAULT NULL COMMENT '客户搬家日期:相关说明',
	#
	`gc_yjsh_jh_time` datetime DEFAULT NULL COMMENT '移交售后日期:计划',
	`gc_yjsh_sj_time` datetime DEFAULT NULL COMMENT '移交售后日期:实际',
	`gc_yjsh_time_desc` char(100) DEFAULT NULL COMMENT '移交售后日期:相关说明',
	#
	`gc_zbqm_time` datetime DEFAULT NULL COMMENT '质保期满时间',
	`gc_zbqm_time_desc` char(100) DEFAULT NULL COMMENT '质保期满时间:相关说明',
	#
	`gc_gcxg_date_detail` longtext COMMENT '工程相关日期-JSON格式:  包括13项：
		1.大厦报批提交日期,
		2.大厦报批批准日期,
		3.大厦报批提交次数,
		4.消防报批提交日期,
		5.消防报批批准日期,
		6.计划开工日期,
		7.实际开工日期,
		8.机房移交,
		9.天花隐检,
		10.消防报验提交日期,
		11.消防报验批准日期,
		12.计划竣工日期（客户验收）,
		13.实际竣工日期（客户验收）',
#	`gc_yj_jdk_detail` longtext COMMENT 'JSON格式: 预计进度款到账明细 , 格式:数组, 数组每项包括：进度款序号,进度款占合同金额比例',
	`gc_jgxg_detail` longtext COMMENT '竣工相关明细-JSON格式:  , 格式:数组, 包括：
		1.竣工款占合同金额比例,
		2.计划竣工款到账日期,
		3.预计结算款到账日期,
		4.按时完工,
		5.计划客户搬家日期,
		6.实际客户搬家日期',
#`gc_sj_jgk_dz_time` datetime NOT NULL COMMENT '实际竣工款到账日期',
#`gc_jsk_amt` double DEFAULT NULL COMMENT '结算款金额'
#`gc_yjyj_sh_time` datetime NOT NULL COMMENT '预计移交售后日期',
	#
	`gc_rlzy_xmzj`    tinyint(4) DEFAULT NULL COMMENT '人力资源:项目总监',
  `gc_rlzy_xmzj_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:项目总监 工作比例',
	`gc_rlzy_xmzj_desc`    char(100) DEFAULT NULL COMMENT '人力资源:项目总监  相关说明',
	`gc_rlzy_xmxc1`    tinyint(4) DEFAULT NULL COMMENT '人力资源:项目经理',
	`gc_rlzy_xmxc1_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:项目经理 工作比例',
	`gc_rlzy_xmxc1_desc`   char(100) DEFAULT NULL COMMENT '人力资源:项目经理  相关说明',
	`gc_rlzy_xmxc2`    tinyint(4) DEFAULT NULL COMMENT '人力资源:现场经理',
	`gc_rlzy_xmxc2_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:现场经理 工作比例',
	`gc_rlzy_xmxc2_desc`    char(100) DEFAULT NULL COMMENT '人力资源:现场经理  相关说明',
	`gc_rlzy_zxgz1`    tinyint(4) DEFAULT NULL COMMENT '人力资源:装修工长1',
	`gc_rlzy_zxgz1_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:装修工长1 工作比例',
	`gc_rlzy_zxgz1_desc`    char(100) DEFAULT NULL COMMENT '人力资源:装修工长1  相关说明',
	`gc_rlzy_zxgz2`    tinyint(4) DEFAULT NULL COMMENT '人力资源:装修工长2',
	`gc_rlzy_zxgz2_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:装修工长2 工作比例',
	`gc_rlzy_zxgz2_desc`    char(100) DEFAULT NULL COMMENT '人力资源:装修工长2  相关说明',
	`gc_rlzy_zxgz3`    tinyint(4) DEFAULT NULL COMMENT '人力资源:装修工长3',
	`gc_rlzy_zxgz3_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:装修工长3 工作比例',
	`gc_rlzy_zxgz3_desc`    char(100) DEFAULT NULL COMMENT '人力资源:装修工长3  相关说明',
	`gc_rlzy_aqy1`    tinyint(4) DEFAULT NULL COMMENT '人力资源:安全员1',
	`gc_rlzy_aqy1_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:安全员1 工作比例',
	`gc_rlzy_aqy1_desc`    char(100) DEFAULT NULL COMMENT '人力资源:安全员1  相关说明',
	`gc_rlzy_aqy2`    tinyint(4) DEFAULT NULL COMMENT '人力资源:安全员2',
	`gc_rlzy_aqy2_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:安全员2 工作比例',
	`gc_rlzy_aqy2_desc`    char(100) DEFAULT NULL COMMENT '人力资源:安全员2  相关说明',
	`gc_rlzy_aqy3`    tinyint(4) DEFAULT NULL COMMENT '人力资源:安全员3',
	`gc_rlzy_aqy3_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:安全员3 工作比例',
	`gc_rlzy_aqy3_desc`    char(100) DEFAULT NULL COMMENT '人力资源:安全员3  相关说明',
	`gc_rlzy_kfbj1`    tinyint(4) DEFAULT NULL COMMENT '人力资源:库房及保洁负责人1',
	`gc_rlzy_kfbj1_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:库房及保洁负责人1 工作比例',
	`gc_rlzy_kfbj1_desc`    char(100) DEFAULT NULL COMMENT '人力资源:库房及保洁负责人1  相关说明',
	`gc_rlzy_kfbj2`    tinyint(4) DEFAULT NULL COMMENT '人力资源:库房及保洁负责人2',
	`gc_rlzy_kfbj2_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:库房及保洁负责人2 工作比例',
	`gc_rlzy_kfbj2_desc`    char(100) DEFAULT NULL COMMENT '人力资源:库房及保洁负责人2  相关说明',
	`gc_rlzy_gczl`    tinyint(4) DEFAULT NULL COMMENT '人力资源:工程助理',
	`gc_rlzy_gczl_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:工程助理 工作比例',
	`gc_rlzy_gczl_desc`    char(100) DEFAULT NULL COMMENT '人力资源:工程助理  相关说明',
	#

	`gc_xmry_detail` longtext COMMENT '项目人员明细-JSON格式:  包括6项：
	1.项目总监,
	2.项目经理,
	3.现场经理,
	4.工长列表, 格式:数组, 数组每项包括: 装修工长序号,装修工长承担工程量的比例,
	5.安全员列表,格式:数组,数组每项包括: 安全员序号,
	6.现场保洁负责人',
#`gc_xcfy_all_amt` double DEFAULT NULL COMMENT '现场费用总计'	
#`gc_dssqfy_amt` double DEFAULT NULL COMMENT '大厦收取费用'	
	`gc_fee_detail` longtext COMMENT '工程费用明细-JSON格式:  包括22项：
	  1.物业管理费用（一般按平米算）,
		2.办公用品1
		3.办公用品2
		4.临时水电设施费
		5.临时水电费用
		6.施工手续费
		7.大楼审图等管理费
		8.设备租赁费
		9.空气检测费
		10.现场保护及成品保护（公司自己做的）
		11.招待费
		12.劳防用品其他
		13.生活交通安置费
		14.工程保险费
		15.施工清洁费
		16.税金
		17.报审图打图费用
		18.临时办公室费用
		19.材料报检费用
		20.垃圾清运费
		21.施工图和竣工图（助理最清楚）
		22.其它费用
	',
	#'工程管理部';

	#机电管理部
	`jd_jdfatj_time` datetime DEFAULT NULL COMMENT '机电方案提交日期',
	`jd_jdfatj_time_desc` char(100) DEFAULT NULL COMMENT '机电方案提交日期相关说明',
	#
	`jd_jdbpttj_time` datetime DEFAULT NULL COMMENT '机电报批图提交日期',
	`jd_jdbpttj_time_desc` char(100)  DEFAULT NULL COMMENT '机电报批图提交日期:相关说明',
	#
	`jd_jdsgttj_time` datetime DEFAULT NULL COMMENT '机电施工图提交日期',
	`jd_jdsgttj_time_desc` char(100)  DEFAULT NULL COMMENT '机电施工图提交日期:相关说明',
	#
	`jd_jdjgttj_time` datetime DEFAULT NULL COMMENT '机电竣工图提交时间',
	`jd_jdjgttj_time_desc` char(100)  DEFAULT NULL COMMENT '机电竣工图提交时间:相关说明',
	#
	`jd_rlzy_jdzfzr`    tinyint(4) DEFAULT NULL COMMENT '人力资源:机电总负责人',
	`jd_rlzy_jdzfzr_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:机电总负责人 工作比例',
	`jd_rlzy_jdzfzr_desc`    char(100) DEFAULT NULL COMMENT '人力资源:机电总负责人  相关说明',
	`jd_rlzy_ktxfjpssj1`    tinyint(4) DEFAULT NULL COMMENT '人力资源:空调消防给排水设计1',
	`jd_rlzy_ktxfjpssj1_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:空调消防给排水设计1 工作比例',
	`jd_rlzy_ktxfjpssj1_desc`    char(100) DEFAULT NULL COMMENT '人力资源:空调消防给排水设计1  相关说明',
	`jd_rlzy_ktxfjpssj2`    tinyint(4) DEFAULT NULL COMMENT '人力资源:空调消防给排水设计2',
	`jd_rlzy_ktxfjpssj2_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:空调消防给排水设计2 工作比例',
	`jd_rlzy_ktxfjpssj2_desc`    char(100) DEFAULT NULL COMMENT '人力资源:空调消防给排水设计2  相关说明',
	`jd_rlzy_ktxfjpssj3`    tinyint(4) DEFAULT NULL COMMENT '人力资源:空调消防给排水设计3',
	`jd_rlzy_ktxfjpssj3_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:空调消防给排水设计3 工作比例',
	`jd_rlzy_ktxfjpssj3_desc`    char(100) DEFAULT NULL COMMENT '人力资源:空调消防给排水设计3  相关说明',
	`jd_rlzy_dqsj1`    tinyint(4) DEFAULT NULL COMMENT '人力资源:电气设计1',
	`jd_rlzy_dqsj1_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:电气设计1 工作比例',
	`jd_rlzy_dqsj1_desc`    char(100) DEFAULT NULL COMMENT '人力资源:电气设计1  相关说明',
	`jd_rlzy_dqsj2`    tinyint(4) DEFAULT NULL COMMENT '人力资源:电气设计2',
	`jd_rlzy_dqsj2_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:电气设计2 工作比例',
	`jd_rlzy_dqsj2_desc`    char(100) DEFAULT NULL COMMENT '人力资源:电气设计2  相关说明',
	`jd_rlzy_dqsj3`    tinyint(4) DEFAULT NULL COMMENT '人力资源:电气设计3',
	`jd_rlzy_dqsj3_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:电气设计3 工作比例',
	`jd_rlzy_dqsj3_desc`    char(100) DEFAULT NULL COMMENT '人力资源:电气设计3  相关说明',
	`jd_rlzy_jdgz1`    tinyint(4) DEFAULT NULL COMMENT '人力资源:机电工长1',
	`jd_rlzy_jdgz1_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:机电工长1 工作比例',
	`jd_rlzy_jdgz1_desc`    char(100) DEFAULT NULL COMMENT '人力资源:机电工长1  相关说明',					
	`jd_rlzy_jdgz2`    tinyint(4) DEFAULT NULL COMMENT '人力资源:机电工长2',
	`jd_rlzy_jdgz2_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:机电工长2 工作比例',
	`jd_rlzy_jdgz2_desc`    char(100) DEFAULT NULL COMMENT '人力资源:机电工长2  相关说明',		
	`jd_rlzy_jdgz3`    tinyint(4) DEFAULT NULL COMMENT '人力资源:机电工长3',
	`jd_rlzy_jdgz3_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:机电工长3 工作比例',
	`jd_rlzy_jdgz3_desc`    char(100) DEFAULT NULL COMMENT '人力资源:机电工长3  相关说明',							
	#
  `jd_tjsj_date_detail` longtext COMMENT '提交时间相关日期-JSON格式:  包括5项：
		1.投标方案提交时间,
		2.大厦报审图首次提交时间,
		3.施工图提交时间,
		4.竣工图提交时间,
		5.竣工资料提交时间',
  `jd_jdgl_detail` longtext COMMENT '机电管理部人员明细-JSON格式:  包括6项：
		1.设计总负责人,
		2.空调消防给排水负责人列表, 格式:数组, 数组每项包括: 负责人序号,负责人占比(占比总和为100%),
		3.电气负责人列表, 格式:数组, 数组每项包括: 负责人序号,负责人占比(占比总和为100%)
		4.给排水工长列表, 格式:数组, 数组每项包括: 空调消防给排水工长,空调消防给排水工长占比
		5.电气工长列表, 格式:数组, 数组每项包括: 电气工长,电气工长占比',
  `jd_kt_xf_jps_rate` double DEFAULT 0.5 COMMENT '空调消防给排水占机电工程设计量比例',
  `jd_dq_rate` double DEFAULT 0 COMMENT '电气机电占机电工程设计量比例',
	#'机电管理部';

	#设计管理部
	`sj_sjfatj_time` datetime DEFAULT NULL COMMENT '设计方案提交日期',
	`sj_sjfatj_time_desc` char(100) DEFAULT NULL COMMENT '设计方案提交日期相关说明',
	#
	`sj_sjbpttj_time` datetime DEFAULT NULL COMMENT '设计报批图提交日期',
	`sj_sjbpttj_time_desc` char(100)  DEFAULT NULL COMMENT '设计报批图提交日期:相关说明',
	#
	`sj_zxsgt_time` datetime DEFAULT NULL COMMENT '装修施工图提交日期:计划日期',
	`sj_zxsgt_time_desc` char(100)  DEFAULT NULL COMMENT '装修施工图提交日期:相关说明',	
	#
	`sj_zxjgt_time` datetime DEFAULT NULL COMMENT '装修竣工图提交时间:计划日期',
	`sj_zxjgt_time_desc` char(100)  DEFAULT NULL COMMENT '装修竣工图提交时间:相关说明',	
	#
  `sj_rlzy_gjsjs1`    tinyint(4) DEFAULT NULL COMMENT '人力资源:高级设计师1',
  `sj_rlzy_gjsjs1_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:高级设计师1 工作比例',
	`sj_rlzy_gjsjs1_desc`    char(100) DEFAULT NULL COMMENT '人力资源:高级设计师1  相关说明',
	`sj_rlzy_gjsjs2`    tinyint(4) DEFAULT NULL COMMENT '人力资源:高级设计师2',
	`sj_rlzy_gjsjs2_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:高级设计师2 工作比例',
	`sj_rlzy_gjsjs2_desc`   char(100) DEFAULT NULL COMMENT '人力资源:高级设计师2  相关说明',
	`sj_rlzy_xgsjs1`    tinyint(4) DEFAULT NULL COMMENT '人力资源:效果图设计师1',
	`sj_rlzy_xgsjs1_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:效果图设计师1 工作比例',
	`sj_rlzy_xgsjs1_desc`    char(100) DEFAULT NULL COMMENT '人力资源:效果图设计师1  相关说明',
	`sj_rlzy_xgsjs2`    tinyint(4) DEFAULT NULL COMMENT '人力资源:效果图设计师2',
	`sj_rlzy_xgsjs2_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:效果图设计师2 工作比例',
	`sj_rlzy_xgsjs2_desc`   char(100) DEFAULT NULL COMMENT '人力资源:效果图设计师2  相关说明',
	`sj_rlzy_sgtfzr1`    tinyint(4) DEFAULT NULL COMMENT '人力资源:施工图负责人1',
  `sj_rlzy_sgtfzr1_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:施工图负责人1 工作比例',
	`sj_rlzy_sgtfzr1_desc`    char(100) DEFAULT NULL COMMENT '人力资源:施工图负责人1  相关说明',
	`sj_rlzy_sgtfzr2`    tinyint(4) DEFAULT NULL COMMENT '人力资源:施工图负责人2',
	`sj_rlzy_sgtfzr2_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:施工图负责人2 工作比例',
	`sj_rlzy_sgtfzr2_desc`   char(100) DEFAULT NULL COMMENT '人力资源:施工图负责人2  相关说明',
	`sj_rlzy_sgtfzr3`    tinyint(4) DEFAULT NULL COMMENT '人力资源:施工图负责人3',
	`sj_rlzy_sgtfzr3_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:施工图负责人3 工作比例',
	`sj_rlzy_sgtfzr3_desc`    char(100) DEFAULT NULL COMMENT '人力资源:施工图负责人3  相关说明',
  #
	#
  `sj_tjsj_date_detail` longtext COMMENT 'JSON格式: 提交时间相关日期 包括5项：
		1.投标方案提交时间,
		2.大厦报审图首次提交时间,
		3.施工图提交时间,
		4.竣工图提交时间,
		5.竣工资料提交时间',
  `sj_sjgl_detail` longtext COMMENT '设计管理部人员明细-JSON格式:  包括6项：
		1.设计总负责人,
		2.效果图负责人,
		3.施工图设计负责人负责人列表, 格式:JSON数组, 数组每项包括: 负责人序号,负责人占比(占比总和为100%),
		4.设计方案书面效果负责人
		5.深化图设计负责人',
	#'设计管理部';

	#市场管理部
  `sc_pro_name` char(50) DEFAULT NULL COMMENT '项目名称',
  `sc_pro_qx` longtext COMMENT '项目权限',
  `sc_pro_type`  char(1) DEFAULT NULL COMMENT '项目类别',
  `sc_pro_trade_base` char(20) DEFAULT NULL COMMENT '项目行业:基本',
  `sc_pro_trade_ot` char(20) DEFAULT NULL COMMENT '项目行业:其他',
	`sc_cus_name` char(50) DEFAULT NULL COMMENT '客户名称',
	`sc_cus_type` char(1) DEFAULT NULL COMMENT '客户类型',
	`sc_cus_t_1` char(1) NOT NULL DEFAULT '0' COMMENT '客户类别1',
	`sc_cus_t_2` char(1) NOT NULL DEFAULT '0' COMMENT '客户类别2',
	`sc_mag_company_base` char(50)  DEFAULT NULL COMMENT '管理公司:基本',
	`sc_mag_company_ot` char(50)  DEFAULT NULL COMMENT '管理公司:其他',
	`sc_compety_company_base` char(50) DEFAULT NULL COMMENT '竞争对手:基本',
	`sc_compety_company_ot` char(50) DEFAULT NULL COMMENT '竞争对手:其他',
	`sc_pro_city` char(50) DEFAULT NULL COMMENT '项目城市',
	`sc_pro_address` char(100) DEFAULT NULL COMMENT '项目地点',
	`sc_invest_type` char(1) DEFAULT NULL COMMENT '投标类别',
	`sc_fb_time` datetime DEFAULT NULL COMMENT '发标日期',
	`sc_fb_time_desc` char(100) DEFAULT NULL COMMENT '发标日期相关说明',
	`sc_hb_time` datetime DEFAULT NULL COMMENT '回标日期',
	`sc_hb_time_desc` char(100) DEFAULT NULL COMMENT '回标日期相关说明',
	`sc_htqd_time` datetime DEFAULT NULL COMMENT '合同签订日期',
	`sc_htqd_time_desc` char(100) DEFAULT NULL COMMENT '合同签订日期相关说明',
	`sc_tbcl_fxh` char(1) NOT NULL DEFAULT '0' COMMENT '投标策略分析会',
	`sc_zb_flag` char(1) DEFAULT NULL COMMENT '中标状态',
	`sc_zb_time` datetime DEFAULT NULL COMMENT '中标日期',
	`sc_zb_time_desc` char(100) DEFAULT NULL COMMENT '中标日期相关说明',
	`sc_zb_amt` double DEFAULT NULL COMMENT '中标金额',
	`sc_zb_reason_base` char(50) DEFAULT NULL COMMENT '中标原因:基本',
	`sc_zb_reason_ot` char(50) DEFAULT NULL COMMENT '中标原因:其他',
	`sc_lb_reason_base` varchar(200) DEFAULT NULL COMMENT '落标原因:基本',
	`sc_lb_reason_ot` varchar(200) DEFAULT NULL COMMENT '落标原因:其他',
	`sc_ss_fgs` char(1) DEFAULT NULL COMMENT '项目实施分公司',
	`sc_sj_myd_1`      char(1) DEFAULT NULL COMMENT '客户满意度:设计1',
	`sc_sj_myd_1_desc` char(50) DEFAULT NULL COMMENT '客户满意度:设计1 相关说明',
	`sc_sj_myd_2`      char(1) DEFAULT NULL COMMENT '客户满意度:设计2',
	`sc_sj_myd_2_desc` char(50) DEFAULT NULL COMMENT '客户满意度:设计2 相关说明',
	`sc_sg_myd_1`      char(1) DEFAULT NULL COMMENT '客户满意度:施工1',
	`sc_sg_myd_1_desc` char(50) DEFAULT NULL COMMENT '客户满意度:施工1 相关说明',
	`sc_sg_myd_2`      char(1) DEFAULT NULL COMMENT '客户满意度:施工2',
	`sc_sg_myd_2_desc` char(50) DEFAULT NULL COMMENT '客户满意度:施工2 相关说明',
	#
	`sc_rlzy_scjl`    tinyint(4) DEFAULT NULL COMMENT '人力资源:市场经理',
	`sc_rlzy_scjl_desc`    char(100) DEFAULT NULL COMMENT '人力资源:市场经理 相关说明',
	`sc_rlzy_sczl`    tinyint(4) DEFAULT NULL COMMENT '人力资源:市场助理',
	`sc_rlzy_sczl_desc`    char(100) DEFAULT NULL COMMENT '人力资源:市场助理  相关说明',
	#
	
#	`sc_myd_all` tinyint(4) NOT NULL DEFAULT '0' COMMENT '客户满意度',
	`sc_myd_sub_detail` longtext COMMENT '满意度详细信息-JSON格式: , 包括: 
		1.设计满意度,满意度值,满意度附加信息,
		2.施工质量满意度,满意度值,满意度附加信息,
		3.服务态度满意度,满意度值,满意度附加信息,
		4.反应速度满意度,满意度值,满意度附加信息,
		5.机电功能满意度,满意度值,满意度附加信息,
		6.售后服务满意度,满意度值,满意度附加信息,
		7.客户整体满意度,满意度值,满意度附加信息,',
	`sc_tbtd_detail` longtext COMMENT 'JSON格式: 市场部投标团队人员明细 包括2项：
		1.市场部项目负责人,
		2.投标TEAM成员列表, 格式:数组, 数组每项包括: 人员名称 ',
	#'市场管理部';

	#预算管理部
  `ys_cw_bh` char(20) DEFAULT NULL COMMENT '项目财务编号',
  `ys_hetong_amt` double DEFAULT NULL COMMENT '合同金额',
  `ys_xm_mj` double DEFAULT NULL COMMENT '项目面积',
  `ys_xm_jmj` double DEFAULT NULL COMMENT '项目净面积',
  `ys_tb_mll` double DEFAULT NULL COMMENT '投标毛利率',
  `ys_kg_mll` double DEFAULT NULL COMMENT '开工毛利率',
#  `ys_nk_amt` double DEFAULT NULL COMMENT '内控金额',
	`ys_cg_nk_amt` double DEFAULT NULL COMMENT '采购内控金额',
	`ys_xc_nk_amt` double DEFAULT NULL COMMENT '现场内控金额',
		
	`ys_cg_nkt_tj_time` datetime DEFAULT NULL COMMENT '采购内控单提交时间',
	`ys_cg_nkt_tj_time_desc` char(100) DEFAULT NULL COMMENT '采购内控单提交时间:相关说明',
	`ys_xc_nkt_tj_time` datetime DEFAULT NULL COMMENT '现场内控单提交时间',
	`ys_xc_nkt_tj_time_desc` char(100) DEFAULT NULL COMMENT '现场内控单提交时间:相关说明',
  `ys_jswc_time` datetime DEFAULT NULL COMMENT '项目结算完成时间',
 	`ys_jswc_time_desc` char(100) DEFAULT NULL COMMENT '项目结算完成时间:相关说明',
#  `ys_all_vo` double DEFAULT NULL COMMENT '项目结算总VO',
#  `ys_all_amt` double DEFAULT NULL COMMENT '项目结算总金额',

#  `ys_fb_ht_all_amt` double DEFAULT NULL COMMENT '分包合同总金额',
#  `ys_fb_vo_all_amt` double DEFAULT NULL COMMENT '分包VO总金额',
#  `ys_fb_js_all_amt` double DEFAULT NULL COMMENT '分包结算总金额',
#  `ys_fb_cg_xc_rl_js_all_amt` double DEFAULT NULL COMMENT '分包采购现场及人力结算总金额',

	#前期费用
	`ys_qq_dwbj`  double DEFAULT NULL COMMENT '前期:对外报价',
	`ys_qq_customer_vo`  double DEFAULT NULL COMMENT '前期:客户VO',
	`ys_qq_nkje`  double DEFAULT NULL COMMENT '前期:内控金额',
	`ys_qq_sm`  char(100) DEFAULT NULL COMMENT '前期:说明',
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
	`ys_zx_sm`   char(100) DEFAULT NULL COMMENT '装修:相关说明',
	`ys_dq_sm`   char(100) DEFAULT NULL COMMENT '电气:相关说明',
	`ys_kt_sm`   char(100) DEFAULT NULL COMMENT '空调:相关说明',
	`ys_xf_sm`   char(100) DEFAULT NULL COMMENT '消防:相关说明',
	`ys_jps_sm`  char(100) DEFAULT NULL COMMENT '给排水:相关说明',
	`ys_it_sm`   char(100) DEFAULT NULL COMMENT 'IT:相关说明',
	`ys_sec_sm`  char(100) DEFAULT NULL COMMENT 'SEC:相关说明',
	`ys_av_sm`   char(100) DEFAULT NULL COMMENT 'AV:相关说明', 
	#采购
	`ys_cg_all_dwbj`  double DEFAULT NULL COMMENT '采购:对外报价',
	`ys_cg_all_nkje`  double DEFAULT NULL COMMENT '采购:内控金额',
	#直接人工成本
	`ys_rg_dwbj`  double DEFAULT NULL COMMENT '直接人工成本:对外报价',
	`ys_rg_nkje`  double DEFAULT NULL COMMENT '直接人工成本:内控金额',
	`ys_rg_sm`    char(100) DEFAULT NULL COMMENT '直接人工成本:相关说明', 
	#其他说明
	`ys_qt_sm`    char(100) DEFAULT NULL COMMENT '其他:相关说明', 
	
#  `ys_sj_mll` double DEFAULT NULL COMMENT '实际毛利率',
#	`ys_fb_fk_detail` longtext COMMENT '项目分包付款明细-JSON格式:  , 格式:数组, 数组每项包括：序号,比例,金额, 分包的付款由四部分组成：首付+进度+竣工结算+ 质保 ',

	`ys_fb_ht_all_amt` double DEFAULT NULL COMMENT '分包合同总金额',

  `ys_zx_sub_detail` longtext COMMENT 'JSON格式: 装修相关信息 包括: 
		1.装修工程合同报价,
		2.装修工程合同内控,
		3.装修工程合同预期毛利率(公式生成),
		4.装修分包合同价格,
		5.装修分包合同类型,
		6.装修分包,
		7.装修分包选定日期,
		8.装修分包评定,
		9.装修工程客户总VO,(项目预算控制子表自动生成),
		10.装修工程分包总VO,(项目预算控制子表自动生成),
		11.装修工程实际毛利率,(公式生成),
		12.装修工程客户VO明细, 格式:数组, 每一项包括：
			1)VO编号
			2)装修工程客户VO明细
			3)装修工程客户VO明细原因,',
  `ys_dq_sub_detail` longtext COMMENT 'JSON格式: 电气相关信息 结构和 zx_sub_detail 字段一致,',
  `ys_kt_sub_detail` longtext COMMENT 'JSON格式: 空调相关信息 结构和 zx_sub_detail 字段一致,',
  `ys_xf_sub_detail` longtext COMMENT 'JSON格式: 消防相关信息 结构和 zx_sub_detail 字段一致,',
  `ys_jps_sub_detail` longtext COMMENT 'JSON格式: 给排水相关信息 结构和 zx_sub_detail 字段一致,',
  `ys_it_sub_detail` longtext COMMENT 'JSON格式: IT相关信息 结构和 zx_sub_detail 字段一致,',
  `ys_af_sub_detail` longtext COMMENT 'JSON格式: 安防相关信息 结构和 zx_sub_detail 字段一致,',
  `ys_av_sub_detail` longtext COMMENT 'JSON格式: AV相关信息 结构和 zx_sub_detail 字段一致,',
  #
  `ys_rlzy_ysy1`    tinyint(4) DEFAULT NULL COMMENT '人力资源:预算员1',
  `ys_rlzy_ysy1_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:预算员1 工作比例',
	`ys_rlzy_ysy1_desc`    char(100) DEFAULT NULL COMMENT '人力资源:预算员1  相关说明',
	`ys_rlzy_ysy2`    tinyint(4) DEFAULT NULL COMMENT '人力资源:预算员2',
	`ys_rlzy_ysy2_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:预算员2 工作比例',
	`ys_rlzy_ysy2_desc`   char(100) DEFAULT NULL COMMENT '人力资源:预算员2  相关说明',
	`ys_rlzy_ysy3`    tinyint(4) DEFAULT NULL COMMENT '人力资源:预算员3',
	`ys_rlzy_ysy3_choose`  tinyint(4) DEFAULT NULL COMMENT '人力资源:预算员3 工作比例',
	`ys_rlzy_ysy3_desc`    char(100) DEFAULT NULL COMMENT '人力资源:预算员3  相关说明',
  #
  `ys_ysgl_detail` longtext COMMENT 'JSON格式: 预算管理部人员明细 包括6项：
		1.预算总负责人,
		2.预算负责人列表, 格式:JSON数组, 数组每项包括: 负责人序号,负责人占比(占比总和为100%),',
	#预算管理部
	
	
	  
	`status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '标识 1：新建 2:正常已经审核过 3.已经删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='项目总表';  

#######################################################################################################################################















