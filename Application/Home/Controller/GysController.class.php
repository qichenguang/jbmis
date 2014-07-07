<?php
namespace Home\Controller;
use Think\Controller;
//use Think\Page;
class GysController extends Controller {

    public function ajaxGysmngSave(){
        $Data = M('gys'); // 实例化Data数据模型

        $oper = I('oper');
        $id = I('id');

        $gys_name = I('gys_name');
        $gys_type = I('gys_type');
        $lxr_name = I('lxr_name');
        $lxr_phone = I('lxr_phone');
        $email = I('email');
        $status = I('status');

        switch ($oper) {
            case "add"://
                if( empty($gys_name) || empty($gys_type) ){
                    $this->ajaxReturn(array('state' => false, 'msg' => "字段不能为空"));
                }
                $condition["gys_name"] = $gys_name;
                $condition["gys_type"] = $gys_type;
                $list  = $Data->where($condition)->find();
                if(!empty($list)){
                    $this->ajaxReturn(array('state' => false, 'msg' => "已经有相同 分包商名称 存在"));
                }
                $condition["gys_type"] = $gys_type;
                $condition["lxr_name"] = $lxr_name;
                $condition["lxr_phone"] = $lxr_phone;
                $condition['email'] = $email;
                $result  = $Data->add($condition);
                if(false === $result){
                    $this->ajaxReturn(array('state' => false, 'msg' => "存盘失败,请检查数据库连接设置"));
                }else{
                    $this->ajaxReturn(array('state' => true, 'msg' => "存盘成功", 'id' => $result));
                }
                break;
            case "edit"://
                if(empty($id) || empty($gys_name)|| empty($gys_type) || empty($status)){
                    $this->ajaxReturn(array('state' => false, 'msg' => "字段不能为空", 'id' => $id));
                }
                $condition["gys_name"] = $gys_name;
                $condition["gys_type"] = $gys_type;
                $condition["lxr_name"] = $lxr_name;
                $condition["lxr_phone"] = $lxr_phone;
                $condition['email'] = $email;
                $condition['status'] = $status;
                $condition['id'] = $id;
                $result  = $Data->save($condition);
                if(false === $result){
                    $this->ajaxReturn(array('state' => false, 'msg' => "存盘失败,请检查数据库连接设置", 'id' => $id));
                }elseif(0 == $result){
                    $this->ajaxReturn(array('state' => false, 'msg' => "信息不允许修改", 'id' => $id));
                }else{
                    $this->ajaxReturn(array('state' => true, 'msg' => "存盘成功", 'id' => $id));
                }
                break;
            case "del":
                if(empty($id)){
                    $this->ajaxReturn(array('state' => false, 'msg' => "字段不能为空", 'id' => $id));
                }
                $condition['id'] = $id;
                $condition['status'] = 3;
                $result  = $Data->save($condition);
                if(false === $result){
                    $this->ajaxReturn(array('state' => false, 'msg' => "存盘失败,请检查数据库连接设置", 'id' => $id));
                }elseif(0 == $result){
                    $this->ajaxReturn(array('state' => false, 'msg' => "信息不允许修改", 'id' => $id));
                }else{
                    $this->ajaxReturn(array('state' => true, 'msg' => "存盘成功", 'id' => $id));
                }
                break;
            default:
                break;
        }
    }

    public function _before_ajaxGysmngSave(){
        $department = $_SESSION['department'];
        if("cg" != $department){
            $this->error("没有权限!");
        }
    }

    public function ajaxGysmngSearch(){
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
        if('true' == $searchOn) {
            $sarr = I('param.');
            foreach( $sarr as $k=>$v) {
                switch ($k) {
                    case 'gys_name':
                    case 'lxr_name':
                    case 'lxr_phone':
                    case 'email':
                        $cond[$k] = array('LIKE', "%$v%");
                        break;
                    case 'id':
                    case 'gys_type':
                    case 'status':
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
        $User = M('gys'); // 实例化User对象
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
        $gys_arr = USER_FUN_GET_GYS_TYPE_NAME();
        $st = USER_FUN_GET_PROJECT_STATUS_NAME();
        foreach($list as $item){
            $responce["rows"][$i]['id']=$item["id"];
            $responce["rows"][$i]['cell'] = array($item['id'],
                $item['gys_name'],$gys_arr[$item['gys_type']],$item['lxr_name'],$item['lxr_phone'],$item['email'],$st[$item['status']]);
            $i++;
        }
        $this->ajaxReturn($responce);

    }

    public function _before_gysmng(){
        $department = $_SESSION['department'];
        if("cg" != $department){
            $this->error("没有权限!");
        }
    }
    public function gysmng(){
        layout(false);
        //显示用户列表
        $this->display();
    }
}