<?php
namespace Home\Controller;
use Think\Controller;
class DbOptController extends Controller {
    public function ajaxNotify(){
        $this->ajaxReturn(array('state' => true, 'msg' => "更改成功,请按 F5 重新刷新页面"));
    }

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
                    $item['vo_je'],$reson[$item['vo_reson']],$item['vo_desc'],);
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

    ////////////////////////////////////////////////////////////////////////////////
    public function ajaxGetCgAndVOJe(){
        $Model = M(); // 实例化对象
        $pro_id = I('pro_id');

        $tablename = "jb_cg_vo";

        $list = $Model->query("SELECT srctype,SUM(cg_je) as it_sum,SUM(vo1_je) as it_1_sum,SUM(vo2_je) as it_2_sum,SUM(vo3_je) as it_3_sum FROM `" . $tablename . "` WHERE pro_id='" . $pro_id . "' GROUP BY srctype ");
        $responce = array();

        if(!empty($list)){
            foreach($list as $item){
                $responce[$item["srctype"]]=array("sjcb" => $item["it_sum"],"vo" => ($item["it_1_sum"] + $item["it_2_sum"] + $item["it_3_sum"]));
            }
        }
        $this->ajaxReturn($responce);
    }
    public function ajaxCgAndVoSearch(){
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
        $reson = USER_FUN_GET_FB_VO_RESON_NAME();


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
                    $item['cg_name'],
                    $item['cg_je'],$reson[$item['cg_reson']],$item['cg_desc'],
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
        $cg_reson = I('cg_reson');
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
                if( empty($pro_id) || empty($srctype) || empty($cg_name) || empty($cg_reson)|| empty($cg_desc) || empty($cg_je)){
                    $this->ajaxReturn(array('state' => false, 'msg' => "字段不能为空"));
                }
                $condition["pro_id"] = $pro_id;
                $condition["srctype"] = $srctype;
                $condition['cg_name'] = $cg_name;
                $condition['cg_je'] = $cg_je;
                $condition['cg_reson'] = $cg_reson;
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
                if(empty($id) || empty($pro_id) || empty($srctype) || empty($cg_name) || empty($cg_reson)|| empty($cg_desc) || empty($cg_je) ){
                    $this->ajaxReturn(array('state' => false, 'msg' => "字段不能为空", 'id' => $id));
                }
                $condition["pro_id"] = $pro_id;
                $condition["srctype"] = $srctype;
                $condition['cg_name'] = $cg_name;
                $condition['cg_je'] = $cg_je;
                $condition['cg_reson'] = $cg_reson;
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
}
