
<template>
	<view class="content">
		<cu-custom bgColor="bg-gradual-blue" :isBack="true">
			<block slot="backText"></block>
			<block slot="content">关于我们</block>
		</cu-custom>
			<view class="about_10">
				<view class="about_21">
					<image v-on:click="about_us()"  src="/static/logo.png" mode="scaleToFill" border="0"    class="about_210"></image>
					<text decode="true" class="about_211">慈惠短视频</text>
					<text decode="true" class="about_212">v1.1.0</text>
				</view>
				<view class="about_22">
					<text @click="aboutdetails()" decode="true" class="about_220">关于慈惠</text>
					<image v-on:click="agreement()"  src="/static/arrow-right.png" mode="scaleToFill" border="0" class="about_221"></image>
				</view>
				<view @click="user_agreement()" class="about_22">
					<text decode="true" class="about_220">用户协议</text>
					<image v-on:click="agreement()"  src="/static/arrow-right.png" mode="scaleToFill" border="0" class="about_221"></image>
				</view>
				<view @click="privacy_agreement()" class="about_22">
					<text decode="true" class="about_220">用户隐私协议</text>
					<image v-on:click="agreement()"  src="/static/arrow-right.png" mode="scaleToFill" border="0" class="about_221"></image>
				</view>
				<view class="about_22">
					<text decode="true" class="about_220">官方公众号</text>
					<text decode="true" class="about_52">{{wxpublic}}</text>
				</view>
				
			</view>
	</view>
</template>

<script>
	var api = require('../../components/js/api.js'); 
export default {
	data(){
		return {
			wxpublic:'',
		}
	},
	onShow(){
		this.getwxpublic();
	},
	methods: {
		getwxpublic(){
			api.get({
				url:'Api/IndexApi/getwxpublic',
				success:res=>{
					console.log(res);
					this.wxpublic = res.message;
				}
			})
		},
		aboutdetails(){
			uni.navigateTo({
				url:'/pages/my/aboutdetails'
			});
		},
		privacy_agreement(){
			uni.navigateTo({
				url:'/pages/msg/privacy_agreement'
			});
		},
		user_agreement(){
			uni.navigateTo({
				url:'/pages/msg/user_agreement'
			});
		},
		
		},
	}
</script>

<style>
@import '../../components/css/about.scss';
page {
	background-color: #18191d;
}
</style>