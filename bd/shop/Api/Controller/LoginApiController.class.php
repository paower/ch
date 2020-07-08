<?php
/**
 *  Created by .
 *  User: 七年
 *  Date: 2020-05-21
 *  Time: 13:56
 *  Motto: 无私奉献不是天方夜谭，有时候，我们也可以做到。
 */

namespace Api\Controller;


use Think\Controller;

class LoginApiController extends Controller
{
    public function sendSms($phone,$code){
        $mobile=$phone;
        $content = "【慈惠】您的验证码：".$code."，请及时完成验证！";
        $url = 'http://api.sms.cn/sms/?ac=send&uid=cihui2020&pwd=f6bc9df16305564cc681eebcd4f1ab29&mobile='.$mobile.'&content='.urlencode($content).'&template=533984';
        $result = file_get_contents($url);
        if(json_decode($result,true)['stat']!=100){
            echo json_encode(['code'=>400,'msg'=>'短信发送失败']);exit;
        }
    }

    public function getSms(){
        $phone = I('mobile');
        $code = rand(1000,9999);

        if(redis()->get("phone_sms:{$phone}")){
            echo json_encode(['code'=>400,'msg'=>'请勿频繁发送']);exit;
        }
        $this->sendSms($phone,$code);

        redis()->set("phone_sms:{$phone}",$code);
        if(redis()->expire("phone_sms:{$phone}",60)){
            echo json_encode(['code'=>200,'msg'=>'发送成功']);exit;
        }else{
            echo json_encode(['code'=>400,'msg'=>'发送失败']);exit;
        }
    }

    public function checksms($phone,$getcode){
        $code = redis()->get("phone_sms:{$phone}");

        if($code!=$getcode){
            ajaxReturn('验证码错误或已过期',0);
        }
        redis()->del("phone_sms:{$phone}");
    }

    public function register(){

        if(IS_POST){
            $user=D('Home/User');
            $data = $user->create();
            if(!$data){
                ajaxReturn($user->getError(),0);
                return ;
            }

            //判断仓库
            $store=D('Store');
            $mobile = I('mobile');
            $code = I('code');
            $this->checksms($mobile,$code);
            $data['mobile'] = $mobile;

            $data['username'] = build_username();
            $data['account']=$mobile;
            //密码加密
            $salt= substr(md5(time()),0,3);
            $data['login_pwd']=$user->pwdMd5($data['login_pwd'],$salt);
            $data['login_salt']=$salt;
            $data['nickname'] = '设置昵称';
            $data['birthday'] = date('Y-m-d',time());
            $data['headimg'] = 'http://'.$_SERVER['SERVER_NAME'].'/Public/user/default.jpg';
            $data['wallet_add'] ='0x' .randstr_wallet();
            $data['safety_pwd']=$user->pwdMd5($data['safety_pwd'],$salt);
            $data['safety_salt']=$salt;
            $data['openid'] = base64_encode(md5(build_username(),16));

            //推荐人
            $pidcode=I('pidcode');
            $pid = M('user')->where("username = $pidcode")->getField('userid');
                    
            $last['userid'] = $pid;
            $p_info=$user->where(array('userid'=>$pid))->field('userid,pid,gid,username,account,mobile,path,deep,vip_grade')->find();
//            dump($p_info);die();
            $gid=$p_info['pid'];//上上级ID
            $ggid=$p_info['gid'];//上上上级ID

            if($gid){
                $data['gid']=$gid;
            }
            if($ggid){
                $data['ggid']=$ggid;
            }
            $data['pid'] = $pid;
            //拼接路径
            $path=$p_info['path'];
            $deep=$p_info['deep'];
            if(empty($path)){
                $data['path']='-'.$pid.'-';
            }else{
                $data['path']=$path.$pid.'-';
            }
            $data['deep']=$deep+1;
            $data['quanxian'] = '2-5';
            $user->startTrans();//开启事务
            $uid=$user->add($data);

            if(!$uid){
                $user->rollback();
                ajaxReturn('注册失败',0);
            }

            //给上级添加值推人数
            // M('user_level')->where(array('uid'=>$pid))->setInc('children_num',1);


            $jifens= D('config')->where("name='jifens'")->getField("value");
            $jifens= (float)$jifens;
            $rens= D('config')->where("name='rens'")->getField("value");
            $pid_n=M('user')->where(array('pid'=>$pid))->count(1);


          //  if($pid_n<=$rens && $jifens>0){

         //       if($p_info['vip_grade'] != 0){
        //            $datapay22['fengmi_num'] = array('exp', 'fengmi_num + ' . $jifens);
         //           $res_pay_get = M('store')->where(array('uid' => $pid))->save($datapay22);//推荐一人增加积分

           //         $get_n = M('store')->where(array('uid' => $pid))->getfield('fengmi_num');
        //        }

        //        $datass['pay_id'] = $pid;
        //        $datass['get_id'] = $pid;
        //        $datass['get_nums'] = $jifens;
         //       $datass['now_nums_get'] = $get_n;
        //        $datass['now_nums'] = $get_n;
        //        $datass['is_release'] = 1;
        //        $datass['get_time'] = time();
         //       $datass['get_type'] = 23;
         //       $res_addrs = M('tranmoney')->add($datass);
         //   }




            //给用户添加等级
            // AddUserLevel($pid);
            if($uid){
                $user->commit();


                //创建钱包
                $jifen=0;
                $regjifen= D('config')->where("name='regjifen'")->getField("value");//奖励开启才送

                if($regjifen==1){
                    $jifen=M('config')->where(array('name'=>'jifen'))->getField('value');
                    $jifen=(float)$jifen;
                }
                $startTime = strtotime(date('Y-m-d'));
                $endTime = strtotime(date('Y-m-d',strtotime('+1 day')));
                $where = 'reg_date >= '.$startTime.' and reg_date <= '.$endTime;
                $nums = M('user')->where($where)->count(1);
                // M('user')->where(array('pid' => $v))->count(1);

                $store = array();
                $store['uid'] = $uid;
                $store['cangku_num'] = 0;

                if($nums <= 500){
                    $store['fengmi_num'] = $jifen;
                }else{
                    $store['fengmi_num'] = 0;
                }

                $update_time = M('config')->where(array('name'=>'add_user'))->getField('update_time');
                $startTime = strtotime(date('Y-m-d',$update_time));
                $endTime = strtotime(date('Y-m-d',$startTime+24*60*60));
                if($update_time >= $endTime){
                    M('config')->where(array('name'=>'add_user'))->setField('value',0);
                }

                $store['plant_num'] = 0;
                $store['huafei_total'] = 0;
                M("store")->add($store);
                ajaxReturn('注册成功',1);
            }
            else{
                $user->rollback();
                ajaxReturn('注册失败',0);
            }
        }
    }

    //忘记密码
    public function ForGet(){
        if(IS_POST){
            $mobile = trim(I('mobile'));
            $code = I('code');
            $new_password = I('login_pwd');
            $this->checksms($mobile,$code);
            $user_object = D('Home/User');
            $userinfo = M('user')->where(array('mobile'=>$mobile))->field('login_pwd,login_salt,userid')->find();
            $login_pwd = $user_object->pwdMd5($new_password,$userinfo['login_salt']);
            $res =  M('user')->where(array('userid'=>$userinfo['userid']))->save(['login_pwd'=>$login_pwd]);
            if($res){
                ajaxReturn('修改成功',1);
            }else{
                ajaxReturn('修改失败',0);
            }
        }
    }
}