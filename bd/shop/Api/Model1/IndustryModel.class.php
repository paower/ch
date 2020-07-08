<?php
/**
 *  Created by .
 *  User: 七年
 *  Date: 2020-05-19
 *  Time: 11:24
 *  Motto: 无私奉献不是天方夜谭，有时候，我们也可以做到。
 */

namespace Api\Model;


use Think\Model;

class IndustryModel extends Model
{
    protected $tableName = 'industry';

    public function GetList(){
        return $this->select();
    }

    public function AddVerify($data){
        return M('industry_verify')->add($data);
    }

    public function GetVerifyId($uid){
        $map['status'] = array('in','0,1');
        $map['uid'] = $uid;
        return M('industry_verify')->where($map)->find();
    }
}