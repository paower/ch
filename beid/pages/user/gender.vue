<template>
	<view class="center">
		<cu-custom bgColor="bg-gradual-blue" :isBack="true">
			<block slot="backText"></block>
			<block slot="content">设置性别</block>
		</cu-custom>
		<view class="genderchoose">
			<view class="gender01">
				<text class="cuIcon-people male" :class="sex==1 ? 'checked':''" @click="choose(1)"></text><br />
				<text class="gendertext">男</text>
			</view>
			<view class="gender01">
				<text class="cuIcon-people female" :class="sex==0 ? 'checked':''" @click="choose(0)"></text><br />
				<text class="gendertext">女</text>
			</view>
			<view class="gender01">
				<text class="cuIcon-question secrecy" :class="sex==2 ? 'checked':''" @click="choose(2)"></text><br />
				<text class="gendertext">保密</text>
			</view>
		</view>
		<view class="buttonBox" @click="submit">
			提交
		</view>
	</view>
</template>

<script>
	var api = require('../../components/js/api.js'); 
	export default {
		data() {
			return {
				sex:''
			}
		},
		onShow() {
			this.sex = uni.getStorageSync('userinfo').sex;
		},
		methods: {
			choose:function(sex){
				this.sex = sex;
			},
			submit:function(){
				var userinfo = uni.getStorageSync('userinfo');
				api.post({
					url: 'Api/UserApi/setUserInfo',
					data: {openid:userinfo.openid,type: 'sex',data:this.sex},
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

<style>
page{
	background-color: #18191d;
}
.genderchoose{
	width: 100%;
	height: 300upx;
}
.gender01{
	width: 33%;
	height: 200upx;
	float: left;
	color: #FFFFFF;
	font-size:35upx;
	text-align: center;
}
.male,.female,.secrecy{
	width: 150upx;
	height: 150upx;
	font-size: 120upx;
}
.male:hover,.female:hover,.secrecy:hover{
	border-radius: 50%;
	width: 150upx;
	height: 150upx;
	background: #f8f8f8;
}
.checked{
	border-radius: 50%;
	width: 150upx;
	height: 150upx;
	background: #f8f8f8;
}
.male{
	color: #1418FF;
}
.female{
	color: #ff00ff;
}
.secrecy{
	color: #a9a2b4;
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
</style>
