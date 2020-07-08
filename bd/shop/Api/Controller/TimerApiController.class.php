<?php
/**
 *  Created by .
 *  User: 七年
 *  Date: 2020-05-25
 *  Time: 10:37
 *  Motto: 无私奉献不是天方夜谭，有时候，我们也可以做到。
 */

namespace Api\Controller;


use Think\Controller;

class TimerApiController extends Controller
{
    //定时设定铭文状态
    public function clearStatus(){
        //未过期铭文
        $lingcheng = strtotime(date('Y-m-d',time()));
        
        // $info = M('sign_in')->where("time >= $lingcheng")->field('uid')->select();
        // $res=[];
        // foreach ($info as $key => $value) {
        //  # code...
        //  $res[]= $value['uid'];
        // }
        // $info = implode(',',$res);
        // $map['overtime'] = array('EGT',time());
        // $map['uid'] = array('not in',$info);
        // $list = M('user_scroll')->where($map)->save(['status'=>0]);
        // die;
        
        if(time()-$lingcheng>360) return;
        $map['overtime'] = array('EGT',time());
        $list = M('user_scroll')->where($map)->save(['status'=>0]);
    }
}