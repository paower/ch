<template>
	<view>
		<cu-custom bgColor="bg-gradual-blue" :isBack="true">
			<block slot="backText"></block>
			<block slot="content">关于慈惠</block>
		</cu-custom>
		
		<!--标题-->
		
		<view class="content-view-box">
			<view class="font-view" v-html="content">
				
			</view>
		</view>
	</view>
</template>

<script>
	var api = require('../../components/js/api.js'); 
	export default {
		
		data() {
			return {
				content:''
			}
		},
		onLoad() {
			api.get({
				url: 'Api/AboutMeApi/GetAboutInfo',
				data:{name:'about_bd'},
				success: res => {
					this.content = res;
				}
			})
		},
		
		methods: {
			
		}
	}
</script>


<style lang="scss">
	page {
		background: #18191d;
	}
	.zaiui-title {
		margin: 36.36rpx 27.27rpx;
		color: #FFFFFF;
		font-size: 40upx;
	}
	.zaiui-right-text {
		text {
			position: relative;	
		}
		text + text {
			margin-left: 18.18rpx;
			&:after {
				content: ' ';
				position: absolute;
				width: 2rpx;
				height: 18.18rpx;
				border-left: 2rpx solid;
				top: 3.63rpx;
				left: -9.09rpx;
			}
		}
	}
	.content-view-box {
		position: relative;
		.font-view {
			padding: 27.27rpx;
			line-height: 1.7;
			color: #aaaaaa;
			font-size: 30upx;
		}
		image {
			width: 100%;
		}
	}
</style>
