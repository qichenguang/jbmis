<?php
namespace Home\Controller;
use Think\Controller;
class UserController extends Controller {
    public function index(){
        $this->msg = I('session.department','');

        $this->display();
    }
    private function clearSession(){
        unset($_SESSION['user_id']);
        unset($_SESSION['department']);
        unset($_SESSION['userflag']);
    }

    public function login(){
        $this->clearSession();
        $this->department_array = USER_FUN_GET_DEPARTMENT_ARRAY(); // 进行模板变量赋值
        $this->display();
    }
    public function logon(){
        $Data = M('user'); // 实例化Data数据模型

        $email = I('email','');
        $password = I('password','');
        $department = I('department','');
        $userflag = I('userflag',1);

        $condition["email"] = $email;
        $condition["password"] = $password;
        $condition["department"] = $department;
        $list  = $Data->where($condition)->find();

        if(empty($list)){
            $this->message = "$email,$password,$department";
            $this->error("登录失败!");
        }else{
            $_SESSION['user_id'] = $list['id'];
            $_SESSION['department'] = $list['department'];
            $_SESSION['userflag'] = $list['userflag'];
            if(1 == $list['userflag']){
                $this->success('登录成功!',U('Project/index'));
            }elseif (2 == $list['userflag']){
                $this->success('登录成功!',U('User/usermng'));
            }
        }
    }

    public function _before_search(){
        $userflag = $_SESSION['userflag'];
        if(2 != $userflag){
            $this->error("没有权限!");
        }
    }

    public function search(){
        $examp = I("q"); //query number
        $page = I('page',1); // get the requested page
        $limit = I('rows',20); // get how many rows we want to have into the grid
        $sidx = I('sidx',1); // get index row - i.e. user click to sort
        $sord = I('sord','asc'); // get the direction
        if(!$sidx) $sidx =1;

        $wh = "";
        //$searchOn = Strip($_REQUEST['_search']);
        $searchOn = I('_search');
        if('true' == $searchOn) {
            //$sarr = Strip($_REQUEST);
            $sarr = I('param.');
            foreach( $sarr as $k=>$v) {
                switch ($k) {
                    case 'user_name':
                    case 'email':
                    case 'department':
                        $wh .= " AND " . $k . " LIKE '%" . $v . "%'";
                        break;
                    case 'id':
                        $wh .= " AND ".$k." = ".$v;
                        break;
                }
            }
        }
        //echo $wh;
        // connect to the database
        switch ($examp) {
            case 1:
                $result = mysql_query("SELECT COUNT(*) AS count FROM invheader a, clients b WHERE a.client_id=b.client_id".$wh);
                $row = mysql_fetch_array($result,MYSQL_ASSOC);
                $count = $row['count'];

                if( $count >0 ) {
                    $total_pages = ceil($count/$limit);
                } else {
                    $total_pages = 0;
                }
                if ($page > $total_pages) $page=$total_pages;
                $start = $limit*$page - $limit; // do not put $limit*($page - 1)
                if ($start<0) $start = 0;
                $SQL = "SELECT a.id, a.invdate, b.name, a.amount,a.tax,a.total,a.note FROM invheader a, clients b WHERE a.client_id=b.client_id".$wh." ORDER BY ".$sidx." ".$sord. " LIMIT ".$start." , ".$limit;
                $result = mysql_query( $SQL ) or die("Could not execute query.".mysql_error());
                $responce->page = $page;
                $responce->total = $total_pages;
                $responce->records = $count;
                $i=0;
                while($row = mysql_fetch_array($result,MYSQL_ASSOC)) {
                    $responce->rows[$i]['id']=$row[id];
                    $responce->rows[$i]['cell']=array($row[id],$row[invdate],$row[name],$row[amount],$row[tax],$row[total],$row[note]);
                    $i++;
                }
                //echo $json->encode($responce); // coment if php 5
                echo json_encode($responce);

                break;
            case 3:
        }
    }

    public function usemng(){
        $this->display();
    }


    public function add(){
        $this->department_array = USER_FUN_GET_DEPARTMENT_ARRAY(); // 进行模板变量赋值
        $this->display();
    }
    public function insert(){
        $Form   =   D('user');
        if($Form->create()) {
            $result =   $Form->add();
            if($result) {
                $this->success('操作成功!',"User/index");
            }else{
                $this->error('写入错误!');
            }
        }else{
            $this->error($Form->getError());
        }
    }
}
