<?php
namespace Home\Controller;
use Think\Controller;
class DbOptController extends Controller {
    public function addNewProject(){
        $Data = M('sc'); // 实例化Data数据模型

        $pro_id = $_POST['pro_id'];
        $sc_pro_name = $_POST['sc_pro_name'];

        $tmp = array();
        $tmp['sc'] = array(3,4,5);

        $data['pro_id'] = $pro_id;

        $list  = $Data->where("pro_id='$pro_id' ")->select();
        if(empty($list)){
            $dep = USER_FUN_GET_DEPARTMENT_ARRAY();
            foreach($dep as $key => $value){
                $dep_tb = $value['id'];
                //dump($dep_tb);
                if("sc" == $dep_tb){
                    $data['sc_pro_name'] = $sc_pro_name;
                    $data['sc_pro_qx'] = json_encode($tmp);//权限
                }else{
                    unset($data['sc_pro_name']);
                    unset($data['sc_pro_qx']);
                }
                $Form   =   M($dep_tb);
                $Form->data($data)->add();
            }
        }else{
            $this->msg .= "项目ID 重复 PRO_ID !!";
            dump($this->msg);
            //$this->redirect("Index/add");
        }
        //$this->redirect("Project/index");
        dump($this->msg);
    }

    public function save(){
        //$this->ajaxReturn("存盘了");
        $data['status'] = 1;
        $data['content'] = 'content';
        $this->ajaxReturn($data);
    }

}
