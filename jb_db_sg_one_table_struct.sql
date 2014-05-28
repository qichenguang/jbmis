
CREATE TABLE `jb_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` char(30) NOT NULL COMMENT '�û�����',
  `email` char(30) NOT NULL COMMENT '�����ʼ�,��Ϊ�û���¼��',
  `password` char(100) NOT NULL COMMENT '��¼����',
  `department` char(2) DEFAULT NULL COMMENT '����',
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


DROP TABLE IF EXISTS `jb_customer_vo`;
CREATE TABLE `jb_customer_vo` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pro_id` char(8) NOT NULL COMMENT '��ĿID',
  `vo_type` char(5) NOT NULL COMMENT 'VO ����',
  `vo_desc` char(200) NOT NULL COMMENT 'VO ����',
  `vo_reson` char(1) NOT NULL COMMENT 'VO ԭ��',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='�ͻ�VO��';
###########################################################################################################################################
DROP TABLE IF EXISTS `jb_project`;
CREATE TABLE `jb_project` (

  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pro_id` char(8) NOT NULL COMMENT '��ĿID',
  
  #�ۺ���񲿱�
  `sh_yjtime` datetime DEFAULT NULL COMMENT '���̲��ƽ��ۺ�����ƽ�����',
  `sh_zbjtime` datetime DEFAULT NULL COMMENT '�ʱ���������',
#	`sh_zb_all_amt` double DEFAULT NULL COMMENT '��Ŀ�ʱ��ܷ���',
  `sh_zb_sub_detail` longtext COMMENT '�ʱ�����-JSON��ʽ: ����: ��Ŀ��ϸ����, ��Ŀ�ʱ�������ϸ����,��Ŀ�ʱ�����ԭ��',
#	`sh_myd_amt` double DEFAULT NULL COMMENT '�ۺ������ƽ��ֵ',
	`sh_sh_myd_1`      char(1) DEFAULT NULL COMMENT '�ͻ������:�ۺ�1',
	`sh_sh_myd_1_desc` char(50) DEFAULT NULL COMMENT '�ͻ������:�ۺ�1 ���˵��',
	`sh_sh_myd_2`      char(1) DEFAULT NULL COMMENT '�ͻ������:�ۺ�2',
	`sh_sh_myd_2_desc` char(50) DEFAULT NULL COMMENT '�ͻ������:�ۺ�2 ���˵��',
	`sh_myd_all` int(2) NOT NULL DEFAULT '0' COMMENT '�ۺ���������ȣ�����ֵ�����㻻�㣩',
  `sh_myd_sub_detail` longtext COMMENT '�ۺ�����ȵ��������-JSON��ʽ: ����: ����,�ۺ�����ȵ��������ԭ��,�ۺ�����ȸ�����Ϣ',
	#'�ۺ���񲿱�';

	#�������±�
#	`hr_hetong_daozhang_all_amt` double DEFAULT NULL COMMENT '�ͻ���ͬ�����ܽ��',
#	`hr_hetong_daozhang_rate` double DEFAULT NULL COMMENT '�ͻ���ͬ���˱���',
#	`hr_hetong_js_daozhang_rate` double DEFAULT NULL COMMENT '�ͻ���ͬ�����ܶ�˱���',
#	`hr_hetong_daozhang_sub_detail` longtext COMMENT 'JSON��ʽ: ���,�ͻ���ͬ���˽��,����ʱ��',
	`hr_follow_man` char(10) DEFAULT NULL COMMENT '������ٸ�����',
	#'�������±�';

	#�ɹ�����	
	#
	`cg_clbp_wc_time` datetime DEFAULT NULL COMMENT '���ϱ������ʱ��',
	`cg_clbp_wc_time_desc` char(100) DEFAULT NULL COMMENT '���ϱ������ʱ��:���˵��',
	#
#	`cg_buy_all_amt` double DEFAULT NULL COMMENT '�ɹ��ܽ��',
#	`cg_buy_zscl_all_amt` double DEFAULT NULL COMMENT 'װ�β��ϲɹ��ܽ��',
#	`cg_buy_jdsb_all_amt` double DEFAULT NULL COMMENT '�����豸���ϲɹ��ܽ��',
	`cg_buy_gckc_all_amt` double DEFAULT NULL COMMENT '������漰���ǲ��ϲɹ��ܽ��',
	`cg_buy_gcrgf_all_amt` double DEFAULT NULL COMMENT '�����˹����ܽ��',
	`cg_buy_zscl_sub_detail` longtext COMMENT 'JSON��ʽ: װ�β��ϲɹ���ϸ, ��ʽ:����, ����ÿ���������ͬ��,װ�β��ϲɹ���ϸ�۸�,װ�β��ϲɹ���ϸVO�۸�,װ�β��ϲɹ���ϸԭ��,װ�β��ϲɹ���Ӧ��',
	`cg_buy_jdsb_sub_detail` longtext COMMENT 'JSON��ʽ: �����豸���ϲɹ���ϸ,��ʽ:����, ����ÿ���������ͬ��,�����豸���ϲɹ���ϸ�۸�,�����豸���ϲɹ���ϸVO�۸�,�����豸���ϲɹ���ϸԭ��,�����豸���ϲɹ���Ӧ��',
#	`cg_cl_pay_rate` longtext COMMENT '���ϸ������-JSON��ʽ: , ��ʽ:����, ����ÿ����������,�������,������',
	`cg_cljg_mon_pay_rate` double DEFAULT 0.25 COMMENT '���Ͽ������¸������',
#	`cg_cljg_mon_pay_amt` double DEFAULT NULL COMMENT '���Ͽ������¸�����',
	`cg_cljg_next_mon_pay_rate` double DEFAULT 0.3 COMMENT '���Ͽ������¸������',
#	`cg_cljg_next_mon_pay_amt` double DEFAULT NULL COMMENT '���Ͽ������¸�����',
	`cg_clzb_pay_rate` double DEFAULT 0.05 COMMENT '�����ʱ������󸶿����',
#	`cg_clzb_pay_amt` double DEFAULT NULL COMMENT '�����ʱ������󸶿���',
	#
	`cg_rlzy_cgr1`    tinyint(4) DEFAULT NULL COMMENT '������Դ:�ɹ�Ա1',
	`cg_rlzy_cgr1_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:�ɹ�Ա1 ��������',
	`cg_rlzy_cgr1_desc`    char(100) DEFAULT NULL COMMENT '������Դ:�ɹ�Ա1  ���˵��',	
	`cg_rlzy_cgr2`    tinyint(4) DEFAULT NULL COMMENT '������Դ:�ɹ�Ա2',
	`cg_rlzy_cgr2_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:�ɹ�Ա2 ��������',
	`cg_rlzy_cgr2_desc`    char(100) DEFAULT NULL COMMENT '������Դ:�ɹ�Ա2  ���˵��',
	#
	#'�ɹ�����';

	#���̹���
  `gc_htqd_time` datetime DEFAULT NULL COMMENT '��ͬǩ������',
  `gc_customer_fkzq` int(11) DEFAULT NULL COMMENT '�ͻ��������� ��λ:��',
  `gc_pay_sh_pzsc` int(11) DEFAULT NULL COMMENT '���������׼ʱ�� ��λ:��',
  `gc_hetong_first_pay_rate` double DEFAULT NULL COMMENT '��ͬ�׸������',
#  `gc_hetong_first_pay_amt` double DEFAULT NULL COMMENT '��ͬ�׸�����',
#`gc_jh_first_pay_dz_time` datetime NOT NULL COMMENT '�ƻ��׸��������, ���㹫ʽ:��ͬǩ������+�ͻ���������+���������׼ʱ��',
#`gc_sj_first_pay_dz_time` datetime NOT NULL COMMENT 'ʵ���׸��������',
	`gc_jhkg_time` datetime DEFAULT NULL COMMENT '�ƻ���������',
	`gc_jhjg_time` datetime DEFAULT NULL COMMENT '�ƻ���������',
	
	#
	`gc_dsbptj_jh_time` datetime DEFAULT NULL COMMENT '���ñ����ύ����:�ƻ�',
	`gc_dsbptj_sj_time` datetime DEFAULT NULL COMMENT '���ñ����ύ����:ʵ��',
	`gc_dsbptj_time_desc` char(100) DEFAULT NULL COMMENT '���ñ����ύ����:���˵��',
	#
	`gc_dsbppz_time` datetime DEFAULT NULL COMMENT '���ñ�����׼����',
	`gc_dsbppz_time_desc` char(100) DEFAULT NULL COMMENT '���ñ�����׼����:���˵��',
	#
	`gc_xfbptj_jh_time` datetime DEFAULT NULL COMMENT '���������ύ����:�ƻ�',
	`gc_xfbptj_sj_time` datetime DEFAULT NULL COMMENT '���������ύ����:ʵ��',
	`gc_xfbptj_time_desc` char(100) DEFAULT NULL COMMENT '���������ύ����:���˵��',
	#
	`gc_xfbppz_time` datetime DEFAULT NULL COMMENT '����������׼����',
	`gc_xfbppz_time_desc` char(100) DEFAULT NULL COMMENT '����������׼����:���˵��',
	#
	`gc_kg_jh_time` datetime DEFAULT NULL COMMENT '��������:�ƻ�',
	`gc_kg_sj_time` datetime DEFAULT NULL COMMENT '��������:ʵ��',
	`gc_kg_time_desc` char(100) DEFAULT NULL COMMENT '��������:���˵��',
	#
	`gc_sl_time` datetime DEFAULT NULL COMMENT '��¥����',
	`gc_sl_time_desc` char(100) DEFAULT NULL COMMENT '��¥����:���˵��',
	#
	`gc_xfystj_jh_time` datetime DEFAULT NULL COMMENT '���������ύ����:�ƻ�',
	`gc_xfystj_sj_time` datetime DEFAULT NULL COMMENT '���������ύ����:ʵ��',
	`gc_xfystj_time_desc` char(100) DEFAULT NULL COMMENT '���������ύ����:���˵��',
	#
	`gc_xfyspz_time` datetime DEFAULT NULL COMMENT '����������׼����',
	`gc_xfyspz_time_desc` char(100) DEFAULT NULL COMMENT '����������׼����:���˵��',
	#
	`gc_gqyj_jh_time` datetime DEFAULT NULL COMMENT '��ǽ��������:�ƻ�',
	`gc_gqyj_sj_time` datetime DEFAULT NULL COMMENT '��ǽ��������:ʵ��',
	`gc_gqyj_time_desc` char(100) DEFAULT NULL COMMENT '��ǽ��������:���˵��',
	#
	`gc_jfyj_jh_time` datetime DEFAULT NULL COMMENT '�����ƽ�����:�ƻ�',
	`gc_jfyj_sj_time` datetime DEFAULT NULL COMMENT '�����ƽ�����:ʵ��',
	`gc_jfyj_time_desc` char(100) DEFAULT NULL COMMENT '�����ƽ�����:���˵��',
	#
	`gc_thyj_jh_time` datetime DEFAULT NULL COMMENT '�컨��������:�ƻ�',
	`gc_thyj_sj_time` datetime DEFAULT NULL COMMENT '�컨��������:ʵ��',
	`gc_thyj_time_desc` char(100) DEFAULT NULL COMMENT '�컨��������:���˵��',
	#
	`gc_xmwg_khys_jh_time` datetime DEFAULT NULL COMMENT '��Ŀ�깤����(�ͻ�����):�ƻ�',
	`gc_xmwg_khys_sj_time` datetime DEFAULT NULL COMMENT '��Ŀ�깤����(�ͻ�����):ʵ��',
	`gc_xmwg_khys_time_desc` char(100) DEFAULT NULL COMMENT '��Ŀ�깤����(�ͻ�����):���˵��',
	#
	`gc_xmyj_yyzbqjs_time` datetime DEFAULT NULL COMMENT '��Ŀ�ƽ�����(�����ʱ��ڼ���)',
	`gc_xmyj_yyzbqjs_time_desc` char(100) DEFAULT NULL COMMENT '��Ŀ�ƽ�����(�����ʱ��ڼ���):���˵��',
	#
	`gc_jgzltj_time` datetime DEFAULT NULL COMMENT '���������ύ����',
	`gc_jgzltj_time_desc` char(100) DEFAULT NULL COMMENT '���������ύ����:���˵��',
	#
	`gc_khbj_jh_time` datetime DEFAULT NULL COMMENT '�ͻ��������:�ƻ�',
	`gc_khbj_sj_time` datetime DEFAULT NULL COMMENT '�ͻ��������:ʵ��',
	`gc_khbj_time_desc` char(100) DEFAULT NULL COMMENT '�ͻ��������:���˵��',
	#
	`gc_yjsh_jh_time` datetime DEFAULT NULL COMMENT '�ƽ��ۺ�����:�ƻ�',
	`gc_yjsh_sj_time` datetime DEFAULT NULL COMMENT '�ƽ��ۺ�����:ʵ��',
	`gc_yjsh_time_desc` char(100) DEFAULT NULL COMMENT '�ƽ��ۺ�����:���˵��',
	#
	`gc_zbqm_time` datetime DEFAULT NULL COMMENT '�ʱ�����ʱ��',
	`gc_zbqm_time_desc` char(100) DEFAULT NULL COMMENT '�ʱ�����ʱ��:���˵��',
	#
	`gc_gcxg_date_detail` longtext COMMENT '�����������-JSON��ʽ:  ����13�
		1.���ñ����ύ����,
		2.���ñ�����׼����,
		3.���ñ����ύ����,
		4.���������ύ����,
		5.����������׼����,
		6.�ƻ���������,
		7.ʵ�ʿ�������,
		8.�����ƽ�,
		9.�컨����,
		10.���������ύ����,
		11.����������׼����,
		12.�ƻ��������ڣ��ͻ����գ�,
		13.ʵ�ʿ������ڣ��ͻ����գ�',
#	`gc_yj_jdk_detail` longtext COMMENT 'JSON��ʽ: Ԥ�ƽ��ȿ����ϸ , ��ʽ:����, ����ÿ����������ȿ����,���ȿ�ռ��ͬ������',
	`gc_jgxg_detail` longtext COMMENT '���������ϸ-JSON��ʽ:  , ��ʽ:����, ������
		1.������ռ��ͬ������,
		2.�ƻ������������,
		3.Ԥ�ƽ���������,
		4.��ʱ�깤,
		5.�ƻ��ͻ��������,
		6.ʵ�ʿͻ��������',
#`gc_sj_jgk_dz_time` datetime NOT NULL COMMENT 'ʵ�ʿ����������',
#`gc_jsk_amt` double DEFAULT NULL COMMENT '�������'
#`gc_yjyj_sh_time` datetime NOT NULL COMMENT 'Ԥ���ƽ��ۺ�����',
	#
	`gc_rlzy_xmzj`    tinyint(4) DEFAULT NULL COMMENT '������Դ:��Ŀ�ܼ�',
  `gc_rlzy_xmzj_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:��Ŀ�ܼ� ��������',
	`gc_rlzy_xmzj_desc`    char(100) DEFAULT NULL COMMENT '������Դ:��Ŀ�ܼ�  ���˵��',
	`gc_rlzy_xmxc1`    tinyint(4) DEFAULT NULL COMMENT '������Դ:��Ŀ����',
	`gc_rlzy_xmxc1_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:��Ŀ���� ��������',
	`gc_rlzy_xmxc1_desc`   char(100) DEFAULT NULL COMMENT '������Դ:��Ŀ����  ���˵��',
	`gc_rlzy_xmxc2`    tinyint(4) DEFAULT NULL COMMENT '������Դ:�ֳ�����',
	`gc_rlzy_xmxc2_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:�ֳ����� ��������',
	`gc_rlzy_xmxc2_desc`    char(100) DEFAULT NULL COMMENT '������Դ:�ֳ�����  ���˵��',
	`gc_rlzy_zxgz1`    tinyint(4) DEFAULT NULL COMMENT '������Դ:װ�޹���1',
	`gc_rlzy_zxgz1_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:װ�޹���1 ��������',
	`gc_rlzy_zxgz1_desc`    char(100) DEFAULT NULL COMMENT '������Դ:װ�޹���1  ���˵��',
	`gc_rlzy_zxgz2`    tinyint(4) DEFAULT NULL COMMENT '������Դ:װ�޹���2',
	`gc_rlzy_zxgz2_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:װ�޹���2 ��������',
	`gc_rlzy_zxgz2_desc`    char(100) DEFAULT NULL COMMENT '������Դ:װ�޹���2  ���˵��',
	`gc_rlzy_zxgz3`    tinyint(4) DEFAULT NULL COMMENT '������Դ:װ�޹���3',
	`gc_rlzy_zxgz3_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:װ�޹���3 ��������',
	`gc_rlzy_zxgz3_desc`    char(100) DEFAULT NULL COMMENT '������Դ:װ�޹���3  ���˵��',
	`gc_rlzy_aqy1`    tinyint(4) DEFAULT NULL COMMENT '������Դ:��ȫԱ1',
	`gc_rlzy_aqy1_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:��ȫԱ1 ��������',
	`gc_rlzy_aqy1_desc`    char(100) DEFAULT NULL COMMENT '������Դ:��ȫԱ1  ���˵��',
	`gc_rlzy_aqy2`    tinyint(4) DEFAULT NULL COMMENT '������Դ:��ȫԱ2',
	`gc_rlzy_aqy2_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:��ȫԱ2 ��������',
	`gc_rlzy_aqy2_desc`    char(100) DEFAULT NULL COMMENT '������Դ:��ȫԱ2  ���˵��',
	`gc_rlzy_aqy3`    tinyint(4) DEFAULT NULL COMMENT '������Դ:��ȫԱ3',
	`gc_rlzy_aqy3_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:��ȫԱ3 ��������',
	`gc_rlzy_aqy3_desc`    char(100) DEFAULT NULL COMMENT '������Դ:��ȫԱ3  ���˵��',
	`gc_rlzy_kfbj1`    tinyint(4) DEFAULT NULL COMMENT '������Դ:�ⷿ�����ฺ����1',
	`gc_rlzy_kfbj1_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:�ⷿ�����ฺ����1 ��������',
	`gc_rlzy_kfbj1_desc`    char(100) DEFAULT NULL COMMENT '������Դ:�ⷿ�����ฺ����1  ���˵��',
	`gc_rlzy_kfbj2`    tinyint(4) DEFAULT NULL COMMENT '������Դ:�ⷿ�����ฺ����2',
	`gc_rlzy_kfbj2_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:�ⷿ�����ฺ����2 ��������',
	`gc_rlzy_kfbj2_desc`    char(100) DEFAULT NULL COMMENT '������Դ:�ⷿ�����ฺ����2  ���˵��',
	`gc_rlzy_gczl`    tinyint(4) DEFAULT NULL COMMENT '������Դ:��������',
	`gc_rlzy_gczl_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:�������� ��������',
	`gc_rlzy_gczl_desc`    char(100) DEFAULT NULL COMMENT '������Դ:��������  ���˵��',
	#

	`gc_xmry_detail` longtext COMMENT '��Ŀ��Ա��ϸ-JSON��ʽ:  ����6�
	1.��Ŀ�ܼ�,
	2.��Ŀ����,
	3.�ֳ�����,
	4.�����б�, ��ʽ:����, ����ÿ�����: װ�޹������,װ�޹����е��������ı���,
	5.��ȫԱ�б�,��ʽ:����,����ÿ�����: ��ȫԱ���,
	6.�ֳ����ฺ����',
#`gc_xcfy_all_amt` double DEFAULT NULL COMMENT '�ֳ������ܼ�'	
#`gc_dssqfy_amt` double DEFAULT NULL COMMENT '������ȡ����'	
	`gc_fee_detail` longtext COMMENT '���̷�����ϸ-JSON��ʽ:  ����22�
	  1.��ҵ������ã�һ�㰴ƽ���㣩,
		2.�칫��Ʒ1
		3.�칫��Ʒ2
		4.��ʱˮ����ʩ��
		5.��ʱˮ�����
		6.ʩ��������
		7.��¥��ͼ�ȹ����
		8.�豸���޷�
		9.��������
		10.�ֳ���������Ʒ��������˾�Լ����ģ�
		11.�д���
		12.�ͷ���Ʒ����
		13.���ͨ���÷�
		14.���̱��շ�
		15.ʩ������
		16.˰��
		17.����ͼ��ͼ����
		18.��ʱ�칫�ҷ���
		19.���ϱ������
		20.�������˷�
		21.ʩ��ͼ�Ϳ���ͼ�������������
		22.��������
	',
	#'���̹���';

	#�������
	`jd_jdfatj_time` datetime DEFAULT NULL COMMENT '���緽���ύ����',
	`jd_jdfatj_time_desc` char(100) DEFAULT NULL COMMENT '���緽���ύ�������˵��',
	#
	`jd_jdbpttj_time` datetime DEFAULT NULL COMMENT '���籨��ͼ�ύ����',
	`jd_jdbpttj_time_desc` char(100)  DEFAULT NULL COMMENT '���籨��ͼ�ύ����:���˵��',
	#
	`jd_jdsgttj_time` datetime DEFAULT NULL COMMENT '����ʩ��ͼ�ύ����',
	`jd_jdsgttj_time_desc` char(100)  DEFAULT NULL COMMENT '����ʩ��ͼ�ύ����:���˵��',
	#
	`jd_jdjgttj_time` datetime DEFAULT NULL COMMENT '���翢��ͼ�ύʱ��',
	`jd_jdjgttj_time_desc` char(100)  DEFAULT NULL COMMENT '���翢��ͼ�ύʱ��:���˵��',
	#
	`jd_rlzy_jdzfzr`    tinyint(4) DEFAULT NULL COMMENT '������Դ:�����ܸ�����',
	`jd_rlzy_jdzfzr_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:�����ܸ����� ��������',
	`jd_rlzy_jdzfzr_desc`    char(100) DEFAULT NULL COMMENT '������Դ:�����ܸ�����  ���˵��',
	`jd_rlzy_ktxfjpssj1`    tinyint(4) DEFAULT NULL COMMENT '������Դ:�յ���������ˮ���1',
	`jd_rlzy_ktxfjpssj1_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:�յ���������ˮ���1 ��������',
	`jd_rlzy_ktxfjpssj1_desc`    char(100) DEFAULT NULL COMMENT '������Դ:�յ���������ˮ���1  ���˵��',
	`jd_rlzy_ktxfjpssj2`    tinyint(4) DEFAULT NULL COMMENT '������Դ:�յ���������ˮ���2',
	`jd_rlzy_ktxfjpssj2_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:�յ���������ˮ���2 ��������',
	`jd_rlzy_ktxfjpssj2_desc`    char(100) DEFAULT NULL COMMENT '������Դ:�յ���������ˮ���2  ���˵��',
	`jd_rlzy_ktxfjpssj3`    tinyint(4) DEFAULT NULL COMMENT '������Դ:�յ���������ˮ���3',
	`jd_rlzy_ktxfjpssj3_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:�յ���������ˮ���3 ��������',
	`jd_rlzy_ktxfjpssj3_desc`    char(100) DEFAULT NULL COMMENT '������Դ:�յ���������ˮ���3  ���˵��',
	`jd_rlzy_dqsj1`    tinyint(4) DEFAULT NULL COMMENT '������Դ:�������1',
	`jd_rlzy_dqsj1_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:�������1 ��������',
	`jd_rlzy_dqsj1_desc`    char(100) DEFAULT NULL COMMENT '������Դ:�������1  ���˵��',
	`jd_rlzy_dqsj2`    tinyint(4) DEFAULT NULL COMMENT '������Դ:�������2',
	`jd_rlzy_dqsj2_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:�������2 ��������',
	`jd_rlzy_dqsj2_desc`    char(100) DEFAULT NULL COMMENT '������Դ:�������2  ���˵��',
	`jd_rlzy_dqsj3`    tinyint(4) DEFAULT NULL COMMENT '������Դ:�������3',
	`jd_rlzy_dqsj3_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:�������3 ��������',
	`jd_rlzy_dqsj3_desc`    char(100) DEFAULT NULL COMMENT '������Դ:�������3  ���˵��',
	`jd_rlzy_jdgz1`    tinyint(4) DEFAULT NULL COMMENT '������Դ:���繤��1',
	`jd_rlzy_jdgz1_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:���繤��1 ��������',
	`jd_rlzy_jdgz1_desc`    char(100) DEFAULT NULL COMMENT '������Դ:���繤��1  ���˵��',					
	`jd_rlzy_jdgz2`    tinyint(4) DEFAULT NULL COMMENT '������Դ:���繤��2',
	`jd_rlzy_jdgz2_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:���繤��2 ��������',
	`jd_rlzy_jdgz2_desc`    char(100) DEFAULT NULL COMMENT '������Դ:���繤��2  ���˵��',		
	`jd_rlzy_jdgz3`    tinyint(4) DEFAULT NULL COMMENT '������Դ:���繤��3',
	`jd_rlzy_jdgz3_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:���繤��3 ��������',
	`jd_rlzy_jdgz3_desc`    char(100) DEFAULT NULL COMMENT '������Դ:���繤��3  ���˵��',							
	#
  `jd_tjsj_date_detail` longtext COMMENT '�ύʱ���������-JSON��ʽ:  ����5�
		1.Ͷ�귽���ύʱ��,
		2.���ñ���ͼ�״��ύʱ��,
		3.ʩ��ͼ�ύʱ��,
		4.����ͼ�ύʱ��,
		5.���������ύʱ��',
  `jd_jdgl_detail` longtext COMMENT '���������Ա��ϸ-JSON��ʽ:  ����6�
		1.����ܸ�����,
		2.�յ���������ˮ�������б�, ��ʽ:����, ����ÿ�����: ���������,������ռ��(ռ���ܺ�Ϊ100%),
		3.�����������б�, ��ʽ:����, ����ÿ�����: ���������,������ռ��(ռ���ܺ�Ϊ100%)
		4.����ˮ�����б�, ��ʽ:����, ����ÿ�����: �յ���������ˮ����,�յ���������ˮ����ռ��
		5.���������б�, ��ʽ:����, ����ÿ�����: ��������,��������ռ��',
  `jd_kt_xf_jps_rate` double DEFAULT 0.5 COMMENT '�յ���������ˮռ���繤�����������',
  `jd_dq_rate` double DEFAULT 0 COMMENT '��������ռ���繤�����������',
	#'�������';

	#��ƹ���
	`sj_sjfatj_time` datetime DEFAULT NULL COMMENT '��Ʒ����ύ����',
	`sj_sjfatj_time_desc` char(100) DEFAULT NULL COMMENT '��Ʒ����ύ�������˵��',
	#
	`sj_sjbpttj_time` datetime DEFAULT NULL COMMENT '��Ʊ���ͼ�ύ����',
	`sj_sjbpttj_time_desc` char(100)  DEFAULT NULL COMMENT '��Ʊ���ͼ�ύ����:���˵��',
	#
	`sj_zxsgt_time` datetime DEFAULT NULL COMMENT 'װ��ʩ��ͼ�ύ����:�ƻ�����',
	`sj_zxsgt_time_desc` char(100)  DEFAULT NULL COMMENT 'װ��ʩ��ͼ�ύ����:���˵��',	
	#
	`sj_zxjgt_time` datetime DEFAULT NULL COMMENT 'װ�޿���ͼ�ύʱ��:�ƻ�����',
	`sj_zxjgt_time_desc` char(100)  DEFAULT NULL COMMENT 'װ�޿���ͼ�ύʱ��:���˵��',	
	#
  `sj_rlzy_gjsjs1`    tinyint(4) DEFAULT NULL COMMENT '������Դ:�߼����ʦ1',
  `sj_rlzy_gjsjs1_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:�߼����ʦ1 ��������',
	`sj_rlzy_gjsjs1_desc`    char(100) DEFAULT NULL COMMENT '������Դ:�߼����ʦ1  ���˵��',
	`sj_rlzy_gjsjs2`    tinyint(4) DEFAULT NULL COMMENT '������Դ:�߼����ʦ2',
	`sj_rlzy_gjsjs2_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:�߼����ʦ2 ��������',
	`sj_rlzy_gjsjs2_desc`   char(100) DEFAULT NULL COMMENT '������Դ:�߼����ʦ2  ���˵��',
	`sj_rlzy_xgsjs1`    tinyint(4) DEFAULT NULL COMMENT '������Դ:Ч��ͼ���ʦ1',
	`sj_rlzy_xgsjs1_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:Ч��ͼ���ʦ1 ��������',
	`sj_rlzy_xgsjs1_desc`    char(100) DEFAULT NULL COMMENT '������Դ:Ч��ͼ���ʦ1  ���˵��',
	`sj_rlzy_xgsjs2`    tinyint(4) DEFAULT NULL COMMENT '������Դ:Ч��ͼ���ʦ2',
	`sj_rlzy_xgsjs2_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:Ч��ͼ���ʦ2 ��������',
	`sj_rlzy_xgsjs2_desc`   char(100) DEFAULT NULL COMMENT '������Դ:Ч��ͼ���ʦ2  ���˵��',
	`sj_rlzy_sgtfzr1`    tinyint(4) DEFAULT NULL COMMENT '������Դ:ʩ��ͼ������1',
  `sj_rlzy_sgtfzr1_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:ʩ��ͼ������1 ��������',
	`sj_rlzy_sgtfzr1_desc`    char(100) DEFAULT NULL COMMENT '������Դ:ʩ��ͼ������1  ���˵��',
	`sj_rlzy_sgtfzr2`    tinyint(4) DEFAULT NULL COMMENT '������Դ:ʩ��ͼ������2',
	`sj_rlzy_sgtfzr2_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:ʩ��ͼ������2 ��������',
	`sj_rlzy_sgtfzr2_desc`   char(100) DEFAULT NULL COMMENT '������Դ:ʩ��ͼ������2  ���˵��',
	`sj_rlzy_sgtfzr3`    tinyint(4) DEFAULT NULL COMMENT '������Դ:ʩ��ͼ������3',
	`sj_rlzy_sgtfzr3_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:ʩ��ͼ������3 ��������',
	`sj_rlzy_sgtfzr3_desc`    char(100) DEFAULT NULL COMMENT '������Դ:ʩ��ͼ������3  ���˵��',
  #
	#
  `sj_tjsj_date_detail` longtext COMMENT 'JSON��ʽ: �ύʱ��������� ����5�
		1.Ͷ�귽���ύʱ��,
		2.���ñ���ͼ�״��ύʱ��,
		3.ʩ��ͼ�ύʱ��,
		4.����ͼ�ύʱ��,
		5.���������ύʱ��',
  `sj_sjgl_detail` longtext COMMENT '��ƹ�����Ա��ϸ-JSON��ʽ:  ����6�
		1.����ܸ�����,
		2.Ч��ͼ������,
		3.ʩ��ͼ��Ƹ����˸������б�, ��ʽ:JSON����, ����ÿ�����: ���������,������ռ��(ռ���ܺ�Ϊ100%),
		4.��Ʒ�������Ч��������
		5.�ͼ��Ƹ�����',
	#'��ƹ���';

	#�г�����
  `sc_pro_name` char(50) DEFAULT NULL COMMENT '��Ŀ����',
  `sc_pro_qx` longtext COMMENT '��ĿȨ��',
  `sc_pro_type`  char(1) DEFAULT NULL COMMENT '��Ŀ���',
  `sc_pro_trade_base` char(20) DEFAULT NULL COMMENT '��Ŀ��ҵ:����',
  `sc_pro_trade_ot` char(20) DEFAULT NULL COMMENT '��Ŀ��ҵ:����',
	`sc_cus_name` char(50) DEFAULT NULL COMMENT '�ͻ�����',
	`sc_cus_type` char(1) DEFAULT NULL COMMENT '�ͻ�����',
	`sc_cus_t_1` char(1) NOT NULL DEFAULT '0' COMMENT '�ͻ����1',
	`sc_cus_t_2` char(1) NOT NULL DEFAULT '0' COMMENT '�ͻ����2',
	`sc_mag_company_base` char(50)  DEFAULT NULL COMMENT '����˾:����',
	`sc_mag_company_ot` char(50)  DEFAULT NULL COMMENT '����˾:����',
	`sc_compety_company_base` char(50) DEFAULT NULL COMMENT '��������:����',
	`sc_compety_company_ot` char(50) DEFAULT NULL COMMENT '��������:����',
	`sc_pro_city` char(50) DEFAULT NULL COMMENT '��Ŀ����',
	`sc_pro_address` char(100) DEFAULT NULL COMMENT '��Ŀ�ص�',
	`sc_invest_type` char(1) DEFAULT NULL COMMENT 'Ͷ�����',
	`sc_fb_time` datetime DEFAULT NULL COMMENT '��������',
	`sc_fb_time_desc` char(100) DEFAULT NULL COMMENT '�����������˵��',
	`sc_hb_time` datetime DEFAULT NULL COMMENT '�ر�����',
	`sc_hb_time_desc` char(100) DEFAULT NULL COMMENT '�ر��������˵��',
	`sc_htqd_time` datetime DEFAULT NULL COMMENT '��ͬǩ������',
	`sc_htqd_time_desc` char(100) DEFAULT NULL COMMENT '��ͬǩ���������˵��',
	`sc_tbcl_fxh` char(1) NOT NULL DEFAULT '0' COMMENT 'Ͷ����Է�����',
	`sc_zb_flag` char(1) DEFAULT NULL COMMENT '�б�״̬',
	`sc_zb_time` datetime DEFAULT NULL COMMENT '�б�����',
	`sc_zb_time_desc` char(100) DEFAULT NULL COMMENT '�б��������˵��',
	`sc_zb_amt` double DEFAULT NULL COMMENT '�б���',
	`sc_zb_reason_base` char(50) DEFAULT NULL COMMENT '�б�ԭ��:����',
	`sc_zb_reason_ot` char(50) DEFAULT NULL COMMENT '�б�ԭ��:����',
	`sc_lb_reason_base` varchar(200) DEFAULT NULL COMMENT '���ԭ��:����',
	`sc_lb_reason_ot` varchar(200) DEFAULT NULL COMMENT '���ԭ��:����',
	`sc_ss_fgs` char(1) DEFAULT NULL COMMENT '��Ŀʵʩ�ֹ�˾',
	`sc_sj_myd_1`      char(1) DEFAULT NULL COMMENT '�ͻ������:���1',
	`sc_sj_myd_1_desc` char(50) DEFAULT NULL COMMENT '�ͻ������:���1 ���˵��',
	`sc_sj_myd_2`      char(1) DEFAULT NULL COMMENT '�ͻ������:���2',
	`sc_sj_myd_2_desc` char(50) DEFAULT NULL COMMENT '�ͻ������:���2 ���˵��',
	`sc_sg_myd_1`      char(1) DEFAULT NULL COMMENT '�ͻ������:ʩ��1',
	`sc_sg_myd_1_desc` char(50) DEFAULT NULL COMMENT '�ͻ������:ʩ��1 ���˵��',
	`sc_sg_myd_2`      char(1) DEFAULT NULL COMMENT '�ͻ������:ʩ��2',
	`sc_sg_myd_2_desc` char(50) DEFAULT NULL COMMENT '�ͻ������:ʩ��2 ���˵��',
	#
	`sc_rlzy_scjl`    tinyint(4) DEFAULT NULL COMMENT '������Դ:�г�����',
	`sc_rlzy_scjl_desc`    char(100) DEFAULT NULL COMMENT '������Դ:�г����� ���˵��',
	`sc_rlzy_sczl`    tinyint(4) DEFAULT NULL COMMENT '������Դ:�г�����',
	`sc_rlzy_sczl_desc`    char(100) DEFAULT NULL COMMENT '������Դ:�г�����  ���˵��',
	#
	
#	`sc_myd_all` tinyint(4) NOT NULL DEFAULT '0' COMMENT '�ͻ������',
	`sc_myd_sub_detail` longtext COMMENT '�������ϸ��Ϣ-JSON��ʽ: , ����: 
		1.��������,�����ֵ,����ȸ�����Ϣ,
		2.ʩ�����������,�����ֵ,����ȸ�����Ϣ,
		3.����̬�������,�����ֵ,����ȸ�����Ϣ,
		4.��Ӧ�ٶ������,�����ֵ,����ȸ�����Ϣ,
		5.���繦�������,�����ֵ,����ȸ�����Ϣ,
		6.�ۺ���������,�����ֵ,����ȸ�����Ϣ,
		7.�ͻ����������,�����ֵ,����ȸ�����Ϣ,',
	`sc_tbtd_detail` longtext COMMENT 'JSON��ʽ: �г���Ͷ���Ŷ���Ա��ϸ ����2�
		1.�г�����Ŀ������,
		2.Ͷ��TEAM��Ա�б�, ��ʽ:����, ����ÿ�����: ��Ա���� ',
	#'�г�����';

	#Ԥ�����
  `ys_cw_bh` char(20) DEFAULT NULL COMMENT '��Ŀ������',
  `ys_hetong_amt` double DEFAULT NULL COMMENT '��ͬ���',
  `ys_xm_mj` double DEFAULT NULL COMMENT '��Ŀ���',
  `ys_xm_jmj` double DEFAULT NULL COMMENT '��Ŀ�����',
  `ys_tb_mll` double DEFAULT NULL COMMENT 'Ͷ��ë����',
  `ys_kg_mll` double DEFAULT NULL COMMENT '����ë����',
#  `ys_nk_amt` double DEFAULT NULL COMMENT '�ڿؽ��',
	`ys_cg_nk_amt` double DEFAULT NULL COMMENT '�ɹ��ڿؽ��',
	`ys_xc_nk_amt` double DEFAULT NULL COMMENT '�ֳ��ڿؽ��',
		
	`ys_cg_nkt_tj_time` datetime DEFAULT NULL COMMENT '�ɹ��ڿص��ύʱ��',
	`ys_cg_nkt_tj_time_desc` char(100) DEFAULT NULL COMMENT '�ɹ��ڿص��ύʱ��:���˵��',
	`ys_xc_nkt_tj_time` datetime DEFAULT NULL COMMENT '�ֳ��ڿص��ύʱ��',
	`ys_xc_nkt_tj_time_desc` char(100) DEFAULT NULL COMMENT '�ֳ��ڿص��ύʱ��:���˵��',
  `ys_jswc_time` datetime DEFAULT NULL COMMENT '��Ŀ�������ʱ��',
 	`ys_jswc_time_desc` char(100) DEFAULT NULL COMMENT '��Ŀ�������ʱ��:���˵��',
#  `ys_all_vo` double DEFAULT NULL COMMENT '��Ŀ������VO',
#  `ys_all_amt` double DEFAULT NULL COMMENT '��Ŀ�����ܽ��',

#  `ys_fb_ht_all_amt` double DEFAULT NULL COMMENT '�ְ���ͬ�ܽ��',
#  `ys_fb_vo_all_amt` double DEFAULT NULL COMMENT '�ְ�VO�ܽ��',
#  `ys_fb_js_all_amt` double DEFAULT NULL COMMENT '�ְ������ܽ��',
#  `ys_fb_cg_xc_rl_js_all_amt` double DEFAULT NULL COMMENT '�ְ��ɹ��ֳ������������ܽ��',
	`ys_qt_zjcb_amt` double DEFAULT NULL COMMENT '������Ŀδ�ܼ�ʱ�������Ŀֱ�ӳɱ�',
#  `ys_sj_mll` double DEFAULT NULL COMMENT 'ʵ��ë����',
#	`ys_fb_fk_detail` longtext COMMENT '��Ŀ�ְ�������ϸ-JSON��ʽ:  , ��ʽ:����, ����ÿ����������,����,���, �ְ��ĸ������Ĳ�����ɣ��׸�+����+��������+ �ʱ� ',
  `ys_zx_sub_detail` longtext COMMENT 'JSON��ʽ: װ�������Ϣ ����: 
		1.װ�޹��̺�ͬ����,
		2.װ�޹��̺�ͬ�ڿ�,
		3.װ�޹��̺�ͬԤ��ë����(��ʽ����),
		4.װ�޷ְ���ͬ�۸�,
		5.װ�޷ְ���ͬ����,
		6.װ�޷ְ�,
		7.װ�޷ְ�ѡ������,
		8.װ�޷ְ�����,
		9.װ�޹��̿ͻ���VO,(��ĿԤ������ӱ��Զ�����),
		10.װ�޹��̷ְ���VO,(��ĿԤ������ӱ��Զ�����),
		11.װ�޹���ʵ��ë����,(��ʽ����),
		12.װ�޹��̿ͻ�VO��ϸ, ��ʽ:����, ÿһ�������
			1)VO���
			2)װ�޹��̿ͻ�VO��ϸ
			3)װ�޹��̿ͻ�VO��ϸԭ��,',
  `ys_dq_sub_detail` longtext COMMENT 'JSON��ʽ: ���������Ϣ �ṹ�� zx_sub_detail �ֶ�һ��,',
  `ys_kt_sub_detail` longtext COMMENT 'JSON��ʽ: �յ������Ϣ �ṹ�� zx_sub_detail �ֶ�һ��,',
  `ys_xf_sub_detail` longtext COMMENT 'JSON��ʽ: ���������Ϣ �ṹ�� zx_sub_detail �ֶ�һ��,',
  `ys_jps_sub_detail` longtext COMMENT 'JSON��ʽ: ����ˮ�����Ϣ �ṹ�� zx_sub_detail �ֶ�һ��,',
  `ys_it_sub_detail` longtext COMMENT 'JSON��ʽ: IT�����Ϣ �ṹ�� zx_sub_detail �ֶ�һ��,',
  `ys_af_sub_detail` longtext COMMENT 'JSON��ʽ: ���������Ϣ �ṹ�� zx_sub_detail �ֶ�һ��,',
  `ys_av_sub_detail` longtext COMMENT 'JSON��ʽ: AV�����Ϣ �ṹ�� zx_sub_detail �ֶ�һ��,',
  #
  `ys_rlzy_ysy1`    tinyint(4) DEFAULT NULL COMMENT '������Դ:Ԥ��Ա1',
  `ys_rlzy_ysy1_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:Ԥ��Ա1 ��������',
	`ys_rlzy_ysy1_desc`    char(100) DEFAULT NULL COMMENT '������Դ:Ԥ��Ա1  ���˵��',
	`ys_rlzy_ysy2`    tinyint(4) DEFAULT NULL COMMENT '������Դ:Ԥ��Ա2',
	`ys_rlzy_ysy2_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:Ԥ��Ա2 ��������',
	`ys_rlzy_ysy2_desc`   char(100) DEFAULT NULL COMMENT '������Դ:Ԥ��Ա2  ���˵��',
	`ys_rlzy_ysy3`    tinyint(4) DEFAULT NULL COMMENT '������Դ:Ԥ��Ա3',
	`ys_rlzy_ysy3_choose`  tinyint(4) DEFAULT NULL COMMENT '������Դ:Ԥ��Ա3 ��������',
	`ys_rlzy_ysy3_desc`    char(100) DEFAULT NULL COMMENT '������Դ:Ԥ��Ա3  ���˵��',
  #
  `ys_ysgl_detail` longtext COMMENT 'JSON��ʽ: Ԥ�������Ա��ϸ ����6�
		1.Ԥ���ܸ�����,
		2.Ԥ�㸺�����б�, ��ʽ:JSON����, ����ÿ�����: ���������,������ռ��(ռ���ܺ�Ϊ100%),',
	#Ԥ�����
	  
	`status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '��ʶ 1���½� 2:�����Ѿ���˹� 3.�Ѿ�ɾ��',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='��Ŀ�ܱ�';  

#######################################################################################################################################















