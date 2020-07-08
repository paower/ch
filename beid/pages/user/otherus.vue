<template>
	<view class="my">
		<cu-custom bgColor="bg-black" :isBack="true">
			<block slot="backText"></block>
			<block slot="content"></block>
			<!-- <text slot="right" class="cuIcon-more"></text> -->
		</cu-custom>
		<!-- username -->
		<view class="grid user-detail col-2 align-center justify-center">
			<view class="left flex justify-center">
				<view class="">
					<text class="text-white text-xl">{{userinfo.nickname}}</text>
				</view>
				<view class="number">
					<text class="text-white"> 慈惠号：{{userinfo.username}} </text>
				</view>
			</view>
			<view class="rightinfo round">
				<image class=" round" :src="userinfo.headimg?userinfo.headimg:'../../static/touxiang.png'" mode="widthFix"></image>	
			</view>
		</view>
		
		<!-- 签名 -->
		<view class="qianming">
			<text class="text-white">个性签名：{{userinfo.gxqm}}</text>
		</view>
		<view class="user-info " @click="dofollow(userinfo.userid)">
			<view class="userdata">
				<text @click="1" class="btn1" v-if="!userinfo.is_my_follow">+关注</text>
			</view>
		</view>
		
		<view class="grid col-3 align-center justify-center text-white fansinfo">
			<view class="flex align-center justify-center">
				<text class="text-xl text-bold margin-right-xs">{{userinfo.he_friends}}</text>
				<text class="text-gray">好友</text>
			</view>
			<view class="flex align-center justify-center">
				<text class="text-xl text-bold margin-right-xs">{{userinfo.he_follow_count}}</text>
				<text class="text-gray">关注</text>
			</view>
			<view class="flex align-center justify-center">
				<text class="text-xl text-bold margin-right-xs">{{userinfo.he_fans_count}}</text>
				<text class="text-gray">粉丝</text>
			</view>
		</view>
		
		<!-- tab -->
		<scroll-view scroll-x class="bg-black nav text-center">
			<view class="cu-item text-gray" :class="index==TabCur?'text-white cur':''" v-for="(item,index) in tabList" :key="index" @tap="tabSelect" :data-id="index">
				{{item.name}} 
				<text class="text-gray margin-left-xs" v-if="index==0">{{userinfo.he_video_count}}</text> 
				<text class="text-gray margin-left-xs" v-if="index==1">{{userinfo.he_like}}</text> 
			</view>
		</scroll-view>
		
		<!-- list -->
		<video-list :dataList="videoList" v-if="TabCur==0"></video-list>
		<video-list :dataList="video_like_List" v-if="TabCur==1"></video-list>
		
	</view>
</template>

<script>
import videoList from '@/components/list/list.vue';
var api = require('../../components/js/api.js'); 
export default {
	components: {
		videoList
	},
	data() {
		return {
			videoList:[],
			userinfo:[],
			video_like_List:[],
			TabCur: 0,
			tabList:[{name:'作品',number: 114},{name:'收藏',number: 99}],
		};
	},
	onLoad(options) {
		console.log(options.userid)
		// this.getVideoList();
		this.getUserInfo(options.userid,1);
	},
	
	onPullDownRefresh() {
		// this.getVideoList(true);
		uni.stopPullDownRefresh();
	},
	methods: {
		dofollow(toid){
			var userinfos = uni.getStorageSync('userinfo');
			if(!userinfos){
				uni.showToast({
					title:'请先登录',
					icon:'none'
				})
				return;
			}
			uni.showLoading({});
			api.post({
				url:'Api/FollowApi/addFollow',
				data:{openid:userinfos.openid,toid:toid},
				success:res=>{
					if(res.status==1){
						uni.hideLoading();
						this.userinfo.is_my_follow = true;
					}else{
						uni.showToast({
							title:'关注失败',
							icon:'none'
						})
					}
				}
			})
		},
		tabSelect(e){
			this.TabCur = e.currentTarget.dataset.id;
			this.scrollLeft = (e.currentTarget.dataset.id - 1) * 60;
			if(this.TabCur==1){
				if(this.video_like_List.length>0) return;
				this.getUserInfo(this.userinfo.userid,2)
			}
		},
		//获取用户信息
		getUserInfo(userid,type){
			api.get({
				url:'Api/VideoApi/GetUserInfoId',
				data:{openid:uni.getStorageSync('userinfo').openid,userid:userid},
				success:res=>{
					if(res.status==1){
						this.userinfo = res.result
						if(type==1){
							this.videoList = res.result.video_list
						}else if(type==2){
							this.video_like_List = res.result.he_like_list
						}
					}else{
						uni.showToast({
							title:res.message,
							icon:'none'
						})
					}
				}
			})
		},
		
	}
};
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
			border-radius: 15upx;
			margin: 0 8upx;
			left: 0upx;
			border: 1px solid rgba(217,210,194,0.3);
		}
		.btn1{
			background-color: rgba(0, 170, 0, 127);
			color: #FFFFFF;
			padding: 16upx 31upx;
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
		}

		.big {
			margin-top: 0;

			.img {
				margin-top: 15px;
				width: 40px;
				height: 40px;
			}

			.title {
				font-size: 25px;
				font-weight: 500;
				color: rgba(255, 255, 255, 1);
				line-height: 41px;
			}

			.sub_title {
				font-size: 11px;
				font-weight: 300;
				color: rgba(255, 255, 255, 1);
				line-height: 41px;
			}
		}

		.small {
			margin-top: 14px;
			height: 75%;

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
				font-size: 7px;
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