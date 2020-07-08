<?php
/**
 *  Created by .
 *  User: 七年
 *  Date: 2020-05-13
 *  Time: 13:56
 *  Motto: 无私奉献不是天方夜谭，有时候，我们也可以做到。
 */

namespace Api\Controller;


class PassApiController extends CommonApiController
{
    private  $uid;

    public function __construct(){

        $openid = I('openid');
        if(!GetUserId($openid)){
            ajaxReturn('未找到该用户',0);
        }
        $this->uid = GetUserId($openid);
    }

    public function EditPassword(){
        if(IS_POST){
            $old_password = trim(I('old_password'));
            $new_password =trim(I('new_password'));
            if(empty($new_password) || empty($old_password)){
                ajaxReturn('请正确填写密码',0);
            }
            $res = D('User')->EditPassword($this->uid,$old_password,$new_password);
            if($res){
                ajaxReturn('修改成功',1);
            }else{
                ajaxReturn('修改失败了',0);
            }
        }
    }

    public function EditSafetyPassword(){
        if(IS_POST){
            
            // $info = M('user')->select();
            // foreach ($info as $key => $value) {
            //     # code...
            //     $salt = $value['safety_salt'];
            //     $userid = $value['userid'];
            //     $safety_pwd = D('Home/user')->pwdMd5('000000',$salt);
            //     M('user')->where("userid = $userid")->setField('safety_pwd',$safety_pwd);
            // }
            // die;
            
            $old_password = trim(I('old_password'));
            $new_password =trim(I('new_password'));
            if(empty($new_password) || empty($old_password)){
                ajaxReturn('请正确填写密码',0);
            }
            $res = D('User')->EditSafetyPassword($this->uid,$old_password,$new_password);
            if($res){
                ajaxReturn('修改成功',1);
            }else{
                ajaxReturn('修改失败了',0);
            }
        }
    }
}