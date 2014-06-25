<?php
namespace Home\Controller;
use Think\Controller;
class FusionController extends Controller {
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
        $categories = array();
        $category = array();
        foreach($month_arr as $key => $value){
            $tmp = array();
            $tmp['label'] = $key;
            $category[] = $tmp;
        }
        $categories['category'] = $category;
        //
        $dataset = array();
        //
        $sksj_dataset = array();
        $sksj_dataset['seriesname'] = "收款实计";
        $sksj_data = array();
        foreach($month_arr as $key => $value){
            $tmp = array();
            $tmp['value'] = "0.0";
            foreach($sksj_arr as $item){
                if($item['month'] == $key){
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
        foreach($month_arr as $key => $value){
            $tmp = array();
            $tmp['value'] = "0.0";
            foreach($skyj_arr as $item){
                if($item['month'] == $key){
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
        foreach($month_arr as $key => $value){
            $tmp = array();
            $tmp['value'] = "0.0";
            foreach($fkyj_arr as $item){
                if($item['month'] == $key){
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
        foreach($month_arr as $key => $value){
            $tmp = array();
            $tmp['value'] = "0.0";
            foreach($skyj_arr as $item){
                if($item['month'] == $key){
                    $tmp['value']  += floatval($item['je']);
                }
            }
            foreach($fkyj_arr as $item){
                if($item['month'] == $key){
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
    function mb_strrev( $mb_str ) {
        $newluokuan = "";
        $n = mb_strlen("$mb_str","UTF-8");
        for ($i=$n;$i>=0;$i--){
            $newluokuan .= mb_substr($mb_str,$i,1,'UTF-8');
        }
        return $newluokuan;
    }
    //时间管理
    public function ajaxGetSjgl(){
        $pro_id = I('pro_id');
        $cond['pro_id'] = $pro_id;
        $Data   =   M("project");
        $project_detail = array();
        $project_detail = $Data->where($cond)->find();
        $nodes = $this->getAllSjNode($project_detail);
        $data = array();
        for($i=0;$i<count($nodes);$i++){
            $node = $nodes[$i];
            $item = array();
            $item['label'] = $node['label'];
            $item["toolTip"] = $node['label'];
            if(false == $node['have_jh']){
                $item['value'] = "0";
            }else{
                if(empty($node['jh']) || empty($node['sj'])){
                    $item['value'] = "0";
                }else{
                    $inter = strtotime($node['sj']) - strtotime($node['jh']);
                    $inter_day = round($inter /(3600*24));
                    $item['value'] = $inter_day;
                    $item["toolTip"] = $node['label'] . " 实际时间比计划时间";
                    if($inter_day > 0){
                        $item["toolTip"] .= "早 $inter_day 天";
                    }else{
                        $item["toolTip"] .= "晚 " . abs($inter_day) . " 天";
                    }
                }
            }
            $item["showLabel"] = "1";
            //
            //$item['label'] = $this->mb_strrev($item['label']);
            //$item["label"] =  $item["value"];
            //$item["value"] = $item['toolTip'];

            $data[] = $item;
        }
        //trace($data,"data");
        $this->ajaxReturn($data);
    }
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
}
