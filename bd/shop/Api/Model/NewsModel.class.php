<?php
/**
 *  Created by .
 *  User: 七年
 *  Date: 2020-05-18
 *  Time: 13:55
 *  Motto: 无私奉献不是天方夜谭，有时候，我们也可以做到。
 */

namespace Api\Model;


use Think\Model;

class NewsModel extends Model
{
    protected $tableName = 'news';

    public function GetFirst(){
        return $this->order('id desc')->find();
    }

    public function GetList(){
        return $this->order('id desc')->select();
    }
}