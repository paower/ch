<template>
	<view class="register">
	<cu-custom bgColor="bg-black" :isBack="true">
		<block slot="backText"></block>
		<block slot="content">注册</block>
	</cu-custom>
		<view class="content">
			<!-- 头部logo -->
			<view class="header">
				<image :src="logoImage"></image>
			</view>
			<!-- 主体 -->
			<view class="main">
				<wInput
					v-model="phoneData"
					type="text"
					maxlength="11"
					placeholder="手机号"
				></wInput>
				<wInput
					v-model="passData"
					type="password"
					maxlength="11"
					placeholder="登录密码"
					isShowPass
				></wInput>
				<wInput
					v-model="pidcode"
					type="number"
					maxlength="7"
					placeholder="输入邀请码"
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
				
			<wButton 
				text="注 册"
				:rotate="isRotate" 
				@click.native="startReg()"
			></wButton>
			
			<!-- 底部信息 -->
			<view class="footer">
				<text 
					@tap="isShowAgree" 
					class="cuIcon"
					:class="showAgree?'cuIcon-radiobox':'cuIcon-round'"
				>同意</text>
				<!-- 协议地址 -->
				    <navigator url="../msg/user_agreement" open-type="navigate">《用户协议》</navigator>
				    <navigator url="../msg/privacy_agreement" open-type="navigate">和《用户隐私协议》</navigator>
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
				phoneData:'', // 用户/电话
				passData:'', //密码
				verCode:"", //验证码
				showAgree:true, //协议是否选择
				isRotate: false, //是否加载旋转,
				pidcode:''
			}
		},
		components:{
			wInput,
			wButton,
		},
		mounted() {
			_this= this;
		},
		methods: {
			isShowAgree(){
				//是否选择协议
				_this.showAgree = !_this.showAgree;
			},
			getVerCode(){
				//获取验证码
				if (_this.phoneData.length != 11) {
				     uni.showToast({
				        icon: 'none',
						position: 'bottom',
				        title: '手机号不正确'
				    });
				    return false;
				}
				api.get({
					url:'Api/LoginApi/getSms',
					data:{mobile:_this.phoneData},
					success:res=>{
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
				
			},
		    startReg() {
				//注册
				if(this.isRotate){
					//判断是否加载中，避免重复点击请求
					return false;
				}
				if (this.showAgree == false) {
				    uni.showToast({
				        icon: 'none',
						position: 'bottom',
				        title: '请先同意《协议》'
				    });
				    return false;
				}
				if (this.phoneData.length !=11) {
				    uni.showToast({
				        icon: 'none',
						position: 'bottom',
				        title: '手机号不正确'
				    });
				    return false;
				}
		        if (this.passData.length < 6) {
		            uni.showToast({
		                icon: 'none',
						position: 'bottom',
		                title: '密码不正确'
		            });
		            return false;
		        }
				// if (this.verCode.length != 4) {
				//     uni.showToast({
				//         icon: 'none',
				// 		position: 'bottom',
				//         title: '验证码不正确'
				//     });
				//     return false;
				// }

				api.post({
					url:'Api/LoginApi/register',
					// data:{mobile:this.phoneData,login_pwd:this.passData,code:this.verCode,pidcode:this.pidcode},
					data:{mobile:this.phoneData,login_pwd:this.passData,pidcode:this.pidcode},
					success:res=>{
						if(res.status==1){
							uni.showToast({
							    icon: 'none',
									position: 'bottom',
							    title: '注册成功'
							});
							setTimeout(function(){
								uni.redirectTo({
									url:'login'
								})
							},3000)
						}else{
							uni.showToast({
								title:res.message,icon:'none'
							})
						}
					}
				})
				_this.isRotate=true
				setTimeout(function(){
					_this.isRotate=false
				},3000)
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