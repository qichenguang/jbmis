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
        $list = $Model->query("SELECT vo_type,SUM(vo_je) as it_sum FROM `jb_customer_vo` WHERE pro_id='" . $pro_id . "' GROUP BY vo_type ");
        $responce = array();

        if(!empty($list)){
            foreach($list as $item){
                $responce[$item["vo_type"]]=$item["it_sum"];
            }
        }
        $this->ajaxReturn($responce);
    }
}
