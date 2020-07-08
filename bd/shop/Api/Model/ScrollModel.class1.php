<?php
/**
 *  Created by .
 *  User: 七年
 *  Date: 2020-05-13
 *  Time: 14:49
 *  Motto: 无私奉献不是天方夜谭，有时候，我们也可以做到。
 */

namespace Api\Model;


use Think\Model;

class ScrollModel extends Model
{
    protected $tableName = 'scroll';

    public function GetList(){
        return $this->where('status=1')->order('id')->select();
    }

    public function GetScrollId($id){
        $map['id'] = $id;
        $map['status'] = 1;
        return $this->where($map)->find();
    }

    public function AddScroll($data){
        return M('user_scroll')->add($data);
    }

    //查询可领取铭文
    public function Scroll_ky($uid){
        $map['us.overtime'] = array('EGT',time());
        $map['us.uid'] = $uid;
        $user_scroll = M('user_scroll us')
            ->join('ysk_scroll s ON us.scroll_id=s.id')
            ->where($map)
            ->field('s.single_num,s.title,s.max_day,s.max_size,s.reward_num,us.overtime,us.id,us.status')
            ->select();

        return $user_scroll;
    }

    //铭文收益烧伤
    public function getShaoshang($uid,$nums,$sell_num){
        $pid = M('user')->where(array('userid'=>$uid))->getField('pid');
        if(!$pid) return;
        $pid_order = M('user_scroll')->where(array('uid'=>$pid))->order('sell_num desc')->field('single_num,sell_num')->find();
//        dump($pid_order);die();
        if($pid_order){
            if($pid_order['sell_num']<$sell_num){
                $shouyi = $pid_order['single_num'] + ($nums-$pid_order['single_num'])*0.5;
            }else{
                $shouyi = $nums*0.5;
            }
        }else{
            $shouyi = $nums*0.5;
        }
        if(M('user')->where(array('userid'=>$pid))->setInc('total_lingshi',$shouyi)){
            $transmoney = [
                'pay_id' => 0,
                'get_id' => $pid,
                'get_nums' => $shouyi,
                'get_time' => time(),
                'get_type' => 102,
                'now_nums' => M('user')->where(array('userid'=>$pid))->getField('total_lingshi')
            ];
            M('tranmoney')->add($transmoney);
        }
    }
}