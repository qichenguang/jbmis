<?php
namespace Home\Controller;
use Think\Controller;
//use Think\Page;
class ProjectController extends Controller {
/*    public function index(){
        $this->user_id = $_SESSION['user_id'];
        $this->department = $_SESSION['department'];
        $this->display();
    }*/
/*    public function search(){
        $Data = M('sc'); // 实例化Data数据对象
        $search = $_POST['search'];


        //$where = "pro_id like '%$search%' or sc_pro_name like '%$search%'";
        $map['pro_id'] = array('like',"%$search%");
        $map['sc_pro_name'] = array('like',"%$search%");
        $map['_logic'] = 'or';
        $count      = $Data->where($map)->count();// 查询满足要求的总记录数
        $Page       = new Page($count,3);// 实例化分页类 传入总记录数
        foreach($map as $key=>$val) {
            $Page->parameter   .=   "$key=".urlencode($val).'&';
        }
        //$Page->parameter   =   array_map('urlencode',$map);
        //$Page->parameter   .=   "search=".urlencode($search).'&';
        // 进行分页数据查询 注意page方法的参数的前面部分是当前的页数使用 $_GET[p]获取
        $nowPage = isset($_GET['p'])?$_GET['p']:1;
        $list = $Data->where($map)->order('pro_id')->page($nowPage.','.$Page->listRows)->select();

        $Page->setConfig('header','个会员');
        $Page->setConfig('header','会员');
        $Page->setConfig('prefv','上一组会员');
        $Page->setConfig('next','下一组会员');
        $Page->setconfig('first','首页');
        $Page->setconfig('last','尾页');
        //$Page->setConfig('theme','<div style="font-weight:bold;">总共：%totalRow% %header% %nowPage%/%totalPage%页  %first% %upPage%  %prePage% %linkPage% %nextPage% %downPage% %end%</div>');
        $show       = $Page->show();// 分页显示输出
        $this->assign('page',$show);// 赋值分页输出
        $this->assign('list',$list);// 赋值数据集
        $this->display(); // 输出模板
    }*/
    public function index() {
        $this->user_id = I('session.user_id','');
        $this->department = I('session.department','');
        $this->search = I('search','');
        $this->display();
    }

    public function search() {
        $this->user_id = I('session.user_id','');
        $this->department =  I('session.department','');
        $this->search = I('search','');

        $Form   =   M('sc');
        $conditon["sc_pro_name"] = $this->search;
        $List = $Form->where("sc_pro_name like '%" . $this->search . "%'")->select();
        // $list = range(2,51);
        $param = array(
            'result'=>$List,			//分页用的数组或sql
            'listvar'=>'list',			//分页循环变量
            'listRows'=>1,			    //每页记录数
            'parameter'=>"search=" . $this->search,     //url分页后继续带的参数
            'target'=>'projectListAndAjaxPage',	    //ajax更新内容的容器id，不带#
            'pagesId'=>'projectAjaxPage',		    //分页后页的容器id不带# target和pagesId同时定义才Ajax分页
            //template'=>'Index:ajaxlist',//ajax更新模板
            'template'=>'ajaxlist',//ajax更新模板
        );
        $this->getAjaxPage($param);
/*        //dump($this->listvar);
        $ret_json = array();
        foreach($voList as &$item){
            $tmp = array();
            $qx = $item['sc_pro_qx']?$item['sc_pro_qx']:'{}';
            $qx_arr = json_decode($qx,true);
            //dump($qx_arr);
            $user_id = $_SESSION['user_id'];
            $dep = $_SESSION['department'];
            if(in_array(intval($user_id),$qx_arr[$dep])){
                $item['hasLink'] = 1;
                //dump($item['hasLink']);
                $tmp['hasLink'] = 1;
            }
            $tmp['pro_id'] = $item['pro_id'];
            $ret_json[] = $tmp;
        }

        //$this->ajaxReturn(json_encode($ret_json));
        $this->ajaxReturn(($ret_json));*/
    }

    /**
    +----------------------------------------------------------
     * 分页函数 支持sql和数据集分页 sql请用 buildSelectSql()函数生成
    +----------------------------------------------------------
     * @access public
    +----------------------------------------------------------
     * @param array   $result 排好序的数据集或者查询的sql语句
     * @param int       $totalRows  每页显示记录数 默认21
     * @param string $listvar    赋给模板遍历的变量名 默认list
     * @param string $parameter  分页跳转的参数
     * @param string $target  分页后点链接显示的内容id名
     * @param string $pagesId  分页后点链接元素外层id名
     * @param string $template ajaxlist的模板名
     * @param string $url ajax分页自定义的url
    +----------------------------------------------------------
     */
    public function getAjaxPage($param) {
        extract($param);
        //import("Home.Lib.AjaxPage");
        //总记录数
        $flag = is_string($result);
        $listvar = $listvar ? $listvar : 'list';
        $listRows = $listRows? $listRows : 21;
        if ($flag)
            $totalRows = M()->table($result . ' a')->count();
        else
            $totalRows = ($result) ? count($result) : 1;
        //创建分页对象
        if ($target && $pagesId)
            $p = new \Home\Lib\AjaxPage($totalRows, $listRows, $parameter, $url,$target, $pagesId);
        else
            $p = new \Home\Lib\AjaxPage($totalRows, $listRows, $parameter,$url);
        //抽取数据
        if ($flag) {
            $result .= " LIMIT {$p->firstRow},{$p->listRows}";
            $voList = M()->query($result);
        } else {
            $voList = array_slice($result, $p->firstRow, $p->listRows);
        }
        //check sc_qx
        foreach($voList as &$item){
            $qx = $item['sc_pro_qx']?$item['sc_pro_qx']:'{}';
            $qx_arr = json_decode($qx,true);
            //dump($qx_arr);
            $user_id = I('session.user_id','');
            $dep = I('session.department','');
            if(in_array(intval($user_id),$qx_arr[$dep])){
                $item['hasLink'] = 1;
                //dump($item['hasLink']);
            }
        }


        $pages = C('PAGE');//要ajax分页配置PAGE中必须theme带%ajax%，其他字符串替换统一在配置文件中设置，
        //可以使用该方法前用C临时改变配置
        foreach ($pages as $key => $value) {
            $p->setConfig($key, $value); // 'theme'=>'%upPage% %linkPage% %downPage% %ajax%'; 要带 %ajax%
        }
        //分页显示
        $page = $p->show();
        //模板赋值
        $this->assign($listvar, $voList);
        //dump($voList);
        $this->assign("page", $page);
        //if ($this->isAjax()) {//判断ajax请求
            layout(false);
            $template = (!$template) ? 'ajaxlist' : $template;
            exit($this->fetch($template));
        //}
        return $voList;
    }
}