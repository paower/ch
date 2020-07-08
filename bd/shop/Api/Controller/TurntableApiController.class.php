<?php
/**
 *  Created by .
 *  User: 七年
 *  Date: 2020-05-14
 *  Time: 11:17
 *  Motto: 无私奉献不是天方夜谭，有时候，我们也可以做到。
 */

namespace Api\Controller;


class TurntableApiController extends CommonApiController
{
    private  $uid;

    public function __construct(){
        $openid = I('openid');
        if(!GetUserId($openid)){
            ajaxReturn('未找到该用户',0);
        }
        $this->uid = GetUserId($openid);
    }

//    当前价格以及手续费
    public function GetCurrentPrice(){
        $Config = D('Config');
        $fee = M('user_level')->where(array('id'=>D('User')->getUserinfo($this->uid)['vip_grade']))->getField('tran_fee');
        $data = [
            'buy_new_price'=>$Config->Config('buy_new_price'),
            'sell_new_price'=>$Config->Config('sell_new_price'),
            'user_fee' => $fee
        ];
        echo json_encode($data);exit;
    }

    //提交发布购买订单
    public function Salebuys(){
        $ordertype = I('ordertype'); //0求购 1出售
        $num = (float)I('num');

        if($ordertype==0){
            $dprice = D('Config')->Config('buy_new_price');
            $tab_user_name = 'sell_id';
        }elseif($ordertype==1){
            $dprice = D('Config')->Config('sell_new_price');
            $tab_user_name = 'pay_id';
        }
        $tprice = $num * $dprice;

        // 实名认证
        $user_info = D('User')->getUserinfo($this->uid);
        if($user_info['is_real_name'] == 0 || $user_info['is_pay'] == 0){
            ajaxReturn('请先进行实名认证',0);
        }

        //检测是否开启支付方式
        $is_default = D('Ubanks')->GetStartPay($this->uid);

        if(!$is_default){
            ajaxReturn('请先选择收款方式',0);
        }else{
            foreach ($is_default as $v){
                $pay_type[] = $v['type'];
            }
        }

//        if(D('Deal')->Have_Order($this->uid)){
//            ajaxReturn('请先完成订单后再下单',0);
//        }

        if($num<0||$tprice<0||$dprice<0)ajaxReturn('非法输入~',0);
        if(!$num|!$tprice)ajaxReturn('数量不能为空~',0);

        if($ordertype==1){
            //根据用户等级扣除手续费
            $userinfo = D('User')->getUserinfo($this->uid);
            $tran_fee = M('user_level')->where(array('id'=>$userinfo['vip_grade']))->getField('tran_fee');
            $tran_price = $num * $tran_fee / 100; //手续费
            $this->Is_sell($this->uid,$num,$tran_price,$userinfo['total_lingshi']);
        }
        //生成交易记录
        $ordertype==0?$fee_num = 0:$fee_num=$tran_price;
        $deal = [
            $tab_user_name=> $this->uid,
            'deal_sn' =>build_order_no(),
            'num' => $num,
            'fee_num' => $fee_num,
            'create_time' => time(),
            'tprice' => $tprice,
            'dprice' => $dprice,
            'type' => $ordertype,
            'pay_type'=>implode(',',$pay_type)
        ];
        if(D('Deal')->AddData($deal)){
            ajaxReturn('发布成功',1,"/");
        }else{
            ajaxReturn('发布失败了',0);
        }

    }

    //出售扣除
    public function Is_sell($uid,$num,$tran_price,$total_lingshi){
        $lingshi = ($num+$tran_price);
       if(($lingshi) > $total_lingshi){
            ajaxReturn('慈点余额不足',0);
        }
        //拥有慈场数量
        $have = M('user_scroll')->where("uid = $uid")->count();
        if($have == 1){
            ajaxReturn('您需要先兑换任意一个慈场',0);
        }

        $payout1['djie_num'] = array('exp', 'djie_num + ' . $lingshi);
        $payout1['total_lingshi'] = array('exp', 'total_lingshi - ' . $lingshi);
        M('user')->where(array('userid'=>$uid))->save($payout1);

        $total_lingshi = M("user")->where(array('userid'=>$uid))->getField('total_lingshi');

        $this->AddTranmoney($uid,0,$lingshi,29,$total_lingshi);
    }

    //交易列表
    public function GetDealList(){
        $res = D('Deal')->GetList();
        $res?$data = ['status'=>1,'msg'=>'ok','data'=>$res]:$data = ['status'=>0,'msg'=>'暂无订单'];
        echo json_encode($data);exit;
    }

    //购买下单
    public function BuyOrderId(){
        if(IS_POST){
            $foem_type = I('formtype');
            $cid = (int)I('cid','intval',0);
            $orderinfo = D('deal')->OrderInfo($cid,$foem_type);
            // 实名认证
            $user_info = D('User')->getUserinfo($this->uid);
            if($user_info['is_real_name'] == 0 || $user_info['is_pay'] == 0){
                ajaxReturn('请先进行实名认证',0);
            }
            if(!$orderinfo){
                ajaxReturn('无该订单',0);
            }
            if($orderinfo['status']!=0){
                ajaxReturn('该订单状态有误',0);
            }
            if($orderinfo['type']==0){  //挂单人的ID
                $orderuid = $orderinfo['sell_id'];
                $tab_uid_name = 'pay_id';
            }else{
                $orderuid = $orderinfo['pay_id'];
                $tab_uid_name = 'sell_id';
            }

            if($this->uid==$orderuid){
                ajaxReturn('您不能和自己交易~',0);
            }
            
            $map['user_id'] = $this->uid;
            $map['is_default'] = 1;
            $bank = M('Ubanks')->where($map)->count();
            if($bank == 0){
                ajaxReturn('请先绑定收款方式',0);
            }
            
            //购买的加币的数量、减金积分
            if($orderinfo['type']==0){
                $userinfo = D('User')->getUserinfo($this->uid);
                $tran_fee = M('user_level')->where(array('id'=>$userinfo['vip_grade']))->getField('tran_fee');
                $tran_price = $orderinfo['num'] * $tran_fee / 100; //手续费
                $this->Is_sell($this->uid,$orderinfo['num'],$tran_price,$userinfo['total_lingshi']);
                $sell_phone = M('user')->where('userid='.$orderinfo['sell_id'])->getField('mobile');
                $this->sendsms($sell_phone,'【慈惠】您的求购信息成功，请及时查看！');
//                $zong = $tran_price + $orderinfo['num'];
//                if(D('User')->getUserinfo($this->uid)['total_lingshi']<$zong){
//                    ajaxReturn('账户余额不足~',0);
//                }
//                $datapay['total_lingshi'] = array('exp', 'total_lingshi - ' . $zong);
//                M('user')->where(array('userid'=>$this->uid))->save($datapay);
//                $now_nums = M('user')->where(array('userid'=>$this->uid))->getField('total_lingshi');
//                $this->AddTranmoney($this->uid,$orderinfo['sell_id'],$orderinfo['num'],4,$now_nums);
//                $deals['pay_type'] = implode(',',D('Ubanks')->GetStartPay($this->uid)); //增加卖出人的支付信息
            }

            //剩余数量，更新订单状态1，为匹配交易
            $deals = [
                'status' => 1,
                $tab_uid_name => $this->uid,
                'expiration_time' =>time()+1*3600
                //  'expiration_time' =>time()+60
            ];
            D('deal')->SaveDate($orderinfo['id'],$deals);
            
            //添加手续费记录
            $poundage['uid'] = $this->uid;
            $poundage['orderid'] = $cid;
            $poundage['num'] = $tran_price;
            $poundage['createtime'] = time();
            $poundage['state'] = 0;
            M('poundage')->add($poundage);

            //添加交易记录
            $buy_name = D('User')->getUserinfo($this->uid)['account'];

            $dealss["d_id"]=$cid;
            $dealss["sell_id"]=$orderinfo['sell_id'];
            $dealss["buy_id"]=$orderinfo['pay_id'];
            $dealss["create_time"]=time();
            $dealss["buy_uname"]=$buy_name;
            $dealss["cid"]=$cid;
            $dealss["type"]=1;
            $dealss["num"]=$orderinfo['num'];
            $dealss["dprice"]=$orderinfo['dprice'];
            $dealss["tprice"]=$orderinfo['tprice'];
            $deal_ss = M('deals')->add($dealss);
            if($deal_ss){
                ajaxReturn('下单成功',1);
            }else{
                ajaxReturn('下单失败',0);
            }
        }
    }

    //发送短信
    public function sendsms($phone,$content){
        $url = 'http://api.sms.cn/sms/?ac=send&uid=cihui2020&pwd=f6bc9df16305564cc681eebcd4f1ab29&mobile='.$phone.'&content='.$content;
        file_get_contents($url);
    }

    public function GetMyOrderAll(){
        //查出确认打款超时的订单
        $uid = $this->uid;
        $map['sell_id|pay_id'] = $uid;
        $map['status'] = 1;
        $map['expiration_time'] = array('lt',time());
        $res = M('deal')->where($map)->select();
        // ajaxReturn($res);die;

        //更改订单更改状态 退回货币 
        foreach ($res as $k => $v) {
            # code...
            $num = $v['num'];
            $id = $v['id'];
            $pay_id = $v['pay_id'];
            
            M('poundage')->where("orderid = $id")->setField('state',1);
            
            //根据经验值判断用户等级
            $exp = M('store')->where("uid = $pay_id")->getField('exp');
            $viplist = M('user_level')->where("state = 1")->select();
            foreach ($viplist as $key => $value) {
                $push_num = $value['push_num'];
                if($exp>=$push_num){
                    $tran_fee = $value['tran_fee'];
                }
            }
            $num = $num+$num*$tran_fee/100;
            M()->startTrans();
            // $user_arr['djie_num'] = array('exp','djie_num - '.$deal['tprice']);
            $user_arr['total_lingshi'] = array('exp','total_lingshi + '.$num);
            $res = M('user')->where(array('userid'=>$pay_id))->save($user_arr);

            $total_lingshi = M('user')->where(array('userid'=>$pay_id))->getField('total_lingshi');
            $tm['pay_id'] = 0;
            $tm['get_id'] = $pay_id;
            $tm['get_nums'] = $num;
            $tm['get_time'] = time();
            $tm['get_type'] = 45;
            $tm['now_nums'] = $total_lingshi;
            M('tranmoney')->add($tm);

            // 订单修改为已取消
            $res3 = M('deal')->where(array('id'=>$id))->setField(['status'=>5]);
            if($res && $res3){
                M()->commit();
            }else{
                M()->rollback();
            }
        }
        
        echo json_encode(D('Deal')->GetMyOrderAll($this->uid));exit;
    }

    //获取订单详情
    public function GetOrderInfo(){
        $cid = I('cid');
        $formtype = I('formtype');
        $info = D('Deal')->OrderInfo($cid,$formtype);

        if(!$info){
            ajaxReturn('无该订单',0);
        }
        $sell_info = D('User')->getUserinfo($info['pay_id']);//买家信息
        

        $info['is_me_sell'] = 1;
        if($this->uid != $info['sell_id']){
            $sell_info = D('User')->getUserinfo($info['sell_id']);//卖家信息
            unset($info['is_me_sell']);
        }
        
        $info['mj_username'] = $sell_info['nickname'];
        $info['mj_mobile'] = $sell_info['mobile'];
        $pay_type = explode(',',$info['pay_type']);
        $ubank_info = [];

        if($info['type']==0){
            $get_money_uid = $info['pay_id'];
        }elseif($info['type']==1){
            $get_money_uid = $info['sell_id'];
        }

        // if($this->uid == $info['sell_id']){
        //     $get_money_uid = $info['pay_id'];  //买家id
        // }elseif($this->uid != $info['sell_id']){
        //     $get_money_uid = $info['sell_id'];   //卖家id
        // }
      
        $ubank_info = D('Ubanks')->GetBankInfo($get_money_uid);
       
        //倒计时
        if($info['expiration_time']){
            $remain_time = $info['expiration_time']-time(); //剩余的秒数
            $info['hour'] = floor($remain_time/(60*60)); //剩余的小时
            $info['minute'] = floor(($remain_time - $info['hour']*60*60)/60); //剩余的分钟数
            $info['second'] = ($remain_time - $info['hour'] * 60 * 60 -  $info['minute'] * 60); //剩余的秒数
        }
        $info['sell_id']==$this->uid? $info['is_my_order']=1:$info['is_my_order'] = 0;
        unset($info['sell_id']);
        unset($info['pay_id']);
        $info['pay_info'] = $ubank_info;
        ajaxReturn('ok',1,'/',$info);
    }

    //提交打款
    public function ConfirmPayment(){

        if(IS_POST){
            
            //验证安全密码
            $uid = $this->uid;
            $anquan = trim(I('anquan'));
            $salt = M('user')->where("userid = $uid")->getField('safety_salt');
            $safety_pwd = M('user')->where("userid = $uid")->getField('safety_pwd');
            $anquan = D('Home/user')->pwdMd5($anquan,$salt);
            if($anquan!=$safety_pwd){
                ajaxReturn('安全密码错误',0);
            }
            
            $trid = trim(I('cid'));
            $formtype = I('formtype');
            $deal_info = D('Deal')->OrderInfo($trid,$formtype);
            if(!$deal_info){
                ajaxReturn('没有该订单',0);
            }
            if($deal_info['status']!=1){
                ajaxReturn('该订单状态错误',0);
            }
            if(time() >= $deal_info['expiration_time']){
                ajaxReturn('时间过期请重新购买',0);
            }
            $datas = [
                'status' => 2,
                'expiration_time' => time()+2*3600
            ];
            $res = D('Deal')->SaveDate($trid,$datas);
            if($res){
                $sell_phone = M('user')->where('userid='.$deal_info['pay_id'])->getField('mobile');
                $this->sendsms($sell_phone,'【慈惠】您的出售信息成功，请及时查看！');
                ajaxReturn('打款提交成功',1);
            }else{
                ajaxReturn('打款提交失败',0);
            }

        }
    }

    /**
     * @return 确认收款
     */
    public function ConfirmCollection(){
       if(IS_POST){
           
           //验证安全密码
            $uid = $this->uid;
            $anquan = trim(I('anquan'));
            $salt = M('user')->where("userid = $uid")->getField('safety_salt');
            $safety_pwd = M('user')->where("userid = $uid")->getField('safety_pwd');
            $anquan = D('Home/user')->pwdMd5($anquan,$salt);
            if($anquan!=$safety_pwd){
                ajaxReturn('安全密码错误',0);
            }
           
           $trid = trim(I('cid'));
           $formtype = I('formtype');
           $deal_info = D('Deal')->OrderInfo($trid,$formtype);
           if(!$deal_info){
               ajaxReturn('没有该订单',0);
           }
           if($deal_info['status']!=2){
               ajaxReturn('该订单状态错误',0);
           }

        //   if(time() >= $deal_info['expiration_time']){
        //       ajaxReturn('时间过期请重新购买',0);
        //   }

           $datas = [
               'status' => 3,
               'end_time' => time()
           ];
           
           $poundage_id = M('poundage')->where("orderid = $trid")->order('id desc')->getField('id');
           M('poundage')->where("id = $poundage_id")->setField('state',2);

           M('Deal')->where(array('id'=>$trid))->save($datas);
           D('Deal')->SaveDate($trid,$datas);
           $userinfo = D('User')->getUserinfo($deal_info['sell_id']);
           $res = M('User')->where(array('userid'=>$deal_info['sell_id']))->setInc('total_lingshi', $deal_info['num']);
           if($res){
               $this->AddTranmoney(0,$deal_info['sell_id'],$deal_info['num'],32,$userinfo['total_lingshi']);//添加记录
               ajaxReturn('提交成功',1);
           }else{
               ajaxReturn('提交失败');
           }

       }
    }

    //订单取消
    public function CancelOrder(){
        if(IS_POST){
            $trid = trim(I('cid'));
            $formtype = I('formtype');
            $deal_info = D('Deal')->OrderInfo($trid,$formtype);
            if(!$deal_info){
                ajaxReturn('没有该订单',0);
            }
            if($deal_info['status']!=2 && $deal_info['status']!=1){
               ajaxReturn('该订单状态错误',0);
            }
            if($deal_info['type'] == 1){
                $datas['sell_id'] = 0;
            }elseif($deal_info['type'] == 0){

                $num = $deal_info['num'];
                
                //根据经验值判断用户等级
                $pay_id = $deal_info['pay_id'];
                $exp = M('store')->where("uid = $pay_id")->getField('exp');
                $viplist = M('user_level')->where("state = 1")->select();
                foreach ($viplist as $key => $value) {
                    $push_num = $value['push_num'];
                    if($exp>=$push_num){
                        $tran_fee = $value['tran_fee'];
                    }
                }
                $num = $num+$num*$tran_fee/100;
                
                $user_arr['total_lingshi'] = array('exp','total_lingshi + '.$num);

                M('user')->where(array('userid'=>$deal_info['pay_id']))->save($user_arr);//返回金额

                $total_lingshi = M('user')->where(array('userid'=>$deal_info['pay_id']))->getField('total_lingshi');
                $this->AddTranmoney(0,$deal_info['pay_id'],$num,45,$total_lingshi);//添加记录
                $datas['pay_id'] = 0;
            }
            $datas = [
                'status' => 0,
                'expiration_time' => 0
            ];

            $res = D('Deal')->SaveDate($trid,$datas);
            
            M('poundage')->where("orderid = $trid")->setField('state',1);

            if($res){
                ajaxReturn('取消订单成功',1);
            }else{
                ajaxReturn('取消订单失败',0);
            }
        }
    }

    // 确认收款申述
    public function ConfirmRepresen(){
        $trid = trim(I('cid'));
        $formtype = I('formtype');
        $deal_info = D('Deal')->OrderInfo($trid,$formtype);
        if(!$deal_info){
            ajaxReturn('没有该订单',0);
        }
        if($deal_info['status']!=2){
            ajaxReturn('该订单状态错误',0);
        }
        $data = [
            'uid' => $this->uid,
            'deal_id' =>$deal_info['id'],
            'status' => 0
        ];
        $res = M('user_compla')->add($data);

        if($res){
            D('Deal')->SaveDate($trid,['status'=>6]);
            ajaxReturn('申诉成功，等待后台审阅',1);
        }else{
            ajaxReturn('申诉失败，请重新尝试',0);
        }

    }

    //添加记录
    public function AddTranmoney($pay_id,$get_id,$get_nums,$get_type,$now_nums){
        $changenums = [
            'pay_id' => $pay_id,
            'get_id' => $get_id,
            'get_nums'=> $get_nums,
            'get_time'=>time(),
            'get_type'=> $get_type,
            'now_nums'=>$now_nums
        ];
        M('tranmoney')->add($changenums);
    }
   //取消发布的订单
    public function quxiao($id){
        $status = M('deal')->where("id = $id")->getField('status');
        if($status == 0){
            $res = M('deal')->where("id = $id")->setField('status',5);
            if($res!==false){
                ajaxReturn('取消成功',1);
            }else{
                ajaxReturn('取消失败',0);
            }
        }
    }
}