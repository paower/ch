<?php
namespace Admin\Controller;
use Think\Controller;
class IndexController extends AdminController {

    //重新根据经验值判断会员等级
    public function again_set_vip_grade(){
        $userinfo = M('user')->alias('u')->where("u.vip_grade != 0")->join('ysk_store s ON u.userid = s.uid')->select();
        $vip_grade = M('user_level')->where("state = 1")->select();
        foreach ($userinfo as $k => $v) {
            $exp = $v['exp'];
            $id = $v['userid'];
            foreach ($vip_grade as $key => $value) {
                $needexp = $value['push_num'];
                $user_level = $value['vip_grade'];
                if($exp>=$needexp){
                    M('user')->where("userid = $id")->setField('vip_grade',$user_level);
                }
            }
        }
    }

    public function index(){
        //会员统计
        $this->getUserCount();
        //交易量
        $this->TraingCount();
		$start=strtotime(date('Y-m-d'));
        $end=$start+86400;
		$where['create_time'] = array(
			array('egt',$start),
			array('elt',$end),
		);
		$deal_count = M('deal')->where($where)->count();
		$this->assign('deal_count',$deal_count);
        $this->assign('meta_title', "首页");
        $this->display();
    }
    
    public function getUserCount(){
        $user=D('User');
        $user_total=$user->count(1);
        $start=strtotime(date('Y-m-d'));
        $end=$start+86400;
        $where="reg_date BETWEEN {$start} AND {$end}";
        $user_count=$user->where($where)->count(1);
        $this->assign('user_total', $user_total);
        $this->assign('user_count', $user_count);
    }

    public function TraingCount(){
        $traing=M('trading');
        $trading_free=M('trading_free');

        $start=strtotime(date('Y-m-d'));
        $end=$start+86400;
        $where="create_time BETWEEN {$start} AND {$end}";

        $traing_count=$traing->where($where)->count(1);
        $traing_total=$traing->count(1);

        $traing_count+=$trading_free->where($where)->count(1);
        $traing_total+=$trading_free->count(1);

        $this->assign('traing_count', $traing_count);
        $this->assign('traing_total', $traing_total);
    }

    /**
     * 删除缓存
     * @author jry <##>
     */
    public function removeRuntime()
    {
        $file   = new \Util\File();
        $result = $file->del_dir(RUNTIME_PATH);
        if ($result) {
            $this->success("缓存清理成功1");
        } else {
            $this->error("缓存清理失败1");
        }
    }
}