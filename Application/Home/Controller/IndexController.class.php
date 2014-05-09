<?php
namespace Home\Controller;
use Think\Controller;
class IndexController extends Controller {
    public function index(){
        //$this->DEPARTMENT_ARRAY = $DEPARTMENT_ARRAY; // 进行模板变量赋值
        //$this->show('<style type="text/css">*{ padding: 0; margin: 0; } div{ padding: 4px 48px;} body{ background: #fff; font-family: "微软雅黑"; color: #333;font-size:24px} h1{ font-size: 100px; font-weight: normal; margin-bottom: 12px; } p{ line-height: 1.8em; font-size: 36px }</style><div style="padding: 24px 48px;"> <h1>:)</h1><p>欢迎使用 <b>ThinkPHP</b>！</p><br/>[ 您现在访问的是Home模块的Index控制器 ]</div><script type="text/javascript" src="http://tajs.qq.com/stats?sId=9347272" charset="UTF-8"></script>','utf-8');
        $this->redirect("User/login");
    }


    public function sc(){
        $this->user_id = $_SESSION["user_id"];
        $this->department = $_SESSION["department"];
        //
        $pro_id = $_GET['pro_id'];
        $set_field = $_GET['set_field'];
        $this->pro_id = $pro_id; // 进行模板变量赋值
        $this->set_field = $set_field; // 进行模板变量赋值

        $this->display();
    }

}