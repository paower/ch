<template>
	<view class="msg">
		<cu-custom bgColor="bg-black" :isBack="false">
			<block slot="backText">返回</block>
			<block slot="content">消息</block>
		</cu-custom>
		
		<!-- tools -->
		<view class="cu-list grid col-4 tools align-center justify-center">
				<view @click="fans()" class="flex align-center justify-center">
					<image src="../../static/msg/fans.png" mode="widthFix"></image>
					<text>粉丝</text>
				</view>
				<view @click="aitme()" class="flex align-center justify-center">
					<image src="../../static/msg/at.png" mode="widthFix"></image>
					<text>@我</text>
				</view>
				<view @click="fabulous()" class="flex align-center justify-center">
					<image src="../../static/msg/zan.png" mode="widthFix"></image>
					<text>点赞</text>
				</view>
				<view @click="comment()" class="flex align-center justify-center">
					<image src="../../static/msg/comment.png" mode="widthFix"></image>
					<text>评论</text>
				</view>
		</view>
		
		<!-- list -->
			<view @click="msgdetails()" class="cu-list menu-avatar msg-list">
				<view class="cu-item">
					<view class="cu-avatar round lg newsslg"><uni-text class="text-white cuIcon-notice"><span></span></uni-text></view>
					<view class="content">
						<view class="text-grey">系统消息</view>
						<view class="text-gray text-sm flex">
							<view class="text-cut">
								<text class="margin-right-xs"></text>
								{{system_message.title}}
							</view> </view>
					</view>
					<view class="action">
						<view class="text-grey text-xs">{{system_message.create_time}}</view>
					</view>
				</view>
			</view>	
	</view>
</template>

<script>
	var api = require('../../components/js/api.js'); 
	export default {
		data() {
			return {
				system_message:[],
				zan:0
			};
		},
	onShow() {
		// if(!uni.getStorageSync('userinfo')){
		// 	uni.navigateTo({
		// 		url:'/pages/login/login'
		// 	})
		// }
		this.getMessage();
	},
	methods:{
		getMessage(){
			api.get({
				url:'Api/MessageApi/GetNotice',
				success:res=>{
					this.system_message = res
				}
			})
		},
		// getWeidu(){
		// 	api.get({
		// 		url:'Api/CommentApi/getWeidu',
		// 		data:{openid:uni.getStorageSync('userinfo').openid},
		// 		success:res=>{
		// 			this.system_message = res
		// 		}
		// 	})
		// },
		msgdetails(){
			if(!uni.getStorageSync('userinfo')){
				uni.navigateTo({
					url:'/pages/login/login'
				})
				return;
			}
			uni.navigateTo({
				url:'/pages/msg/msgdetails'
			});
		},
		comment(){
			uni.navigateTo({
				url:'/pages/user/comment'
			});
		},
		fans(){
			uni.navigateTo({
				url:'/pages/user/fans'
			});
		},
		fabulous(){
			uni.navigateTo({
				url:'/pages/user/fabulous'
			});
		},
		aitme(){
			uni.navigateTo({
				url:'/pages/user/aitme'
			});
		},
	}
	}
</script>

<style lang="less">
	page{
		background-color: #18191d;
	}
.msg{
	width: 100vw;
	height: 100vh;
	background-color: #18191d;
}
.newsslg{
	background:linear-gradient(45deg, #f43f3b, #ec008c);
}
.tools{
	view{
		display: flex;
		flex-direction: column;
	}
	image{
		width: 100upx;
		height: 100upx;
		display: flex;
	}
}
.cu-list.grid{
	background-color: #18191d;
	padding: 30upx 0;
	color: #FFFFFF;
	border-bottom: 1px solid #464646;
}
.cu-list+.cu-list{
	margin-top: 0;
}
.cu-list.menu-avatar>.cu-item{
	background-color: #18191d;
	border-color: #18191d;
}
</style>
