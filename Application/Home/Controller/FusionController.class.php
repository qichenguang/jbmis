<?php
namespace Home\Controller;
use Think\Controller;
class FusionController extends Controller {
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    private function getProjectRecCbDetail($item){
        $r = array();
        //1.查询：fb cg customer_vo
        $customer_vo_arr = array();
        $list = M()->query("SELECT vo_type,SUM(vo_je) as it_sum FROM `jb_customer_vo` WHERE pro_id='" . $item['pro_id'] . "' GROUP BY vo_type ");
        if(!empty($list)){
            foreach($list as $cur){
                $customer_vo_arr[$cur["vo_type"]]=$cur["it_sum"];
            }
        }
        //2.查询：fb self vo
        $fb_vo_arr = array();
        $list = M()->query("SELECT vo_type,SUM(vo_je) as it_sum FROM `jb_fb_vo` WHERE pro_id='" . $item['pro_id'] . "' GROUP BY vo_type ");
        if(!empty($list)){
            foreach($list as $cur){
                $fb_vo_arr[$cur["vo_type"]]=$cur["it_sum"];
            }
        }
        //3.查询：cg self vo
        $cg_sjcb_all = 0.0;
        $cg_sjcb_vo_all = 0.0;
        $qq_sjcb_all = 0.0;
        $qq_sjcb_vo_all = 0.0;
        if(true){
            $cond['pro_id'] = $item['pro_id'];
            $tablename = "jb_cg_vo";
            $list = M()->query("SELECT srctype,SUM(cg_je) as it_sum,SUM(vo1_je) as it_1_sum,SUM(vo2_je) as it_2_sum,SUM(vo3_je) as it_3_sum FROM `jb_cg_vo` WHERE pro_id='" . $item['pro_id'] . "' group by srctype ");
            //
            $cg_je = 0.0;
            $cg_vo = 0.0;
            $qq_je = 0.0;
            $qq_vo = 0.0;
            if(!empty($list)){
                foreach($list as $cur){
                    if($cur['srctype'] != "qq"){
                        $cg_je += $cur["it_sum"];
                        $cg_vo += $cur["it_1_sum"] + $cur["it_2_sum"] + $cur["it_3_sum"];
                    }else{
                        $qq_je += $cur["it_sum"];
                        $qq_vo += $cur["it_1_sum"] + $cur["it_2_sum"] + $cur["it_3_sum"];
                    }
                }
            }
            $cg_gckc_sjcb = $item["cg_gckc_sjcb"];
            $cg_gcrgf_sjcb = $item["cg_gcrgf_sjcb"];
            $cg_sjcb = floatval($cg_je) + floatval($cg_gckc_sjcb) + floatval($cg_gcrgf_sjcb);
            if($cg_sjcb > 0.01){
                $cg_sjcb_all = $cg_sjcb;
            }
            //
            $cg_gckc_sjcb_vo = $item["cg_gckc_sjcb_vo"];
            $cg_gcrgf_sjcb_vo = $item["cg_gcrgf_sjcb_vo"];
            $cg_sjcb_vo = floatval($cg_vo) + floatval($cg_gckc_sjcb_vo) + floatval($cg_gcrgf_sjcb_vo);
            if($cg_sjcb_vo > 0.01){
                $cg_sjcb_vo_all = $cg_sjcb_vo;
            }
            //
            if($qq_je > 0.01){
                $qq_sjcb_all = $qq_je;
            }
            if($qq_vo > 0.01){
                $qq_sjcb_vo_all = $qq_vo;
            }
        }
        //分包
        $fb_lx_arr = USER_FUN_GET_FBS_TYPE_NAME();
        foreach($fb_lx_arr as $key => $value){
            $tmp = array();
            $tmp['name'] = $value;
            //dwbj
            $key_dwbj = "ys_" . $key . "_dwbj";
            $dwbj = $item[$key_dwbj];
            $tmp['dwbj'] = $dwbj;
            //nkje
            $key_nkje = "ys_" . $key . "_nkje";
            $nkje = $item[$key_nkje];
            $tmp['nkje'] = $nkje;
            //sjcb
            $key_sjcb = "ys_" . $key . "_sjcb";
            $sjcb = $item[$key_sjcb];
            $tmp['sjcb'] = $sjcb;
            //customer_vo
            $tmp['customer_vo'] = $customer_vo_arr[$key];
            //fb_vo
            $tmp['self_vo'] = $fb_vo_arr[$key];
            //
            $r[$key] = $tmp;
        }
        //采购
        if(true){
            $key = 'cg';
            $name = "采购";
            $tmp = array();
            $tmp['name'] = $name;
            //dwbj : ys_cg_all_dwbj
            $key_dwbj = "ys_" . $key . "_all_dwbj";
            $dwbj = $item[$key_dwbj];
            $tmp['dwbj'] = $dwbj;
            //nkje : ys_cg_all_nkje
            $key_nkje = "ys_" . $key . "_all_nkje";
            $nkje = $item[$key_nkje];
            $tmp['nkje'] = $nkje;
            //customer_vo
            $tmp['customer_vo'] = $customer_vo_arr[$key];
            //sjcb
            $tmp['sjcb'] = $cg_sjcb_all;
            //fb_vo
            $tmp['self_vo'] = $cg_sjcb_vo_all;
            //
            $r[$key] = $tmp;
        }
        //前期
        if(true){
            $key = 'qq';
            $name = "前期";
            $tmp = array();
            $tmp['name'] = $name;
            //dwbj
            $key_dwbj = "ys_" . $key . "_dwbj";
            $dwbj = $item[$key_dwbj];
            $tmp['dwbj'] = $dwbj;
            //customer_vo
            $key_customer_vo = "ys_" . $key . "_customer_vo";
            $customer_vo = $item[$key_customer_vo];
            $tmp['customer_vo'] = $customer_vo;
            //nkje
            $key_nkje = "ys_" . $key . "_nkje";
            $nkje = $item[$key_nkje];
            $tmp['nkje'] = $nkje;
            //sjcb
            $tmp['sjcb'] = $qq_sjcb_all;
            //vo
            $tmp['self_vo'] = $qq_sjcb_vo_all;
            //
            $r[$key] = $tmp;
        }
        //直接人工成本
        if(true){
            $key = 'rg';
            $name = "直接人工成本";
            $tmp = array();
            $tmp['name'] = $name;
            //dwbj
            $key_dwbj = "ys_" . $key . "_dwbj";
            $dwbj = $item[$key_dwbj];
            $tmp['dwbj'] = $dwbj;
            //customer_vo
            $tmp['customer_vo'] = 0.0;
            //nkje
            $key_nkje = "ys_" . $key . "_nkje";
            $nkje = $item[$key_nkje];
            $tmp['nkje'] = $nkje;
            //sjcb 计算生成
            $sjcb = $_SESSION['all_zjrgcb'];
            $tmp['sjcb'] = $sjcb;
            //vo
            $tmp['self_vo'] = 0.0;
            //
            $r[$key] = $tmp;
        }
        //其它
        if(true){
            $key = 'qt';
            $name = "其它";
            $tmp = array();
            $tmp['name'] = $name;
            //dwbj
            $key_dwbj = "ys_" . $key . "_dwbj";
            $dwbj = $item[$key_dwbj];
            $tmp['dwbj'] = $dwbj;
            //customer_vo
            $key_customer_vo = "ys_" . $key . "_customer_vo";
            $customer_vo = $item[$key_customer_vo];
            $tmp['customer_vo'] = $customer_vo;
            //nkje
            $key_nkje = "ys_" . $key . "_nkje";
            $nkje = $item[$key_nkje];
            $tmp['nkje'] = $nkje;
            //sjcb 计算生成
            $key_sjcb = "ys_" . $key . "_sjcb";
            $sjcb = $item[$key_sjcb];
            $tmp['sjcb'] = $sjcb;
            //vo
            $key_vo = "ys_" . $key . "_vo";
            $vo = $item[$key_vo];
            $tmp['self_vo'] = $vo;
            //
            $r[$key] = $tmp;
        }
        //
        return $r;
    }
    //成本管理
    public function ajaxGetCbgl(){
        $pro_id = I('pro_id');
        $cond['pro_id'] = $pro_id;
        $Data   =   M("project");
        $project_detail = array();
        $project_detail = $Data->where($cond)->find();
        $r = $this->getProjectRecCbDetail($project_detail);
        trace($r);

        $responce = array();
        //图形1
        if(true){
            //x轴
            $categories = array();
            $category = array();
            //
            foreach($r as $key => $value){
                $tmp = array();
                $tmp['label'] = $value['name'];
                $category[] = $tmp;
            }
            $categories['category'] = $category;
            //Y轴
            $dataset = array();
            //left
            $left_dataset = array();
            $left_dataset['seriesname'] = "实际发生成本";
            $left_dataset["parentyaxis"] = "P";
            $left_data = array();
            foreach($r as $key => $je_arr){
                $tmp = array();
                $tmp['value'] = floatval($je_arr["sjcb"]) + floatval($je_arr["self_vo"]);
                $left_data[] = $tmp;
            }
            $left_dataset['data'] = $left_data;
            $dataset[] = $left_dataset;

            //left $left_dataset $left_data
            $right_dataset = array();
            $right_dataset['seriesname'] = "内控金额";
            $right_dataset["parentyaxis"] = "P";
            $right_data = array();
            foreach($r as $key => $je_arr){
                $tmp = array();
                $tmp['value'] = floatval($je_arr["nkje"]);
                $right_data[] = $tmp;
            }
            $right_dataset['data'] = $right_data;
            $dataset[] = $right_dataset;

            //第二条 Y轴
            $y2_dataset = array();
            $y2_dataset['seriesname'] = "比率";
            $y2_dataset['renderas'] = "line";
            $y2_dataset["parentyaxis"] = "S";
            $y2_data = array();
            foreach($r as $key => $je_arr){
                $tmp = array();
                $je1 = floatval($je_arr["nkje"]);
                $je2 = floatval($je_arr["sjcb"]) + floatval($je_arr["self_vo"]);
                $tmp['value'] = ($je2/$je1);
                $y2_data[] = $tmp;
            }
            $y2_dataset['data'] = $y2_data;
            $dataset[] = $y2_dataset;

            //return
            $responce['categories1'] = $categories;
            $responce['dataset1'] = $dataset;
        }

        //图形2
        if(true){
            //x轴
            $categories = array();
            $category = array();
            //
            foreach($r as $key => $value){
                $tmp = array();
                $tmp['label'] = $value['name'];
                $category[] = $tmp;
            }
            $categories['category'] = $category;
            //Y轴
            $dataset = array();
            //left
            $left_dataset = array();
            $left_dataset['seriesname'] = "对外报价加客户VO";
            $left_dataset["parentyaxis"] = "P";
            $left_data = array();
            foreach($r as $key => $je_arr){
                $tmp = array();
                $tmp['value'] = floatval($je_arr["dwbj"]) + floatval($je_arr["customer_vo"]);
                $left_data[] = $tmp;
            }
            $left_dataset['data'] = $left_data;
            $dataset[] = $left_dataset;
            //right
            $right_dataset = array();
            $right_dataset['seriesname'] = "实际成本加实际成本变化";
            $right_dataset["parentyaxis"] = "P";
            $right_data = array();
            foreach($r as $key => $je_arr){
                $tmp = array();
                $tmp['value'] = floatval($je_arr["sjcb"]) + floatval($je_arr["self_vo"]);
                $right_data[] = $tmp;
            }
            $right_dataset['data'] = $right_data;
            $dataset[] = $right_dataset;
            //第二条 Y轴
            $y2_dataset = array();
            $y2_dataset['seriesname'] = "比率";
            $y2_dataset['renderas'] = "line";
            $y2_dataset["parentyaxis"] = "S";
            $y2_data = array();
            foreach($r as $key => $je_arr){
                $tmp = array();
                $je1 = floatval($je_arr["dwbj"]) + floatval($je_arr["customer_vo"]);
                $je2 = floatval($je_arr["sjcb"]) + floatval($je_arr["self_vo"]);
                $tmp['value'] = ($je2/$je1);
                $y2_data[] = $tmp;
            }
            $y2_dataset['data'] = $y2_data;
            $dataset[] = $y2_dataset;

            //return

            $responce['categories2'] = $categories;
            $responce['dataset2'] = $dataset;
        }
        //
        trace($responce);
        $this->ajaxReturn($responce);
    }
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //每月资金流
    public function ajaxGetMonthZjl(){
        $pro_id = I('pro_id');
        $hetong_amt = I('hetong_amt');
        $fb_amt = I('fb_amt');
        $cl_amt = I('cl_amt');
        //
        $month_arr = array();
        //
        $cond['pro_id'] = $pro_id;
        $M_SKSJ = M('zjl_sksj');
        $list =  $M_SKSJ->where($cond)->select();
        $sksj_arr = array();
        if(!empty($list)){
            foreach($list as $item){
                $je = $item['sk_je'];
                $month = date ( "Y-m", strtotime($item['sk_time']));
                $tmp_arr = array('je' => $je,'month' => $month);
                $sksj_arr[] = $tmp_arr;
                //
                $month_arr[$month] = $month;
            }
        }
        //
        $M_SKYJ = M('zjl_skyj');
        $list =  $M_SKYJ->where($cond)->select();
        $skyj_arr = array();
        if(!empty($list)){
            foreach($list as $item){
                $je = floatval($hetong_amt) * floatval($item['sk_rate']);
                $month = date ( "Y-m", strtotime($item['sk_time']));
                $tmp_arr = array('je' => $je,'month' => $month);
                $skyj_arr[] = $tmp_arr;
                //
                $month_arr[$month] = $month;
            }
        }
        //
        $M_FKYJ = M('zjl_fkyj'); // 实例化User对象
        $list =  $M_FKYJ->where($cond)->select();
        $fkyj_arr = array();
        if(!empty($list)){
            foreach($list as $item){
                $je = floatval($fb_amt) * floatval($item['fk_fb_rate_gc']);
                $je += floatval($cl_amt) * floatval($item['fk_cl_rate_cg']);
                $month = date ( "Y-m", strtotime($item['fk_time']));
                //trace($item['fk_time']);
                //trace($month);
                $tmp_arr = array('je' => $je,'month' => $month);
                $fkyj_arr[] = $tmp_arr;
                //
                $month_arr[$month] = $month;
            }
        }
        //
        usort($month_arr,CMP_MONTH);
        //
        $categories = array();
        $category = array();
        for($i=0;$i<count($month_arr);$i++){
            $tmp = array();
            $tmp['label'] = $month_arr[$i];
            $category[] = $tmp;
        }
        $categories['category'] = $category;
        //
        $dataset = array();
        //
        $sksj_dataset = array();
        $sksj_dataset['seriesname'] = "收款实计";
        $sksj_data = array();
        for($i=0;$i<count($month_arr);$i++){
            $tmp = array();
            $tmp['value'] = "0.0";
            foreach($sksj_arr as $item){
                if($item['month'] <= $month_arr[$i]){
                    $tmp['value']  += floatval($item['je']);
                }
            }
            $sksj_data[] = $tmp;
        }
        $sksj_dataset['data'] = $sksj_data;
        $dataset[] = $sksj_dataset;
        //
        $skyj_dataset = array();
        $skyj_dataset['seriesname'] = "收款预计";
        $skyj_data = array();
        for($i=0;$i<count($month_arr);$i++){
            $tmp = array();
            $tmp['value'] = "0.0";
            foreach($skyj_arr as $item){
                if($item['month'] <= $month_arr[$i]){
                    $tmp['value']  += floatval($item['je']);
                }
            }
            $skyj_data[] = $tmp;
        }
        $skyj_dataset['data'] = $skyj_data;
        $dataset[] = $skyj_dataset;
        //
        $fkyj_dataset = array();
        $fkyj_dataset['seriesname'] = "付款预计";
        $fkyj_data = array();
        for($i=0;$i<count($month_arr);$i++){
            $tmp = array();
            $tmp['value'] = "0.0";
            foreach($fkyj_arr as $item){
                if($item['month'] <= $month_arr[$i]){
                    $tmp['value']  += floatval($item['je']);
                }
            }
            $fkyj_data[] = $tmp;
        }
        $fkyj_dataset['data'] = $fkyj_data;
        $dataset[] = $fkyj_dataset;
        //
        $yj_dataset = array();
        $yj_dataset['seriesname'] = "现金流预计";
        $yj_data = array();
        for($i=0;$i<count($month_arr);$i++){
            $tmp = array();
            $tmp['value'] = "0.0";
            foreach($skyj_arr as $item){
                if($item['month'] <= $month_arr[$i]){
                    $tmp['value']  += floatval($item['je']);
                }
            }
            foreach($fkyj_arr as $item){
                if($item['month'] <= $month_arr[$i]){
                    $tmp['value']  -= floatval($item['je']);
                }
            }
            $yj_data[] = $tmp;
        }
        $yj_dataset['data'] = $yj_data;
        $dataset[] = $yj_dataset;
        //
        $responce = array();
        $responce['categories'] = $categories;
        $responce['dataset'] = $dataset;
        trace($responce);
        $this->ajaxReturn($responce);
    }
    //时间管理：项目时间里程碑
    public function ajaxGetSjgl(){
        $pro_id = I('pro_id');
        $cond['pro_id'] = $pro_id;
        $Data   =   M("project");
        $project_detail = array();
        $project_detail = $Data->where($cond)->find();
        $nodes = $this->getAllSjNode($project_detail);
        $data = array();
        $cur_day_set_flag = false;
        for($i=0;$i<count($nodes);$i++){
            $node = $nodes[$i];
            $item = array();
            if(!$cur_day_set_flag){
                if(!empty($node['jh'])){
                    $now = time();
                    $now_str = date ( "Y-m-d", $now );
                    $jh = strtotime($node['jh']);
                    if(intval($now) < intval($jh) ){
                        $cur_day_set_flag = true;
                        //
                        $item_tmp = array();
                        $item_tmp["vline"] = true;
                        $item_tmp["label"] = "Today " . $now_str;
                        $item_tmp["showLabel"] = "1";
                        $item_tmp["color"] = "009933";
                        $data[] = $item_tmp;
                    }
                }
                if(!$cur_day_set_flag && !empty($node['sj'])){
                    $now = time();
                    $now_str = date ( "Y-m-d", $now );
                    $sj = strtotime($node['sj']);
                    if(intval($now) < intval($sj)){
                        $cur_day_set_flag = true;
                        //
                        $item_tmp = array();
                        $item_tmp["vline"] = true;
                        $item_tmp["label"] = "Today " . $now_str;
                        $item_tmp["showLabel"] = "1";
                        $item_tmp["color"] = "009933";
                        $data[] = $item_tmp;
                    }
                }
            }

            $item['label'] = $node['label'];
            $item["tooltext"] = $node['label'] . " \n计划: " . $node['jh'] . "\n实际: " . $node['sj'];
            if(false == $node['have_jh']){
                $item['value'] = "0";
                $item["tooltext"] = $node['label'] . "\n实际: " . $node['sj'];
                if(empty($node['sj'])){
                    $item['value'] = "0";
                    $item["anchorsides"] ="3";
                    $item["anchorradius"] ="8";
                    $item["anchorbgcolor"] ="ff0000";
                    $item["anchorbordercolor"] ="000000";
                    $item["anchorborderthickness"] ="2";
                }
            }else{
                $item["tooltext"] = $node['label'] . " \n计划: " . $node['jh'] . "\n实际: " . $node['sj'];
                if(empty($node['jh']) || empty($node['sj'])){
                    $item['value'] = "0";
                    $item["anchorsides"] ="4";
                    $item["anchorradius"] ="8";
                    $item["anchorbgcolor"] ="ff0000";
                    $item["anchorbordercolor"] ="000000";
                    $item["anchorborderthickness"] ="2";
                }else{
                    $inter = strtotime($node['sj']) - strtotime($node['jh']);
                    $inter_day = round($inter /(3600*24));
                    $item['value'] = $inter_day;
                    $item["tooltext"] = $node['label'] . " \n计划: " . $node['jh'] . "\n实际: " . $node['sj'] . "\n实际时间比计划时间";
                    if($inter_day > 0){
                        $item["tooltext"] .= "晚 $inter_day 天";
                    }else{
                        $item["tooltext"] .= "早 " . abs($inter_day) . " 天";
                    }
                }
            }
            $item["showLabel"] = "1";
            $data[] = $item;
        }
        //trace($data,"data");
        $this->ajaxReturn($data);
    }
    //项目时间里程碑
    private function getAllSjNode($r){
        $nodes = array();

        //里程碑节点
        //1.设计报批图提交日期
        $node = array();
        $node['label'] = "设计报批图提交日期";
        $node['jh'] = "";
        $node['sj'] = $r["sj_sjbpttj_time"];
        $node['have_jh'] = false;
        $nodes[] = $node;
        //2.机电报批图提交日期
        $node = array();
        $node['label'] = "机电报批图提交日期";
        $node['jh'] = "";
        $node['sj'] = $r["jd_jdbpttj_time"];
        $node['have_jh'] = false;
        $nodes[] = $node;
        //3.大厦报批提交日期
        $node = array();
        $node['label'] = "大厦报批提交日期";
        $node['jh'] = $r["gc_dsbptj_jh_time"];
        $node['sj'] = $r["gc_dsbptj_sj_time"];
        $node['have_jh'] = true;
        $nodes[] = $node;
        //4.大厦报批批准日期
        $node = array();
        $node['label'] = "大厦报批批准日期";
        $node['jh'] = "";
        $node['sj'] = $r["gc_dsbppz_time"];
        $node['have_jh'] = false;
        $nodes[] = $node;
        //5.消防报批提交日期
        $node = array();
        $node['label'] = "消防报批提交日期";
        $node['jh'] = $r["gc_xfbptj_jh_time"];
        $node['sj'] = $r["gc_xfbptj_sj_time"];
        $node['have_jh'] = true;
        $nodes[] = $node;
        //6.消防报批批准日期
        $node = array();
        $node['label'] = "消防报批批准日期";
        $node['jh'] = "";
        $node['sj'] = $r["gc_xfbppz_time"];
        $node['have_jh'] = false;
        $nodes[] = $node;
        //7.装修施工图提交日期
        $node = array();
        $node['label'] = "装修施工图提交日期";
        $node['jh'] = "";
        $node['sj'] = $r["sj_zxsgt_time"];
        $node['have_jh'] = false;
        $nodes[] = $node;
        //8.机电施工图提交日期
        $node = array();
        $node['label'] = "机电施工图提交日期";
        $node['jh'] = "";
        $node['sj'] = $r["jd_jdsgttj_time"];
        $node['have_jh'] = false;
        $nodes[] = $node;
        //9.采购内控单提交时间
        $node = array();
        $node['label'] = "采购内控单提交时间";
        $node['jh'] = "";
        $node['sj'] = $r["ys_cg_nkt_tj_time"];
        $node['have_jh'] = false;
        $nodes[] = $node;
        //10.现场内控单提交时间
        $node = array();
        $node['label'] = "现场内控单提交时间";
        $node['jh'] = "";
        $node['sj'] = $r["ys_xc_nkt_tj_time"];
        $node['have_jh'] = false;
        $nodes[] = $node;
        //11.收楼日期
        $node = array();
        $node['label'] = "收楼日期";
        $node['jh'] = "";
        $node['sj'] = $r["gc_sl_time"];
        $node['have_jh'] = false;
        $nodes[] = $node;
        //12.开工日期
        $node = array();
        $node['label'] = "开工日期";
        $node['jh'] = $r["gc_kg_jh_time"];
        $node['sj'] = $r["gc_kg_sj_time"];
        $node['have_jh'] = true;
        $nodes[] = $node;
        //13.隔墙隐检日期
        $node = array();
        $node['label'] = "隔墙隐检日期";
        $node['jh'] = $r["gc_gqyj_jh_time"];
        $node['sj'] = $r["gc_gqyj_sj_time"];
        $node['have_jh'] = true;
        $nodes[] = $node;
        //14.材料报批完成时间
        $node = array();
        $node['label'] = "材料报批完成时间";
        $node['jh'] = "";
        $node['sj'] = $r["cg_clbp_wc_time"];
        $node['have_jh'] = false;
        $nodes[] = $node;
        //15.机房移交日期
        $node = array();
        $node['label'] = "机房移交日期";
        $node['jh'] = $r["gc_jfyj_jh_time"];
        $node['sj'] = $r["gc_jfyj_sj_time"];
        $node['have_jh'] = true;
        $nodes[] = $node;
        //16.天花隐检日期
        $node = array();
        $node['label'] = "天花隐检日期";
        $node['jh'] = $r["gc_thyj_jh_time"];
        $node['sj'] = $r["gc_thyj_sj_time"];
        $node['have_jh'] = true;
        $nodes[] = $node;
        //17.装修竣工图提交时间
        $node = array();
        $node['label'] = "装修竣工图提交时间";
        $node['jh'] = "";
        $node['sj'] = $r["sj_zxjgt_time"];
        $node['have_jh'] = false;
        $nodes[] = $node;
        //18.机电竣工图提交时间
        $node = array();
        $node['label'] = "机电竣工图提交时间";
        $node['jh'] = "";
        $node['sj'] = $r["jd_jdjgttj_time"];
        $node['have_jh'] = false;
        $nodes[] = $node;
        //19.消防验收提交日期
        $node = array();
        $node['label'] = "消防验收提交日期";
        $node['jh'] = $r["gc_xfystj_jh_time"];
        $node['sj'] = $r["gc_xfystj_sj_time"];
        $node['have_jh'] = true;
        $nodes[] = $node;
        //20.消防验收批准日期
        $node = array();
        $node['label'] = "消防验收批准日期";
        $node['jh'] = "";
        $node['sj'] = $r["gc_xfyspz_time"];
        $node['have_jh'] = false;
        $nodes[] = $node;
        //21.项目完工日期(客户验收)
        $node = array();
        $node['label'] = "项目完工日期(客户验收)";
        $node['jh'] = $r["gc_xmwg_khys_jh_time"];
        $node['sj'] = $r["gc_xmwg_khys_sj_time"];
        $node['have_jh'] = true;
        $nodes[] = $node;
        //22.项目移交日期(用于质保期计算)
        $node = array();
        $node['label'] = "项目移交日期(用于质保期计算)";
        $node['jh'] = "";
        $node['sj'] = $r["gc_xmyj_yyzbqjs_time"];
        $node['have_jh'] = false;
        $nodes[] = $node;
        //23.竣工资料提交日期
        $node = array();
        $node['label'] = "竣工资料提交日期";
        $node['jh'] = "";
        $node['sj'] = $r["gc_jgzltj_time"];
        $node['have_jh'] = false;
        $nodes[] = $node;
        //24.客户搬家日期
        $node = array();
        $node['label'] = "客户搬家日期";
        $node['jh'] = $r["gc_khbj_jh_time"];
        $node['sj'] = $r["gc_khbj_sj_time"];
        $node['have_jh'] = true;
        $nodes[] = $node;
        //25.项目结算完成时间
        $node = array();
        $node['label'] = "项目结算完成时间";
        $node['jh'] = "";
        $node['sj'] = $r["ys_jswc_time"];
        $node['have_jh'] = false;
        $nodes[] = $node;
        //26.移交售后日期
        $node = array();
        $node['label'] = "移交售后日期";
        $node['jh'] = $r["gc_yjsh_jh_time"];
        $node['sj'] = $r["gc_yjsh_sj_time"];
        $node['have_jh'] = true;
        $nodes[] = $node;
        //27.质保期满时间
        $node = array();
        $node['label'] = "质保期满时间";
        $node['jh'] = "";
        $node['sj'] = $r["gc_zbqm_time"];
        $node['have_jh'] = false;
        $nodes[] = $node;

        //trace($nodes,"nodes");
        return $nodes;
    }
    //含汉字的字符串前后颠倒顺序
    private function mb_strrev( $mb_str ) {
        $newluokuan = "";
        $n = mb_strlen("$mb_str","UTF-8");
        for ($i=$n;$i>=0;$i--){
            $newluokuan .= mb_substr($mb_str,$i,1,'UTF-8');
        }
        return $newluokuan;
    }

    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
}
