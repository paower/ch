<?php
/**
 *  Created by .
 *  User: 七年
 *  Date: 2020-05-19
 *  Time: 14:38
 *  Motto: 无私奉献不是天方夜谭，有时候，我们也可以做到。
 */

namespace Api\Controller;


class IndexApiController extends CommonApiController
{
    //获取签到广告图片
    public function get_signin_img(){
        $map['name'] = 'signin_img';
        $url1 = M('config')->where($map)->getField('value');
        $url = 'http://192.168.0.94/Uploads/'.$url1;
        ajaxReturn($url);
    }
    //获取当前星级
    public function getuserStar(){
        $uid = GetUserId(I('openid'));
        $res = M('user')->where("userid = $uid")->getField('user_star_id');
        ajaxReturn($res);
    }
    //获取星级达人列表
    public function getstarList(){
        $res = M('user_star')->where('state = 1')->select();
        foreach($res as $k => $v){
            if($v['scroll_id']){
                $res[$k]['scroll_title'] = M('scroll')->where(array('id'=>$v['scroll_id']))->getField('title');
            }else{
                $res[$k]['scroll_title'] = '无奖励';
            }
        }
        ajaxReturn($res);
    }
    //获取公众号
    public function getwxpublic(){
        $res = M('config')->where(array('name'=>'wxpublic'))->getField('value');
        ajaxReturn($res);
    }
    public function hcuser(){


        S('userinfo')?S('userinfo'):D('User')->where('userid=8936')->cache('userinfo',300)->find();
        dump(S('userinfo'));
    }

    public function GetAddress(){
        $lon = I('lon');
        $lat = I('lat');
        echo $this->regeo($lon,$lat);
    }

    //分类明细
    public function CheckList($i){
        $uid = GetUserId(I('openid'));
        switch ($i) {
            case '1':
                $map['get_id|pay_id'] = $uid;
                $map['get_type'] = array('in','26,30,35,47,100,101,29,32,25,102');
                break;
            case '2':
                $map['get_id|pay_id'] = $uid;
                $map['get_type'] = array('in','26,29,32,25,102');
                break;
            case '3':
                $map['get_id|pay_id'] = $uid;
                $map['get_type'] = array('in','30,35,47,43');
                break;
            case '4':
                $map['get_id|pay_id'] = $uid;
                $map['get_type'] = array('in','100,101');
                break;
        };
        
        if(!$uid) ajaxReturn('未找到该用户',0);
        $list = M('tranmoney')->where($map)->order('id desc')->select();
        foreach ($list as $k=>$v){
            $v['get_id']==$uid?$is_pay = 1:$is_pay=2;  //1收入 2支出
            $list[$k]['huobi'] = $this->Type($v['get_type'],$is_pay);
            $list[$k]['get_time'] = date('H:i m/d',$v['get_time']);
            $list[$k]['me'] = $uid;
            $list[$k]['get_type_text'] = $this->get_type($v['get_type'],$is_pay);
        }
        ajaxReturn('获取成功',1,'/',$list);
    }

    //明细
    public function TranmoneyList(){
        $uid = GetUserId(I('openid'));
        $map['get_id|pay_id'] = $uid;
        $map['get_type'] = array('in','26,30,35,45,47,100,101,29,32,25,102,43');
        if(!$uid) ajaxReturn('未找到该用户',0);
        $list = M('tranmoney')->where($map)->order('id desc')->select();
        foreach ($list as $k=>$v){
            $v['get_id']==$uid?$is_pay = 1:$is_pay=2;  //1收入 2支出
            $list[$k]['huobi'] = $this->Type($v['get_type'],$is_pay);
            // $list[$k]['get_time'] = date('H:i m/d',$v['get_time']);
            $list[$k]['get_time'] =$v['get_time'];
            $list[$k]['me'] = $uid;
            $list[$k]['get_type_text'] = $this->get_type($v['get_type'],$is_pay);
        }
        $where['type'] = 1;
        $where['get_type'] = 1;
        $where['uid'] = $uid;
        $where['add_type'] = array('in','0,1');
        $htlist = M('htrecharge')->where($where)->select();
        foreach ($htlist as $k => $v) {
            $ht['huobi']['name'] = '慈点';
            $ht['huobi']['xfcontent'] = '增加(点)';
            $ht['get_time'] =$v['time'];
            $ht['get_nums'] = $v['num'];
            $ht['me'] = $uid;
            $add_type = $v['add_type'];
            if($add_type == 1){
                $ht['get_type_text'] = "<text class='text-blue'>分红</text>";
            }else{
                $ht['get_type_text'] = "<text class='text-blue'>收益</text>";
            }
            $list[] = $ht;
        }

        array_multisort(array_column($list,'get_time'),SORT_DESC,$list);

        foreach ($list as $k => $v) {
            $list[$k]['get_time'] = date('H:i m/d',$v['get_time']);
        }

        ajaxReturn('获取成功',1,'/',$list);
    }
    //货币类型
    public function Type($pay_type,$is_pay){
        $mingwen = [26];
        $mingwen_restext = ['name'=>'慈场','xfcontent'=>'消耗(慈点)'];
        if(in_array($pay_type,$mingwen)) return $mingwen_restext;

        $huoyuedu = [30,35,47,43];
        $huoyuedu_restext = ['name'=>'活跃度','xfcontent'=>'增加(点)'];
        if(in_array($pay_type,$huoyuedu)) return $huoyuedu_restext;

        $exp = [100,101];
        $exp_restext = ['name'=>'经验值','xfcontent'=>'增加(点)'];
        if(in_array($pay_type,$exp)) return $exp_restext;

        $jingshi = [29,32,25,45,102];
        $is_pay==2?$is_kou='扣除(个)':$is_kou='增加(个)';
        $jingshi_restext = ['name'=>'慈点','xfcontent'=>$is_kou];
        if(in_array($pay_type,$jingshi)) return $jingshi_restext;


    }

    //获取类型
    public function get_type($get_type,$is_pay){
        $duihuan = [26,30,43];
        if(in_array($get_type,$duihuan)) return "<text class='text-blue'>兑换</text>";

        $shiming = [35,47,100,101];
        if(in_array($get_type,$shiming)) return "<text class='text-pink'>实名</text>";

        $xiadan = [29,32];
        $is_pay==2?$is_kou='出售':$is_kou='购买';
        if(in_array($get_type,$xiadan)) return "<text class='text-green'>{$is_kou}</text>";

        $shouyi = [25];
        if(in_array($get_type,$shouyi)) return "<text class='text-red'>收益</text>";

        $fenhong = [102];
        if(in_array($get_type,$fenhong)) return "<text class='text-red'>推荐奖</text>";
        
        $tuihui = [45];
        if(in_array($get_type,$tuihui)) return "<text class='text-red'>退回</text>";
    }
}