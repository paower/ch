<?php
/**
 *  Created by .
 *  User: 七年
 *  Date: 2020-05-13
 *  Time: 15:59
 *  Motto: 无私奉献不是天方夜谭，有时候，我们也可以做到。
 */

namespace Admin\Controller;


class AboutMeController extends AdminController
{
    public function index(){
        if(IS_POST){
            $content = I('content');
            if(M('config')->where('name="about_bd"')->setField(['value'=>$content])){
                $this->success('修改成功');
            }else{
                $this->error('修改失败');
            }
        }
        $this->assign('about_bd',M('config')->where('name="about_bd"')->getField('value'));
        $this->display();
    }

    public function xieyi(){
        if(IS_POST){
            $content = I('content');
            if(M('config')->where('name="xieyi"')->setField(['value'=>$content])){
                $this->success('修改成功');
            }else{
                $this->error('修改失败');
            }
        }
        $this->assign('xieyi',M('config')->where('name="xieyi"')->getField('value'));
        $this->display();
    }

    public function yinsixieyi(){
        if(IS_POST){
            $content = I('content');
            if(M('config')->where('name="yinsixieyi"')->setField(['value'=>$content])){
                $this->success('修改成功');
            }else{
                $this->error('修改失败');
            }
        }
        $this->assign('yinsixieyi',M('config')->where('name="yinsixieyi"')->getField('value'));
        $this->display();
    }
}