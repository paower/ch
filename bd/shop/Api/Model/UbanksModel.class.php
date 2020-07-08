<?php
/**
 *  Created by .
 *  User: 七年
 *  Date: 2020-05-14
 *  Time: 11:56
 *  Motto: 无私奉献不是天方夜谭，有时候，我们也可以做到。
 */

namespace Api\Model;


use Think\Model;

class UbanksModel extends Model
{
    protected $tableName = 'ubanks';

    public function GetStartPay($uid){
        return $this->where(array('user_id'=>$uid,'is_default'=>1))->order('id')->field('id,type')->select();
    }

    public function GetBankInfo($uid){
        return $this->where(array('user_id'=>$uid))->order('id')->field('id,alipay_name,alipay_number,open_bank,opening_branch,img,type')->where("is_default = 1")->order('type asc')->select();
    }
}