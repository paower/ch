<?php
/**
 * 本程序仅供娱乐开发学习，如有非法用途与本公司无关，一切法律责任自负！
 */
namespace Home\Controller;
use Think\Controller;
class CommonController extends Controller {
	public function _initialize(){
        //判断网站是否关闭
        $close=is_close_site();
        if($close['value']==0){
          success_alert($close['tip'],U('Login/logout'));
        }
        //验证用户登录
        // $this->is_user();

        $uid = session('userid');

       
		
		
        //为过期的矿机设置为过期
        $time = time();
       
        $user_scroll = M('user_scroll')->where(array('overtime'=>array('elt',$time)))->field('id,uid,scroll_id')->select();
        if($user_scroll){
            foreach($user_scroll as $v){
                M('user_scroll')->where(array('id'=>$v['id']))->setField('status',0);
                $reduce_active = M('scroll')->where(array('id'=>$v['scroll_id']))->getField('active');
                //$reduce_step = M('scroll')->where(array('id'=>$v['scroll_id']))->getField('step_num');
               // M('user')->where(array('userid'=>$v['uid']))->setDec('total_active',$reduce_active);

                //活跃度记录
                // $total_active = M('user')->where(array('userid'=>$v['uid']))->getField('total_active');
                // $tm['pay_id'] = $v['uid'];
                // $tm['get_id'] = 0;
                // $tm['get_nums'] = $reduce_active;
                // $tm['get_time'] = time();
                // $tm['get_type'] = 34;
                // $tm['now_nums'] = $total_active;
                // M('tranmoney')->add($tm);

                //上级减少直推活跃度
                // $pid = M('user')->where(array('userid'=>$v['uid']))->getField('pid');
                // $p_active = $scroll['active'] *0.07;
                // M('user')->where(array('userid'=>$pid))->setDec('total_active',$reduce_active*0.07);

                //添加步数记录
                // $step_num = M('user_scroll us')->join('ysk_scroll s ON us.scroll_id=s.id')->where(array('us.uid'=>$userid,'us.status'=>1))->order('s.step_num desc')->getField('s.step_num');
                // $add_step = M('user')->where(array('userid'=>$userid))->getField('add_step');
                // $tm3['pay_id'] = $v['uid'];
                // $tm3['get_id'] = 0;
                // $tm3['get_nums'] = $reduce_step;
                // $tm3['get_time'] = time();
                // $tm3['get_type'] = 41;
                // $tm3['now_nums'] = $step_num+$add_step;
                // M('tranmoney')->add($tm3);
            }
        }
        $user_level = M('user_level')->order('id asc')->select();
        foreach($user_level as $v){
            $grade = M('user_level')->where(array('id'=>$v['level_id']))->getField('vip_grade');
            $childUsersCount = M('user')->where(array('pid'=>$uid,'vip_grade'=>$grade))->count();
            $userActive = M('user')->where(array('userid'=>$uid))->getField('total_active');
            $userGrade = M('user')->where(array('userid'=>$uid))->getField('vip_grade');
            if($userGrade > 0 && $userGrade == ($v['vip_grade'] - 1)&&$childUsersCount >= $v['push_num'] && $userActive >= $v['active_num']){
                $count = $v['scroll_num'];
                $is_give = true;
                $vip_grade = $v['vip_grade'];
                $service_charge = $v['service_charge'];
                $scroll_id = $v['scroll_id'];
            }
        }

        if(isset($is_give) && $is_give){
            for($i = 0;$i<$count;$i++){
                //赠送矿机
                $scroll = M('scroll')->where(array('id'=>$scroll_id))->find();
                $uscroll['uid'] = $uid;
                $uscroll['scroll_id'] = $scroll['id'];
                $uscroll['overtime'] = time() + $scroll['max_day'] * 86400;
                $uscroll['status'] = 1;
                $res3 = M('user_scroll')->add($uscroll);

                //为用户添加活跃度
                M('user')->where(array('userid'=>$uid))->setInc('total_active',$scroll['active']);

                //添加活跃度
                $total_active = M('user')->where(array('userid'=>$uid))->getField('total_active');
                $tm['pay_id'] = 0;
                $tm['get_id'] = $uid;
                $tm['get_nums'] = $scroll['active'];
                $tm['get_time'] = time();
                $tm['get_type'] = 47;
                $tm['now_nums'] = $total_active;
                M('tranmoney')->add($tm);

            }
            $arr['vip_grade'] = $vip_grade;
            $arr['service_charge'] = $service_charge;
            M('user')->where(array('userid'=>$uid))->setField($arr);
        }

        //过期3天清除用户
        // $is_del_user = M('user')->where(array('vip_grade'=>0))->field('userid,reg_date')->select();
        // foreach($is_del_user as $v){
        //     $overdue_time = $v['reg_date'] + 86400*3;
        //     if($overdue_time <= time()){
        //         M('user')->where(array('userid'=>$v['userid']))->delete();
        //     }
        // }
        

        //为用户添加直推活跃度,已添加到用户活跃度里
        // $where['pid'] = $uid;
        // $where['vip_grade'] = array('egt',1);
        // $total_child_active = M('user')->where($where)->sum('total_active');
        // $push_active = $total_child_active * 0.07;
        // M('user')->where(array('userid'=>$uid))->setField('total_child_active',$push_active);
        
        


        // 市场封号
        // 出售
        $sell_deal = M('deal')->where(array('status'=>1,'expiration_time'=>array(array('elt',time()),array('neq',0))))->select();
		
        if($sell_deal){
            foreach($sell_deal as $k => $v){
                if($v['type'] == 1){
                    // M('user')->where(array('userid'=>$v['pay_id']))->setField('status',0);
                    $deal_arr['pay_id'] = 0;
                    $deal_arr['status'] = 0;
                    M('deal')->where(array('id'=>$v['id']))->save($deal_arr);
                }elseif($v['type'] == 2){
                    // M('user')->where(array('userid'=>$v['pay_id']))->setField('status',0);
					$vip_grade = M('user')->where(array('userid'=>$v['sell_id']))->getFIeld('vip_grade');
					$tran_fee = M('user_level')->where(array('vip_grade'=>$vip_grade))->getField('tran_fee');
                    $djie_num = $v['num'] + $v['num']*$tran_fee/100;
                    // $arr['djie_num'] = array('exp','djie_num - '.$djie_num);
                    $arr['total_lingshi'] = array('exp','total_lingshi + '.$djie_num);
                    M('user')->where(array('userid'=>$v['sell_id']))->save($arr);
                    
                    //添加记录
                    $total_lingshi = M('user')->where(array('userid'=>$v['sell_id']))->getField('total_lingshi');
                    $tm['pay_id'] = 0;
                    $tm['get_id'] = $v['sell_id'];
                    $tm['get_nums'] = $djie_num;
                    $tm['get_time'] = time();
                    $tm['get_type'] = 36;
                    $tm['now_nums'] = $total_lingshi;
                    M('tranmoney')->add($tm);

                    $deal_arr['sell_id'] = 0;
                    $deal_arr['status'] = 0;
                    M('deal')->where(array('id'=>$v['id']))->save($deal_arr);
                }
                
                
            }
        }

        // 购买
        $pay_deal = M('deal')->where(array('status'=>2,'expiration_time'=>array('elt',time())))->select();
        if($pay_deal){
            foreach($pay_deal as $k => $v){
                $deal_arr['status'] = 3;
                $deal_arr['end_time'] = time();
                M('deal')->where(array('id'=>$v['id']))->save($deal_arr);

                //出售用户
                $lingshi = $v['num']; //CC币数量
                M('user')->where(array('userid'=>$v['sell_id']))->setDec('djie_num',$lingshi);
                // 购买用户
                M('user')->where(array('userid'=>$v['pay_id']))->setInc('total_lingshi',$lingshi);
                //添加记录
                $total_lingshi = M('user')->where(array('userid'=>$v['pay_id']))->getField('total_lingshi');
                $tm['pay_id'] = 0;
                $tm['get_id'] = $v['pay_id'];
                $tm['get_nums'] = $lingshi;
                $tm['get_time'] = time();
                $tm['get_type'] = 32;
                $tm['now_nums'] = $total_lingshi;
                M('tranmoney')->add($tm);

                //星级会员收取手续费
                
                // $user_star = M('user_star')->select();
                // foreach($user_star as $key => $val){
                //     $star_user = M('user')->where(array('user_star_id'=>$val['id']))->field('userid')->select();
                //     if($star_user){
                //         //计算所获取得手续费
                //         $num = $deal['fee_num'] * $val['get_fee'] / 100;
                //         $count = count($star_user);
                //         $num = $num / $count;
                //         foreach($star_user as $vals){
                //             M('user')->where(array('userid'=>$vals['userid']))->setInc('total_lingshi',$num);

                //             //添加记录
                //             $total_lingshi = M('user')->where(array('userid'=>$v['uid']))->getField('total_lingshi');
                //             $tm['pay_id'] = 0;
                //             $tm['get_id'] = $vals['userid'];
                //             $tm['get_nums'] = $num;
                //             $tm['get_time'] = time();
                //             $tm['get_type'] = 37;
                //             $tm['now_nums'] = $total_lingshi;
                //             M('tranmoney')->add($tm);
                //         }
                //     }
                // }
            }
        }

        
    }


    protected function getChild($pid){
        $data = M('user')->where(array('vip_grade'=>array('egt',1)))->field('userid,pid')->select();
        return $this->getTreeChild($data,$pid);
    }


    protected function getTeamChild($pid,$data){
		$data = M('user')->where(array('status'=>1))->field('userid,pid,user_star_id')->select();
        return $this->getTreeChild($data,$pid,true);
    }


    private function getTreeChild($data,$pid,$flag){

        static $list = array();
        if($flag){
            $list = array();
        }
        foreach($data as $k => $v){
            if($v['pid'] == $pid){
                $list[] = $v;
                $this->getTreeChild($data,$v['userid'],false);
            }
        }
        return $list;

    }


 protected function is_user(){
        $userid=user_login();
        $user=M('user');
        if(!$userid){
            $this->redirect('Login/login');
            exit();
        }

        //判断12小时后必须重新登录
        $in_time=session('in_time');
        $time_now=time();
        $between=$time_now-$in_time;
        if($between > 3600 * 24 * 5){
            $this->redirect('Login/logout');
        }

        $where['userid']=$userid;
        $u_info=$user->where($where)->field('status,session_id')->find();
        //判断用户是否锁定
        $login_from_admin=session('login_from_admin');//是否后台登录
        if($u_info['status']==0 && $login_from_admin!='admin'){
            if(IS_AJAX){
                ajaxReturn('你账号已锁定，请联系管理员',0);
            }else{
                success_alert('你账号已锁定，请联系管理员',U('Login/logout'));
                exit();
            }
        }

        //判断用户是否在他处已登录
        $session_id=session_id();
        // if($session_id != $u_info['session_id'] && empty($login_from_admin)){

            // if(IS_AJAX){
                // ajaxReturn('您的账号在他处登录，您被迫下线',0);
            // }else{
                // success_alert('您的账号在他处登录，您被迫下线',U('Login/logout'));
                // exit();
            // }
        // }
        //记录操作时间
        // session('in_time',time());
    }


}

