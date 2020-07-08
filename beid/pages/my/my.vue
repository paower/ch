<template>
	<view class="my">
		
		<view @click="setup()" class="headcenter margin-top"><image src="../../static/setup.png" /></view>
		
		<!-- username -->
		<view class="grid user-detail col-2 align-center justify-center">
			<view class="left flex justify-center">
				<view>
					<text class="text-white text-xl" @click="setnickname">{{userinfo.nickname?userinfo.nickname:'请先登录'}}</text>
				</view>
				<view class="number">
					<text class="text-white"> 慈惠号：{{userinfo.username?userinfo.username:'000000'}}</text>
					<text style="color: #fff;padding: 1px 5px;margin-left: 10px;background: #f37b1d;border-radius: 10px;" @click="qiandao">签到</text>
				</view>
				
			</view>
			<view class="rightinfo">
				<image class="round" @click="upload()" :src="userinfo.headimg?userinfo.headimg:'../../static/touxiang.png'" mode="widthFix"></image>	
			</view>
		</view>
		
		<!-- 签名 -->
		<view @click="signature()" class="qianming">
			<text class="text-white">{{userinfo.gxqm?userinfo.gxqm:'添加签名，展示个性自己'}}</text>
		</view>
		<view class="user-info ">
			<view class="userdata">
				<text @click="editinfo()" class="btn">编辑资料</text>
				<text @click="certification()" class="btn1" v-if="active_vip_grade.is_real_name!=1">实名认证</text>
			</view>
		</view>
		
		
		<view class="page_content">
			<swiper  previous-margin="50px" next-margin="50px" class="swiper" :indicator-dots="false"
			 :autoplay="false" :interval="3000" :duration="1000" :current="bigIdx">
		
				<template v-for="(vip, i) in vips" >
					<swiper-item :key="'vip_'+i">
						<view :class="['swiper-item',bigIdx === i ? 'big' : 'small']" :style="{background:vip.bg,'box-shadow':vip.shadow}" @click='zhangdan(i)'>
							<image class="img" src="/static/icon_vip.png"></image>
							<text class="title">{{vip.title}}</text>
							<text class="sub_title">
								<block v-if="i==0">{{active_vip_grade.total_active}}</block>
								<block v-if="i==1">{{active_vip_grade.total_lingshi || 0}}颗</block>
								<block v-if="i==2">LV{{active_vip_grade.vip_grade}}</block>
								<block v-if="i==3">{{active_vip_grade.exp}}</block>
							</text>
						</view>
					</swiper-item>
				</template>
			</swiper>
		</view>
		
		
		
		<!--  -->
		<view class="grid col-3 align-center justify-center text-white fansinfo">
			<view class="flex align-center justify-center" @tap="friends()">
				<text class="text-xl text-bold margin-right-xs">{{getMyFollow_Fans.pidisme}}</text>
				<text class="text-gray">好友</text>
			</view>
			<view class="flex align-center justify-center" @tap="follow()">
				<text class="text-xl text-bold margin-right-xs">{{getMyFollow_Fans.follow_count}}</text>
				<text class="text-gray">关注</text>
			</view>
			<view class="flex align-center justify-center" @tap="user_fans()">
				<text class="text-xl text-bold margin-right-xs">{{getMyFollow_Fans.fans_count}}</text>
				<text class="text-gray">粉丝</text>
			</view>
		</view>
		
		<!-- tab -->
		<scroll-view scroll-x class="bg-black nav text-center">
			<view class="cu-item text-gray" :class="index==TabCur?'text-white cur':''" v-for="(item,index) in tabList" :key="index" @tap="tabSelect" :data-id="index">
				{{item.name}} 
				<text class="text-gray margin-left-xs">{{item.number}}</text> 
			</view>
		</scroll-view>
		
		<!-- list -->
		<video-list :dataList="videoList" v-if="TabCur==0"></video-list>
		<video-list :dataList="likelist" v-if="TabCur==1 && likelist.length>0"></video-list>	
			
		<view class="cu-modal show" v-if="openmodal.is_qiandao==0">
			<view class="cu-dialog">
				<view class="cu-bar bg-white justify-end">
					<view class="content">签到</view>
				</view>
				<view class="padding-xl" v-if="openmodal.shouyi">
					<text>今日收益：{{openmodal.shouyi}}</text>
					<input type="text" placeholder="输入祝福语" v-model="zhufu" style="border: 2upx solid #ccc;height: 80upx; border-radius: 12upx;margin-top: 10upx;">
					<text>{{tips}}</text>
				</view>
				<view class="padding-xl" v-else>
					<text>今日已签到</text>
				</view>
				<view class="cu-bar bg-white justify-end">
					<view class="action" style="width: 100%;">
						<button class="cu-btn line-green text-green" @tap="hideModal">取消</button>
						<button class="cu-btn bg-green margin-left" @tap="submit">签到</button>
		
					</view>
				</view>
			</view>
		</view>
	</view>
</template>

<script>
	import videoList from '@/components/my/list.vue';
	var api = require('../../components/js/api.js'); 
	export default {
		components: {
			videoList
		},
		data() {
			return {
				tips:'',
				openmodal:[],
				zhufu:'',
				TabCur: 0,
				scrollLeft: 0,
				tabList:[{name:'作品',number: 0},{name:'收藏',number: 0}],
				bigIdx: 1,
				vips: [{
					bg: 'linear-gradient(94deg,rgba(192,160,105,1),rgba(233,213,172,1))',
					shadow: '0px 3px 12px 0px rgba(195,164,110,0.23)',
					title: '活跃度',
					subTitle: '0'
				}, {
					bg: 'linear-gradient(94deg,rgba(192,160,105,1),rgba(233,213,172,1))',
					shadow: '0px 3px 12px 0px rgba(195,164,110,0.23)',
					title: '慈点',
					subTitle: '0颗'
				}, {
					bg: 'linear-gradient(94deg,rgba(192,160,105,1),rgba(233,213,172,1))',
					shadow: '0px 3px 12px 0px rgba(195,164,110,0.23)',
					title: '等级',
					subTitle: 'LV0'
				},
				{
					bg: 'linear-gradient(94deg,rgba(192,160,105,1),rgba(233,213,172,1))',
					shadow: '0px 3px 12px 0px rgba(195,164,110,0.23)',
					title: '经验值',
					subTitle: '0'
				}
				],
				videoList: [],
				userinfo:[],
				active_vip_grade:[],
				getMyFollow_Fans:[],
				likelist:[]
			};
		},
		onShow() {
			this.getVideoList();
			this.getMylike();
			// if(!uni.getStorageSync('userinfo')){
			// 	uni.navigateTo({
			// 		url:'/pages/login/login'
			// 	})
			// }
			var userinfo = uni.getStorageSync('userinfo');
			this.userinfo = userinfo;
			this.get_vip_grade(userinfo.openid);
			this.getMyFollow(userinfo.openid);
			this.get_sign_in(userinfo.openid);
		},
		methods:{
			//执行签到
			submit(){
				if(this.zhufu.length<6 || this.zhufu.length>30){
					this.tips = '字数限制在6-30之间';
					return;
				}
				this.tips='正在签到...';
				api.post({
					url: 'Api/ScrollApi/todaySignin',
					data: {openid:uni.getStorageSync('userinfo').openid,sign_content:this.zhufu},
					success: res => {
							this.openmodal.is_qiandao=4;
						
						if(res.status==1){
							this.tips='今日已签到';
						}else{
							this.tips=res.message
						}
					}
				})
			},
			//设置昵称
			setnickname(){
				if(this.userinfo.nickname){
					uni.navigateTo({
						url:'/pages/user/editinfo'
					})
				}else{
					uni.navigateTo({
						url:'/pages/login/login'
					})
				}
			},
			//关闭签到
			hideModal(){
				this.openmodal.is_qiandao=1;
			},
			//打开账单
			zhangdan:function(url){
				if(!uni.getStorageSync('userinfo')){
					uni.navigateTo({
						url:'/pages/login/login'
					})
					return;
				}
				console.log(url);
				if(url != 2){
					uni.navigateTo({
						url: '/pages/user/bill'
					});
				}
			},
			//打开签到
			qiandao:function(){
				if(!uni.getStorageSync('userinfo')){
					uni.navigateTo({
						url:'/pages/login/login'
					})
					return;
				}
				console.log(this.openmodal.is_qiandao);
				if(this.openmodal.is_qiandao == 4){
					uni.showToast({
					    icon: 'none',
					    title: '您已签到'
					});
					return;
				}
				if(this.openmodal.is_qiandao == 3){
					uni.showToast({
					    icon: 'none',
					    title: '未达到签到条件'
					});
					return;
				}
				this.openmodal.is_qiandao = 0;
			},
			//获取签到
			get_sign_in:function(openid){
				api.post({
					url: 'Api/ScrollApi/get_sign_in',
					data: {openid:openid},
					success: res => {
						console.log(res);
						this.openmodal = {
							"is_qiandao":res.is_qiandao,
							"shouyi":res.zong_num
						};
					}
				})
			},
			//慈点活跃度等级
			get_vip_grade:function(openid){
				api.post({
					url: 'Api/UserApi/mygrade',
					data: {openid:openid},
					success: res => {
						if(res.status==1){
							console.log(res);
							this.active_vip_grade = res.result;
							uni.setStorageSync('upload_verify',res.result.upload_verify)
						}
					}
				})
			},
			getMyFollow:function(openid){
				api.post({
					url: 'Api/FollowApi/getMyFollow_Fans',
					data: {openid:openid},
					success: res => {
						if(res.status==1){
							this.getMyFollow_Fans = res.result;
						}
					}
				})
			},
			tabSelect(e) {
				this.TabCur = e.currentTarget.dataset.id;
				this.scrollLeft = (e.currentTarget.dataset.id - 1) * 60;
				this.getVideoList();
			},
			getVideoList() {
				api.get({
					url:'Api/VideoApi/GetMyVideo',
					data:{openid:uni.getStorageSync('userinfo').openid},
					success: res => {
						console.log(res);
						this.videoList = res;
						this.tabList[0].number = res.length;
					}
				})
			},
			getMylike(){
				api.get({
					url:'Api/VideoApi/GetMyLike',
					data:{openid:uni.getStorageSync('userinfo').openid},
					success: res => { 
						if(res){
							this.likelist = res;
							this.tabList[1].number = res.length;
						}else{
							this.tabList[1].number = 0;
						}
					}
				})
			},
			editinfo() {
				if(!uni.getStorageSync('userinfo')){
					uni.navigateTo({
						url:'/pages/login/login'
					})
					return;
				}
				uni.navigateTo({
					url: '/pages/user/editinfo'
				});
			},
			certification() {
				if(!uni.getStorageSync('userinfo')){
					uni.navigateTo({
						url:'/pages/login/login'
					})
					return;
				}
				uni.navigateTo({
					url: '/pages/user/certification'
				});
			},
			upload() {
				if(!uni.getStorageSync('userinfo')){
					uni.navigateTo({
						url:'/pages/login/login'
					})
					return;
				}
				uni.navigateTo({
					url: '/pages/user/upload'
				});
			},
			setup() {
				if(!uni.getStorageSync('userinfo')){
					uni.navigateTo({
						url:'/pages/login/login'
					})
					return;
				}
				uni.navigateTo({
					url: '/pages/my/setup'
				});
			},
			signature() {
				if(!uni.getStorageSync('userinfo')){
					uni.navigateTo({
						url:'/pages/login/login'
					})
					return;
				}
				uni.navigateTo({
					url: '/pages/user/signature'
				});
			},
			user_fans(){
				if(!uni.getStorageSync('userinfo')){
					uni.navigateTo({
						url:'/pages/login/login'
					})
					return;
				}
				uni.navigateTo({
					url:'/pages/user/fans'
				})
			},
			follow(){
				if(!uni.getStorageSync('userinfo')){
					uni.navigateTo({
						url:'/pages/login/login'
					})
					return;
				}
				uni.navigateTo({
					url:'/pages/user/follow'
				})
			},
			friends(){
				if(!uni.getStorageSync('userinfo')){
					uni.navigateTo({
						url:'/pages/login/login'
					})
					return;
				}
				uni.navigateTo({
					url:'/pages/user/friends'
				})
			}
		}
	}
</script>

<style lang="less">
.my{
	background-color: #18191d;
	height: 100vh;
	width: 100vw;
}
.rightinfo{
	width: 120upx;
	height: 120upx;
	image{
		width: 120upx;
		height: 120upx;
		float: right;
		margin: 10upx 20upx 0 0 ;
	}
}
.headcenter{
	width: 100vw;
	height: 90upx;
	image{
		width: 50upx;
		height: 50upx;
		float: right;
		margin: 20upx 20upx 0 0;
	}
}
.user-info{
	margin-left: 20upx;
	.header{
		text-align: center;
		padding: 10upx 0;
		image{
			width: 150upx;
			height: 150upx;
		}
	}
	.userdata{
		height: 130upx;
		line-height: 130upx;
		.btn{
			background-color: rgba(57,58,68,0.5);
			color: #FFFFFF;
			padding: 15upx 30upx;
			border-radius: 35upx;
			margin: 0 8upx;
			left: 0upx;
			border: 1px solid rgba(217,210,194,0.3);
		}
		.btn1{
			background-color: rgba(0, 170, 0, 127);
			color: #FFFFFF;
			padding: 17upx 31upx;
			border-radius: 35upx;
			margin: 0 8upx;
		}
	}
}
.fansinfo{
	margin-bottom: 20upx;
}

.swiper {
		width: 100%;
		margin-top: 10px;

		.swiper-item {
			border-radius: 16px;
			display: flex;
			flex-direction: column;
			align-items: center;
			justify-content: center;
			margin-left: 10px;
			margin-right: 10px;
			// margin-top: 14px !important;
			height: 65%;
		}

		.big {
			margin-top: 0;

			.img {
				margin-top: 15px;
				width: 25px;
				height: 25px;
			}

			.title {
				font-size: 15px;
				font-weight: 500;
				color: rgba(255, 255, 255, 1);
				line-height: 31px;
			}

			.sub_title {
				font-size: 25upx;
				font-weight: 300;
				color: rgba(255, 255, 255, 1);
				// line-height: 41px;
			}
		}

		.small {
			// margin-top: 14px;
			height: 65%;

			// transition: all 0.3s;
			.img {
				margin-top: 5px;
				width: 25px;
				height: 25px;
			}

			.title {
				font-size: 15px;
				font-weight: 500;
				color: rgba(255, 255, 255, 1);
				line-height: 31px;
			}

			.sub_title {
				font-size: 20upx;
				font-weight: 300;
				color: rgba(255, 255, 255, 1);
			}
		}
	}
.user-detail{
	.left{
		flex-direction: column;
		text-align: left;
		padding-left: 35upx;
		// margin-left: 30upx;
		.number{
			margin: 10upx 0;
		}
	}
}

.qianming{
	padding: 20upx;
	padding-left: 35upx;
}

.adv{
	padding: 20upx;
}
</style>