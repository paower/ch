<?php
/**
 *  Created by .
 *  User: 七年
 *  Date: 2020-05-18
 *  Time: 13:51
 *  Motto: 无私奉献不是天方夜谭，有时候，我们也可以做到。
 */

namespace Api\Controller;


class MessageApiController extends CommonApiController
{
    public function GetNotice(){
        $res = D('News')->GetFirst();
        $res['create_time'] = date('Y-m-d H:i:s',$res['create_time']);
        $res['content'] = htmlspecialchars_decode($res['content']);
        echo json_encode($res);
    }

    //系统消息列表
    public function GetMessageList(){
        $res = D('News')->GetList();
        foreach ($res as $k=>$v){
            $res[$k]['create_time'] = date('Y-m-d H:i:s',$v['create_time']);
            $res[$k]['content'] = htmlspecialchars_decode($v['content']);
        }
        echo json_encode($res);
    }

    //系统消息详情
    public function GetMessage(){
        $id = I('id');
        $res = M('News')->where("id = $id")->select();
        foreach ($res as $k=>$v){
            $res[$k]['create_time'] = date('Y-m-d H:i:s',$v['create_time']);
            $res[$k]['content'] = htmlspecialchars_decode($v['content']);
        }
        echo json_encode($res);
    }
}