<?php
namespace Home\Controller;
use Think\Controller;
class AllInOneController extends Controller {
    public function _before_index(){
        $user_id = $_SESSION['user_id'];
        //trace($user_id,"user_id=");
        if("" == $user_id){
            $this->error("没有权限!");
        }
    }
    public function index(){
        //trace($_SESSION["user_id"],"user_id=");
        $this->user_id = $_SESSION["user_id"];
        $this->department = $_SESSION["department"];
        $this->userflag = $_SESSION['userflag'];
        //
        $this->display();
    }
    public function allmodules(){
        $this->user_id = $_SESSION["user_id"];
        $this->department = $_SESSION["department"];
        $this->userflag = $_SESSION['userflag'];
        //
        $dep_sx = USER_FUN_GET_DEPARTMENT_SX();
        $this->dep_sx = implode($dep_sx,",");
        //
        $module_arr = USER_FUN_GET_DEPATMENT_MODULE_ARRAY();

        $dep_module_name = $module_arr[$_SESSION["department"]];
        $this->dep_module_name = $dep_module_name;
        $this->dep_module_id = array_keys($dep_module_name);
        $this->dep_module = implode(array_keys($dep_module_name),",");
        //dump($this->dep_module);
        //
        $pro_id = I('pro_id');
        $this->pro_id = $pro_id; // 进行模板变量赋值
        $cond['pro_id'] = $pro_id;
        $project_detail = array();
        $Data   =   M("project");
        $project_detail = $Data->where($cond)->find();
        $this->project_rec_detail = json_encode($project_detail);
        //layout(flase);
        $this->display();
    }

    function ajaxSingleFieldSave(){
        $pro_id = I('pro_id');
        $field_name = I('fieldname');
        $field_value = I('fieldvalue');
        if(empty($field_name)){
            $this->ajaxReturn(array('state' => false, 'msg' => "没有字段名称"));
        }
        $Data = M('project'); // 实例化Data数据模型
        $condition['pro_id'] = $pro_id;
        $update[$field_name] = $field_value;
        $result  = $Data->where($condition)->save($update);
        if(false === $result){
            $this->ajaxReturn(array('state' => false, 'msg' => "存盘失败,请检查数据库连接设置"));
        }elseif(0 == $result){
            $this->ajaxReturn(array('state' => false, 'msg' => "没有修改字段的值"));
        }else{
            $this->ajaxReturn(array('state' => true, 'msg' => "存盘成功"));
        }
    }

    public function ajaxCustomervomngSearch(){
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
        if('true' == $searchOn) {
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
                        if("0" != $v){
                            $cond[$k] = $v;
                        }
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
        $User = M('customer_vo'); // 实例化User对象
        $count = $User->where($cond)->order(array($sidx => $sord))->count();// 查询满足要求的总记录数
        $list =  $User->where($cond)->order(array($sidx => $sord))->page($pagenum,$limitnum)->select();

        $total_pages = 0;
        if( $count >0 ) {
            $total_pages = ceil($count/$limitnum);
        }
        $responce["page"] = $pagenum;
        $responce["total"] = $total_pages;
        $responce["records"] = $count;

        $i=0;
        $reson = USER_FUN_GET_VO_RESON_NAME();
        $lx = USER_FUN_GET_VO_TYPE_NAME();

        if(!empty($list)){
            foreach($list as $item){
                $responce["rows"][$i]['id']=$item["id"];
                $responce["rows"][$i]['cell'] = array($item['id'],
                    $lx[$item['vo_type']],$item['vo_desc'],$reson[$item['vo_reson']]);
                $i++;
            }
        }
        $this->ajaxReturn($responce);
    }

    public function ajaxCustomervomngSave(){
        $Data = M('customer_vo'); // 实例化Data数据模型

        $oper = I('oper');
        $id = I('id');
        $pro_id = I('pro_id');

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
                if( empty($pro_id) || empty($vo_type) || empty($vo_reson)|| empty($vo_desc) ){
                    $this->ajaxReturn(array('state' => false, 'msg' => "字段不能为空"));
                }
                $condition["pro_id"] = $pro_id;
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

    public function ajaxChengeTheme(){
        $theme = I('theme','redmond');
        $_SESSION['theme'] = $theme;
        $this->ajaxReturn(array('state' => true, 'msg' => "更改成功,请按 F5 重新刷新页面"));
    }
}
