<?php
/**
 *  Created by .
 *  User: 七年
 *  Date: 2020-05-22
 *  Time: 15:10
 *  Motto: 无私奉献不是天方夜谭，有时候，我们也可以做到。
 */

namespace Api\Model;


use Think\Model;

class CommentModel extends Model
{
    protected $tableName = 'comment';

    public function GetListByVideoId($id){
        $res = $this->where(array('video_id'=>$id))->order('id desc')->select();
        if($res){
            foreach ($res as $k=>$v){
                $res[$k]['create_time'] = mdate($v['create_time']);
                $res[$k]['uid'] = M('user')->where('userid='.$v['uid'])->field('headimg,nickname,userid')->find();
                $res[$k]['toid'] = M('user')->where('userid='.$v['toid'])->field('headimg,nickname,userid')->find();
//                $second = $this->where(array('pid'=>$v['id']))->select();
//                foreach ($second as $ks=>$vs){
//                    $second[$ks]['create_time'] = mdate($vs['create_time']);
//                    $second[$ks]['toid'] = M('user')->where('userid='.$vs['toid'])->field('headimg,nickname,userid')->find();
//                    $second[$ks]['uid'] = M('user')->where('userid='.$vs['uid'])->field('headimg,nickname,userid')->find();
//                }
//                if($second){
//                    $res[$k]['second'] = $second;
//                }
            }
        }
        return $res;
    }

    public function SendComment($data){
        return $this->add($data);
    }
}