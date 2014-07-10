<?php

function CMP_MONTH($a, $b){
    if ($a == $b) {
        return 0;
    }
    return ($a < $b) ? -1 : 1;
}
function USER_FUN_GET_ZB_FLAG_NAME(){
    $in_type = array(
        'A' => "落标",
        'B' => "中标",
    );
    return $in_type;
}
function USER_FUN_GET_FGS_FLAG_NAME(){
    $in_type = array(
        'A' => "北京公司",
        'B' => "上海分公司",
        'C' => "广深办事处",
        'D' => "天津办事处",
        'E' => "成都办事处",
        'F' => "新加坡分公司",
        'G' => "香港分公司",
    );
    return $in_type;
}
function USER_FUN_GET_GYS_FB_HT_LX_NAME(){
    $arr = array(
        'A' => "投标",
        'B' => "询价",
        'C' => "直接指定",
        'D' => "客户指定",
        'E' => "长期协议");
    return $arr;
}
function USER_FUN_GET_ZJL_SKSJ_BS_NAME(){
    $arr = array(
        '0.1'=>'首付款',
        '2'=>'第2笔',
        '3'=>'第3笔',
        '4'=>'第4笔',
        '5'=>'第5笔',
        '6'=>'第6笔',
        '7'=>'第7笔',
        '8'=>'第8笔',
        '9'=>'竣工款',
        '10'=>'第10笔',
        '11'=>'第11笔',
        '12'=>'第12笔',
        '40'=>'质保金',
    );
    return $arr;
}
function USER_FUN_GET_ZJL_SKYJ_BS_NAME(){
    $arr = array(
        '0.1'=>'首付款',
        '1'=>'进度款1',
        '2'=>'进度款2',
        '3'=>'进度款3',
        '4'=>'进度款4',
        '5'=>'进度款5',
        '6'=>'进度款6',
        '7'=>'进度款7',
        '8'=>'进度款8',
        '20'=>'竣工款',
        '30'=>'结算款',
        '40'=>'质保金',
    );
    return $arr;
}
function USER_FUN_GET_ZJL_FKYJ_BS_NAME(){
    $arr = array(
        '0.1'=>'首付款',
        '1'=>'进度款1：开工第2月',
        '2'=>'进度款2：开工第3月',
        '3'=>'进度款3：开工第4月',
        '4'=>'进度款4：开工第5月',
        '5'=>'进度款5：开工第6月',
        '6'=>'进度款6：开工第7月',
        '7'=>'进度款7：开工第8月',
        '8'=>'进度款8：开工第9月',
        '20'=>'竣工结算款',
        '30'=>'竣工结算款次月',
        '40'=>'质保金',
         '0'=>'全部'
    );
    return $arr;
}
function USER_FUN_GET_MYD_PJ_NAME(){
    $myd_pj = array(
        "A" => '非常满意',
        "B" => '满意',
        "C" => '基本满意',
        "D" => '不太满意',
        "E" => '不满意',
    );
    return $myd_pj;
}

function USER_FUN_GET_GCZC_IN_TYPE_NAME(){
    $in_type = array(
        'A' => "管理",
        'B' => "设计",
        'C' => "施工",
    );
    return $in_type;
}

function USER_FUN_GET_GCZC_IN_SUB_TYPE_NAME(){
    $in_sub_type = array(
        //大厦；管理公司；客户；顾问；消防局；建委；客户设施维护FM;
        //天花；地面；墙；门；五金；饰面；系统家具；固定家具；EL,HVAC,FS,PD,IT,SEC,AV，管理,平面,效果图
        'A' => "大厦",
        'B' => "管理公司",
        'C' => "客户",
        'D' => "顾问",
        'E' => "消防局",
        'F' => "建委",
        'G' => "客户设施维护FM",
        'H' => "天花",
        'I' => "地面",
        'J' => "墙",
        'K' => "门",
        'L' => "五金",
        'M' => "饰面",
        'N' => "系统家具",
        'O' => "固定家具",
        'P' => "EL",
        'Q' => "HVAC",
        'R' => "FS",
        'S' => "PD",
        'T' => "IT",
        'U' => "SEC",
        'V' => "AV",
        'W' => "管理",
        'X' => "平面",
        'Y' => "效果图",
    );
    return $in_sub_type;
}
function USER_FUN_GET_MYD_LIST_NAME(){
    $st = array(
        array(
            'sx' => 'sj',
            'name'=> "设计满意度",
            'item' => array(
                1=>"设计满意度1",
                2=>"设计满意度2")
        ),
        array(
            'sx' => 'sg',
            'name'=>"施工满意度",item => array(
                1=>"施工满意度1",
                2=>"施工满意度2")
        ),
        array(
            'sx' => 'sh',
            'name'=>"售后满意度",
            'item' => array(
                1=>"售后满意度1",
                2=>"售后满意度2")
        ),
    );
    return $st;
}

function USER_FUN_GET_USER_STATUS_NAME(){
    $st = array(
        '1' => "新增(待审核)",
        '2' => "正常(已审核)",
        '3' => "注销(已删除)",
    );
    return $st;
}



function USER_FUN_GET_PROJECT_STATUS_NAME(){
    $st = array(
        '1' => "新增(待审核)",
        '2' => "正常(已审核)",
        '3' => "注销(已删除)",
    );
    return $st;
}

function USER_FUN_GET_FBS_TYPE_NAME(){
    $vo = array(
        'zx'=> "装修",
        'dq' => "电气",
        'kt' => "空调",
        'xf' => "消防",
        'jps' => "给排水",
        'it' => "IT",
        'sec' => "SEC",
        'av' => "AV",
    );
    return $vo;
}
function USER_FUN_GET_QQ_TYPE_NAME(){
    $vo = array(
        'A' => "物业管理费用",
        'B' => "办公用品1",
        'C' => "办公用品2",
        'D' => "临时水电设施费",
        'E' => "临时水电费用",
        'F' => "施工手续费",
        'G' => "大楼审图等管理费",
        'H' => "设备租赁费",
        'I' => "空气检测费",
        'J' => "现场保护及成品保护",
        'K' => "招待费",
        'L' => "劳防用品",
        'M' => "生活交通安置费",
        'N' => "工程保险费",
        'O' => "施工清洁费1(外包)",
        'P' => "施工清洁费2(内部)",
        'Q' => "税金",
        'R' => "报审图打图费用",
        'S' => "临时办公室费用",
        'T' => "材料报检费用",
        'U' => "垃圾清运费",
        'V' => "施工图和竣工图",
        'W' => "其它费用",
    );
    return $vo;
}
function USER_FUN_GET_GYS_TYPE_NAME(){
    $vo = array(
        'zx'=> "装修",
        'jd'=> "机电",
    );
    return $vo;
}
function USER_FUN_GET_HT_TYPE_NAME(){
    $arr = array(
        'A'=> "投标",
        'B' => "询价",
        'C' => "直接指定",
        'D' => "客户指定",
    );
    return $arr;
}
function USER_FUN_GET_CUSTOMER_VO_RESON_NAME(){
    $vo_reson = array(
        'A' => "客户变更",
        'B' => "范围变更",
        'C' => "代客户采购",
        'D' => "设计公司变更",
        'E' => "大厦或消防要求",
        'F' => "现场条件不符",
        'G' => "其它",
    );
    return $vo_reson;
}
function USER_FUN_GET_FB_VO_RESON_NAME(){
    /*
1. 客户要求-有VO；
2. 客户要求- 无VO;
3. 分包（或供应商）报价范围变更（此项对应与客户合同有应收）：
4. 装修设计疏漏：请详细说明情况
5. 机电设计疏漏：请详细说明情况
6. 预算漏项或少算：请详细说明情况
7. 现场控制疏漏：请详细说明情况
8. 采购疏漏：请详细说明情况
9. 其它（必须有详细情况说明）：
    */
    $vo_reson = array(
        'A' => "客户要求-有VO",
        'B' => "客户要求-无VO",
        'C' => "分包(或供应商)报价范围变更",
        'D' => "装修设计疏漏",
        'E' => "机电设计疏漏",
        'F' => "预算漏项或少算",
        'G' => "现场控制疏漏",
        'H' => "采购疏漏",
        'I' => "其它",
    );
    return $vo_reson;
}
function USER_FUN_GET_DEPARTMENT_NAME(){
    $dep = array(
        'cg' => "采购管理部",
        'sh' => "售后服务部",
        'hr' => "行政人事部",
        'gc' => "工程管理部",
        'jd' => "机电管理部",
        'sj' => "设计管理部",
        'sc' => "市场管理部",
        'ys' => "预算管理部",
        'ht' => "合同管理部",
        'gl' => "管理部",
        /*
                分公司负责人
                部门负责人（含财务部）
        */
    );
    return $dep;
}
function USER_FUN_GET_DEPARTMENT_ARRAY(){
    $dep = array(
        0 => array('id' =>'cg', 'name'=> "采购管理部"),
        1 => array('id' =>'sh', 'name'=> "售后服务部"),
        2 => array('id' =>'hr', 'name'=> "行政人事部"),
        3 => array('id' =>'gc', 'name'=> "工程管理部"),
        4 => array('id' =>'jd', 'name'=> "机电管理部"),
        5 => array('id' =>'sj', 'name'=> "设计管理部"),
        6 => array('id' =>'sc', 'name'=> "市场管理部"),
        7 => array('id' =>'ys', 'name'=> "预算管理部"),
        8 => array('id' =>'ht', 'name'=> "合同管理部"),
        9 => array('id' =>'gl', 'name'=> "管理部"),
        /*
        分公司负责人
        部门负责人（含财务部）
        */
    );
    return $dep;
}

function USER_FUN_GET_DEPARTMENT_SX(){
    $dep = array(
        0 => 'cg',
        1 => 'sh',
        2 => 'hr',
        3 => 'gc',
        4 => 'jd',
        5 => 'sj',
        6 => 'sc',
        7 => 'ys',
        8 => 'ht',
        9 => 'gl',
    );
    return $dep;
}


function USER_FUN_GET_PROJECT_MODULE_ARRAY(){
    $mod = array(
        'module_xmjbxx'=> "项目基本信息",
        'module_xmscfx'=> "项目市场分析",
        'module_khbyd'=> "客户满意度",
        'module_xmrlzygl'=> "项目人力资源管理",
        'module_xmsjgl'=> "项目时间管理",
        'module_xmcbgl'=> "项目成本管理",
        'module_xmzjlgl'=> "项目资金流管理",
        'module_gysgl'=> "供应商管理",
        'module_ygjxgl'=> "员工绩效管理",
        'module_gczcgl'=> "过程资产管理",
        'module_dxmgl'=> "多项目管理",
    );
    return $mod;
}

function USER_FUN_GET_PROJECT_MODULE_NAME(){
    $mod = array(
        'module_xmjbxx',
        'module_xmscfx',
        'module_khbyd',
        'module_xmrlzygl',
        'module_xmsjgl',
        'module_xmcbgl',
        'module_xmzjlgl',
        'module_gysgl',
        'module_ygjxgl',
        'module_gczcgl',
        'module_dxmgl',
    );
    return $mod;
}

function USER_FUN_GET_DEPATMENT_MODULE_ARRAY($zb_flag){
    $dep = array();
    //sc
    $mod = USER_FUN_GET_PROJECT_MODULE_ARRAY();
    unset($mod['module_xmcbgl']);
    unset($mod['module_xmzjlgl']);
    unset($mod['module_gysgl']);
    unset($mod['module_dxmgl']);
    $dep['sc']=$mod;
    //ys
    $mod = USER_FUN_GET_PROJECT_MODULE_ARRAY();
    unset($mod['module_xmscfx']);
    unset($mod['module_ygjxgl']);
    unset($mod['module_dxmgl']);
    $dep['ys']=$mod;
    //sj
    $mod = USER_FUN_GET_PROJECT_MODULE_ARRAY();
    unset($mod['module_xmscfx']);
    unset($mod['module_xmcbgl']);
    unset($mod['module_xmzjlgl']);
    unset($mod['module_ygjxgl']);
    unset($mod['module_dxmgl']);
    $dep['sj']=$mod;
    //jd
    $mod = USER_FUN_GET_PROJECT_MODULE_ARRAY();
    unset($mod['module_xmscfx']);
    unset($mod['module_xmcbgl']);
    unset($mod['module_xmzjlgl']);
    unset($mod['module_ygjxgl']);
    unset($mod['module_dxmgl']);
    $dep['jd']=$mod;
    //gc
    $mod = USER_FUN_GET_PROJECT_MODULE_ARRAY();
    unset($mod['module_xmscfx']);
    unset($mod['module_ygjxgl']);
    unset($mod['module_dxmgl']);
    $dep['gc']=$mod;
    //cg
    $mod = USER_FUN_GET_PROJECT_MODULE_ARRAY();
    unset($mod['module_xmscfx']);
    unset($mod['module_ygjxgl']);
    unset($mod['module_dxmgl']);
    $dep['cg']=$mod;
    //sh
    $mod = USER_FUN_GET_PROJECT_MODULE_ARRAY();
    unset($mod['module_xmscfx']);
    unset($mod['module_xmcbgl']);
    unset($mod['module_xmzjlgl']);
    unset($mod['module_ygjxgl']);
    unset($mod['module_dxmgl']);
    $dep['sh']=$mod;
    //hr
    $mod = USER_FUN_GET_PROJECT_MODULE_ARRAY();
    unset($mod['module_xmscfx']);
    unset($mod['module_xmsjgl']);
    unset($mod['module_xmzjlgl']);
    unset($mod['module_gysgl']);
    unset($mod['module_gczcgl']);
    unset($mod['module_dxmgl']);
    $dep['hr']=$mod;
    //ht
    $mod = USER_FUN_GET_PROJECT_MODULE_ARRAY();
    unset($mod['module_xmscfx']);
    unset($mod['module_gysgl']);
    unset($mod['module_ygjxgl']);
    unset($mod['module_gczcgl']);
    $dep['ht']=$mod;
    //gl
    $mod = USER_FUN_GET_PROJECT_MODULE_ARRAY();
    $dep['gl']=$mod;

    if("B" != $zb_flag){
        $mod = array(
            'module_xmjbxx'=> "项目基本信息",
            'module_xmscfx'=> "项目市场分析",
            'module_xmrlzygl'=> "项目人力资源管理",
        );
        $dep = array();
        //sc
        $dep['sc']=$mod;
        //ys
        $dep['ys']=$mod;
        //sj
        $dep['sj']=$mod;
        //jd
        $dep['jd']=$mod;
        //gc
        $dep['gc']=$mod;
        //cg
        $dep['cg']=$mod;
        //sh
        $dep['sh']=$mod;
        //hr
        $dep['hr']=$mod;
        //ht
        $dep['ht']=$mod;
        //gl
        $dep['gl']=$mod;
        //
        return $dep;
    }
    return $dep;
}