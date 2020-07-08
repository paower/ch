<template>
	<view class="content">
		<cu-custom bgColor="bg-gradual-blue" :isBack="true">
			<block slot="backText"></block>
			<block slot="content">视频上传</block>
		</cu-custom>
		<web-view :src="url" ></web-view>
	</view>
</template>
<script>
	var api = require('../../components/js/api.js'); 
	export default {
		data() {
			return {
				url:'',
			};
		},
		onLoad(data) {
			var openid = uni.getStorageSync('userinfo').openid;
			var useraddress = JSON.stringify(uni.getStorageSync('useraddress'));
			
			this.url = 'http://192.168.0.94/Api/Upload/index?openid=' + openid + '&address=' + useraddress; 
		},
	};
</script>
<style>
	
</style>
       