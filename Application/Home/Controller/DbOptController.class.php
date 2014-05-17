<?php
namespace Home\Controller;
use Think\Controller;
class DbOptController extends Controller {
    function ajaxSingleFieldSave(){
        $pro_id = I('pro_id');
        $field_name = I('fieldname');
        $field_value = I('fieldvalue');
        if(empty($field_name)){
            $this->ajaxReturn(array('state' => false, 'msg' => "没有字段名称"));
        }
        $Data = M('sc'); // 实例化Data数据模型
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
}
