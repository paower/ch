<?php
/**
 *  Created by .
 *  User: 七年
 *  Date: 2020-05-19
 *  Time: 11:28
 *  Motto: 无私奉献不是天方夜谭，有时候，我们也可以做到。
 */

namespace Api\Controller;


class VerifyApiController extends CommonApiController
{
    private  $uid;

    public function __construct(){

        $openid = I('openid');
        if(!GetUserId($openid)){
            ajaxReturn('未找到该用户',0);
        }
        $this->uid = GetUserId($openid);
    }
    //获取提交认证信息
    public function GetHYData(){
        $res = D('Industry')->GetVerifyId($this->uid);
        if($res)echo json_encode(['status'=>1,'data'=>$res]);
    }
    //实名
    public function sub_verify(){
        if(IS_POST){
            $uid = $this->getUid(I('openid'));
            $id_card = trim(I('id_card'));
            $truename = trim(I('truename'));
            $pic1 = I('pic1');
            $pic2 = I('pic2');
            $User = D('User');
            $res = $User->real_name_form($uid,$id_card,$truename,$pic1,$pic2);
            if($res){
                ajaxReturn('提交成功，等待审核',1);
            }else{
                ajaxReturn('提交失败',0);
            }
        }
    }

    public function get_industry_list(){
        echo json_encode(['status'=>1,'data'=>D('Industry')->GetList()]);
    }

    //行业认证
    public function industry_verify(){
        if(IS_POST){
            $Industry = D('Industry');
            if($Industry->GetVerifyId($this->uid)){
                ajaxReturn('请勿重复提交',0);
            }
            $datas = [
                'industry_id'=>trim(I('industry_id')),
                'company'=>I('company'),
                'license'=>I('license'),
                'create_time'=>time(),
                'uid'=>$this->uid
            ];
            $res = $Industry ->AddVerify($datas);
            if($res){
                ajaxReturn('提交成功，等待审核',1);
            }else{
                ajaxReturn('提交失败',0);
            }
        }
    }
}