<?php


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
            item => array(
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
            item => array(
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

function USER_FUN_GET_VO_TYPE_NAME(){
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
function USER_FUN_GET_VO_RESON_NAME(){
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
        /*        管理部
                分公司负责人
                部门负责人（含财务部）
                合同管理*/
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
/*        管理部
        分公司负责人
        部门负责人（含财务部）
        合同管理*/
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
function USER_FUN_GET_DEPATMENT_MODULE_ARRAY(){
    $dep = array();
    //sc
    $mod = USER_FUN_GET_PROJECT_MODULE_ARRAY();
    unset($mod['module_xmcbgl']);
    unset($mod['module_xmzjlgl']);
    unset($mod['module_gysgl']);
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
    return $dep;
}