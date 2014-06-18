<?php
namespace Home\Controller;
use Think\Controller;
class AlertController extends Controller {

    public function getDayAlerts(){
        //
        $Data = M("project");
        $cond['status'] = 2;
        $cond['sc_zb_flag'] = 'B';
        $project_liset = $Data->where($cond)->select();


        foreach($project_liset as $item){
            //1.采购内控单提交时间 晚于 项目实际开工时间
            //ys_cg_nkt_tj_time  gc_kg_jh_time
            $this->getOverTime($item);
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
    //10. 材料报批完成时间 晚于 项目实际开工时间 + 1 周
    private function getOverTime10($item){
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
    //11. 实际消防报批提交时间 晚于 计划消防报批提交时间 + 1周
    private function getOverTime11($item){
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
    //12. 项目质保期到
    private function getOverTime12($item){
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
}
