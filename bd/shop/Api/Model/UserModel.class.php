<?php
namespace Api\Model;
use Think\Model;

class UserModel extends Model{
    protected $tableName = 'user';

    //用户信息更新
    public function save($uid,$data){
        return $this->where(array('userid'=>$uid))->save($data);
    }

    public function setInfo($uid,$setname,$data){
        return $this->where(array('userid'=>$uid))->setField([$setname=>$data]);
    }

    public function getUserinfo($uid){

        return $this->where('userid='.$uid)
            ->field('pid,truename,account,birthday,gxqm,headimg,is_real_name,mobile,nickname,openid,sex,username,userid,is_pay,vip_grade,total_lingshi')
            ->find();
    }

    public function mygrade($uid){
        $res =  $this->where('userid='.$uid)
            ->field('total_active,vip_grade,total_lingshi,is_real_name,industry_verify,wallet_add,mobile,upload_verify')
            ->find();
        $res['exp'] = D('Store')->GetUserAssets($uid)['exp'];
        $exp = D('Store')->GetUserAssets($uid)['exp'];
        // $res['vip_grade'] = M('user_level')->where(array('id'=>$res['vip_grade']))->getField('vip_grade');
        $user_level = M('user_level')->where('state = 1')->select();
        // dump($user_level);die;
        foreach ($user_level as $key => $value) {
            if($exp>=$value['push_num']){
                $res['vip_grade'] = $value['vip_grade'];
            }
        }
        $num = M('user_scroll')->where(array('uid'=>$uid,'status'=>1))->sum('scroll_num');
        $res['mw_num'] = $num;
        $res['total_active'] = round($res['total_active'],2);
        $res['total_lingshi'] = round($res['total_lingshi'],4);

        return $res;
    }

    //实名提交
    public function real_name_form($uid,$id_card,$truename,$pic1,$pic2){
        $have = $this->getMyIDcard($uid);
        if($have){
            ajaxReturn('请不要重复提交',0);
        }
        $data = [
            'uid'=>$uid,
            'id_card'=>$id_card,
            'truename'=>$truename,
            'time'=>time(),
            'pic1'=>$pic1,
            'pic2'=>$pic2
        ];
        return M('user_verify')->add($data);
    }

    public function getMyIDcard($uid){
        $map['uid'] = $uid;
        $map['is_verify'] = array('in','0,1');
        return M('user_verify')->where($map)->field('id_card,truename,is_verify,pic1,pic2')->order('id desc')->find();
    }

    public function GetMyBank($uid){
        $res =  M('ubanks')->where(array('user_id'=>$uid))->order('id desc')->select();
        return $res;
    }

    public function setPayStatus($uid,$id,$status){
        if(!M('ubanks')->where(array('user_id'=>$uid,'id'=>$id))->find()){
            ajaxReturn('该支付方式不存在',0);
        }
        return M('ubanks')->where('id='.$id)->setField(['is_default'=>$status]);
    }

    public function addPayType($uid,$data){
        $user_info = D('user')->getUserinfo($uid);
        if($user_info['is_real_name']!=1){
            ajaxReturn('请先通过实名验证',0);
        }
        if(M('ubanks')->where(array('user_id'=>$uid,'type'=>$data['paytype']+1))->find()){
            ajaxReturn('该支付方式已存在',0);
        }
        if($data['pay_name']!=$user_info['truename'] && $data['paytype']!=2) ajaxReturn('收款姓名与实名姓名不符合',0);
        $datas = [
            'user_id'=>$uid,
            'add_time'=>time(),
            'alipay_number'=>$data['pay_number'],
            'type'=>$data['paytype']+1,
            'alipay_name'=>$data['pay_name'],
            'open_bank'=>$data['open_bank'],
            'opening_branch'=>$data['opening_branch'],
            'img'=>$data['qrcode'],
        ];
        return M('ubanks')->add($datas);
    }

    public function GetMyBankId($uid,$bank_id){
        return M('ubanks')->where(array('user_id'=>$uid,'id'=>$bank_id))->find();
    }

    public function EditMyBank($uid,$data){
        $paytype = $data['paytype']+1;
        $datas = [
            'user_id'=>$uid,
            'alipay_number'=>$data['pay_number'],
            'type'=>$paytype,
            'alipay_name'=>$data['pay_name'],
            'open_bank'=>$data['open_bank'],
            'opening_branch'=>$data['opening_branch'],
            'img'=>$data['qrcode'],
        ];
        return  M('ubanks')->where(array('user_id'=>$uid,'id'=>$data['id'],'type'=>$paytype))->save($datas);
    }

    public function EditPassword($uid,$old_password,$new_password){
        $user_object = D('Home/User');
        $userinfo = $this->where(array('userid'=>$uid))->field('login_pwd,login_salt')->find();
        if($user_object->pwdMd5($old_password, $userinfo['login_salt']) !== $userinfo['login_pwd']){
            ajaxReturn('原密码错误',0);
        };
        $login_pwd = $user_object->pwdMd5($new_password,$userinfo['login_salt']);
        return $this->where(array('userid'=>$uid))->setField(['login_pwd'=>$login_pwd]);
    }

    public function EditSafetyPassword($uid,$old_password,$new_password){
        $user_object = D('Home/User');
        $userinfo = $this->where(array('userid'=>$uid))->field('safety_pwd,safety_salt')->find();
        if($user_object->pwdMd5($old_password, $userinfo['safety_salt']) !== $userinfo['safety_pwd']){
            ajaxReturn('原密码错误',0);
        };
        $login_pwd = $user_object->pwdMd5($new_password,$userinfo['safety_salt']);
        return M('user')->where("userid = $uid")->save(['safety_pwd'=>$login_pwd]);
    }

    //直推下的好友
    public function PidIsMe($uid){
        return $this->where(array('pid'=>$uid))->order('userid desc')->field('userid,nickname,headimg')->select();
    }
}

?>