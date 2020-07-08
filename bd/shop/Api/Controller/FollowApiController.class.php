<?php
/**
 *  Created by .
 *  User: 七年
 *  Date: 2020-05-12
 *  Time: 14:35
 *  Motto: 无私奉献不是天方夜谭，有时候，我们也可以做到。
 */

namespace Api\Controller;


class FollowApiController extends CommonApiController
{
    private  $uid;

    public function __construct(){
        $openid = I('openid');
        if(!GetUserId($openid)){
            ajaxReturn('未找到该用户',0);
        }

        $this->uid = GetUserId($openid);

    }

    public function addFollow(){

        $toid = I('toid');
        if($toid==$this->uid){
            echo json_encode(['status'=>0,'msg'=>'不能关注本人']);exit;
        }
        redis()->sAdd("user:{$this->uid}:follow",$toid);
        redis()->sAdd("user:{$toid}:fans",$this->uid);

        $is_he_fans = redis()->sismember("user:{$toid}:follow", $this->uid);

        echo json_encode(['status'=>1,'msg'=>'关注成功','data'=>$is_he_fans]);exit;
    }

    public function DelFollow(){
        $toid = I('toid');
        redis()->srem("user:{$this->uid}:follow", $toid);
        redis()->srem("user:{$toid}:fans", $this->uid);

        echo json_encode(['status'=>1,'msg'=>'取消关注']);exit;
    }
    //我的关注数量和我的粉丝数
    public function getMyFollow_Fans(){
        $uid = $this->getUid(I('openid'));
        $follow_count = redis()->scard("user:{$uid}:follow");
        $fans_count =  redis()->scard("user:{$uid}:fans");
        $pidisme = M('user')->where(array('pid'=>$uid))->count()+1;
        ajaxReturn('ok',1,'/',['follow_count'=>$follow_count,'fans_count'=>$fans_count,'pidisme'=>$pidisme]);
    }

    public function GetMyFansList(){
        $fans = redis()->sMembers("user:{$this->uid}:fans");
        if($fans){
            $userlist = [];
            foreach ($fans as $v){
                $userinfo = D('User')->getUserinfo($v);
                $net_info = [
                    'nickname'=>$userinfo['nickname'],
                    'headimg' =>$userinfo['headimg'],
                    'sex'=>$userinfo['sex'],
                    'is_my_follow'=>redis()->sismember("user:{$this->uid}:follow", $v),
                    'uid'=>$userinfo['userid']
                ];
                $userlist[] = $net_info;
            }
            echo json_encode(['status'=>1,'data'=>$userlist]);exit;
        }else{
            echo json_encode(['status'=>0]);exit;
        }
    }

    public function GetMyFollowList(){
        $follow = redis()->sMembers("user:{$this->uid}:follow");
        if($follow){
            $userlist = [];
            foreach ($follow as $v){
                $userinfo = D('User')->getUserinfo($v);
                $net_info = [
                    'nickname'=>$userinfo['nickname'],
                    'headimg' =>$userinfo['headimg'],
                    'sex'=>$userinfo['sex'],
                    'is_he_fans'=>redis()->sismember("user:{$v}:follow", $this->uid),
                    'uid'=>$userinfo['userid']
                ];
                $userlist[] = $net_info;
            }
            echo json_encode(['status'=>1,'data'=>$userlist]);exit;
        }else{
            echo json_encode(['status'=>0]);exit;
        }
    }

    public function GetMyFriendsList(){
        $userinfo = D('User')->getUserinfo($this->uid);
        $pid =  D('User')->getUserinfo($userinfo['pid']);
        $pidarr = array(
            array(
                'userid'=> $pid['userid'],
                'nickname'=>$pid['nickname'],
                'headimg' =>$pid['headimg']
            )
        );

        $steam = array_merge($pidarr,D('User')->PidIsMe($userinfo['userid']));

        if($steam){
            foreach ($steam as $k=>$v){
                $steam[$k]['is_my_fans'] = redis()->sismember("user:{$v['userid']}:follow", $this->uid);
                $steam[$k]['is_my_follow'] = redis()->sismember("user:{$this->uid}:follow", $v['userid']);
            }
        }

        ajaxReturn('ok',1,'/',$steam);

    }
}