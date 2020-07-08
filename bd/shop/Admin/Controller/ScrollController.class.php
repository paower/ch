<?php

namespace Admin\Controller;

/**
 * 矿机
 * @author 
 */
class ScrollController extends AdminController
{
    /**
     * 矿机列表
     * @author 
     */
    public function index()
    {
        $list = M('scroll')->order('id asc')->select();
        $this->assign('list',$list);
        $this->display();
    }

    //手续费列表
    public function poundage_list(){
        $list = M('poundage')->alias('p')->join('ysk_user u ON p.uid = u.userid')->select();
        $sum = 0;
        foreach ($list as $key => $value) {
            $state = $value['state'];
            $cidian = $value['num'];
            if($state == 2){
                $sum += $cidian;
            }
        }
        $daysum = 0;
        $lingcheng = strtotime(date('Y-m-d'));
        $where['oktime'] = array('egt',$lingcheng);
        $where['state'] = 2;
        $daylist = M('poundage')->where($where)->select();
        foreach ($daylist as $key => $value) {
            $state = $value['state'];
            $daycidian = $value['num'];
            if($state == 2){
                $daysum += $daycidian;
            }
        }
        $this->assign('daysum',$daysum);
        $this->assign('list',$list);
        $this->assign('sum',$sum);
        $this->display();
    }

    public function user_scroll()
    {
        $User = M('user_scroll'); // 实例化User对象
        $count      = $User->count();// 查询满足要求的总记录数
        $Page       = new \Think\Page($count,25);// 实例化分页类 传入总记录数和每页显示的记录数(25)
        $show       = $Page->show();// 分页显示输出// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
        $list = $User->limit($Page->firstRow.','.$Page->listRows)->order('id desc')->select();

        //手机号搜索
        if(I('keyword')){
            $mobile = I('keyword');
            $uid= M('user')->where("mobile = $mobile")->getField('userid');
            $count      = $User->where("uid = $uid")->count();// 查询满足要求的总记录数
            $Page       = new \Think\Page($count,25);// 实例化分页类 传入总记录数和每页显示的记录数(25)
            $show       = $Page->show();// 分页显示输出// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
            $list = $User->where("uid = $uid")->limit($Page->firstRow.','.$Page->listRows)->order('id desc')->select();
        }
        
        foreach ($list as $k=>$v){
            $userinfo = M('user')->where('userid='.$v['uid'])->field('username,mobile,account')->find();
            $list[$k]['username'] = $userinfo['username'];
            $list[$k]['mobile'] = $userinfo['mobile'];
            $list[$k]['account'] = $userinfo['account'];
            $list[$k]['scroll_name'] = M('scroll')->where('id='.$v['scroll_id'])->getField('title');
        }
        $this->assign('count',$count);
        $this->assign('list',$list);// 赋值数据集
        $this->assign('table_data_page',$show);// 赋值分页输出
        $this->display();
    }

    public function user_changes()
    {
        $mobile = I('keyword');
        $User = M('tranmoney'); // 实例化User对象
        $count      = $User->count();// 查询满足要求的总记录数
        $Page       = new \Think\Page($count,20);// 实例化分页类 传入总记录数和每页显示的记录数(25)
        $show       = $Page->show();// 分页显示输出// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
        $list = $User->limit($Page->firstRow.','.$Page->listRows)->order('id desc')->select();
        //手机号搜索
        if(!empty($mobile)){
            $id = M('user')->where("mobile = $mobile")->getField('userid');
            $count      = $User->where("get_id|pay_id = $id")->count();// 查询满足要求的总记录数
            $Page       = new \Think\Page($count,20);// 实例化分页类 传入总记录数和每页显示的记录数(25)
            $show       = $Page->show();// 分页显示输出// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
            $list = $User->where("get_id|pay_id = $id")->limit($Page->firstRow.','.$Page->listRows)->order('id desc')->select();
        }
        foreach ($list as $k=>$v){
            $v['get_id']==0?$uid=$v['pay_id']:$uid=$v['get_id'];
            $userinfo = M('user')->where('userid='.$uid)->field('username,mobile,account')->find();
            $list[$k]['username'] = $userinfo['username'];
            $list[$k]['mobile'] = $userinfo['mobile'];
            $list[$k]['account'] = $userinfo['account'];
        }
        $this->assign('list',$list);// 赋值数据集
        $this->assign('table_data_page',$show);// 赋值分页输出
        $this->display();
    }

    public function add(){
        if(IS_POST){
            $title = trim(I('title'));
            $active = (int)I('active');
            $sell_num = (float)I('sell_num');
            $single_num = (float)I('single_num');
            $max_day = (int)I('max_day');
            $reward_num = (float)I('reward_num');
            $max_size = (int)I('max_size');
            if($title == ''){
                $this->error('请输入矿机名称');
            }
            if($active == ''){
                $this->error('请输入购买增加的活跃度');
            }
            if($sell_num === ''){
                $this->error('请输入购买的CC币数量');
            }
            if($single_num === ''){
                $this->error('请输入奖励CC币的数量');
            }
            if($max_day == ''){
                $this->error('请输入所达步数');
            }
            if($max_size == ''){
                $this->error('请输入最多使用数量');
            }

            $data['title'] = $title;
            $data['active'] = $active;
            $data['sell_num'] = $sell_num;
            $data['single_num'] = $single_num;
            $data['max_day'] = $max_day;
            $data['max_size'] = $max_size;
            $data['reward_num'] = $reward_num;
            
            $res = M('scroll')->add($data);
            if($res){
                $this->success('添加矿机成功',U('scroll/index'));
            }else{
                $this->error('添加矿机失败');
            }


        }
        $this->display();
    }

    public function edit(){
        if(IS_POST){
            $id = (int)I('id');
            $title = trim(I('title'));
            $active = (int)I('active');
            $sell_num = (float)I('sell_num');
            $single_num = (float)I('single_num');
            $reward_num = (float)I('reward_num');
            $max_day = (int)I('max_day');
            $max_size = (int)I('max_size');
            if($title == ''){
                $this->error('请输入矿机名称');
            }
            if($active == ''){
                $this->error('请输入购买增加的活跃度');
            }
            if($sell_num === ''){
                $this->error('请输入购买的CC币数量');
            }
            if($single_num === ''){
                $this->error('请输入奖励CC币的数量');
            }
            if($max_day == ''){
                $this->error('请输入所达步数');
            }
            if($max_size == ''){
                $this->error('请输入最多使用数量');
            }
            
            $data['title'] = $title;
            $data['active'] = $active;
            $data['sell_num'] = $sell_num;
            $data['single_num'] = $single_num;
            $data['max_day'] = $max_day;
            $data['max_size'] = $max_size;
            $data['reward_num'] = $reward_num;
            
            $res = M('scroll')->where(array('id'=>$id))->save($data);
            if($res !== false){
                $this->success('修改矿机成功',U('scroll/index'));
            }else{
                $this->error('修改矿机失败');
            }
        }
        $id = (int)I('get.id');
        $scroll_exis = M('scroll')->where(array('id'=>$id))->count();
        if(!$scroll_exis){
            $this->error('该参数不存在，请重试');
        }
        $scroll = M('scroll')->where(array('id'=>$id))->find();
        $this->assign('scroll',$scroll);
        $this->display();
    }

    public function setStatus(){
        $id = (int)I('ids');
        $status = I('status');
        if($status != 'resume' && $status != 'forbid'){
            $this->error('状态错误，请刷新重试');
        }
        $scroll_exis = M('scroll')->where(array('id'=>$id))->count();
        if(!$scroll_exis){
            $this->error('该参数不存在，请重试');
        }
        
        if($status == 'resume'){
            // 锁定
            $res = M('scroll')->where(array('id'=>$id))->setField('status',1);
            if($res !== false){
                $this->success('解锁成功',U('scroll/index'));
            }else{
                $this->error('解锁失败，请重新尝试');
            }
        }elseif($status == 'forbid'){
            //解锁
            $res = M('scroll')->where(array('id'=>$id))->setField('status',0);
            if($res !== false){
                $this->success('锁定成功',U('scroll/index'));
            }else{
                $this->error('锁定失败，请重新尝试');
            }
        }
        
    }


    public function del(){
        $id = (int)I('ids');
        $scroll_exis = M('scroll')->where(array('id'=>$id))->count();
        if(!$scroll_exis){
            $this->error('该参数不存在，请重试');
        }

        $res = M('scroll')->where(array('id'=>$id))->delete();
        if($res){
            $this->success('删除成功');
        }else{
            $this->error('删除失败');
        }

    }

    public function user_scroll_del(){
        $id = I('id');
        $res = M('user_scroll')->where("id = $id")->delete();
        if($res){
            $this->success('删除成功');
        }else{
            $this->error('删除失败');
        }
    }
    
}
