<template>
	<view class="center">
		<cu-custom bgColor="bg-gradual-blue" :isBack="true">
			<block slot="backText"></block>
			<block slot="content">修改登录密码</block>
		</cu-custom>
	<view class="container999">
		<view class="title">不定期修改密码可以提升账户安全！</view>
		<view class='line'>
		  <view class="lineRight">  
			<input class="input" placeholder-class="plaClass" placeholder='请输入原登录密码' v-model="old_password"></input>
			</view>
		</view>
		<view class='line'>
		  <view class="lineRight">  
			<input class="input" placeholder-class="plaClass" placeholder='请输入新的登录密码' v-model="new_password"></input>
			</view>
		</view>
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
				new_password:'',
				old_password:''
			}
		},
		methods:{
			submit:function(){
				var openid = uni.getStorageSync('userinfo').openid;
				api.post({
					url:'Api/PassApi/EditPassword',
					data:{openid:openid,new_password:this.new_password,old_password:this.old_password},
					success:(res)=>{
						uni.showToast({
							title: res.message,
							icon: 'none',
							duration: 1000
						});
					}
				})
			}
		}
	}
</script>

<style lang="scss">
	page{
		background-color: #18191d;
	}
	.plaClass{
		color: #dbdbdb;
	}
	.container999{
		.title{
			height: 80rpx;
			line-height: 80rpx;
			padding-left: 4%;
			// border-bottom: 1px solid #f5f5f5;
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
		.tri{
			width:0;
			height:0;
			border-left:8rpx solid transparent;
			border-right:8rpx solid transparent;
			right: 30rpx !important;
			border-top:16rpx solid #545151;
		}
		.line{
		  height: 85rpx;
		  width: 92%;
		  margin: 30upx auto;
		  // border-bottom: 1px solid #f5f5f5;
		  display: flex;
		  .lineRight{
			  .tips{
				  color: #9a9a9c;
				  font-weight: bold;
			  }
			 flex: 1;
			  height: 100%;
			  display: flex;
			  align-items: center;
			  justify-content: space-between;
			  position: relative;
		  }
			.lineLeft{
			  display: flex;
			  width: 20%;
			  align-items: center;
			  height: 100%;
			  font-weight: bold;
			  color: #000000;
			}
			.input{
				padding-right: 20rpx;
				height: 100%;
				width: 100%;
				text-align: left;
				padding-left: 20upx;
				font-size: 28rpx;
				color: #FFFFFF;
				border: 1px solid #535353;
				border-radius: 80upx;
			}
			.picker{
			 height: 100%;
			 justify-content: flex-start;
			  display: flex;
			  align-content: center;
			  width: 500rpx;
			}
			picker{
			  height: 84rpx;
			  line-height: 84rpx;
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
