<?php
/**
 *  Created by .
 *  User: 七年
 *  Date: 2020-05-28
 *  Time: 9:56
 *  Motto: 无私奉献不是天方夜谭，有时候，我们也可以做到。
 */

namespace Admin\Controller;
include_once './Public/aliyunsdk/aliyun-php-sdk-core/Config.php';
use vod\Request\V20170321 as vod;

class VideoController extends AdminController
{   
    //视频分类修改
    public function video_category_edit($id){
        if(IS_POST){
            $name = I('name');
            M('video_category')->where("id = $id")->setField('name',$name);
            $this->success('修改成功',U('video/video_category'));
        }else{
            $this->assi8gn('id',$id);
            $this->display();
        }
    }
    //视频分类添加
    public function video_category_add(){
        if(IS_POST){
            $data['name'] = I('name');
            $data['state'] = 1;
            M('video_category')->add($data);
            $this->success('添加成功',U('video_category'));
        }else{
            $this->display();
        }
    }
    //视频分类
    public function video_category(){
        $list = M('video_category')->select();
        $this->assign('list',$list);
        $this->display();
    }
    public function user_video(){
        $User = M('video'); // 实例化User对象
        $count      = $User->count();// 查询满足要求的总记录数
        $Page       = new \Think\Page($count,25);// 实例化分页类 传入总记录数和每页显示的记录数(25)
        $show       = $Page->show();// 分页显示输出// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
        $list = $User->limit($Page->firstRow.','.$Page->listRows)->order('video_id desc')->select();
        foreach ($list as $k=>$v){
            $userinfo = M('user')->where('userid='.$v['user_id'])->field('username,mobile,account')->find();
            $list[$k]['username'] = $userinfo['username'];
            $list[$k]['mobile'] = $userinfo['mobile'];
            $list[$k]['account'] = $userinfo['account'];
        }
        $this->assign('list',$list);// 赋值数据集
        $this->assign('table_data_page',$show);// 赋值分页输出
        $this->display();
    }

    public function info(){
        $id = I('id');
        $info = M('video')->alias('v')->where(array('video_id'=>$id))->find();
        if($info['categoty_id']!=0){
        $info = M('video')->alias('v')->where(array('video_id'=>$id))->join('ysk_video_category c ON v.category_id = c.id')->find();
        }
        if($info['aliyun_video_id']){
            $aliyunvod = A('Api/Upload')->getVideodata($info['aliyun_video_id']);
            $info['cover_url'] = $aliyunvod['VideoBase']['CoverURL'];
            $info['video_url'] = $aliyunvod['PlayInfoList']['PlayInfo'][0]['PlayURL'];
        }
        $this->assign('info',$info);
        $this->display();
    }

    //审核通过或取消
    public function setStatus()
    {
       $data = I('post.');
       if($data['status']==1){
           if(!empty($data['aliyun_video_id'])){
               $datas['cover_url']=$data['cover_url'];
           }
           $datas['show'] = 1;
       }
       $datas['status'] = $data['status'];
       $datas['is_tuijian'] = $data['is_tuijian'];
       if(M('video')->where(array('video_id'=>$data['video_id']))->save($datas)){
            $this->success('审核完成',U('user_video'));
       }else{
           $this->error('审核失败');
       }
    }

    //新增
    public function addData(){
        if(!M('user')->where('userid='.I('user_id'))->find()){
            ajaxReturn('暂无该用户',0);
        }
        $regionId = 'cn-shanghai';
        $profile = \DefaultProfile::getProfile($regionId, "LTAI4G8iytjvt28HPyNzuM7j", "Q3JBBrMZd6rwtz6VaFfiMkU3t17qHa");
        $client = new \DefaultAcsClient($profile);
        $request = new vod\CreateUploadVideoRequest();
        $request->setTitle($_POST['title']);
        $request->setFileName($_POST['name']);
        $request->setFileSize(0);
        $request->setDescription($_POST['desc']);
        $request->setCoverURL("");
        $request->setIP("127.0.0.1");
        $request->setTags("");
        $request->setCateId(0);
        $response = $client->getAcsResponse($request);

        $data['UploadAuth']=$response->UploadAuth;
        $data['UploadAddress']=$response->UploadAddress;
        $data['VideoId']=$response->VideoId;
        $data['RequestId']=$response->RequestId;

        $res = A('Api/Upload')->getVideodata($response->VideoId);
        $lnglat = explode(',',I('lnglat'));
        $addinfo = [
            'user_id'=> I('user_id'),
            'city'=>I('city'),
            'lng' =>$lnglat[0],
            'lat' =>$lnglat[1],
            'create_time'=>time(),
            'status'=>1,
            'show'=>1,
            'is_tuijian'=>I('is_tuijian'),
            'aliyun_video_id'=>$res['VideoBase']['VideoId'],
            'video_url'=>$res['PlayInfoList']['PlayInfo'][0]['PlayURL'],
            'video_title'=>I('title'),
            'video_describe'=>I('desc'),
            'category_id'=>I('category_id')
        ];
        if(M('video')->add($addinfo)){
            $this->ajaxReturn($data);
        }
    }

    //删除
    public function del($id){
        if(M('video')->delete($id)){
            $this->success('删除成功');
        }else{
            $this->error('删除失败');
        }
    }

    //新增视频
    public function add(){
        $category = M('video_category')->select();
        $this->assign('category',$category);
        $this->display();
    }
}