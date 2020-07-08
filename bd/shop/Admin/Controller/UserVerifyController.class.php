<?php

namespace Admin\Controller;

/**
 * 实名认证
 * @author 
 */
class UserVerifyController extends AdminController
{
    /**
     * 实名认证列表
     * @author 
     */
    public function index()
    {
        $mobile = I('keyword');
        $user_verify = M('user_verify'); // 实例化User对象
        $count      = $user_verify->count();// 查询满足要求的总记录数
        $Page       = new \Think\Page($count,15);// 实例化分页类 传入总记录数和每页显示的记录数(25)
        $show       = $Page->show();// 分页显示输出
        // 进行分页数据查询 注意limit方法的参数要使用Page类的属性
        $list = $user_verify->limit($Page->firstRow.','.$Page->listRows)->order('is_verify asc,id desc')->select();
        foreach($list as $k => $v){
            $list[$k]['username'] = M('user')->where(array('userid'=>$v['uid']))->getField('username');
            $list[$k]['account'] = M('user')->where(array('userid'=>$v['uid']))->getField('account');
            $list[$k]['mobile'] = M('user')->where(array('userid'=>$v['uid']))->getField('mobile');
        }

        //手机号搜索
        if(!empty($mobile)){
            $id = M('user')->where("mobile = $mobile")->getField('userid');
            $show = "";
            // 进行分页数据查询 注意limit方法的参数要使用Page类的属性
            $list = $user_verify->where("uid = $id")->limit($Page->firstRow.','.$Page->listRows)->order('is_verify asc,id desc')->select();
            foreach($list as $k => $v){
                $list[$k]['username'] = M('user')->where(array('userid'=>$v['uid']))->getField('username');
                $list[$k]['account'] = M('user')->where(array('userid'=>$v['uid']))->getField('account');
                $list[$k]['mobile'] = M('user')->where(array('userid'=>$v['uid']))->getField('mobile');
            }
        }

        $this->assign('show',$show);
        $this->assign('list',$list);
        $this->display();
    }

    public function allsetYesVerify(){
        $ids = I('ids');
        foreach ($ids as $k => $v) {
            $id = $v;
            M()->startTrans();
            $res = M('user_verify')->where(array('id'=>$id))->setField('is_verify',1);
            $user_info = M('user')->where(array('userid'=>$is_exis['uid']))->field('pid')->find();
            $arr['id_card'] = $is_exis['id_card'];
            $arr['truename'] = $is_exis['truename'];
            $arr['is_verify'] = 2;
            $arr['is_real_name'] = 1;
            $arr['is_pay'] = 1;
            $arr['vip_grade'] = 1;
            // $arr['user_star_id'] = 1;
            $res2 = M('user')->where(array('userid'=>$is_exis['uid']))->save($arr);
            
            //赠送矿机
            $scroll = M('scroll')->where(array('status'=>1))->order('id asc')->find();
            $uscroll['uid'] = $is_exis['uid'];
            $uscroll['scroll_id'] = $scroll['id'];
            $uscroll['overtime'] = time() + $scroll['max_day'] * 86400;
            $uscroll['status'] = 0;
            $uscroll['max_day'] = $scroll['max_day'];
            $uscroll['sell_num'] = $scroll['sell_num'];
            $uscroll['single_num'] = $scroll['single_num'];
            $res3 = M('user_scroll')->add($uscroll);

            $pid = M("user")->where(array('userid'=>$is_exis['uid']))->getField('pid');
            //直推增加经验值
            M('store')->where(array('uid'=>$pid))->setInc('exp',10);
            $yue_exp = M('store')->where(array('uid'=>$pid))->getField('exp');
            $tms['pay_id'] = 0;
            $tms['get_id'] = $pid;
            $tms['get_nums'] = 10;
            $tms['get_time'] = time();
            $tms['get_type'] = 101;
            $tms['now_nums'] = $yue_exp;
            M('tranmoney')->add($tms);

            //添加经验值记录
            M('store')->where(array('uid'=>$is_exis['uid']))->setInc('exp',10);
            $add_step = M('store')->where(array('uid'=>$is_exis['uid']))->getField('exp');
            $tm3['pay_id'] = 0;
            $tm3['get_id'] = $is_exis['uid'];
            $tm3['get_nums'] = 10;
            $tm3['get_time'] = time();
            $tm3['get_type'] = 100;
            $tm3['now_nums'] = $add_step;
            M('tranmoney')->add($tm3);
            if($res !== false && $res2 !== false){
                M()->commit();
            }else{
                M()->rollback();
            }
        }
        ajaxReturn('审核成功',1);
    }

    public function setYesVerify(){
        $id = (int)I('id');
        $is_exis = M('user_verify')->where(array('id'=>$id,'is_verify'=>0))->field('id_card,truename,uid,alipay_number,phone,pic3')->find();
        if(!$is_exis){
            $this->error('该订单状态错误，请重试');
        }
        M()->startTrans();
        $res = M('user_verify')->where(array('id'=>$id))->setField('is_verify',1);
        $user_info = M('user')->where(array('userid'=>$is_exis['uid']))->field('pid')->find();
        $arr['id_card'] = $is_exis['id_card'];
        $arr['truename'] = $is_exis['truename'];
        $arr['is_verify'] = 2;
        $arr['is_real_name'] = 1;
        $arr['is_pay'] = 1;
        $arr['vip_grade'] = 1;
        // $arr['user_star_id'] = 1;
        $res2 = M('user')->where(array('userid'=>$is_exis['uid']))->save($arr);
        
        //赠送矿机
        $scroll = M('scroll')->where(array('status'=>1))->order('id asc')->find();
        $uscroll['uid'] = $is_exis['uid'];
        $uscroll['scroll_id'] = $scroll['id'];
        $uscroll['overtime'] = time() + $scroll['max_day'] * 86400;
        $uscroll['status'] = 0;
        $uscroll['max_day'] = $scroll['max_day'];
        $uscroll['sell_num'] = $scroll['sell_num'];
        $uscroll['single_num'] = $scroll['single_num'];
        $res3 = M('user_scroll')->add($uscroll);

        // //为用户添加活跃度
        // M('user')->where(array('userid'=>$is_exis['uid']))->setInc('total_active',$scroll['active']);

        // //添加活跃度
        // $total_active = M('user')->where(array('userid'=>$is_exis['uid']))->getField('total_active');
        // $tm['pay_id'] = 0;
        // $tm['get_id'] = $is_exis['uid'];
        // $tm['get_nums'] = $scroll['active'];
        // $tm['get_time'] = time();
        // $tm['get_type'] = 35;
        // $tm['now_nums'] = $total_active;
        // M('tranmoney')->add($tm);
		
		
		// // 直推增加活跃度
		$pid = M("user")->where(array('userid'=>$is_exis['uid']))->getField('pid');
		// M('user')->where(array('userid'=>$pid))->setInc('total_active',1);
		
		// $total_active = M('user')->where(array('userid'=>$pid))->getField('total_active');
  //       $tm['pay_id'] = 0;
  //       $tm['get_id'] = $pid;
  //       $tm['get_nums'] = 1;
  //       $tm['get_time'] = time();
  //       $tm['get_type'] = 47;
  //       $tm['now_nums'] = $total_active;
  //       M('tranmoney')->add($tm);
		
        //直推增加经验值
        M('store')->where(array('uid'=>$pid))->setInc('exp',10);
        $yue_exp = M('store')->where(array('uid'=>$pid))->getField('exp');
        $tms['pay_id'] = 0;
        $tms['get_id'] = $pid;
        $tms['get_nums'] = 10;
        $tms['get_time'] = time();
        $tms['get_type'] = 101;
        $tms['now_nums'] = $yue_exp;
        M('tranmoney')->add($tms);

        //添加经验值记录
        M('store')->where(array('uid'=>$is_exis['uid']))->setInc('exp',10);
        $add_step = M('store')->where(array('uid'=>$is_exis['uid']))->getField('exp');
        $tm3['pay_id'] = 0;
        $tm3['get_id'] = $is_exis['uid'];
        $tm3['get_nums'] = 10;
        $tm3['get_time'] = time();
        $tm3['get_type'] = 100;
        $tm3['now_nums'] = $add_step;
        M('tranmoney')->add($tm3);

        //为用户添加支付宝
//        $alipay_arr['user_id'] = $is_exis['uid'];
//
//        M('ubanks')->where(array('user_id'=>$is_exis['uid'],'is_default'=>1))->setField('is_default',0);
//
//        $alipay_arr['is_default'] = 1;
//        $alipay_arr['add_time'] = time();
//        $alipay_arr['alipay_name'] = $is_exis['truename'];
//        $alipay_arr['alipay_number'] = $is_exis['alipay_number'];
//        $alipay_arr['img'] = $is_exis['pic3'];
//
//        M('ubanks')->add($alipay_arr);
        
        //为上级添加活跃度
        // M('user')->where(array('userid'=>$user_info['pid']))->setInc('total_active',0.07);
        // $total_active = M('user')->where(array('userid'=>$user_info['pid']))->getField('total_active');
        // $tm['pay_id'] = 0;
        // $tm['get_id'] = $user_info['pid'];
        // $tm['get_nums'] = 0.07;
        // $tm['get_time'] = time();
        // $tm['get_type'] = 47;
        // $tm['now_nums'] = $total_active;
        // M('tranmoney')->add($tm);


        //上级推荐人等级
        // $user_level = M('user_level')->where(array('is_real_name'=>1))->field('push_num,vip_grade')->select();
        // $vip_grade = M('user')->where(array('userid'=>$user_info['pid']))->getField('vip_grade');
        // $child_count = M('user')->where(array('pid'=>$user_info['pid'],'vip_grade'=>array('egt',1)))->count();

        // foreach($user_level as $v){
        //     if($child_count >= $v['push_num']&&$vip_grade != 0){
        //         M('user')->where(array('userid'=>$user_info['pid']))->setField('vip_grade',$v['vip_grade']);
        //     }
        // }
        if($res !== false && $res2 !== false){
            M()->commit();
            $this->success('审核通过成功');
        }else{
            M()->rollback();
            $this->error('审核通过失败，请重试');
        }
    }

    public function allsetNoVerify(){
        $ids = I('ids');
        foreach ($ids as $k => $v) {
            $id = $v;
            $arr['is_real_name'] = 0;
            $arr['is_verify'] = 1;
            M('user')->where(array('userid'=>$is_exis['uid']))->save($arr);
            $res = M('user_verify')->where(array('id'=>$id))->setField('is_verify',2);
        }
        ajaxReturn('审核不通过成功',1);
    }

    public function setNoVerify(){
        $id = (int)I('id');
        $is_exis = M('user_verify')->where(array('id'=>$id,'is_verify'=>0))->find();
        if(!$is_exis){
            $this->error('该订单状态错误，请重试');
        }
        $arr['is_real_name'] = 0;
        $arr['is_verify'] = 1;

        M('user')->where(array('userid'=>$is_exis['uid']))->save($arr);
        $res = M('user_verify')->where(array('id'=>$id))->setField('is_verify',2);
        if($res !== false){
            $this->success('审核不通过成功');
        }else{
            $this->error('审核不通过失败，请重试');
        }
    }

    //发布申请列表
    public function upload_list(){
        $user_verify = M('upload_verify'); // 实例化User对象
        $count      = $user_verify->count();// 查询满足要求的总记录数
        $Page       = new \Think\Page($count,15);// 实例化分页类 传入总记录数和每页显示的记录数(25)
        $show       = $Page->show();// 分页显示输出
        // 进行分页数据查询 注意limit方法的参数要使用Page类的属性
        $list = $user_verify->limit($Page->firstRow.','.$Page->listRows)->order('id desc')->select();
        foreach($list as $k => $v){
            $list[$k]['username'] = M('user')->where(array('userid'=>$v['uid']))->getField('username');
            $list[$k]['account'] = M('user')->where(array('userid'=>$v['uid']))->getField('account');
            $list[$k]['mobile'] = M('user')->where(array('userid'=>$v['uid']))->getField('mobile');
        }

        $this->assign('show',$show);
        $this->assign('list',$list);
        $this->display();
    }
    
    //通过或不通过
    public function set_upload_status(){
        $id = I('id');
        $status = I('status');
        $itdata = M('upload_verify')->where('id='.$id)->find();
        if($itdata){
            $save = M('upload_verify')->where(array('id'=>$id))->save(['status'=>$status]);
            if($save){
                if($status==1){
                    M('user')->where('userid='.$itdata['uid'])->save(['upload_verify'=>1]);
                }
                $this->success('审核完成');
            }else{
                $this->error('审核失败,请重试');
            }
        }else{
            $this->error('数据错误，请刷新重试');
        }
    }

    //二级认证
    public function two_verify(){
        $user_verify = M('industry_verify'); // 实例化User对象
        $count      = $user_verify->count();// 查询满足要求的总记录数
        $Page       = new \Think\Page($count,15);// 实例化分页类 传入总记录数和每页显示的记录数(25)
        $show       = $Page->show();// 分页显示输出
        // 进行分页数据查询 注意limit方法的参数要使用Page类的属性
        $list = $user_verify->limit($Page->firstRow.','.$Page->listRows)->order('status asc,id desc')->select();
        foreach($list as $k => $v){
            $list[$k]['username'] = M('user')->where(array('userid'=>$v['uid']))->getField('username');
            $list[$k]['account'] = M('user')->where(array('userid'=>$v['uid']))->getField('account');
            $list[$k]['mobile'] = M('user')->where(array('userid'=>$v['uid']))->getField('mobile');
            $list[$k]['hangye'] = M('industry')->where(array('id'=>$v['industry_id']))->getField('industry_name');
        }

        $this->assign('show',$show);
        $this->assign('list',$list);
        $this->display();
    }
    //二级审核操作
    public function set_two_status(){
        $id = I('id');
        $status = I('status');
        $itdata = M('industry_verify')->where('id='.$id)->find();
        if($itdata){
            $save = M('industry_verify')->where(array('id'=>$id))->save(['status'=>$status]);
            if($save){
                if($status==1){
                    M('user')->where('userid='.$itdata['uid'])->save(['industry_verify'=>1]);
                }
                $this->success('审核完成');
            }else{
                $this->error('审核失败,请重试');
            }
        }else{
            $this->error('数据错误，请刷新重试');
        }
    }
}
