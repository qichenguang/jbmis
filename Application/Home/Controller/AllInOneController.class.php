<?php
namespace Home\Controller;
use Think\Controller;
class AllInOneController extends Controller {
    public function _before_index(){
        $user_id = $_SESSION['user_id'];
        if("" == $user_id){
            $this->error("没有权限!");
        }
    }
    public function index(){
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
        $data['pro_id'] = $pro_id;
        $dep = USER_FUN_GET_DEPARTMENT_SX();
        $dep_detail = array();
        foreach($dep as $dep_tb){
            //dump($dep_tb);
            $Form   =   M($dep_tb);
            $dep_detail[$dep_tb] = $Form->where($data)->find();
            //dump($this->$dep_tb);
        }
        $this->dep_rec_detail = json_encode($dep_detail);

        //layout(flase);
        $this->display();
        //$this->display("index");
        //layout(fasle);
        //exit($this->fetch(index));
    }

}
