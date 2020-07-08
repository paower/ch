<?php
/**
 *  Created by .
 *  User: 七年
 *  Date: 2020-05-14
 *  Time: 16:34
 *  Motto: 无私奉献不是天方夜谭，有时候，我们也可以做到。
 */

namespace Api\Model;


use Think\Model;

class StoreModel extends Model
{
    protected $tableName = 'store';

    public function GetUserAssets($uid){
        return $this->where(array('uid'=>$uid))->find();
    }
}