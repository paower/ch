<?php
/**
 *  Created by .
 *  User: 七年
 *  Date: 2020-05-13
 *  Time: 14:47
 *  Motto: 无私奉献不是天方夜谭，有时候，我们也可以做到。
 */

namespace Api\Controller;


class ScrollApiController extends CommonApiController
{
    private  $uid;

    public function __construct(){

        $openid = I('openid');
        if(!GetUserId($openid)){
            ajaxReturn('未找到该用户',0);
        }
        $this->uid = GetUserId($openid);
    }

    public function GetList(){
        $data =  D('Scroll')->GetList();
        echo json_encode($data);
    }

    //兑换
    public function Scroll_exchange(){
        if(IS_POST){
            $id = (int)I('id');
            $user = D('User')->getUserinfo($this->uid);

            if($user['is_real_name'] == 0 || $user['is_pay'] ==0){
                exit(json_encode(['code'=>0,'msg'=>'请先实名']));
            }
            $scroll = D('Scroll')->GetScrollId($id);

            if(!$scroll){
                exit(json_encode(['code'=>0,'msg'=>'你所选择的慈场不存在，请刷新重试']));
            }

            if($user['total_lingshi'] < $scroll['sell_num']){
                exit(json_encode(['code'=>0,'msg'=>'您的慈点不足，请先获取慈点进行兑换']));
            }
            
            // 检测用户拥有慈场的最大数
            $where['uid'] = $this->uid;
            $where['scroll_id'] = $id;
            $where['overtime'] = array('egt',time());
            $user_scroll_count = M('user_scroll')->where($where)->count();

            if($user_scroll_count >= $scroll['max_size']){
                exit(json_encode(['code'=>0,'msg'=>'已拥有最大数量']));
            }


            $user_data = [
                'total_lingshi'=>array('exp','total_lingshi - '.$scroll['sell_num']),
                'total_active'=>array('exp','total_active + '.$scroll['active'])
            ];
            $res = M('user')->where(array('userid'=>$this->uid))->save($user_data);

            M()->startTrans();
            //慈场添加记录
            $total_lingshi = M('user')->where(array('userid'=>$this->uid))->getField('total_lingshi');
            A('TurntableApi')->AddTranmoney($this->uid,0,$scroll['sell_num'],26,$total_lingshi);

            //活跃度添加记录
            $total_active = M('user')->where(array('userid'=>$this->uid))->getField('total_active');
            A('TurntableApi')->AddTranmoney(0,$this->uid,$scroll['active'],30,$total_active);

            //上级添加直推活跃度
            // $pid = M('user')->where(array('userid'=>$userid))->getField('pid');
            // $p_active = $scroll['active'] *0.07;
            // M('user')->where(array('userid'=>$pid))->setInc('total_active',$p_active);

            // $total_active = M('user')->where(array('userid'=>$pid))->getField('total_active');
            // $tm['pay_id'] = 0;
            // $tm['get_id'] = $pid;
            // $tm['get_nums'] = $p_active;
            // $tm['get_time'] = time();
            // $tm['get_type'] = 47;
            // $tm['now_nums'] = $total_active;
            // M('tranmoney')->add($tm);

            $users_data = [
                'uid' => $this->uid,
                'scroll_id' => $scroll['id'],
                'status' => 0,
                'overtime' => time() + 86400 * $scroll['max_day'],
                'reward_num'=>$scroll['reward_num'],
                'single_num'=>$scroll['single_num'],
                'max_day' =>$scroll['max_day'],
                'sell_num'=>$scroll['sell_num']
            ];
            $insert_data = D('Scroll')->AddScroll($users_data);

            if($res && $insert_data){
                M()->commit();
                $arr['code'] = 1;
                $arr['msg'] = '兑换'.$scroll['title'].'成功';
            }else{
                M()->rollback();
                $arr['code'] = 0;
                $arr['msg'] = "兑换".$scroll['title']."失败";
            }
            exit(json_encode($arr));
        }
    }

    //获取可领取铭文
    public function GetLingScroll(){
        $res = D('Scroll')->Scroll_ky($this->uid);
        $lincheng_time = strtotime(date("Y-m-d"),time());
        foreach($res as $k=>$v){
            $res[$k]['shengyu'] =intval(($v['overtime']-$lincheng_time)/3600/24);
        }
        if($res){
            ajaxReturn('ok',1,'/',$res);
        }else{
            ajaxReturn('no',0);
        }
    }

    //领取
    public function clock(){
        $trid = I('id');
        $user = M('user')->where(array('userid'=>$this->uid))->field('truename,id_card,total_active')->find();
        if(!$user['truename'] && !$user['id_card']){
            ajaxReturn('请先实名验证',0);
        }
        $todaytime = strtotime(date('Y-m-d',time()));
        $lasttime = M('user_scroll')->where(array('uid'=>$this->uid,'id'=>$trid))->field('max_day,overtime,status,scroll_num,single_num,sell_num')->find();
        if(!$lasttime) ajaxReturn('没有该慈场',0);
        if($lasttime['status']==1) ajaxReturn('已领取',0);
        M()->startTrans();
        if($todaytime < $lasttime['overtime']){

            $get_num = $lasttime['single_num'];
            $get_nums = $lasttime['sell_num']/$lasttime['max_day'];
            $res = M('user')->where(array('userid'=>$this->uid))->setInc('total_lingshi',$get_num);

            $total_lingshi = M('user')->where(array('userid'=>$this->uid))->getField('total_lingshi');

            $tm['pay_id'] = 0;
            $tm['get_id'] = $this->uid;
            $tm['get_nums'] = $get_num;
            $tm['get_time'] = time();
            $tm['get_type'] = 25;
            $tm['now_nums'] = $total_lingshi;
            $res1 = M('tranmoney')->add($tm);

            //修改状态
            M('user_scroll')->where(array('id'=>$trid))->setField('status',1);
            if($res && $res1){
                //烧伤
               D('Scroll')->getShaoshang($this->uid,$get_num,$lasttime['sell_num'],$trid);
                M()->commit();
                ajaxReturn('领取成功',1);
            }else{
                M()->rollback();
                ajaxReturn('领取失败',0);
            }

        }else{
            ajaxReturn('已领取，请勿重复',0);
        }
    }
    //获取可签到收益
    public function get_sign_in(){
        $map['status'] = 0;
        $map['overtime'] =  array('EGT',time());
        $map['uid'] = $this->uid;
        $lincheng_time = strtotime(date("Y-m-d"),time());
        $is_qiandao = M('sign_in')->where(array('time'=>array('EGT',$lincheng_time),'uid'=>$this->uid))->count();
        if($is_qiandao){
            echo json_encode(['status'=>1,'is_qiandao'=>4]); exit;
        }
        $res = M('user_scroll')->where($map)->field('single_num,id,sell_num')->select();
        $zong_num = 0;
        if ($res){
            foreach ($res as $k=>$v){
                $zong_num += $v['single_num'];
            }
        }
        if($zong_num == 0){
            echo json_encode(['status'=>1,'is_qiandao'=>3,'zong_num'=>$zong_num]); exit;
        }
        echo json_encode(['status'=>1,'is_qiandao'=>1,'zong_num'=>$zong_num]); exit;
        // echo json_encode(['status'=>1,'is_qiandao'=>$is_qiandao,'zong_num'=>$zong_num]); exit;
    }
    //今日签到
    public function todaySignin(){
        if(IS_POST){
            $map['status'] = 0;
            $map['overtime'] =  array('EGT',time());
            $map['uid'] = $this->uid;
            $lincheng_time = strtotime(date("Y-m-d"),time());
            if(M('sign_in')->where(array('time'=>array('EGT',$lincheng_time),'uid'=>$this->uid))->find()){
                ajaxReturn('今日已签到',0);
            }
            M()->startTrans();
            $res = M('user_scroll')->where($map)->field('single_num,id,sell_num,max_day')->select();
            if($res){
                $zong_num = 0;
                foreach ($res as $v){
                    $zong_num += $v['single_num'];
                    $get_num = $v['single_num'];
                    $get_nums = $v['sell_num']/$v['max_day'];
                    $res = M('user')->where(array('userid'=>$this->uid))->setInc('total_lingshi',$get_num);

                    $total_lingshi = M('user')->where(array('userid'=>$this->uid))->getField('total_lingshi');

                    $tm['pay_id'] = 0;
                    $tm['get_id'] = $this->uid;
                    $tm['get_nums'] = $get_num;
                    $tm['get_time'] = time();
                    $tm['get_type'] = 25;
                    $tm['now_nums'] = $total_lingshi;
                    $res1 = M('tranmoney')->add($tm);

                    //修改状态
                    M('user_scroll')->where(array('id'=>$v['id']))->setField('status',1);
                    if($res && $res1){
                        //烧伤
                       D('Scroll')->getShaoshang($this->uid,$get_num,$v['sell_num'],$v['id']);
//                        ajaxReturn('签到成功',1);
                    }
                }
            }
            //祝福语
            $sign_data['content'] = I('sign_content');
            $sign_data['time'] = time();
            $sign_data['uid'] = $this->uid;
            $sign_data['get_num'] = $zong_num;
            $zhufu = M('sign_in')->add($sign_data);
            if($zhufu){
                M()->commit();
                ajaxReturn('签到成功',1);
            }else{
                M()->rollback();
                ajaxReturn('签到失败',0);
            }
        }
    }

    //烧伤
    public function shaoshang(){

        D('Scroll')->getShaoshang($this->uid,2.05,50);
    }

}