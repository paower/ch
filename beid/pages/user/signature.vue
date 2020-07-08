<template>
	<view class="content">
		<cu-custom bgColor="bg-gradual-blue" :isBack="true">
			<block slot="backText"></block>
			<block slot="content">修改个性签名</block>
		</cu-custom>
		<view class="input_box">
			<textarea placeholder="设置你的个性签名内容" class="textarea border" v-model="gxqm"></textarea>
			<view class="title">输入4~100个文字</view>
			<button class="submit" @click="submit">提交</button>
		</view>
		
	</view>
</template>

<script>
	var api = require('../../components/js/api.js'); 
	export default {
		data() {
			return {
				gxqm:''
				
			}
		},
		onShow() {
			this.gxqm = uni.getStorageSync('userinfo').gxqm;
		},
		methods: {
			submit:function(){
				var userinfo = uni.getStorageSync('userinfo');
				api.post({
					url: 'Api/UserApi/setUserInfo',
					data: {openid:userinfo.openid,type: 'gxqm',data:this.gxqm},
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
			
		}
	}
</script>

<style lang="scss">
	page{
		background-color: #18191d;
	}
.border{
	border-style: solid;
	border-width: 1px;
	border-color: #535353;
	border-radius: 16upx;
	font-size: 30upx;
}
.title{
		height: 80rpx;
		line-height: 80rpx;
		padding-left: 4%;
		}
.input{
	padding: 6rpx 8rpx;
	height: 42px;
}
.submit{
	width: 91%;
	margin: 30upx auto;
	height: 84upx;
	ling-height: 84upx;
	border-radius: 84rpx;
	color: white;
	font-size: 30upx;
	align-items: center;
	justify-content: center;
	background-color: #4a8be9;
}

.input_box{
	width: 750rpx;
	margin-bottom: 6px;
}
.textarea{
	width: 730rpx;
	padding: 10rpx;
	margin: 10rpx;
	color: #FFFFFF;
}

.content{
	font-size: 30upx;
	color: #666666;
}
</style>
