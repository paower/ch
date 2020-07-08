<?php
/**
 *  Created by .
 *  User: 七年
 *  Date: 2020-05-13
 *  Time: 16:22
 *  Motto: 无私奉献不是天方夜谭，有时候，我们也可以做到。
 */

namespace Api\Model;


use Think\Model;

class ConfigModel extends Model
{
    protected $tableName = 'config';

    public function Config($name){
        return $this->where(array('name'=>$name))->getField('value');
    }
}