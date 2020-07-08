<?php
/**
 *  Created by .
 *  User: 七年
 *  Date: 2020-05-13
 *  Time: 16:21
 *  Motto: 无私奉献不是天方夜谭，有时候，我们也可以做到。
 */

namespace Api\Controller;

class AboutMeApiController extends CommonApiController
{
    private $table_name;

    public function __construct(){

        $this->table_name = I('name');
    }

    public function GetAboutInfo(){
        echo htmlspecialchars_decode(D('Config')->Config($this->table_name));
    }
}