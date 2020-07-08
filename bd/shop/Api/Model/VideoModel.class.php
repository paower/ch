<?php
/**
 *  Created by .
 *  User: 七年
 *  Date: 2020-05-16
 *  Time: 10:12
 *  Motto: 无私奉献不是天方夜谭，有时候，我们也可以做到。
 */

namespace Api\Model;


use Think\Model;

class VideoModel extends Model
{
    protected $tableName = 'video';

    public function GetVideoId($id){
        $res = $this->where(array('video_id'=>$id))->find();
        if($res['aliyun_video_id']){
            $aliyunvod = A('Upload')->getVideodata($res['aliyun_video_id']);
            $res['cover_url'] = $aliyunvod['VideoBase']['CoverURL'];
            $res['video_url'] = $aliyunvod['PlayInfoList']['PlayInfo'][0]['PlayURL'];
        }
        return $res;
    }

    public function GetVideoList($uid,$city,$tuijian,$page){
        $map['status'] = 1;
        $map['show'] = 1;
        if(!empty($city)) $map['category_id'] = $city;
        if(!empty($tuijian)) $map['is_tuijian'] = 1;
        $res =  $this->where($map)->limit(2*$page,2)->order('video_id desc')->field('aliyun_video_id,video_id,video_url,user_id,video_describe,cover_url,create_time')->select();
        if ($res){
            foreach ($res as $k=>$v){
                $userinfo =  D('User')->getUserinfo($v['user_id']);
                $res[$k]['user'] = ['user_id'=>$userinfo['userid'],'nick_name'=>$userinfo['nickname'],'headimg'=>$userinfo['headimg'],'is_my_follow'=>redis()->sismember("user:{$uid}:follow", $userinfo['userid'])];
                $res[$k]['like'] = redis()->get("video_love:{$v['video_id']}");
                $res[$k]['check'] = redis()->zScore("user:{$uid}:love",$v['video_id']);
                $res[$k]['comment'] = M('comment')->where('video_id='.$v['video_id'])->count();
                if($v['aliyun_video_id']){
                    $aliyunvod = A('Upload')->getVideodata($v['aliyun_video_id']);
                    $res[$k]['cover_url'] = $aliyunvod['VideoBase']['CoverURL'];
                    $res[$k]['video_url'] = $aliyunvod['PlayInfoList']['PlayInfo'][0]['PlayURL'];
                }
            }
        }
        return $res;
    }

    public function GetMyVideo($uid){
        $res =  $this->where(array('user_id'=>$uid))->order('video_id desc')->select();
        if($res){
            foreach ($res as $k=>$v){
                if($v['aliyun_video_id']){
                    $aliyunvod = A('Upload')->getVideodata($v['aliyun_video_id']);
                    $res[$k]['cover_url'] = $aliyunvod['VideoBase']['CoverURL'];
                    $res[$k]['video_url'] = $aliyunvod['PlayInfoList']['PlayInfo'][0]['PlayURL'];
                }
            }
        }
        return $res;
    }

    public function GetMyLike($uid){
        return redis()->zReverseRange("user:{$uid}:love",0, -1, true);
    }
}