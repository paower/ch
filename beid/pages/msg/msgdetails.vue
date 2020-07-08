<template>
		<view class="page">
			<cu-custom bgColor="bg-black" :isBack="true">
				<block slot="backText"></block>
				<block slot="content">消息列表</block>
			</cu-custom>
			<view class="cu-item shadow">
				<block v-for="(item,index) in message_list" :key="index">
					<view class="cu-list menu-avatar comment">
						<view class="cu-item" style="background-color: #000000;">
							<view class="cu-avatar round" style="background-image:url(../../static/logo.png);"></view>
							<view class="content" style="background-color: #000000;">
								<view class="text-grey" style="font-size:35rpx;color: white;">{{item.title}}</view>
								<view class="text-gray text-content text-df" v-html="item.content">
									
								</view>
								<view class="margin-top-sm flex justify-between">
									<view class="text-gray text-df text_date">{{item.create_time}}</view>
								</view>
							</view>
						</view>
					</view>
				</block>
			</view>
		</view>
</template>

<script>
	var api = require('../../components/js/api.js'); 
	export default {
		data() {
			return {
				message_list:[]
			}
		},
		onShow() {
			this.getList();
		},
		methods: {
			getList(){
				api.get({
					url:'Api/MessageApi/GetMessageList',
					success:res=>{
						this.message_list = res
					}
				})
			}
		}
	}
</script>

<style>
	
page{
	background-color: #000000;
	padding-top: 20rpx;
}
.text_date{
	text-align: right;
}
</style>
