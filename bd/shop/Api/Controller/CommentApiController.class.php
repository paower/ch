<?php
/**
 *  Created by .
 *  User: 七年
 *  Date: 2020-05-22
 *  Time: 15:09
 *  Motto: 无私奉献不是天方夜谭，有时候，我们也可以做到。
 */

namespace Api\Controller;


class CommentApiController extends CommonApiController
{
    public function GetListByVideoId(){
        $video_id = I('video_id');
        $res = D('Comment')->GetListByVideoId($video_id);
        if($res){
            ajaxReturn('ok',1,'/',$res);
        }else{
            ajaxReturn('not',0);
        }
    }

    //添加评论
    public function SendComment(){
        if(IS_POST){
            $openid = I('openid');
            if(!GetUserId($openid)){
                ajaxReturn('未找到该用户',0);
            }
            $uid = GetUserId($openid);
            $toid = I('toid');
            $ait =array_unique(explode(',',I('ait')));
            $data = [
                'pid'=>0,
                'uid'=>$uid,
                'toid'=>$toid,
                'video_id'=>I('video_id'),
                'content'=>I('message'),
                'create_time'=>time(),
                'ait'=>implode(',',$ait)
            ];
            $res = D('Comment')->SendComment($data);
            //添加通知
            if(!empty($ait)){
                foreach ($ait as $v){
                    $notice = [
                        'uid'=>$v,
                        'formid'=>$uid,
                        'video_id'=>I('video_id'),
                        'content'=>I('message'),
                        'time'=>time(),
                        'type'=>1
                    ];
                    M('notice_message')->add($notice);
                }
            }
            if(empty($toid)){
                $toid = D('Video')->GetVideoId(I('video_id'))['user_id'];
            }
            $notice = [
                'uid'=>$toid,
                'formid'=>$uid,
                'video_id'=>I('video_id'),
                'content'=>I('message'),
                'time'=>time(),
                'type'=>3
            ];
            M('notice_message')->add($notice);

            if($res){
                $userinfo = M('user')->where('userid='.$uid)->field('nickname,headimg,userid')->find();
                $toidinfo = M('user')->where('userid='.$toid)->field('nickname,headimg,userid')->find();
                $arr = ['uid'=>$userinfo,'toid'=>$toidinfo];
                ajaxReturn('评论成功',1,'/',$arr);
            }else{
                ajaxReturn('评论失败',0);
            }
        }
    }

    /**
     *  1@；2赞；3评论
     */
    public function getNoticeList(){
        $openid = I('openid');
        if(!GetUserId($openid)){
            ajaxReturn('未找到该用户',0);
        }
        $uid = GetUserId($openid);
        $map['type'] = I('type');
        $map['uid'] = $uid;
        $list = M('notice_message')->where($map)->order('id desc')->select();
        if($list){
            foreach ($list as $k=>$v){
                $list[$k]['forminfo']=M('user')->where('userid='.$v['formid'])->field('nickname,headimg')->find();
                $list[$k]['videoinfo']=M('video')->where('video_id='.$v['video_id'])->field('cover_url,video_id')->find();
                $list[$k]['time'] = mdate($v['time']);
            }
            ajaxReturn('ok',1,'/',$list);
        }else{
            ajaxReturn('no',0);
        }
    }

    public function getWeidu(){
        $openid = I('openid');
        if(!GetUserId($openid)){
            ajaxReturn('未找到该用户',0);
        }
        $uid = GetUserId($openid);

        $ait_count = M('notice_message')->where(array('uid'=>$uid,'type'=>1,'status'=>0))->count();
        $zan_count = M('notice_message')->where(array('uid'=>$uid,'type'=>2,'status'=>0))->count();
        $message_count = M('notice_message')->where(array('uid'=>$uid,'type'=>3,'status'=>0))->count();

        echo json_encode(['status'=>1,'meg'=>'ok','ait_count'=>$ait_count,'zan_count'=>$zan_count,'message_count'=>$message_count]);exit;
    }
}