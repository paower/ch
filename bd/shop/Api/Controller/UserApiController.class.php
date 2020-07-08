<?php

namespace Api\Controller;
use Think\Controller;

class UserApiController extends CommonApiController
{
    private  $uid;

    public function __construct(){

        $openid = I('openid');
        if(!GetUserId($openid)){
            ajaxReturn('未找到该用户',0);
        }
        $this->uid = GetUserId($openid);
        parent::__construct();
    }

    public function getsubuser($id){
        $room=M('user')->field('userid')->where('pid="'.$id.'"')->select();
        $str='0';
        if(!empty($room))
        {
            foreach($room as $vo)
            {
                $str+=1;
                $str+=$this->getsubuser($vo['userid'],$level+1);
            }
        }
        return $str;
    }

    public function get_team_num(){
        $uid = $this->uid;
        $res = $this->getsubuser($uid);
        ajaxReturn($res);
    }

    public function get_son_list(){
        $uid = $this->uid;
        $res = M('user')->where("pid = $uid")->select();
        foreach ($res as $k => $v) {
            $userid = $v['userid'];
            $res[$k]['team_num'] = $this->getsubuser($userid);
        }
        ajaxReturn($res);
    }

    public function get_pinfo(){
        $uid = $this->uid;
        $pid = M('user')->where("userid = $uid")->getField('pid');
        $res = M('user')->where("userid = $pid")->find();
        // $res['reg_date'] .= '000';
        ajaxReturn($res);
    }

    public function get_son_num(){
        $uid = $this->uid;
        $res = M('user')->where("pid = $uid")->count();
        ajaxReturn($res);
    }

    public function setUserInfo(){
        if(IS_POST){
            $openid = I('openid');
            $uid = GetUserId($openid);
            if(!$uid){
                ajaxReturn('未找到该用户',0);
            }
            $type = I('type');
            $data = I('data');
            $setname = '';
            switch ($type){
                case 'birthday';
                    $setname = 'birthday';
                    break;
                case 'username';
                    $setname = 'username';
                    break;
                case 'nickname';
                    $setname = 'nickname';
                    break;
                case 'gxqm';
                    $setname = 'gxqm';
                    break;
                case 'sex';
                    $setname = 'sex';
                    break;
            }
            if(!empty($setname)){
                $res = M('user')->where(array('userid'=>$uid))->save([$setname=>$data]);
//                $res = ->setInfo($uid,$setname,$data);
                if($res){
                    $datainfo = D('User')->getUserinfo($uid);
                    ajaxReturn('修改成功',1,'/',$datainfo);
                }else{
                    ajaxReturn('修改出错了',1);
                }
            }
        }
    }

    public function mygrade(){
        if(IS_POST){
            $uid = $this->uid;
            $User = D('User');
            ajaxReturn('ok',1,'/',$User->mygrade($uid));
        }
    }

    public function imgUps(){

        if(IS_POST){
            $openid = I('openid');
            $uid = GetUserId($openid);
            if(!$uid){
                ajaxReturn('未找到该用户',0);
            }
            if($_FILES['file']['tmp_name'])
            {
                $inf=$this->upload();
                $data['headimg']='http://'.$_SERVER['SERVER_NAME'].'/Public/user/'.$inf['file']['savepath'].$inf['file']['savename'];
            }else{
                $data['file']='';
            }
            $id = M('user')->where(array('userid'=>$uid))->save($data);
            if ($id) {
                $User = D('User');
                echo json_encode($User->getUserinfo($uid));
            } else {
                $data = ['code'=>400,'msg'=>'修改失败'];
                echo json_encode($data);
            }

        }
    }

    //其他上传
    public function otherUpload(){
        if($_FILES['file']['tmp_name']){
            $inf = $this->upload();
            $img = 'http://'.$_SERVER['SERVER_NAME'].'/Public/user/'.$inf['file']['savepath'].$inf['file']['savename'];
            $data = ['code'=>200,'message'=>'上传成功','data'=>$img];
            echo json_encode($data);
        }else{
            $data = ['code'=>400,'message'=>'上传失败了'];
            echo json_encode($data);
        }

    }
    public function upload(){
        if(empty($_FILES)){
            $this->error("请选择上传文件！");
        }else{
            $upload = new \Think\Upload();// 实例化上传类
            $upload->maxSize   = 3145728 ;// 设置附件上传大小
            $upload->exts      = array('jpg', 'gif', 'png', 'jpeg');// 设置附件上传类型
            $upload->rootPath  = './Public/user/'; // 设置附件上传根目录
            $upload->savePath  = ''; // 设置附件上传（子）目录
            // 上传文件
            $inf  =   $upload->upload();
            $inf1 = $upload->upload();
            if(!$inf) {// 上传错误提示错误信息
                $this->error($upload->getError());
                $data = ['code'=>400,'message'=>'上传失败'.$upload->getErrot()];
                $this->ajaxReturn($data);
            }else{// 上传成功 获取上传文件信息
                return $inf;
            }
        }
    }



    public function get_id_card(){
        $uid = $this->getUid(I('openid'));
        $User = D('User');
        $res = $User->getMyIDcard($uid);
        if($res){
            ajaxReturn('ok',1,'/',$res);
        }else{
            ajaxReturn('no',0);
        }
    }

    public function getMyBank(){
        $uid = $this->getUid(I('openid'));
        $User = D('User');
        $res = $User->GetMyBank($uid);
        if($res){
            ajaxReturn('ok',1,'/',$res);
        }else{
            ajaxReturn('no',0);
        }
    }

    //设置开启支付方式
    public function setPayType(){
        $uid = $this->getUid(I('openid'));
        $id = I('id');
        $status = I('status');
        if($status!='false'){
            $status=1;
        }else{
            $status=0;
        }
        $User = D('User');
        $res = $User->setPayStatus($uid,$id,$status);
        if($res){
            ajaxReturn('设置成功',1,'/',$status);
        }else{
            ajaxReturn('设置失败了',0);
        }
    }

    //添加支付方式
    public function addPayType(){
        if(IS_POST) {
            $uid = $this->getUid(I('openid'));
            $data = I('post.');
            $User = D('User');
            if($User->addPayType($uid,$data)){
                ajaxReturn('添加成功',1);
            }else{
                ajaxReturn('添加失败了',0);
            }
        }
    }

    //获取银行卡信息
    public function GetMyBankId(){
        $uid = $this->getUid(I('openid'));
        $bank_id = I('id');
        $User = D('User');
        $res = $User->GetMyBankId($uid,$bank_id);
        if($res){
            ajaxReturn('获取成功',1,'/',$res);
        }else{
            ajaxReturn('获取数据失败',0);
        }
    }

    //修改银行卡
    public function EditMyBank(){
        $uid = $this->getUid(I('openid'));
        $data = I('post.');
        $User = D('User');
        $res = $User->EditMyBank($uid,$data);
        if($res){
            ajaxReturn('修改成功',1,'/',$res);
        }else{
            ajaxReturn('修改失败',0);
        }
    }

    public function Sharecode(){
        $u_ID = $this->uid;
        $drpath = './Uploads/Scode';
        $imgma = 'codes' . $u_ID . '.png';
        $urel = './Uploads/Scode/' . $imgma;
        $yqm = M('user')->where("userid = $u_ID")->getField('username');
        if (!file_exists($drpath . '/' . $imgma)) {
            sp_dir_create($drpath);
            vendor("phpqrcode.phpqrcode");
            $phpqrcode = new \QRcode();
            $hurl ="http://".$_SERVER['SERVER_NAME']. U('Login/register/mobile/' . $yqm);
            $size = "7";
            //$size = "10.10";
            $errorLevel = "L";
            $phpqrcode->png($hurl, $drpath . '/' . $imgma, $errorLevel, $size);


            $phpqrcode->scerweima1($hurl,$urel,$hurl);

        }
        $aurl = "http://".$_SERVER['SERVER_NAME']. U('Login/register/mobile/' . $yqm);
        $data = [
            'yqm'=>$yqm,
            'url'=>$aurl,
            'qrcode'=>"http://".$_SERVER['SERVER_NAME'].ltrim($urel,"."),
            'status'=>1,
            'headimg'=>M('user')->where('userid='.$this->uid)->getField('headimg')
        ];
        echo json_encode($data);
    }
}

?>