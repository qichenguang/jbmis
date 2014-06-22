<?php
namespace Home\Controller;
use Think\Controller;
class FusionController extends Controller {
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    public function ajaxGetMonZjl(){
        $Model = M(); // 实例化对象
        $pro_id = I('pro_id');

        $Model = M('');
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
}
