<?php
namespace Home\Controller;
use Think\Controller;
class DbOptController extends Controller {
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    public function ajaxGetCbglAllZje(){
        $pro_id = I('pro_id');
        //
        $Data = M("project");
        $cond['pro_id'] = $pro_id;
        $project_rec = $Data->where($cond)->find();

        //fb begin------------------------------------------------------------------------------------------------------
        //fb dwbj sjcb
        $fb_lx_arr = USER_FUN_GET_FBS_TYPE_NAME();
        $fb_dwbj_all = 0.0;
        $fb_sjcb_all = 0.0;
        foreach($fb_lx_arr as $fb_lx => $fb_lx_name){
            $key_dwbj = "ys_" . $fb_lx . "_dwbj";
            $dwbj = $project_rec[$key_dwbj];
            //
            if(!empty($dwbj)){
                if(floatval($dwbj) > 0.01 ){
                    $fb_dwbj_all += floatval($dwbj);
                }
            }
            //
            $key_sjcb = "ys_" . $fb_lx . "_sjcb";
            $sjcb = $project_rec[$key_sjcb];
            //
            if(!empty($sjcb)){
                if(floatval($sjcb) > 0.01 ){
                    $fb_sjcb_all += floatval($sjcb);
                }
            }
        }
        //fb custom vo, cg custom vo
        $fb_custom_vo_all = 0.0;
        $cg_custom_vo_all = 0.0;
        $tablename = "jb_customer_vo";
        $list = M()->query("SELECT vo_type,SUM(vo_je) as it_sum FROM `" . $tablename . "` WHERE pro_id='" . $pro_id . "' GROUP BY vo_type ");
        if(!empty($list)){
            foreach($list as $cur){
                if($cur["vo_type"] != "cg"){
                    $fb_custom_vo_all += $cur["it_sum"];
                }else{
                    $cg_custom_vo_all += $cur["it_sum"];
                }
            }
        }
        //fb self vo
        $fb_self_vo_all = 0.0;
        $tablename = "jb_fb_vo";
        $list = M()->query("SELECT SUM(vo_je) as it_sum FROM `" . $tablename . "` WHERE pro_id='" . $pro_id . "' ");
        if(!empty($list)){
            foreach($list as $item){
                $fb_self_vo_all += $item["it_sum"];
            }
        }
        //fb end--------------------------------------------------------------------------------------------------------
        //cg beg--------------------------------------------------------------------------------------------------------
        $cg_dwbj_all = $project_rec['ys_cg_all_dwbj'];
        //cg self vo
        $cg_sjcb_all = 0.0;
        $cg_self_vo_all = 0.0;
        $qq_sjcb_all = 0.0;
        $qq_self_vo_all = 0.0;
        $tablename = "jb_cg_vo";
        $list = M()->query("SELECT srctype,SUM(cg_je) as it_sum,SUM(vo1_je) as it_1_sum,SUM(vo2_je) as it_2_sum,SUM(vo3_je) as it_3_sum FROM `jb_cg_vo` WHERE pro_id='" . $pro_id . "' group by srctype ");
        if(!empty($list)){
            foreach($list as $cur){
                if($cur["srctype"] != "qq"){
                    $cg_sjcb_all += $cur["it_sum"];
                    $cg_self_vo_all += $cur["it_1_sum"] + $cur["it_2_sum"] + $cur["it_3_sum"];
                }else{
                    $qq_sjcb_all += $cur["it_sum"];
                    $qq_self_vo_all += $cur["it_1_sum"] + $cur["it_2_sum"] + $cur["it_3_sum"];
                }
            }
        }
        $cg_gckc_sjcb = $project_rec["cg_gckc_sjcb"];
        $cg_gcrgf_sjcb = $project_rec["cg_gcrgf_sjcb"];
        $cg_sjcb_all += floatval($cg_gckc_sjcb) + floatval($cg_gcrgf_sjcb);
        $cg_gckc_sjcb_vo = $project_rec["cg_gckc_sjcb_vo"];
        $cg_gcrgf_sjcb_vo = $project_rec["cg_gcrgf_sjcb_vo"];
        $cg_self_vo_all += floatval($cg_gckc_sjcb_vo) + floatval($cg_gcrgf_sjcb_vo);
        //cg end--------------------------------------------------------------------------------------------------------
        //qq beg--------------------------------------------------------------------------------------------------------
        $qq_dwbj_all = $project_rec['ys_qq_dwbj'];
        $qq_custom_all_vo = $project_rec['ys_qq_customer_vo'];
        //qq end--------------------------------------------------------------------------------------------------------
        //rg beg--------------------------------------------------------------------------------------------------------
        $rg_dwbj_all = $project_rec['ys_rg_dwbj'];
        $rg_custom_all_vo = 0.0;
        $rg_sjcb_all = $_SESSION['all_zjrgcb'];
        $rg_self_vo_all = 0.0;
        //rg end--------------------------------------------------------------------------------------------------------
        //qt beg--------------------------------------------------------------------------------------------------------
        $qt_dwbj_all = $project_rec['ys_qt_dwbj'];
        $qt_custom_all_vo = $project_rec['ys_qt_customer_vo'];
        $qt_sjcb_all = $project_rec['ys_qt_sjcb'];
        $qt_self_vo_all = $project_rec['ys_qt_vo'];
        //qt end--------------------------------------------------------------------------------------------------------
        $responce = array();
        $responce['dwbj'] = $fb_dwbj_all + $cg_dwbj_all + $qq_dwbj_all + $rg_dwbj_all + $qt_dwbj_all;
        $responce['customer_vo'] = $fb_custom_vo_all + $cg_custom_vo_all + $qq_custom_all_vo + $rg_custom_all_vo + $qt_custom_all_vo;
        $responce['sjcb'] = $fb_sjcb_all + $cg_sjcb_all + $qq_sjcb_all + $rg_sjcb_all + $qt_sjcb_all;
        $responce['self_vo'] = $fb_self_vo_all + $cg_self_vo_all + $qq_self_vo_all + $rg_self_vo_all + $qt_self_vo_all;
        $responce['fb_sjcb'] = $fb_sjcb_all;
        $responce['fb_self_vo'] = $fb_self_vo_all;
        $responce['cg_sjcb'] = $cg_sjcb_all;
        $responce['cg_self_vo'] = $cg_self_vo_all;
        $this->ajaxReturn($responce);
    }
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    public function ajaxGetAllVOJe(){
        $Model = M(); // 实例化对象
        $pro_id = I('pro_id');
        $srctype = I('srctype');

        $tablename = "";
        if("customer" == $srctype){
            $tablename = "jb_customer_vo";
        }else if("fb" == $srctype){
            $tablename = "jb_fb_vo";
        }

        $list = $Model->query("SELECT vo_type,SUM(vo_je) as it_sum FROM `" . $tablename . "` WHERE pro_id='" . $pro_id . "' GROUP BY vo_type ");
        $responce = array();

        if(!empty($list)){
            foreach($list as $item){
                $responce[$item["vo_type"]]=$item["it_sum"];
            }
        }
        $this->ajaxReturn($responce);
    }
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    public function ajaxGetCgAndVOJe(){
        $Model = M(); // 实例化对象
        $pro_id = I('pro_id');
        //
        $tablename = "jb_cg_vo";
        $list = $Model->query("SELECT srctype,SUM(cg_je) as it_sum,SUM(vo1_je) as it_1_sum,SUM(vo2_je) as it_2_sum,SUM(vo3_je) as it_3_sum FROM `" . $tablename . "` WHERE pro_id='" . $pro_id . "' GROUP BY srctype ");
        $responce = array();
        //
        if(!empty($list)){
            foreach($list as $item){
                $responce[$item["srctype"]]=array("sjcb" => $item["it_sum"],"vo" => ($item["it_1_sum"] + $item["it_2_sum"] + $item["it_3_sum"]));
            }
        }
        $this->ajaxReturn($responce);
    }
    ///customer vo and fb vo ///////////////////////////////////////////////////////////////////////////////////////////
    public function ajaxVoSearch(){
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
                    case 'vo_desc':
                        $cond[$k] = array('LIKE', "%$v%");
                        break;
                    case 'id':
                    case 'pro_id':
                    case 'vo_reson':
                    case 'vo_type':
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
        $srctype = I('srctype');
        $Data = null;
        $reson = array();
        if("customer" == $srctype){
            $Data = M('customer_vo'); // 实例化对象
            $reson = USER_FUN_GET_CUSTOMER_VO_RESON_NAME();
        }else if("fb" == $srctype){
            $Data = M('fb_vo'); // 实例化对象
            $reson = USER_FUN_GET_FB_VO_RESON_NAME();
        }

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
                    $item['vo_desc'],
                    $item['vo_je'],$reson[$item['vo_reson']]);
                $i++;
            }
        }
        $this->ajaxReturn($responce);
    }
    public function ajaxVoSave(){
        //
        $srctype = I('srctype');
        $Data = null;
        if("customer" == $srctype){
            $Data = M('customer_vo'); // 实例化对象
        }else if("fb" == $srctype){
            $Data = M('fb_vo'); // 实例化对象
        }

        $oper = I('oper');
        $id = I('id');
        $pro_id = I('pro_id');

        $vo_je = I('vo_je');
        $vo_type = I('vo_type');
        $vo_reson = I('vo_reson');
        $vo_desc = I('vo_desc');

        trace($pro_id,"pro_id");
        trace($vo_type,"vo_type");
        trace($vo_reson,"vo_reson");
        trace($vo_desc,"vo_desc");
        $condition = array();
        switch ($oper) {
            case "add"://
                if( empty($pro_id) || empty($vo_type) || empty($vo_reson)|| empty($vo_desc) || empty($vo_je)){
                    $this->ajaxReturn(array('state' => false, 'msg' => "字段不能为空"));
                }
                $condition["pro_id"] = $pro_id;
                $condition['vo_je'] = $vo_je;
                $condition['vo_type'] = $vo_type;
                $condition['vo_reson'] = $vo_reson;
                $condition['vo_desc'] = $vo_desc;
                $result  = $Data->add($condition);
                if(false === $result){
                    $this->ajaxReturn(array('state' => false, 'msg' => "存盘失败,请检查数据库连接设置"));
                }else{
                    $this->ajaxReturn(array('state' => true, 'msg' => "存盘成功", 'id' => $result));
                }
                break;
            case "edit"://
                if(empty($id) || empty($pro_id) || empty($vo_type) || empty($vo_reson)|| empty($vo_desc) ){
                    $this->ajaxReturn(array('state' => false, 'msg' => "字段不能为空", 'id' => $id));
                }
                $condition["pro_id"] = $pro_id;
                $condition['vo_je'] = $vo_je;
                $condition['vo_type'] = $vo_type;
                $condition['vo_reson'] = $vo_reson;
                $condition['vo_desc'] = $vo_desc;
                $condition['id'] = $id;
                $result  = $Data->save($condition);
                if(false === $result){
                    $this->ajaxReturn(array('state' => false, 'msg' => "存盘失败,请检查数据库连接设置", 'id' => $id));
                }elseif(0 == $result){
                    $this->ajaxReturn(array('state' => false, 'msg' => "信息没有修改", 'id' => $id));
                }else{
                    $this->ajaxReturn(array('state' => true, 'msg' => "存盘成功", 'id' => $id));
                }
                break;
            case "del":
                if(empty($id)){
                    $this->ajaxReturn(array('state' => false, 'msg' => "字段不能为空", 'id' => $id));
                }
                $condition['id'] = $id;
                $result  = $Data->where($condition)->delete();
                if(false === $result){
                    $this->ajaxReturn(array('state' => false, 'msg' => "存盘失败,请检查数据库连接设置", 'id' => $id));
                }elseif(0 == $result){
                    $this->ajaxReturn(array('state' => false, 'msg' => "信息没有修改", 'id' => $id));
                }else{
                    $this->ajaxReturn(array('state' => true, 'msg' => "存盘成功", 'id' => $id));
                }
                break;
            default:
                break;
        }
    }
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    public function ajaxCgAndVoSearch(){
        $pagenum = I('page',1); // get the requested page
        $limitnum = I('rows',20); // get how many rows we want to have into the grid
        $sidx = I('sidx','id'); // get index row - i.e. user click to sort
        $sord = I('sord','desc'); // get the direction
        if($sidx == ""){
            $sidx = 'id';
        }
        //
        $pro_id = I("pro_id");
        $srctype = I("srctype");
        //手动查询标志
        $searchOn = I('_search');
        //多条件查询
        $cond = array();
        if(TRUE || 'true' == $searchOn) {
            $sarr = I('param.');
            foreach( $sarr as $k=>$v) {
                switch ($k) {
                    case 'cg_name':
                        $cond[$k] = array('LIKE', "%$v%");
                        break;
                    case 'id':
                    case 'pro_id':
                    case 'cg_reson':
                    case 'srctype':
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
        $Data = M('cg_vo'); // 实例化对象
        $qq_lx_arr = USER_FUN_GET_QQ_TYPE_NAME();
        $reson = USER_FUN_GET_FB_VO_RESON_NAME();
        $count = $Data->where($cond)->order(array($sidx => $sord))->count();// 查询满足要求的总记录数
        if("qq" == $srctype && $count < 23){
            //先删除，再插入
            $condition = array();
            $condition['pro_id'] = $pro_id;
            $condition['srctype'] = "qq";
            $result = $Data->where($condition)->delete();
            //
            foreach($qq_lx_arr as $qq_lx => $value){
                $condition['cg_name'] = $qq_lx;
                $result  = $Data->add($condition);
            }
            //
            $count = $Data->where($cond)->order(array($sidx => $sord))->count();// 查询满足要求的总记录数
            if($count != 23){
                $this->ajaxReturn(array('state' => false, 'msg' => "数据库加入 前期类型记录 失败,请检查数据库连接设置"));
            }
            //
        }
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
                    $qq_lx_arr[$item['cg_name']],
                    $item['cg_je'],$item['cg_desc'],
                    $item['vo1_je'],$reson[$item['vo1_reson']],$item['vo1_desc'],
                    $item['vo2_je'],$reson[$item['vo2_reson']],$item['vo2_desc'],
                    $item['vo3_je'],$reson[$item['vo3_reson']],$item['vo3_desc']);
                $i++;
            }
        }
        $this->ajaxReturn($responce);
    }
    public function ajaxCgAndVoSave(){
        //
        $srctype = I('srctype');
        $Data = M('cg_vo'); // 实例化对象

        $oper = I('oper');
        $id = I('id');
        $pro_id = I('pro_id');

        $cg_name = I('cg_name');
        $cg_je = I('cg_je');
        $cg_desc = I('cg_desc');
        $vo1_je = I('vo1_je');
        $vo1_reson = I('vo1_reson');
        $vo1_desc = I('vo1_desc');
        $vo2_je = I('vo2_je');
        $vo2_reson = I('vo2_reson');
        $vo2_desc = I('vo2_desc');
        $vo3_je = I('vo3_je');
        $vo3_reson = I('vo3_reson');
        $vo3_desc = I('vo3_desc');

        $condition = array();
        switch ($oper) {
            case "add"://
                if( empty($pro_id) || empty($srctype) || empty($cg_name) || empty($cg_desc) || empty($cg_je)){
                    $this->ajaxReturn(array('state' => false, 'msg' => "字段不能为空"));
                }
                $condition["pro_id"] = $pro_id;
                $condition["srctype"] = $srctype;
                $condition['cg_name'] = $cg_name;
                $condition['cg_je'] = $cg_je;
                $condition['cg_desc'] = $cg_desc;
                $condition['vo1_je'] = $vo1_je;
                $condition['vo1_reson'] = $vo1_reson;
                $condition['vo1_desc'] = $vo1_desc;
                $condition['vo2_je'] = $vo2_je;
                $condition['vo2_reson'] = $vo2_reson;
                $condition['vo2_desc'] = $vo2_desc;
                $condition['vo3_je'] = $vo3_je;
                $condition['vo3_reson'] = $vo3_reson;
                $condition['vo3_desc'] = $vo3_desc;

                $result  = $Data->add($condition);
                if(false === $result){
                    $this->ajaxReturn(array('state' => false, 'msg' => "存盘失败,请检查数据库连接设置"));
                }else{
                    $this->ajaxReturn(array('state' => true, 'msg' => "存盘成功", 'id' => $result));
                }
                break;
            case "edit"://
                //qq not send cg_name
                if("qq" == $srctype){
                    if(empty($id) || empty($pro_id) || empty($srctype) || empty($cg_desc) || empty($cg_je) ){
                        $this->ajaxReturn(array('state' => false, 'msg' => "字段不能为空", 'id' => $id));
                    }
                }else{
                    if(empty($id) || empty($pro_id) || empty($srctype) || empty($cg_name) || empty($cg_desc) || empty($cg_je) ){
                        $this->ajaxReturn(array('state' => false, 'msg' => "字段不能为空", 'id' => $id));
                    }
                }
                $condition["pro_id"] = $pro_id;
                $condition["srctype"] = $srctype;
                if("qq" == $srctype){
                    //qq not send cg_name
                }else{
                    $condition['cg_name'] = $cg_name;
                }
                $condition['cg_je'] = $cg_je;
                $condition['cg_desc'] = $cg_desc;
                $condition['vo1_je'] = $vo1_je;
                $condition['vo1_reson'] = $vo1_reson;
                $condition['vo1_desc'] = $vo1_desc;
                $condition['vo2_je'] = $vo2_je;
                $condition['vo2_reson'] = $vo2_reson;
                $condition['vo2_desc'] = $vo2_desc;
                $condition['vo3_je'] = $vo3_je;
                $condition['vo3_reson'] = $vo3_reson;
                $condition['vo3_desc'] = $vo3_desc;
                $condition['id'] = $id;
                $result  = $Data->save($condition);
                if(false === $result){
                    $this->ajaxReturn(array('state' => false, 'msg' => "存盘失败,请检查数据库连接设置", 'id' => $id));
                }elseif(0 == $result){
                    $this->ajaxReturn(array('state' => false, 'msg' => "信息没有修改", 'id' => $id));
                }else{
                    $this->ajaxReturn(array('state' => true, 'msg' => "存盘成功", 'id' => $id));
                }
                break;
            case "del":
                if(empty($id)){
                    $this->ajaxReturn(array('state' => false, 'msg' => "字段不能为空", 'id' => $id));
                }
                $condition['id'] = $id;
                $result  = $Data->where($condition)->delete();
                if(false === $result){
                    $this->ajaxReturn(array('state' => false, 'msg' => "存盘失败,请检查数据库连接设置", 'id' => $id));
                }elseif(0 == $result){
                    $this->ajaxReturn(array('state' => false, 'msg' => "信息没有修改", 'id' => $id));
                }else{
                    $this->ajaxReturn(array('state' => true, 'msg' => "存盘成功", 'id' => $id));
                }
                break;
            default:
                break;
        }
    }
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    public function ajaxGysclglSearch(){
        $pagenum = I('page',1); // get the requested page
        $limitnum = I('rows',20); // get how many rows we want to have into the grid
        $sidx = I('sidx','id'); // get index row - i.e. user click to sort
        $sord = I('sord','desc'); // get the direction
        if($sidx == ""){
            $sidx = 'id';
        }

        $srctype = I('srctype');
        //手动查询标志
        $searchOn = I('_search');
        //多条件查询
        $cond = array();
        if(TRUE || 'true' == $searchOn) {
            $sarr = I('param.');
            foreach( $sarr as $k=>$v) {
                switch ($k) {
                    case 'cg_name':
                        $cond[$k] = array('LIKE', "%$v%");
                        break;
                    case 'id':
                    case 'pro_id':
                    case 'srctype':
                    case 'cg_ht_lx':
                    case 'cg_gys_name':
                    case 'sj_pj':
                    case 'jd_pj':
                    case 'gc_pj':
                    case 'cg_pj':
                    case 'sh_pj':
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
        $Data = M('cg_vo'); // 实例化User对象
        $count = $Data->where($cond)->order(array($sidx => $sord))->count();// 查询满足要求的总记录数
        $list =  $Data->where($cond)->order(array($sidx => $sord))->page($pagenum,$limitnum)->select();

        $total_pages = 0;
        if( $count >0 ) {
            $total_pages = ceil($count/$limitnum);
        }
        $responce["page"] = $pagenum;
        $responce["total"] = $total_pages;
        $responce["records"] = $count;

        $ht_lx_arr = USER_FUN_GET_GYS_FB_HT_LX_NAME();
        $gys_name_json_str = $_SESSION['all_gys_name'];
        //trace($gys_name_json_str);
        $gys_obj_arr = json_decode($gys_name_json_str,true);
        //trace($fbs_obj_arr);
        $gys_name_arr = array();
        foreach($gys_obj_arr as $key=>$value){
            foreach($value as $key2=>$value2){
                //trace($value2);
                $gys_name_arr[$value2["id"]] = $value2["gys_name"];
            }
        }
        $myd_pj_arr = USER_FUN_GET_MYD_PJ_NAME();
        $i=0;
        if(!empty($list)){
            foreach($list as $item){
                $htje = $item['cg_je'];
                $voje = $item['vo1_je'] + $item['vo2_je'] + $item['vo3_je'];
                $vozb = 0;
                if($htje > 0 ){
                    $vozb = $voje / $htje;
                }

                $self_pj = "";
                $self_pj_str = "";
                if("zxcg" == $srctype){
                    $self_pj = $item['sj_pj'];
                    $self_pj_str = $myd_pj_arr[$item['sj_pj']];
                }else if("jdcg" == $srctype){
                    $self_pj = $item['jd_pj'];
                    $self_pj_str = $myd_pj_arr[$item['jd_pj']];
                }

                $over_b = 0;
                if("A" == $self_pj || "B" == $self_pj ){
                    $over_b++;
                }
                if("A" == $item['gc_pj'] || "B" == $item['gc_pj'] ){
                    $over_b++;
                }
                if("A" == $item['cg_pj'] || "B" == $item['cg_pj'] ){
                    $over_b++;
                }
                if("A" == $item['sh_pj'] || "B" == $item['sh_pj'] ){
                    $over_b++;
                }
                $rate = round(($over_b/4)*100,2) . "%";



                $responce["rows"][$i]['id']=$item["id"];
                $responce["rows"][$i]['cell'] = array($item['id'],
                    $item['cg_name'],
                    $gys_name_arr[$item['cg_gys_name']],
                    $ht_lx_arr[$item['cg_ht_lx']],
                    $htje,
                    $voje,
                    round($vozb*100,2) . "%",
                    $self_pj_str,
                    $myd_pj_arr[$item['gc_pj']] ,
                    $myd_pj_arr[$item['cg_pj']] ,
                    $myd_pj_arr[$item['sh_pj']] ,
                    $rate,
                );
                $i++;
            }
        }
        $this->ajaxReturn($responce);
    }
    public function ajaxGysclglSave(){
        $Data = M('cg_vo'); // 实例化Data数据模型

        $oper = I('oper');
        $id = I('id');
        $pro_id = I('pro_id');
        $srctype = I('srctype');

        /*
  `sj_pj` char(1) NOT NULL COMMENT '平均：设计部',
  `jd_pj` char(1) NOT NULL COMMENT '平均：机电部',
  `gc_pj` char(1) NOT NULL COMMENT '平均：工程部',
  `cg_pj` char(1) NOT NULL COMMENT '平均：采购部',
  `sh_pj` char(1) NOT NULL COMMENT '平均：售后部',
        */
        $cg_gys_name = I('cg_gys_name');
        $cg_ht_lx = I('cg_ht_lx');
        $sj_pj = I('sj_pj');
        $jd_pj = I('jd_pj');
        $gc_pj = I('gc_pj');
        $cg_pj = I('cg_pj');
        $sh_pj = I('sh_pj');


        $condition = array();
        switch ($oper) {
            case "edit"://
                if(empty($id) || empty($pro_id) || empty($srctype) ){
                    $this->ajaxReturn(array('state' => false, 'msg' => "字段不能为空", 'id' => $id));
                }
                $condition["pro_id"] = $pro_id;
                $condition["srctype"] = $srctype;
                $condition['cg_gys_name'] = $cg_gys_name;
                $condition['cg_ht_lx'] = $cg_ht_lx;
                $condition['sj_pj'] = $sj_pj;
                $condition['jd_pj'] = $jd_pj;
                $condition['gc_pj'] = $gc_pj;
                $condition['cg_pj'] = $cg_pj;
                $condition['sh_pj'] = $sh_pj;

                $condition['id'] = $id;
                $result  = $Data->save($condition);
                if(false === $result){
                    $this->ajaxReturn(array('state' => false, 'msg' => "存盘失败,请检查数据库连接设置", 'id' => $id));
                }elseif(0 == $result){
                    $this->ajaxReturn(array('state' => false, 'msg' => "信息没有修改", 'id' => $id));
                }else{
                    $this->ajaxReturn(array('state' => true, 'msg' => "存盘成功", 'id' => $id));
                }
                break;
            default:
                break;
        }
    }
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    public function ajaxGysfbglSearch(){
        $pagenum = I('page',1); // get the requested page
        $limitnum = I('rows',20); // get how many rows we want to have into the grid
        $sidx = I('sidx','id'); // get index row - i.e. user click to sort
        $sord = I('sord','desc'); // get the direction
        if($sidx == ""){
            $sidx = 'id';
        }

        $pro_id = I('pro_id');
        //手动查询标志
        $searchOn = I('_search');
        //多条件查询
        $cond = array();
        if(TRUE || 'true' == $searchOn) {
            $sarr = I('param.');
            foreach( $sarr as $k=>$v) {
                switch ($k) {
                    case 'id':
                    case 'pro_id':
                    case 'fb_lx':
                    case 'ys_fbs_name':
                    case 'ys_fb_ht_lx':
                    case 'sj_pj':
                    case 'ys_pj':
                    case 'jd_pj':
                    case 'gc_pj':
                    case 'sh_pj':
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
        $fb_lx_arr = USER_FUN_GET_FBS_TYPE_NAME();
        $fb_ht_lx_arr = USER_FUN_GET_GYS_FB_HT_LX_NAME();
        $fbs_name_json_str = $_SESSION['all_fbs_name'];
        trace($fbs_name_json_str);
        $fbs_obj_arr = json_decode($fbs_name_json_str,true);
        //trace($fbs_obj_arr);
        $fbs_name_arr = array();
        foreach($fbs_obj_arr as $key=>$value){
            foreach($value as $key2=>$value2){
                //trace($value2);
                $fbs_name_arr[$value2["id"]] = $value2["fbs_name"];
            }
        }
        //trace($fbs_name_arr);
        //
        $Data = M('gys_fbgl'); // 实例化User对象
        $count = $Data->where($cond)->order(array($sidx => $sord))->count();// 查询满足要求的总记录数
        if($count < 8){
            //先删除，再插入
            $condition = array();
            $condition['pro_id'] = $pro_id;
            $result = $Data->where($condition)->delete();
            //

            foreach($fb_lx_arr as $fb_lx => $value){
                $condition['fb_lx'] = $fb_lx;
                $result  = $Data->add($condition);
            }
            //
            $count = $Data->where($cond)->order(array($sidx => $sord))->count();// 查询满足要求的总记录数
            if($count != 8){
                $this->ajaxReturn(array('state' => false, 'msg' => "数据库加入 分包类型记录 失败,请检查数据库连接设置"));
            }
            //
        }

        $list =  $Data->where($cond)->order(array($sidx => $sord))->page($pagenum,$limitnum)->select();

        $total_pages = 0;
        if( $count >0 ) {
            $total_pages = ceil($count/$limitnum);
        }
        $responce["page"] = $pagenum;
        $responce["total"] = $total_pages;
        $responce["records"] = $count;

        //得到实际成本
        $Project = M("project");
        $cond_project = array();
        $cond_project["pro_id"] = $pro_id;
        $rec_project =  $Project->where($cond_project)->find();
        $sjcb_arr = array();
/*       'zx'=> "装修",
        'dq' => "电气",
        'kt' => "空调",
        'xf' => "消防",
        'jps' => "给排水",
        'it' => "IT",
        'sec' => "SEC",
        'av' => "AV",*/
        $sjcb_arr["zx"] = $rec_project["ys_zx_sjcb"];
        $sjcb_arr["dq"] = $rec_project["ys_dq_sjcb"];
        $sjcb_arr["kt"] = $rec_project["ys_kt_sjcb"];
        $sjcb_arr["xf"] = $rec_project["ys_xf_sjcb"];
        $sjcb_arr["jps"] = $rec_project["ys_jps_sjcb"];
        $sjcb_arr["it"] = $rec_project["ys_it_sjcb"];
        $sjcb_arr["sec"] = $rec_project["ys_sec_sjcb"];
        $sjcb_arr["av"] = $rec_project["ys_av_sjcb"];

        //得到VO金额
        $voje_list = M()->query("SELECT vo_type,SUM(vo_je) as it_sum FROM `jb_fb_vo` WHERE pro_id='" . $pro_id . "' GROUP BY vo_type ");
        $voje_arr = array();
        if(!empty($voje_list)){
            foreach($voje_list as $item){
                $voje_arr[$item["vo_type"]] = $item["it_sum"];
            }
        }
        //
        $myd_pj_arr = USER_FUN_GET_MYD_PJ_NAME();
        $i=0;
        if(!empty($list)){
            foreach($list as $item){
                $cur_fb_lx = $item['fb_lx'];
                $cur_fb_lx_str = $fb_lx_arr[$cur_fb_lx];
                $htje = empty($sjcb_arr[$cur_fb_lx]) ? 0 : $sjcb_arr[$cur_fb_lx];
                $voje = empty($voje_arr[$cur_fb_lx]) ? 0 : $voje_arr[$cur_fb_lx];

                $vozb = 0;
                if($htje > 0 ){
                    $vozb = $voje / $htje;
                }

                $over_b = 0;
                if("A" == $item['ys_pj'] || "B" == $item['ys_pj'] ){
                    $over_b++;
                }
                if("A" == $item['sj_pj'] || "B" == $item['sj_pj'] ){
                    $over_b++;
                }
                if("A" == $item['jd_pj'] || "B" == $item['jd_pj'] ){
                    $over_b++;
                }
                if("A" == $item['gc_pj'] || "B" == $item['gc_pj']){
                    $over_b++;
                }
                if("A" == $item['sh_pj'] || "B" == $item['sh_pj']){
                    $over_b++;
                }
                $rate = round(($over_b/4)*100,2) . "%";

                $responce["rows"][$i]['id']=$item["id"];

                $cur_record_arr = array();
                $cur_record_arr[] = $item['id'];
                $cur_record_arr[] = $cur_fb_lx_str;
                $cur_record_arr[] = $fbs_name_arr[$item['ys_fbs_name']];
                $cur_record_arr[] = $fb_ht_lx_arr[$item['ys_fb_ht_lx']];
                $cur_record_arr[] = $htje;
                $cur_record_arr[] = $voje;
                $cur_record_arr[] =  round($vozb*100,2) . "%";
                $cur_record_arr[] =  $myd_pj_arr[$item['ys_pj']];
                $cur_record_arr[] =  $myd_pj_arr[$item['sj_pj']];
                $cur_record_arr[] =  $myd_pj_arr[$item['jd_pj']];
                $cur_record_arr[] =  $myd_pj_arr[$item['gc_pj']];
                $cur_record_arr[] =  $myd_pj_arr[$item['sh_pj']];
                $cur_record_arr[] =  $rate;

                $responce["rows"][$i]['cell'] = $cur_record_arr;
                $i++;
            }
        }
        $this->ajaxReturn($responce);
    }
    public function ajaxGysfbglSave(){
        $Data = M('gys_fbgl'); // 实例化Data数据模型

        $oper = I('oper');
        $id = I('id');
        $pro_id = I('pro_id');

        $ys_fbs_name = I("ys_fbs_name");
        $ys_fb_ht_lx = I("ys_fb_ht_lx");
        $sj_pj = I('sj_pj');
        $jd_pj = I('jd_pj');
        $gc_pj = I('gc_pj');
        $ys_pj = I('ys_pj');
        $sh_pj = I('sh_pj');


        $condition = array();
        switch ($oper) {
            case "edit"://
                if(empty($id) || empty($pro_id) ){
                    $this->ajaxReturn(array('state' => false, 'msg' => "字段不能为空", 'id' => $id));
                }
                $condition["pro_id"] = $pro_id;
                $condition["ys_fbs_name"] = $ys_fbs_name;
                $condition["ys_fb_ht_lx"] = $ys_fb_ht_lx;
                $condition['sj_pj'] = $sj_pj;
                $condition['jd_pj'] = $jd_pj;
                $condition['gc_pj'] = $gc_pj;
                $condition['ys_pj'] = $ys_pj;
                $condition['sh_pj'] = $sh_pj;

                $condition['id'] = $id;
                $result  = $Data->save($condition);
                if(false === $result){
                    $this->ajaxReturn(array('state' => false, 'msg' => "存盘失败,请检查数据库连接设置", 'id' => $id));
                }elseif(0 == $result){
                    $this->ajaxReturn(array('state' => false, 'msg' => "信息没有修改", 'id' => $id));
                }else{
                    $this->ajaxReturn(array('state' => true, 'msg' => "存盘成功", 'id' => $id));
                }
                break;
            default:
                break;
        }
    }
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
}
