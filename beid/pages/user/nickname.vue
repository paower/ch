<template>
	<view class="center">
		<cu-custom bgColor="bg-gradual-blue" :isBack="true">
			<block slot="backText"></block>
			<block slot="content">修改昵称</block>
		</cu-custom>
	<view class="container999">
		<view class='line'>
		  <view class="lineRight">  
			<input class="input" placeholder-class="plaClass" placeholder='请输入昵称' v-model="nickname"></input>
			</view>
		</view>
		<view class="title">输入4~12个文字</view>
		
		<view class="buttonBox" @click="submit">
			提交
		</view>
	</view>
	</view>
</template>

<script>
	var api = require('../../components/js/api.js'); 
	export default {
		data() {
			return{
				nickname:'',
			}
		},
		methods:{
			submit:function(){
				var userinfo = uni.getStorageSync('userinfo');
				api.post({
					url: 'Api/UserApi/setUserInfo',
					data: {openid:userinfo.openid,type: 'nickname',data:this.nickname},
					success: res => {
						if(res.status==1){
							uni.setStorageSync('userinfo',res.result);
						}
						uni.showToast({
							icon: 'none',
							position: 'bottom',
							title: res.message
						});
					}
				})
			}
		},
		onShow() {
			this.nickname = uni.getStorageSync('userinfo').nickname;
		}
	}
</script>

<style lang="scss">
	page{
		background-color: #18191d;
	}
	.plaClass{
		color: #DEDEDE;
	}
	.container999{
		margin-top: 30upx;
		.title{
			height: 80rpx;
			line-height: 80rpx;
			padding-left: 4%;
		}
		.buttonBox{
			width: 91%;
			margin: 30upx auto;
			height: 84rpx;
			border-radius: 84rpx;
			color: white;
			display: flex;
			align-items: center;
			justify-content: center;
			// position: fixed;
			bottom: 100rpx;
			left: 0;
			right: 0;
			background-color: #4a8be9;
		}
		
		.line{
		  margin-top: 30rpx;
		  height: 85rpx;
		  width: 92%;
		  margin: 0 auto;
		  display: flex;
		  .lineRight{
			 flex: 1;
			  height: 100%;
			  display: flex;
			  align-items: center;
			  justify-content: space-between;
			  position: relative;
		  }
			
			.input{
				padding-right: 20rpx;
				height: 100%;
				width: 100%;
				text-align: center;
				font-size: 28rpx;
				color: #FFFFFF;
				border: 1px solid #535353;
				border-radius: 80upx;
			}
			
		}
		width: 100vw;
		font-size: 28upx;
		min-height: 100vh;
		overflow: hidden;
		color: #6b8082;
		position: relative;
	}
</style>
