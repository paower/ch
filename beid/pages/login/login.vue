<template>
	<view class="login">
		<cu-custom bgColor="bg-black" :isBack="true">
			<block slot="backText"></block>
			<block slot="content"></block>
		</cu-custom>
		<view class="content">
			<!-- 头部logo -->
			<view class="header">
				<image :src="logoImage"></image>
			</view>
			<!-- 切换 -->
			<view class="nav text-center margin-bottom">
				<view class="scroll-view">
					<view class="cu-item " @click="changetab(1)" :class="[tab==1 ? 'text-purple cur' : 'text-gray' ]">密码登录</view>
					<view class="cu-item " @click="changetab(2)" :class="[tab==2 ? 'text-purple cur' : 'text-gray' ]">短信登录</view>
				</view>
			</view>
			<!-- 密码登录表单 --> 
			<block v-if="tab==1">
				<view class="main">
					<wInput
						v-model="phoneData"
						type="text"
						maxlength="11"
						placeholder="用户名/手机号"
					></wInput>
					<wInput
						v-model="passData"
						type="password"
						maxlength="11"
						placeholder="密码"
					></wInput>
				</view>
			</block>
			<!-- 短信登录表单 -->
			<block v-if="tab==2">
				<view class="main">
					<wInput
						v-model="phoneData"
						type="text"
						maxlength="11"
						placeholder="手机号"
					></wInput>
					<wInput
						v-model="verCode"
						type="number"
						maxlength="4"
						placeholder="验证码"
						
						isShowCode
						ref="runCode"
						@setCode="getVerCode()"
					></wInput>
				</view>
			</block>
			<wButton 
				text="登 录"
				:rotate="isRotate" 
				@click.native="startLogin()"
				class="wbutton"
			></wButton>
			
			<!-- 底部信息 -->
			<view class="footer">
				<navigator url="forget" open-type="navigate">找回密码</navigator>
				<text>|</text>
				<navigator url="register" open-type="navigate">注册账号</navigator>
			</view>
		</view>
	</view>
</template>

<script>
	var _this;
	import wInput from '../../components/watch-login/watch-input.vue' //input
	import wButton from '../../components/watch-login/watch-button.vue' //button
	var api = require('../../components/js/api.js'); 
	export default {
		data() {
			return {
				//logo图片 
				logoImage: '../../static/logo.png',
				phoneData:'', //用户/电话
				passData:'', //密码
				isRotate: false, //是否加载旋转
				verCode:'',
				tab:'1',
			};
		},
		components:{
			wInput,
			wButton,
		},
		mounted() {
			_this= this;
			//this.isLogin();
		},
		methods: {
			isLogin(){
				//判断缓存中是否登录过，直接登录
				// try {
				// 	const value = uni.getStorageSync('setUserData');
				// 	if (value) {
				// 		//有登录信息
				// 		console.log("已登录用户：",value);
				// 		_this.$store.dispatch("setUserData",value); //存入状态
				// 		uni.reLaunch({
				// 			url: '../../../pages/index',
				// 		});
				// 	}
				// } catch (e) {
				// 	// error
				// }
			},
		  startLogin(){
				//登录
				if(this.isRotate){
					//判断是否加载中，避免重复点击请求
					return false;
				}
				
				if(this.tab == 1){
					if (this.phoneData.length == "") {
							 uni.showToast({
									icon: 'none',
									position: 'bottom',
									title: '用户名不能为空'
							});
							return;
					}
					if (this.passData.length < 5) {
							uni.showToast({
									icon: 'none',
									position: 'bottom',
									title: '密码不正确'
							});
							return;
					}

					api.post({
						url: '/Login/checkLogin',
						data: {account:this.phoneData,password: this.passData},
						success: res => {
							if(res.status==1){
								uni.setStorageSync('userinfo', res.result);
								uni.switchTab({
									url:'../my/my'
								})
							}else{
								uni.showToast({
										icon: 'none',
									position: 'bottom',
										title: res.message
								});
							}
						}
					})
				}
				
				if(this.tab == 2){
					if (this.phoneData.length == "") {
							 uni.showToast({
									icon: 'none',
									position: 'bottom',
									title: '手机号不能为空'
							});
							return;
					}
					if (this.verCode.length < 4) {
							uni.showToast({
									icon: 'none',
									position: 'bottom',
									title: '验证码不正确'
							});
							return;
					}
					
					api.post({
						url: '/Login/smsLogin',
						data: {account:this.phoneData,verCode: this.verCode},
						success: res => {
							console.log(res);
							if(res.status==1){
								uni.setStorageSync('userinfo', res.result);
								uni.switchTab({
									url:'../my/my'
								})
							}else{
								uni.showToast({
										icon: 'none',
										position: 'bottom',
										title: res.message
								});
							}
						}
					})
				}
				
				_this.isRotate=true
				setTimeout(function(){
					_this.isRotate=false
				},3000)
			},
			changetab(num){
				this.tab = num;
			},
			getVerCode(){
				api.get({
					url: 'Api/LoginApi/getSms',
					data: {mobile:this.phoneData},
					success: res => {
						if(res.code==200){
							this.$refs.runCode.$emit('runCode'); //触发倒计时（一般用于请求成功验证码后调用）
							setTimeout(function(){
								_this.$refs.runCode.$emit('runCode',0); //假装模拟下需要 终止倒计时
								// uni.showToast({
								// 	icon: 'none',
								// 	position: 'bottom',
								// 	title: '模拟倒计时终止'
								// });
							},60000)
						}
						uni.showToast({
							icon: 'none',
							position: 'bottom',
							title: res.msg
						});
					}
				})
			}
		}
	}
</script>

<style>
	@import url("../../components/watch-login/css/icon.css");
	@import url("../../components/css/login.css");
	page{
		background-color: #18191d;
	}
</style>
