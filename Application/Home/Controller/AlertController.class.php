<?php
namespace Home\Controller;
use Think\Controller;
class AlertController extends Controller {
    public function ajaxNotify(){
        $depsx = I('depsx');
        $cond = array();
        $cond['depsx'] = array('LIKE', "%$depsx%");
        $cond['fgs'] = $_SESSION['fgs'];
        //$cond['alert_time'] = array('gt', strtotime("-14 day"));
        $cond['alert_time'] = date('Y-m-d');
        $Data = M('alert'); // 实例化对象
        $count = $Data->where($cond)->count();// 查询满足要求的总记录数
        $this->ajaxReturn(array('state' => true, 'count'=> $count,'msg' => "报警信息: 今天有 $count 条 报警信息"));
        //$day_14_count = $Data->where($cond)->count();// 查询满足要求的总记录数
        //$this->ajaxReturn(array('state' => true, 'count'=> $day_14_count,'msg' => "报警信息: 最近两周共 $day_14_count 条,"));
        //
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
        $cond['fgs'] = $_SESSION['fgs'];
        //单条件 find
        if(FALSE && 'true' == $searchOn){
            $searchField = I('searchField');
            $searchString = I('searchString');
            $searchOper = I('searchOper');
            $cond[$searchField] = array('LIKE', "%$searchString%");
        }
        //
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
                    $item['pro_id'],$item['alert_msg'],$item['depsx'],$item['alert_time'],);
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
        //
        $Alert = M("alert");
        $alert_arr = array();
        foreach($project_liset as $item){
            //over time
            $alert_arr = $this->find_alert_time($item);
            trace($alert_arr,"alert_arr");
            //Low Myd
            $myd_alert_all = $this->getCommLowMyd($item,$alert_arr);
            $alert_arr = array_merge($alert_arr,$myd_alert_all);
            //成本管理
            //$this->getCommCbglLowRate($item,$alert_arr);
            //----------------------------------------------------------------------------------------------------------
            //报警信息 插入 Alet 表
            $cond = array();
            $cond["pro_id"] = $item["pro_id"];
            $cond["alert_time"] = date('Y-m-d');
            $Alert->where($cond)->delete();
            //
            foreach($alert_arr as $cur_arr){
                //select
                $condition = array();
                $condition["pro_id"] = $item["pro_id"];
                $condition["fgs"] = $item["fgs"];
                $condition["lx"] = $cur_arr["lx"];
                $condition["alert_msg"] = $cur_arr["alert_msg"];
                $count = $Alert->where($condition)->count();
                if($count > 0){
                    continue;
                }
                //
                $condition["depsx"] = implode(",", $cur_arr["alert_dep"]);
                $condition["alert_time"] = date('Y-m-d');
                $condition["alert_day_num"] = $cur_arr["alert_day_num"];
                //
                $recordtime = strtotime ($cur_arr["alert_day_num"] . " days" );
                $alert_last_day = date ( "Y-m-d", $recordtime );
                //
                $condition["alert_last_day"] = $alert_last_day;
                //inset
                $result  = $Alert->add($condition);
            }
            //
            $alert_arr = array();
        }
    }
    //------------------------------------------------------------------------------------------------------------------
    private $time_alert_array = array(
        //1. 采购内控单提交时间 晚于 项目实际开工时间
        array('lx'=>1,'fieldA' => "ys_cg_nkt_tj_time",'secA'=>0,'fieldB' =>"gc_kg_sj_time",'secB' =>0,'condition'=>'gt',
          'alert_dep' => array('cg','ys','gc'),
          'alert_msg' => "采购内控单提交时间(FIELDA) 晚于 项目实际开工时间(FIELDB)",
          'alert_day_num' => 1,
        ),
        //2. 现场内控单提交时间 晚于 项目实际开工时间
        array('lx'=>2,'fieldA' => "ys_xc_nkt_tj_time",'secA'=>0,'fieldB' =>"gc_kg_sj_time",'secB' =>0,'condition'=>'gt',
            'alert_dep' => array('cg','ys','gc'),
            'alert_msg' => "现场内控单提交时间(FIELDA) 晚于 项目实际开工时间(FIELDB)",
            'alert_day_num' => 1,
        ),
        //3. 设计部报批图时间 晚于 计划大厦报批递交时间
        array('lx'=>3,'fieldA' => "sj_sjbpttj_time",'secA'=>0,'fieldB' =>"gc_dsbptj_jh_time",'secB' =>0,'condition'=>'gt',
            'alert_dep' => array('gc','jd','sj'),
            'alert_msg' => "设计部报批图时间(FIELDA) 晚于 计划大厦报批递交时间(FIELDB)",
            'alert_day_num' => 1,
        ),
        //4. 机电部报批图时间 晚于 计划大厦报批递交时间
        array('lx'=>4,'fieldA' => "jd_jdbpttj_time",'secA'=>0,'fieldB' =>"gc_dsbptj_jh_time",'secB' =>0,'condition'=>'gt',
            'alert_dep' =>  array('gc','jd','sj'),
            'alert_msg' => "机电部报批图时间(FIELDA) 晚于 计划大厦报批递交时间(FIELDB)",
            'alert_day_num' => 1,
        ),
        //5. 设计部施工图时间 晚于 项目实际开工时间 + 2周
        array('lx'=>5,'fieldA' => "sj_zxsgt_time",'secA'=>0,'fieldB' =>"gc_kg_sj_time",'secB' =>1209600,'condition'=>'gt',
            'alert_dep' => array('gc','jd','sj'),
            'alert_msg' => "设计部施工图时间(FIELDA) 晚于 项目实际开工时间(FIELDB) + 2周",
            'alert_day_num' => 1,
        ),
        //6. 机电部施工图时间 晚于 项目实际开工时间 + 2周
        array('lx'=>6,'fieldA' => "jd_jdsgttj_time",'secA'=>0,'fieldB' =>"gc_kg_sj_time",'secB' =>1209600,'condition'=>'gt',
            'alert_dep' => array('gc','jd','sj'),
            'alert_msg' => "机电部施工图时间(FIELDA) 晚于 项目实际开工时间(FIELDB) + 2周",
            'alert_day_num' => 1,
        ),
        //7. 设计部竣工图时间 晚于 项目完工时间 + 2周
        array('lx'=>7,'fieldA' => "sj_zxjgt_time",'secA'=>0,'fieldB' =>"gc_xmwg_khys_sj_time",'secB' =>1209600,'condition'=>'gt',
            'alert_dep' => array('gc','jd','sj'),
            'alert_msg' => "设计部竣工图时间(FIELDA) 晚于 项目完工时间(FIELDB) + 2周",
            'alert_day_num' => 1,
        ),
        //8. 机电部竣工图时间 晚于 项目完工时间 + 2周
        array('lx'=>8,'fieldA' => "jd_jdjgttj_time",'secA'=>0,'fieldB' =>"gc_xmwg_khys_sj_time",'secB' =>1209600,'condition'=>'gt',
            'alert_dep' => array('gc','jd','sj'),
            'alert_msg' => "机电部竣工图时间(FIELDA) 晚于 项目完工时间(FIELDB) + 2周",
            'alert_day_num' => 1,
        ),
        //9. 材料报批完成时间 晚于 项目实际开工时间 + 1 周
        array('lx'=>9,'fieldA' => "cg_clbp_wc_time",'secA'=>0,'fieldB' =>"gc_kg_sj_time",'secB' =>604800,'condition'=>'gt',
            'alert_dep' => array('cg','ys','gc','jd','sj'),
            'alert_msg' => "材料报批完成时间(FIELDA) 晚于 项目实际开工时间(FIELDB) + 1周",
            'alert_day_num' => 1,
        ),
        //10. 实际消防报批提交时间 晚于 计划消防报批提交时间 + 1周
        array('lx'=>10,'fieldA' => "gc_xfbptj_sj_time",'secA'=>0,'fieldB' =>"gc_xfbptj_jh_time",'secB' =>604800,'condition'=>'gt',
            'alert_dep' => array('gc','gl'),
            'alert_msg' => "实际消防报批提交时间(FIELDA) 晚于 计划消防报批提交时间(FIELDB) + 1周",
            'alert_day_num' => 1,
        ),
        //11. 项目质保期到 提前两周报
        array('lx'=>11,'fieldA' => "gc_zbqm_time",'secA'=>1209600,'fieldB' =>"",'secB' =>0,'condition'=>'gt',
            'alert_dep' => array('gc','ht','ys'),
            'alert_msg' => "项目质保期(FIELDA) 约两周后到期",
            'alert_day_num' => 1,
        ),
    );
    private function find_alert_time($rec){
        $alert_all_time_arr = array();
        foreach($this->time_alert_array as $cur){
            $a_str = $rec[$cur['fieldA']];
            $b_str = "";
            if("" == $cur['fieldB']){
                $b_str = date("Y-m-d");
            }else{
                $b_str = $rec[$cur['fieldB']];
            }
            if(!empty($a_str) && !empty($b_str)){
                $a_time_src = strtotime($a_str);
                $b_time_src = strtotime($b_str);
                $a_time = $a_time_src + intval($cur['secA']);
                $b_time = $b_time_src + intval($cur['secB']);
                if("gt" == $cur["condition"]){
                    if($a_time > $b_time){
                        $alert_msg = $cur["alert_msg"];
                        $alert_msg = str_replace("FIELDA", date ( "Y-m-d", $a_time_src ), $alert_msg);
                        $alert_msg = str_replace("FIELDB", date ( "Y-m-d", $b_time_src ), $alert_msg);
                        $alert_array = array(
                            'lx' => $cur['lx'],
                            'alert_dep' => $cur["alert_dep"],
                            'alert_msg' => $alert_msg,
                            'alert_day_num' => 1,
                        );
                        $alert_all_time_arr[] = $alert_array;
                    }
                }
            }
        }
        return $alert_all_time_arr;
    }
    //------------------------------------------------------------------------------------------------------------------
    private function getCommLowMyd($project_rec){
        $myd_alert_all = array();
        $myd_list_all = USER_FUN_GET_MYD_LIST_NAME();
        foreach($myd_list_all as $myd_list_item){
            $sub_rec_arr = $myd_list_item["item"];
            for($i=1;$i<=count($sub_rec_arr);$i++){
                $myd_key = $myd_list_item["prev"] . $i;
                trace($myd_key);
                $myd_val = $project_rec[$myd_key];
                if(!empty($myd_val)){
                    if("D" == $myd_val || "E" == $myd_val){
                        $alert_msg = $myd_list_item["name"] . " 第 " . $i . " 项:\n" . $sub_rec_arr[$i] . ":\n 不太满意或不满意";
                        $cur_arr = array(
                            'lx' => intval($myd_list_item["lx_base"]) + intval($i),
                            'alert_dep' => array('gc','sj','jd','ys','cg','gl'),
                            'alert_msg' => $alert_msg,
                            'alert_day_num' => 1,
                        );
                        $myd_alert_all[] = $cur_arr;
                    }
                    if("C" == $myd_val && "sj" == $myd_list_item["sx"] && "sj" == $myd_list_item["lx"]){
                        $alert_msg = $myd_list_item["name"] . " 第 " . $i . " 项:\n" . $sub_rec_arr[$i] . ":\n 基本满意";
                        $cur_arr = array(
                            'lx' => intval($myd_list_item["lx_base"]) + intval($i),
                            'alert_dep' => array('sj','jd'),
                            'alert_msg' => $alert_msg,
                            'alert_day_num' => 1,
                        );
                        $myd_alert_all[] = $cur_arr;
                    }
                    if("C" == $myd_val && "sg" == $myd_list_item["sx"] && "sg" == $myd_list_item["lx"]){
                        $alert_msg = $myd_list_item["name"] . " 第 " . $i . " 项:\n" . $sub_rec_arr[$i] . ":\n 基本满意";
                        $cur_arr = array(
                            'lx' => intval($myd_list_item["lx_base"]) + intval($i),
                            'alert_dep' => array('gc'),
                            'alert_msg' => $alert_msg,
                            'alert_day_num' => 1,
                        );
                        $myd_alert_all[] = $cur_arr;
                    }
                }
            }
        }
        return $myd_alert_all;
    }
    //------------------------------------------------------------------------------------------------------------------
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
