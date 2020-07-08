<template>
	<view class="content">
		<cu-custom bgColor="bg-gradual-blue" :isBack="true">
			<block slot="backText"></block>
			<block slot="content">录制上传</block>
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
		onLoad(options) {
			var video_src = options.video_url;
			var openid = uni.getStorageSync('userinfo').openid;
			
			this.url = 'http://192.168.0.94/Api/Upload/record?openid=' + openid + '&video_src=' + video_src;  
		},
	};
</script>

<style>
</style>
