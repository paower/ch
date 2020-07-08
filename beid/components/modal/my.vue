<template>
	<view class="cu-modal show" v-if="xianshi==0">
		<view class="cu-dialog">
			<view class="cu-bar bg-white justify-end">
				<view class="content">签到</view>
			</view>
			<view class="padding-xl">
				<text>今日收益：{{reciveUserInfo.shouyi}}</text>
				<input type="text" placeholder="输入祝福语" v-model="zhufu" style="border: 2upx solid #ccc;height: 80upx; border-radius: 12upx;margin-top: 10upx;">
			</view>
			<view class="cu-bar bg-white justify-end">
				<view class="action" style="width: 100%;">
					<button class="cu-btn line-green text-green" @tap="hideModal">取消</button>
					<button class="cu-btn bg-green margin-left" @tap="submit">签到</button>
	
				</view>
			</view>
		</view>
	</view>
</template>

<script>
var api = require('../../components/js/api.js'); 
export default {
	props: {
		reciveUserInfo: ''
	},
	data() {
		return {
			zhufu:'',
			xianshi:this.reciveUserInfo.is_qiandao
		};
	},
	methods:{
		hideModal(e) {
			this.xianshi=1
		},
		submit(){
			uni.showLoading({})
			api.post({
				url: 'Api/ScrollApi/todaySignin',
				data: {openid:uni.getStorageSync('userinfo').openid},
				success: res => {
					uni.showToast({
						title:res.message,icon:'none'
					})
					uni.hideLoading();
				}
			})
			
		}
	}
};
</script>

<style>
</style>
