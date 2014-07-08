
DROP TABLE IF EXISTS `jb_fbs`;
CREATE TABLE `jb_fbs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fbs_name` char(20) NOT NULL COMMENT '�ְ�������',
  `fbs_type` char(5) NOT NULL COMMENT '�ְ�������',
  `lxr_name` char(20) NOT NULL COMMENT '��ϵ������',
  `lxr_phone` char(20) DEFAULT NULL COMMENT '��ϵ�˵绰',
  `email` char(30) DEFAULT NULL COMMENT '����',
	`status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '��ʶ 1���½� 2:�����Ѿ���� 3.�Ѿ�ɾ��',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='�ְ��̱�';

DROP TABLE IF EXISTS `jb_gys`;
CREATE TABLE `jb_gys` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `gys_name` char(20) NOT NULL COMMENT '��Ӧ������',
  `gys_type` char(5) NOT NULL COMMENT '��Ӧ������',
  `lxr_name` char(20) NOT NULL COMMENT '��ϵ������',
  `lxr_phone` char(20) DEFAULT NULL COMMENT '��ϵ�˵绰',
  `email` char(30) DEFAULT NULL COMMENT '����',
	`status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '��ʶ 1���½� 2:�����Ѿ���� 3.�Ѿ�ɾ��',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='��Ӧ�̱�';



DROP TABLE IF EXISTS `jb_alert`;
CREATE TABLE `jb_alert` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pro_id` char(20) NOT NULL COMMENT '��ĿID',
  `depsx` char(20) DEFAULT NULL COMMENT '�����б�',
  `msg` char(50) DEFAULT NULL COMMENT '������Ϣ',
	`alert_time` datetime DEFAULT NULL COMMENT '��������',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='������';

CREATE TABLE `jb_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` char(30) NOT NULL COMMENT '�û�����',
  `email` char(30) NOT NULL COMMENT '�����ʼ�,��Ϊ�û���¼��',
  `password` char(100) NOT NULL COMMENT '��¼����',
  `department` char(2) DEFAULT NULL COMMENT '����',
  `salary` double DEFAULT NULL COMMENT '����',
  `userflag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '�û���ʶ 1:��ͨ�û� 2.�û�����Ա',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '�û���ʶ 1���½���ע���û� 2:�����Ѿ���˹����û� 3.�Ѿ�ɾ���û�',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='�û���';

DROP TABLE IF EXISTS `jb_pro2user`;
CREATE TABLE `jb_pro2user` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pro_id` char(8) NOT NULL COMMENT '��ĿID',
  `user_id` INT(11) UNSIGNED NOT NULL COMMENT '�û�ID',
  `department` CHAR(2) COMMENT '����',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='��Ŀ2�û���';


DROP TABLE IF EXISTS `jb_cg_vo`;
CREATE TABLE `jb_cg_vo` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pro_id` char(30) NOT NULL COMMENT '��ĿID',
  `srctype` char(5) NOT NULL COMMENT '�ɹ� ����:װ��,����',
  `cg_name` char(30) NOT NULL COMMENT '�ɹ� ����',
  `cg_gys_name` char(5) NOT NULL COMMENT '��Ӧ������',
  `cg_ht_lx` char(1) NOT NULL COMMENT '�ɹ���ͬ����',
  `cg_je`  double NOT NULL COMMENT '�ɹ����',
  `cg_reson` char(1) NOT NULL COMMENT '�ɹ� ԭ��',
  `cg_desc` char(200) NOT NULL COMMENT '�ɹ� ����',
  `vo1_je`  double NOT NULL COMMENT 'VO1 �ɹ����',
  `vo1_reson` char(1) NOT NULL COMMENT 'VO1 �ɹ� ԭ��',
  `vo1_desc` char(200) NOT NULL COMMENT 'VO1 �ɹ� ����',
  `vo2_je`  double NOT NULL COMMENT 'VO2 �ɹ����',
  `vo2_reson` char(1) NOT NULL COMMENT 'VO2 �ɹ� ԭ��',
  `vo2_desc` char(200) NOT NULL COMMENT 'VO2 �ɹ� ����',
  `vo3_je`  double NOT NULL COMMENT 'VO3 �ɹ����',
  `vo3_reson` char(1) NOT NULL COMMENT 'VO3 �ɹ� ԭ��',
  `vo3_desc` char(200) NOT NULL COMMENT 'VO3 �ɹ� ����',
  `ys_pj` char(1) NOT NULL COMMENT '���ۣ�Ԥ�㲿',
  `sj_pj` char(1) NOT NULL COMMENT '���ۣ���Ʋ�',
  `jd_pj` char(1) NOT NULL COMMENT '���ۣ����粿',
  `gc_pj` char(1) NOT NULL COMMENT '���ۣ����̲�',
  `cg_pj` char(1) NOT NULL COMMENT '���ۣ��ɹ���',
  `sh_pj` char(1) NOT NULL COMMENT '���ۣ��ۺ�',

  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='�ɹ����� VO ��';

DROP TABLE IF EXISTS `jb_customer_vo`;
CREATE TABLE `jb_customer_vo` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pro_id` char(30) NOT NULL COMMENT '��ĿID',
  `vo_type` char(5) NOT NULL COMMENT 'VO ����',
  `vo_je`  double NOT NULL COMMENT 'VO�۸�',
  `vo_reson` char(1) NOT NULL COMMENT 'VO ԭ��',
  `vo_desc` char(200) NOT NULL COMMENT 'VO ����',

  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='�ͻ�VO��';

DROP TABLE IF EXISTS `jb_fb_vo`;
CREATE TABLE `jb_fb_vo` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pro_id` char(30) NOT NULL COMMENT '��ĿID',
  `vo_type` char(5) NOT NULL COMMENT 'VO ����',
  `vo_je`  double NOT NULL COMMENT 'VO�۸�',
  `vo_reson` char(1) NOT NULL COMMENT 'VO ԭ��',
  `vo_desc` char(200) NOT NULL COMMENT 'VO ����',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='�ְ�VO��';

DROP TABLE IF EXISTS `jb_zjl_fkyj`;
CREATE TABLE `jb_zjl_fkyj` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pro_id` char(30) NOT NULL COMMENT '��ĿID',
  `fk_bs` char(5) NOT NULL COMMENT 'Ԥ�Ƹ������',
  `fk_fb_rate_gc` double DEFAULT NULL COMMENT 'Ԥ�Ƹ���ռ�ְ���ͬ����',
  `fk_cl_rate_cg` double DEFAULT NULL COMMENT 'Ԥ�Ƹ���ռ���Ϻ�ͬ����',
  `fk_time` datetime DEFAULT NULL COMMENT 'Ԥ�Ƹ�������',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='�ʽ������� ����Ԥ�Ʊ�';

DROP TABLE IF EXISTS `jb_zjl_sksj`;
CREATE TABLE `jb_zjl_sksj` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pro_id` char(30) NOT NULL COMMENT '��ĿID',
  `sk_bs` char(5) NOT NULL COMMENT 'ʵ���տ����',
  `sk_je` double DEFAULT NULL COMMENT 'ʵ���տ���',
  `sk_time` datetime DEFAULT NULL COMMENT 'ʵ���տ�����',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='�ʽ������� �տ�ʵ�Ʊ�';

DROP TABLE IF EXISTS `jb_zjl_skyj`;
CREATE TABLE `jb_zjl_skyj` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pro_id` char(30) NOT NULL COMMENT '��ĿID',
  `sk_bs` char(5) NOT NULL COMMENT 'Ԥ���տ����',
  `sk_rate` double DEFAULT NULL COMMENT 'Ԥ���տ����',
  `sk_time` datetime DEFAULT NULL COMMENT 'Ԥ���տ�����',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='�ʽ������� �տ�Ԥ�Ʊ�';


DROP TABLE IF EXISTS `jb_gys_fbgl`;
CREATE TABLE `jb_gys_fbgl` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pro_id` char(30) NOT NULL COMMENT '��ĿID',
  `fb_lx` char(5) NOT NULL COMMENT '�ְ�����',
  `ys_fbs_name` char(5) NOT NULL COMMENT '�ְ�������',
  `ys_fb_ht_lx` char(1) NOT NULL COMMENT '�ְ���ͬ����',
  `ys_pj` char(1) NOT NULL COMMENT '���ۣ�Ԥ�㲿',
  `sj_pj` char(1) NOT NULL COMMENT '���ۣ���Ʋ�',
  `jd_pj` char(1) NOT NULL COMMENT '���ۣ����粿',
  `gc_pj` char(1) NOT NULL COMMENT '���ۣ����̲�',
  `cg_pj` char(1) NOT NULL COMMENT '���ۣ��ɹ���',
  `sh_pj` char(1) NOT NULL COMMENT '���ۣ��ۺ�',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='��Ӧ�̹��� �ְ������';

DROP TABLE IF EXISTS `jb_gczcjl`;
CREATE TABLE `jb_gczcjl` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT NULL COMMENT '¼����Ա',
  `department` char(2) DEFAULT NULL COMMENT '����',
  `pro_id` char(30) NOT NULL COMMENT '��ĿID',
  `in_type` char(5) NOT NULL COMMENT '���� ����',
  `in_sub_type` char(5) NOT NULL COMMENT '���� ������',
	`jyzj` varchar(1024) NOT NULL COMMENT '�����ܽ�',
	`ydwt` varchar(1024) NOT NULL COMMENT '��������������',
	`jjfa` varchar(1024) NOT NULL COMMENT '����Ľ������',
	`ckwj` varchar(1024) NOT NULL COMMENT '�ο���ѯ�ļ�',

  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='�����ʲ����۱�';
###########################################################################################################################################
DROP TABLE IF EXISTS `jb_project`;
CREATE TABLE `jb_project` (

  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pro_id` char(30) NOT NULL COMMENT '��ĿID',
  
  #�ۺ���񲿱�
  `sh_yjtime` datetime DEFAULT NULL COMMENT '���̲��ƽ��ۺ�����ƽ�����',
  `sh_zbjtime` datetime DEFAULT NULL COMMENT '�ʱ���������',
  `sh_zb_sub_detail` longtext COMMENT '�ʱ�����-JSON��ʽ: ����: ��Ŀ��ϸ����, ��Ŀ�ʱ�������ϸ����,��Ŀ�ʱ�����ԭ��',
	`sh_sh_myd_1`      char(1) DEFAULT NULL COMMENT '�ͻ������:�ۺ�1',
	`sh_sh_myd_1_desc` varchar(200) DEFAULT NULL COMMENT '�ͻ������:�ۺ�1 ���˵��',
	`sh_sh_myd_2`      char(1) DEFAULT NULL COMMENT '�ͻ������:�ۺ�2',
	`sh_sh_myd_2_desc` varchar(200) DEFAULT NULL COMMENT '�ͻ������:�ۺ�2 ���˵��',
	`sh_myd_all` int(2) NOT NULL DEFAULT '0' COMMENT '�ۺ���������ȣ�����ֵ�����㻻�㣩',
  `sh_myd_sub_detail` longtext COMMENT '�ۺ�����ȵ��������-JSON��ʽ: ����: ����,�ۺ�����ȵ��������ԭ��,�ۺ�����ȸ�����Ϣ',
	#'�ۺ���񲿱�';

	#�������±�
	`hr_follow_man` char(10) DEFAULT NULL COMMENT '������ٸ�����',
	#'�������±�';
	
	#��ͬ�����
	`ht_xmcwbh` char(50) DEFAULT NULL COMMENT '��Ŀ������',
	#'��ͬ�����';
	
	#�ɹ�����	
	#
	`cg_clbp_wc_time` datetime DEFAULT NULL COMMENT '���ϱ������ʱ��',
	`cg_clbp_wc_time_desc` char(100) DEFAULT NULL COMMENT '���ϱ������ʱ��:���˵��',
	#
	`cg_gckc_sjcb`  double DEFAULT NULL COMMENT '������漰���ǲ��ϲɹ�:ʵ�ʳɱ�',
	`cg_gcrgf_sjcb` double DEFAULT NULL COMMENT '�����˹����ܽ��:ʵ�ʳɱ�',
	`cg_gckc_sjcb_vo`  double DEFAULT NULL COMMENT '������漰���ǲ��ϲɹ�:ʵ�ʳɱ��仯',
	`cg_gcrgf_sjcb_vo` double DEFAULT NULL COMMENT '�����˹����ܽ��:ʵ�ʳɱ��仯',
	#
	`cg_zxclcg_sm`    varchar(200) DEFAULT NULL COMMENT 'װ�޲��ϲɹ�:  ���˵��',
	`cg_jdsbcg_sm`    varchar(200) DEFAULT NULL COMMENT '�����豸�ɹ�:  ���˵��',
	`cg_gckc_sm`      varchar(200) DEFAULT NULL COMMENT '������漰���ǲ��ϲɹ��ܽ��:  ���˵��',
	`cg_gcrgf_sm`     varchar(200) DEFAULT NULL COMMENT '�����˹���:  ���˵��',
	#
	`cg_rlzy_cgr1`    tinyint(4) DEFAULT NULL COMMENT '������Դ:�ɹ�Ա1',
	`cg_rlzy_cgr1_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:�ɹ�Ա1 ��������',
	`cg_rlzy_cgr1_desc`    varchar(200) DEFAULT NULL COMMENT '������Դ:�ɹ�Ա1  ���˵��',	
	`cg_rlzy_cgr2`    tinyint(4) DEFAULT NULL COMMENT '������Դ:�ɹ�Ա2',
	`cg_rlzy_cgr2_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:�ɹ�Ա2 ��������',
	`cg_rlzy_cgr2_desc`    varchar(200) DEFAULT NULL COMMENT '������Դ:�ɹ�Ա2  ���˵��',
	#
	#'�ɹ�����';

	#���̹���
  `gc_htqd_time` datetime DEFAULT NULL COMMENT '��ͬǩ������',
  `gc_customer_fkzq` int(11) DEFAULT NULL COMMENT '�ͻ��������� ��λ:��',
  `gc_pay_sh_pzsc` int(11) DEFAULT NULL COMMENT '���������׼ʱ�� ��λ:��',
  `gc_hetong_first_pay_rate` double DEFAULT NULL COMMENT '��ͬ�׸������',
	#
	`gc_jhkg_time` datetime DEFAULT NULL COMMENT '�ƻ���������',
	`gc_jhjg_time` datetime DEFAULT NULL COMMENT '�ƻ���������',
	#
	`gc_dsbptj_jh_time` datetime DEFAULT NULL COMMENT '���ñ����ύ����:�ƻ�',
	`gc_dsbptj_sj_time` datetime DEFAULT NULL COMMENT '���ñ����ύ����:ʵ��',
	`gc_dsbptj_time_desc` varchar(200) DEFAULT NULL COMMENT '���ñ����ύ����:���˵��',
	#
	`gc_dsbppz_time` datetime DEFAULT NULL COMMENT '���ñ�����׼����',
	`gc_dsbppz_time_desc` varchar(200) DEFAULT NULL COMMENT '���ñ�����׼����:���˵��',
	#
	`gc_xfbptj_jh_time` datetime DEFAULT NULL COMMENT '���������ύ����:�ƻ�',
	`gc_xfbptj_sj_time` datetime DEFAULT NULL COMMENT '���������ύ����:ʵ��',
	`gc_xfbptj_time_desc` varchar(200) DEFAULT NULL COMMENT '���������ύ����:���˵��',
	#
	`gc_xfbppz_time` datetime DEFAULT NULL COMMENT '����������׼����',
	`gc_xfbppz_time_desc` varchar(200) DEFAULT NULL COMMENT '����������׼����:���˵��',
	#
	`gc_kg_jh_time` datetime DEFAULT NULL COMMENT '��������:�ƻ�',
	`gc_kg_sj_time` datetime DEFAULT NULL COMMENT '��������:ʵ��',
	`gc_kg_time_desc` varchar(200) DEFAULT NULL COMMENT '��������:���˵��',
	#
	`gc_sl_time` datetime DEFAULT NULL COMMENT '��¥����',
	`gc_sl_time_desc` varchar(200) DEFAULT NULL COMMENT '��¥����:���˵��',
	#
	`gc_xfystj_jh_time` datetime DEFAULT NULL COMMENT '���������ύ����:�ƻ�',
	`gc_xfystj_sj_time` datetime DEFAULT NULL COMMENT '���������ύ����:ʵ��',
	`gc_xfystj_time_desc` varchar(200) DEFAULT NULL COMMENT '���������ύ����:���˵��',
	#
	`gc_xfyspz_time` datetime DEFAULT NULL COMMENT '����������׼����',
	`gc_xfyspz_time_desc` varchar(200) DEFAULT NULL COMMENT '����������׼����:���˵��',
	#
	`gc_gqyj_jh_time` datetime DEFAULT NULL COMMENT '��ǽ��������:�ƻ�',
	`gc_gqyj_sj_time` datetime DEFAULT NULL COMMENT '��ǽ��������:ʵ��',
	`gc_gqyj_time_desc` varchar(200) DEFAULT NULL COMMENT '��ǽ��������:���˵��',
	#
	`gc_jfyj_jh_time` datetime DEFAULT NULL COMMENT '�����ƽ�����:�ƻ�',
	`gc_jfyj_sj_time` datetime DEFAULT NULL COMMENT '�����ƽ�����:ʵ��',
	`gc_jfyj_time_desc` varchar(200) DEFAULT NULL COMMENT '�����ƽ�����:���˵��',
	#
	`gc_thyj_jh_time` datetime DEFAULT NULL COMMENT '�컨��������:�ƻ�',
	`gc_thyj_sj_time` datetime DEFAULT NULL COMMENT '�컨��������:ʵ��',
	`gc_thyj_time_desc` varchar(200) DEFAULT NULL COMMENT '�컨��������:���˵��',
	#
	`gc_xmwg_khys_jh_time` datetime DEFAULT NULL COMMENT '��Ŀ�깤����(�ͻ�����):�ƻ�',
	`gc_xmwg_khys_sj_time` datetime DEFAULT NULL COMMENT '��Ŀ�깤����(�ͻ�����):ʵ��',
	`gc_xmwg_khys_time_desc` varchar(200) DEFAULT NULL COMMENT '��Ŀ�깤����(�ͻ�����):���˵��',
	#
	`gc_xmyj_yyzbqjs_time` datetime DEFAULT NULL COMMENT '��Ŀ�ƽ�����(�����ʱ��ڼ���)',
	`gc_xmyj_yyzbqjs_time_desc` varchar(200) DEFAULT NULL COMMENT '��Ŀ�ƽ�����(�����ʱ��ڼ���):���˵��',
	#
	`gc_jgzltj_time` datetime DEFAULT NULL COMMENT '���������ύ����',
	`gc_jgzltj_time_desc` varchar(200) DEFAULT NULL COMMENT '���������ύ����:���˵��',
	#
	`gc_khbj_jh_time` datetime DEFAULT NULL COMMENT '�ͻ��������:�ƻ�',
	`gc_khbj_sj_time` datetime DEFAULT NULL COMMENT '�ͻ��������:ʵ��',
	`gc_khbj_time_desc` varchar(200) DEFAULT NULL COMMENT '�ͻ��������:���˵��',
	#
	`gc_yjsh_jh_time` datetime DEFAULT NULL COMMENT '�ƽ��ۺ�����:�ƻ�',
	`gc_yjsh_sj_time` datetime DEFAULT NULL COMMENT '�ƽ��ۺ�����:ʵ��',
	`gc_yjsh_time_desc` varchar(200) DEFAULT NULL COMMENT '�ƽ��ۺ�����:���˵��',
	#
	`gc_zbqm_time` datetime DEFAULT NULL COMMENT '�ʱ�����ʱ��',
	`gc_zbqm_time_desc` varchar(200) DEFAULT NULL COMMENT '�ʱ�����ʱ��:���˵��',
	#
	`gc_rlzy_xmzj`    tinyint(4) DEFAULT NULL COMMENT '������Դ:��Ŀ�ܼ�',
  `gc_rlzy_xmzj_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:��Ŀ�ܼ� ��������',
	`gc_rlzy_xmzj_desc`    varchar(200) DEFAULT NULL COMMENT '������Դ:��Ŀ�ܼ�  ���˵��',
	`gc_rlzy_xmxc1`    tinyint(4) DEFAULT NULL COMMENT '������Դ:��Ŀ����',
	`gc_rlzy_xmxc1_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:��Ŀ���� ��������',
	`gc_rlzy_xmxc1_desc`   varchar(200) DEFAULT NULL COMMENT '������Դ:��Ŀ����  ���˵��',
	`gc_rlzy_xmxc2`    tinyint(4) DEFAULT NULL COMMENT '������Դ:�ֳ�����',
	`gc_rlzy_xmxc2_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:�ֳ����� ��������',
	`gc_rlzy_xmxc2_desc`    varchar(200) DEFAULT NULL COMMENT '������Դ:�ֳ�����  ���˵��',
	`gc_rlzy_zxgz1`    tinyint(4) DEFAULT NULL COMMENT '������Դ:װ�޹���1',
	`gc_rlzy_zxgz1_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:װ�޹���1 ��������',
	`gc_rlzy_zxgz1_desc`    varchar(200) DEFAULT NULL COMMENT '������Դ:װ�޹���1  ���˵��',
	`gc_rlzy_zxgz2`    tinyint(4) DEFAULT NULL COMMENT '������Դ:װ�޹���2',
	`gc_rlzy_zxgz2_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:װ�޹���2 ��������',
	`gc_rlzy_zxgz2_desc`    varchar(200) DEFAULT NULL COMMENT '������Դ:װ�޹���2  ���˵��',
	`gc_rlzy_zxgz3`    tinyint(4) DEFAULT NULL COMMENT '������Դ:װ�޹���3',
	`gc_rlzy_zxgz3_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:װ�޹���3 ��������',
	`gc_rlzy_zxgz3_desc`    varchar(200) DEFAULT NULL COMMENT '������Դ:װ�޹���3  ���˵��',
	`gc_rlzy_aqy1`    tinyint(4) DEFAULT NULL COMMENT '������Դ:��ȫԱ1',
	`gc_rlzy_aqy1_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:��ȫԱ1 ��������',
	`gc_rlzy_aqy1_desc`    varchar(200) DEFAULT NULL COMMENT '������Դ:��ȫԱ1  ���˵��',
	`gc_rlzy_aqy2`    tinyint(4) DEFAULT NULL COMMENT '������Դ:��ȫԱ2',
	`gc_rlzy_aqy2_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:��ȫԱ2 ��������',
	`gc_rlzy_aqy2_desc`    varchar(200) DEFAULT NULL COMMENT '������Դ:��ȫԱ2  ���˵��',
	`gc_rlzy_aqy3`    tinyint(4) DEFAULT NULL COMMENT '������Դ:��ȫԱ3',
	`gc_rlzy_aqy3_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:��ȫԱ3 ��������',
	`gc_rlzy_aqy3_desc`    varchar(200) DEFAULT NULL COMMENT '������Դ:��ȫԱ3  ���˵��',
	`gc_rlzy_kfbj1`    tinyint(4) DEFAULT NULL COMMENT '������Դ:�ⷿ�����ฺ����1',
	`gc_rlzy_kfbj1_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:�ⷿ�����ฺ����1 ��������',
	`gc_rlzy_kfbj1_desc`    varchar(200) DEFAULT NULL COMMENT '������Դ:�ⷿ�����ฺ����1  ���˵��',
	`gc_rlzy_kfbj2`    tinyint(4) DEFAULT NULL COMMENT '������Դ:�ⷿ�����ฺ����2',
	`gc_rlzy_kfbj2_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:�ⷿ�����ฺ����2 ��������',
	`gc_rlzy_kfbj2_desc`    varchar(200) DEFAULT NULL COMMENT '������Դ:�ⷿ�����ฺ����2  ���˵��',
	`gc_rlzy_gczl`    tinyint(4) DEFAULT NULL COMMENT '������Դ:��������',
	`gc_rlzy_gczl_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:�������� ��������',
	`gc_rlzy_gczl_desc`    varchar(200) DEFAULT NULL COMMENT '������Դ:��������  ���˵��',
	#
	#'���̹���';
	
	#�������
	`jd_jdfatj_time` datetime DEFAULT NULL COMMENT '���緽���ύ����',
	`jd_jdfatj_time_desc` varchar(200) DEFAULT NULL COMMENT '���緽���ύ�������˵��',
	#
	`jd_jdbpttj_time` datetime DEFAULT NULL COMMENT '���籨��ͼ�ύ����',
	`jd_jdbpttj_time_desc` varchar(200)  DEFAULT NULL COMMENT '���籨��ͼ�ύ����:���˵��',
	#
	`jd_jdsgttj_time` datetime DEFAULT NULL COMMENT '����ʩ��ͼ�ύ����',
	`jd_jdsgttj_time_desc` varchar(200)  DEFAULT NULL COMMENT '����ʩ��ͼ�ύ����:���˵��',
	#
	`jd_jdjgttj_time` datetime DEFAULT NULL COMMENT '���翢��ͼ�ύʱ��',
	`jd_jdjgttj_time_desc` varchar(200)  DEFAULT NULL COMMENT '���翢��ͼ�ύʱ��:���˵��',
	#
	`jd_rlzy_jdzfzr`    tinyint(4) DEFAULT NULL COMMENT '������Դ:�����ܸ�����',
	`jd_rlzy_jdzfzr_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:�����ܸ����� ��������',
	`jd_rlzy_jdzfzr_desc`    varchar(200)) DEFAULT NULL COMMENT '������Դ:�����ܸ�����  ���˵��',
	`jd_rlzy_ktxfjpssj1`    tinyint(4) DEFAULT NULL COMMENT '������Դ:�յ���������ˮ���1',
	`jd_rlzy_ktxfjpssj1_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:�յ���������ˮ���1 ��������',
	`jd_rlzy_ktxfjpssj1_desc`    varchar(200) DEFAULT NULL COMMENT '������Դ:�յ���������ˮ���1  ���˵��',
	`jd_rlzy_ktxfjpssj2`    tinyint(4) DEFAULT NULL COMMENT '������Դ:�յ���������ˮ���2',
	`jd_rlzy_ktxfjpssj2_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:�յ���������ˮ���2 ��������',
	`jd_rlzy_ktxfjpssj2_desc`    varchar(200) DEFAULT NULL COMMENT '������Դ:�յ���������ˮ���2  ���˵��',
	`jd_rlzy_ktxfjpssj3`    tinyint(4) DEFAULT NULL COMMENT '������Դ:�յ���������ˮ���3',
	`jd_rlzy_ktxfjpssj3_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:�յ���������ˮ���3 ��������',
	`jd_rlzy_ktxfjpssj3_desc`    varchar(200) DEFAULT NULL COMMENT '������Դ:�յ���������ˮ���3  ���˵��',
	`jd_rlzy_dqsj1`    tinyint(4) DEFAULT NULL COMMENT '������Դ:�������1',
	`jd_rlzy_dqsj1_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:�������1 ��������',
	`jd_rlzy_dqsj1_desc`    varchar(200) DEFAULT NULL COMMENT '������Դ:�������1  ���˵��',
	`jd_rlzy_dqsj2`    tinyint(4) DEFAULT NULL COMMENT '������Դ:�������2',
	`jd_rlzy_dqsj2_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:�������2 ��������',
	`jd_rlzy_dqsj2_desc`    varchar(200) DEFAULT NULL COMMENT '������Դ:�������2  ���˵��',
	`jd_rlzy_dqsj3`    tinyint(4) DEFAULT NULL COMMENT '������Դ:�������3',
	`jd_rlzy_dqsj3_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:�������3 ��������',
	`jd_rlzy_dqsj3_desc`    varchar(200) DEFAULT NULL COMMENT '������Դ:�������3  ���˵��',
	`jd_rlzy_jdgz1`    tinyint(4) DEFAULT NULL COMMENT '������Դ:���繤��1',
	`jd_rlzy_jdgz1_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:���繤��1 ��������',
	`jd_rlzy_jdgz1_desc`    varchar(200) DEFAULT NULL COMMENT '������Դ:���繤��1  ���˵��',					
	`jd_rlzy_jdgz2`    tinyint(4) DEFAULT NULL COMMENT '������Դ:���繤��2',
	`jd_rlzy_jdgz2_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:���繤��2 ��������',
	`jd_rlzy_jdgz2_desc`    varchar(200) DEFAULT NULL COMMENT '������Դ:���繤��2  ���˵��',		
	`jd_rlzy_jdgz3`    tinyint(4) DEFAULT NULL COMMENT '������Դ:���繤��3',
	`jd_rlzy_jdgz3_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:���繤��3 ��������',
	`jd_rlzy_jdgz3_desc`    varchar(200) DEFAULT NULL COMMENT '������Դ:���繤��3  ���˵��',							
	#'�������';

	#��ƹ���
	`sj_sjfatj_time` datetime DEFAULT NULL COMMENT '��Ʒ����ύ����',
	`sj_sjfatj_time_desc` varchar(200) DEFAULT NULL COMMENT '��Ʒ����ύ�������˵��',
	#
	`sj_sjbpttj_time` datetime DEFAULT NULL COMMENT '��Ʊ���ͼ�ύ����',
	`sj_sjbpttj_time_desc` varchar(200)  DEFAULT NULL COMMENT '��Ʊ���ͼ�ύ����:���˵��',
	#
	`sj_zxsgt_time` datetime DEFAULT NULL COMMENT 'װ��ʩ��ͼ�ύ����:�ƻ�����',
	`sj_zxsgt_time_desc` varchar(200)  DEFAULT NULL COMMENT 'װ��ʩ��ͼ�ύ����:���˵��',	
	#
	`sj_zxjgt_time` datetime DEFAULT NULL COMMENT 'װ�޿���ͼ�ύʱ��:�ƻ�����',
	`sj_zxjgt_time_desc` varchar(200)  DEFAULT NULL COMMENT 'װ�޿���ͼ�ύʱ��:���˵��',	
	#
  `sj_rlzy_gjsjs1`    tinyint(4) DEFAULT NULL COMMENT '������Դ:�߼����ʦ1',
  `sj_rlzy_gjsjs1_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:�߼����ʦ1 ��������',
	`sj_rlzy_gjsjs1_desc`    varchar(200) DEFAULT NULL COMMENT '������Դ:�߼����ʦ1  ���˵��',
	`sj_rlzy_gjsjs2`    tinyint(4) DEFAULT NULL COMMENT '������Դ:�߼����ʦ2',
	`sj_rlzy_gjsjs2_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:�߼����ʦ2 ��������',
	`sj_rlzy_gjsjs2_desc`   varchar(200) DEFAULT NULL COMMENT '������Դ:�߼����ʦ2  ���˵��',
	`sj_rlzy_xgsjs1`    tinyint(4) DEFAULT NULL COMMENT '������Դ:Ч��ͼ���ʦ1',
	`sj_rlzy_xgsjs1_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:Ч��ͼ���ʦ1 ��������',
	`sj_rlzy_xgsjs1_desc`    varchar(200) DEFAULT NULL COMMENT '������Դ:Ч��ͼ���ʦ1  ���˵��',
	`sj_rlzy_xgsjs2`    tinyint(4) DEFAULT NULL COMMENT '������Դ:Ч��ͼ���ʦ2',
	`sj_rlzy_xgsjs2_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:Ч��ͼ���ʦ2 ��������',
	`sj_rlzy_xgsjs2_desc`   varchar(200) DEFAULT NULL COMMENT '������Դ:Ч��ͼ���ʦ2  ���˵��',
	`sj_rlzy_sgtfzr1`    tinyint(4) DEFAULT NULL COMMENT '������Դ:ʩ��ͼ������1',
  `sj_rlzy_sgtfzr1_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:ʩ��ͼ������1 ��������',
	`sj_rlzy_sgtfzr1_desc`    varchar(200) DEFAULT NULL COMMENT '������Դ:ʩ��ͼ������1  ���˵��',
	`sj_rlzy_sgtfzr2`    tinyint(4) DEFAULT NULL COMMENT '������Դ:ʩ��ͼ������2',
	`sj_rlzy_sgtfzr2_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:ʩ��ͼ������2 ��������',
	`sj_rlzy_sgtfzr2_desc`   varchar(200) DEFAULT NULL COMMENT '������Դ:ʩ��ͼ������2  ���˵��',
	`sj_rlzy_sgtfzr3`    tinyint(4) DEFAULT NULL COMMENT '������Դ:ʩ��ͼ������3',
	`sj_rlzy_sgtfzr3_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:ʩ��ͼ������3 ��������',
	`sj_rlzy_sgtfzr3_desc`    varchar(200) DEFAULT NULL COMMENT '������Դ:ʩ��ͼ������3  ���˵��',
	#'��ƹ���';
	
	#�г�����
  `sc_pro_name` char(50) DEFAULT NULL COMMENT '��Ŀ����',
  `sc_pro_qx` longtext COMMENT '��ĿȨ��',
  `sc_pro_type`  char(1) DEFAULT NULL COMMENT '��Ŀ���',
  `sc_pro_trade` char(20) DEFAULT NULL COMMENT '��Ŀ��ҵ',
  `sc_pro_trade_base` char(20) DEFAULT NULL COMMENT '��Ŀ��ҵ:����',
  `sc_pro_trade_ot` char(20) DEFAULT NULL COMMENT '��Ŀ��ҵ:����',
	`sc_cus_name` char(50) DEFAULT NULL COMMENT '�ͻ�����',
	`sc_cus_type` char(1) DEFAULT NULL COMMENT '�ͻ�����',
	`sc_cus_t_1` char(1) NOT NULL DEFAULT '0' COMMENT '�ͻ����1',
	`sc_cus_t_2` char(1) NOT NULL DEFAULT '0' COMMENT '�ͻ����2',
	`sc_mag_company` char(50)  DEFAULT NULL COMMENT '����˾',
	`sc_mag_company_base` char(50)  DEFAULT NULL COMMENT '����˾:����',
	`sc_mag_company_ot` char(50)  DEFAULT NULL COMMENT '����˾:����',
	`sc_compety_company` char(50) DEFAULT NULL COMMENT '��������',
	`sc_compety_company_base` char(50) DEFAULT NULL COMMENT '��������:����',
	`sc_compety_company_ot` char(50) DEFAULT NULL COMMENT '��������:����',
	`sc_pro_city` char(50) DEFAULT NULL COMMENT '��Ŀ����',
	`sc_pro_address` char(100) DEFAULT NULL COMMENT '��Ŀ�ص�',
	`sc_invest_type` char(1) DEFAULT NULL COMMENT 'Ͷ�����',
	`sc_fb_time` datetime DEFAULT NULL COMMENT '��������',
	`sc_fb_time_desc` varchar(200) DEFAULT NULL COMMENT '�����������˵��',
	`sc_hb_time` datetime DEFAULT NULL COMMENT '�ر�����',
	`sc_hb_time_desc` varchar(200) DEFAULT NULL COMMENT '�ر��������˵��',
	`sc_htqd_time` datetime DEFAULT NULL COMMENT '��ͬǩ������',
	`sc_htqd_time_desc` varchar(200) DEFAULT NULL COMMENT '��ͬǩ���������˵��',
	`sc_tbcl_fxh` char(1) NOT NULL DEFAULT '0' COMMENT 'Ͷ����Է�����',
	`sc_zb_flag` char(1) DEFAULT NULL COMMENT '�б�״̬',
	`sc_zb_time` datetime DEFAULT NULL COMMENT '�б�����',
	`sc_zb_time_desc` char(100) DEFAULT NULL COMMENT '�б��������˵��',
	`sc_zb_amt` double DEFAULT NULL COMMENT '�б���',
	`sc_zb_reason_base` char(50) DEFAULT NULL COMMENT '�б�ԭ��:����',
	`sc_zb_reason_ot` varchar(200) DEFAULT NULL COMMENT '�б�ԭ��:����',
	`sc_lb_reason_base` varchar(200) DEFAULT NULL COMMENT '���ԭ��:����',
	`sc_lb_reason_ot` varchar(200) DEFAULT NULL COMMENT '���ԭ��:����',
	`sc_ss_fgs` char(1) DEFAULT NULL COMMENT '��Ŀʵʩ�ֹ�˾',
	`sc_sj_myd_1`      char(1) DEFAULT NULL COMMENT '�ͻ������:���1',
	`sc_sj_myd_1_desc` varchar(200) DEFAULT NULL COMMENT '�ͻ������:���1 ���˵��',
	`sc_sj_myd_2`      char(1) DEFAULT NULL COMMENT '�ͻ������:���2',
	`sc_sj_myd_2_desc` varchar(200) DEFAULT NULL COMMENT '�ͻ������:���2 ���˵��',
	`sc_sg_myd_1`      char(1) DEFAULT NULL COMMENT '�ͻ������:ʩ��1',
	`sc_sg_myd_1_desc` varchar(200) DEFAULT NULL COMMENT '�ͻ������:ʩ��1 ���˵��',
	`sc_sg_myd_2`      char(1) DEFAULT NULL COMMENT '�ͻ������:ʩ��2',
	`sc_sg_myd_2_desc` varchar(200) DEFAULT NULL COMMENT '�ͻ������:ʩ��2 ���˵��',
	#
	`sc_rlzy_scjl`    tinyint(4) DEFAULT NULL COMMENT '������Դ:�г�����',
	`sc_rlzy_scjl_desc`    varchar(200) DEFAULT NULL COMMENT '������Դ:�г����� ���˵��',
	`sc_rlzy_sczl`    tinyint(4) DEFAULT NULL COMMENT '������Դ:�г�����',
	`sc_rlzy_sczl_desc`    varchar(200) DEFAULT NULL COMMENT '������Դ:�г�����  ���˵��',
	#
	#'�г�����';

	#Ԥ�����
  `ys_cw_bh` char(20) DEFAULT NULL COMMENT '��Ŀ������',
  `ys_hetong_amt` double DEFAULT NULL COMMENT '��ͬ���',
  `ys_xm_mj` double DEFAULT NULL COMMENT '��Ŀ���',
  `ys_xm_jmj` double DEFAULT NULL COMMENT '��Ŀ�����',
  `ys_tb_mll` double DEFAULT NULL COMMENT 'Ͷ��ë����',
  `ys_kg_mll` double DEFAULT NULL COMMENT '����ë����',
	`ys_cg_nk_amt` double DEFAULT NULL COMMENT '�ɹ��ڿؽ��',
	`ys_xc_nk_amt` double DEFAULT NULL COMMENT '�ֳ��ڿؽ��',
		
	`ys_cg_nkt_tj_time` datetime DEFAULT NULL COMMENT '�ɹ��ڿص��ύʱ��',
	`ys_cg_nkt_tj_time_desc` varchar(200) DEFAULT NULL COMMENT '�ɹ��ڿص��ύʱ��:���˵��',
	`ys_xc_nkt_tj_time` datetime DEFAULT NULL COMMENT '�ֳ��ڿص��ύʱ��',
	`ys_xc_nkt_tj_time_desc` varchar(200) DEFAULT NULL COMMENT '�ֳ��ڿص��ύʱ��:���˵��',
  `ys_jswc_time` datetime DEFAULT NULL COMMENT '��Ŀ�������ʱ��',
 	`ys_jswc_time_desc` varchar(200) DEFAULT NULL COMMENT '��Ŀ�������ʱ��:���˵��',

	#ǰ�ڷ���
	`ys_qq_dwbj`  double DEFAULT NULL COMMENT 'ǰ��:���ⱨ��',
	`ys_qq_customer_vo`  double DEFAULT NULL COMMENT 'ǰ��:�ͻ�VO',
	`ys_qq_nkje`  double DEFAULT NULL COMMENT 'ǰ��:�ڿؽ��',
	`ys_qq_sm`  varchar(200) DEFAULT NULL COMMENT 'ǰ��:˵��',
	#���ⱨ��
	`ys_zx_dwbj`  double DEFAULT NULL COMMENT 'װ��:���ⱨ��',
	`ys_dq_dwbj`  double DEFAULT NULL COMMENT '����:���ⱨ��',
	`ys_kt_dwbj`  double DEFAULT NULL COMMENT '�յ�:���ⱨ��',
	`ys_xf_dwbj`  double DEFAULT NULL COMMENT '����:���ⱨ��',
	`ys_jps_dwbj` double DEFAULT NULL COMMENT '����ˮ:���ⱨ��',
	`ys_it_dwbj`  double DEFAULT NULL COMMENT 'IT:���ⱨ��',
	`ys_sec_dwbj` double DEFAULT NULL COMMENT 'SEC:���ⱨ��',
	`ys_av_dwbj`  double DEFAULT NULL COMMENT 'AV:���ⱨ��',
	#�ڿؽ��
	`ys_zx_nkje`  double DEFAULT NULL COMMENT 'װ��:�ڿؽ��',
	`ys_dq_nkje`  double DEFAULT NULL COMMENT '����:�ڿؽ��',
	`ys_kt_nkje`  double DEFAULT NULL COMMENT '�յ�:�ڿؽ��',
	`ys_xf_nkje`  double DEFAULT NULL COMMENT '����:�ڿؽ��',
	`ys_jps_nkje` double DEFAULT NULL COMMENT '����ˮ:�ڿؽ��',
	`ys_it_nkje`  double DEFAULT NULL COMMENT 'IT:�ڿؽ��',
	`ys_sec_nkje` double DEFAULT NULL COMMENT 'SEC:�ڿؽ��',
	`ys_av_nkje`  double DEFAULT NULL COMMENT 'AV:�ڿؽ��',
	#ʵ�ʳɱ�
	`ys_zx_sjcb`  double DEFAULT NULL COMMENT 'װ��:ʵ�ʳɱ�',
	`ys_dq_sjcb`  double DEFAULT NULL COMMENT '����:ʵ�ʳɱ�',
	`ys_kt_sjcb`  double DEFAULT NULL COMMENT '�յ�:ʵ�ʳɱ�',
	`ys_xf_sjcb`  double DEFAULT NULL COMMENT '����:ʵ�ʳɱ�',
	`ys_jps_sjcb` double DEFAULT NULL COMMENT '����ˮ:ʵ�ʳɱ�',
	`ys_it_sjcb`  double DEFAULT NULL COMMENT 'IT:ʵ�ʳɱ�',
	`ys_sec_sjcb` double DEFAULT NULL COMMENT 'SEC:ʵ�ʳɱ�',
	`ys_av_sjcb`  double DEFAULT NULL COMMENT 'AV:ʵ�ʳɱ�',
	#���˵��
	`ys_zx_sm`   varchar(200) DEFAULT NULL COMMENT 'װ��:���˵��',
	`ys_dq_sm`   varchar(200) DEFAULT NULL COMMENT '����:���˵��',
	`ys_kt_sm`   varchar(200) DEFAULT NULL COMMENT '�յ�:���˵��',
	`ys_xf_sm`   varchar(200) DEFAULT NULL COMMENT '����:���˵��',
	`ys_jps_sm`  varchar(200) DEFAULT NULL COMMENT '����ˮ:���˵��',
	`ys_it_sm`   varchar(200) DEFAULT NULL COMMENT 'IT:���˵��',
	`ys_sec_sm`  varchar(200) DEFAULT NULL COMMENT 'SEC:���˵��',
	`ys_av_sm`   varchar(200) DEFAULT NULL COMMENT 'AV:���˵��', 
	#�ɹ�
	`ys_cg_all_dwbj`  double DEFAULT NULL COMMENT '�ɹ�:���ⱨ��',
	`ys_cg_all_nkje`  double DEFAULT NULL COMMENT '�ɹ�:�ڿؽ��',
	#ֱ���˹��ɱ�
	`ys_rg_dwbj`  double DEFAULT NULL COMMENT 'ֱ���˹��ɱ�:���ⱨ��',
	`ys_rg_nkje`  double DEFAULT NULL COMMENT 'ֱ���˹��ɱ�:�ڿؽ��',
	`ys_rg_sm`    varchar(200) DEFAULT NULL COMMENT 'ֱ���˹��ɱ�:���˵��', 
	#����˵��
	`ys_qt_sm`    varchar(200) DEFAULT NULL COMMENT '����:���˵��', 
	
	#
	`ys_fb_ht_all_amt` double DEFAULT NULL COMMENT '�ְ���ͬ�ܽ��',
  #
  `ys_rlzy_ysy1`    tinyint(4) DEFAULT NULL COMMENT '������Դ:Ԥ��Ա1',
  `ys_rlzy_ysy1_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:Ԥ��Ա1 ��������',
	`ys_rlzy_ysy1_desc`    varchar(200) DEFAULT NULL COMMENT '������Դ:Ԥ��Ա1  ���˵��',
	`ys_rlzy_ysy2`    tinyint(4) DEFAULT NULL COMMENT '������Դ:Ԥ��Ա2',
	`ys_rlzy_ysy2_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:Ԥ��Ա2 ��������',
	`ys_rlzy_ysy2_desc`   varchar(200) DEFAULT NULL COMMENT '������Դ:Ԥ��Ա2  ���˵��',
	`ys_rlzy_ysy3`    tinyint(4) DEFAULT NULL COMMENT '������Դ:Ԥ��Ա3',
	`ys_rlzy_ysy3_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:Ԥ��Ա3 ��������',
	`ys_rlzy_ysy3_desc`    varchar(200) DEFAULT NULL COMMENT '������Դ:Ԥ��Ա3  ���˵��',
  #
	#Ԥ�����
	
	
	`status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '��ʶ 1���½� 2:�����Ѿ���˹� 3.�Ѿ�ɾ��',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='��Ŀ�ܱ�';  

#######################################################################################################################################















