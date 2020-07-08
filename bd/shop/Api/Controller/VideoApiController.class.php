<?php
/**
 *  Created by .
 *  User: 七年
 *  Date: 2020-05-16
 *  Time: 10:10
 *  Motto: 无私奉献不是天方夜谭，有时候，我们也可以做到。
 */

namespace Api\Controller;


class VideoApiController extends CommonApiController
{

    private  $uid;
    public function uid(){
        $openid = I('openid');
        if(!GetUserId($openid)){
            ajaxReturn('未找到该用户',0);
        }
        $this->uid = GetUserId($openid);
    }

    public function getCategoryVideo($category_id){
        if(!empty($category_id)){
            $res = M('video')->where("category_id = $category_id")->select();
        }else{
            $res = M('video')->select();
        }
        if($res){
            foreach ($res as $k=>$v){
                if($v['aliyun_video_id']){
                    $aliyunvod = A('Upload')->getVideodata($v['aliyun_video_id']);
                    $res[$k]['cover_url'] = $aliyunvod['VideoBase']['CoverURL'];
                    $res[$k]['video_url'] = $aliyunvod['PlayInfoList']['PlayInfo'][0]['PlayURL'];
                }
            }
        }
        echo json_encode($res);
    }

    public function getCategory(){
        $res = M('video_category')->select();
        echo json_encode($res);
    }

    public function getVideoById(){
        $id = I('id');
        $uid = GetUserId(I('openid'));
        $res = D('Video')->GetVideoId($id);
        if($res['status']!=1){
            ajaxReturn('视频不见了',0);
        }
        $userinfo =  D('User')->getUserinfo($res['user_id']);
        $res['user'] = ['user_id'=>$userinfo['userid'],'nick_name'=>$userinfo['nickname'],'headimg'=>$userinfo['headimg'],'is_my_follow'=>redis()->sismember("user:{$uid}:follow", $userinfo['userid'])];
        $res['like'] = redis()->get("video_love:{$res['video_id']}");
        $res['check'] = redis()->zScore("user:{$uid}:love",$res['video_id']);
        $res['comment'] = M('comment')->where('video_id='.$res['video_id'])->count();
        $arr = array($res);
//        $arr = ;
        ajaxReturn('ok',1,'/',$arr);
    }
    public function GetVideoList(){
         $uid = GetUserId(I('openid'));
         $city = array('like','%'.I('city').'%');
         $tuijian = I('is_tuijian');
         $page = I('page');
         $res = D('Video')->GetVideoList($uid,$city,$tuijian,$page);
         if($res){

             ajaxReturn('ok',1,'/',$res);
         }else{
             ajaxReturn('error',0);
         }
    }

    public function AddVideo(){
        $url = 'https://api.apiopen.top/getJoke?type=all&page=3&count=20';
        $data = json_decode(file_get_contents($url),true);
        $user = [8803,8936,8937];
        $city = ['广州','深圳','梅州','惠州'];
       foreach ($data['result'] as $k=>$v){
           if($v['type']=='video'){
               $datas = [
                   'video_url'=>$v['video'],
                   'user_id' =>$user[rand(0,2)],
                   'video_title'=>$v['text'],
                   'video_describe'=>$v['text'],
                   'cover_url'=>$v['thumbnail'],
                   'create_time'=>time(),
                   'city'=>$city[rand(0,3)],
                   'is_tuijian'=>rand(0,1)
               ];
               M('video')->add($datas);
           }


       }
    }

    //我的作品
    public function GetMyVideo(){
        $this->uid();
        echo json_encode(D('Video')->GetMyVideo($this->uid));
    }
    //我的收藏
    public function GetMyLike(){
        $this->uid();
        $res = D('Video')->GetMyLike($this->uid);
        $list = [];
        if($res){
            foreach ($res as $k=>$v){
                $list[] = D('Video')->GetVideoId($k);
            }
        }
        echo json_encode($list);
    }

    //    添加收藏
    public function AddToLove(){
        if(IS_POST){
            $this->uid();
            $video_id = I('video_id');
            $check = I('check');

            if(!D('Video')->GetVideoId($video_id)){
                ajaxReturn('暂无该视频',0);
            }

            if($check=='true'){

                if(redis()->zAdd("user:{$this->uid}:love",time(),$video_id)){
                    redis()->incr("video_love:{$video_id}",1);

                    $uid = D('Video')->GetVideoId($video_id)['user_id'];
                    if($uid!=$this->uid){
                        $notice = [
                            'uid'=>$uid,
                            'formid'=>$this->uid,
                            'video_id'=>$video_id,
                            'time'=>time(),
                            'type'=>2
                        ];
                        M('notice_message')->add($notice);
                    }
                };
            }else{
                if(redis()->zrem("user:{$this->uid}:love",$video_id)){
                    redis()->decr("video_love:{$video_id}",1);
                }
            }

            $res = redis()->get("video_love:{$video_id}");
            if($res){
                echo $res;
            }else{
                echo 0;
            }
        }
    }

    //获取用户信息
    public function GetUserInfoId(){
        $toid = I('userid');
        $this->uid = GetUserId(I('openid'));
        if(!$toid) ajaxReturn('数据出错',0);
        $to_info = D('User')->getUserinfo($toid);
        if($to_info){

            $user_like = D('Video')->GetMyLike($toid);
            $list = [];
            if($user_like){
                foreach ($user_like as $k=>$v){
                    $list[] = D('Video')->GetVideoId($k);
                }
            }
            $user = [
                'userid'=>$to_info['userid'],
                'username'=>$to_info['username'],
                'nickname'=>$to_info['nickname'],
                'gxqm'=>$to_info['gxqm'],
                'headimg'=>$to_info['headimg'],
                'is_my_follow'=>redis()->sismember("user:{$this->uid}:follow", $toid),
                'he_friends'=>count(D('User')->PidIsMe($toid)),
                'he_follow_count'=>redis()->scard("user:{$toid}:follow"),
                'he_fans_count'=>redis()->scard("user:{$toid}:fans"),
                'video_list'=>D('Video')->GetMyVideo($toid),
                'he_like'=>redis()->zCard("user:{$toid}:love"),
                'he_video_count'=>count(D('Video')->GetMyVideo($toid)),
                'he_like_list' => $list
            ];
            ajaxReturn('ok',1,'/',$user);
        }else{
            ajaxReturn('获取数据失败',0);
        }
    }
    //搜索关键词
    public function SearchKeyWord(){
        $keyword = I('keyword');
        if(strlen($keyword)<1) ajaxReturn('请输入关键词',0);
        $map['username'] = array('like','%'.$keyword.'%');
        $usernamearr = M('user')->where($map)->field('username')->select();
//        foreach ($usernamearr as $v){
//            $arr[] = $v['username'];
//        }
        echo json_encode($usernamearr);
    }
    //搜索好友
    public function Searchinfo(){
        if(IS_POST){
            $uid = GetUserId(I('openid'));
            $username = I('username');
            $info = M('user')->where(array('username'=>$username))->field('account,headimg,nickname,userid,gxqm,username')->find();
            if($info){
                $info['is_my_follow'] = redis()->sismember("user:{$uid}:follow", $info['userid']);
                ajaxReturn('获取成功',1,'/',$info);
            }else{
                ajaxReturn('未找到该用户',0);
            }
        }

    }
    //@
    public function ait(){
        $nickname = I('nickname');
        $nickname=substr($nickname,1);
        if(strlen($nickname)<1) return;
        $map['nickname'] = array('like','%'.$nickname.'%');

        $usernamearr = M('user')->where($map)->field('userid,nickname,headimg')->select();

        if($usernamearr){
            ajaxReturn('获取成功',1,'/',$usernamearr);
        }else{
            ajaxReturn('未找到相关用户',0);
        }
    }
}