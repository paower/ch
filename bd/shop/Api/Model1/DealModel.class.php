<?php
/**
 *  Created by .
 *  User: 七年
 *  Date: 2020-05-14
 *  Time: 11:45
 *  Motto: 无私奉献不是天方夜谭，有时候，我们也可以做到。
 */

namespace Api\Model;


use Think\Model;

class DealModel extends Model
{
    protected $tableName = 'deal';

    //检测是否存在别的单
    public function Have_Order($uid){
        return $this->where(array('pay_id|sell_id'=>$uid,'status'=>array('in','1,2')))->count();
    }

    public function OrderInfo($id,$foem_type){
        return $this->where(array('id'=>$id,'type'=>$foem_type))->field('id,num,sell_id,pay_id,status,type,pay_type,tprice,dprice,deal_sn,expiration_time')->find();
    }

    public function AddData($data){
        return $this->add($data);
    }

    public function SaveDate($id,$data){
        return $this->where(array('id'=>$id))->save($data);
    }
    //交易列表
    public function GetList(){
        $where['status'] = array('in','0');
        $list = $this->order('id desc')->where($where)->field('id,num,sell_id,pay_id,status,type,tprice,dprice,create_time,pay_type,deal_sn')->select();
        if($list){
            foreach($list as $k => $v){
                if($v['type']==0){
                    $uid = $v['sell_id'];
                }else if($v['type']==1){
                    $uid = $v['pay_id'];
                }
                $userinfo = D('User')->getUserinfo($uid);
                $list[$k]['username'] = $userinfo['nickname'];
                $list[$k]['headimg'] = $userinfo['headimg'];
                $list[$k]['create_time'] = date('Y-m-d H:i:s',$v['create_time']);
                $list[$k]['pay_type'] = explode(',',$v['pay_type']);
            }
        }
        return $list;
    }

    public function GetMyOrderAll($uid){
        $res =  $this->where(array('sell_id|pay_id'=>$uid))->order('id desc')->select();
        foreach ($res as $k=>$v){
            if($v['type']==0){
                $orderuid = $v['sell_id'];
            }else{
                $orderuid = $v['pay_id'];
            }
            $userinfo = D('User')->getUserinfo($orderuid);
            $res[$k]['create_time'] = date('Y-m-d H:i:s',$v['create_time']);
            $res[$k]['username'] = $userinfo['nickname'];
//            $res[]
        }
        return $res;
    }
}