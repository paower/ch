<?php
/**
 *  Created by .
 *  User: 七年
 *  Date: 2020-05-12
 *  Time: 10:34
 *  Motto: 无私奉献不是天方夜谭，有时候，我们也可以做到。
 */

namespace Api\Controller;
use Think\Controller;

class CommonApiController extends Controller
{

    public function _initialize(){
        $this->getlevel();
        $this->getuser_star();
    }

    public function getlevel(){
        $uid = GetUserId(I('openid'));
        if(!$uid) return;
        $user_level_arr = M('user_level')->field('id,push_num')->select();
        $user_exp = M('store')->where('uid='.$uid)->getField('exp');
        $user_level_is = 0;
        foreach ($user_level_arr as $ks => $vs) {
            $nex_k = $ks+1;
            if($user_exp>=$vs['push_num'] && $user_exp<$user_level_arr[$nex_k]['push_num']){
                $user_level_is = $vs['id'];
            }
        }
        M('user')->where('userid='.$uid)->save(['vip_grade'=>$user_level_is]);
    }
    public function get_total_team_active(){
        $uid = GetUserId(I('openid'));
        if(!$uid) return;
        $user_active = M('user')->where('userid='.$uid)->getField('total_active');
        $team_list = $this->getTeamChild($uid,$data);
        // dump($team_list);die;
        foreach($team_list as $val){
            $team_active += M('user')->where(array('userid'=>$val['userid']))->getField('total_active');

            if($val['user_star_id']>=$push_data['push_id']){
                $user_push_num++;
            }
        }
        $total_team_active = $team_active+$user_active;
        ajaxReturn($total_team_active);
    }
    public function getuser_star(){
        $uid = GetUserId(I('openid'));
        if(!$uid) return;
        $user_star_id = M('user')->where('userid='.$uid)->field('user_star_id')->find();
        $where['id'] = array('gt',$user_star_id['user_star_id']);
        $gt_user_star_id = M('user_star')->where($where)->limit(1)->getField('id');
        // echo $gt_user_star_id;

        //团队总活跃度
        $data = M('user')->where(array('status'=>1))->field('userid,pid')->select();
        $user_active = M('user')->where('userid='.$uid)->getField('total_active');
        $team_list = $this->getTeamChild($uid,$data);
        $team_active = 0;
        $user_push_num=0;
        $push_data = M('user_star')->where(array('id'=>$gt_user_star_id))->field('push_id,push_num,team_active,id,scroll_id,scroll_num')->find();
        foreach($team_list as $val){
            $team_active += M('user')->where(array('userid'=>$val['userid']))->getField('total_active');

            if($val['user_star_id']>=$push_data['push_id']){
                $user_push_num++;
            }
        }
        $total_team_active = $team_active+$user_active;
        // var_dump($user_push_num);die();
        if($user_push_num>=$push_data['push_num'] && $total_team_active>=$push_data['team_active']){
            M('user')->where(array('userid'=>$uid))->save(['user_star_id'=>$push_data['id']]);

        }
        $user_star_id_new = M('user')->where('userid='.$uid)->getField('user_star_id');
        if($user_star_id['user_star_id']<$user_star_id_new){
            //赠送铭文
            $scroll = M('scroll')->where(array('id'=>$push_data['scroll_id']))->find();

            $uscroll['uid'] = $uid;
            $uscroll['scroll_id'] = $scroll['id'];
            $uscroll['overtime'] = time() + $scroll['max_day'] * 86400;
            $uscroll['status'] = 1;
            $uscroll['scroll_num'] = $push_data['scroll_num'];
            
            $uscroll['max_day'] = $scroll['max_day'];
            $uscroll['sell_num'] = $scroll['sell_num'];
            $uscroll['single_num'] = $scroll['single_num'];

            M('user_scroll')->add($uscroll);


        }
    }

    public function getTeamChild($pid,$data){
        $data = M('user')->where(array('status'=>1))->field('userid,pid,user_star_id')->select();
        return $this->getTreeChild($data,$pid,true);
    }

    private function getTreeChild($data,$pid,$flag,$ceng=0){

        static $list = array();
        if($flag){
            $list = array();
        }
        foreach($data as $k => $v){
            if($v['pid'] == $pid && $ceng<6){
                $list[] = $v;
                $this->getTreeChild($data,$v['userid'],false,$ceng+1);
            }
        }
        return $list;

    }

    public function getUid($openid){

        if(!GetUserId($openid)){
            ajaxReturn('未找到该用户',0);
        }
        return GetUserId($openid);
    }

    public function regeo($lon,$lat){

        if(empty($lon)){
            $data = ['status'=>0,'msg'=>'定位获取失败'];
            $this->ajaxReturn($data);
        }
        if(empty($lat)){
            $data = ['status'=>0,'msg'=>'定位获取失败'];
            $this->ajaxReturn($data);
        }
        $key = '62c66d22976d356c9109f38f6672a2eb';
        $location = $lon . "," . $lat;
        $url = "https://restapi.amap.com/v3/geocode/regeo?output=JSON&location={$location}&key={$key}&radius=1000&extensions=base";
        // 执行请求
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_URL, $url);
        $data = curl_exec($ch);
        curl_close($ch);
        $data = str_replace('市','',$data);
        return $data;
    }
}