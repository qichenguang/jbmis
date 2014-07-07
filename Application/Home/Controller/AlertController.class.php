<?php
namespace Home\Controller;
use Think\Controller;
class AlertController extends Controller {
    public function ajaxNotify(){
        $depsx = I('depsx');
        $cond = array();
        $cond['depsx'] = array('LIKE', "%$depsx%");
        $Data = M('alert'); // 实例化对象
        $count = $Data->where($cond)->count();// 查询满足要求的总记录数

        //
        $cond['alert_time'] = array('gt', strtotime("-3 day"));
        $day_3_count = $Data->where($cond)->count();// 查询满足要求的总记录数
        //
        $this->ajaxReturn(array('state' => true, 'count'=> $day_3_count,'msg' => "报警信息: 全部 $count 条, 最近3天共 $day_3_count 条,"));
    }
    public function alertsearch(){
        layout(false);
        layout(true);
        //显示用户列表
        $this->user_department = $_SESSION["department"];
        $this->display();
    }
    public function ajaxAlertSearch(){
        $pagenum = I('page',1); // get the requested page
        $limitnum = I('rows',20); // get how many rows we want to have into the grid
        $sidx = I('sidx','id'); // get index row - i.e. user click to sort
        $sord = I('sord','desc'); // get the direction
        if($sidx == ""){
            $sidx = 'id';
        }

        //手动查询标志
        $searchOn = I('_search');
        //多条件查询
        $cond = array();
        if(TRUE || 'true' == $searchOn) {
            $sarr = I('param.');
            foreach( $sarr as $k=>$v) {
                switch ($k) {
                    case 'msg':
                    case 'depsx':
                        $cond[$k] = array('LIKE', "%$v%");
                        break;
                    case 'id':
                    case 'pro_id':
                        $cond[$k] = $v;
                        break;
                }
            }
        }
        //单条件 find
        if(FALSE && 'true' == $searchOn){
            $searchField = I('searchField');
            $searchString = I('searchString');
            $searchOper = I('searchOper');
            $cond[$searchField] = array('LIKE', "%$searchString%");
        }
        //
        $Data = null;

        $Data = M('alert'); // 实例化对象


        $count = $Data->where($cond)->order(array($sidx => $sord))->count();// 查询满足要求的总记录数
        $list =  $Data->where($cond)->order(array($sidx => $sord))->page($pagenum,$limitnum)->select();

        $total_pages = 0;
        if( $count >0 ) {
            $total_pages = ceil($count/$limitnum);
        }
        $responce["page"] = $pagenum;
        $responce["total"] = $total_pages;
        $responce["records"] = $count;

        $i=0;
        if(!empty($list)){
            foreach($list as $item){
                $responce["rows"][$i]['id']=$item["id"];
                $responce["rows"][$i]['cell'] = array($item['id'],
                    $item['pro_id'],$item['msg'],$item['depsx'],$item['alert_time'],);
                $i++;
            }
        }
        $this->ajaxReturn($responce);
    }

    public function getDayAlerts(){
        //
        $Data = M("project");
        $cond['status'] = 2;
        $cond['sc_zb_flag'] = 'B';
        $project_liset = $Data->where($cond)->select();

        $Alert = M("alert");
        $alert_arr = array();
        foreach($project_liset as $item){
            //over time
            $alert_arr[] = $this->getOverTime1($item);$alert_arr[] = $this->getOverTime5($item);$alert_arr[] = $this->getOverTime9($item);
            $alert_arr[] = $this->getOverTime2($item);$alert_arr[] = $this->getOverTime6($item);$alert_arr[] = $this->getOverTime10($item);
            $alert_arr[] = $this->getOverTime3($item);$alert_arr[] = $this->getOverTime7($item);$alert_arr[] = $this->getOverTime11($item);
            $alert_arr[] = $this->getOverTime4($item);$alert_arr[] = $this->getOverTime8($item);
            //Low Myd
            $this->getCommLowMyd($item,$alert_arr);
            //成本管理
            $this->getCommCbglLowRate($item,$alert_arr);

            //报警信息 插入 Alet 表
            $condition = array();
            $condition["pro_id"] = $item["pro_id"];
            $condition["alert_time"] = date('Y-m-d');
            $Alert->where($condition)->delete();
            //
            foreach($alert_arr as $cur_arr){
                if(strlen($cur_arr["title"]) > 0){
                    //inset
                    $condition["pro_id"] = $item["pro_id"];
                    $condition["msg"] = $cur_arr["title"];
                    $condition["depsx"] = implode(",", $cur_arr["dep"]);
                    $condition["alert_time"] = date('Y-m-d');
                    $result  = $Alert->add($condition);
                }
            }
            //
            $alert_arr = array();
        }
    }

    //1. 采购内控单提交时间 晚于 项目实际开工时间
    private function getOverTime1($item){
        $ys_cg_nkt_tj_time = $item["ys_cg_nkt_tj_time"];
        $gc_kg_sj_time = $item["gc_kg_sj_time"];
        trace($ys_cg_nkt_tj_time);
        trace($gc_kg_sj_time);
        if(!empty($ys_cg_nkt_tj_time) && !empty($gc_kg_sj_time)){
            $nkt = strtotime($ys_cg_nkt_tj_time);
            $sj = strtotime($gc_kg_sj_time);
            trace($nkt);
            trace($sj);
            if($nkt > $sj){
                trace("alert");
                return array(
                    "title" => "采购内控单提交时间 晚于 项目实际开工时间",
                    'dep' => array('cg','ys','gc'),
                );
            }
        }
        return null;
    }
    //2. 现场内控单提交时间 晚于 项目实际开工时间
    private function getOverTime2($item){
        $ys_xc_nkt_tj_time = $item["ys_xc_nkt_tj_time"];
        $gc_kg_sj_time = $item["gc_kg_sj_time"];
        trace($ys_xc_nkt_tj_time);
        trace($gc_kg_sj_time);
        if(!empty($ys_xc_nkt_tj_time) && !empty($gc_kg_sj_time)){
            $nkt = strtotime($ys_xc_nkt_tj_time);
            $sj = strtotime($gc_kg_sj_time);
            trace($nkt);
            trace($sj);
            if($nkt > $sj){
                trace("alert");
                return array(
                    "title" => "现场内控单提交时间 晚于 项目实际开工时间",
                    'dep' => array('cg','ys','gc'),
                );
            }
        }
        return null;
    }
    //3. 设计部报批图时间 晚于 计划大厦报批递交时间
    private function getOverTime3($item){
        $sj_sjbpttj_time = $item["sj_sjbpttj_time"];
        $gc_dsbptj_jh_time = $item["gc_dsbptj_jh_time"];
        trace($sj_sjbpttj_time);
        trace($gc_dsbptj_jh_time);
        if(!empty($sj_sjbpttj_time) && !empty($gc_dsbptj_jh_time)){
            $pttj = strtotime($sj_sjbpttj_time);
            $jh = strtotime($gc_dsbptj_jh_time);
            trace($pttj);
            trace($jh);
            if($pttj > $jh){
                trace("alert");
                return array(
                    "title" => "设计部报批图时间 晚于 计划大厦报批递交时间",
                    'dep' => array('gc','jd','sj'),
                );
            }
        }
        return null;
    }
    //4. 机电部报批图时间 晚于 计划大厦报批递交时间
    private function getOverTime4($item){
        $jd_jdbpttj_time = $item["jd_jdbpttj_time"];
        $gc_dsbptj_jh_time = $item["gc_dsbptj_jh_time"];
        trace($jd_jdbpttj_time);
        trace($gc_dsbptj_jh_time);
        if(!empty($jd_jdbpttj_time) && !empty($gc_dsbptj_jh_time)){
            $pttj = strtotime($jd_jdbpttj_time);
            $jh = strtotime($gc_dsbptj_jh_time);
            trace($pttj);
            trace($jh);
            if($pttj > $jh){
                trace("alert");
                return array(
                    "title" => "机电部报批图时间 晚于 计划大厦报批递交时间",
                    'dep' => array('gc','jd','sj'),
                );
            }
        }
        return null;
    }
    //5. 设计部施工图时间 晚于 项目实际开工时间 + 2周
    private function getOverTime5($item){
        $sj_zxsgt_time = $item["sj_zxsgt_time"];
        $gc_kg_sj_time = $item["gc_kg_sj_time"];
        trace($sj_zxsgt_time);
        trace($gc_kg_sj_time);
        if(!empty($sj_zxsgt_time) && !empty($gc_kg_sj_time)){
            $sgt = strtotime($sj_zxsgt_time);
            $sj = strtotime($gc_kg_sj_time) + (3600*24*14);
            trace($sgt);
            trace($sj);
            if($sgt > $sj){
                trace("alert");
                return array(
                    "title" => "设计部施工图时间 晚于 项目实际开工时间 + 2周",
                    'dep' => array('gc','jd','sj'),
                );
            }
        }
        return null;
    }
    //6. 机电部施工图时间 晚于 项目实际开工时间 + 2周
    private function getOverTime6($item){
        $jd_jdsgttj_time = $item["jd_jdsgttj_time"];
        $gc_kg_sj_time = $item["gc_kg_sj_time"];
        trace($jd_jdsgttj_time);
        trace($gc_kg_sj_time);
        if(!empty($jd_jdsgttj_time) && !empty($gc_kg_sj_time)){
            $sgt = strtotime($jd_jdsgttj_time);
            $sj = strtotime($gc_kg_sj_time) + (3600*24*14);
            trace($sgt);
            trace($sj);
            if($sgt > $sj){
                trace("alert");
                return array(
                    "title" => "机电部施工图时间 晚于 项目实际开工时间 + 2周",
                    'dep' => array('gc','jd','sj'),
                );
            }
        }
        return null;
    }
    //
    private function getCommOverTime($timeStrA,$a_sec,$timeStrB,$b_sec,$conditon){
        if(!empty($timeStrA) && !empty($timeStrB)){
            $timeA = strtotime($timeStrA) + intval($a_sec);
            $timeB = strtotime($timeStrB) + intval($b_sec);
            trace($timeA);
            trace($timeB);
            if("gt" == $conditon){
                if($timeA > $timeB){
                    trace("alert");
                    return true;
                }
            }
        }
        return false;
    }
    //
    //7. 设计部竣工图时间 晚于 项目完工时间 + 2周
    private function getOverTime7($item){
        $sj_zxjgt_time = $item["sj_zxjgt_time"];
        $gc_xmwg_khys_sj_time = $item["gc_xmwg_khys_sj_time"];

        $ret = $this->getCommOverTime($sj_zxjgt_time,0,$gc_xmwg_khys_sj_time,3600*24*14,"gt");
        if($ret){
            return array(
                "title" => "设计部竣工图时间 晚于 项目完工时间 + 2周",
                'dep' => array('gc','jd','sj'),
            );
        }
        return null;
    }
    //8. 机电部竣工图时间 晚于 项目完工时间 + 2周
    private function getOverTime8($item){
        $jd_jdjgttj_time = $item["jd_jdjgttj_time"];
        $gc_xmwg_khys_sj_time = $item["gc_xmwg_khys_sj_time"];

        $ret = $this->getCommOverTime($jd_jdjgttj_time,0,$gc_xmwg_khys_sj_time,3600*24*14,"gt");
        if($ret){
            return array(
                "title" => "机电部竣工图时间 晚于 项目完工时间 + 2周",
                'dep' => array('gc','jd','sj'),
            );
        }
        return null;
    }
    //9. 材料报批完成时间 晚于 项目实际开工时间 + 1 周
    private function getOverTime9($item){
        $timeAStr = $item["cg_clbp_wc_time"];
        $timeBStr = $item["gc_kg_sj_time"];

        $ret = $this->getCommOverTime($timeAStr,0,$timeBStr,3600*24*7,"gt");
        if($ret){
            return array(
                "title" => "材料报批完成时间 晚于 项目实际开工时间 + 1周",
                'dep' => array('cg','ys','gc','jd','sj'),
            );
        }
        return null;
    }
    //10. 实际消防报批提交时间 晚于 计划消防报批提交时间 + 1周
    private function getOverTime10($item){
        $timeAStr = $item["gc_xfbptj_sj_time"];
        $timeBStr = $item["gc_xfbptj_jh_time"];

        $ret = $this->getCommOverTime($timeAStr,0,$timeBStr,3600*24*7,"gt");
        if($ret){
            return array(
                "title" => "实际消防报批提交时间 晚于 计划消防报批提交时间 + 1周",
                'dep' => array('gc','gl'),
            );
        }
        return null;
    }
    //11. 项目质保期到
    private function getOverTime11($item){
        $timeAStr = $item["gc_zbqm_time"];
        $ret = false;
        if(!empty($timeStrA)){
            $timeA = strtotime($timeStrA);
            $timeB = time();
            if($timeA > $timeB){
                $ret = true;
            }
        }

        if($ret){
            return array(
                "title" => "项目质保期到",
                'dep' => array('gc','ht','ys'),
            );
        }
        return null;
    }
    //
    private function getCommLowMyd($item,$alert_arr){
        $sj_num=2;$sg_num=2;$sh_num=2;
        $num_arr = array($sj_num,$sg_num,$sh_num);
        $key_arr = array("sc_sj_myd_","sc_sg_myd_","sh_sh_myd_");
        $msg_arr = array("设计满意度","施工满意度","售后服务满意度");

        for($i=0;$i<count($num_arr);$i++){
            $cur_num = $num_arr[$i];
            for($j=1;$j<=$cur_num;$j++){
                $cur_key = $key_arr[$i] . $j;
                $myd = $item[$cur_key];
                if(!empty($myd)){
                    if("D" == $myd || "E" == $myd){
                        //工程部；设计部；机电部；预算部；采购部；管理部
                        $msg = $msg_arr[$i] . " 第 " . $j . " 项 : 不太满意或不满意";
                        $cur_arr = array(
                            "title" => $msg,
                            'dep' => array('gc','sj','jd','ys','cg','gl'),
                        );
                        $alert_arr[] = $cur_arr;
                    }
                    if(0 == $i && "C" == $myd){
                        //设计；机电
                        $msg = $msg_arr[$i] . " 第 " . $j . " 项 : 基本满意";
                        $cur_arr = array(
                            "title" => $msg,
                            'dep' => array('sj','jd'),
                        );
                        $alert_arr[] = $cur_arr;
                    }
                    if(1 == $i && "C" == $myd){
                        //工程
                        $msg = $msg_arr[$i] . " 第 " . $j . " 项 : 基本满意";
                        $cur_arr = array(
                            "title" => $msg,
                            'dep' => array('gc'),
                        );
                        $alert_arr[] = $cur_arr;
                    }
                }
            }
        }
    }
    //成本管理
    private function getCommCbglLowRate($item,$alert_arr){
        $fb_lx_arr = USER_FUN_GET_FBS_TYPE_NAME();
        //1.任一分包横轴项目实际发生成本大于内控金额
        foreach($fb_lx_arr as $fb_lx => $fb_lx_name){
            $key_sjcb = "ys_" . $fb_lx . "_sjcb";
            $key_nkje = "ys_" . $fb_lx . "_nkje";
            $sjcb = $item[$key_sjcb];
            $nkje = $item[$key_nkje];
            if(!empty($sjcb) && !empty($nkje)){
                if(floatval($sjcb) > 0.01 && floatval($nkje) > 0.01){
                    if(floatval($sjcb) > floatval($nkje)){
                        $msg = "$fb_lx_name 实际发生成本($sjcb) 大于内控金额($nkje)";
                        //工程部；合同管理；预算部
                        $cur_arr = array(
                            "title" => $msg,
                            'dep' => array('gc','ht','ys'),
                        );
                        $alert_arr[] = $cur_arr;
                    }
                }
            }
        }
        //2.任一采购横轴项目实际发生成本大于内控金额
        if(true){
            $Data = M("cg_vo");
            $cond['pro_id'] = $item['pro_id'];
            $cg_je = $Data->where($cond)->sum('cg_je');
            $cg_gckc_sjcb = $item["cg_gckc_sjcb"];
            $cg_gcrgf_sjcb = $item["cg_gcrgf_sjcb"];
            $ys_cg_all_nkje = $item["ys_cg_all_nkje"];
            $sjcb = floatval($cg_je) + floatval($cg_gckc_sjcb) + floatval($cg_gcrgf_sjcb);
            $nkje = floatval($ys_cg_all_nkje);
            if($sjcb > 0.01 && $nkje > 0.01){
                if($sjcb > $nkje){
                    $msg = "采购 实际发生成本($sjcb) 大于内控金额($nkje)";
                    //工程部；合同管理；预算部；采购部
                    $cur_arr = array(
                        "title" => $msg,
                        'dep' => array('gc','ht','ys','cg'),
                    );
                    $alert_arr[] = $cur_arr;
                }
            }
        }
        //3.前期横轴项目实际发生成本大于内控金额
        //4.任一分包横轴项目实际毛利率小于开工毛利率
        foreach($fb_lx_arr as $fb_lx => $fb_lx_name){
            $key_dwbj = "ys_" . $fb_lx . "_dwbj";
            $dwbj = $item[$key_dwbj];
            //
            $Data = M("customer_vo");
            $cond['pro_id'] = $item['pro_id'];
            $cond['vo_type'] = $fb_lx;
            $customer_vo = $Data->where($cond)->sum('vo_je');
            //
            $key_sjcb = "ys_" . $fb_lx . "_sjcb";
            $sjcb = $item[$key_sjcb];
            //
            $Data = M("fb_vo");
            $cond['pro_id'] = $item['pro_id'];
            $cond['vo_type'] = $fb_lx;
            $fb_vo = $Data->where($cond)->sum('vo_je');
            //
            $key_nkje = "ys_" . $fb_lx . "_nkje";
            $nkje = $item[$key_nkje];
            //
            if(floatval($dwbj) > 0.01 && floatval($sjcb) > 0.01){
                $kgmll = (floatval($dwbj) - floatval($nkje))/floatval($dwbj);
                $sjmll = (floatval($dwbj) + floatval($customer_vo) - floatval($sjcb) - floatval($fb_vo))/(floatval($dwbj) + floatval($customer_vo));
                if($sjmll < $kgmll){
                    $msg = "$fb_lx_name 实际毛利率($sjmll) 小于 开工毛利率($kgmll)";
                    //工程部；合同管理；预算部
                    $cur_arr = array(
                        "title" => $msg,
                        'dep' => array('gc','ht','ys'),
                    );
                    $alert_arr[] = $cur_arr;
                }
            }
        }
        //5.任一采购横轴项目实际毛利率小于开工毛利率
        if(true){
            //1.
            $ys_cg_all_dwbj = $item["ys_cg_all_dwbj"];
            //2.
            $Data = M("customer_vo");
            $cond = array();
            $cond['pro_id'] = $item['pro_id'];
            $cond['vo_type'] = 'cg';
            $customer_vo = $Data->where($cond)->sum('vo_je');
            //3.
            $Data = M("cg_vo");
            $cond = array();
            $cond['pro_id'] = $item['pro_id'];
            $cgje = $Data->where($cond)->sum('cg_je');
            $cg_gckc_sjcb = $item["cg_gckc_sjcb"];
            $cg_gcrgf_sjcb = $item["cg_gcrgf_sjcb"];
            //4.
            $vo1_je = $Data->where($cond)->sum('vo1_je');
            $vo2_je = $Data->where($cond)->sum('vo2_je');
            $vo3_je = $Data->where($cond)->sum('vo3_je');
            $cg_gckc_sjcb_vo = $item["cg_gckc_sjcb_vo"];
            $cg_gcrgf_sjcb_vo = $item["cg_gcrgf_sjcb_vo"];
            //
            $ys_cg_all_nkje = $item["ys_cg_all_nkje"];
            //
            if(floatval($ys_cg_all_dwbj) > 0.01){
                $kgmll = (floatval($dwbj) - floatval($ys_cg_all_nkje))/floatval($ys_cg_all_nkje);
                $sjmll = (floatval($dwbj) + floatval($customer_vo)
                        - (floatval($cgje) + floatval($cg_gckc_sjcb) + floatval($cg_gcrgf_sjcb))
                        - (floatval($vo1_je) + floatval($vo2_je) + floatval($vo3_je) + floatval($cg_gckc_sjcb_vo) + floatval($cg_gcrgf_sjcb_vo)))
                    /(floatval($dwbj) + floatval($customer_vo));
                //
                if($sjmll < $kgmll){
                    $msg = "采购 实际毛利率($sjmll) 小于 开工毛利率($kgmll)";
                    //工程部；合同管理；预算部；采购部
                    $cur_arr = array(
                        "title" => $msg,
                        'dep' => array('gc','ht','ys','cg'),
                    );
                    $alert_arr[] = $cur_arr;
                }
            }
        }
        //6.前期横轴项目实际毛利率小于开工毛利率
        //7.
    }
}
