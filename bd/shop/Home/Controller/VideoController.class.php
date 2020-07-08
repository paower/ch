<?php
namespace Home\Controller;

use Think\Controller;

class VideoController extends CommonController
{

    //申请发布视频
    public function set_upload_verify(){
        $uid = I('uid');
        if($uid){
            if(M('upload_verify')->where('uid='.$uid)->find()){
                ajaxReturn('已提交，请等待审核通过',0);
            }
            $data['uid'] = $uid;
            $data['time'] = time();

            $add = M('upload_verify')->add($data);
            if($add){
                ajaxReturn('提交成功，等待审核通过',1);
            }else{
                ajaxReturn('提交失败',0);
            }
        }else{
            ajaxReturn('权限不足',0);
        }
    }
}

?>